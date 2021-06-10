import 'package:flutter/material.dart';
import 'package:web_demo/constants.dart';
import 'package:web_demo/responsive.dart';
import 'package:web_demo/screen/dashboard/controllers/cloud_storage_controller.dart';

import 'file_info_card.dart';
import 'package:provider/provider.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (Responsive.isMobile(context) ? 2 : 1))),
                icon: Icon(Icons.add),
                label: Text("Add New"))
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Responsive(
            mobile: FileInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
            ),
            tablet: FileInfoCardGridView(),
            web: FileInfoCardGridView())
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.crossAxisSpacing = 16,
  }) : super(key: key);
  final int crossAxisCount;
  final double crossAxisSpacing;
  @override
  Widget build(BuildContext context) {
    var list = context.watch<CloudStorageController>().listCloudStorage;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: defaultPadding),
      itemBuilder: (context, index) => FileInfoCard(
        storageInfo: list[index],
      ),
    );
  }
}
