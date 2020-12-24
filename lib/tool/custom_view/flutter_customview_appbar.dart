import 'package:flutter/material.dart';
import 'dart:ui';

class CustomViewAppBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  State<StatefulWidget> createState() => new AppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(45.0);
  }
}

class AppBarState extends State<CustomViewAppBar> {
  AppBarState();

  var top=MediaQueryData.fromWindow(window).padding.top;//获得系统的状态栏高度

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0, top, 0, 0),
      padding: EdgeInsets.fromLTRB(15,0, 15, 0),
      color: Colors.white,
      child:  Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '位置',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/first_tltle_loge.png', width: 98, height: 18,),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'images/ic_first_news.png', width: 26, height: 26,),
          ),

        ],
      ),

    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
