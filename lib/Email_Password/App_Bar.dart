import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarData extends StatelessWidget {
  const AppBarData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.mailBulk),
        SizedBox(width: 30),
        Text(
          'Email Password Sign In',
          style: GoogleFonts.allan(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
