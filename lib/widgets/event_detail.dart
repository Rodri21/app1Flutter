import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';

import '../models/event_model.dart';

class EventDetailWidget extends StatefulWidget {
  final EventModel objEventModel;
  const EventDetailWidget({super.key, required this.objEventModel});
  

  @override
  State<EventDetailWidget> createState() => _EventDetailWidgetState();
}

class _EventDetailWidgetState extends State<EventDetailWidget> {
  final DatabaseHelper database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: true,
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(35),
            height: 450,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(color: Colors.black)
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Descripcion del evento:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 240,
                  child: Text(widget.objEventModel.dscEvento)
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text('Cancelar'),
                    ),
                    const SizedBox(width: 15,),
                    ElevatedButton( 
                      onPressed: (){
                        database.DELETE('tblEvent','idEvent',widget.objEventModel.idEvento!).then((value){
                          var msg = value > 0 
                            ? 'Registro borrado' 
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}