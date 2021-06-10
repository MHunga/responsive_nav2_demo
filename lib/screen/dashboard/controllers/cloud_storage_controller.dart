import 'package:flutter/material.dart';
import 'package:web_demo/constants.dart';
import 'package:web_demo/models/MyFile.dart';
import 'package:web_demo/screen/dashboard/model/cloud_storage_info_view_model.dart';

class CloudStorageController extends ChangeNotifier {
  List<CloudStorageInfoViewModel> listCloudStorage = [];

  CloudStorageController() {
    _init();
  }

  void _init() {
    // tạo demo data hoặc để fetch api lấy dữ liệu từ server ,...
    List demoMyFiels = [
      CloudStorageInfo(
        title: "Documents",
        numOfFiels: 1328,
        svgSrc: "assets/icons/Documents.svg",
        totalStorage: "1.9GB",
        percentage: 35,
      ),
      CloudStorageInfo(
        title: "Google Drive",
        numOfFiels: 1328,
        svgSrc: "assets/icons/google_drive.svg",
        totalStorage: "2.9GB",
        percentage: 35,
      ),
      CloudStorageInfo(
        title: "One Drive",
        numOfFiels: 1328,
        svgSrc: "assets/icons/one_drive.svg",
        totalStorage: "1GB",
        percentage: 10,
      ),
      CloudStorageInfo(
        title: "Documents",
        numOfFiels: 5328,
        svgSrc: "assets/icons/drop_box.svg",
        totalStorage: "7.3GB",
        percentage: 78,
      ),
    ];

    List demoColor = [
      primaryColor,
      Color(0xFFFFA113),
      Color(0xFF008899),
      Color(0xFF007EE5)
    ];

    for (var i = 0; i < 4; i++) {
      listCloudStorage.add(CloudStorageInfoViewModel(
          cloudStorageInfo: demoMyFiels[i], colorModel: demoColor[i]));
    }
    notifyListeners();
  }
}
