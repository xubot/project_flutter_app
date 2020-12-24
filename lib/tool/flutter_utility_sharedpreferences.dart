import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils{
  static String UUID = 'uuid';
  static String COMPLETEDINFORMATION = 'completedInformation';
  static String REALNAMEVERIFY = 'realNameVerify';
  static String USERID = 'userid';
  static String XIAOYIARMYCHATGROUPID = 'xiaoyiArmyChatGroupId';
  static String XIAOYIARMYSYAYUS = 'xiaoyiArmyStatus';
  static String LOGIN_APPLICATION = 'LOGIN_APPLICATION';
  static SharedPreferences mSharePreferences;


  static Future getInstance() async{
    if(mSharePreferences == null){
      mSharePreferences = await SharedPreferences.getInstance();
    }else {
      return;
    }
  }

  /// 存数据
  static Object savePreference(String key , Object value) async {
    if(value is  int ){
      await mSharePreferences.setInt(key, value);
    }else if(value is double){
      await mSharePreferences.setDouble(key, value);
    }else if(value is bool){
      await mSharePreferences.setBool(key, value);
    }else if(value is String){
      await mSharePreferences.setString(key, value);
    }else if(value is List){
      await mSharePreferences.setStringList(key, value);
    }  else {
      throw new Exception("不能得到这种类型");
    }
  }

  /// 取数据
  static Future  getPreference( String key ,Object defaultValue) async{
    if(defaultValue is  int) {
      return mSharePreferences.getInt(key);
    }
    else if(defaultValue is  double) {
      return mSharePreferences.getDouble(key);
    }
    else if(defaultValue is bool) {
      return mSharePreferences.getBool(key);
    }
    else if(defaultValue is String) {
      return mSharePreferences.getString(key);
    }
    else if(defaultValue is List) {
      return mSharePreferences.getStringList(key);
    }
    else {
      throw new Exception("不能得到这种类型");
    }
  }
  /// 删除指定数据
  static void remove(String key)async{
    mSharePreferences.remove(key); //删除指定键
  }
  /// 清空整个缓存
  static void clear()async{
    mSharePreferences.clear(); ////清空缓存
  }


  static void setUUID(String uuid){
    savePreference(UUID, uuid);
  }
  static String getUUID(){
    var uuid = mSharePreferences.getString(UUID);
    if(uuid=='') return '';
    return uuid;
  }

  static void setCompletedInformation(String completedInformation){
    savePreference(COMPLETEDINFORMATION, completedInformation);
  }
  static String getCompletedInformation(){
    var completedInformation = mSharePreferences.getString(COMPLETEDINFORMATION);
    if(completedInformation=='') return '';
    return completedInformation;
  }


  static void setRealNameVerify(String realNameVerify){
    savePreference(REALNAMEVERIFY, realNameVerify);
  }
  static String getRealNameVerify(){
    var realNameVerify = mSharePreferences.getString(REALNAMEVERIFY);
    if(realNameVerify=='') return '';
    return realNameVerify;
  }


 static void setUserId(String userid){
    savePreference(USERID, userid);
  }
  static String getUserId(){
    var userid = mSharePreferences.getString(USERID);
    if(userid=='') return '';
    return userid;
  }


 static void setXiaoyiArmyChatGroupId(String xiaoyiArmyChatGroupId){
    savePreference(XIAOYIARMYCHATGROUPID, xiaoyiArmyChatGroupId);
  }
  static String getXiaoyiArmyChatGroupId(){
    var xiaoyiArmyChatGroupId = mSharePreferences.getString(XIAOYIARMYCHATGROUPID);
    if(xiaoyiArmyChatGroupId=='') return '';
    return xiaoyiArmyChatGroupId;
  }


 static void setXiaoyiArmyStatus(String xiaoyiArmyStatus){
    savePreference(XIAOYIARMYSYAYUS, xiaoyiArmyStatus);
  }
  static String getXiaoyiArmyStatus(){
    var xiaoyiArmyStatus = mSharePreferences.getString(XIAOYIARMYSYAYUS);
    if(xiaoyiArmyStatus=='') return '';
    return xiaoyiArmyStatus;
  }


  static void setLogin(bool isLogin){
    savePreference(LOGIN_APPLICATION, isLogin);
  }
  static bool getLogin(){
    var isLogin = mSharePreferences.getBool(LOGIN_APPLICATION);
    if(isLogin==null) return false;
    return isLogin;
  }
}
