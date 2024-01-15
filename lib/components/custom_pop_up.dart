import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';
import 'package:flutter/material.dart';

class CustomPopUp extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSave;

  const CustomPopUp({
    required this.controller,
    required this.onSave,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.40),
      body: Center(
        child: Container(
          height: 250,
          width: 300,
          decoration: BoxDecoration(
            color: CustomTheme.darkerBlue,
            border: Border.all(
              color: CustomTheme.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              VerticalSpacing.M(),
              Text(
                'Unesite novo pitanje:',
                style: CustomTheme.titleTextStyle(fontSize: 18),
              ),
              VerticalSpacing.M(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(
                    color: CustomTheme.white,
                  ),
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Unesite pitanje',
                    hintStyle: TextStyle(
                      color: CustomTheme.white,
                    ),
                  ),
                ),
              ),
              VerticalSpacing.L(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      onSave();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Sacuvaj',
                      style: CustomTheme.titleTextStyle(
                        color: CustomTheme.green,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  HorizontalSpacing.custom(30),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'otkazi',
                      style: CustomTheme.titleTextStyle(
                        color: CustomTheme.red,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AlertDialog(
//           shape: Border.all(
//             color: CustomTheme.white,
//           ),
//           backgroundColor: CustomTheme.darkerBlue,
//           title: Text(
//             'Unesite novo pitanje:',
//             style: CustomTheme.titleTextStyle(fontSize: 18),
//           ),
//           content: TextField(
//             style: TextStyle(
//               color: CustomTheme.white,
//             ),
//             controller: newTextController,
//             decoration: InputDecoration(
//               hintText: 'Unesite pitanje',
//               hintStyle: TextStyle(
//                 color: CustomTheme.white,
//               ),
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'otkazi',
//                 style: CustomTheme.titleTextStyle(
//                   color: CustomTheme.red,
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (newTextController.text.startsWith(' ') || newTextController.text.isEmpty || newTextController.text.endsWith(' ')) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: CustomTheme.red,
//                       content: Text(
//                         'Pitanje nije odgovarajuce!',
//                         style: CustomTheme.titleTextStyle(
//                           color: CustomTheme.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                       duration: const Duration(seconds: 2),
//                     ),
//                   );
//                 } else {
//                   addNewQuestion(newTextController.text);
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text(
//                 'DODAJ',
//                 style: CustomTheme.titleTextStyle(
//                   color: CustomTheme.green,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ],
//         );
