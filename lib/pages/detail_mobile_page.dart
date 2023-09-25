import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_pemula/pages/detail_page.dart';
import 'package:proyek_akhir_flutter_pemula/theme.dart';

class DetailMobilePage extends StatefulWidget {
  final Map data;
  const DetailMobilePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailMobilePage> createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.75,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        currentIndex = index;
                        setState(() {});
                      },
                      viewportFraction: 1.0,
                    ),
                    items: [
                      Image.network(
                        widget.data['images'][0],
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.data['images'][1],
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.data['images'][2],
                        fit: BoxFit.cover,
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          widget.data['title'],
                          style: white1Textstyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: LikeButton(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.settings_phone,
                          color: Colors.yellowAccent,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Call',
                          style: white2Textstyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.send,
                          color: Colors.yellowAccent,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Route',
                          style: white2Textstyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.share,
                          color: Colors.yellowAccent,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Share',
                          style: white2Textstyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category: ${widget.data['category']['name']}',
                        style: white2Textstyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Deskripsi: ${widget.data['description']}',
                        style: white2Textstyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(
                  0.5,
                ),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.yellowAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
