import 'package:flutter/material.dart';
import 'package:on_boarding_screen1/widget/defaultButton.dart';

import '../widget/content.dart';
import 'home_screens.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> ContentData = [
    {
      "text": "This is my portfolio to \nmake education app with flutter",
      "image": "https://assets8.lottiefiles.com/packages/lf20_e6qptb87.json"
    },
    {
      "text": "This edu app is all about \neducation in High School",
      "image": "https://assets8.lottiefiles.com/packages/lf20_4rq0nvpt.json"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const Spacer(flex: 1),
              Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: ContentData.length,
                    itemBuilder: (context, index) => Content(
                          image: ContentData[index]["image"],
                          text: ContentData[index]["text"],
                        )),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(ContentData.length,
                              (index) => buildDot(index: index)),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        DefaultButton(
                          text: "Continue",
                          press: () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                      ));
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  )),
                  
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? Color.fromARGB(255, 215, 140, 35) : const Color(0xFFD8D8D8),
      ),
    );
  }
}