import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseConnection {
  //devuelve la instancia de la base de datos
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference instanceFirebase() {
    return _database.ref('/Registros');
  }
}
