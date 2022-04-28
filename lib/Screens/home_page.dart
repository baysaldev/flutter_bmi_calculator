// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

const activeColor = Colors.blueGrey;
const inActiveColor = Colors.blue;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 180;
  int weight = 60;
  int age = 30;
  String result = "";
  String resultDetail = "result here";
  double bmi = 0;

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "Normalden fazla kilodasınız.Daha fazla egzersiz yapmalısınız";
    } else if (bmi > 18) {
      return "Normal kilodasınız.Formunuzu korumaya devam edin";
    } else {
      return "Normalden fazla zayıfsınız .Beslenmenizi artırın";
    }
  }

  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (gender == 2) {
        if (femaleBoxColor == inActiveColor) {
          femaleBoxColor = activeColor;
          maleBoxColor = inActiveColor;
        } else {
          femaleBoxColor = inActiveColor;
          maleBoxColor = activeColor;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: maleBoxColor,
                ),
                child: FlatButton(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Center(
                        child: Icon(
                          Icons.male,
                          size: 85,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "MALE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                ),
              ),
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: femaleBoxColor,
                ),
                child: FlatButton(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Center(
                        child: Icon(
                          Icons.female,
                          size: 85,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey.shade700,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEİGHT",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade700,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      weight.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blueAccent.shade200,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (weight > 0) {
                                weight--;
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blueAccent.shade200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade700,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blueAccent.shade200,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (age > 0) {
                                age--;
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blueAccent.shade200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey.shade700,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  resultDetail = getInterpretation(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 200,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Result",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  result.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 40),
                                ),
                                Center(
                                  child: Text(
                                    resultDetail,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
