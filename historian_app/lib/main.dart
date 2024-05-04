import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _data = "Press Fetch Button, To Get Data!";
  int _input = 0;

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:9999/name/$_input'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final name = responseData["data"]["name"];
        if (name != null) {
          setState(() {
            _data = name;
          });
        } else {
          setState(() {
            _data = "Name is null!";
          });
        }
      } else {
        setState(() {
          _data = "Failed to load data!";
        });
      }
    } catch (error) {
      setState(() {
        _data = 'Error: $error';
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historian'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_data),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    onChanged: (text) {
                      if (text.isEmpty) {
                        setState(() {
                          _input = 0;
                        });
                      }
                      setState(() {
                        _input = int.parse(text);
                        fetchData();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter the ID',
                      labelText: 'ID (numeric)',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(onPressed: fetchData, child: const Text("Fetch"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
