import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_pemula/pages/detail_page.dart';
import 'package:proyek_akhir_flutter_pemula/theme.dart';

class DetailWebPage extends StatefulWidget {
  final Map data;
  const DetailWebPage({super.key, required this.data});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 68,
              vertical: 20,
            ),
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: backgroundColor3,
                                    width: 4,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CarouselSlider(
                                      carouselController: carouselController,
                                      options: CarouselOptions(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.75,
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
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            color: backgroundColor1,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.data['title'],
                                          style: white1Textstyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 32,
                                          ),
                                        ),
                                      ),
                                      const LikeButton(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Category: ${widget.data['category']['name']}',
                                    style: white2Textstyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 28,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Deskripsi: ${widget.data['description']}',
                                    style: white2Textstyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 28,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ),
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
      backgroundColor: backgroundColor2,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
