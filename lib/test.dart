// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:programa1/models/event_model.dart';
import 'package:programa1/screens/list_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  DateTime selectedDay = DateTime.now();
  Map<DateTime,List<EventModel>> selectedEvents = {};
  final TextEditingController _eventController = TextEditingController();
  final DatabaseHelper database = DatabaseHelper();
  EventModel? objEventModel;

  void fillMap(){
    //selectedEvents[selectedDay]!.add(EventModel(dscEvento:objEventModel!.dscEvento, fechaEvento: objEventModel!.fechaEvento, completado: objEventModel!.completado));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      selectedDay = day;
    });
    fillMap();
  }

  CalendarStyle _calendarStyle(){
    return const CalendarStyle(
      isTodayHighlighted: true,
    );
  }

  String stringDate(DateTime date){
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose(){
    _eventController.dispose();
    super.dispose();
  }

  List<EventModel> _getEventsFromDay(DateTime date){
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('Social TEC :)'),
      ),
      body: SingleChildScrollView(
        child: Column(
           mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 400,
              child: TableCalendar( 
                rowHeight: 50,
                headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true), 
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (date)=>isSameDay(date, selectedDay),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
                focusedDay: selectedDay,
                eventLoader: _getEventsFromDay,
                calendarStyle: _calendarStyle(),
              ),
            ),
            //ListEvent(),
            /*..._getEventsFromDay(selectedDay).map((e) => ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/eventDetail');
              },
              leading: const Icon(Icons.event), 
              title: Text(e.dscEvento, style: const TextStyle(fontSize: 18),),
              subtitle: Text('Fecha: ${e.fechaEvento}', style: const TextStyle(fontSize: 16),),
              trailing: const Icon(Icons.arrow_forward),
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            )),*/
            SizedBox(
              height: 50,
              child: Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(context: context, builder: (context) => AlertDialog(
            title: const Text('Add event'),
            content: TextFormField(controller: _eventController,),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text('Cancel')),
              TextButton(onPressed: () {
                database.INSERT('tblEvent',{
                  'dscEvento' : _eventController.text,
                  'fechaEvento' : selectedDay.toIso8601String(),
                  'completado' : 0,
                }).then((value){
                  var msg = value > 0 
                    ? 'Evento agregado' 
                    : 'Ocurrió un error';
                  var snackBar = SnackBar(
                    content: Text(msg)
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              }, child: const Text('Ok')),
            ],
          ));
        }, 
        label: const Text('Add event!'),
        icon: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://previews.123rf.com/images/dclipart/dclipart1612/dclipart161200025/69075752-logotipo-de-la-mascota-del-lince-jefe-de-lince-aislado-en-blanco-ilustraci%C3%B3n-vectorial.jpg'),
                ),
                accountName: Text('Rodrigo Salazar'),
                accountEmail: Text('rodrigo@gmail.com')),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/dash');
              },
              title: const Text('Dashboard'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}


/*
ElevatedButton(
  onPressed: (){
    database.INSERT('tblEvent',{
      'dscEvento' : txtConEvent.text,
      'fechaEvento' : today,
      'completado' : 0,
    }).then((value){
      var msg = value > 0 
        ? 'Registro insertado' 
        : 'Ocurrió un error';
      var snackBar = SnackBar(
        content: Text(msg)
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    Navigator.pop(context);
  }, 
  child: const Text('Borrar')
),
 */


    /*
    if(_eventController.text.isEmpty){
      Navigator.pop(context);
      return;
    } else{
      if (selectedEvents[selectedDay]!=null) {
        selectedEvents[selectedDay]!.add(EventModel(dscEvento:_eventController.text, fechaEvento: stringDate(selectedDay), completado: 0));
      } else{
        selectedEvents[selectedDay] = [
          EventModel(dscEvento: _eventController.text)
        ];
      }
      Navigator.pop(context);
      _eventController.clear();
      setState(() {});
      return;
    }

    */ 
