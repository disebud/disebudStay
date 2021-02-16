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
        minimum: EdgeInsets.all(dSafePadding),
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
            SizedBox(height: dSafePadding),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Disebud',
                    style: GoogleFonts.poppins(
                        color: dBlack,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text('Stay',
                      style: GoogleFonts.poppins(
                          color: dOrange,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800))
                ],
              ),
            ),
            SizedBox(height: 2 * dSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('Siapa Nama Anda?',
                        style: GoogleFonts.poppins(
                            color: dBlack, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 2 * dBasePadding),
                  Container(
                    height: 12 * dBasePadding,
                    padding: EdgeInsets.symmetric(horizontal: dSafePadding),
                    decoration: BoxDecoration(
                        color: dWhite,
                        border: Border.all(color: dLightOrange),
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
            SizedBox(height: 2 * dSafePadding),
            Padding(
              padding: const EdgeInsets.only(left: 220.0),
              child: FlatButton(
                  color: dOrange,
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
                        color: dWhite, fontWeight: FontWeight.w500),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.red))),
            )
          ],
        )),
      ),
    );
  }
}
