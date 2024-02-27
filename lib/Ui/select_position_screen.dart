import '../Constant%20File/pallete.dart';
import '../Ui/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:phlox_animations/phlox_animations.dart';
import "../BottomNavigationBar/bottom_navigation_bar.dart";
import '../String Files/text_string.dart';
import 'signup_screen.dart';

class SelectPositionScreen extends StatefulWidget {
  const SelectPositionScreen({Key? key}) : super(key: key);

  @override
  _SelectPositionScreenState createState() => _SelectPositionScreenState();
}

class _SelectPositionScreenState extends State<SelectPositionScreen> {
  List<String> SelectPositionList = [
    "Personal",
    "Bussiness",
    "Entertainment",
    "Technonology",
    "Codding",
    "Memes",
    "Sports",
    "News",
    "Jobs",
    "AI Technonlogy",
    "Travelling",
    "Food",
  ];
  List<String>? SelectPosition = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.whiteColor,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, right: 20, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            Skip,
                            style: TextStyle(
                              color: Pallete.greyColor8,
                              fontSize: 18,
                            ),
                          )),
                      const SizedBox(height: 25),
                      const PhloxAnimations(
                        duration: const Duration(seconds: 1),
                        fromDegrees: -90,
                        fromScale: 0,
                        //fromOpacity: 0.1,
                        fromX: -200,
                        fromY: -100,
                        child: Text(Select_your_position,
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        children: SelectPositionList.map(
                          (hobby) {
                            bool isSelected = false;
                            if (SelectPosition!.contains(hobby)) {
                              isSelected = true;
                            }
                            return GestureDetector(
                              onTap: () {
                                if (!SelectPosition!.contains(hobby)) {
                                  if (SelectPosition!.length < 5) {
                                    SelectPosition!.add(hobby);
                                    setState(() {});
                                    print(SelectPosition);
                                  }
                                } else {
                                  SelectPosition!.removeWhere(
                                      (element) => element == hobby);
                                  setState(() {});
                                  print(SelectPosition);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: PhloxAnimations(
                                  duration: const Duration(seconds: 1),
                                  fromX: -40,
                                  fromY: 100,
                                  //fromOpacity: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.greenAccent.shade100
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: EdgeInsets.all(14),
                                    child: Text(
                                      hobby,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnbordingScreen()));
                          },
                          child: Container(
                              height: 45,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Pallete.whiteColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Pallete.blackColor, width: 1.5),
                              ),
                              child: Icon(Icons.arrow_back,
                                  color: Colors.black, size: 25))),
                      const Spacer(),
                      SizedBox(
                          height: 45,
                          width: 130,
                          child: PhloxAnimations(
                              duration: const Duration(seconds: 1),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Pallete.blackColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(Get_Started)))),
                    ],
                  )))
        ]));
  }
}
