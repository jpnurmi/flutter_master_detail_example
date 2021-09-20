import 'package:flutter/material.dart';

import 'constants.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: kAppBarHeight,
            child: Row(
              children: [
                SizedBox(
                  width: kLeftPaneWidth,
                  child: AppBar(title: Text('Pages')),
                ),
                Expanded(
                  child: AppBar(
                    title: Text('Landscape: ${widget.pages[_index].title}'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: kLeftPaneWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                    ),
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
                ),
                Expanded(child: widget.pages[_index].builder(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
