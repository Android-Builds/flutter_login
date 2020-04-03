import 'package:flutter/material.dart';
import 'package:login/constatnts.dart';

bool passwordVisible = true;

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key, @required this.user, @required this.pass}) : super(key: key);
  final TextEditingController user;
  final TextEditingController pass;
  
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: widget.user,
                  onChanged: (text) {
                    userid = widget.user.text;
                  },
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle (
                      color: Colors.white
                    ),
                    hintText: 'Enter your Username',
                    hintStyle: TextStyle (
                      color: Colors.grey
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: widget.pass,
                  onChanged: (text) {
                    password = widget.pass.text;
                  },
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle (
                      color: Colors.white
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle (
                      color: Colors.grey
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}