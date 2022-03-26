import 'package:flutter/material.dart';

class MyappBar extends AppBar {
  MyappBar({
    Key? key,
    Widget? title,
    Color? backgroundColor,
    Color? color,
  }) : super(
          key: key,
          title: title ?? _openText,
          centerTitle: true,
          backgroundColor: backgroundColor ?? color,
          toolbarOpacity: 0.6,
          actions: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Builder(
                builder: (_context) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: color != null
                          ? MaterialStateColor.resolveWith(
                              (_) => color,
                            )
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.apps_sharp, size: 45),
                      ],
                    ),
                    onPressed: () {
                      Scaffold.of(_context).openEndDrawer();
                    },
                  );
                },
              ),
            ),
          ],
        );
  static const _openText = Text(
    'Social Media',
    style: TextStyle(
      color: Colors.black54,
    ),
  );
}
