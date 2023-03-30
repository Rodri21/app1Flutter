import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';

class AddEventScreen extends StatelessWidget {
  AddEventScreen({super.key});

  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    final txtConEvent = TextEditingController();

    return Scaffold(
    body: Center(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        height: 350,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black)
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Event :)'),
            TextFormField(
              controller: txtConEvent, 
              maxLines: 8,
            ),
            ElevatedButton(
              onPressed: (){
                database.INSERT('tblEvent',{
                  'dscEvento' : txtConEvent.text,
                  'fechaEvento' : DateTime.now().toString(),
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

              }, 
              child: Text('Save Event')
            )
          ],
        ),
      ),
    ),
    );
  }
}