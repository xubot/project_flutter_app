class FlutterRecomlistBeanEntity {
	String msg;
	String code;
	FlutterRecomlistBeanData data;
	String error;

	FlutterRecomlistBeanEntity({this.msg, this.code, this.data, this.error});

	FlutterRecomlistBeanEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new FlutterRecomlistBeanData.fromJson(json['data']) : null;
		error = json['error'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['error'] = this.error;
		return data;
	}
}

class FlutterRecomlistBeanData {
	List<int> usedCarIds;
	List<FlutterRecomlistBeanDataResultlist> resultList;

	FlutterRecomlistBeanData({this.usedCarIds, this.resultList});

	FlutterRecomlistBeanData.fromJson(Map<String, dynamic> json) {
		usedCarIds = json['usedCarIds']?.cast<int>();
		if (json['resultList'] != null) {
			resultList = new List<FlutterRecomlistBeanDataResultlist>();(json['resultList'] as List).forEach((v) { resultList.add(new FlutterRecomlistBeanDataResultlist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['usedCarIds'] = this.usedCarIds;
		if (this.resultList != null) {
      data['resultList'] =  this.resultList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class FlutterRecomlistBeanDataResultlist {
	FlutterRecomlistBeanDataResultlistUserinfo userInfo;
	int total;
	FlutterRecomlistBeanDataResultlistUsedcarinfo usedCarInfo;

	FlutterRecomlistBeanDataResultlist({this.userInfo, this.total, this.usedCarInfo});

	FlutterRecomlistBeanDataResultlist.fromJson(Map<String, dynamic> json) {
		userInfo = json['userInfo'] != null ? new FlutterRecomlistBeanDataResultlistUserinfo.fromJson(json['userInfo']) : null;
		total = json['total'];
		usedCarInfo = json['usedCarInfo'] != null ? new FlutterRecomlistBeanDataResultlistUsedcarinfo.fromJson(json['usedCarInfo']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
		data['total'] = this.total;
		if (this.usedCarInfo != null) {
      data['usedCarInfo'] = this.usedCarInfo.toJson();
    }
		return data;
	}
}

class FlutterRecomlistBeanDataResultlistUserinfo {
	String headImg;
	int gender;
	int completedInformation;
	String nickName;
	String danGradingName;
	String identityFlagText;
	String countyText;
	int realNameVerify;
	int userId;
	String cityText;
	int xiaoyiArmyStatus;
	String provinceText;

	FlutterRecomlistBeanDataResultlistUserinfo({this.headImg, this.gender, this.completedInformation, this.nickName, this.danGradingName, this.identityFlagText, this.countyText, this.realNameVerify, this.userId, this.cityText, this.xiaoyiArmyStatus, this.provinceText});

	FlutterRecomlistBeanDataResultlistUserinfo.fromJson(Map<String, dynamic> json) {
		headImg = json['headImg'];
		gender = json['gender'];
		completedInformation = json['completedInformation'];
		nickName = json['nickName'];
		danGradingName = json['danGradingName'];
		identityFlagText = json['identityFlagText'];
		countyText = json['countyText'];
		realNameVerify = json['realNameVerify'];
		userId = json['userId'];
		cityText = json['cityText'];
		xiaoyiArmyStatus = json['xiaoyiArmyStatus'];
		provinceText = json['provinceText'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['headImg'] = this.headImg;
		data['gender'] = this.gender;
		data['completedInformation'] = this.completedInformation;
		data['nickName'] = this.nickName;
		data['danGradingName'] = this.danGradingName;
		data['identityFlagText'] = this.identityFlagText;
		data['countyText'] = this.countyText;
		data['realNameVerify'] = this.realNameVerify;
		data['userId'] = this.userId;
		data['cityText'] = this.cityText;
		data['xiaoyiArmyStatus'] = this.xiaoyiArmyStatus;
		data['provinceText'] = this.provinceText;
		return data;
	}
}

class FlutterRecomlistBeanDataResultlistUsedcarinfo {
	String horsePower;
	String lengthText;
	String seriesText;
	String brandText;
	String refreshTime;
	int channel;
	int seal;
	String sellPrice;
	String video;
	String xiaoyiAttestation;
	String vehicleModelText;
	String nationalStandardText;
	String carSizeText;
	int deleteStatus;
	int id;
	String engineText;
	String driverText;
	String heightText;
	String axesText;
	String sealUserId;
	String publicAddrCountyText;
	String weightText;
	String publicAddrCityText;
	int saleStatus;
	int collection;
	String categoryText;
	int userId;
	String ageLimitText;
	int sourceType;
	String publicAddrProvinceText;
	String auditStatus;
	int testReportFillStatus;
	String recommendStatus;
	List<String> imgList;

	FlutterRecomlistBeanDataResultlistUsedcarinfo({this.horsePower, this.lengthText, this.seriesText, this.brandText, this.refreshTime, this.channel, this.seal, this.sellPrice, this.video, this.xiaoyiAttestation, this.vehicleModelText, this.nationalStandardText, this.carSizeText, this.deleteStatus, this.id, this.engineText, this.driverText, this.heightText, this.axesText, this.sealUserId, this.publicAddrCountyText, this.weightText, this.publicAddrCityText, this.saleStatus, this.collection, this.categoryText, this.userId, this.ageLimitText, this.sourceType, this.publicAddrProvinceText, this.auditStatus, this.testReportFillStatus, this.recommendStatus, this.imgList});

	FlutterRecomlistBeanDataResultlistUsedcarinfo.fromJson(Map<String, dynamic> json) {
		horsePower = json['horsePower'];
		lengthText = json['lengthText'];
		seriesText = json['seriesText'];
		brandText = json['brandText'];
		refreshTime = json['refreshTime'];
		channel = json['channel'];
		seal = json['seal'];
		sellPrice = json['sellPrice'];
		video = json['video'];
		xiaoyiAttestation = json['xiaoyiAttestation'];
		vehicleModelText = json['vehicleModelText'];
		nationalStandardText = json['nationalStandardText'];
		carSizeText = json['carSizeText'];
		deleteStatus = json['deleteStatus'];
		id = json['id'];
		engineText = json['engineText'];
		driverText = json['driverText'];
		heightText = json['heightText'];
		axesText = json['axesText'];
		sealUserId = json['sealUserId'];
		publicAddrCountyText = json['publicAddrCountyText'];
		weightText = json['weightText'];
		publicAddrCityText = json['publicAddrCityText'];
		saleStatus = json['saleStatus'];
		collection = json['collection'];
		categoryText = json['categoryText'];
		userId = json['userId'];
		ageLimitText = json['ageLimitText'];
		sourceType = json['sourceType'];
		publicAddrProvinceText = json['publicAddrProvinceText'];
		auditStatus = json['auditStatus'];
		testReportFillStatus = json['testReportFillStatus'];
		recommendStatus = json['recommendStatus'];
		imgList = json['imgList']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['horsePower'] = this.horsePower;
		data['lengthText'] = this.lengthText;
		data['seriesText'] = this.seriesText;
		data['brandText'] = this.brandText;
		data['refreshTime'] = this.refreshTime;
		data['channel'] = this.channel;
		data['seal'] = this.seal;
		data['sellPrice'] = this.sellPrice;
		data['video'] = this.video;
		data['xiaoyiAttestation'] = this.xiaoyiAttestation;
		data['vehicleModelText'] = this.vehicleModelText;
		data['nationalStandardText'] = this.nationalStandardText;
		data['carSizeText'] = this.carSizeText;
		data['deleteStatus'] = this.deleteStatus;
		data['id'] = this.id;
		data['engineText'] = this.engineText;
		data['driverText'] = this.driverText;
		data['heightText'] = this.heightText;
		data['axesText'] = this.axesText;
		data['sealUserId'] = this.sealUserId;
		data['publicAddrCountyText'] = this.publicAddrCountyText;
		data['weightText'] = this.weightText;
		data['publicAddrCityText'] = this.publicAddrCityText;
		data['saleStatus'] = this.saleStatus;
		data['collection'] = this.collection;
		data['categoryText'] = this.categoryText;
		data['userId'] = this.userId;
		data['ageLimitText'] = this.ageLimitText;
		data['sourceType'] = this.sourceType;
		data['publicAddrProvinceText'] = this.publicAddrProvinceText;
		data['auditStatus'] = this.auditStatus;
		data['testReportFillStatus'] = this.testReportFillStatus;
		data['recommendStatus'] = this.recommendStatus;
		data['imgList'] = this.imgList;
		return data;
	}
}
