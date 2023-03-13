import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:programa1/provider/theme_provider.dart';
import 'package:programa1/screens/list_post.dart';
import 'package:programa1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social TEC :)'),
      ),
      body: ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) => {
            setState((){})
          });
        }, 
        label: const Text('Add post!'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
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
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setthemeData(StylesSettings.spaceTheme(context))
                    : theme.setthemeData(StylesSettings.darkTheme(context));
                this.isDarkModeEnabled = isDarkModeEnabled;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
