import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerAdderNotSure extends StatefulWidget {
  int notSure;

  AnswerAdderNotSure({
    Key? key,
    required this.notSure,
  }) : super(key: key);

  @override
  State<AnswerAdderNotSure> createState() => _AnswerAdderNotSureState();
}

class _AnswerAdderNotSureState extends State<AnswerAdderNotSure> {
  void numberAdded() {
    setState(() {
      widget.notSure = widget.notSure + 1;
    });
  }

  void numberSubtract() {
    setState(() {
      widget.notSure = widget.notSure - 1;
    });
  }

  void numberReset() {
    setState(() {
      widget.notSure = 0;
    });
  }

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
          Row(
            children: [
              InkWell(
                onTap: () {
                  numberAdded();
                },
                child: SvgPicture.asset(
                  'icons/plus_square.svg',
                ),
              ),
              HorizontalSpacing.S(),
              InkWell(
                onTap: () {
                  numberSubtract();
                },
                child: SvgPicture.asset(
                  'icons/minus_square.svg',
                ),
              ),
            ],
          ),
          Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              color: CustomTheme.darkerBlue,
            ),
            child: Center(
              child: Text(
                '${widget.notSure}',
                style: CustomTheme.titleTextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                numberReset();
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomTheme.orange),
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
