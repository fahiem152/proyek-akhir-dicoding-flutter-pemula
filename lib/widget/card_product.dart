import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_pemula/pages/detail_page.dart';

import 'package:proyek_akhir_flutter_pemula/theme.dart';

class CardProduct extends StatelessWidget {
  final Map data;
  const CardProduct({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(
            product: data,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          border: Border.all(
            color: white1eColor,
            width: 4,
          ),
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                data['images'][0],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: black2Textstyle.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['category']['name'],
                    style: black2Textstyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['description'],
                    style: black2Textstyle.copyWith(
                      fontWeight: medium,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
