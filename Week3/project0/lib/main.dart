import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GDSC 모바일 스터디', style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          shape: Border(
            bottom: BorderSide(
            color: const Color.fromARGB(255, 212, 212, 212),
            width: 1,
            )
          )
        ),

        body:Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              _buildtext('과제'),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildbox("오늘의 과제", Icons.book_outlined),
                  _buildbox("수행한 과제", Icons.collections_bookmark_outlined)
                ]
              ),
                
              _buildtext('나의 수행도'),

              Container( 
                width:400,
                height:350,
                margin: EdgeInsets.fromLTRB(32,10,32,10),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 212, 212, 212),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: TableCalendar(
                  firstDay: DateTime(2024,1,1),
                  lastDay: DateTime(2024, 12, 31),
                  focusedDay: DateTime.now(),
                ),
              ),

              _buildtext('나의 다짐'),
              Container(
                margin: EdgeInsets.fromLTRB(20,0,20,0),
                child: Text('공부와 운동을 매일 꾸준히 하자 - 햄햄',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              )
            ]
          )
        )
      )
    );
  }
}

//텍스트 함수
Widget _buildtext(String text) { 
  return Container(
    margin:EdgeInsets.all(20),
    child: Text(text, 
    style : TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), 
    ),
  );
}

//상자 함수
Widget _buildbox(String text, IconData bookicon) {
  return Container(
          width : 160, 
          height : 160,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 212, 212, 212),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),

          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.all(5),
                child: Text(text, style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              ),   
              Padding(
                padding:EdgeInsets.all(13),
                child: Icon(bookicon, size:80,),
              )   
            ]
          ),
        );
}