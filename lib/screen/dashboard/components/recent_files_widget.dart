import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_demo/constants.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/screen/dashboard/controllers/recent_file_controller.dart';
import 'package:web_demo/screen/dashboard/model/recent_file_view_model.dart';

class RecentFileWidget extends StatelessWidget {
  const RecentFileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.watch<RecentFileController>().listRecentFileViewModel;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent File",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                horizontalMargin: 0,
                columns: [
                  DataColumn(label: Text("File Name")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Size"))
                ],
                rows: List.generate(
                    list.length, (index) => recentFileDataRow(list[index])),
              ))
        ],
      ),
    );
  }

  DataRow recentFileDataRow(RecentFileViewModel recentFile) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          SvgPicture.asset(
            recentFile.icon,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(recentFile.title),
          )
        ],
      )),
      DataCell(Text(recentFile.date)),
      DataCell(Text(recentFile.size)),
    ]);
  }
}
