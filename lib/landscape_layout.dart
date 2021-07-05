import 'package:flutter/material.dart';

import 'page_item.dart';

class LandscapeLayout extends StatefulWidget {
  const LandscapeLayout({
    Key? key,
    required this.index,
    required this.pages,
    required this.onSelected,
  }) : super(key: key);

  final int index;
  final List<PageItem> pages;
  final ValueChanged<int> onSelected;

  @override
  State<LandscapeLayout> createState() => _LandscapeLayoutState();
}

class _LandscapeLayoutState extends State<LandscapeLayout> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landscape: ${widget.pages[_index].title}'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 240,
            child: ListView(
              children: [
                for (var i = 0; i < widget.pages.length; ++i)
                  ListTile(
                    title: Text(widget.pages[i].title),
                    selected: i == _index,
                    onTap: () {
                      widget.onSelected(i);
                      setState(() => _index = i);
                    },
                  )
              ],
            ),
          ),
          Expanded(child: widget.pages[_index].builder(context)),
        ],
      ),
    );
  }
}
