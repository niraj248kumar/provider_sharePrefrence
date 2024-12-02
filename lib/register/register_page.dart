import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_share_pref/provider/provide_home.dart';
import 'package:provider_share_pref/register/Login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Register')),),
        body: Consumer<ProviderPages>(
          builder: (BuildContext context, provider, Widget? child) {
            return Column(
              children: [
                TextField(controller: provider.nameController,decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter Name'),),
                TextField(controller: provider.emailController   ,decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter Email'),),
                TextField(controller: provider.passwordController,decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter Password'),),
                SizedBox(height: 20,),
                OutlinedButton(onPressed: () {
                  provider.registerUser(context, provider.nameController.text, provider.emailController.text, provider.passwordController.text);
                }, child: const Text('Register')),
                SizedBox(height: 50,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),));
                  },child:Text('or Login', style: TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold),),
                )
              ],
            );
          },

        ),
      ),
    );
  }

}
