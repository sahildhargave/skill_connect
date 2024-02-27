//////import 'dart:math';
//////import 'package:flutter/material.dart';
//////
//////class Loader extends StatefulWidget {
//////  @override
//////  _LoaderState createState() => _LoaderState();
//////}
//////
//////class _LoaderState extends State<Loader> with TickerProviderStateMixin {
//////  late AnimationController firstController;
//////  late Animation<double> firstAnimation;
//////
//////  late AnimationController secondController;
//////  late Animation<double> secondAnimation;
//////
//////  late AnimationController thirdController;
//////  late Animation<double> thirdAnimation;
//////
//////  late AnimationController fourthController;
//////  late Animation<double> fourthAnimation;
//////
//////  late AnimationController fifthController;
//////  late Animation<double> fifthAnimation;
//////
//////  @override
//////  void initState() {
//////    super.initState();
//////
//////    firstController =
//////        AnimationController(vsync: this, duration: Duration(seconds: 6));
//////    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
//////      ..addListener(() {
//////        setState(() {});
//////      })
//////      ..addStatusListener((status) {
//////        if (status == AnimationStatus.completed) {
//////          firstController.repeat();
//////        } else if (status == AnimationStatus.dismissed) {
//////          firstController.forward();
//////        }
//////      });
//////
//////    secondController =
//////        AnimationController(vsync: this, duration: Duration(seconds: 3));
//////    secondAnimation =
//////        Tween<double>(begin: -pi, end: pi).animate(secondController)
//////          ..addListener(() {
//////            setState(() {});
//////          })
//////          ..addStatusListener((status) {
//////            if (status == AnimationStatus.completed) {
//////              secondController.repeat();
//////            } else if (status == AnimationStatus.dismissed) {
//////              secondController.forward();
//////            }
//////          });
//////
//////    thirdController =
//////        AnimationController(vsync: this, duration: Duration(seconds: 2));
//////    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
//////      ..addListener(() {
//////        setState(() {});
//////      })
//////      ..addStatusListener((status) {
//////        if (status == AnimationStatus.completed) {
//////          thirdController.repeat();
//////        } else if (status == AnimationStatus.dismissed) {
//////          thirdController.forward();
//////        }
//////      });
//////
//////    fourthController = AnimationController(
//////        vsync: this, duration: Duration(milliseconds: 1500));
//////    fourthAnimation =
//////        Tween<double>(begin: -pi, end: pi).animate(fourthController)
//////          ..addListener(() {
//////            setState(() {});
//////          })
//////          ..addStatusListener((status) {
//////            if (status == AnimationStatus.completed) {
//////              fourthController.repeat();
//////            } else if (status == AnimationStatus.dismissed) {
//////              fourthController.forward();
//////            }
//////          });
//////
//////    fifthController =
//////        AnimationController(vsync: this, duration: Duration(seconds: 1));
//////    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
//////      ..addListener(() {
//////        setState(() {});
//////      })
//////      ..addStatusListener((status) {
//////        if (status == AnimationStatus.completed) {
//////          fifthController.repeat();
//////        } else if (status == AnimationStatus.dismissed) {
//////          fifthController.forward();
//////        }
//////      });
//////
//////    firstController.forward();
//////    secondController.forward();
//////    thirdController.forward();
//////    fourthController.forward();
//////    fifthController.forward();
//////  }
//////
//////  @override
//////  void dispose() {
//////    firstController.dispose();
//////    secondController.dispose();
//////    thirdController.dispose();
//////    fourthController.dispose();
//////    fifthController.dispose();
//////    super.dispose();
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return Center(
//////      child: CustomPaint(
//////        painter: MyPainter(
//////          firstAnimation.value,
//////          secondAnimation.value,
//////          thirdAnimation.value,
//////          fourthAnimation.value,
//////          fifthAnimation.value,
//////        ),
//////      ),
//////    );
//////  }
//////}
//////
//////class MyPainter extends CustomPainter {
//////  final double firstAngle;
//////  final double secondAngle;
//////  final double thirdAngle;
//////  final double fourthAngle;
//////  final double fifthAngle;
//////
//////  MyPainter(
//////    this.firstAngle,
//////    this.secondAngle,
//////    this.thirdAngle,
//////    this.fourthAngle,
//////    this.fifthAngle,
//////  );
//////
//////  @override
//////  void paint(Canvas canvas, Size size) {
//////    Paint myArc = Paint()
//////      ..color = Color(0xff00A2FF)
//////      ..style = PaintingStyle.stroke
//////      ..strokeWidth = 5
//////      ..strokeCap = StrokeCap.round;
//////
//////    canvas.drawArc(
//////      Rect.fromLTRB(
//////        0,
//////        0,
//////        size.width,
//////        size.height,
//////      ),
//////      firstAngle,
//////      2,
//////      false,
//////      myArc,
//////    );
//////    canvas.drawArc(
//////      Rect.fromLTRB(
//////        size.width * .1,
//////        size.height * .1,
//////        size.width * .9,
//////        size.height * .9,
//////      ),
//////      secondAngle,
//////      2,
//////      false,
//////      myArc,
//////    );
//////    canvas.drawArc(
//////      Rect.fromLTRB(
//////        size.width * .2,
//////        size.height * .2,
//////        size.width * .8,
//////        size.height * .8,
//////      ),
//////      thirdAngle,
//////      2,
//////      false,
//////      myArc,
//////    );
//////    canvas.drawArc(
//////      Rect.fromLTRB(
//////        size.width * .3,
//////        size.height * .3,
//////        size.width * .7,
//////        size.height * .7,
//////      ),
//////      fourthAngle,
//////      2,
//////      false,
//////      myArc,
//////    );
//////    canvas.drawArc(
//////      Rect.fromLTRB(
//////        size.width * .4,
//////        size.height * .4,
//////        size.width * .6,
//////        size.height * .6,
//////      ),
//////      fifthAngle,
//////      2,
//////      false,
//////      myArc,
//////    );
//////  }
//////
//////  @override
//////  bool shouldRepaint(covariant CustomPainter oldDelegate) {
//////    return true;
//////  }
//////}
////
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
////import 'package:flutter/material.dart';
////import 'dart:async';
////
////class ColorLoader extends StatefulWidget {
////  final List<Color>? colors;
////  final Duration? duration;
////
////  ColorLoader({this.colors, this.duration});
////
////  @override
////  _ColorLoaderState createState() =>
////      _ColorLoaderState(this.colors!, this.duration!);
////}
////
////class _ColorLoaderState extends State<ColorLoader>
////    with SingleTickerProviderStateMixin {
////  final List<Color> colors;
////  final Duration duration;
////  late Timer timer;
////
////  _ColorLoaderState(this.colors, this.duration);
////
////  //noSuchMethod(Invocation i) => super.noSuchMethod(i);
////
////  List<ColorTween> tweenAnimations = [];
////  int tweenIndex = 0;
////
////  late AnimationController controller;
////  List<Animation<Color?>> colorAnimations = [];
////
////  @override
////  void initState() {
////    super.initState();
////
////    controller = new AnimationController(
////      vsync: this,
////      duration: duration,
////    );
////
////    for (int i = 0; i < colors.length - 1; i++) {
////      tweenAnimations.add(ColorTween(begin: colors[i], end: colors[i + 1]));
////    }
////
////    tweenAnimations
////        .add(ColorTween(begin: colors[colors.length - 1], end: colors[0]));
////
////    for (int i = 0; i < colors.length; i++) {
////      Animation<Color?> animation = tweenAnimations[i].animate(CurvedAnimation(
////          parent: controller,
////          curve: Interval((1 / colors.length) * (i + 1) - 0.05,
////              (1 / colors.length) * (i + 1),
////              curve: Curves.linear)));
////
////      colorAnimations.add(animation);
////    }
////
////    print(colorAnimations.length);
////
////    tweenIndex = 0;
////
////    timer = Timer.periodic(duration, (Timer t) {
////      setState(() {
////        tweenIndex = (tweenIndex + 1) % colors.length;
////      });
////    });
////
////    controller.forward();
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return Center(
////      child: CircularProgressIndicator(
////        strokeWidth: 5.0,
////        valueColor: colorAnimations[tweenIndex],
////      ),
////    );
////  }
////
////  @override
////  void dispose() {
////    timer.cancel();
////    controller.dispose();
////    super.dispose();
////  }
////}
//
//import 'package:flutter/material.dart';
//import 'package:rive/rive.dart';
//
//const riveFile = 'assets/images/loading2.riv';
//
//class HomePage2 extends StatefulWidget {
//  @override
//  _HomePageState2 createState() => _HomePageState2();
//}
//
//class _HomePageState2 extends State<HomePage2> {
//  bool darkTheme = false;
//  Artboard? _artboard;
//  late RiveAnimationController _animationController;
//
//  @override
//  void initState() {
//    _loadRiveFile();
//    super.initState();
//  }
//
//  void _loadRiveFile() async {
//    // final bytes = await rootBundle.load(riveFile);
//    // RiveFile rFile = RiveFile.import(bytes);
//
//    // setState(() => _artboard = rFile.mainArtboard
//    //   ..addController(
//    //     darkTheme
//    //         ? _animationController = SimpleAnimation('dark')
//    //         : _animationController = SimpleAnimation('light'),
//    //   ));
//    _animationController = darkTheme
//        ? _animationController = SimpleAnimation('dark')
//        : _animationController = SimpleAnimation('light');
//  }
//
//  void _onSucess() {
//    if (_artboard != null) {
//      _artboard!.artboard.removeController(_animationController);
//      _artboard!.addController(darkTheme
//          ? SimpleAnimation('dark_tick')
//          : SimpleAnimation('light_tick'));
//    }
//  }
//
//  void _onInit(Artboard artboard) {
//    _artboard = artboard;
//  }
//
//  @override
//  void dispose() {
//    _animationController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: darkTheme ? null : Colors.blue,
//      body: Center(
//        child: RiveAnimation.asset(
//          riveFile,
//          onInit: _onInit,
//          controllers: [_animationController],
//        ),
//      ),
//    );
//  }
//}
