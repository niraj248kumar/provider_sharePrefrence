import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_share_pref/provider/provide_home.dart';
import 'package:provider_share_pref/register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Login Page')),
        ),
        body: Consumer<ProviderPages>(
          builder: (BuildContext context,  provider, Widget? child) {
            return Column(
              children: [
                TextField(
                  controller:provider.emailLogin,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Email'),
                ),
                TextField(
                  controller: provider.passwordLogin,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    onPressed: () {
                      provider.login_functio(context,provider.emailLogin.text,provider.passwordLogin.text);
                    },
                    child: Text('Login')),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                  },
                  child: Text(
                    'or Register',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );

  }

}
