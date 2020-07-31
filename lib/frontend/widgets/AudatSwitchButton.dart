import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/classes/AudatButtonData.dart';

class AudatSwitchButton extends StatelessWidget {
  AudatSwitchButton({Key key, 
    @required this.value,
    @required this.onChanged,
    this.onPressed, 
    this.onLongPress, 
    this.activeChild, 
    this.inactiveChild, 
    this.activeBtnData,
    this.inactiveBtnData,
  }) : super(key: key);

  final VoidCallback onPressed, onLongPress;
  final ValueChanged<bool> onChanged;
  final Widget inactiveChild, activeChild;
  final AudatButtonData activeBtnData, inactiveBtnData;
  final bool value;

  @override
  Widget build(BuildContext context) {

    AudatButtonData audatButtonData = (value? activeBtnData : inactiveBtnData) ?? AudatButtonData();

    return Padding(
      padding: audatButtonData == null ? EdgeInsets.all(0) : audatButtonData.paddingExt, // : 
      child: RawMaterialButton(
        splashColor: audatButtonData.splash,
        onPressed: (){
          onPressed != null ? onPressed() : {};
          onChanged(!value);
        },
        onLongPress: onLongPress,
        child: Padding(
          padding: audatButtonData == null ? EdgeInsets.all(0) : audatButtonData.paddingInt, // : 
          child: value ? activeChild : inactiveChild,
        ),
        constraints: BoxConstraints(minHeight: 0, minWidth: 0),
        textStyle: TextStyle(
          color: audatButtonData == null ? Colors.grey : audatButtonData.textColor,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w800,
          fontSize: audatButtonData == null ? 22 : audatButtonData.textSize
        ),
        fillColor: audatButtonData == null ? Colors.white : audatButtonData.background, // audatButtonData.radius ??
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(audatButtonData == null ? 8 : audatButtonData.radius), 
          side: BorderSide(color: Colors.grey, style: audatButtonData.outlined? BorderStyle.solid : BorderStyle.none)
        ),
      ),
    );
  }
}