import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_demo/constants.dart';
import 'package:web_demo/screen/dashboard/model/cloud_storage_info_view_model.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.storageInfo,
  }) : super(key: key);
  final CloudStorageInfoViewModel storageInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: storageInfo.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  storageInfo.svgSrc,
                  color: storageInfo.color,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          Text(
            storageInfo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressStorage(
            color: storageInfo.color,
            percentage: (storageInfo.percentage / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${storageInfo.numOfFiles} Files",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white70),
              ),
              Text(
                storageInfo.totalStorage,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressStorage extends StatelessWidget {
  const ProgressStorage({
    Key? key,
    required this.color,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * percentage,
            height: 5,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
