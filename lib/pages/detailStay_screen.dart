import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_1_disebud/model/KostStay.dart';
import 'package:submission_1_disebud/util/themes.dart';

class KostStayDetail extends StatelessWidget {
  final KostStay kost;

  KostStayDetail({@required this.kost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kLightGrey,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: kOrange),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text(kost.location,
              style: GoogleFonts.poppins(
                  color: kBlack, fontSize: 16.0, fontWeight: FontWeight.w600)),
        ),
        body: SingleChildScrollView(
          // child: SafeArea(
          //   minimum: EdgeInsets.all(kSafePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/$kost.mainImage'),
              Container(
                padding: EdgeInsets.only(top: kSafePadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/$kost.mainImage',
                      scale: 1.5,
                    ),
                    SizedBox(width: kSafePadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kost.name,
                            style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700)),
                        // Text(
                        //   companyName,
                        //   style: GoogleFonts.lato(
                        //       color: kDarkGrey,
                        //       fontSize: 18.0,
                        //       fontWeight: FontWeight.w700),
                        // ),
                        Text(kost.location,
                            style: GoogleFonts.lato(
                                color: kDarkGrey, fontSize: 16.0)),
                        Text(kost.price,
                            style: GoogleFonts.lato(
                                color: kDarkGrey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.5 * kSafePadding),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Description',
                        style: GoogleFonts.poppins(
                            color: kBlack,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: kBasePadding),
                    Text(
                      kost.description,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(color: kBlack, fontSize: 16.0),
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.5 * kSafePadding),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: kost.listImage.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 1.5 * kSafePadding),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('More',
                        style: GoogleFonts.poppins(
                            color: kBlack,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: kBasePadding),
                    // Text('•\tMin level of education: B.Sc. in CSE',
                    //     style: GoogleFonts.lato(color: kBlack, fontSize: 16.0)),
                    // Text('•\tExpert in Laravel framework',
                    //     style: GoogleFonts.lato(color: kBlack, fontSize: 16.0)),
                    // Text('•\tFluent in English language',
                    //     style: GoogleFonts.lato(color: kBlack, fontSize: 16.0)),
                  ],
                ),
              ),
              SizedBox(height: 1.5 * kSafePadding),
              Container(
                padding: EdgeInsets.all(2 * kSafePadding),
                decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          color: kOrange,
                          size: 28.0,
                        ),
                        SizedBox(width: 1.5 * kSafePadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kapasitas',
                                style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: kBasePadding),
                            Text(kost.capacity,
                                style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: kSafePadding),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: kOrange,
                          size: 28.0,
                        ),
                        SizedBox(width: 1.5 * kSafePadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ketersedian',
                                style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: kBasePadding),
                            Text(kost.available,
                                style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: kSafePadding),
                    Row(
                      children: [
                        Icon(
                          Icons.picture_in_picture_alt,
                          color: kOrange,
                          size: 28.0,
                        ),
                        SizedBox(width: 1.5 * kSafePadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Fasilitas',
                                style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: kBasePadding),
                            Text(kost.facilitas,
                                style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          // ),
        ));
  }
}
