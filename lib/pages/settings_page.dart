import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/content_provider.dart';
import '../services/content_provider.dart';
import '../services/content_provider.dart';
import '../utils/preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Preferences pref = new Preferences();
  
  @override
  Widget build(BuildContext context) {
    final contentProvider = Provider.of<ContentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("Celsius"),
            leading: Checkbox(value: pref.scale, onChanged: (value) {
              pref.scale = value;
              contentProvider.scale = pref.scale;
              if(pref.scale){
                    print("Modo True");
                  } else {
                    print("Modo False");
                  }
                  setState(() {});
            }),
          )
        ],
      ),
    );
  }
}
