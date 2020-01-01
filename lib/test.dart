import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/products.json');
  }

  Future<String> loadData() async {
    String output = "";
    String jsonString = await _loadAStudentAsset();
    for (int i = 0; i < json.decode(jsonString).length; i++) {
      output += json.decode(jsonString)[i]['Images'];
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    String _text = "";
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: loadData(),
              builder: (ctx, snapshot) {
                if (snapshot.data == null) {
                  return Text("Loading");
                } else {
                  return TextField(
                    controller: TextEditingController(text: snapshot.data),
                  );
                }
              },
            ),
            RaisedButton(
              onPressed: () async {
                String text = await loadData();
                print(text);
                setState(
                  () {
                    _text = text;
                  },
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
