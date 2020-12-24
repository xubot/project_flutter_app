import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter_app/flutter_ui/flutter_login_page.dart';
import 'package:project_flutter_app/tool/flutter_utility_sharedpreferences.dart';

void main(){
//  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();//在runApp之前添加东西的话需要添加这个方法
  realRunApp();
}

void realRunApp() async{
  await SharedPreferencesUtils.getInstance();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bool isLogin = SharedPreferencesUtils.getLogin();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: OverallStructure(),
      home: LoginPage(),
      builder: EasyLoading.init(),
    );
  }
}
