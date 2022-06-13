class Carro {
  final String? color;
  final String? marca;
  final int? modelo;
  final String? placa;

  Carro({this.color, this.marca, this.modelo, this.placa});

  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      color: json['Color'],
      marca: json['marca'],
      modelo: json['modelo'],
      placa: json['placa'],
    );
  }
  @override
  String toString() {
    return 'Carro color: $color, marca: $marca, modelo: $modelo, placa: $placa';
  }
}
