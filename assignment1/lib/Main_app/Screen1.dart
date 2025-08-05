import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'HomeBar.dart';
import 'HabChal.dart  ';
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBar(),
        
            SizedBox(height: 19,),
        
            Container(
              margin: EdgeInsets.only(left: 20, right: 40),
              decoration: BoxDecoration(
                color: Color(0xFFEDC967),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              //width: 450,
              child: ListTile(

                leading: CircularPercentIndicator(
                  radius: 18,
                  percent: 0.25,
                  lineWidth: 2,
                  progressColor: Colors.white,
                  backgroundColor: Colors.black,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text("25%",style: TextStyle(fontSize: 10, color: Colors.black),),
                ),

                //tileColor: Colors.white10,


                title: Text("Your goal is almost done",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                ),

                subtitle: Text("1 of 4 goals done", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
              ),
            ),
            Habchal(),
          ],
        ),
      ),
    ));
  }
}
