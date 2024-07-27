import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'courses.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Sign Up.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'MENYA TECH',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Here',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Courses()),
                      );
                  // Handle sign up logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0056D2),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Text(' Or Sign Up With '),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Facebook sign up
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0056D2),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                label: Text('Sign Up with Facebook', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google sign up
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.grey),
                ),
                icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                label: Text('Sign Up with Google', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign In Here'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
