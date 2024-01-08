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

    Future<bool>setString(String key,String value)async{
    return await _prefs.setString(key, value);
  }

  bool getIsLogedIn(){
    return _prefs.getString(AppConstatnts.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  Future<bool> removeLog(String key){
    return _prefs.remove(key);
  }

}