import 'package:flutter/material.dart';
import 'main.dart';

class MyResultPage extends StatefulWidget {
  const MyResultPage({super.key,
    required this.title,
    required this.log,
    required this.asleep,
    required this.awake,
    required this.date});
  final String log;
  final String title;
  final TimeOfDay awake;
  final TimeOfDay asleep;
  final String date;

  @override
  State<MyResultPage> createState() => _MyResultPageState();
}

class _MyResultPageState extends State<MyResultPage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('Log for ${widget.date}'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
                'You fell asleep at ${widget.asleep.toString().substring(10, 15)}',
              style: const TextStyle(fontSize: 24),
            ),
            const Spacer(),
            Text(
                'You woke up at ${widget.awake.toString().substring(10, 15)}',
                style: const TextStyle(fontSize: 24),
            ),
            const Spacer(),
            const Text(
                'You dreamt of',
                style: TextStyle(fontSize: 24),
            ),
            Text(
                widget.log,
            style: const TextStyle(fontSize: 24),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}