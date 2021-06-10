import 'package:flutter/material.dart';
import 'package:web_demo/models/MyFile.dart';

class CloudStorageInfoViewModel {
  final CloudStorageInfo cloudStorageInfo;
  final Color colorModel;
  CloudStorageInfoViewModel(
      {required this.cloudStorageInfo, required this.colorModel});

  String get svgSrc => this.cloudStorageInfo.svgSrc ?? "";

  String get title => this.cloudStorageInfo.title ?? "";

  String get totalStorage => this.cloudStorageInfo.totalStorage ?? "";

  int get numOfFiles => this.cloudStorageInfo.numOfFiels ?? 0;

  int get percentage => this.cloudStorageInfo.percentage ?? 0;

  Color get color => colorModel;
}
