import 'package:akemall/utility/my_style.dart';
import 'package:akemall/utility/normal_dialog.dart';
import 'package:akemall/widget/show_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field
  String loginString = '...';
  Widget currentWidget = ShowList();

  // Method
  Widget menuShowList() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
      ),
      title: Text('Show List'),
      subtitle: Text('Show List from Firestore'),
      onTap: () {},
    );
  }

  Widget menuAddData() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
      ),
      title: Text('Add Data'),
      subtitle: Text('Add Data to Firestore'),
      onTap: () {},
    );
  }

  Widget menuQRCode() {
    return ListTile(
      leading: Icon(
        Icons.filter_3,
        size: 36.0,
      ),
      title: Text('QR Code'),
      subtitle: Text('Read QR Code or Barcode'),
      onTap: () {
        Navigator.of(context).pop();
        readQRthread();
      },
    );
  }

  Future<void> readQRthread() async{

    try {
      
      String codeReaded = await BarcodeScanner.scan();

      if (codeReaded != null) {
        normalDialog(context, 'Code Readed', 'Code = $codeReaded');
      }

    } catch (e) {
        normalDialog(context, 'Code Readed', 'Cannot Read');
    }

  }

  Widget menuExit() {
    return ListTile(
      leading: Icon(
        Icons.filter_4,
        size: 36.0,
      ),
      title: Text('Exit'),
      subtitle: Text('Exit The Program'),
      onTap: () {},
    );
  }

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      loginString = firebaseUser.displayName;
    });
    print('login = $loginString');
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text('Ake Mall');
  }

  Widget showLogin() {
    return Text('Login by $loginString');
  }

  Widget headDrawer() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headDrawer(),
          menuShowList(),
          menuAddData(),
          menuQRCode(),
          menuExit(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('My Service'),
      ),
      body: currentWidget,
      drawer: showDrawer(),
    );
  }
}
