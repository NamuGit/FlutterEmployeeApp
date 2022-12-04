import 'package:flutter/material.dart';
import 'package:unitecloud/model/employee.dart';

class EmployeeDetails extends StatefulWidget{
  final Employee empDetails;
  EmployeeDetails({Key? key, required this.empDetails}) : super(key: key);
  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.empDetails.firstName}'s Details"),),
      body: Center(
        child:
        Column(
          children: [
            const SizedBox(height: 15),
            Container(
                width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(width: 10),
                  Image(image:AssetImage('assets/images/user.png'),semanticLabel: "UserIcon",
                    fit: BoxFit.contain,),
                  SizedBox(width: 20,),
                  Expanded(
                      child: Text("${widget.empDetails.firstName} ${widget.empDetails.lastName}", style: TextStyle(fontSize: 18, fontFamily: "Roboto", color: Colors.black),
                  )),
                ],
              )
            ),
            Container(
                width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(width: 10),
                    Image(image:AssetImage('assets/images/closed.png'),semanticLabel: "UserIcon",
                      fit: BoxFit.contain,),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Text("${widget.empDetails.email}", style: TextStyle(fontSize: 18, fontFamily: "Roboto", color: Colors.black),
                        )),
                  ],
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(width: 10),
                    Image(image:AssetImage('assets/images/dob.png'),semanticLabel: "UserIcon",
                      fit: BoxFit.contain,),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Text("${widget.empDetails.dob} ", style: TextStyle(fontSize: 18, fontFamily: "Roboto", color: Colors.black),
                        )),
                  ],
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(width: 10),
                    Image(image:AssetImage('assets/images/address.png'),semanticLabel: "UserIcon",
                      fit: BoxFit.contain,),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Text("${widget.empDetails.address}", style: TextStyle(fontSize: 18, fontFamily: "Roboto", color: Colors.black),
                        )),
                  ],
                )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(width: 10),
                    Image(image:AssetImage('assets/images/call.png'),semanticLabel: "UserIcon",
                      fit: BoxFit.contain,),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Text("${widget.empDetails.contactNumber}", style: TextStyle(fontSize: 18, fontFamily: "Roboto", color: Colors.black),
                        )),
                  ],
                )
            ),
          ],
        ) ,
      )

    );
  }
}