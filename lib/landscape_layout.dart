import 'package:flutter/material.dart';
import 'package:flutter_master_detail_example/constants.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: kAppBarHeight.toDouble(),
            child: Row(
              children: [
                SizedBox(
                  width: kLeftPaneWidth.toDouble(),
                  child: AppBar(
                    title: Text('Settings'),
                  ),
                ),
                SizedBox(
                  width: size.width - kLeftPaneWidth.toDouble(),
                  child: AppBar(
                    title: Text('Landscape: ${widget.pages[_index].title}'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: SizedBox(
              height: size.height - kAppBarHeight.toDouble(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: kLeftPaneWidth.toDouble(),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.05)))),
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
                  SizedBox(
                      width: size.width - kLeftPaneWidth,
                      child: widget.pages[_index].builder(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
