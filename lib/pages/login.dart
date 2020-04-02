import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    height = 600.0;
                  });
                },
                child: AnimatedSize(
                  curve: Curves.linear,
                  child: SvgPicture.asset(
                    'assets/account.svg',
                    height: height,
                  ),
                  duration: new Duration(milliseconds: 200),
                  vsync: this,
                ),
              ),
            ),
            Opacity(
              opacity: height == 600 ? 1 : 0,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    height = 100.0;
                  });
                },
                child: Text('Login'),
              ),
            )
          ],
        ),
      ),    
    );
  }
}