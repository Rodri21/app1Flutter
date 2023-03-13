import 'package:flutter/material.dart';
import 'package:programa1/screens/responsive.dart';

class CardOnboardingData{
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  const CardOnboardingData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.subtitleColor,
    required this.titleColor,
    this.background
  });
}

class CardOnboarding extends StatelessWidget {
  const CardOnboarding({required this.data, Key? key}) : super(key: key);

  final CardOnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: MobileOnboardingScreen(data: data), desktop: 
      Stack(
        children: [
          //if(data.background != null) SizedBox.expand(child: data.background!),
          if(data.background != null) Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: data.background!
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: data.background!
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: data.background!
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    Flexible(
                      flex: 20,
                      child: Image(image: data.image)
                    ),
                    const Spacer(flex: 1),
                    Text(
                      data.title.toUpperCase(),
                      style: TextStyle(
                        color: data.titleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    const Spacer(flex: 1), 
                    Text(
                      data.subtitle,
                      style: TextStyle(
                        color: data.subtitleColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),
                    const Spacer(flex: 1),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },child: 
                          Text(
                            'INICIAR',
                            style:
                                TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onPrimary),
                          ),
                      ),
                    ),
                    const Spacer(flex: 10),
                ],),
              ],
            ),
          ),
        ]
      ),
    );
  }
}



class MobileOnboardingScreen extends StatelessWidget {
  const MobileOnboardingScreen({
    super.key,
    required this.data,
  });

  final CardOnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (data.background != null)
        Container(
          height: MediaQuery.of(context).size.height, // establece la altura máxima deseada
          width: double.infinity, // ocupa todo el ancho disponible
          alignment: Alignment.center, // centra la imagen en el contenedor
          child: data.background!,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 40
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Spacer(flex: 3,),
                Flexible(
                  flex: 20,
                  child: Image(image: data.image)
                ),
                const Spacer(flex: 1,),
                Text(data.title.toUpperCase(),
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
                ),
                const Spacer(flex: 1),
                Text(
                  data.subtitle,
                  style: TextStyle(
                    color: data.subtitleColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
                const Spacer(flex: 1),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/login');
                }, child: 
                  Text(
                    'INICIAR',
                    style:
                        TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


