// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.


/*
class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case LoginJsonEntity:
        return loginJsonEntityFromJson(data as LoginJsonEntity, json) as T;
      case LoginJsonData:
        return loginJsonDataFromJson(data as LoginJsonData, json) as T;
      case RecommendCarListEntity:
        return recommendCarListEntityFromJson(data as RecommendCarListEntity, json) as T;
      case RecommendCarListData:
        return recommendCarListDataFromJson(data as RecommendCarListData, json) as T;
      case RecommandCarListDataResultList:
        return recommandCarListDataResultListFromJson(data as RecommandCarListDataResultList, json) as T;
      case RecommendCarListDataResultListUsedCarInfo:
        return recommendCarListDataResultListUsedCarInfoFromJson(data as RecommendCarListDataResultListUsedCarInfo, json) as T;
      case RecommendCarListDataResultListUserInfo:
        return recommendCarListDataResultListUserInfoFromJson(data as RecommendCarListDataResultListUserInfo, json) as T;
      case RecordUsedCarEntity:
        return recordUsedCarEntityFromJson(data as RecordUsedCarEntity, json) as T;
      case RecordUsedCarData:
        return recordUsedCarDataFromJson(data as RecordUsedCarData, json) as T;
      case UserLoginEntity:
        return userLoginEntityFromJson(data as UserLoginEntity, json) as T;
      case UserLoginData:
        return userLoginDataFromJson(data as UserLoginData, json) as T;
      case UserLoginDataCheckDetailList:
        return userLoginDataCheckDetailListFromJson(data as UserLoginDataCheckDetailList, json) as T;
      case TestGvDataEntity:
        return testGvDataEntityFromJson(data as TestGvDataEntity, json) as T;
      case TestGvDataData:
        return testGvDataDataFromJson(data as TestGvDataData, json) as T;
      case TestGvDataDataUsedCarInfo:
        return testGvDataDataUsedCarInfoFromJson(data as TestGvDataDataUsedCarInfo, json) as T;
      case TestGvDataDataUserInfo:
        return testGvDataDataUserInfoFromJson(data as TestGvDataDataUserInfo, json) as T;
      case QueryAllEntity:
        return queryAllEntityFromJson(data as QueryAllEntity, json) as T;
      case QueryAllData:
        return queryAllDataFromJson(data as QueryAllData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case LoginJsonEntity:
        return loginJsonEntityToJson(data as LoginJsonEntity);
      case LoginJsonData:
        return loginJsonDataToJson(data as LoginJsonData);
      case RecommendCarListEntity:
        return recommendCarListEntityToJson(data as RecommendCarListEntity);
      case RecommendCarListData:
        return recommendCarListDataToJson(data as RecommendCarListData);
      case RecommandCarListDataResultList:
        return recommandCarListDataResultListToJson(data as RecommandCarListDataResultList);
      case RecommendCarListDataResultListUsedCarInfo:
        return recommendCarListDataResultListUsedCarInfoToJson(data as RecommendCarListDataResultListUsedCarInfo);
      case RecommendCarListDataResultListUserInfo:
        return recommendCarListDataResultListUserInfoToJson(data as RecommendCarListDataResultListUserInfo);
      case RecordUsedCarEntity:
        return recordUsedCarEntityToJson(data as RecordUsedCarEntity);
      case RecordUsedCarData:
        return recordUsedCarDataToJson(data as RecordUsedCarData);
      case UserLoginEntity:
        return userLoginEntityToJson(data as UserLoginEntity);
      case UserLoginData:
        return userLoginDataToJson(data as UserLoginData);
      case UserLoginDataCheckDetailList:
        return userLoginDataCheckDetailListToJson(data as UserLoginDataCheckDetailList);
      case TestGvDataEntity:
        return testGvDataEntityToJson(data as TestGvDataEntity);
      case TestGvDataData:
        return testGvDataDataToJson(data as TestGvDataData);
      case TestGvDataDataUsedCarInfo:
        return testGvDataDataUsedCarInfoToJson(data as TestGvDataDataUsedCarInfo);
      case TestGvDataDataUserInfo:
        return testGvDataDataUserInfoToJson(data as TestGvDataDataUserInfo);
      case QueryAllEntity:
        return queryAllEntityToJson(data as QueryAllEntity);
      case QueryAllData:
        return queryAllDataToJson(data as QueryAllData);
    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle<M>( json) {
    String type = M.toString();
    if(type == (LoginJsonEntity).toString()){
      return LoginJsonEntity().fromJson(json);
    }	else if(type == (LoginJsonData).toString()){
      return LoginJsonData().fromJson(json);
    }	else if(type == (RecommendCarListEntity).toString()){
      return RecommendCarListEntity().fromJson(json);
    }	else if(type == (RecommendCarListData).toString()){
      return RecommendCarListData().fromJson(json);
    }	else if(type == (RecommandCarListDataResultList).toString()){
      return RecommandCarListDataResultList().fromJson(json);
    }	else if(type == (RecommendCarListDataResultListUsedCarInfo).toString()){
      return RecommendCarListDataResultListUsedCarInfo().fromJson(json);
    }	else if(type == (RecommendCarListDataResultListUserInfo).toString()){
      return RecommendCarListDataResultListUserInfo().fromJson(json);
    }	else if(type == (RecordUsedCarEntity).toString()){
      return RecordUsedCarEntity().fromJson(json);
    }	else if(type == (RecordUsedCarData).toString()){
      return RecordUsedCarData().fromJson(json);
    }	else if(type == (UserLoginEntity).toString()){
      return UserLoginEntity().fromJson(json);
    }	else if(type == (UserLoginData).toString()){
      return UserLoginData().fromJson(json);
    }	else if(type == (UserLoginDataCheckDetailList).toString()){
      return UserLoginDataCheckDetailList().fromJson(json);
    }	else if(type == (TestGvDataEntity).toString()){
      return TestGvDataEntity().fromJson(json);
    }	else if(type == (TestGvDataData).toString()){
      return TestGvDataData().fromJson(json);
    }	else if(type == (TestGvDataDataUsedCarInfo).toString()){
      return TestGvDataDataUsedCarInfo().fromJson(json);
    }	else if(type == (TestGvDataDataUserInfo).toString()){
      return TestGvDataDataUserInfo().fromJson(json);
    }	else if(type == (QueryAllEntity).toString()){
      return QueryAllEntity().fromJson(json);
    }	else if(type == (QueryAllData).toString()){
      return QueryAllData().fromJson(json);
    }
    return null;
  }

  //list is returned by type
  static M _getListChildType<M>(List<Map> data) {
    if(List<LoginJsonEntity>() is M){
      return data.map((e) => LoginJsonEntity().fromJson(e)).toList() as M;
    }	else if(List<LoginJsonData>() is M){
      return data.map((e) => LoginJsonData().fromJson(e)).toList() as M;
    }	else if(List<RecommendCarListEntity>() is M){
      return data.map((e) => RecommendCarListEntity().fromJson(e)).toList() as M;
    }	else if(List<RecommendCarListData>() is M){
      return data.map((e) => RecommendCarListData().fromJson(e)).toList() as M;
    }	else if(List<RecommandCarListDataResultList>() is M){
      return data.map((e) => RecommandCarListDataResultList().fromJson(e)).toList() as M;
    }	else if(List<RecommendCarListDataResultListUsedCarInfo>() is M){
      return data.map((e) => RecommendCarListDataResultListUsedCarInfo().fromJson(e)).toList() as M;
    }	else if(List<RecommendCarListDataResultListUserInfo>() is M){
      return data.map((e) => RecommendCarListDataResultListUserInfo().fromJson(e)).toList() as M;
    }	else if(List<RecordUsedCarEntity>() is M){
      return data.map((e) => RecordUsedCarEntity().fromJson(e)).toList() as M;
    }	else if(List<RecordUsedCarData>() is M){
      return data.map((e) => RecordUsedCarData().fromJson(e)).toList() as M;
    }	else if(List<UserLoginEntity>() is M){
      return data.map((e) => UserLoginEntity().fromJson(e)).toList() as M;
    }	else if(List<UserLoginData>() is M){
      return data.map((e) => UserLoginData().fromJson(e)).toList() as M;
    }	else if(List<UserLoginDataCheckDetailList>() is M){
      return data.map((e) => UserLoginDataCheckDetailList().fromJson(e)).toList() as M;
    }	else if(List<TestGvDataEntity>() is M){
      return data.map((e) => TestGvDataEntity().fromJson(e)).toList() as M;
    }	else if(List<TestGvDataData>() is M){
      return data.map((e) => TestGvDataData().fromJson(e)).toList() as M;
    }	else if(List<TestGvDataDataUsedCarInfo>() is M){
      return data.map((e) => TestGvDataDataUsedCarInfo().fromJson(e)).toList() as M;
    }	else if(List<TestGvDataDataUserInfo>() is M){
      return data.map((e) => TestGvDataDataUserInfo().fromJson(e)).toList() as M;
    }	else if(List<QueryAllEntity>() is M){
      return data.map((e) => QueryAllEntity().fromJson(e)).toList() as M;
    }	else if(List<QueryAllData>() is M){
      return data.map((e) => QueryAllData().fromJson(e)).toList() as M;
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}
*/
