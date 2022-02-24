import 'package:flutter/material.dart';
import 'formula.dart';

class ResultsPage extends StatefulWidget {
  final int height,weight,age;
  ResultsPage({ @required this.weight, @required this.age,this.height});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  Logic logic=new Logic();
  double bmiResult;


  void initState(){
    bmiResult=logic.calculatedbmi(widget.height,widget.weight);

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your BMI result:',
              style:
              TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            Text(bmiResult.toString(),
              style:
              TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      )
      
    );
  }
}
