import 'package:akemall/scaffold/register.dart';
import 'package:akemall/utility/my_style.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // Method
  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: MyStyle().textColor,
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text(
          'Sign Up',
          style: TextStyle(color: MyStyle().textColor),
        ),
        onPressed: () {
          print('You Click');

          MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext buildContext){return Register();},);
          Navigator.of(context).push(materialPageRoute);

        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          signInButton(),
          SizedBox(
            width: 10.0,
          ),
          signUpButton(),
        ],
      ),
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(labelText: 'User : '),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password : '),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ake Mall',
      style: TextStyle(
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        color: MyStyle().textColor,
        fontFamily: MyStyle().fontName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
                          child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    showAppName(),
                    userForm(),
                    passwordForm(),
                    SizedBox(
                      height: 8.0,
                    ),
                    showButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
