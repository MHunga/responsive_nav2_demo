import 'package:web_demo/models/RecentFile.dart';

class RecentFileViewModel {
  final RecentFile recentFile;

  RecentFileViewModel({required this.recentFile});

  String get icon => this.recentFile.icon ?? "";
  String get title => this.recentFile.title ?? "";
  String get date => this.recentFile.date ?? "";
  String get size => this.recentFile.size ?? "";
}
