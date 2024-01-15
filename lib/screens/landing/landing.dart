import 'package:brojac_glasova/components/custom_pop_up.dart';
import 'package:brojac_glasova/spacing.dart';
import 'package:flutter/material.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:brojac_glasova/components/survey_question_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController newTextController = TextEditingController();

  List<Map<String, dynamic>> surveyQuestions = [];

  addNewQuestion(String newQuestion) {
    setState(
      () {
        surveyQuestions.add(
          {
            'question': newQuestion,
            'yes': 0,
            'no': 0,
            'notSure': 0,
          },
        );
      },
    );
  }

  void removeQuestion(String question) {
    setState(() {
      surveyQuestions.removeWhere((item) => item['question'] == question);
    });
  }

  void enterYourQuestionPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomPopUp(
          controller: newTextController,
          onSave: () {
            if (newTextController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: CustomTheme.red,
                  content: Text(
                    'Pitanje nije odgovarajuce!',
                    style: CustomTheme.titleTextStyle(
                      color: CustomTheme.white,
                      fontSize: 20,
                    ),
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            } else {
              addNewQuestion(newTextController.text);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: CustomTheme.darkerBlue,
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
            heroTag: null,
            child: const Icon(
              Icons.info,
            ),
          ),
          VerticalSpacing.XS(),
          FloatingActionButton(
            backgroundColor: CustomTheme.darkerBlue,
            onPressed: () {
              enterYourQuestionPopUp();
            },
            heroTag: null,
            child: const Icon(
              Icons.add,
            ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'nemas nikakvih pitanja',
                          style: CustomTheme.titleTextStyle(
                            color: CustomTheme.grayBlue,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'KLIKNI PLUS DA DODAS PITANJA',
                              style: CustomTheme.titleTextStyle(),
                            ),
                            VerticalSpacing.XS(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ILI INFO ZA INFO O APK',
                                  style: CustomTheme.titleTextStyle(),
                                ),
                                HorizontalSpacing.custom(40),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6,
                                  ),
                                  child: SvgPicture.asset(
                                    'icons/curve-arrow-down.svg',
                                    colorFilter: ColorFilter.mode(
                                      CustomTheme.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            removeQuestion(surveyQuestions[index]['question']);
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
