import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_1/models/models.dart';
import 'package:taller_1/pages/settings_page.dart';
import 'package:taller_1/services/data_provider.dart';
import 'package:taller_1/utils/preferences.dart';
import 'package:taller_1/utils/utils.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models/models.dart';
import '../models/models.dart';
import '../services/content_provider.dart';
import '../services/content_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Cities _list;
  Preferences prefs = new Preferences();
  DataProvider service = new DataProvider();
  

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final _contentProvider = Provider.of<ContentProvider>(context);
    _contentProvider.initScale(prefs.scale);
    
    return Scaffold(
      appBar: AppBar(
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value.key == "config") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                }
              },
              itemBuilder: (BuildContext context) {
                return mainActions.map((MenuItem option) {
                  return PopupMenuItem<MenuItem>(
                      value: option,
                      child: Row(
                        children: [
                          Icon(option.icon,
                              color: Theme.of(context).primaryColor),
                          SizedBox(width: 14.0),
                          Text(option.title)
                        ],
                      ));
                }).toList();
              },
            ),
          ],
          title: Text("Temperaturas",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(color: Colors.white))),
      body: _list == null
          ? Container(child: Center(child: Text("Cargando datos")))
          : ListView(
              children: _list.items.map((e) {
              return _getItem(e);
            }).toList()),
    );
  }

  Widget _getItem(City city) {
    return GestureDetector(
      child: Card(
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColorDark,
        child: ListTile(
            leading: Icon(WeatherIcons.thermometer),
            trailing: Text( transform(prefs.scale, city.values.temp)),
            title: Text(city.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Mínima: " + transform(prefs.scale, city.values.tempMin)),

                Text("Máxima: " + transform(prefs.scale, city.values.tempMax)),
              ],
            )),
      ),
    );
  }
  void loadData(){
    service.getData().then((value) {
       setState(() {
          _list = value;
          print(value);
       });
    });
  }
}
