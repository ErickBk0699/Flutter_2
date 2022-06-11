import 'package:flutter_application_2/Entities/servicio.dart';

import 'carro.dart';

class Registros {
  final Carro? carro;
  final Servicio? servicio;
  final String? apellido;
  final int? cel;
  final String? licencia;
  final String? nombre;
  final String? image;

  Registros(
      {this.carro,
      this.servicio,
      this.apellido,
      this.cel,
      this.licencia,
      this.nombre,
      this.image});

  factory Registros.fromJson(Map<String, dynamic> json) {
    return Registros(
      carro: json['carro'] != null ? Carro.fromJson(json['carro']) : null,
      servicio:
          json['servicio'] != null ? Servicio.fromJson(json['servicio']) : null,
      apellido: json['apellido'],
      cel: json['cel'],
      licencia: json['licencia'],
      nombre: json['nombre'],
      image: json['image'],
    );
  }
}
