import 'package:flutter/material.dart';
import 'pages/query_data.dart'; // This is the only import needed
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: LoginScreen(),
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/page-turner.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WellnessWave',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Username/Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Log In'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/subtle-stripes.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.logout, color: Colors.blueAccent),
                        SizedBox(width: 5),
                        Text(
                          'Log Out',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Manage your stress hassle-free!',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.emoji_emotions, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StressEvaluateScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.wifi, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QueryData()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StressReferenceScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Stress Evaluate Screen
class StressEvaluateScreen extends StatelessWidget {
  const StressEvaluateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Check-In'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Daily Check In',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.sentiment_very_satisfied, size: 50, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_neutral, size: 50, color: Colors.yellow),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied, size: 50, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'How are you feeling today?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stress Reference Screen
class StressReferenceScreen extends StatelessWidget {
  const StressReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress Reference'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                Text("log out", style: TextStyle(color: Colors.white)),
                Icon(Icons.logout, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Understanding Your Stress Data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Heart Rate: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                    'Your heart rate reflects your body\'s stress level. A resting heart rate above 90 bpm may indicate stress.\n\n',
                  ),
                  TextSpan(
                    text: 'Stress Level: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                    'Stress levels from Fitbit are calculated using heart rate variability. A lower HRV may mean higher stress.',
                  ),
                ],
              ),
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              'What Your Mood Check-Ins Mean:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text('😊 Happy Face: You\'re feeling good and experiencing low stress.'),
            Text('😐 Neutral Face: You\'re in an average state of stress.'),
            Text('😟 Sad Face: You may be feeling stressed or overwhelmed.'),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.sentiment_very_satisfied, color: Colors.black),
                ),
                CircleAvatar(
                  backgroundColor: Colors.lightGreenAccent,
                  child: Icon(Icons.sentiment_neutral, color: Colors.black),
                ),
                CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(Icons.sentiment_very_dissatisfied, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







