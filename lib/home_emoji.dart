import 'package:flutter/material.dart';

class HomeEmoji extends StatefulWidget {
  const HomeEmoji({Key? key}) : super(key: key);

  @override
  State<HomeEmoji> createState() => _HomeEmojiState();
}

class _HomeEmojiState extends State<HomeEmoji> {
  final colorgrey = const Color(0xff1C1E2C);
  final colorgrey2 = const Color(0xff454855);
  final colorpurple = const Color(0xff7450FF);

  double vSlider = 0.0;

  Map map = {
    0: 'No quiero volver',
    1: 'No me gusto',
    2: 'Ni mal ni bien',
    3: 'Me gusto mucho',
    4: 'Me encanto todo'
  };

  Map map2 = {
    0: 'assets/1.png',
    1: 'assets/2.png',
    2: 'assets/3.png',
    3: 'assets/4.png',
    4: 'assets/5.png'
  };

  calculate(double v) {
    if (v >= 0 && v <= 0.2) return 0;
    if (v > 0.2 && v <= 0.4) return 1;
    if (v > 0.4 && v <= 0.6) return 2;
    if (v > 0.6 && v <= 0.8) return 3;
    if (v > 0.8 && v <= 1.0) return 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff07091C),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              const Text(
                'Como fue tu experiencia en DualBoot Partners?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: colorgrey, borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      map[calculate(vSlider)] ?? '',
                      key: ValueKey(calculate(vSlider)),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  map2[calculate(vSlider)] ?? 'assets/1.png',
                  key: ValueKey(calculate(vSlider)),
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Slider(
                  value: vSlider,
                  onChanged: (v) {
                    setState(() {
                      vSlider = v;
                    });
                  },
                  activeColor: colorpurple,
                  inactiveColor: colorgrey2,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/message.png',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Agregar comentario',
                    style: TextStyle(color: colorgrey2),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Enviado con existo',
                    style: TextStyle(color: Colors.white),
                  )));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  width: double.infinity * .6,
                  decoration: BoxDecoration(
                      color: colorpurple,
                      borderRadius: BorderRadius.circular(26)),
                  child: const Center(
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                'En otro momento',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
