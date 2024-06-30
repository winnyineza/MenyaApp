import 'package:flutter/material.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';
import 'onboarding_page4.dart';
import 'sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
              OnboardingPage4(),
            ],
          ),
          // Positioned the 'skip' button at the top right
          Positioned(
            top: 60,
            right: 20,
            child: _currentPage != 3
                ? ElevatedButton(
              onPressed: () {
                _pageController.animateToPage(
                  3,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400], // Grey background
              ),
              child: Text(
                'SKIP',
                style: TextStyle(color: Colors.white), // white text color
              ),
            )
                : Container(),
          ),
          // Positioned the progress indicator just above the 'continue' button
          Positioned(
            bottom: 140, // Increased space
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Color(0xFF0056D2) : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          // Positioned the 'continue' button at the bottom center with padding
          Positioned(
            bottom: 40, // Positioning the button at the bottom
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0), // Padding between the progress dots and button
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < 3) {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Handle end of onboarding
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0056D2), // Blue background
                  ),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),// White text color
                  ),
                ),
              ),
            ),
          ),
          // Positioned the back icon at the top left
          if (_currentPage > 0)
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF0056D2)),
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.animateToPage(
                      _currentPage - 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
