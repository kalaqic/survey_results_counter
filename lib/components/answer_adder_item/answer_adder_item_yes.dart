import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerAdderYes extends StatefulWidget {
  int yes;

  AnswerAdderYes({
    Key? key,
    required this.yes,
  }) : super(key: key);

  @override
  State<AnswerAdderYes> createState() => _AnswerAdderYesState();
}

class _AnswerAdderYesState extends State<AnswerAdderYes> {
  void numberAdded() {
    setState(() {
      widget.yes = widget.yes + 1;
    });
  }

  void numberReset() {
    setState(() {
      widget.yes = 0;
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
                'DA',
                style: CustomTheme.titleTextStyle(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              numberAdded();
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
                  '${widget.yes}',
                  style: CustomTheme.titleTextStyle(),
                ),
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
