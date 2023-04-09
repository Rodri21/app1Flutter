import 'package:flutter/material.dart';
import 'package:programa1/widgets/menu_widget.dart';
import 'package:programa1/screens/responsive.dart';
import 'package:programa1/widgets/loading_modal_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../provider/theme_provider.dart';
import '../settings/styles_settings.dart';


class themeScreen extends StatefulWidget {
  const themeScreen({super.key});

  @override
  State<themeScreen> createState() => _themeScreenState();
}

class _themeScreenState extends State<themeScreen> {
  bool isLoading = false;
  
  final spaceHorizontal = const SizedBox(
    height: 10,
  );

  Future<void> _saveThemeData(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    final Widget themeDarkButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: () async {
          theme.setthemeData(StylesSettings.darkTheme(context));
          await _saveThemeData('dark');
        }, 
        child: const Text(
          'Dark theme', 
          style: TextStyle(fontSize: 20),
        ),
      ),
    );

    final themeLightButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: () async {
          theme.setthemeData(StylesSettings.lightTheme(context));
          await _saveThemeData('light');
        }, 
        child: const Text(
          'Light theme', 
          style: TextStyle(fontSize: 20),
        ),
      ),
    );

    final themeCustomButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: () async {
          theme.setthemeData(StylesSettings.spaceTheme(context));
          await _saveThemeData('custom');
        },
        child: const Text(
          'Mars theme',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );


    const lblSeleccionaTema = Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text('Selecciona un tema:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,                
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Social TEC :)'),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.modulate),
                opacity: .4,
                fit: BoxFit.cover,
                image: const AssetImage('assets/fondo_itcelaya.jpg'))),
          child: Responsive(
            mobile:  MobileThemeScreen(themeDarkButton, themeLightButton, themeCustomButton, lblSeleccionaTema), 
            desktop: WebThemeScreen(themeDarkButton, themeLightButton, themeCustomButton, lblSeleccionaTema)
          ),
        ),
        isLoading ? const LoadingModalWidget() : Container()
      ]),
      drawer: const MenuWidget(),
    );
  }

  Padding MobileThemeScreen(Widget themeDarkButton, Padding themeLightButton, Padding themeCustomButton, Padding lblSeleccionaTema) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(alignment: Alignment.topCenter, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            lblSeleccionaTema,
            SizedBox(width: MediaQuery.of(context).size.width * 0.2, height: 65, child: themeDarkButton),
            spaceHorizontal,
            SizedBox(width: MediaQuery.of(context).size.width * 0.2, height: 65, child: themeLightButton),
            spaceHorizontal,
            SizedBox(width: MediaQuery.of(context).size.width * 0.2, height: 65, child: themeCustomButton),
            spaceHorizontal
          ]
        ),
      ]),
    );
  }

  Padding WebThemeScreen(Widget themeDarkButton, Padding themeLightButton, Padding themeCustomButton, Padding lblSeleccionaTema) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Stack(alignment: Alignment.topCenter, children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    lblSeleccionaTema,
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2, height: 65, child: themeDarkButton),
                  spaceHorizontal,
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2, height: 65, child: themeLightButton),
                  spaceHorizontal,
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2, height: 65, child: themeCustomButton),
                  spaceHorizontal
                ],
              ),
            ],
          ),
        ],
        ),
      ]),
    );
  }

}