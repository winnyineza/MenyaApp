import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_up_screen.dart';
import 'forgot_password_screen.dart';
import 'onboarding_page4.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => OnboardingPage4()));// Handle back button press
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
                'Sign In.',
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text('Forget Password?'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle sign in logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0056D2),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Text(' Or Sign In With '),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Facebook sign in
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0056D2),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                label: Text('Sign In with Facebook', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google sign in
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.grey),
                ),
                icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                label: Text('Sign In with Google', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text('Sign Up Here'),
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

