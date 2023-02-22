import 'package:app_test_mnc/common/utils/constants.dart';
import 'package:app_test_mnc/common/utils/formatter.dart';
import 'package:app_test_mnc/common/utils/themes.dart';
import 'package:app_test_mnc/news/models/news_model.dart';
import 'package:flutter/material.dart';

class BannerNews extends StatelessWidget {
  final NewsModel news;
  const BannerNews({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      color: Colors.white,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Banner
          FadeInImage(
            fadeInCurve: Curves.bounceIn,
            fit: BoxFit.cover,
            placeholder: AssetImage('${Constants.assetImagesBase}no_img.png'),
            placeholderFit: BoxFit.contain,
            height: 250,
            width: MediaQuery.of(context).size.width,
            image: NetworkImage(
              news.contentThumbnail.toString(),

              // width: MediaQuery.of(context).size.width,
              // color: Colors.grey.withOpacity(0.4),
              // loadingBuilder: (context, child, loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return Container(
              //     height: 250,
              //     color: Colors.grey,
              //     child: const Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   );
              // },
              // errorBuilder: (context, error, stackTrace) {
              //   return Container(
              //     height: 250,
              //     color: Colors.grey,
              //     child: Center(
              //       child: Image.asset(
              //         '${Constants.assetImagesBase}no_img.png',
              //         height: 200,
              //       ),
              //     ),
              //   );
              // },
              // fit: BoxFit.cover,
            ),
          ),

          // Category News Text
          const SizedBox(
            height: 18,
          ),
          Text(
            news.cotributorName,
            style: TextStyle(
              color: Themes.colorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Title News Text
          const SizedBox(
            height: 18,
          ),
          Text(
            news.title.split(' ').map((word) => word.capitalize()).join(' '),
            overflow: TextOverflow.clip,
            maxLines: 2,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, wordSpacing: 2),
          ),

          // Times News Upload Text
          const SizedBox(
            height: 10,
          ),
          Text(
            Formatter().formatDate(news.createdAt),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
