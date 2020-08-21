import 'package:backend_app/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sharedPreferences;

  @override
  void initState() { 
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product'),
          centerTitle: true,
          actions: [
            FlatButton(
              onPressed: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: Icon(Icons.power_settings_new),
            )
          ],
        ),
        body: Center(
          child: Text('Main Body'),
        ),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('NodeJs'), accountEmail: Text('Email')),
            ListTile(
              title: Text('List Products'),
              trailing: Icon(Icons.list),
              onTap: () {},
            ),
            ListTile(
              title: Text('Add Products'),
              trailing: Icon(Icons.add),
              onTap: () {},
            ),
            ListTile(
              title: Text('Register user'),
              trailing: Icon(Icons.add),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.clear),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ]),
        ));
  }
}
