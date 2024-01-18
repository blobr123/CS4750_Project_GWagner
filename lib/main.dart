import 'package:flutter/material.dart';
import 'log.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamWell',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _logDream() {
    setState(() {
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const MyLogPage(title: 'Dream Logging')),
     );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueGrey,
      body:  const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 50),
             Text(
              'DreamWell',
                style: TextStyle(

                 fontSize: 48,
                 fontWeight: FontWeight.bold,
              ),
              ),
            Spacer(),
            Text(
              'Log here =>',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _logDream,
        tooltip: 'Log',
        child: const Icon(Icons.add),
      ),
    );
  }
}
