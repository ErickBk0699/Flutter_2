import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/Entities/registros.dart';

import '../domain/firebase_connection.dart';

class GetFireBase extends StatefulWidget {
  const GetFireBase({Key? key}) : super(key: key);

  @override
  State<GetFireBase> createState() => _GetFireBaseState();
}

class _GetFireBaseState extends State<GetFireBase> {
  final connection = FirebaseConnection();
  List<Registros> registros = [];
  @override
  Widget build(BuildContext context) {
    callDatabase();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Marcas de Carro"),
        ),
        body: ListView.builder(
            itemCount: registros.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: Image.network(registros[index].image!).image,
                ),
                title: Text(
                    "${registros[index].nombre!} ${registros[index].apellido!}"),
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                        "${registros[index].nombre!} ${registros[index].apellido!}"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(image: NetworkImage(registros[index].image!)),
                        Text(
                            '${registros[index].servicio.toString()}\n\n${registros[index].carro}'),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  void callDatabase() async {
    final response = await connection.getAllRegistros();
    setState(() {
      registros = response.registros!;
    });
  }
}
