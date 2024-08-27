import 'package:flutter/material.dart';
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
                child: Center(child: Text(_addTask.text)),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  border: Border(),
                  color: Color(0xFF37B7C3),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 200,
                  child: Container(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //SizedBox(height: 20),
                            Container(
                              width: 300,
                              child: TextField(
                                controller: _addTask,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  labelText: 'Task Assign',
                                ),
                              ),
                            ),
                            ElevatedButton(
                              child: Text("Add Task"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0XFF071952)),
                              onPressed: () {
                                setState(() {
                                  _taskList.add(_addTask.text);
                                });

                                Future.delayed(Duration(seconds: 1), () {
                                  _addTask.clear();
                                });
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
