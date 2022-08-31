import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = "";
  bool changeButton = false;

  moveTOHome(BuildContext context) async {
    // UI Changes
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/image/hey.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                  // child: Text("data")
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 5,
                  // child: Text("data")
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 5),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          name = val;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            hintText: " Enter username",
                            labelText: "Username",
                            prefixIcon: Icon(Icons.account_circle_rounded)),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Username cannot be empty";
                          }
                        },
                      ),
                      TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 20,
                        // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 8) {
                            return "Password length should be atleat 8";
                          }
                        },
                        onTap: () {
                          print("Hello");
                        },
                        // obscuringCharacter:
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 9),
                        child: InkWell(
                          onTap: () => moveTOHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
