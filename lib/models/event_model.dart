class EventModel {
  int? idEvento;
  String dscEvento;
  String? fechaEvento;
  int? completado;

  EventModel({this.idEvento, required this.dscEvento, this.fechaEvento, this.completado});

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
        idEvento: map['idEvento'],
        dscEvento: map['dscEvento'],
        fechaEvento: map['fechaEvento'],
        completado: map['completado']
    );
  }

  void insert(){
    String query = '''INSERT INTO tblEvent(dscEvento, fechaEvento, completado) 
      VALUES ('Nombre del evento', '2023-04-01', 0);''';
  }
}
