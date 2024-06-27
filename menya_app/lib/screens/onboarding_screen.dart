import 'package:flutter/material.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';
import 'onboarding_page4.dart';

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
          Positioned(
            top: 40,
            right: 20,
            child: _currentPage != 3
                ? TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  3,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                'SKIP',
                style: TextStyle(color: Color(0xFF0056D2)),
              ),
            )
                : Container(),
          ),
          Positioned(
            bottom: 50,
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
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
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
                  backgroundColor: Color(0xFF0056D2),
                ),
                child: Text('CONTINUE'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
