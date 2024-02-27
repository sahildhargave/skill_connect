import "../Constant%20File/pallete.dart";
import "../String%20Files/text_string.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:phlox_animations/phlox_animations.dart";
import '../String Files/image_string.dart';
import '../String Files/text_string.dart';
import '../Ui/dashboard_page.dart';

class HomePageConatinerConstant extends StatefulWidget {
  const HomePageConatinerConstant({Key? key}) : super(key: key);

  @override
  _HomePageConatinerConstantState createState() =>
      _HomePageConatinerConstantState();
}

class _HomePageConatinerConstantState extends State<HomePageConatinerConstant> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 510,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Category(
              job_title: javaDevloper,
              sub_tital: googleinc,
              time: fulltime,
              money: string1,
              day: day2,
            ),
            Category(
              job_title: ux_ui,
              sub_tital: weSoftYou,
              time: partTime,
              money: office,
              day: day7,
            ),
            Category(
              job_title: backEnd,
              sub_tital: upSwot,
              time: remotely,
              money: years2,
              day: month,
            ),
            Category(
              job_title: javaDevloper,
              sub_tital: googleinc,
              time: fulltime,
              money: string1,
              day: day2,
            ),
            SizedBox(
              height: 55.h,
            )
          ],
        ));
  }
}

class Category extends StatelessWidget {
  final String? job_title;
  final String? sub_tital;
  final String? time;
  final String? money;
  final String? day;
  final Function? function;

  Category({
    this.job_title,
    this.function,
    this.sub_tital,
    this.time,
    this.money,
    this.day,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardPage(
                      job_title: job_title, sub_tital: sub_tital)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: PhloxAnimations(
              duration: Duration(milliseconds: 900),
              fromDegrees: -90,
              fromScale: 0,
              fromOpacity: 0.1,
              fromY: -100,
              fromX: 100,
              child: Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Pallete.greyColor1,
                      borderRadius: BorderRadius.circular(18.r)),
                  padding: EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(job_title!,
                                  style: TextStyle(
                                    color: Pallete.blackColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                sub_tital!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.more_horiz,
                            size: 25.sp,
                          )
                        ]),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 30.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(25.r)),
                                child: Center(
                                  child: Text(time!,
                                      style: TextStyle(color: Colors.black)),
                                )),
                            SizedBox(width: 10.w),
                            Container(
                                height: 30.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(25.r)),
                                child: Center(
                                  child: Text(money!,
                                      style: TextStyle(
                                        color: Pallete.blackColor,
                                      )),
                                )),
                            Spacer(),
                            Text(
                              day!,
                              style: TextStyle(color: Pallete.blackColor),
                            )
                          ],
                        )
                      ]))),
        ));
  }
}
