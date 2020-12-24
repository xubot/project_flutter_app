import 'package:dio/dio.dart';
import 'package:project_flutter_app/flutter_http/flutter_error_handle.dart';
import 'package:project_flutter_app/flutter_http/flutter_loading_utils.dart';
import 'package:project_flutter_app/flutter_http/flutter_response_Interceptors.dart';
import 'package:project_flutter_app/flutter_http/flutter_result_data.dart';
import 'package:project_flutter_app/tool/flutter_utility_sharedpreferences.dart';

class HttpResponse{
  //responseType :ResponseType.plain,
  Dio dio;

  HttpResponse(){
    if(dio==null) {
      var uuid = SharedPreferencesUtils.getUUID();
      dio = Dio(BaseOptions(
        // 连接超时时间
          connectTimeout:5000,
          // 响应流收到数据的间隔
          receiveTimeout: 5000,
          // http请求头
          headers:{'uuid':uuid}, //headers: headers,
          responseType :ResponseType.plain,

      ));
      dio.interceptors.add(ResponseInterceptors());
    }
  }

  getHttp(String url,{params, withLoading = true}) async{
    if (withLoading) {
      LoadingUtils.show();
    }
    Response response;
    try {
      response = await dio.get(url, queryParameters: params);
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }
    return response.data;

  }


  postHttp(String url,{data, withLoading = true}) async{
    if (withLoading) {
      LoadingUtils.show();
    }

    Response response;

    try {
      response = await dio.post(url, data: data);
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;

  }

  ResultData resultError(DioError e) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
    } else {
      errorResponse = new Response(statusCode: 666);
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = ExceptionHandle.timeout_error;
    }
    return ResultData(
        e.message, false, errorResponse.statusCode,e.request.path);
  }

}
