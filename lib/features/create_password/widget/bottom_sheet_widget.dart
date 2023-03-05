import 'package:flutter/material.dart';
import 'package:work_widgets/core/utils/constants.dart';
import 'package:work_widgets/features/create_password/value_validator.dart';
import 'package:work_widgets/features/create_password/widget/password_conditions_widget.dart';
import 'package:work_widgets/features/create_password/widget/title_and_close_widget.dart';

class BottomSheetContentwidget extends StatefulWidget {
  @override
  State<BottomSheetContentwidget> createState() =>
      _BottomSheetContentwidgetState();
}

class _BottomSheetContentwidgetState extends State<BottomSheetContentwidget> {
  final formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _matchController = TextEditingController();
  String password = '';
  bool upperCaseLowerCaseIsValid = false;
  bool lengthIsValid = false;
  bool hasNumber = false;
  bool hasSpecial = false;
  bool isMatch = false;
  bool passwordShow = false;
  bool matchPasswordShow = false;
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(
      () {
        if (PasswordValidator.validateUpperCaseLowerCase(
            _passwordController.text)) {
          setState(() {
            upperCaseLowerCaseIsValid = true;
          });
        } else {
          setState(() {
            upperCaseLowerCaseIsValid = false;
          });
        }
        if (PasswordValidator.validateNumber(_passwordController.text)) {
          setState(() {
            hasNumber = true;
          });
        } else {
          setState(() {
            hasNumber = false;
          });
        }
        if (PasswordValidator.validateSpecial(_passwordController.text)) {
          setState(() {
            hasSpecial = true;
          });
        } else {
          setState(() {
            hasSpecial = false;
          });
        }
        if (PasswordValidator.validateLength(_passwordController.text)) {
          setState(() {
            lengthIsValid = true;
          });
        } else {
          setState(() {
            lengthIsValid = false;
          });
        }
      },
    );
    _matchController.addListener(() {
      if (MatchValidator.isMatch(
          _matchController.text, _passwordController.text)) {
        setState(() {
          isMatch = true;
        });
      } else {
        setState(() {
          isMatch = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 30),
          CreateTitleAndCloseButtonWidget(),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 42,
              right: 42,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  passwordInputTextWidget(),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Password should have special character.',
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  PasswordConditionWidget(
                    upperCaseLowerCaseIsValid: upperCaseLowerCaseIsValid,
                    hasNumber: hasNumber,
                    lengthIsValid: lengthIsValid,
                    hasSpecial: hasSpecial,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  matchPasswordInputTextWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  doneButton()
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget doneButton() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(254, 235, 220, 1),
          ),
          onPressed: () {},
          child: SizedBox(
            height: 52,
            width: 600,
            child: Center(
              child: Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )),
    );
  }

  Widget passwordInputTextWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 38),
            child: TextFormField(
              obscureText: !passwordShow,
              decoration: InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.start,
              controller: _passwordController,
            ),
          ),
        ),
        Positioned(
          top: -5,
          left: 25,
          child: Container(
            height: 18,
            width: 80,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 20,
            child: InkWell(
              onTap: () {
                setState(() {
                  passwordShow = !passwordShow;
                });
              },
              child: Image.asset(
                passwordShow ? ImagesPath.visible : ImagesPath.invisible,
                height: 20,
                width: 20,
              ),
            ))
      ],
    );
  }

  Widget matchPasswordInputTextWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 38),
            child: TextFormField(
              obscureText: !matchPasswordShow,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.start,
              controller: _matchController,
            ),
          ),
        ),
        Positioned(
          top: -5,
          left: 25,
          child: Container(
            height: 18,
            width: 80,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'Enter again',
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
