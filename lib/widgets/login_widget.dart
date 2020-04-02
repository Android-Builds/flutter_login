import 'package:flutter/material.dart';
import 'package:login/constatnts.dart';
import 'package:login/widgets/theme.dart';

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
                    hintText: 'Enter your Username',
                    fillColor: getTheme(context) == 'dark' ? 
                      Colors.grey[900] : Colors.grey[300],
                    filled: true,
                    border: InputBorder.none,
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
                    hintText: 'Enter your password',
                    fillColor: getTheme(context) == 'dark' ? 
                      Colors.grey[900] : Colors.grey[300],
                    filled: true,
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                        color: Colors.grey[600],
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