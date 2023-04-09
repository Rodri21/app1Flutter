// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:programa1/models/event_model.dart';
import 'package:programa1/screens/list_event.dart';
import 'package:programa1/widgets/menu_widget.dart';
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

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      selectedDay = day;
    });
  }

  CalendarStyle _calendarStyle(){
    return const CalendarStyle(
      isTodayHighlighted: true,
    );
  }

  List<EventModel> _getEventsFromDay(DateTime date){
    return selectedEvents[date] ?? [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('Social TEC :)'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 330,
            child: TableCalendar( 
              rowHeight: 40,
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
          Expanded(child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 70),
            child: ListEvent(date: selectedDay),
          )),
        ],
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
                  setState(() {});
                });
              }, child: const Text('Ok')),
            ],
          ));
        }, 
        label: const Text('Add event!'),
        icon: const Icon(Icons.add),
      ),
      drawer: const MenuWidget(),
    );
  }
}
