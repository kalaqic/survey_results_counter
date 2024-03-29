import 'package:brojac_glasova/components/answer_adder_item/answer_adder_item_no.dart';
import 'package:brojac_glasova/components/answer_adder_item/answer_adder_item_not_sure.dart';
import 'package:brojac_glasova/components/answer_adder_item/answer_adder_item_yes.dart';
import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurveyQuestionItem extends StatefulWidget {
  final String question;
  final int yes;
  final int no;
  final int notSure;
  final Function() onDelete;
  const SurveyQuestionItem({
    required this.onDelete,
    required this.notSure,
    required this.no,
    required this.yes,
    required this.question,
    super.key,
  });

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
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CustomTheme.white),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 0),
              child: Text(
                widget.question,
                style: CustomTheme.titleTextStyle(),
              ),
            ),
            Divider(
              thickness: 2,
              color: CustomTheme.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnswerAdderYes(
                  yes: widget.yes,
                ),
                AnswerAdderNo(
                  no: widget.no,
                ),
                AnswerAdderNotSure(
                  notSure: widget.notSure,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: widget.onDelete,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: CustomTheme.red,
                    border: Border.all(
                      color: CustomTheme.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'icons/delete.svg',
                      colorFilter: ColorFilter.mode(
                        CustomTheme.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
