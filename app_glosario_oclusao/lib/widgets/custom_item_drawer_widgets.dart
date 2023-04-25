import 'package:flutter/material.dart';

class CustomItemDrawerWidgets extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData tipIcon;

  const CustomItemDrawerWidgets(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.tipIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListBody(
      children: [
        SizedBox(
          height: 40,
          child: TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  tipIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 18),
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 5,
          color: Color.fromRGBO(255, 255, 255, 0.5),
        )
      ],
    ));
  }
}
