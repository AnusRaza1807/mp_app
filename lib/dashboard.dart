import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _fullName = '';

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fullName = prefs.getString('fullName') ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi! Good Morning $_fullName'),
      ),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
