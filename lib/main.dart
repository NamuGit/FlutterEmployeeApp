import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unitecloud/screens/employee_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Hello UniteCloud",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,

      // EmployeeListScreen(),

      // routes: {
      //   EmployeeListScreen.routeName: (context) => EmployeeListScreen()
      // },
    );
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                 EmployeeListScreen(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child:Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Colors.white,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(image:AssetImage('assets/images/employees.png'),semanticLabel: "EmployeeIcon",
                    fit: BoxFit.contain,),
                  Text("Employees Tracker", style: TextStyle(color: Colors.black,fontSize: 20,),),
                ],
              )
          )
      ),
    );

  }
}
