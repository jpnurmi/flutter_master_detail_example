import 'package:flutter/material.dart';

import 'page_item.dart';
import 'landscape_layout.dart';
import 'portrait_layout.dart';

void main() {
  runApp(MaterialApp(home: MasterDetailPage()));
}

class MasterDetailPage extends StatefulWidget {
  MasterDetailPage({Key? key}) : super(key: key);

  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var _index = -1;
  var _previousIndex = 0;

  void _setIndex(int index) {
    _previousIndex = _index;
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageItem(
        title: 'Red',
        builder: (_) => ColorPage(text: 'Red', color: Colors.red),
      ),
      PageItem(
        title: 'Green',
        builder: (_) => ColorPage(text: 'Green', color: Colors.green),
      ),
      PageItem(
        title: 'Blue',
        builder: (_) => ColorPage(text: 'Blue', color: Colors.blue),
      ),
    ];

    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.portrait:
            return PortraitLayout(
              index: _index,
              pages: pages,
              onSelected: _setIndex,
            );
          case Orientation.landscape:
            return LandscapeLayout(
              index: _index == -1 ? _previousIndex : _index,
              pages: pages,
              onSelected: _setIndex,
            );
        }
      },
    );
  }
}

class ColorPage extends StatelessWidget {
  const ColorPage({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(child: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
}
