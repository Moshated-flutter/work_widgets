import 'package:flutter/material.dart';

class PasswordConditionWidget extends StatelessWidget {
  const PasswordConditionWidget({
    Key key,
    @required this.upperCaseLowerCaseIsValid,
    @required this.hasNumber,
    @required this.lengthIsValid,
    @required this.hasSpecial,
  }) : super(key: key);

  final bool upperCaseLowerCaseIsValid;
  final bool hasNumber;
  final bool lengthIsValid;
  final bool hasSpecial;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uppercase & Lowercase',
              style: TextStyle(
                  color: upperCaseLowerCaseIsValid ? Colors.green : Colors.red,
                  fontSize: 9),
            ),
            Text(
              'Numbers',
              style: TextStyle(
                  color: hasNumber ? Colors.green : Colors.red, fontSize: 9),
            ),
          ],
        ),
        Expanded(child: Container()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'At least 6 characters',
              style: TextStyle(
                  color: lengthIsValid ? Colors.green : Colors.red,
                  fontSize: 9),
            ),
            Text(
              'Special characters such as (!@#%^&*.)',
              style: TextStyle(
                  color: hasSpecial ? Colors.green : Colors.red, fontSize: 9),
            ),
          ],
        ),
      ],
    );
  }
}
