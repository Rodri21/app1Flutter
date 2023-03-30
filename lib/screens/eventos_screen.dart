import 'package:flutter/material.dart';
import 'package:programa1/screens/list_event.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social TEC :)'),
      ),
      body: ListEvent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addEvent').then((value) => {
            setState((){})
          });
        }, 
        label: const Text('Add event!'),
        icon: const Icon(Icons.add_comment),
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
                accountEmail: Text('rodrigo@gmial.com')),
            ListTile(
              onTap: () {},
              title: const Text('Practica 1'),
              subtitle: const Text('Descripcion de la practica'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}