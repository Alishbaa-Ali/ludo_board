// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:LudoBoard(),
    );
  }
}


class LudoBoard extends StatelessWidget {
  const LudoBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 399,
          width: 399,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              //borderRadius: BorderRadius.circular(20)
              ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: ColorSquare(color: Colors.green),
        ),       
        Positioned(
          top: 0,
          right: 0,
          child: ColorSquare(color: Colors.blue),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: ColorSquare(color: Colors.red),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ColorSquare(color: Colors.yellow),
        ),
        Positioned.fill(
        child: 
        Center(
          child: Container(
            height: 78,
            width: 78,
            color: Colors.white,
            child: Stack(
            children: [
                Positioned(
                left: 15,
                bottom: 60,
                child: SmallCircle(height: 50, width: 50, SmallCircleColor: Colors.blue)),
                Positioned(
                left: 15,
                top: 60,
                child: SmallCircle(height: 50, width: 50, SmallCircleColor: Colors.red)),
                Positioned(
                top: 15,
                right: 60,
                child: SmallCircle(height: 50, width: 50, SmallCircleColor: Colors.green)),
                Positioned(
                top: 15,
                left: 60,
                child: SmallCircle(height: 50, width: 50, SmallCircleColor: Colors.yellow)),
                ],
              ),
            ),  
          ), 
       ),

        // Positioned(
        //   top: 0,
        //   child: Container(
        //   height: 25,
        //   width: 25,
        //   color: Colors.black,
        // )),

        Positioned.fill(child: LudoRows(colorbox: Colors.blue, starcolor: Colors.green,)),
        Positioned.fill(child: RotatedBox(quarterTurns: -1, child: LudoRows(colorbox: Colors.green, starcolor: Colors.red,))),
        Positioned.fill(child: RotatedBox(quarterTurns: 1, child: LudoRows(colorbox: Colors.yellow, starcolor: Colors.blue,))),
        Positioned.fill(child: RotatedBox(quarterTurns: 2, child: LudoRows(colorbox: Colors.red, starcolor: Colors.yellow,))),


        ],
      ),
    );
  }
}


class ColorSquare extends StatelessWidget {
  final Color color;
  ColorSquare({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159,
      width: 159, 
      color: color,
      child: Center(
        child: Container(
          height: 102,
          width: 102,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20),),
            boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 2), 
            blurRadius: 2, 
            spreadRadius: 2, 
      ),
    ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 15,             
                child: SmallCircle(height: 20,width: 20, SmallCircleColor: color),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: SmallCircle(height: 22,width: 22, SmallCircleColor: color),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: SmallCircle(height: 22,width: 22, SmallCircleColor: color),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: SmallCircle(height: 22,width: 22, SmallCircleColor: color),
              ),
            ],
        ),
      ),
      ),
    );
  }
}

class SmallCircle extends StatelessWidget {
  final Color SmallCircleColor;
  final height;
  final width;
  SmallCircle({
    required this.height,
    required this.width,
    required this.SmallCircleColor,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: SmallCircleColor,
        shape: BoxShape.circle,
      //   boxShadow: [
      //   BoxShadow(
      //   color: Colors.grey.withOpacity(0.4),
      //   offset: Offset(0, 3), 
      //   blurRadius: 10, 
      //   spreadRadius: 5, 
      // ),
      // ],
      ),
    );
  }
}

class LudoRows extends StatelessWidget {
  final Color colorbox; 
  final Color starcolor; 
  LudoRows({
    required this.colorbox,
    required this.starcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int row) {
        if (row == 0) {
          // pehli row
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (int column) {
              if (column == 1) {      // doosra column
                // arrow wala box
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.all(1),
                      color: Colors.white54,
                    ),
                    Icon(Icons.arrow_drop_down_sharp, color: colorbox),
                  ],
                );
              } 
              else {
                return Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.all(1),
                  color: Colors.white54,
                );
              }
            }),
          );
        } 

        else if (row == 1) {
          // doosri row
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (int column) {
              if (column == 1 || column == 2) { // doosra,teesra column 
                return Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.all(1),
                  color: colorbox,
                );
              } 
              else {
                return Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.all(1),
                  color: Colors.white54,
                );
              }
            }),
          );
        } 
        else if (row == 2) {
          // teesri row
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (int column) {
              if (column == 0) { // pehla column
               // star wala box
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.all(1),
                      color: Colors.white54,
                    ),
                    Icon(Icons.star, color: starcolor),
                  ],
                );
              } 
              else {
                return Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.all(1),
                  color: column == 1 ? colorbox : Colors.white54,
                );
              }
            }),
          );
        } 
        // other rows
        else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (int column) {
              return Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.all(1),
                color: column == 1 ? colorbox : Colors.white54,
              );
            }),
          );
        }
      },
    );
  }
}
