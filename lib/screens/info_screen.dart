import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomTheme.greenBLue,
        title: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset('images/logo.png'),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                'icons/back.svg',
                colorFilter: ColorFilter.mode(
                  CustomTheme.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: CustomTheme.greenBLue,
      body: ListView(
        children: [
          Column(
            children: [
              Divider(
                thickness: 2,
                color: CustomTheme.white,
              ),
              VerticalSpacing.L(),
              Text(
                'INFO',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(
                  fontSize: 30,
                  color: CustomTheme.green,
                ),
              ),
              VerticalSpacing.M(),
              Text(
                'Kada udjete na ekran docekani ste sa tri dugmeta:\nInfo, Plus i Kalkulacija\nImate opciju da dodate pitanje, da kalkulisete odgovore ili da vidite uputstvo za koristenje aplikacije nazvan "Info"\nPritiskom na plus izace vam ovo:',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(),
              ),
              VerticalSpacing.L(),
              Image.asset(
                'images/info_images/pop_up_picture.png',
                height: 300,
              ),
              VerticalSpacing.L(),
              Text(
                'Tu unesite pitanje sa ankete i stisnite dugme "Sacuvaj" kako bi pitanje dodali na pocetni ekran.',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(),
              ),
              VerticalSpacing.L(),
              Image.asset(
                'images/info_images/survey_item_picture.png',
                height: 240,
              ),
              VerticalSpacing.L(),
              Text(
                'Ovdje mozete zasad samo da dodavate i oduzimate odgovore klikom na plus i minus.\nPritiskom na ikonicu kante, mozete da obrisete pitanje.',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(),
              ),
              VerticalSpacing.L(),
              Text(
                'U nekom buducem update-u ce se moci i praviti pite i custom odgovori i svasta nesto...',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(),
              ),
              VerticalSpacing.L(),
              VerticalSpacing.L(),
              Text(
                'ali taj update nije ovaj.',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(),
              ),
              VerticalSpacing.L(),
              VerticalSpacing.L(),
              VerticalSpacing.L(),
              Text(
                '- KLB.',
                textAlign: TextAlign.center,
                style: CustomTheme.titleTextStyle(
                  color: CustomTheme.darkerBlue,
                ),
              ),
              VerticalSpacing.L(),
            ],
          ),
        ],
      ),
    );
  }
}
