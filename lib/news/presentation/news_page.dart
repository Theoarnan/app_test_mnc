import 'dart:math';

import 'package:app_test_mnc/filter_camera/presentation/camera_page.dart';
import 'package:app_test_mnc/news/presentation/bloc/news_bloc_cubit.dart';
import 'package:app_test_mnc/news/presentation/news_detail_page.dart';
import 'package:app_test_mnc/news/presentation/widgets/banner_news.dart';
import 'package:app_test_mnc/common/utils/constants.dart';
import 'package:app_test_mnc/common/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int indexSlide = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Themes.colorPrimary,
        ),
        elevation: 2,
        centerTitle: true,
        title:
            Image.asset('${Constants.assetImagesBase}logo_pink.jpg', scale: 4),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<NewsBlocCubit, NewsBlocState>(
        builder: (context, state) {
          if (state is NewsBlocLoadingState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Center(child: CircularProgressIndicator())],
            );
          } else if (state is NewsBlocErrorState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text('Ups.. Sedang error!')],
            );
          } else if (state is NewsBlocLoadedState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                children: [
                  // Banner News
                  SizedBox(
                    height: 396,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          indexSlide = value;
                        });
                      },
                      itemCount: state.dataNews!.length > 3
                          ? 3
                          : state.dataNews!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            final randomNews = state.dataNews![Random()
                                    .nextInt(state.dataNews!.length - 0 + 1) +
                                0];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailPage(
                                    news: state.dataNews![index],
                                    randomNews: randomNews),
                              ),
                            );
                          },
                          child: BannerNews(
                            news: state.dataNews![index],
                          ),
                        );
                      },
                    ),
                  ),

                  // Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      state.dataNews!.length > 3 ? 3 : state.dataNews!.length,
                      (int index) {
                        return AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 4,
                            width: (index == indexSlide) ? 28 : 10,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index == indexSlide)
                                    ? Themes.colorPrimary
                                    : const Color.fromARGB(
                                        255, 255, 145, 205)));
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  // List Latest News
                  const Divider(
                    thickness: 2,
                    color: Color(0XFFFBF2F7),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 14),
                    child: const Text(
                      'LATEST NEWS',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0XFFFBF2F7),
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 2,
                        height: 1.0,
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.dataNews!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final news = state.dataNews![index];
                      final randomNews = state.dataNews![Random()
                              .nextInt((state.dataNews!.length - 1) - 1 + 1) +
                          1];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailPage(
                                    news: news, randomNews: randomNews),
                              ),
                            );
                          },
                          child: BannerNews(
                            news: news,
                          ));
                    },
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Themes.colorPrimary,
        child: const Icon(Icons.camera_alt),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CameraPage(),
            ),
          );
        },
      ),
    );
  }
}
