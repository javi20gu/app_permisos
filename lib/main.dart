import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:permisos_app/src/providers/provider_permis.dart';
import 'package:permisos_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => Permis(
        propietario: {
          "r": false,
          "w": false,
          "x": false
        },
        grupo: {
          "r": false,
          "w": false,
          "x": false
        },
        otros: {
          "r": false,
          "w": false,
          "x": false
        }
      ),
      child: MaterialApp(
        title: 'Permisos',
        initialRoute: '/',
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
