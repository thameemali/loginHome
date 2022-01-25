import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_home_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  String userName = "";
  String password = "";
  final String validUsername = "admins";
  final String validPassword = "123456";

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/plainblue.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: const Color(0x8c461f78),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z]'),
                      )
                    ],
                    controller: _userController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.deepOrange,
                    decoration: InputDecoration(
                      errorText: userName.isEmpty
                          ? 'Enter username'
                          : userName == validUsername
                              ? null
                              : 'Enter valid Username',
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    controller: _passwordController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.deepOrange,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: password.isEmpty
                          ? 'Enter password'
                          : password == validPassword
                              ? null
                              : 'Enter Valid Password',
                      labelText: 'Password',
                      labelStyle:
                          const TextStyle(color: Colors.deepOrangeAccent),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent)),
                    onPressed: () {
                      setState(() {
                        userName = _userController.text;
                        password = _passwordController.text;
                      });
                      if (userName == validUsername &&
                          password == validPassword) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//used for dismissing the keyboard when not using

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
