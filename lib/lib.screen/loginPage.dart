import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
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
              "Welcome in Login Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 5),
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 20,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: " Enter username",
                        labelText: "Username",
                        prefixIcon: Icon(Icons.account_circle_rounded)),
                  ),
                  TextFormField(
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 12,
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
                  ElevatedButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      int count = 0;
                      print("Hello");
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
