import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mp_app/Model/getTodoModel.dart';

class API {
  Future<List<getTodoModel>> getTodoAPI() async {
    List<getTodoModel> get_todo = [];
    var url = Uri.parse("https://api.todoist.com/rest/v2/tasks");
    var response = await http.get(url, headers: {
      'Authorization': "Bearer e302a1ac4e06d639a8196fa6ebce9e6cebce484f"
    });

    var responseBody = jsonDecode(response.body);

    // Check if the responseBody is a list of maps

    for (var todo in responseBody) {
      get_todo.add(getTodoModel.fromJson(todo));
    }

    return get_todo;
  }

  Future<void> post_todoApi(String _content, String _desc) async {
    var url = Uri.parse("https://api.todoist.com/rest/v2/tasks");
    var response = await http.post(url,
        headers: {
          'Authorization': "Bearer e302a1ac4e06d639a8196fa6ebce9e6cebce484f",
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "content": _content,
          "description": _desc,
          "due": {"string": "10 Oct"}
        }));

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Task added successfully');
    } else {
      print('Failed to add task: ${response.statusCode}, ${response.body}');
    }
  }

  Future<void> updateTask(
      String taskId, String updatedContent, String updateDesc) async {
    var url = Uri.parse("https://api.todoist.com/rest/v2/tasks/$taskId");

    // The body of the request contains the updated task content
    var requestBody = jsonEncode({
      "content": updatedContent,
      "description": updateDesc, // The updated task content
      // You can add other optional fields like "priority", "due_date", etc.
    });

    // Add the authorization header with a bearer token
    var response = await http.post(
      url,
      headers: {
        'Authorization': "Bearer e302a1ac4e06d639a8196fa6ebce9e6cebce484f",
        'Content-Type': 'application/json',
      },
      body: requestBody,
    );

    // Handle the response
    if (response.statusCode == 200) {
      print('Task updated successfully');
    } else {
      print('Failed to update task: ${response.statusCode}, ${response.body}');
    }
  }

  Future<void> deleteTask(String taskId) async {
    var url = Uri.parse("https://api.todoist.com/rest/v2/tasks/$taskId");

    // Add the authorization header with a bearer token
    var response = await http.delete(
      url,
      headers: {
        'Authorization': "Bearer e302a1ac4e06d639a8196fa6ebce9e6cebce484f",
      },
    );

    // Handle the response
    if (response.statusCode == 204) {
      print('Task deleted successfully');
    } else {
      print('Failed to delete task: ${response.statusCode}, ${response.body}');
    }
  }
}
