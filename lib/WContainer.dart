import 'package:flutter/material.dart';

import 'SingleLineFittedBox.dart';

class WContainer extends StatelessWidget {
  const WContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Column(
      //   children: [
      //     wContainerItem(BoxFit.none),
      //     const Text('Windex'),
      //     wContainerItem(BoxFit.contain),
      //     const Text('Flutter中国'),
      //   ],
      // ),
      child: Column(
        children: [
          wRow(' 90000000000000000 '),
          SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
          wRow(' 800 '),
          SingleLineFittedBox(child: wRow(' 800 ')),
        ]
            .map((e) =>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: e,
            ))
            .toList()
      ),
    );
  }

}

Widget wContainerItem(BoxFit boxFit) {
  return ClipRect(
    child: Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    ),
  );
}

// 直接使用Row
Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child],
  );
  return child;
}