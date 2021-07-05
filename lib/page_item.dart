import 'package:flutter/widgets.dart';

class PageItem {
  const PageItem({required this.title, required this.builder});
  final String title;
  final WidgetBuilder builder;
}
