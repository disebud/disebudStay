import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_1_disebud/model/PopularCity.dart';
import 'package:submission_1_disebud/util/themes.dart';
import 'package:submission_1_disebud/model/KostStay.dart';
import 'package:submission_1_disebud/pages/detailStay_screen.dart';

class HomePage extends StatefulWidget {
  final String displayName;

  HomePage({this.displayName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dLightOrange,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                text: 'Disebud',
                style: GoogleFonts.poppins(
                    color: dBlack, fontSize: 20.0, fontWeight: FontWeight.w800),
                children: <TextSpan>[
              TextSpan(
                  text: 'Stay',
                  style: GoogleFonts.poppins(
                      color: dOrange, fontWeight: FontWeight.w800))
            ])),
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: dOrange,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  dSafePadding, 2 * dSafePadding, dSafePadding, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Hello, ',
                          style: GoogleFonts.poppins(
                              color: dDarkGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                        TextSpan(
                            text: widget.displayName,
                            style: GoogleFonts.poppins(
                                color: dOrange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500))
                      ])),
                  Text(
                    'EXPLORE NOW ',
                    style: GoogleFonts.poppins(
                        color: dBlack,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text('Mencari Kosan yang Nyaman ',
                      style: GoogleFonts.poppins(
                          color: dDarkGrey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
            SizedBox(height: 1.5 * dSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dSafePadding),
                    child: Text(
                      'Popular City KostStay',
                      style: GoogleFonts.poppins(
                          color: dBlack,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 50.0),
                    child: SizedBox(
                      height: 3.0,
                      width: 20.0,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(color: dOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 2 * dBasePadding),
                  Container(
                    height: 12 * dSafePadding,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: popularCity.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            width: 10 * dSafePadding,
                            margin: index != popularCity.length - 1
                                ? EdgeInsets.only(left: dSafePadding)
                                : EdgeInsets.symmetric(
                                    horizontal: dSafePadding),
                            padding: EdgeInsets.symmetric(
                                vertical: dSafePadding,
                                horizontal: 2 * dBasePadding),
                            decoration: BoxDecoration(
                                border: Border.all(color: dLightOrange)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/${popularCity[index].cityImage}',
                                    scale: 1.0,
                                    height: 80,
                                  ),
                                ),
                                SizedBox(height: dSafePadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(popularCity[index].nameCity,
                                        style: GoogleFonts.lato(
                                            color: dBlack,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 2.0),
                                    Text(popularCity[index].hargaKisaran,
                                        style: GoogleFonts.lato(
                                            color: dDarkGrey,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.5 * dSafePadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSafePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent KostStay',
                    style: GoogleFonts.poppins(
                        color: dBlack,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 0.0, right: 50.0),
                    child: SizedBox(
                      height: 3.0,
                      width: 200.0,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(color: dOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 2 * dBasePadding),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recentKostStay.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return KostStayDetail(
                              name: recentKostStay[index].name,
                              location: recentKostStay[index].location,
                              price: recentKostStay[index].price,
                              description: recentKostStay[index].description,
                              capacity: recentKostStay[index].capacity,
                              available: recentKostStay[index].available,
                              facilitas: recentKostStay[index].facilitas,
                              mainImage: recentKostStay[index].mainImage,
                              listImage: recentKostStay[index].listImage,
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: dSafePadding),
                          padding: EdgeInsets.all(dSafePadding),
                          decoration: BoxDecoration(
                              border: Border.all(color: dLightOrange)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/${recentKostStay[index].mainImage}',
                                        height: 70,
                                        scale: 2.0,
                                      ),
                                    ),
                                    SizedBox(width: dSafePadding),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(recentKostStay[index].name,
                                            style: GoogleFonts.lato(
                                                color: dBlack,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(height: 4.0),
                                        Text(recentKostStay[index].location,
                                            style: GoogleFonts.lato(
                                              color: dDarkGrey,
                                            )),
                                        SizedBox(height: 4.0),
                                        Text(recentKostStay[index].price,
                                            style: GoogleFonts.lato(
                                                color: dDarkGrey,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: recentKostStay[index].saved == true
                                      ? Icon(Icons.bookmark, color: dOrange)
                                      : Icon(Icons.bookmark_border,
                                          color: dDarkGrey),
                                  onPressed: () {
                                    setState(() {
                                      recentKostStay[index].saved =
                                          !recentKostStay[index].saved;
                                    });
                                  })
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

var popularCity = [
  PopularCity(
    nameCity: 'Jakarta',
    hargaKisaran: '600k - 2000k',
    cityImage: 'cityJakarta.jpg',
  ),
  PopularCity(
    nameCity: 'Bekasi',
    hargaKisaran: '500k - 1500k',
    cityImage: 'cityBekasi.jpg',
  ),
  PopularCity(
    nameCity: 'Pekanbaru',
    hargaKisaran: '500k - 1000k',
    cityImage: 'cityPekanbaru.jpeg',
  ),
  PopularCity(
    nameCity: 'Solo',
    hargaKisaran: '400k - 900k',
    cityImage: 'citySolo.jpg',
  ),
  PopularCity(
    nameCity: 'Banyuwangi',
    hargaKisaran: '600k - 1500k',
    cityImage: 'cityBanyuwangi.jpg',
  ),
  PopularCity(
    nameCity: 'Bandung',
    hargaKisaran: '600k - 1800k',
    cityImage: 'cityBandung.jpg',
  ),
];

var recentKostStay = [
  KostStay(
      name: 'Babe KOst',
      location: 'Jakarta,ID',
      price: 'Rp.750.000',
      description:
          'Kamar kost tempat strategis untuk para mahasiswa/i dengan tempat belanja dan kampus. Silahkan di booking. Terima Kasih',
      capacity: '1-2 Orang',
      available: '10 Kamar',
      facilitas: 'AC - WC Dalam',
      mainImage: 'kostJakarta.jpg',
      listImage: [
        'detailSatu.jpg',
        'detailDua.jpg',
        'detailTiga.jpg',
        'detailEmpat.jpeg'
      ],
      saved: false),
  KostStay(
      name: 'Bekatul KOst',
      location: 'Bekasi,ID',
      price: 'Rp.550.000',
      description:
          'Kamar kost tempat strategis untuk para mahasiswa/i dengan tempat belanja dan kampus. Silahkan di booking. Terima Kasih',
      capacity: '1 Orang',
      available: '5 Kamar',
      facilitas: 'WC Dalam',
      mainImage: 'kostBekasi.jpg',
      listImage: [
        'detailSatu.jpg',
        'detailDua.jpg',
        'detailTiga.jpg',
        'detailEmpat.jpeg'
      ],
      saved: false),
  KostStay(
      name: 'Melayu KOst',
      location: 'Pekanbaru,ID',
      price: 'Rp.500.000',
      description:
          'Kamar kost tempat strategis untuk para mahasiswa/i dengan tempat belanja dan kampus. Silahkan di booking. Terima Kasih',
      capacity: '1-2 Orang',
      available: '10 Kamar',
      facilitas: 'WC Dalam',
      mainImage: 'kostPekanbaru.jpg',
      listImage: [
        'detailSatu.jpg',
        'detailDua.jpg',
        'detailTiga.jpg',
        'detailEmpat.jpeg'
      ],
      saved: false),
];
