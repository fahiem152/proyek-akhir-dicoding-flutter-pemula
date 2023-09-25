import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_pemula/dummy/data.dart';
import 'package:proyek_akhir_flutter_pemula/theme.dart';
import 'package:proyek_akhir_flutter_pemula/widget/card_product.dart';
import 'package:proyek_akhir_flutter_pemula/widget/card_product_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
          style: white1Textstyle.copyWith(
            fontSize: 28,
            fontWeight: bold,
          ),
        ),
        backgroundColor: backgroundColor1,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const MobilePage();
          } else if (constraints.maxWidth <= 800) {
            return const WebsitePage(
              gridCount: 2,
            );
          } else if (constraints.maxWidth <= 1280) {
            return const WebsitePage(
              gridCount: 3,
            );
          } else {
            return const WebsitePage(gridCount: 4);
          }
        },
      ),
      backgroundColor: backgroundColor2,
    );
  }
}

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Map product = products[index];
        return CardProductMobile(
          data: product,
        );
      },
      itemCount: products.length,
    );
  }
}

class WebsitePage extends StatelessWidget {
  final int gridCount;
  const WebsitePage({super.key, required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.builder(
        shrinkWrap: true,
        // physics: ScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0 / 1.4,
          crossAxisCount: gridCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return CardProduct(
            data: product,
          );
        },
      ),
    );
  }
}
