// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatSwitch/audat_thumb_painter.dart';

class AudatSwitch extends StatefulWidget {
  /// Creates an iOS-style switch.
  ///
  /// The [value] parameter must not be null.
  /// The [dragStartBehavior] parameter defaults to [DragStartBehavior.start] and must not be null.
  const AudatSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
    this.trackColor,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : assert(value != null),
       assert(dragStartBehavior != null),
       super(key: key);

  /// Whether this switch is on or off.
  ///
  /// Must not be null.
  final bool value;

  final ValueChanged<bool> onChanged;

  /// The color to use when this switch is on.
  ///
  /// Defaults to [CupertinoColors.systemGreen] when null and ignores
  /// the [CupertinoTheme] in accordance to native iOS behavior.
  final Color activeColor;

  /// The color to use for the background when the switch is off.
  ///
  /// Defaults to [CupertinoColors.secondarySystemFill] when null.
  final Color trackColor;

  final DragStartBehavior dragStartBehavior;

  @override
  _CupertinoSwitchState createState() => _CupertinoSwitchState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('value', value: value, ifTrue: 'on', ifFalse: 'off', showName: true));
    properties.add(ObjectFlagProperty<ValueChanged<bool>>('onChanged', onChanged, ifNull: 'disabled'));
  }
}

class _CupertinoSwitchState extends State<AudatSwitch> with TickerProviderStateMixin {
  TapGestureRecognizer _tap;
  HorizontalDragGestureRecognizer _drag;

  AnimationController _positionController;
  CurvedAnimation position;

  AnimationController _reactionController;
  Animation<double> _reaction;

  bool get isInteractive => widget.onChanged != null;

  // A non-null boolean value that changes to true at the end of a drag if the
  // switch must be animated to the position indicated by the widget's value.
  bool needsPositionAnimation = false;

  @override
  void initState() {
    super.initState();

    _tap = TapGestureRecognizer()
      ..onTapDown = _handleTapDown
      ..onTapUp = _handleTapUp
      ..onTap = _handleTap
      ..onTapCancel = _handleTapCancel;
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..dragStartBehavior = widget.dragStartBehavior;

    _positionController = AnimationController(
      duration: _kToggleDuration,
      value: widget.value ? 1.0 : 0.0,
      vsync: this,
    );
    position = CurvedAnimation(
      parent: _positionController,
      curve: Curves.linear,
    );
    _reactionController = AnimationController(
      duration: _kReactionDuration,
      vsync: this,
    );
    _reaction = CurvedAnimation(
      parent: _reactionController,
      curve: Curves.ease,
    );
  }

  @override
  void didUpdateWidget(AudatSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _drag.dragStartBehavior = widget.dragStartBehavior;

    if (needsPositionAnimation || oldWidget.value != widget.value)
      _resumePositionAnimation(isLinear: needsPositionAnimation);
  }

  // `isLinear` must be true if the position animation is trying to move the
  // thumb to the closest end after the most recent drag animation, so the curve
  // does not change when the controller's value is not 0 or 1.
  //
  // It can be set to false when it's an implicit animation triggered by
  // widget.value changes.
  void _resumePositionAnimation({ bool isLinear = true }) {
    needsPositionAnimation = false;
    position
      ..curve = isLinear ? null : Curves.ease
      ..reverseCurve = isLinear ? null : Curves.ease.flipped;
    if (widget.value)
      _positionController.forward();
    else
      _positionController.reverse();
  }

  void _handleTapDown(TapDownDetails details) {
    if (isInteractive)
      needsPositionAnimation = false;
      _reactionController.forward();
  }

  void _handleTap() {
    if (isInteractive) {
      widget.onChanged(!widget.value);
      SystemSound.play(SystemSoundType.click);
      _emitVibration();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
      _reactionController.reverse();
    }
  }

  void _handleTapCancel() {
    if (isInteractive)
      _reactionController.reverse();
  }

