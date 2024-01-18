import 'package:flutter/material.dart';
import 'result.dart';

class MyLogPage extends StatefulWidget {
  const MyLogPage({super.key, required this.title});
  final String title;

  @override
  State<MyLogPage> createState() => _MyLogPageState();
}

class _MyLogPageState extends State<MyLogPage> {
  final myController = TextEditingController();
  late TimeOfDay _timeSleep;
  late TimeOfDay _timeAwake;
  late TimeOfDay _time;
   TimeOfDay _time2 = TimeOfDay.now();

  void _finalizeLog() {
    DateTime dateToday = DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    late String loggedDream;
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            MyResultPage(
              title: 'Log for $date',
              log: myController.text,
              asleep: _timeSleep,
              awake: _timeAwake,
              date: date,)
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours1 = _time.hour.toString().padLeft(2, '0');
    final minutes1 = _time.minute.toString().padLeft(2, '0');
    final hours2 = _time2.hour.toString().padLeft(2, '0');
    final minutes2 = _time2.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('When did you fall asleep: $hours1:$minutes1',
                      style: const TextStyle(
                          fontSize: 24),
                      textAlign: TextAlign.center),
                  trailing: const Icon(
                      Icons.timer),
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.inputOnly
                    );
                    if (newTime == null) return;
                    setState(() => _time = newTime);
                    setState(() => _timeSleep = _time);
                  },
                ),
                ListTile(
                  title: Text('When did you wake up: $hours2:$minutes2',
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center),
                  trailing: const Icon(Icons.timer),
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.inputOnly
                    );
                    if (newTime == null) return;
                    setState(() => _time2 = newTime);
                    setState(() => _timeAwake = _time2);
                  },
                ),
                const Spacer(),
                const Text('What did you dream of?',
                    style: TextStyle(fontSize: 24)),
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()),
                  maxLines: null,
                ),
                const Spacer(),
              ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _finalizeLog,
        tooltip: 'Increment',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}