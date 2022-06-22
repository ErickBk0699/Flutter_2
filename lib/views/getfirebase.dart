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
                  barrierColor: Colors.lightBlue,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.grey,
                    
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(image: NetworkImage(registros[index].image!)),
                        
                        const Text(''),
                        const Text('Datos de Usuario', style: TextStyle(fontWeight: FontWeight.bold) ),
                        
                        Text('Nombre y Apellidos : ${registros[index].nombre} ${registros[index].apellido}'),
                        
                        Text('Telefono :${registros[index].cel}'),
                        Text('Licencia : ${registros[index].licencia}'),

                        const Text(''),
                        const Text('Servicios', style: TextStyle(fontWeight: FontWeight.bold) ),
                        
                        Text('Lavado : ${registros[index].servicio?.lavado}'),
                        Text('Pulido : ${registros[index].servicio?.polish}'),
                        Text('Tapiceria :${registros[index].servicio?.tapiceria}'),

                        const Text(''),
                        const Text('Carro', style: TextStyle(fontWeight: FontWeight.bold) ),
                        
                        Text('Marco : ${registros[index].carro?.marca}'),
                        Text('Modelo : ${registros[index].carro?.modelo}'),
                        Text('Color :${registros[index].carro?.color}'),
                        Text('Placa :${registros[index].carro?.placa}'),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel', style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  void callDatabase() async {
    final response = await connection.getAllRegistros();
    if (!mounted) return;
    setState(() {
      registros = response.registros!;
    });
  }
}
