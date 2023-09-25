import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_pemula/pages/detail_page.dart';

import 'package:proyek_akhir_flutter_pemula/theme.dart';

class CardProductMobile extends StatelessWidget {
  final Map data;
  const CardProductMobile({
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
      child: Center(
        child: Container(
          width: 300,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    15,
                  ),
                ),
                child: Image.network(
                  data['images'][0],
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
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data['category']['name'],
                      style: black2Textstyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      data['description'],
                      style: black2Textstyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
