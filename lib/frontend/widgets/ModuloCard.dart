import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/classes/showPage.dart';
import 'package:test_flutter_websockets/frontend/screens/Devices/devices_menu_page/devices_menu_page.dart';
import 'package:test_flutter_websockets/frontend/widgets/FocusedMenu/focused_menu.dart';
import 'package:test_flutter_websockets/frontend/widgets/FocusedMenu/modals.dart';



class ModuloCard extends StatefulWidget {

  final IconData icon;
  final String title, subtitle;
  final bool antena;
  final Color background;
  final EdgeInsetsGeometry internalPadding;
  final double radius;

  ModuloCard({
    this.icon,
    this.subtitle='',
    this.title ='',
    this.antena=false,
    this.background = Colors.white,
    this.internalPadding = EdgeInsets.zero,
    this.radius = 15,
  });

  @override
  _ModuloCardState createState() => _ModuloCardState();
}

class _ModuloCardState extends State<ModuloCard> {
  @override
  Widget build(BuildContext context) {

    return FocusedMenuHolder(
      menuWidth: 200,
      // blurSize: 1,
      // blurBackgroundColor: Colors.white.withOpacity(0.1),
      blurSize: 6,
      child: Card(
        color: widget.background,
        elevation: 2,
        margin: EdgeInsets.fromLTRB(8, 8, 15, 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius)),
        child: Padding(
          padding: widget.internalPadding,
          child: Container( 
            child: ListTile(
              dense: false,
              // contentPadding: EdgeInsets.zero,
              title: Text(widget.title, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500,)),
              subtitle: Text(widget.subtitle, style: TextStyle(color: Colors.grey),),
              leading: Container(
                width: 50,
                height: 60,
                child: Icon(widget.icon, size: 50,)   //Placeholder(color: Colors.grey,)
              ),
              trailing: Icon(widget.antena? Icons.settings_input_antenna : Icons.wifi, color: Colors.lightBlueAccent,),
              onTap: (){
                showPage(context, DeviceMenuPage());
              },
            ),
          ),
        ),
      ), 
      menuItems: <FocusedMenuItem>[
        /* FocusedMenuItem(
          title: Text('Info', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),), 
          trailingIcon: Icon(Icons.info_outline, color: Colors.black54,), 
          onPressed: (){}
        ), */
        FocusedMenuItem(
          title: Text('Agregar módulo', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),), 
          trailingIcon: Icon(Icons.add, color: Colors.black54,), 
          onPressed: (){}
        ),
        FocusedMenuItem(
          title: Text('Acciones rápidas', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),), 
          trailingIcon: Icon(Icons.view_module,
            color: Colors.black54,), 
          onPressed: (){}
        ),
        FocusedMenuItem(
          title: Text('Editar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),), 
          trailingIcon: Icon(Icons.edit, color: Colors.black54,), 
          onPressed: (){}
        ),
        FocusedMenuItem(
          title: Text('Configurar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),), 
          trailingIcon: Icon(Icons.settings, color: Colors.black54,), 
          onPressed: (){}
        ),
        FocusedMenuItem(
          title: Text('Eliminar', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),), 
          trailingIcon: Icon(Icons.delete, color: Colors.red,), 
          // backgroundColor: Colors.redAccent.withOpacity(0.6),
          onPressed: (){},
        ),
      ]
    );
  }
}