import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:flutter_application_1/screens/list_profile.dart';
import 'package:flutter_application_1/models/profile.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: ListProfile(),
      // home: DetailProfile(
      //   profile: Profile(id: 1, name: "Astawa", bio: "Junior Dev"),
      // ),
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
  int _counter = 0;
  int variable = 92;
  TextEditingController namaController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter += variable;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter -= variable;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Counter Cannot be Negative")),
      );
    }
  }

  void _resetCounter() {
    if (_counter > 0) {
      setState(() {
        _counter = 0;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Counter is 0")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('I Andika Nugraha Jayanta Putra: 2415354092'),
            const Text("Step : 92"),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: "Input Nama",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProfile(
                          profile: Profile(
                            id: 0,
                            name: namaController.text,
                            bio: "Developer",
                            desc92: "Haloo",
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Detail Profile"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text("0", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reset',
            child: const Text("0", style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
