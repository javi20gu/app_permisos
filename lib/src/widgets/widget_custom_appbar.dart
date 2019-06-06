import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 38,
          ),
          Text(
            "Permisos",
            style: TextStyle(
                fontFamily: "AirbnbCereal-Bold",
                fontWeight: FontWeight.bold,
                fontSize: 38,
                color: Color.fromRGBO(8, 8, 17, 1)),
          )
        ],
      ),
    );
  }
}
