// ignore_for_file: file_names

class MyData {
  String? previous;
  String? next;
  List<Results>? results;

  MyData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['previous'] = previous;
    data['next'] = next;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? folio;
  String? tipo;
  String? cliente;
  String? pieza;

  Results.fromJson(Map<String, dynamic> json) {
    folio = json['folio'];
    tipo = json['tipo'];
    cliente = json['cliente'];
    pieza = json['pieza'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['folio'] = folio;
    data['tipo'] = tipo;
    data['cliente'] = cliente;
    data['pieza'] = pieza;
    return data;
  }
}
