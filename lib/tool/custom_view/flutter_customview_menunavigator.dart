import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomViewMenuNavigator extends StatelessWidget {

  List menuList;
  CustomViewMenuNavigator({Key key, this.menuList}) : super(key: key);


  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: (){
        print('点击了导航');
      },
      child: Column(

        children: <Widget>[
          Image.asset(item['imageUrl'],width:ScreenUtil().setWidth(46.67)),
          Text(
            item['title'],
            style: TextStyle(
                fontSize:ScreenUtil().setSp(12)
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(170),
      padding:EdgeInsets.all(3.0),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        padding: EdgeInsets.all(4.0),
        children:menuList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
