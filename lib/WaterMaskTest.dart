// import 'package:flutter/material.dart';
//
// class WaterMaskTest extends StatelessWidget {
//   const WaterMaskTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         wChild(1, Colors.white, 200),
//         WaterMark(
//           painter: TextWaterMarkPainter(text: 'wendux', rotate: -20),
//         ),
//       ],
//     );
//   }
//
//   Widget wChild(int index, color, double size) {
//     return Listener(
//       onPointerDown: (e) => print(index),
//       child: Container(
//         width: size,
//         height: size,
//         color: Colors.grey,
//       ),
//     );
//   }
// }
//
// class WaterMark extends StatefulWidget {
//   WaterMark({
//     Key? key,
//     this.repeat = ImageRepeat.repeat,
//     required this.painter,
//   }) : super(key: key);
//
//   /// 单元水印画笔
//   final WaterMarkPainter painter;
//
//   /// 单元水印的重复方式
//   final ImageRepeat repeat;
//
//   @override
//   State<WaterMark> createState() => _WaterMarkState();
// }
//
// class _WaterMarkState extends State<WaterMark> {
//   late Future<MemoryImage> _memoryImageFuture;
//
//   @override
//   void initState() {
//     // 缓存的是promise
//     _memoryImageFuture = _getWaterMarkImage();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand( // 水印尽可能大
//       child: FutureBuilder(
//         future: _memoryImageFuture,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState != ConnectionState.done) {
//             // 如果单元水印还没有绘制好先返回一个空的Container
//             return Container();
//           } else {
//             // 如果单元水印已经绘制好，则渲染水印
//             return DecoratedBox(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: snapshot.data, // 背景图，即我们绘制的单元水印图片
//                   repeat: widget.repeat, // 指定重复方式
//                   alignment: Alignment.topLeft,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   @override
//   void didUpdateWidget(WaterMark oldWidget) {
//     ... //待实现
//   }
//
//   // 离屏绘制单元水印并将绘制结果转为图片缓存起来
//   Future<MemoryImage> _getWaterMarkImage() async {
//     ... //待实现
//   }
//
//   @override
//   void dispose() {
//     ... // 待实现
//   }
// }
