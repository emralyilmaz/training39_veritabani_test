import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _personelTablo = "personel";
  String _sutunId = "id";
  String _sutunIsim = "isim";
  String _sutunAktif = "aktif";

  DatabaseHelper._internal();
  // isimli constructor oluşturuldu.
  // Tüm dunyada DataBaseHelper'ın isimli hali olarak internal kullanılır.

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  Future<Database> getDatabase() async {
    if (_database == null) {
      _database = await initDB();
      return _database;
    } else {
      return _database;
    }
  }

  initDB() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    // klasör yolu acılıyor.
    String path = join(klasor.path, "personel.db");
    // (join birleştirme yapacak, database'i oluşturulacak yere kadar olan yolu alıp,
    // database de yazıp birleştirilecek)

    var personelDB = await openDatabase(path, version: 1, onCreate: _createDB);
    // versiyon değişikliklerin kontrolü için var.
    // onCreate ise database açılırken tablo verilerini de aktarmak için var.

    return personelDB;
  }

  Future _createDB(Database db, int versiyon) async {
    await db.execute(
        "CREATE TABLE $_personelTablo($_sutunId INTEGER PRIMARY KEY AUTOINCREMENT), $_sutunIsim TEXT, $_sutunAktif TEXT)");
  }
}
