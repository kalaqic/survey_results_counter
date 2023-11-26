import 'package:flutter/material.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:brojac_glasova/components/survey_question_item.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Map<String, dynamic>> surveyQuestions = [
    {
      'question': 'Da li znate sta je vejp?',
      'yes': 0,
      'no': 0,
      'notSure': 0,
    },
    {
      'question': 'Da li ste ikad konzumirali vejp?',
      'yes': 0,
      'no': 0,
      'notSure': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomTheme.greenBLue,
        title: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset('images/logo.png'),
        ),
      ),
      backgroundColor: CustomTheme.greenBLue,
      body: Column(
        children: [
          Divider(
            thickness: 2,
            color: CustomTheme.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: surveyQuestions.length,
                itemBuilder: (context, index) {
                  return SurveyQuestionItem(
                    yes: surveyQuestions[index]['yes'] as int,
                    no: surveyQuestions[index]['no'] as int,
                    notSure: surveyQuestions[index]['notSure'] as int,
                    question: surveyQuestions[index]['question'] as String,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
