import 'package:flutter/material.dart';
import 'package:web_demo/constants.dart';

import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            iconSrc: "assets/icons/Documents.svg",
            title: "Documents Files",
            amountOfFile: "1.3GB",
            numOfFile: 1328,
          ),
          StorageInfoCard(
            iconSrc: "assets/icons/media.svg",
            title: "Media Files",
            amountOfFile: "15.3GB",
            numOfFile: 1328,
          ),
          StorageInfoCard(
            iconSrc: "assets/icons/folder.svg",
            title: "Other Files",
            amountOfFile: "1.3GB",
            numOfFile: 1328,
          ),
          StorageInfoCard(
            iconSrc: "assets/icons/unknown.svg",
            title: "Unknown Files",
            amountOfFile: "1.3GB",
            numOfFile: 140,
          )
        ],
      ),
    );
  }
}
