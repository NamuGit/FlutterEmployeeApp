import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:unitecloud/model/employee.dart';
import 'package:unitecloud/screens/employee_details.dart';

class EmployeeListScreen extends StatefulWidget {
  static const String routeName = '/employee-list';

  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => EmployeeListScreenState();
}

class EmployeeListScreenState extends State<EmployeeListScreen> {
  final alphabets =
      List.generate(26, (index) => String.fromCharCode(index + 65));
  final int _searchIndex = 0;
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  Future<List<Employee>> readJsonFile() async {
    final response = await rootBundle.loadString('assets/employees.json');
    final employeeList = await json.decode(response) as List<dynamic>;
    debugPrint('employee_list: $employeeList');
    return employeeList.map((e) => Employee.fromJson(e)).toList();
  }

  void setSearchIndex(String searchLetter, List<Employee> items) {
    setState(() {
      for (var name in items) {
        if (name.firstName[0] == searchLetter) {
          debugPrint('Indesxvalue: ${items.indexOf(name)} $searchLetter');
          _searchIndex == items.indexOf(name);
          _itemScrollController.jumpTo(index: items.indexOf(name));
          break;
        }
      }
      debugPrint('searchLetter: $_searchIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isErrorOccured = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Employee List"),
        ),
        body: FutureBuilder(
          future: readJsonFile(),
          builder: (BuildContext context, data) {
            if (data.hasError) {
              return Text('error:${data.error}');
            } else if (data.hasData) {
              var items = data.data as List<Employee>;
              int alphaIndex = 0;
              items.sort((a, b) {
                return a.firstName
                    .toLowerCase()
                    .compareTo(b.firstName.toLowerCase());
              });
              debugPrint('items_list: ${items[1].firstName}');
              return Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          right: 50, left: 10, top: 10, bottom: 10),
                      child: ScrollablePositionedList.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemScrollController: _itemScrollController,
                          itemPositionsListener: _itemPositionsListener,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, index) {
                            return Card(
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: ListTile(
                                    leading: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                        NetworkImage('${items[index].imageUrl}'),
                                    ),
                                    title: Text(
                                        "${items[index].firstName} ${items[index].lastName}"),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeDetails(
                                                      empDetails:
                                                          items[index])));
                                    }),
                              ),
                            );
                          })),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 20,left: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: alphabets
                              .map((e) => InkWell(
                                  onTap: () {
                                    setSearchIndex(e, items);
                                    for (var word in alphabets) {
                                      if (word == e) {alphaIndex = alphabets.indexOf(e);}}
                                  },
                                  child: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 2,bottom: 1)),
                                      if (alphabets.indexOf(e) == alphaIndex)
                                        Text(e, style: const TextStyle(fontSize: 16, color: Colors.black45))
                                      else
                                        Text(e, style: const TextStyle(fontSize: 16, color: Colors.blue)),
                                    ],
                                  )))
                              .toList())),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
