import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/views/gradiant_background.dart';
import 'package:quiz_app/views/question_page.dart';
import 'package:quiz_app/views/result_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(radius: 100, backgroundColor: Colors.white38),
                  Image.asset(
                    'assets/images/quiz.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text(
                'Learn With Flutter',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Test Your Knowledge and improve your skills',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to the question page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionPage(),
                    ),
                  );
                },
                label: Text(
                  'Start Quiz',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.lightBlueAccent.shade400,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                icon: Align(
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.blue,
                    size: 24,
                  ),
                ),
                iconAlignment: IconAlignment.end,

                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ), // Custom padding
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
