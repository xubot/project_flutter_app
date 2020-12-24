const connectTimeout=5000;
const receiveTimeout=5000;
const NETWORK_ERROR=1;
const headers= {'uuid': '48:ed3664af-df0c-445b-a5b6-086fda4ae05c'};

//静态接口
const pathUrl="http://192.168.0.101:8080/";

const getLoginPath=pathUrl+"user/login";
const getVerifyCodePath=pathUrl+"user/sendVerifyCode";

//轮播图接口
const getBrannerListPath=pathUrl+"branner/queryAll";
//二手车推荐接口
const getRecommendListPath=pathUrl+"usedCar/recommendList";
//记录二手车数据
const getRecordUsedCarPath=pathUrl+"usedCar/recordUsedCar";
