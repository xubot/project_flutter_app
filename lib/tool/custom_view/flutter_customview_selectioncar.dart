import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomViewSelectionCar extends StatefulWidget {
  int toBeSoldCarNum; //在售车数量
  int soldCarNum; //已售车数量
  CustomViewSelectionCar(this.toBeSoldCarNum,this.soldCarNum);


  @override
  _CustomViewSelectionCarState createState() => _CustomViewSelectionCarState(toBeSoldCarNum,soldCarNum);
}

class _CustomViewSelectionCarState extends State<CustomViewSelectionCar>  with SingleTickerProviderStateMixin{

  int toBeSoldCarNum; //在售车数量
  int soldCarNum; //已售车数量

  int duration = 2000;
  AnimationController controller;
  Animation animation;

  _CustomViewSelectionCarState(int this.toBeSoldCarNum, int this.soldCarNum);

  @override
  void initState() {
    super.initState();
    //设置动画控制器 设计动画执行时长

    controller = AnimationController(
        duration: Duration(milliseconds: duration), vsync: this);
    //设置执行速率
    final Animation curve = CurvedAnimation(
        parent: controller, curve: Curves.linear);
    animation = IntTween(begin: 0, end: toBeSoldCarNum).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
//         controller.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                AnimatedBuilder(animation: controller, builder: (context, child) {
                  return Text.rich(TextSpan(text: animation.value.toString(),
                    style: TextStyle(color: Colors.amber,
                        fontSize: ScreenUtil().setSp(28.9)),
                  ));
                }),

                Text(
                  "辆二手货车在线售卖",
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                )
              ],
            ),
          ),

          RaisedButton(onPressed: () {},
            elevation: 0,
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(0, 13.33, 0, 4.67),

            child: Container(
              height: ScreenUtil().setHeight(48.33),
              decoration: BoxDecoration( //设置渐变以及圆角
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 42, 144, 249),
                    Color.fromARGB(255, 16, 85, 207),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                  child: Text('开始选车', style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(18)))
              ),
            ),
          ),

          Container(
            child: Row(
              children: [
                Text(
                  '已有',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),

                Text(
                  soldCarNum.toString(),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),

                Text(
                  "辆二手货车在线售卖",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
