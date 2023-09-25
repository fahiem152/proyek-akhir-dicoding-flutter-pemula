import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_pemula/pages/detail_mobile_page.dart';
import 'package:proyek_akhir_flutter_pemula/pages/detail_web_page.dart';

class DetailPage extends StatelessWidget {
  final Map product;
  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints contraints) {
      if (contraints.maxWidth > 800) {
        return DetailWebPage(data: product);
      } else {
        return DetailMobilePage(data: product);
      }
    });
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLike = !isLike;
        });
      },
      icon: Icon(
        isLike ? Icons.favorite : Icons.favorite_border,
        color: Colors.yellowAccent,
      ),
    );
  }
}
