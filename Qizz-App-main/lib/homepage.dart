import 'package:dependency/database.dart';
import 'package:dependency/score.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  int? ans;
  int? value;
  int Quescount = 0;
  int QuesNo = 0;
  int rAns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Question ?",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "${QuesNo + 1}/10",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      DataBase.quizData[QuesNo]['question'],
                      style: TextStyle(
                          fontSize: 18, height: 1.5, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              value = index;
                              value == DataBase.quizData[QuesNo]['answer']
                                  ? rAns++
                                  : print(value);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20, top: 10, bottom: 10, right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: value == index
                                    ? value ==
                                            DataBase.quizData[QuesNo]['answer']
                                        ? Colors.green
                                        : Colors.red
                                    : Colors.transparent
                                // Changed the comparison
                                ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .50,
                                  child: Text(
                                    DataBase.quizData[QuesNo]['options'][index],
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  child: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.green,
                                    child: value == index
                                        ? value ==
                                                DataBase.quizData[QuesNo]
                                                    ['answer']
                                            ? Icon(Icons.done)
                                            : Icon(Icons.close)
                                        : SizedBox(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        QuesNo++;
                        value = 5;
                        Quescount++;

                        Quescount > 9
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Score(ans: rAns),
                                ))
                            : SizedBox();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                      width: 150,
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
            //   value == DataBase.quizData[QuesNo]['answer']
            //       ? Positioned(
            //           left: 0,
            //           right: 0,
            //           top: 0,
            //           bottom: 0,
            //           child: Center(
            //             child: Text("Nice"),
            //           ),
            //         )
            //       : SizedBox()
          ],
        ),
      ),
    );
  }
}
