import 'package:cavemen/AppRoutes/AppRoutes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<OnboardingData> _contents = [
    OnboardingData(
      title: "Welcome to\nCaveman Challenge",
      description: "The first fitness App. Improve your fitness, practice mindfulness, or prepare for new adventures with a series of specially designed workouts.",
      image: "assets/onboard1.png",
      buttonText: "GET STARTED",
    ),
    OnboardingData(
      title: "Workout Categories",
      description: "Workout categories will help you gain strength, get in better shape and embrace a healthy lifestyle.",
      image: "assets/onboard2.png",
      buttonText: "START TRAINING",
    ),
    OnboardingData(
      title: "Custom Workouts",
      description: "Create and save your own custom workouts. Name your workouts, save them, and they'll automatically appear when you're ready to workout.",
      image: "assets/onboard3.png",
      buttonText: "START TRAINING",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background & Text Content
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemCount: _contents.length,
            itemBuilder: (context, index) {
              return OnboardingPage(data: _contents[index]);
            },
          ),

          // Top "Skip" Button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
              child: Text("SKIP", style: TextStyle(color: Color(0xFFFF725E), fontWeight: FontWeight.bold)),
            ),
          ),

          // Bottom UI (Dots and Button)
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Page Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_contents.length, (index) => buildDot(index)),
                ),
                SizedBox(height: 30),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentIndex == _contents.length - 1) {
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF725E), // The coral/orange color
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      _contents[_currentIndex].buttonText,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 8,
      width: 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentIndex == index ? Color(0xFFFF725E) : Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(data.image, fit: BoxFit.cover),
        ),

        // Dark Gradient Overlay for text readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),

        // Text Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 160), // Space for dots and button
            ],
          ),
        ),
      ],
    );
  }
}
class OnboardingData {
  final String title;
  final String description;
  final String image;
  final String buttonText;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
    required this.buttonText,
  });
}