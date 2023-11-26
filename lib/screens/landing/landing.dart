import 'package:flutter/material.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:brojac_glasova/components/survey_question_item.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController newTextController = TextEditingController();

  List<Map<String, dynamic>> surveyQuestions = [];

  void addNewQuestion(String newQuestion) {
    setState(() {
      surveyQuestions.add({
        'question': newQuestion,
        'yes': 0,
        'no': 0,
        'notSure': 0,
      });
    });
  }

  void enterYourQuestionPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: CustomTheme.darkerBlue,
          title: Text(
            'Unesite novo pitanje:',
            style: CustomTheme.titleTextStyle(fontSize: 18),
          ),
          content: TextField(
            style: TextStyle(
              color: CustomTheme.white,
            ),
            controller: newTextController,
            decoration: InputDecoration(
                hintText: 'Unesite pitanje',
                hintStyle: TextStyle(
                  color: CustomTheme.white,
                )),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'otkazi',
                style: CustomTheme.titleTextStyle(
                  color: CustomTheme.red,
                  fontSize: 17,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (newTextController.text.startsWith(' ') ||
                    newTextController.text.isEmpty ||
                    newTextController.text.endsWith(' ')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: CustomTheme.darkerBlue,
                      content: Text(
                        'Pitanje nije odgovarajuce!',
                        style: CustomTheme.titleTextStyle(
                          color: CustomTheme.red,
                          fontSize: 20,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  addNewQuestion(newTextController.text);
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'DODAJ',
                style: CustomTheme.titleTextStyle(
                  color: CustomTheme.green,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomTheme.darkerBlue,
        onPressed: () {
          enterYourQuestionPopUp();
        },
        child: const Icon(Icons.add),
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
                      children: [
                        Text(
                          'KLIKNI PLUS DA DODAS PITANJA',
                          style: CustomTheme.titleTextStyle(),
                        ),
                        Text(
                          'ILI INFO DUGME ZA INFO',
                          style: CustomTheme.titleTextStyle(),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: surveyQuestions.length,
                      itemBuilder: (context, index) {
                        return SurveyQuestionItem(
                          yes: surveyQuestions[index]['yes'] as int,
                          no: surveyQuestions[index]['no'] as int,
                          notSure: surveyQuestions[index]['notSure'] as int,
                          question:
                              surveyQuestions[index]['question'] as String,
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
