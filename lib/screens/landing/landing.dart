import 'package:flutter/material.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:brojac_glasova/components/survey_question_item.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    int yes1 = 0;
    int yes2 = 0;
    int yes3 = 0;
    int yes4 = 0;
    int no1 = 0;
    int no2 = 0;
    int no3 = 0;
    int no4 = 0;
    int notSure1 = 0;
    int notSure2 = 0;
    int notSure3 = 0;
    int notSure4 = 0;

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
                children: [
                  // TODO: dodati da nisu zakucani itemi
                  // nego da ima neki plusic koji te pita za pitanje
                  // pa generise item sa tim pitanjem
                  SurveyQuestionItem(
                    yes: yes1,
                    no: no1,
                    notSure: notSure1,
                    question: 'Da li znate sta je vejp?',
                  ),
                  SurveyQuestionItem(
                    yes: yes2,
                    no: no2,
                    notSure: notSure2,
                    question: 'Da li ste ikad konzumirali vejp?',
                  ),
                  SurveyQuestionItem(
                    yes: yes3,
                    no: no3,
                    notSure: notSure3,
                    question:
                        'Da li ste upoznati sa posljedicama koristenja vejpa?',
                  ),
                  SurveyQuestionItem(
                    yes: yes4,
                    no: no4,
                    notSure: notSure4,
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
