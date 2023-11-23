import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerAdderYes extends StatefulWidget {
  const AnswerAdderYes({
    super.key});

  @override
  State<AnswerAdderYes> createState() => _AnswerAdderYesState();
}

int yes = 0;

void numberAdded() {
  yes = yes + 1;
}

void numberReset() {
  yes = 0;
}

class _AnswerAdderYesState extends State<AnswerAdderYes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: CustomTheme.darkerBlue,
            ),
            child: Center(
              child: Text(
                'DA',
                style: CustomTheme.titleTextStyle(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                numberAdded();
              });
            },
            child: SvgPicture.asset(
              'icons/plus_square.svg',
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: CustomTheme.darkerBlue,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$yes',
                  style: CustomTheme.titleTextStyle(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  numberReset();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomTheme.orange),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'RESET',
                    style: CustomTheme.titleTextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
