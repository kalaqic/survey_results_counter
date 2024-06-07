import 'package:flutter/material.dart';
import 'package:brojac_glasova/functions.dart';
import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:brojac_glasova/components/survey_question_item.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController newTextController = TextEditingController();

  List<Map<String, dynamic>> surveyQuestions = [];
  SurveyFunctions surveyFunctions = SurveyFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        elevation: 5,
        buttonSize: const Size(50, 50),
        overlayColor: CustomTheme.darkerBlue,
        backgroundColor: Colors.black,
        activeBackgroundColor: CustomTheme.greenBLue,
        foregroundColor: CustomTheme.white,
        icon: Icons.add,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            label: 'Dodaj pitanje',
            labelBackgroundColor: CustomTheme.greenBLue,
            labelStyle: CustomTheme.titleTextStyle(
              fontSize: 20,
              color: CustomTheme.white,
            ),
            foregroundColor: Colors.black,
            child: const Icon(
              Icons.question_mark,
            ),
            onTap: () {
              surveyFunctions.enterYourQuestionPopUp(
                context,
                newTextController,
                surveyQuestions,
                setState,
              );
            },
          ),
          SpeedDialChild(
            label: 'Info',
            labelStyle: CustomTheme.titleTextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            foregroundColor: CustomTheme.white,
            backgroundColor: CustomTheme.greenBLue,
            onLongPress: () {},
            child: const Icon(
              Icons.info,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
          SpeedDialChild(
            label: 'Pokazi Grafikone',
            labelStyle: CustomTheme.titleTextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            labelBackgroundColor: CustomTheme.greenBLue,
            foregroundColor: Colors.black,
            backgroundColor: CustomTheme.white,
            child: const Icon(
              Icons.calculate,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
      ),
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
              child: surveyQuestions.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NEMATE DOSTUPNIH PITANJA',
                          style: CustomTheme.titleTextStyle(
                            color: CustomTheme.grayBlue,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'KLIKNI PLUS ZA VISE OPCIJA',
                              style: CustomTheme.titleTextStyle(
                                color: CustomTheme.white,
                              ),
                            ),
                            VerticalSpacing.XS(),
                            VerticalSpacing.custom(170),
                          ],
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: surveyQuestions.length,
                      itemBuilder: (context, index) {
                        return SurveyQuestionItem(
                          onDelete: () {
                            surveyFunctions.removeQuestion(
                              surveyQuestions[index]['question'],
                              surveyQuestions,
                              setState,
                            );
                          },
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
