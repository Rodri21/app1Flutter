import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:programa1/models/post_model.dart';
import 'package:programa1/provider/flags_provider.dart';
import 'package:provider/provider.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  final PostModel? objPostModel;

  final DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    const avatar = CircleAvatar(
      backgroundImage: AssetImage('assets/logo.png'),
    );

    const txtUser = Text('Rodrigo');
    final datePost = Text(objPostModel!.datePost!.toString());
    const imgPost = Image(image: AssetImage('assets/logo.png'), height: 100,);
    final txtDesc = Text(objPostModel!.dscPost!.toString());
    const iconRate = Icon(Icons.rate_review);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
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
              Expanded(child: Container()),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.edit)
              ),
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmar Borrado'),
                      content: const Text('Deseas borrar el post?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            database.DELETE('tblPost', 'idPost',objPostModel!.idPost!).then(
                              (value) => flag.setflagListPost()
                            );
                            Navigator.pop(context);
                          }, 
                          child: const Text('Si')
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: const Text('No')
                        )
                      ],
                    ),
                  );
                }, 
                icon: const Icon(Icons.delete)
              ),
            ],
          )
        ],
      ),
    );
  }
}