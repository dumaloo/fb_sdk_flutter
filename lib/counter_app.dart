import 'package:flutter/material.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final facebookAppEvents = FacebookAppEvents(); //instance created
  int _count = 0;
  String _userDetails = ''; // Store user details here

  @override
  void initState() {
    super.initState();
    // Retrieve user details (replace with your logic for fetching user details)
    _userDetails = 'Saksham'; // Temporary placeholder
    // Log user details event
    facebookAppEvents.logEvent(
        name: 'user_details_fetched',
        parameters: {'user_id': '12345', 'name': _userDetails});
  }

  void _incrementCounter() {
    setState(() {
      _count++;
      // Log counter increment event
      facebookAppEvents.logEvent(name: 'counter_incremented');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text('User Details: $_userDetails'), // Display user details
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
