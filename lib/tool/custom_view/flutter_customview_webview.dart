import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CustomViewWebView extends StatefulWidget{

  String title;
  var urlPath;
  CustomViewWebView({this.title,this.urlPath});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewShow(title: title,urlPath:urlPath);
  }

}

class WebViewShow extends State<CustomViewWebView>{
  String title;
  var urlPath;

  WebViewShow({this.title, this.urlPath});

  FlutterWebviewPlugin flutterWebviewPlugin=FlutterWebviewPlugin();
  StreamSubscription<String> _urlchange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _urlchange=flutterWebviewPlugin.onUrlChanged.listen((loadUrl){
      //WebviewScaffold 加载的url变化时触发此方法
      print("loadUrl:"+loadUrl);
    });

    //加载错误时监听
    flutterWebviewPlugin.onHttpError.listen((error){
      print("error:"+error.code);
    });

    //加载状态变化监听
    flutterWebviewPlugin.onStateChanged.listen((state){
      print("state:"+state.type.toString());
    });

  }

  @override
  Widget build(BuildContext context) {
    print("得到传来的url:"+urlPath);
    // TODO: implement build
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
      url:'https://www.baidu.com/',
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
    );
  }

}