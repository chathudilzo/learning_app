import 'package:learning_app/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _prefs;


  Future<StorageService> init()async {
    _prefs=await SharedPreferences.getInstance();
    return this;

  }


  Future<bool>setBool(String key,bool value)async{
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConstatnts.STORAGE_DEVICE_OPEN_FIRST_TIME)?? false;
  }
}