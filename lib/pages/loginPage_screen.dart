import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_1_disebud/util/themes.dart';
import 'package:submission_1_disebud/pages/homePage_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textController = TextEditingController();
  String displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(kSafePadding),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/disebudKost.png',
              height: 60,
              width: 60,
            ),
            SizedBox(height: kSafePadding),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Disebud',
                    style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text('Stay',
                      style: GoogleFonts.poppins(
                          color: kOrange,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800))
                ],
              ),
            ),
            SizedBox(height: 2 * kSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('Siapa Nama Anda?',
                        style: GoogleFonts.poppins(
                            color: kBlack, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 2 * kBasePadding),
                  Container(
                    height: 12 * kBasePadding,
                    padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                    decoration: BoxDecoration(
                        color: kWhite,
                        border: Border.all(color: kLightGrey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Nama Anda'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 2 * kSafePadding),
            FlatButton(
                color: kOrange,
                onPressed: () {
                  setState(() {
                    displayName = textController.text;
                  });

                  if (displayName != '') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage(displayName: displayName);
                    }));
                  } else {
                    return null;
                  }
                },
                child: Text(
                  'NEXT',
                  style: GoogleFonts.lato(
                      color: kWhite, fontWeight: FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.red)))
          ],
        )),
      ),
    );
  }
}
