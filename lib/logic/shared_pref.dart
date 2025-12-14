import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future saveStringData(String key,String value)async{
    final SharedPreferences sharedpreferences =
    await SharedPreferences.getInstance();
    sharedpreferences.setString(key, value);
  }

  static Future saveIntData(String key,int value)async{
    final SharedPreferences sharedpreferences =
    await SharedPreferences.getInstance();
    sharedpreferences.setInt(key, value);
  }

  static Future getString(String key) async{
    final SharedPreferences sharedPreferences=
    await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  static Future getInt(String key) async{
    final SharedPreferences sharedPreferences=
    await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key);
  }

  static Future removeData(String key) async{
    final SharedPreferences sharedPreferences=
    await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }

  

}