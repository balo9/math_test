import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:math_test/main.dart';
import 'AnswerScreen.dart';
import 'dart:async';
import 'QuizButtonIcon.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:fabexdateformatter/fabexdateformatter.dart';

class QuizScreen extends StatefulWidget {
  //final String oprator;
  //final int numOfQuestions = 10;
  //final int range1;
  //final duration;

  //final int range2;

  // QuizScreen(
  //     { //Key key,
  //     //this.duration,
  //     //this.oprator = "sum",
  //     //this.numOfQuestions = "5",
  //     //this.range1 = 9,
  //    // this.range2 = 9
  //    });

  @override
  _QuizScreenState createState() => _QuizScreenState();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    TextDirection.rtl;
    return Container();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  List qustions = [];
  List answers = [];
  bool isMarked = false;
  List<List<dynamic>> mcq = [];
  List userAnswer = [];
  var ansData;
  List<dynamic> ans = [];
  var j = 0;
  final int numOfSingleQuestions = 4; //الآحاد
  final int numOfTensQuestions = 4; //العشرات
  final int numOfHundredQuestions = 4; //المئات

  void initState() {
    TextDirection.rtl;
    super.initState();
    for (var i = 1; i < numOfSingleQuestions + 1; i++) {
      ans = [];
      var val1 = Random().nextInt(9) + 1;
      var val2 = Random().nextInt(9) + 1;
      textDirection:
      TextDirection.rtl;
      qustions.add("$val1  +  $val2 =  ...... ");
      answers.add(val1 + val2);
      ansData = [
        val1 + val2,
        val1 + val2 + Random().nextInt(9) + 1,
        val1 + val2 - Random().nextInt(9) - 1,
        val1 + val2 + Random().nextInt(9) + 1,
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfTensQuestions + 1; i++) {
      ans = [];
      var val1 = Random().nextInt(99) + 1;
      var val2 = Random().nextInt(99) + 1;
      qustions.add("$val1  +  $val2 =  ...... ");
      answers.add(val1 + val2);
      ansData = [
        val1 + val2,
        val1 + val2 + Random().nextInt(99) + 1,
        val1 + val2 - Random().nextInt(99) - 1,
        val1 + val2 + Random().nextInt(99) + 1,
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfHundredQuestions + 1; i++) {
      ans = [];
      var val1 = Random().nextInt(999) + 1;
      var val2 = Random().nextInt(999) + 1;
      qustions.add("$val1  +  $val2 =  ...... ");
      answers.add(val1 + val2);
      ansData = [
        val1 + val2,
        val1 + val2 + Random().nextInt(999) + 1,
        val1 + val2 - Random().nextInt(999) - 1,
        val1 + val2 + Random().nextInt(999) + 1,
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }
  }

  _changeQuestion(ans) {
    userAnswer.add(ans);
    if (j + 1 >= qustions.length) {
      var Singlescore = 0;
      // var Tensscore = 0;
      // var Hundredscore = 0;
      for (var i = 0; i < answers.length; i++) {
        if (userAnswer[i].toString() == answers[i].toString()) {
          Singlescore++;
        }
      }

      var Tensscore = 0;
      for (var i = 0; i < answers.length; i++) {
        if (userAnswer[i].toString() == answers[i].toString()) {
          Tensscore++;
        }
      }

      var Hundredscore = 0;
      for (var i = 0; i < answers.length; i++) {
        if (userAnswer[i].toString() == answers[i].toString()) {
          Hundredscore++;
        }
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AnswerScreen(
              maxSingleScore: numOfSingleQuestions,
              maxTensScore: numOfTensQuestions,
              maxHundredScore: numOfHundredQuestions,
              singlescore: Singlescore,
              tensscore: Tensscore,
              hundredscore: Hundredscore,
              answers: answers,
              qustions: qustions,
              userAnswer: userAnswer),
        ),
      );
    } else {
      print("called");
      setState(() {
        ++j;
        isMarked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    //   return Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('assets/farm.jpg'),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     //backgroundColor: Colors.black,
    //     child: LayoutBuilder(builder: (context, constraint) {
    //       return SingleChildScrollView(
    //         child: ConstrainedBox(
    //           constraints: BoxConstraints(minHeight: constraint.maxHeight),
    //           child: IntrinsicHeight(
    //             child: Column(
    //               textDirection: TextDirection.rtl,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(qustions[j].toString(),
    //                     style: TextStyle(
    //                         decoration: TextDecoration.none,
    //                         color: Colors.lightBlue,
    //                         //backgroundColor: Colors.white,
    //                         fontSize:
    //                             MediaQuery.of(context).size.width > 500 ? 45 : 20,
    //                         fontWeight: FontWeight.bold)),
    //                 SizedBox(height: 50),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][0].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][0].toString())),
    //                     SizedBox(width: 50),
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][1].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][1].toString())),
    //                     SizedBox(width: 50),
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][2].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][2].toString())),
    //                     SizedBox(width: 50),
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][3].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][3].toString())),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     }),
    //   );
    // }
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    textDirection:
    TextDirection.rtl;
    return Scaffold(
      body: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/farm.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dogFrame.png'),
                      alignment: Alignment.center,
                    ),
                  ),
                  child: Text(qustions[j].toString(),
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.lightBlue,
                          fontFamily: "ReadexPro-Regular",
                          fontSize:
                              MediaQuery.of(context).size.width > 500 ? 45 : 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][0].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 80.0,
                        height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][0].toString())),
                    SizedBox(width: 30),
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][1].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 80.0,
                        height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][1].toString())),
                    SizedBox(width: 30),
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][2].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 80.0,
                        height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][2].toString())),
                    SizedBox(width: 30),
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][3].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 80.0,
                        height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][3].toString())),
                  ],
                ),
              ])
        ],
      ),
    );
  }
}

Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
