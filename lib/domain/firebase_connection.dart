import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../Entities/response_firebase.dart';

class FirebaseConnection {
  //devuelve la instancia de la base de datos
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference instanceFirebase() {
    return _database.ref('/Registros');
  }

  Future<ResponseFirebase> getAllRegistros() async {
    try {
      DatabaseReference _registros = instanceFirebase();
      DataSnapshot response = await _registros.get();
      final responseMap = Map<String, dynamic>.from(response.value as Map);
      final registers = ResponseFirebase.fromJson(responseMap.values.toList());
      return registers;
    } catch (e) {
      rethrow;
    }
  }
}
