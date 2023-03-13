import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:provider/provider.dart';

final TextEditingController txtConPost = TextEditingController();

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
          border: Border.all(color: Colors.black)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Post :)'),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
              controller: txtConPost,
              maxLines: 8,
            ),
            ElevatedButton(onPressed: () {
              database.INSERT('tblPost', {
                'dscPost': txtConPost.text,
                'datePost':DateTime.now().toString()
              }).then((value) {
                var msg = value > 0
                  ? 'Registro insertado'
                  : 'Ocurrio un error';
                var snackBar = SnackBar(
                  content: Text(msg)
                );

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              });
            }, child: Text('Save')),
          ],            
        ),
      ),
    );
  }
}