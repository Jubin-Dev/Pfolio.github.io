import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcsfolio/sections/navBar/navBarLogo.dart';
import 'package:jcsfolio/widgets/aboutMeText.dart';
import 'package:jcsfolio/widgets/communityIconBtn.dart';
import 'package:jcsfolio/widgets/constants.dart';
import 'package:jcsfolio/widgets/toolsTech.dart';

class AboutMobile extends StatelessWidget {
  final _communityLogoHeight = [50.0, 60.0, 30.0];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      color: Colors.grey[900],
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.montserrat(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          AboutMeText(
            textAlign: TextAlign.center,
            fontSize: 15,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < kCommunityLogo.length; i++)
                CommunityIconBtn(
                  icon: kCommunityLogo[i],
                  link: kCommunityLinks[i],
                  height: _communityLogoHeight[i],
                ),
            ],
          ),
          Divider(
            height: height * 0.028,
            color: Colors.white,
          ),
          ToolsTech(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavBarLogo(
                height: height * 0.04,
              )
            ],
          )
        ],
      ),
    );
  }
}
