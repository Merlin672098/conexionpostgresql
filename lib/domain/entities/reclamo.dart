import 'dart:convert';

class Reclamo {
  final String id;
  final String descripcion;
  final String descripcionSitio;
  final int idServicio;

  Reclamo({
    required this.id,
    required this.descripcion,
    required this.descripcionSitio,
    required this.idServicio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
      'descripcionSitio': descripcionSitio,
      'idServicio': idServicio,
    };
  }

  factory Reclamo.fromMap(Map<String, dynamic> map) {
    return Reclamo(
      id: map['_id'] ?? '',
      descripcion: map['descripcion'] ?? '',
      descripcionSitio: map['descripcionSitio'] ?? '',
      idServicio: map['idServicio'] as int? ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reclamo.fromJson(String source) => Reclamo.fromMap(json.decode(source));

  Reclamo copyWith({
    String? id,
    String? descripcion,
    String? descripcionSitio,
    int? idServicio,
  }) {
    return Reclamo(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      descripcionSitio: descripcionSitio ?? this.descripcionSitio,
      idServicio: idServicio ?? this.idServicio,
    );
  }
}
