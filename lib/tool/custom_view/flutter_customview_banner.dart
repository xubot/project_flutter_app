import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'flutter_customview_webview.dart';

class CustomViewBanner extends StatelessWidget {
  final List bannerList;

  CustomViewBanner({this.bannerList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AspectRatio(
        aspectRatio: 2/1,
        child: Swiper(
          itemCount: bannerList.length,
          itemBuilder: (BuildContext context,int index) {
            return (
                Image.network(
                  bannerList[index]['img'],
                  fit: BoxFit.fill,
                )
            );
          },//进行展示数据
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )
          ),//设置轮播图的转换按钮
          scrollDirection: Axis.horizontal,//设置横向轮播还是纵向轮播
          autoplay: true,//是否自动播放
          loop: true,//是否自动轮询
          onTap: (index){
            var url = bannerList[index]['url'].toString();
            print("点击后得到的url========》{$url}");
            Navigator.push(context, MaterialPageRoute(builder: (cx)=>CustomViewWebView(title: "点击轮播图后的网页",urlPath:url)));//传递数据的方法
          },//轮播图点击事件
        ),
      ),
    );
  }
}
