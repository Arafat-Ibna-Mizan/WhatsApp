import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'enum_file.dart';
import 'result_page.dart';
import 'package:bmi_calculator_app/result_page.dart';


class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard;
  int sliderValue=150;
  int age=30,weight=50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedCard=Gender.male;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mars,
                          color: Colors.white,
                          size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('MALE',
                            style:
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(10),
                        color: selectedCard == Gender.male?Colors.amberAccent:Colors.blue,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedCard=Gender.female;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.venus,
                            color: Colors.white,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('FEMALE',
                            style:
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:selectedCard == Gender.female?Colors.pinkAccent:Colors.blue,
                      ),
                    ),
                  ),
                )
              ],

            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("HEIGHT",
                 style:
                   TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.white
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [

                     Text(
                       sliderValue.toString(),
                       style:
                       TextStyle(
                           fontSize: 50,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                       ),
                     ),
                     Text("cm",
                       style:
                       TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                       ),
                     ),

                   ],
                 ),
                 Slider(
                   value: sliderValue.toDouble(),
                   //value: 156.0,
                   min: 120.0,
                   max: 220.0,
                   onChanged:(value){
                     setState(() {
                       sliderValue=value.toInt();
                     });

                   },
                   activeColor: Colors.yellow,
                   inactiveColor: Colors.white ,
                 )
               ],
              ),
              margin: EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text("WEIGHT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color:Colors.white
                        ),),
                        Text('$weight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color:Colors.white
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  weight++;
                                });

                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child:
                               Icon(
                                 FontAwesomeIcons.plus
                               )

                              ),
                            ),
                            
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  weight--;
                                });

                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child:
                                  Icon(
                                      FontAwesomeIcons.minus
                                  )

                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text("AGE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white
                          ),),
                        Text('$age',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color:Colors.white
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  age++;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child:
                                  Icon(
                                      FontAwesomeIcons.plus
                                  )

                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  age--;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child:
                                  Icon(
                                      FontAwesomeIcons.minus
                                  )

                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                ),

              ],
            ),

          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                height: sliderValue,
                weight:weight ,
                age:age ,
              )),);
            },
            child: Container(
              color: Colors.blueAccent,
              height: 80,
              width: double.infinity,
              child:
              Center(
                  child: Text('Calculate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:24,
                      color: Colors.white
                    ),
                  ))),
          ),

        ],
      ) ,
    );
  }
}

