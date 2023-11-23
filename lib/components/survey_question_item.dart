import 'package:brojac_glasova/components/answer_adder_item/answer_adder_item_no.dart';
import 'package:brojac_glasova/components/answer_adder_item/answer_adder_item_not_sure.dart';
import 'package:brojac_glasova/components/answer_adder_item/answer_adder_item_yes.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';

class SurveyQuestionItem extends StatefulWidget {
  final String question;
  const SurveyQuestionItem({required this.question, super.key});

  @override
  State<SurveyQuestionItem> createState() => _SurveyQuestionItemState();
}

class _SurveyQuestionItemState extends State<SurveyQuestionItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CustomTheme.greenBLue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CustomTheme.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.question,
                  style: CustomTheme.titleTextStyle(),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: CustomTheme.white,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TODO: odvojiti ove od onih u drugoj komponenti,
                AnswerAdderYes(),
                AnswerAdderNo(),
                AnswerAdderNotSure(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
