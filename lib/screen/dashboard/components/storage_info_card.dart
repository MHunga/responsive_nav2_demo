import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_demo/constants.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    Key? key,
    required this.title,
    required this.iconSrc,
    required this.amountOfFile,
    required this.numOfFile,
  }) : super(key: key);
  final String title, iconSrc, amountOfFile;
  final int numOfFile;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.only(top: defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          border: Border.all(color: primaryColor.withOpacity(0.15), width: 2)),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(iconSrc),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$numOfFile Files",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white70),
                )
              ],
            ),
          )),
          Text(amountOfFile)
        ],
      ),
    );
  }
}