  void _handleDragStart(DragStartDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
      _reactionController.forward();
      _emitVibration();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (isInteractive) {
      position
        ..curve = null
        ..reverseCurve = null;
      final double delta = details.primaryDelta / _kTrackInnerLength;
      switch (Directionality.of(context)) {
        case TextDirection.rtl:
          _positionController.value -= delta;
          break;
        case TextDirection.ltr:
          _positionController.value += delta;
          break;
      }
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    // Deferring the animation to the next build phase.
    setState(() { needsPositionAnimation = true; });
    // Call onChanged when the user's intent to change value is clear.
    if (position.value >= 0.5 != widget.value)
      widget.onChanged(!widget.value);
      SystemSound.play(SystemSoundType.click);
    _reactionController.reverse();
  }

  void _emitVibration() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        HapticFeedback.lightImpact();
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (needsPositionAnimation)
      _resumePositionAnimation();
    return Opacity(
      opacity: widget.onChanged == null ? _kCupertinoSwitchDisabledOpacity : 1.0,
      child: _CupertinoSwitchRenderObjectWidget(
        value: widget.value,
        activeColor: CupertinoDynamicColor.resolve(
          widget.activeColor ?? CupertinoColors.systemGreen,
          context,
        ),
        trackColor: CupertinoDynamicColor.resolve(widget.trackColor ?? CupertinoColors.secondarySystemFill, context),
        onChanged: widget.onChanged,
        textDirection: Directionality.of(context),
        state: this,
      ),
    );
  }

  @override
  void dispose() {
    _tap.dispose();
    _drag.dispose();

    _positionController.dispose();
    _reactionController.dispose();
    super.dispose();
  }
}

class _CupertinoSwitchRenderObjectWidget extends LeafRenderObjectWidget {
  const _CupertinoSwitchRenderObjectWidget({
    Key key,
    this.value,
    this.activeColor,
    this.trackColor,
    this.onChanged,
    this.textDirection,
    this.state,
  }) : super(key: key);

  final bool value;
  final Color activeColor;
  final Color trackColor;
  final ValueChanged<bool> onChanged;
  final _CupertinoSwitchState state;
  final TextDirection textDirection;

  @override
  _RenderCupertinoSwitch createRenderObject(BuildContext context) {
    return _RenderCupertinoSwitch(
      value: value,
      activeColor: activeColor,
      trackColor: trackColor,
      onChanged: onChanged,
      textDirection: textDirection,
      state: state,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderCupertinoSwitch renderObject) {
    renderObject
      ..value = value
      ..activeColor = activeColor
      ..trackColor = trackColor
      ..onChanged = onChanged
      ..textDirection = textDirection;
  }
}

const double _kTrackWidth = 100.0;
const double _kTrackHeight = 50.0;
const double _kTrackRadius = _kTrackHeight / 2.0;
const double _kTrackInnerStart = _kTrackHeight / 2.0;
const double _kTrackInnerEnd = _kTrackWidth - _kTrackInnerStart;
const double _kTrackInnerLength = _kTrackInnerEnd - _kTrackInnerStart;
const double _kSwitchWidth = 59.0;
const double _kSwitchHeight = 39.0;
// Opacity of a disabled switch, as eye-balled from iOS Simulator on Mac.
const double _kCupertinoSwitchDisabledOpacity = 0.5;

const Duration _kReactionDuration = Duration(milliseconds: 300);
const Duration _kToggleDuration = Duration(milliseconds: 200);

class _RenderCupertinoSwitch extends RenderConstrainedBox {
  _RenderCupertinoSwitch({
    @required bool value,
    @required Color activeColor,
    @required Color trackColor,
    ValueChanged<bool> onChanged,
    @required TextDirection textDirection,
    @required _CupertinoSwitchState state,
  }) : assert(value != null),
       assert(activeColor != null),
       assert(state != null),
       _value = value,
       _activeColor = activeColor,
       _trackColor = trackColor,
       _onChanged = onChanged,
       _textDirection = textDirection,
       _state = state,
       super(additionalConstraints: const BoxConstraints.tightFor(width: _kSwitchWidth, height: _kSwitchHeight)) {
         state.position.addListener(markNeedsPaint);
         state._reaction.addListener(markNeedsPaint);
  }

