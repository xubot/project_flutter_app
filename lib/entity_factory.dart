import 'package:project_flutter_app/flutter_bean/flutter_banner_entity.dart';
import 'package:project_flutter_app/flutter_bean/flutter_login_bean_entity.dart';
import 'package:project_flutter_app/flutter_bean/flutter_recomlist_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "FlutterBannerEntity") {
      return FlutterBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "FlutterLoginBeanEntity") {
      return FlutterLoginBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "FlutterRecomlistBeanEntity") {
      return FlutterRecomlistBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}