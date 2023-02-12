import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectDate.toString(),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  selectableDayPredicate: (day) {
                    // daterange
                    if (day.isAfter(
                            DateTime.now().subtract(Duration(days: 5))) &&
                        (day.isBefore(
                          DateTime.now().add(Duration(days: 2)),
                        ))) {
                      return true;
                    }

                    return false;
                  },
                  // initialEntryMode: DatePickerEntryMode.calendarOnly,
                  // initialDatePickerMode: DatePickerMode.day,
                  
                ).then(
                  (value) {
                    print(value);
                    if (value != null) {
                      setState(() {
                        selectDate = value;
                      });
                    }
                  },
                );
              },
              child: Text('Date Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
