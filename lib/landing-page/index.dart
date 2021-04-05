import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcsfolio/animations/entranceFader.dart';
import 'package:jcsfolio/sections/about/about.dart';
import 'package:jcsfolio/sections/contact/contact.dart';
import 'package:jcsfolio/sections/home/home.dart';
import 'package:jcsfolio/sections/navBar/navBarLogo.dart';
import 'package:jcsfolio/sections/portfolio/portfolio.dart';
import 'package:jcsfolio/sections/services/services.dart';
import 'package:jcsfolio/widgets/arrowOnTop.dart';
import 'package:jcsfolio/widgets/constants.dart';
import 'package:jcsfolio/widgets/footer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:universal_html/html.dart' as html;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionListener = ItemPositionsListener.create();
  final List<String> _sectionsName = [
    "Home",
    "About",
    "Services",
    "Projects",
    "Contact"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.phone,
    Icons.toggle_on,
    Icons.toggle_off
  ];

  void _scroll(int i) {
    _itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return Services();
    } else if (i == 3) {
      return Portfolio();
    } else if (i == 4) {
      return Contact();
    } else if (i == 5) {
      return SizedBox(
        height: 40.0,
      );
    } else if (i == 6) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else if (i == 7) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Color(0xff030303),
      extendBodyBehindAppBar: false,
      appBar: MediaQuery.of(context).size.width > 760
          ? _appBarTabDesktop()
          : AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
      drawer: MediaQuery.of(context).size.width < 760 ? _appBarMobile() : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: kPrimaryColor,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 8,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -20),
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: kPrimaryColor,
                  ),
                  title: Text(childText),
                )),
          );
  }

  Widget _appBarTabDesktop() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: MediaQuery.of(context).size.width < 740
          ? EntranceFader(
              duration: Duration(seconds: 1),
              offset: Offset(0, -20),
              delay: Duration(seconds: 3),
              child: NavBarLogo())
          : EntranceFader(
              offset: Offset(0, -20),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
        EntranceFader(
          offset: Offset(0, -20),
          delay: Duration(seconds: 3),
          duration: Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                html.window.open(
                    'https://drive.google.com/uc?export=view&id=1OOdcdGEN3thVvpZ4cl_MM0LT-GCMuLIE',
                    "pdf");
              },
              child: Text(
                "Resume",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w200, letterSpacing: 2.0),
              ),
            ),
          ),
        ),
        EntranceFader(
            offset: Offset(0, -20),
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
            child: IconButton(
              onPressed: () {
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              icon: Icon(
                Icons.brightness_3,
                size: 25,
                color: Colors.white,
              ),
            ))
      ],
    );
  }

  Widget _appBarMobile() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              alignment: Alignment.topRight,
              onPressed: () {
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              icon: Icon(
                Icons.brightness_3,
                size: 25,
                color: Colors.white,
              ),
            ),
            Center(
              child: NavBarLogo(
                height: 25,
              ),
            ),
            Divider(
              color: Colors.white,
              height: 30.0,
            ),
            for (int i = 0; i < _sectionsName.length; i++)
              _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: kPrimaryColor.withAlpha(150),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: kPrimaryColor)),
                onPressed: () {
                  launchURL(
                      "https://drive.google.com/uc?export=view&id=1OOdcdGEN3thVvpZ4cl_MM0LT-GCMuLIE");
                },
                child: ListTile(
                  leading: Icon(Icons.book, color: Color(0xff4dff14)),
                  title: Text(
                    "Resume",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
