import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:project_flutter_app/flutter_http/flutter_error_handle.dart';
import 'package:project_flutter_app/flutter_http/flutter_result_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }
  @override
  onResponse(Response response) async{
    Map<String,dynamic> responseData = jsonDecode(response.toString());
    try {

      ///一般只需要处理200的情况，300、400、500保留错误信息
      if (response.statusCode == 200 || response.statusCode == 201) {
        String code = responseData["code"];
        if (code=="0000") {
          return new ResultData(responseData, true, ExceptionHandle.success,response.request.path);
        } else {
          return new ResultData(response.statusMessage, false, ExceptionHandle.success,response.request.path);
        }
      }
    } catch (e) {
      return new ResultData(ExceptionHandle.handleException(e).msg, false, response.statusCode,response.request.path);
    }

    return new ResultData(response.statusMessage, false, response.statusCode,response.request.path);
  }

  @override
  onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}