  final _CupertinoSwitchState _state;

  bool get value => _value;
  bool _value;
  set value(bool value) {
    assert(value != null);
    if (value == _value)
      return;
    _value = value;
    markNeedsSemanticsUpdate();
  }

  Color get activeColor => _activeColor;
  Color _activeColor;
  set activeColor(Color value) {
    assert(value != null);
    if (value == _activeColor)
      return;
    _activeColor = value;
    markNeedsPaint();
  }

  Color get trackColor => _trackColor;
  Color _trackColor;
  set trackColor(Color value) {
    assert(value != null);
    if (value == _trackColor)
      return;
    _trackColor = value;
    markNeedsPaint();
  }

  ValueChanged<bool> get onChanged => _onChanged;
  ValueChanged<bool> _onChanged;
  set onChanged(ValueChanged<bool> value) {
    if (value == _onChanged)
      return;
    final bool wasInteractive = isInteractive;
    _onChanged = value;
    if (wasInteractive != isInteractive) {
      markNeedsPaint();
      markNeedsSemanticsUpdate();
    }
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    assert(value != null);
    if (_textDirection == value)
      return;
    _textDirection = value;
    markNeedsPaint();
  }

  bool get isInteractive => onChanged != null;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent && isInteractive) {
      _state._drag.addPointer(event);
      _state._tap.addPointer(event);
    }
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    if (isInteractive)
      config.onTap = _state._handleTap;

    config.isEnabled = isInteractive;
    config.isToggled = _value;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    final double currentValue = _state.position.value;
    final double currentReactionValue = _state._reaction.value;

    double visualPosition;
    switch (textDirection) {
      case TextDirection.rtl:
        visualPosition = 1.0 - currentValue;
        break;
      case TextDirection.ltr:
        visualPosition = currentValue;
        break;
    }

    final Paint paint = Paint()
      ..color = Color.lerp(trackColor, activeColor, currentValue);

    final Rect trackRect = Rect.fromLTWH(
        offset.dx + (size.width - _kTrackWidth) / 2.0,
        offset.dy + (size.height - _kTrackHeight) / 2.0,
        _kTrackWidth,
        _kTrackHeight,
    );
    final RRect trackRRect = RRect.fromRectAndRadius(trackRect, const Radius.circular(_kTrackRadius));
    canvas.drawRRect(trackRRect, paint);

    final double currentThumbExtension = AudatThumbPainter.extension * currentReactionValue;
    final double thumbLeft = lerpDouble(
      trackRect.left + _kTrackInnerStart - AudatThumbPainter.radius,
      trackRect.left + _kTrackInnerEnd - AudatThumbPainter.radius - currentThumbExtension,
      visualPosition,
    );
    final double thumbRight = lerpDouble(
      trackRect.left + _kTrackInnerStart + AudatThumbPainter.radius + currentThumbExtension,
      trackRect.left + _kTrackInnerEnd + AudatThumbPainter.radius,
      visualPosition,
    );
    final double thumbCenterY = offset.dy + size.height / 2.0;
    final Rect thumbBounds = Rect.fromLTRB(
      thumbLeft,
      thumbCenterY - AudatThumbPainter.radius,
      thumbRight,
      thumbCenterY + AudatThumbPainter.radius,
    );

    context.pushClipRRect(needsCompositing, Offset.zero, thumbBounds, trackRRect, (PaintingContext innerContext, Offset offset) {
      const AudatThumbPainter.switchThumb().paint(innerContext.canvas, thumbBounds);
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(FlagProperty('value', value: value, ifTrue: 'checked', ifFalse: 'unchecked', showName: true));
    description.add(FlagProperty('isInteractive', value: isInteractive, ifTrue: 'enabled', ifFalse: 'disabled', showName: true, defaultValue: true));
  }
}



