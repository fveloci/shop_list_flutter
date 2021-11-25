import 'package:flutter/material.dart';
import 'package:shop_list/utils/login_service.dart';
import 'package:shop_list/utils/textApp.dart';
import 'package:shop_list/widgets/design/design_widgets.dart';

import 'login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

_drawerHome(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              gradient: DesignWidgets.linearGradientMain(context),
            ),
            child: Text(
              'Nombre de usuario',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
        ListTile(
            onTap: () => {
                  LoginService().signOutGoogle(),
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }))
                },
            leading: Icon(Icons.logout),
            title: Text(
              TextApp.LOGOUT,
              style: TextStyle(color: Colors.black),
            ))
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(), body: Center(), drawer: _drawerHome(context)),
    );
  }
}
