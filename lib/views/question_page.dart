import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/views/gradiant_background.dart';
import 'package:quiz_app/views/result_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  double _selectedQuestion = 1;
  final List<String> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Slider(
                  value: _selectedQuestion,
                  min: 1,
                  max: 6,
                  divisions: 5,
                  label: _selectedQuestion.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      _selectedQuestion = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Question ${_selectedQuestion.toInt()} / 6',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      questions[_selectedQuestion.toInt() - 1].question,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ...questions[_selectedQuestion.toInt() - 1].answers
                    .map(
                      (answer) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle answer submission
                              setState(() {
                                if (_selectedQuestion < 6) {
                                  _selectedQuestion =
                                      _selectedQuestion.toInt() + 1;
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ResultPage(
                                            selectedAnswer: selectedAnswers,
                                          ),
                                    ),
                                  );
                                }
                                selectedAnswers.add(answer);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(answer, textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
