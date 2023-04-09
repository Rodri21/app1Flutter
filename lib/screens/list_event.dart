import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:programa1/models/event_model.dart';
import 'package:programa1/provider/flags_provider.dart';
import 'package:programa1/widgets/event_detail.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/post_model.dart';

class ListEvent extends StatefulWidget {
  final DateTime date;
  const ListEvent({Key? key, required this.date}) : super(key: key);

  @override
  State<ListEvent> createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {

  DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }
  
  @override
  Widget build(BuildContext context) {

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return FutureBuilder(
      future: flag.getflagListEvent() == true ? database!.GETALLEVENTSBYDAY(widget.date) : database!.GETALLEVENTSBYDAY(widget.date),
      builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!.map((event) => ListTile(
              onTap: () {
                detalleEvento(context, event);
              },
              leading: const Icon(Icons.event), 
              title: Text(event.dscEvento, style: const TextStyle(fontSize: 18),),
              subtitle: Text('Fecha: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(event.fechaEvento!))}', style: const TextStyle(fontSize: 16)),
              trailing: const Icon(Icons.arrow_forward),
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              tileColor: getColorbyDate(event.fechaEvento!, event.completado!),
            )).toList(),
          );
        }else if(snapshot.hasError){
          return const Center(child: Text('Ocurrio un error'),);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Future<dynamic> detalleEvento(BuildContext context, EventModel event) {
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Detalle del evento'),
      content: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Descripcion:'),
                Text(event.dscEvento),
                const SizedBox(height: 15,),
                const Text('Estado:'),
                Text(event.completado == 1 ? 'completado' : 'pendiente'),
              ],
            ),
            Column(
              children: [
                botonCompletado(event, context),
                Row(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text('Cancel')),
                  const SizedBox(width: 8),
                  botonBorrar(event, context),
                ],),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  ElevatedButton botonCompletado(EventModel event, BuildContext context) {
    return ElevatedButton(onPressed: (){
      database?.UPDATEEVENT('tblEvent', {
        'idEvento' : event.idEvento,
        'completado' : 1,
      }).then((value) {
        var msg = value > 0 
            ? 'Evento actualizado' 
            : 'Ocurrió un error';
          var snackBar = SnackBar(
            content: Text(msg)
          );
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      setState(() {});
    }, child: const Text('Marcar como completado'));
  }

  ElevatedButton botonBorrar(EventModel event, BuildContext context) {
    return ElevatedButton(onPressed: (){
      database!.DELETEEVENT('tblEvent',event.idEvento!).then((value){
        var msg = value > 0 
          ? 'Evento borrado' 
          : 'Ocurrió un error';
        var snackBar = SnackBar(
          content: Text(msg)
        );
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      setState(() {});
    }, child: const Text('Borrar'));
  }
  
  getColorbyDate(String fechaEvento, int completado) {
    Color color = Colors.white;
    DateTime date = DateTime.parse(fechaEvento);
    DateTime today = DateTime.now();
    Duration difference = date.difference(DateTime.now());

    if(difference <= const Duration(days: 2)){ 
      if(difference.inDays.isNegative){ 
        if (completado==0) {  //hasPassed
          color = Colors.red; 
        } else{
          color = Colors.green;
        }
      } else{
        color = Colors.amber; //isTwoDaysOrLessAway
      }
    }
    if (date.year == today.year &&  
      date.month == today.month &&
      date.day == today.day) {
      color = Colors.green; //isToday
    }
    return color;
  }
}
