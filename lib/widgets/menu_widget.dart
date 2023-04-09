import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              onTap: () {
                Navigator.pushNamed(context, '/dash');
              },
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
              title: const Text('Eventos'),
              leading: const Icon(Icons.event),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/theme');
              },
              title: const Text('Temas'),
              leading: const Icon(Icons.colorize),
              trailing: const Icon(Icons.chevron_right),
            )
          ],
        ),
      );
  }
}