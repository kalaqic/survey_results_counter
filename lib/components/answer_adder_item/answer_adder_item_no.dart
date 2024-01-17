import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerAdderNo extends StatefulWidget {
  int no;

  AnswerAdderNo({
    Key? key,
    required this.no,
  }) : super(key: key);

  @override
  State<AnswerAdderNo> createState() => _AnswerAdderNoState();
}

class _AnswerAdderNoState extends State<AnswerAdderNo> {
  void numberAdded() {
    setState(() {
      widget.no = widget.no + 1;
    });
  }

  void numberSubtract() {
    setState(() {
      if (widget.no > 0) {
        widget.no = widget.no - 1;
      }
    });
  }

  void numberReset() {
    setState(() {
      widget.no = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CustomTheme.grayBlue,
          border: Border.all(
            color: CustomTheme.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'NE',
                style: CustomTheme.titleTextStyle(
                  fontSize: 17,
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
                  '${widget.no}',
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
      ),
    );
  }
}
