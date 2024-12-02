import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../register/Login_page.dart';
import '../share_pref/home_page.dart';

class ProviderPages with ChangeNotifier{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  TextEditingController insertDataController = TextEditingController();
  TextEditingController updateName= TextEditingController();
  bool isLogin = false;

   List<String> itemList = [];

  void register_splash(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isRegister = pref.getBool('isLogin');
    if(isRegister != null && isRegister){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),
      );
    }else{
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage(),),

      );
    }
  }

  void registerUser(BuildContext context,String name, String email, String password) async{
    // var name = nameController.text;
    // var email = emailController.text;
    // var password = passwordController.text;
    var pref = await SharedPreferences.getInstance();
    if(name.isNotEmpty&&email.isNotEmpty&&password.isNotEmpty){
      pref.setString('name', name);
      pref.setString('email', email);
      pref.setString('password', password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));

      Fluttertoast.showToast(msg: 'Registation  Success');
    }else{
      Fluttertoast.showToast(msg: 'Registation Not Success');

    }
  }

  void login_functio(BuildContext context, String email, String password) async {
    var prefLogin = await SharedPreferences.getInstance();
    var userEmail = prefLogin.getString('email');
    var userPassword = prefLogin.getString('password');

    if (email == userEmail && password == userPassword) {
      prefLogin.setBool('isLogin', true);
      Fluttertoast.showToast(msg: 'Login Success');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      Fluttertoast.showToast(msg: 'Login not Success');
    }
  }

  // void getData() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   notifyListeners();
  // }

  void insertData(String item) async{
    SharedPreferences  pref =  await SharedPreferences.getInstance();
    itemList.add(item);
    pref.setStringList('item', itemList);
    notifyListeners();

  }
  void updateUser(int index,String newItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    itemList[index] = newItem;
    prefs.setStringList('items', itemList);
    updateName.clear();
    notifyListeners();
  }
  void deleteUser(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    itemList.removeAt(index);
    prefs.setStringList('items', itemList);
    notifyListeners();
  }
}