import 'package:project_flutter_app/flutter_http/flutter_api_config.dart';
import 'package:project_flutter_app/flutter_http/flutter_http_response.dart';
import 'package:project_flutter_app/tool/flutter_commontools.dart';

Future getBanner(String type) async{
  var params = CommonTools.getBaseMap();
  params["type"] = type;
  return HttpResponse().getHttp(getBrannerListPath, params: params);
}

/*Future getUsedCarDetailById(String usedCarId){
  var params = CommonTools.getBaseMap();
  params.clear();
  params['usedCarId'] = usedCarId;
  return HttpResponse().getHttp(APIConfig['getUsedCarDetailById'],params: params);
}*/

Future getLogin(String account,String verifyCode,String openId){
  var params = CommonTools.getBaseMap();
  params.clear();
  params['phone'] = account;
  params['verifyCode'] = verifyCode;
  params['openId'] = openId;
  return HttpResponse().postHttp(getLoginPath,data: params);
}


Future getRecordUsedCar(){
  return HttpResponse().getHttp(getRecordUsedCarPath);
}

/*
Future recordUsedCar(){
  var params = DataHelper.getBaseMap();
  params.clear();
  return HttpResponse().getHttp(APIConfig['recordUsedCar'],params: params);
}*/

Future getRecommendList(int pageIndex,List usedCarIds,{withLoading = true}){
  var params = CommonTools.getBaseMap();
  params.clear();
  params['pageIndex'] = pageIndex;
  params['pageSize'] = '10';
  params['usedCarIds'] = usedCarIds;
  return HttpResponse().postHttp(getRecommendListPath,data: params,withLoading:withLoading);
}

Future getSendVerifyCode(String phone){
  var params = CommonTools.getBaseMap();
  params.clear();
  params['phone'] = phone;
  return HttpResponse().postHttp(getVerifyCodePath,data: params);
}


