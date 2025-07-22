import 'package:flutter/material.dart';
import 'api_functions.dart';
import 'save_data.dart'; // Import for navigation

// This is a demo page to show how to use http call API gateway to fetch Fitbit data and display on UI.
class QueryData extends StatefulWidget {
  const QueryData({super.key});

  @override
  State<QueryData> createState() => _QueryDataPageState();
}

class _QueryDataPageState extends State<QueryData> {
  Future<String>? futureHeartRate;

  final TextEditingController _controller_startTime = TextEditingController();
  final TextEditingController _controller_endTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller_startTime.text = '2025-02-14';
    _controller_endTime.text = '2025-02-14';
  }

  @override
  void dispose() {
    _controller_startTime.dispose();
    _controller_endTime.dispose();
    super.dispose();
  }

  void _updateText() {
    futureHeartRate = getHeartRate(_controller_startTime.text, _controller_endTime.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 110.0)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controller_startTime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start date time',
                  hintText: 'Enter datetime: yyyy-mm-dd',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
              child: TextField(
                controller: _controller_endTime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'End date time',
                  hintText: 'Enter datetime: yyyy-mm-dd',
                ),
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              height: 65,
              width: 360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blueAccent),
                ),
                onPressed: _updateText,
                child: const Text(
                  'Query Heart Rate',
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 59, 105),
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: buildFutureBuilder(),
            ),

            const SizedBox(height: 10),

            // ✅ Save Button added here
            SizedBox(
              height: 55,
              width: 320,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SaveData()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Save Heart Rate Data',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
      future: futureHeartRate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: Text(snapshot.data!));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          if (futureHeartRate == null) {
            return const Text('No Data.');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}
