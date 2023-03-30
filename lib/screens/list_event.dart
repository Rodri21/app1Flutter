import 'package:flutter/material.dart';
import 'package:programa1/database/database_helper.dart';
import 'package:programa1/models/event_model.dart';
import 'package:programa1/provider/flags_provider.dart';
import 'package:programa1/widgets/item_event_widget.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({super.key});

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
      future: flag.getflagListEvent() == true ? database!.GETALLEVENTS() : database!.GETALLEVENTS(),
      builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
              var objEventModel = snapshot.data![index];
              return ItemEventWidget(objEventModel:objEventModel);
            },
          );
        }else if(snapshot.hasError){
          return const Center(child: Text('Ocurrio un error'),);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}