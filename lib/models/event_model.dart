class EventModel {
  int? idEvento;
  String? dscEvento;
  String? fechaEvento;
  int? completado;

  EventModel({this.idEvento, this.dscEvento, this.fechaEvento, this.completado});

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
        idEvento: map['idEvento'],
        dscEvento: map['dscEvento'],
        fechaEvento: map['fechaEvento'],
        completado: map['completado']
    );
  }
}
