import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'firebase_options.dart';
import 'provider/course_provider.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(
    // Wrap the app with ChangeNotifierProvider to provide CourseProvider
    ChangeNotifierProvider(
      create: (context) => CourseProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        // This future is redundant if you've already called Firebase.initializeApp() in main(),
        // but it's a good safety measure in case the initialization failed there.
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('An error occurred while initializing Firebase'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }

          // Show a loading spinner while initializing
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
