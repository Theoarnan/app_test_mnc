import 'dart:io';

import 'package:app_test_mnc/news/presentation/bloc/news_bloc_cubit.dart';
import 'package:app_test_mnc/news/presentation/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultCameraPage extends StatelessWidget {
  final String? resultCamera;
  const ResultCameraPage({Key? key, required this.resultCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => NewsBlocCubit()..fetchingData(),
                    child: const NewsPage()),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Result',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Image.file(File(resultCamera!)),
          ),
        ),
      ),
    );
  }
}
