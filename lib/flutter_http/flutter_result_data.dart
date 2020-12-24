
class ResultData{
  var resultData;
  bool isSuccess;
  int code;
  String pathUrl;
//  var headers;

  ResultData(this.resultData, this.isSuccess, this.code,this.pathUrl);

  @override
  String toString() {
    return '{resultData: $resultData, isSuccess: $isSuccess, code: $code, pathUrl: $pathUrl}';
  }


}
