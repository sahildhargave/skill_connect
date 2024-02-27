import 'package:flutter/material.dart';
import '../Constant File/pallete.dart';
import '../String Files/text_string.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../Constant File/content_constant_file.dart';
import 'select_position_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {});
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                        padding: EdgeInsets.only(top: 50, right: 40, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SelectPositionScreen()));
                                  },
                                  child: Text(Skip,
                                      style: TextStyle(
                                        color: Pallete.greyColor8,
                                        fontSize: 20,
                                      )),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            PhloxAnimations(
                                duration: const Duration(seconds: 2),
                                fromY: -100,
                                fromX: -50,
                                child: Image.asset(
                                  contents[i].image!,
                                  height: 280,
                                )),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  contents.length,
                                  (index) => buildDot(index, context),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 75,
                            ),
                            PhloxAnimations(
                                duration: const Duration(seconds: 1),
                                child: Text(
                                  contents[i].title!,
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                )),
                            const SizedBox(height: 18),
                            PhloxAnimations(
                              duration: const Duration(seconds: 1),
                              fromDegrees: 40,
                              fromOpacity: 0,
                              fromScale: 0,
                              fromX: 100,
                              fromY: -100,
                              child: Text(
                                contents[i].discription!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Pallete.greyColorN,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ));
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Pallete.blackColor, width: 1.5),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 25,
                      ),
                    )),
                const Spacer(),
                SizedBox(
                  height: 45,
                  width: 130,
                  child: ElevatedButton(
                    child: const Text(Next),
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SelectPositionScreen(),
                          ),
                        );
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 5,
        width: currentIndex == index ? 40 : 25,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: currentIndex == index
                ? Pallete.blackColor
                : Pallete.greyColor4));
  }
}
