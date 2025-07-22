import 'package:flutter/material.dart';
import 'api_functions.dart';

// This is a demo page to show how to use http call API gateway to save Fitbit data and display results on UI.
class SaveData extends StatefulWidget {
  const SaveData({super.key});

  @override
  State<SaveData> createState() => _SaveDataPageState();
}

// This function updates page given state change
class _SaveDataPageState extends State<SaveData> {
  Future<String>? futureStoreHeartRate;
  final TextEditingController _controller_collectTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller_collectTime.text = '2025-02-14';
  }

  @override
  void dispose() {
    _controller_collectTime.dispose();
    super.dispose();
  }

  void _updateText() {
    futureStoreHeartRate = saveHeartRate(_controller_collectTime.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Heart Rate'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 110.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controller_collectTime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Collect date time',
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
                  'Store Heart Rate',
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
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
      future: futureStoreHeartRate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Heart rate data saved successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          });
          return Center(child: Text(snapshot.data!));
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('❌ Failed to save data.'),
                backgroundColor: Colors.red,
              ),
            );
          });
          return Text('${snapshot.error}');
        } else {
          if (futureStoreHeartRate == null) {
            return const Text('No Results.');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}
