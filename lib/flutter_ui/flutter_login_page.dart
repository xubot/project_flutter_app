import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter_app/flutter_bean/flutter_login_bean_entity.dart';
import 'package:project_flutter_app/flutter_http/flutter_result_data.dart';
import 'package:project_flutter_app/flutter_http/http_method.dart';
import 'package:project_flutter_app/flutter_ui/flutter_overall_structure.dart';
import 'package:project_flutter_app/tool/flutter_commontools.dart';
import 'package:project_flutter_app/tool/flutter_utility_sharedpreferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = true;
  IconData _checkIcon = Icons.check_box;
  String phone;
  String code;

  TextEditingController phoneController; //声明controller
  TextEditingController codeController; //声明controller

  TapGestureRecognizer _registProtocolRecognizer;
  TapGestureRecognizer _privacyProtocolRecognizer;

  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';
  int _countdownNum =0;

  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    phoneController = new TextEditingController(); //声明手机号的输入
    codeController = new TextEditingController(); //声明验证码的输入
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
  }

  void _onLogin() {
    phone = phoneController.text.toString();
    code = codeController.text.toString();

    if (phone == '') {
      CommonTools.showMessageToast('手机号不可为空');
      return;
    }
    if (code == '') {
      CommonTools.showMessageToast('验证码不可为空');
      return;
    }
    if (!_isChecked) {
      CommonTools.showMessageToast('请同意勾选协议');
      return;
    }

    if (phone != '' && code != '' && _isChecked) {
      print("输入登录的值：" + phone + "====" + code);
      //进行请求
      String uuid;
      int completedInformation;
      int insuranceButton;
      int realNameVerify;
      int userId;
      int xiaoyiArmyChatGroupId;
      int xiaoyiArmyStatus;
      getLogin(phone, code, "").then((value) {
        ResultData result = value;
        if (result.isSuccess) {
          //获取Json格式字符串
          var resultData = result.resultData;
          print('得到数据====>' + resultData.toString());
          //进行反序列化，得到对象   (解析Json)
          FlutterLoginBeanEntity login =
              new FlutterLoginBeanEntity.fromJson(resultData);

          uuid = login.data.uuid;
          completedInformation = login.data.completedInformation;
          insuranceButton = login.data.insuranceButton;
          realNameVerify = login.data.realNameVerify;
          userId = login.data.userId;
          xiaoyiArmyChatGroupId = login.data.xiaoyiArmyChatGroupId;
          xiaoyiArmyStatus = login.data.xiaoyiArmyStatus;

          print('登录的值====>' +
              uuid +
              "==" +
              completedInformation.toString() +
              "===" +
              insuranceButton.toString() +
              "===" +
              realNameVerify.toString() +
              "===" +
              userId.toString() +
              "===" +
              xiaoyiArmyChatGroupId.toString() +
              "===" +
              xiaoyiArmyStatus.toString());

          SharedPreferencesUtils.setUUID(uuid);
          SharedPreferencesUtils.setCompletedInformation(
              completedInformation.toString());
          SharedPreferencesUtils.setRealNameVerify(realNameVerify.toString());
          SharedPreferencesUtils.setUserId(userId.toString());
          SharedPreferencesUtils.setXiaoyiArmyChatGroupId(
              xiaoyiArmyChatGroupId.toString());
          SharedPreferencesUtils.setXiaoyiArmyStatus(
              xiaoyiArmyStatus.toString());

          //跳转其它页面
          CommonTools.startPage(context, OverallStructure());
        } else {
          CommonTools.showMessageToast('请再次点击，重新登录');
        }
      });
    }
  }

  Widget _showPhoneInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: phoneController,
        //指定controller
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Colors.white),
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: '请输入手机号',
            hintStyle: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              color: Colors.white,
            ),
            icon: Image.asset(
              'images/username.png',
              width: ScreenUtil().setWidth(18),
              height: ScreenUtil().setHeight(20),
            )),
      ),
    );
  }

  Widget _showCodeInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: new TextFormField(
              controller: codeController,
              //指定controller
              maxLines: 1,
              autofocus: false,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(16), color: Colors.white),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: Colors.white,
                  ),
                  icon: Image.asset(
                    'images/code.png',
                    width: ScreenUtil().setWidth(20),
                    height: ScreenUtil().setHeight(20),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FlatButton(
                child: Text(
                  _countdownNum > 0 ? '$_countdownNum s后重新获取' : '获取验证码',
                  style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                ),
                textColor: Colors.white,
                color: Colors.orangeAccent,
                height: ScreenUtil().setHeight(27.33),
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.orangeAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                onPressed: _getVerCode,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _getVerCode() {
    if (_countdownNum > 0) return null;
    var phone = phoneController.text.toString();
    if (phone.isEmpty) {
      CommonTools.showMessageToast("请输入手机号");
      return null;
    }
    return getSendVerifyCode(phone).then((value) {
      startCountdownTimer();
    });
  }

  Timer _timer;

  void startCountdownTimer() {
    _countdownNum = 119;
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => {
              setState(() {
                if (_countdownNum == 0) {
                  _timer.cancel();
                } else {
                  _countdownNum = _countdownNum - 1;
                }
              })
            });
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 732)..init(context);

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 90),
              height: ScreenUtil().setHeight(90),
              width: ScreenUtil().setWidth(75),
              child: Image(image: AssetImage('images/logobaise.png')),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                children: <Widget>[
                  _showPhoneInput(),
                  Divider(
                    height: 0.5,
                    indent: 16.0,
                    color: Colors.grey[300],
                  ),
                  _showCodeInput(),
                  Divider(
                    height: 0.5,
                    indent: 16.0,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35, 30, 35, 0),
              child: FlatButton(
                child: Text(
                  '登录',
                  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                ),
                textColor: Colors.white,
                color: Colors.blue,
                height: ScreenUtil().setHeight(45),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  _onLogin();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 30, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Icon(_checkIcon),
                      color: Colors.orange,
                      onPressed: () {
                        setState(() {
                          _isChecked = !_isChecked;
                          if (_isChecked) {
                            _checkIcon = Icons.check_box;
                          } else {
                            _checkIcon = Icons.check_box_outline_blank;
                          }
                        });
                      }),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: '我已经详细阅读并同意',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(15)),
                            children: <TextSpan>[
                          TextSpan(
                              text: '《隐私政策》',
                              recognizer: _privacyProtocolRecognizer
                                ..onTap = () {
                                  CommonTools.showMessageToast('《隐私政策》');
                                },
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Colors.orangeAccent,
                                  decoration: TextDecoration.underline)),
                          TextSpan(
                              text: '和',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(15),
                              )),
                          TextSpan(
                              text: '《用户协议》',
                              recognizer: _registProtocolRecognizer
                                ..onTap = () {
                                  CommonTools.showMessageToast('《用户协议》');
                                },
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: ScreenUtil().setSp(15),
                                  decoration: TextDecoration.underline))
                        ])),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 57),
              height: ScreenUtil().setHeight(45),
              width: ScreenUtil().setWidth(45),
              child: Image(image: AssetImage('images/wechat.png')),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    //销毁
    _registProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();
    _countdownTimer?.cancel();
    _countdownTimer = null;
  }
}
