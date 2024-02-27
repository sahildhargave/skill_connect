import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';
import "../Constant File/pallete.dart";
import '../String Files/text_string.dart';
import '../Constant File/horizontal_button_constant.dart';

import '../Constant File/offer_container.dart';

class DashboardPage extends StatefulWidget {
  final String? job_title;
  final String? sub_tital;

  const DashboardPage({Key? key, this.job_title, this.sub_tital})
      : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.greyColor1,
      body: Stack(
        children: [
          Container(
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 45, right: 15, left: 12),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios_new,
                              color: Pallete.blackColor, size: 21.sp)),
                      SizedBox(width: 25.w),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.sub_tital!,
                                style: TextStyle(
                                  color: Pallete.greyColor8,
                                  fontSize: 16.sp,
                                )),
                            Text(
                              widget.job_title!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Button_horizontal(),
              SizedBox(
                height: 20.h,
              ),
            ]),
          ),
          SizedBox(height: 109),
          Padding(
              padding: const EdgeInsets.only(top: 190),
              child: Container(
                height: 600.h,
                width: 414.w,
                decoration: BoxDecoration(
                  color: Pallete.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: SingleChildScrollView(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Text(
                        job_Description,
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(job_Description_sub,
                          style: TextStyle(
                              color: Pallete.greyColor8, fontSize: 16.sp)),
                      SizedBox(height: 20.h),
                      Text(
                        responsibilities,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        children: [
                          PhloxAnimations(
                              duration: const Duration(milliseconds: 800),
                              fromX: 200,
                              fromY: 100,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_box_sharp,
                                    size: 30.sp,
                                    color: Pallete.blackColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(Creating_Motion,
                                      style: TextStyle(
                                        color: Pallete.blackColor,
                                        fontSize: 16.sp,
                                      )),
                                ],
                              )),
                          PhloxAnimations(
                              duration: const Duration(milliseconds: 1100),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_box_sharp,
                                    size: 30.sp,
                                    color: Pallete.blackColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    upper_intermediate,
                                    style: TextStyle(
                                      color: Pallete.blackColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(what_We_Offer,
                              style: TextStyle(
                                color: Pallete.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              )),
                          SizedBox(height: 20.h),
                          OfferContainer(),
                        ],
                      )
                    ],
                  ),
                )),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: 45.h,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Pallete.blackColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: Text(
                            apply,
                            style: TextStyle(fontSize: 20),
                          )))))
        ],
      ),
    );
  }
}
//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:jwt_decoder/jwt_decoder.dart';
//import 'package:velocity_x/velocity_x.dart';
//import 'package:http/http.dart' as http;
//import 'config.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//
//class Dashboard extends StatefulWidget {
//  final token;
//  const Dashboard({@required this.token, Key? key}) : super(key: key);
//
//  @override
//  State<Dashboard> createState() => _DashboardState();
//}
//
//class _DashboardState extends State<Dashboard> {
//  late String userId;
//  TextEditingController _todoTitle = TextEditingController();
//  TextEditingController _todoDesc = TextEditingController();
//  List? items;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
//
//    userId = jwtDecodedToken['_id'];
//    getTodoList(userId);
//  }
//
//  void addTodo() async {
//    if (_todoTitle.text.isNotEmpty && _todoDesc.text.isNotEmpty) {
//      var regBody = {
//        "userId": userId,
//        "title": _todoTitle.text,
//        "desc": _todoDesc.text
//      };
//
//      var response = await http.post(Uri.parse(addtodo),
//          headers: {"Content-Type": "application/json"},
//          body: jsonEncode(regBody));
//
//      var jsonResponse = jsonDecode(response.body);
//
//      print(jsonResponse['status']);
//
//      if (jsonResponse['status']) {
//        _todoDesc.clear();
//        _todoTitle.clear();
//        Navigator.pop(context);
//        getTodoList(userId);
//      } else {
//        print("SomeThing Went Wrong");
//      }
//    }
//  }
//
//  void getTodoList(userId) async {
//    var regBody = {"userId": userId};
//
//    var response = await http.post(Uri.parse(getToDoList),
//        headers: {"Content-Type": "application/json"},
//        body: jsonEncode(regBody));
//
//    var jsonResponse = jsonDecode(response.body);
//    items = jsonResponse['success'];
//
//    setState(() {});
//  }
//
//  void deleteItem(id) async {
//    var regBody = {"id": id};
//
//    var response = await http.post(Uri.parse(deleteTodo),
//        headers: {"Content-Type": "application/json"},
//        body: jsonEncode(regBody));
//
//    var jsonResponse = jsonDecode(response.body);
//    if (jsonResponse['status']) {
//      getTodoList(userId);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.lightBlueAccent,
//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Container(
//            padding: EdgeInsets.only(
//                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                CircleAvatar(
//                  child: Icon(
//                    Icons.list,
//                    size: 30.0,
//                  ),
//                  backgroundColor: Colors.white,
//                  radius: 30.0,
//                ),
//                SizedBox(height: 10.0),
//                Text(
//                  'ToDo with NodeJS + Mongodb',
//                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
//                ),
//                SizedBox(height: 8.0),
//                Text(
//                  '5 Task',
//                  style: TextStyle(fontSize: 20),
//                ),
//              ],
//            ),
//          ),
//          Expanded(
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(20),
//                      topRight: Radius.circular(20))),
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: items == null
//                    ? null
//                    : ListView.builder(
//                        itemCount: items!.length,
//                        itemBuilder: (context, int index) {
//                          return Slidable(
//                            key: const ValueKey(0),
//                            endActionPane: ActionPane(
//                              motion: const ScrollMotion(),
//                              dismissible: DismissiblePane(onDismissed: () {}),
//                              children: [
//                                SlidableAction(
//                                  backgroundColor: Color(0xFFFE4A49),
//                                  foregroundColor: Colors.white,
//                                  icon: Icons.delete,
//                                  label: 'Delete',
//                                  onPressed: (BuildContext context) {
//                                    print('${items![index]['_id']}');
//                                    deleteItem('${items![index]['_id']}');
//                                  },
//                                ),
//                              ],
//                            ),
//                            child: Card(
//                              borderOnForeground: false,
//                              child: ListTile(
//                                leading: Icon(Icons.task),
//                                title: Text('${items![index]['title']}'),
//                                subtitle: Text('${items![index]['desc']}'),
//                                trailing: Icon(Icons.arrow_back),
//                              ),
//                            ),
//                          );
//                        }),
//              ),
//            ),
//          )
//        ],
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => _displayTextInputDialog(context),
//        child: Icon(Icons.add),
//        tooltip: 'Add-ToDo',
//      ),
//    );
//  }
//
//  Future<void> _displayTextInputDialog(BuildContext context) async {
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//              title: Text('Add To-Do'),
//              content: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: [
//                  TextField(
//                    controller: _todoTitle,
//                    keyboardType: TextInputType.text,
//                    decoration: InputDecoration(
//                        filled: true,
//                        fillColor: Colors.white,
//                        hintText: "Title",
//                        border: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(10.0)))),
//                  ).p4().px8(),
//                  TextField(
//                    controller: _todoDesc,
//                    keyboardType: TextInputType.text,
//                    decoration: InputDecoration(
//                        filled: true,
//                        fillColor: Colors.white,
//                        hintText: "Description",
//                        border: OutlineInputBorder(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(10.0)))),
//                  ).p4().px8(),
//                  ElevatedButton(
//                      onPressed: () {
//                        addTodo();
//                      },
//                      child: Text("Add"))
//                ],
//              ));
//        });
//  }
//}
