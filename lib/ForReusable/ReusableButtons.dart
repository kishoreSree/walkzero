import 'package:flutter/material.dart';

class Buttons {
  Widget elvatedButton(
    BuildContext context,
    String text,
    double btwidth,
    double btheight,
    Color btcolor,
    double btradius,
    // Function(BuildContext)? buildingPage,
    Function()? onPressed,
  ) {
    return ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(btwidth, btheight)),
          backgroundColor: MaterialStateProperty.all<Color?>(btcolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(btradius))),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
        ));
  }
}
