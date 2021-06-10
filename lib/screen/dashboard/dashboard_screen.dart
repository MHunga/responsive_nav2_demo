import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/constants.dart';
import 'package:web_demo/responsive.dart';
import 'package:web_demo/screen/dashboard/controllers/cloud_storage_controller.dart';
import 'package:web_demo/screen/dashboard/controllers/recent_file_controller.dart';

import 'components/header.dart';
import 'components/my_files.dart';
import 'components/recent_files_widget.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CloudStorageController>(
          create: (context) => CloudStorageController(),
        ),
        ChangeNotifierProvider<RecentFileController>(
          create: (context) => RecentFileController(),
        )
      ],
      builder: (context, child) => SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        RecentFileWidget()
                      ],
                    )),
                if (!Responsive.isMobile(context))
                  SizedBox(
                    width: defaultPadding,
                  ),
                Responsive.isMobile(context)
                    ? SizedBox(
                        width: 0,
                      )
                    : Expanded(flex: 2, child: StorageDetails())
              ],
            ),
            !Responsive.isMobile(context)
                ? SizedBox(
                    width: defaultPadding,
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: defaultPadding),
                    child: StorageDetails(),
                  )
          ],
        ),
      )),
    );
  }
}
