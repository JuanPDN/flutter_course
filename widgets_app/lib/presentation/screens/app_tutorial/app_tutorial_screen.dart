import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la Comida',
      'There are many variations of passages of Lorem Ipsum available',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega Rapida',
      'There are many variations of passages of Lorem Ipsum available',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'There are many variations of passages of Lorem Ipsum available',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(slideInfo: slideData))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  right: 30,
                  bottom: 50,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 350),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slideInfo;

  const _Slide({required this.slideInfo});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(slideInfo.imageUrl)),
              const SizedBox(
                height: 20,
              ),
              Text(
                slideInfo.title,
                style: titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                slideInfo.caption,
                style: captionStyle,
              ),
            ]),
      ),
    );
  }
}
