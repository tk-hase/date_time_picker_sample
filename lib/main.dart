import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Date & Time selection sample'),
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
  String _selectionDate = "";
  String _selectionTime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buttonAndLabel(
              () async {
                final selectedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023, 1, 1), lastDate: DateTime.now());
                _setDate(selectedDate);
              },
              "日付を選択する",
              _selectionDate,
            ),
            _buttonAndLabel(
              () async {
                final selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                _setTime(selectedTime);
              },
              "時間を選択する",
              _selectionTime,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonAndLabel(void Function() onPressed, String buttonText, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
          Text(labelText, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  void _setDate(DateTime? dateTime) {
    setState(() {
      if (dateTime == null) {
        _selectionDate = "";
      } else {
        _selectionDate = "日付: ${dateTime.toString()}";
      }
    });
  }

  void _setTime(TimeOfDay? timeOfDay) {
    setState(() {
      if (timeOfDay == null) {
        _selectionTime = "";
      } else {
        _selectionTime = "時間: ${timeOfDay.format(context)}";
      }
    });
  }
}
