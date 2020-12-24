import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter_app/flutter_bean/flutter_banner_entity.dart';
import 'package:project_flutter_app/flutter_http/flutter_result_data.dart';
import 'package:project_flutter_app/flutter_http/http_method.dart';
import 'package:project_flutter_app/tool/custom_view/flutter_customview_appbar.dart';
import 'package:project_flutter_app/tool/custom_view/flutter_customview_banner.dart';
import 'package:project_flutter_app/tool/custom_view/flutter_customview_menunavigator.dart';
import 'package:project_flutter_app/tool/custom_view/flutter_customview_selectioncar.dart';
import 'package:project_flutter_app/flutter_bean/flutter_recomlist_bean_entity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int toBeSoldCarNum = 0; //在售车数量
  int soldCarNum = 0; //已售车数量

  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();
  GlobalKey<EasyRefreshState> _key = new GlobalKey<EasyRefreshState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomViewAppBar(), //自定义appBar
        body: FutureBuilder(
          future: requestMethod(),
          builder: (context, snapshot) {
            // ignore: missing_return
            print("返回请求banner数据的snapshot：=======》${snapshot.hasData}");
            if (snapshot.hasData) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text('Awaiting result...');
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');

                  print("返回请求banner数据：=======》${snapshot.data}");
                  ResultData bannerResult = snapshot.data[0];
                  ResultData recordResult = snapshot.data[1];
                  ResultData recommendResult = snapshot.data[2];
                  var bannerData = bannerResult.resultData;
                  var resultData = recordResult.resultData;
                  var recommendData = recommendResult.resultData;
                  print('得到数据====>' + recommendData['data'].toString());
                  var usedCarIds = recommendData['data']['usedCarIds'];
                  var resultList = recommendData['data']['resultList'];
                  print('usedCarIds====>' + usedCarIds.toString());
                  print('resultList====>' + resultList.toString());
                  List bannerList = bannerData['data'];
                  toBeSoldCarNum = resultData['data']['add'];
                  soldCarNum = resultData['data']['sale'];
                  print("得到图片集合数据：=======》${bannerList.toString()}");

                  //菜单导航的静态数据
                  List menuListData = [
                    {
                      "title": '一键卖车',
                      "imageUrl": 'images/maiche.png',
                    },
                    {
                      "title": '车辆求购',
                      "imageUrl": 'images/qiugou.png',
                    },
                    {
                      "title": '对讲机',
                      "imageUrl": 'images/duijingji.png',
                    },
                    {
                      "title": '找人脉',
                      "imageUrl": 'images/renmai.png',
                    },
                    {
                      "title": '库存管理',
                      "imageUrl": 'images/kucun.png',
                    },
                    {
                      "title": '车源线索',
                      "imageUrl": 'images/cheyuan.png',
                    },
                    {
                      "title": '运营中心',
                      "imageUrl": 'images/yunying.png',
                    },
                    {
                      "title": '企业ERP',
                      "imageUrl": 'images/erp.png',
                    },
                  ];


                  return EasyRefresh(
                    child: ListView(
                      children: <Widget>[
                        CustomViewBanner(bannerList: bannerList),
                        //进行传值 冒号前是传入后的对象 后面是要传的值
                        CustomViewSelectionCar(toBeSoldCarNum, soldCarNum),
                        //选车区域的布局

                        Divider(
                          height: 10.0,
                          thickness: 10.0,
                          color: Color.fromRGBO(244, 244, 244, 1.0),
                        ),
                        //设置分割线

                        CustomViewMenuNavigator(menuList: menuListData),
                        //菜单导航

                        Divider(
                          height: 10.0,
                          thickness: 10.0,
                          color: Color.fromRGBO(244, 244, 244, 1.0),
                        ), //设置分割线


                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '推荐车源',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(15),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '寻找更多车源     >',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(12),
                                        color: Colors.grey),
                                  )),
                            ],
                          ),
                        ),

                        CustomViewRecommendList(resultList:resultList),
                      ],
                    ),


                    refreshFooter: ClassicsFooter(
                        key: _footerKey,
                        bgColor: Colors.white,
                        textColor: Colors.pink,
                        moreInfoColor: Colors.pink,
                        showMore: true,
                        noMoreText: '',
                        moreInfo: '加载中',
                        loadReadyText: '上拉加载....'),
                    refreshHeader: ClassicsHeader(
                      key: _headerKey,
                      refreshText: '下拉刷新',
                      refreshReadyText: '准备刷新',
                      refreshingText: '刷新中...',
                      refreshedText: '刷新完成',
                      moreInfo: '更新于 %T',
                      bgColor: Colors.transparent,
                      textColor: Colors.black87,
                      moreInfoColor: Colors.black54,
                      showMore: true,
                    ),
                    onRefresh: () async {
                      print('开始刷新数据');

                      recommendList([]);
                    },
                    loadMore: () async {
                      print('开始加载更多');

                      recommendList([]);
                    },
                  );
              }
              return null; // unreachable
            } else {
              return Text('得到数据有问题,展示失败');
            }
          },
        ));
  }

  void recommendList(List userCarId) async {
    getRecommendList(1, userCarId).then((value) {
      print("加载推荐列表${value.toString()}");
      ResultData result = value;

      if (result.isSuccess) {
        //获取Json格式字符串
        var resultData = result.resultData;
        print('得到数据====>' + resultData['data'].toString());
        var usedCarIds = resultData['data']['usedCarIds'];
        var resultList = resultData['data']['resultList'];
        print('usedCarIds====>' + usedCarIds.toString());
        print('resultList====>' + resultList.toString());
        CustomViewRecommendList(resultList:resultList);
      }
    });
  }

  //请求接口的异步方法
  Future requestMethod() async {
    return Future.wait([getBanner("0"), getRecordUsedCar(),getRecommendList(1,[])]);
  }
}


class CustomViewRecommendList extends StatelessWidget {
  List resultList;
  CustomViewRecommendList({Key key, this.resultList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          //Image.asset(item['imageUrl'], width: ScreenUtil().setWidth(46.67)),
          Text(
            item['usedCarInfo']['vehicleModelText'],
            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
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
        crossAxisCount: 2,
        padding: EdgeInsets.all(4.0),
        children:resultList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }

}

