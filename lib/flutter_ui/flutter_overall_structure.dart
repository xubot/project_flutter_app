import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'flutter_home_page.dart';
import 'flutter_buycar_page.dart';
import 'flutter_sellcar_page.dart';
import 'flutter_logistics_page.dart';
import 'flutter_me_page.dart';

class OverallStructure extends StatefulWidget {
  @override
  _OverallStructureState createState() => _OverallStructureState();
}

class _OverallStructureState extends State<OverallStructure> {
  //创建出底部导航栏集合对象
  final List<BottomNavigationBarItem> barLsit=[
    BottomNavigationBarItem(
      icon: Image.asset('images/homepage.png',width: 25,height: 25,),
      activeIcon: Image.asset('images/clickhomepage.png',width: 25,height: 25,),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/buycar.png',width: 25,height: 25,),
      activeIcon: Image.asset('images/clickbuycar.png',width: 25,height: 25,),
      title: Text("买车"),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/home_jiahao.png',width: 40,height: 40,),
      title: new Container(),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/logistics.png',width: 25,height: 25,),
      activeIcon: Image.asset('images/clicklogistics.png',width: 25,height: 25,),
      title: Text("动态"),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/me.png',width: 25,height: 25,),
      activeIcon: Image.asset('images/clickme.png',width: 25,height: 25,),
      title: Text("我的"),
    ),
  ];

  final pages = [HomePage(), BuyCarPage(), SellCarPage(),LogisticsPage(),MePage()];

  int currentIndex=0;
  var currentPage;

  @override
  void initState() {
    currentPage=pages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: barLsit,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _changePage(index);
        },
        unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black),
        selectedLabelStyle:TextStyle(fontSize: 14, color: Colors.blueAccent),
      ),
      body: currentPage,
    );

  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
        currentPage=pages[currentIndex];
      });
    }
  }
}
