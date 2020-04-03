import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/constatnts.dart';
import 'package:login/pages/nextpage.dart';
import 'package:login/widgets/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool rememberMe;
  final user = new TextEditingController();
  final pass = new TextEditingController();

  double _sigmaX = 2.0; // from 0-10
  double _sigmaY = 2.0; // from 0-10
  double _opacity = 0.0; // from 0-1.0

  login() {
    print('called');
    if(userid == 'admin' && password == 'password') {
      _setRememberMe(rememberMe);
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => NextPage()));
    } else {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Wrong Username or Password !'))
      );
    }
  }

  void initState() {
    super.initState();
    rememberMe = false;
  }

  _setRememberMe(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', value);
  }

  var height = 600.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                child: Container(
                  color: Colors.black.withOpacity(_opacity),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Column(
                children: <Widget>[
                  LoginWidget(user: null, pass: null),
                  SizedBox(height: 80.0),
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      height: 50.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),    
    );
  }
}