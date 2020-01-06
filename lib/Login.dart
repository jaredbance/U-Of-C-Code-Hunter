import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Globals.dart' as Globals;

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      )
    );

    final passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      )
    );

    final loginButton = Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {login("test", "test");},
        child: Text("Login",
          textAlign: TextAlign.center
        )
      )
    );

    return Scaffold(
      body: Center(
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(height: 25.0),
                  loginButton
                ]
            )
          )
        )
      )
    );
  }

  Future<void> login(String username, String password) async {
    var url = "http://" + Globals.serverIP + "/login.php";
    var body = {'usernmae': username, 'password': password};
    var response = await http.post(url, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

}