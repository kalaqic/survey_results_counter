import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerAdderNotSure extends StatefulWidget {
  const AnswerAdderNotSure({super.key});

  @override
  State<AnswerAdderNotSure> createState() => _AnswerAdderNotSureState();
}

int notSure = 0;

void numberAdded() {
  notSure = notSure + 1;
}

void numberReset() {
  notSure = 0;
}

class _AnswerAdderNotSureState extends State<AnswerAdderNotSure> {
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
                'NISAM SIGURAN',
                style: CustomTheme.titleTextStyle(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(
                () {
                  numberAdded();
                },
              );
            },
            child: SvgPicture.asset(
              'icons/plus_square.svg',
            ),
          ),
          Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              color: CustomTheme.darkerBlue,
            ),
            child: Center(
              child: Text(
                '$notSure',
                style: CustomTheme.titleTextStyle(),
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
