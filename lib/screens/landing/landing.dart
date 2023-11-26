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
          title: const Text('Unesite novo pitanje'),
          content: TextField(
            controller: newTextController,
            decoration: const InputDecoration(hintText: 'Unesite pitanje'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Otkaži'),
            ),
            TextButton(
              onPressed: () {
                if (newTextController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: CustomTheme.orange,
                      content: const Text('Morate uneti pitanje.'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  addNewQuestion(newTextController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Dodaj'),
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
                  ? Text(
                      'KLIKNI PLUS DA DODAS PITANJA',
                      style: CustomTheme.titleTextStyle(),
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
