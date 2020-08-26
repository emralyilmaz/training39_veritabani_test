import 'package:flutter/material.dart';
import 'package:training39_veritabani_test/models/personel.dart';
import 'package:training39_veritabani_test/tools/database.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dbhelper;
  var per;

  @override
  void initState() {
    super.initState();
    dbhelper = DatabaseHelper();
    ekle();
    guncelle();
  }

  @override
  Widget build(BuildContext context) {
    goster();
    return Container();
  }

  ekle() async {
    per = Personel(isim: "Ali", aktif: true);
    await dbhelper.personelEkle(per);
  }

  goster() async {
    var s = await dbhelper.personelleriGetir();
    print(s);
  }

  guncelle() async {
    per.isim = "Osman";
    await dbhelper.personeliGuncelle(per);
  }
}
