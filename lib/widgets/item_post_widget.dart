import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:programa1/models/post_model.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  PostModel? objPostModel;
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    final avatar = CircleAvatar(
      backgroundImage: AssetImage('assets/logo.png'),
    );

    final txtUser = Text('Rodrigo');
    final datePost = Text('06-03-2023');
    final imgPost = Image(image: AssetImage('assets/logo.png'), height: 100,);
    final txtDesc = Text('Aqui va el contenido del post:');
    final iconRate = Icon(Icons.rate_review);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      decoration: 
      BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
        child: Column(children: [
          Row(children: [
            avatar,
            txtUser,
            datePost
          ],),
          Row(children: [
            imgPost,
            txtDesc
          ],),
          Row(
            children: [
              iconRate,
              IconButton(onPressed: (){

              }, icon: Icon(Icons.edit)),
              Expanded(child: Container()),
              IconButton(onPressed: (){
                database.DELETE('tblPost', objPostModel!.idPost!);
              }, icon: Icon(Icons.delete)),
            ],
          )
        ],
      ),
    );
  }
}