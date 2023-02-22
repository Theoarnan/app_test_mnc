import 'dart:developer';

import 'package:app_test_mnc/common/utils/themes.dart';
import 'package:app_test_mnc/filter_camera/presentation/result_camera_page.dart';
import 'package:camera_filters/camera_filters.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Themes.colorPrimary,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: CameraScreenPlugin(
                filters: const [Colors.red, Colors.blue, Colors.green],
                gradientColors: const [Colors.red, Colors.blue, Colors.green],
                applyFilters: true,
                onDone: (value) {
                  log('LOG HASIL: $value');
                  if (value != null) {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultCameraPage(resultCamera: value),
                      ),
                    );
                  }
                },
                onVideoDone: (value) {
                  log('LOG HASIL 2: $value');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
