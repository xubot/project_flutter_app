class FlutterBannerEntity {
  String msg;
  String code;
  String error;
  List<Data> data;

  FlutterBannerEntity({this.msg, this.code, this.error, this.data});

  FlutterBannerEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String img;
  String url;
  int type;
  int status;
  String createTime;
  int sort;

  Data({this.id,
    this.img,
    this.url,
    this.type,
    this.status,
    this.createTime,
    this.sort});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    url = json['url'];
    type = json['type'];
    status = json['status'];
    createTime = json['createTime'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['url'] = this.url;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createTime'] = this.createTime;
    data['sort'] = this.sort;
    return data;
  }
}