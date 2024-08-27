import 'package:flutter/material.dart';
import 'package:mp_app/Format/Text_Design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _taskList = [];
  TextEditingController _addTask = TextEditingController();

  String _fullName = '';
  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fullName = prefs.getString('fullName') ?? 'Use';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBF4F6),
      appBar: AppBar(
          title: Text(
            'Hi! Good Morning $_fullName',
            style: TextStyle(
              color: Color(0xFF37B7C3),
              fontSize: 15,
            ),
          ),
          backgroundColor: Color(0XFF071952),
          actions: [
            Icon(
              Icons.logout_sharp,
              color: Color(0xFF37B7C3),
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ))),
      body: ListView.builder(
        itemCount: _taskList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListText(
                      task: _taskList[index],
                    ),
                  ],
                ),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: Color(0XFF071952),
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF071952),
        child: Icon(Icons.add, color: Color(0xFF37B7C3)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 150,
                  child: Container(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          child: TextField(
                            controller: _addTask,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              labelText: 'Task Assign',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Text_Title(Title_Text: "Add Task"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF37B7C3)),
                              onPressed: () {
                                setState(() {
                                  _taskList.add(_addTask.text);
                                });
                                Navigator.pop(context);
                                Future.delayed(Duration(seconds: 1), () {
                                  _addTask.clear();
                                });
                                print(_taskList);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ListText extends StatelessWidget {
  // ignore: unused_field
  final String task;
  const ListText({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Text(
      task,
    );
  }
}
