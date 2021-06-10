import 'package:flutter/material.dart';
import 'package:web_demo/models/RecentFile.dart';
import 'package:web_demo/screen/dashboard/model/recent_file_view_model.dart';

class RecentFileController extends ChangeNotifier {
  List<RecentFileViewModel> listRecentFileViewModel = [];

  RecentFileController() {
    _init();
  }

  void _init() {
    // tạo demo data hoặc để fetch api lấy dữ liệu từ server ,...
    List demoRecentFiles = <RecentFile>[
      RecentFile(
        icon: "assets/icons/xd_file.svg",
        title: "XD File",
        date: "01-03-2021",
        size: "3.5mb",
      ),
      RecentFile(
        icon: "assets/icons/Figma_file.svg",
        title: "Figma File",
        date: "27-02-2021",
        size: "19.0mb",
      ),
      RecentFile(
        icon: "assets/icons/doc_file.svg",
        title: "Documetns",
        date: "23-02-2021",
        size: "32.5mb",
      ),
      RecentFile(
        icon: "assets/icons/sound_file.svg",
        title: "Sound File",
        date: "21-02-2021",
        size: "3.5mb",
      ),
      RecentFile(
        icon: "assets/icons/media_file.svg",
        title: "Media File",
        date: "23-02-2021",
        size: "2.5gb",
      ),
      RecentFile(
        icon: "assets/icons/pdf_file.svg",
        title: "Sals PDF",
        date: "25-02-2021",
        size: "3.5mb",
      ),
      RecentFile(
        icon: "assets/icons/excle_file.svg",
        title: "Excel File",
        date: "25-02-2021",
        size: "34.5mb",
      ),
    ];

    demoRecentFiles.forEach((element) {
      listRecentFileViewModel.add(RecentFileViewModel(recentFile: element));
    });

    notifyListeners();
  }
}
