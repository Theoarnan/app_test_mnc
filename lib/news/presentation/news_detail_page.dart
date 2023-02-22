import 'dart:developer';

import 'package:app_test_mnc/common/utils/constants.dart';
import 'package:app_test_mnc/common/utils/formatter.dart';
import 'package:app_test_mnc/common/utils/themes.dart';
import 'package:app_test_mnc/news/models/news_model.dart';
import 'package:app_test_mnc/news/presentation/bloc/news_bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsModel news;
  final NewsModel randomNews;
  const NewsDetailPage({Key? key, required this.news, required this.randomNews})
      : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  int indexImg = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Themes.colorPrimary,
          ),
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Image.asset('${Constants.assetImagesBase}logo_pink.jpg'),
          ),
          actions: [
            // Text Category News
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  'K-POP',
                  style: TextStyle(
                    color: Themes.colorPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              // Title news
              Text(
                widget.news.title
                    .split(' ')
                    .map((word) => word.capitalize())
                    .join(' '),
                overflow: TextOverflow.clip,
                maxLines: 3,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.w600, wordSpacing: 2),
              ),

              // Detail upload news
              const SizedBox(
                height: 24,
              ),
              Text(
                widget.news.cotributorName,
                style: TextStyle(
                  color: Themes.colorPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                Formatter().formatDate(widget.news.createdAt),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Images news banner
              const SizedBox(
                height: 28,
              ),
              FadeInImage(
                fadeInCurve: Curves.bounceIn,
                fit: BoxFit.cover,
                placeholder:
                    AssetImage('${Constants.assetImagesBase}no_img.png'),
                placeholderFit: BoxFit.contain,
                height: 250,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(
                  widget.news.slideshow!.isNotEmpty
                      ? widget.news.slideshow![indexImg]
                      : widget.news.contentThumbnail,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: widget.news.slideshow!.isNotEmpty
                    ? SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: widget.news.slideshow?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                log('index: $index');
                                setState(() {
                                  indexImg = index;
                                });
                              },
                              child: Container(
                                height: 34,
                                width: 80,
                                margin: const EdgeInsets.only(left: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            widget.news.slideshow![index]))),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Foto: The Korea Herald',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Description news
              const SizedBox(
                height: 22,
              ),
              Text(
                widget.news.content,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 18),
              ),

              // Sugestion news
              const SizedBox(
                height: 22,
              ),
              Text.rich(
                TextSpan(
                  text: 'Baca juga: ',
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontSize: 18),
                  children: [
                    TextSpan(
                      text: widget.randomNews.title,
                      style: TextStyle(
                        color: Themes.colorPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
