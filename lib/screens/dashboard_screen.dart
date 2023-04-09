import 'package:flutter/material.dart';
import 'package:programa1/screens/list_post.dart';
import 'package:programa1/widgets/menu_widget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social TEC :)'),
      ),
      body: const ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addPost').then((value) => {
            setState((){})
          });
        }, 
        label: const Text('Add post!'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: const MenuWidget(),
    );
  }
}
