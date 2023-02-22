import 'package:app_test_mnc/news/presentation/bloc/news_bloc_cubit.dart';
import 'package:app_test_mnc/news/presentation/news_detail_page.dart';
import 'package:app_test_mnc/news/presentation/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => NewsBlocCubit()..fetchingData(),
          child: const NewsPage()),
    );
  }
}
