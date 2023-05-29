import 'package:flutter/material.dart';
class GynaikaAppbar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Gynaika',
        style: TextStyle(
          fontFamily: 'Alkatra',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic ,
          letterSpacing: 1.0,
          color: Colors.purple[800],
          fontSize: 30.0,
        ),
      ),
      actions: [
        IconButton(
          icon:Icon(
              Icons.mail_outline
          ),
          onPressed: () {},
        ),
        IconButton(
          icon:Icon(
              Icons.call
          ),
          onPressed: () {},
        ),
        IconButton(
          icon:Icon(
              Icons.more_vert
          ),
          onPressed: () {},
        )
      ],
      iconTheme: IconThemeData(
          color: Colors.purple[800]
      ),
      backgroundColor: Colors.pink[100],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

