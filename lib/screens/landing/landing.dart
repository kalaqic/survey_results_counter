import 'package:brojac_glasova/components/survey_question_item.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
              child: ListView(
                children: const [
                  // TODO: dodati da nisu zakucani itemi 
                  // nego da ima neki plusic koji te pita za pitanje
                  // pa generise item sa timi pitanjem
                  SurveyQuestionItem(
                    question: 'Da li znate sta je vejp?',
                  ),
                  SurveyQuestionItem(
                    question: 'Da li ste ikad konzumirali vejp?',
                  ),
                  SurveyQuestionItem(
                    question:
                        'Da li ste upoznati sa posljedicama koristenja vejpa?',
                  ),
                  SurveyQuestionItem(
                    question:
                        'Da li mislite da je vejp zdraviji od obicnih cigareta?',
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
