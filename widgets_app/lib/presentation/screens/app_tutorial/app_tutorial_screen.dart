import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
    title: "Busca la comida",
    caption:
        "Non excepteur elit velit aliquip laborum voluptate Lorem labore labore ea enim ut. Quis do sint sint consectetur elit. Cillum proident aliqua ex laboris quis non tempor excepteur laboris reprehenderit. Proident sunt quis aute voluptate. Ullamco nostrud in consequat cupidatat commodo voluptate fugiat. Magna est minim sint do veniam commodo labore nostrud officia anim sint commodo do. Id excepteur velit cillum irure et ea cupidatat et duis id laborum aute.",
    imageUrl: "assets/images/1.png",
  ),
  SlideInfo(
    title: "Entrega rápida",
    caption:
        "Nulla velit velit excepteur ea non. In enim nulla dolor ea dolor labore. Occaecat esse deserunt tempor voluptate reprehenderit ut reprehenderit irure cillum eiusmod esse.",
    imageUrl: "assets/images/1.png",
  ),
  SlideInfo(
    title: "Disfruta la comida",
    caption:
        "Pariatur fugiat nulla occaecat esse culpa. Deserunt esse do proident dolor deserunt proident aliqua commodo est ullamco. Nulla ex duis tempor commodo velit deserunt occaecat culpa. Pariatur velit deserunt tempor nostrud voluptate.",
    imageUrl: "assets/images/1.png",
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text("Salir"),
            ),
          ),

          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: Text("Comenzar"),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20),
            Text(title, style: titleStyle),
            SizedBox(height: 10),
            Text(caption, style: bodySmall),
          ],
        ),
      ),
    );
  }
}
