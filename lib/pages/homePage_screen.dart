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
        backgroundColor: kLightGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                text: 'Disebud',
                style: GoogleFonts.poppins(
                    color: kBlack, fontSize: 20.0, fontWeight: FontWeight.w800),
                children: <TextSpan>[
              TextSpan(
                  text: 'Stay',
                  style: GoogleFonts.poppins(
                      color: kOrange, fontWeight: FontWeight.w800))
            ])),
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: kDarkGrey,
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
                  kSafePadding, 2 * kSafePadding, kSafePadding, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Hello, ',
                          style: GoogleFonts.poppins(
                              color: kDarkGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                        TextSpan(
                            text: '${widget.displayName}',
                            style: GoogleFonts.poppins(
                                color: kOrange, fontWeight: FontWeight.w500))
                      ])),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 3.0,
                      width: 200.0,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(color: kOrange),
                      ),
                    ),
                  ),
                  Text(
                    'EXPLORE NOW ',
                    style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text('Mencari Kosan yang Nyaman ',
                      style: GoogleFonts.poppins(
                          color: kDarkGrey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
            SizedBox(height: 1.5 * kSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                    child: Text(
                      'Popular City KostStay',
                      style: GoogleFonts.poppins(
                          color: kBlack,
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
                        decoration: const BoxDecoration(color: kOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 2 * kBasePadding),
                  Container(
                    height: 12 * kSafePadding,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: popularCity.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            width: 10 * kSafePadding,
                            margin: index != popularCity.length - 1
                                ? EdgeInsets.only(left: kSafePadding)
                                : EdgeInsets.symmetric(
                                    horizontal: kSafePadding),
                            padding: EdgeInsets.symmetric(
                                vertical: kSafePadding,
                                horizontal: 2 * kBasePadding),
                            decoration: BoxDecoration(
                                border: Border.all(color: kLightGrey)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/${popularCity[index].cityImage}',
                                  scale: 2.0,
                                  height: 100,
                                ),
                                SizedBox(height: kSafePadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(popularCity[index].nameCity,
                                        style: GoogleFonts.lato(
                                            color: kBlack,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 2.0),
                                    Text(popularCity[index].hargaKisaran,
                                        style: GoogleFonts.lato(
                                            color: kDarkGrey,
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
            SizedBox(height: 1.5 * kSafePadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kSafePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent KostStay',
                    style: GoogleFonts.poppins(
                        color: kBlack,
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
                        decoration: const BoxDecoration(color: kOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 2 * kBasePadding),
                  ListView(
                      shrinkWrap: true,
                      children: recentKostStay.map((kost) {
                        return FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return KostStayDetail(
                                kost: kost,
                              );
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: kSafePadding),
                            padding: EdgeInsets.all(kSafePadding),
                            decoration: BoxDecoration(
                                border: Border.all(color: kLightGrey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/${kost.mainImage}',
                                          scale: 2.0,
                                          width: 50,
                                          height: 50,
                                        ),
                                        SizedBox(width: kSafePadding),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(kost.name,
                                                style: GoogleFonts.lato(
                                                    color: kBlack,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(height: 2.0),
                                            Text(kost.location,
                                                style: GoogleFonts.lato(
                                                    color: kDarkGrey,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(height: 4.0),
                                            Text(kost.price,
                                                style: GoogleFonts.lato(
                                                    color: kDarkGrey,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      icon: kost.saved == true
                                          ? Icon(Icons.bookmark, color: kOrange)
                                          : Icon(Icons.bookmark_border,
                                              color: kDarkGrey),
                                      onPressed: () {
                                        setState(() {
                                          kost.saved = !kost.saved;
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList()),
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
        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
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
        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
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
        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
      ],
      saved: false),
];
