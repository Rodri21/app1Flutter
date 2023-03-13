import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../card_onboarding.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final data = [
    CardOnboardingData(
      title: 'PRESENTACION', 
      subtitle: 'ITC es una universidad pública en Celaya, Guanajuato, México. Ofrece programas educativos y posgrados.', 
      image: const AssetImage('assets/presentacion.jpg'), 
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1), 
      titleColor: Colors.pink, 
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animations/bg-1.json"),
    ),
    CardOnboardingData(
      title: 'CARRERA', 
      subtitle: 'Carrera de Ingeniería en Sistemas Computacionales: Forma profesionales en tecnología de la información y administración de sistemas.', 
      image: const AssetImage('assets/carrera.jpg'), 
      backgroundColor: Colors.white, 
      titleColor: Colors.purple, 
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset('assets/animations/bg-1.json'),
    ),
    CardOnboardingData(
      title: 'INSTALACIONES', 
      subtitle: 'Instalaciones modernas para formación académica y deportiva con laboratorios especializados, biblioteca, áreas deportivas y de convivencia.', 
      image: const AssetImage('assets/instalaciones.jpg'), 
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1), 
      titleColor: Colors.yellow, 
      subtitleColor: Colors.white,
      background: LottieBuilder.asset('assets/animations/bg-1.json'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardOnboarding(data: data[index]);
        },
      ),
    );
  }
}