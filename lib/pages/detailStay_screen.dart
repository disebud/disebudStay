import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_1_disebud/util/themes.dart';

class KostStayDetail extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String description;
  final String capacity;
  final String available;
  final String facilitas;
  final String mainImage;
  final List<String> listImage;

  KostStayDetail(
      {this.name,
      this.location,
      this.price,
      this.description,
      this.capacity,
      this.available,
      this.facilitas,
      this.mainImage,
      this.listImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dLightOrange,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: dOrange),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text(location,
              style: GoogleFonts.poppins(
                  color: dBlack, fontSize: 16.0, fontWeight: FontWeight.w600)),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.all(dSafePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('assets/$mainImage'),
                Container(
                  padding: EdgeInsets.only(top: dSafePadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/$mainImage',
                          scale: 1.5,
                          height: 70,
                        ),
                      ),
                      SizedBox(width: dSafePadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: GoogleFonts.lato(
                                  color: dBlack,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700)),
                          Text(location,
                              style: GoogleFonts.lato(
                                  color: dDarkGrey, fontSize: 16.0)),
                          Text(price,
                              style: GoogleFonts.lato(
                                  color: dDarkGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.5 * dSafePadding),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Description',
                          style: GoogleFonts.poppins(
                              color: dBlack,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: dBasePadding),
                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(color: dBlack, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.5 * dSafePadding),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: listImage.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/$url'),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 1.5 * dSafePadding),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Lainnya ',
                          style: GoogleFonts.poppins(
                              color: dBlack,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: dBasePadding),
                    ],
                  ),
                ),
                SizedBox(height: 0.5 * dSafePadding),
                Container(
                  padding: EdgeInsets.all(2 * dSafePadding),
                  decoration: BoxDecoration(
                      color: dLightOrange,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: dOrange,
                            size: 28.0,
                          ),
                          SizedBox(width: 1.5 * dSafePadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kapasitas',
                                  style: GoogleFonts.lato(
                                      color: dBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: dBasePadding),
                              Text(capacity,
                                  style: GoogleFonts.lato(
                                      color: dBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: dSafePadding),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: dOrange,
                            size: 28.0,
                          ),
                          SizedBox(width: 1.5 * dSafePadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ketersedian',
                                  style: GoogleFonts.lato(
                                      color: dBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: dBasePadding),
                              Text(available,
                                  style: GoogleFonts.lato(
                                      color: dBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: dSafePadding),
                      Row(
                        children: [
                          Icon(
                            Icons.picture_in_picture_alt,
                            color: dOrange,
                            size: 28.0,
                          ),
                          SizedBox(width: 1.5 * dSafePadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fasilitas',
                                  style: GoogleFonts.lato(
                                      color: dBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: dBasePadding),
                              Text(facilitas,
                                  style: GoogleFonts.lato(
                                      color: dBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                FlatButton(
                    color: dOrange,
                    onPressed: () {},
                    child: Text(
                      'PESAN',
                      style: GoogleFonts.lato(
                          color: dWhite, fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.red)))
              ],
            ),
          ),
        ));
  }
}
