import 'package:flutter/material.dart';
import 'package:programa1/routes.dart';
import 'package:programa1/screens/responsive.dart';
import 'package:programa1/widgets/loading_modal_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../provider/theme_provider.dart';
import '../settings/styles_settings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = TextFormField(
    decoration: const InputDecoration(
        label: Text('Email User'), border: OutlineInputBorder()),
  );
  final txtPass = TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
        label: Text('Password User'), border: OutlineInputBorder()),
  );
  final spaceHorizontal = const SizedBox(
    height: 10,
  );
  final btnFacebook = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook,
    onPressed: () {},
  );
  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    onPressed: () {},
  );
  final btnGithub = SocialLoginButton(
    buttonType: SocialLoginButtonType.github,
    onPressed: () {},
  );

  final imgLogo = Image.asset(
    'assets/logo.png',
    height: 180,
  );

  @override
  Widget build(BuildContext context) {

    
    final txtRegister = Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline, color: Theme.of(context).colorScheme.onSecondary),
          )),
    );

    final txtTheme = Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/theme');
          },
          child: Text(
            'Elegir tema',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline, color: Theme.of(context).colorScheme.onSecondary),
          )),
    );

    final btnEmail = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 2000)).then((value) {
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context, '/dash');
        });
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Responsive(
            mobile: MobileLoginScreen(btnEmail, txtRegister, txtTheme), 
            desktop: WebLoginScreen(context, btnEmail, txtRegister, txtTheme)
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }

  Container WebLoginScreen(BuildContext context, SocialLoginButton btnEmail, Padding txtRegister, Padding txtTheme) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.modulate),
        opacity: .4, 
        fit: BoxFit.cover,
        image: AssetImage('assets/fondo_itcelaya.jpg')
      )
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: imgLogo,
                      ),
                    )
                  ],
                ),
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: txtEmail,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: txtPass,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: btnEmail,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: btnFacebook,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: btnGoogle,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: btnGithub,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: txtRegister,
                  ),
                  spaceHorizontal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: txtTheme,
                  ),
                ]
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


  Container MobileLoginScreen(SocialLoginButton btnEmail, Padding txtRegister, Padding txtTheme) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.modulate),
              opacity: .4,
              fit: BoxFit.cover,
              image: AssetImage('assets/fondo_itcelaya.jpg'))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spaceHorizontal,
                imgLogo,
                spaceHorizontal,
                txtEmail,
                spaceHorizontal,
                txtPass,
                spaceHorizontal,
                btnEmail,
                spaceHorizontal,
                btnFacebook,
                spaceHorizontal,
                btnGoogle,
                spaceHorizontal,
                btnGithub,
                spaceHorizontal,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      txtRegister,
                      txtTheme,
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
