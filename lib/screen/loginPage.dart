import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utils/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/image/pic1.png',
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
                    ),
                    TextFormField(
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.visiblePassword,
                      maxLength: 20,
                      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      obscureText: true,

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
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
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
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // shape: changeButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 9)),
                      ),
                    )
                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
