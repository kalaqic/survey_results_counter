import 'package:flutter/material.dart';
import 'package:brojac_glasova/components/custom_pop_up.dart';
import 'package:brojac_glasova/theme.dart';

class SurveyFunctions {
  void addNewQuestion(String newQuestion, List<Map<String, dynamic>> surveyQuestions, TextEditingController newTextController, BuildContext context,
      Function setState) {
    setState(() {
      surveyQuestions.add({
        'question': newQuestion,
        'yes': 0,
        'no': 0,
        'notSure': 0,
      });
    });
  }

  void removeQuestion(String question, List<Map<String, dynamic>> surveyQuestions, Function setState) {
    setState(() {
      surveyQuestions.removeWhere((item) => item['question'] == question);
    });
  }

  void enterYourQuestionPopUp(
      BuildContext context, TextEditingController newTextController, List<Map<String, dynamic>> surveyQuestions, Function setState) {
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
              addNewQuestion(newTextController.text, surveyQuestions, newTextController, context, setState);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: CustomTheme.green,
                  content: Text(
                    'Dodali ste novo pitanje!',
                    style: CustomTheme.titleTextStyle(
                      color: CustomTheme.white,
                      fontSize: 20,
                    ),
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
        );
      },
    );
  }
}
