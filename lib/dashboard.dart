import 'package:flutter/material.dart';
import 'package:mp_app/Format/Text_Design.dart';
import 'package:mp_app/Model/getTodoModel.dart';
import 'package:mp_app/Service/getTodoAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  API _api = API();

  TextEditingController _addTask = TextEditingController();
  TextEditingController _addDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffEBF4F6),
      appBar: AppBar(
          title: Text(
            'Hi! Good Morning',
            style: TextStyle(
              color: Color(0xFF37B7C3),
              fontSize: screenHeight * 0.02, // Responsive text size
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
      body: FutureBuilder<List<getTodoModel>>(
        future: _api.getTodoAPI(),
        builder: (context, AsyncSnapshot<List<getTodoModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitCircle(
                size: 50,
                color: Colors.blueAccent,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                TextEditingController _editContentController =
                    TextEditingController();
                TextEditingController __editdescController =
                    TextEditingController();
                _editContentController.text =
                    snapshot.data![index].content ?? "";
                __editdescController.text = snapshot.data![index].description ??
                    ""; // Pre-fill with existing task content

                return Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.01, // Responsive spacing
                    ),
                    Container(
                      height:
                          screenHeight * 0.15, // Responsive container height
                      width: screenWidth * 0.8, // Responsive container width
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  maxLines: 1, // Limit to 2 lines
                                  overflow: TextOverflow.ellipsis,
                                  snapshot.data![index].content ?? "No Title",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight *
                                        0.02, // Responsive text size
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  maxLines: 1, // Limit to 2 lines
                                  overflow: TextOverflow.ellipsis,
                                  snapshot.data![index].due?.string ??
                                      "No Due Date",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight *
                                        0.02, // Responsive text size
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: SizedBox(
                                          height: 150,
                                          child: Container(
                                            width: 500,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 250,
                                                  child: TextField(
                                                    controller:
                                                        _editContentController,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      labelText: 'Update Task',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 250,
                                                  child: TextField(
                                                    controller:
                                                        __editdescController,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      labelText: 'Update Task',
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      child:
                                                          Text("Update Task"),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF37B7C3)),
                                                      onPressed: () {
                                                        _api
                                                            .updateTask(
                                                                snapshot
                                                                        .data![
                                                                            index]
                                                                        .id ??
                                                                    "", // Pass the task ID
                                                                _editContentController
                                                                    .text,
                                                                __editdescController
                                                                    .text // Updated task content
                                                                )
                                                            .then((value) {
                                                          Navigator.pop(
                                                              context); // Close the modal
                                                          setState(
                                                              () {}); // Refresh the screen if needed
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
                              IconButton(
                                  onPressed: () {
                                    _api
                                        .deleteTask(
                                            snapshot.data![index].id.toString())
                                        .then((value) {
                                      setState(
                                          () {}); // Refresh the UI after deletion
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.01, // Responsive spacing
                          ),
                          Text(
                            maxLines: 2, // Limit to 2 lines
                            overflow: TextOverflow.ellipsis,
                            snapshot.data![index].description ??
                                "No Description",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  screenHeight * 0.02, // Responsive text size
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0XFF071952),
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ],
                );
              },
            );
          }
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
                  height: screenHeight * 0.3, // Responsive modal height
                  child: Container(
                    width: screenWidth * 0.8, // Responsive container width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width:
                              screenWidth * 0.7, // Responsive text field width
                          child: TextField(
                            controller: _addTask,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              labelText: 'Task Content',
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          width:
                              screenWidth * 0.7, // Responsive text field width
                          child: TextField(
                            controller: _addDesc,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              labelText: 'Task Description',
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Responsive spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                child: Text_Title(Title_Text: "Add Task"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF37B7C3)),
                                onPressed: () {
                                  _api
                                      .post_todoApi(
                                          _addTask.text, _addDesc.text)
                                      .then((value) {
                                    Navigator.pop(context); // Close the modal
                                    setState(() {});
                                    _addTask.clear();
                                  });
                                })
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
