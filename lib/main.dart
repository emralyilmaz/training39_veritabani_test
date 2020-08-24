import 'package:flutter/material.dart';
import 'package:training39_veritabani_test/models/personel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Personel per = Personel.withID(id: 1, isim: "Ali", aktif: true);
    Map m = per.toMap();
    print(m);

    Personel kopya = Personel.formMap(m);
    print(kopya);
    return Container();
  }
}
