import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CloseBottomSheetButton extends StatelessWidget {
  const CloseBottomSheetButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffF35142),
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        borderRadius: BorderRadius.circular(17),
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.transparent),
          alignment: Alignment.center,
          child: Container(
            width: 12,
            height: 12,
            alignment: Alignment.center,
            child: Image.asset(ImagesPath.icClose),
          ),
        ),
      ),
    );
  }
}
