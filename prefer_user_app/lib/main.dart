import 'package:flutter/material.dart';
import 'package:prefer_user_app/src/pages/home_page.dart';
import 'package:prefer_user_app/src/pages/settings_page.dart';
import 'package:prefer_user_app/src/share_prefs/prefs_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PrefsUser();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PrefsUser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => SettingsPage()
      },
    );
  }
}
