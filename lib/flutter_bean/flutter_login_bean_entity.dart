class FlutterLoginBeanEntity {
	String msg;
	String code;
	FlutterLoginBeanData data;
	String error;

	FlutterLoginBeanEntity({this.msg, this.code, this.data, this.error});

	FlutterLoginBeanEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new FlutterLoginBeanData.fromJson(json['data']) : null;
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

class FlutterLoginBeanData {
	int completedInformation;
	int insuranceButton;
	int realNameVerify;
	String uuid;
	int userId;
	int xiaoyiArmyStatus;
	int xiaoyiArmyChatGroupId;

	FlutterLoginBeanData({this.completedInformation, this.insuranceButton, this.realNameVerify, this.uuid, this.userId, this.xiaoyiArmyStatus, this.xiaoyiArmyChatGroupId});

	FlutterLoginBeanData.fromJson(Map<String, dynamic> json) {
		completedInformation = json['completedInformation'];
		insuranceButton = json['insuranceButton'];
		realNameVerify = json['realNameVerify'];
		uuid = json['uuid'];
		userId = json['userId'];
		xiaoyiArmyStatus = json['xiaoyiArmyStatus'];
		xiaoyiArmyChatGroupId = json['xiaoyiArmyChatGroupId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['completedInformation'] = this.completedInformation;
		data['insuranceButton'] = this.insuranceButton;
		data['realNameVerify'] = this.realNameVerify;
		data['uuid'] = this.uuid;
		data['userId'] = this.userId;
		data['xiaoyiArmyStatus'] = this.xiaoyiArmyStatus;
		data['xiaoyiArmyChatGroupId'] = this.xiaoyiArmyChatGroupId;
		return data;
	}
}
