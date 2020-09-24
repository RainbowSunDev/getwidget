import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

final List<String> imageList = [
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg',
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetWidget Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'GetWidget Example'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;
  final _ratingController = TextEditingController();
  bool check = false;
  String searchData;
  final TextEditingController _searchController = TextEditingController();
  int groupValue = 0;
  final GFBottomSheetController _controller = GFBottomSheetController();

  @override
  void initState() {
    super.initState();
    _ratingController.text = '4.5';
    tabController = TabController(length: 6, initialIndex: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool switchValue = true;
  bool showToast = false;

  List list = [
    'Flutter',
    'React',
    'Ionic',
    'Xamarin',
    'Flutter2',
    'React2',
    'Ionic2',
    'Xamarin2',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: GFAppBar(
        title: const Text('UI KIt'),
      ),
      body:

  //     ListView.builder(
  //             itemCount: imageList.length,
  //             itemBuilder: (context, index) => GFStickyHeaderBuilder(
  //               direction: Axis.horizontal,
  //               // enableHeaderOverlap: true,
  //               // stickyContentPosition: GFPosition.end,
  //               stickyContentBuilder:
  //                   (BuildContext context, double stuckValue) {
  //                 stuckValue = 1.0 - stuckValue.clamp(0.0, 1.0);
  //                 return Container(
  //                   height: 50,
  //                   width: MediaQuery.of(context).size.width * 0.5,
  //                   color: Color.lerp(Colors.teal[100], Colors.teal[600], stuckValue),
  //                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                   alignment: Alignment.centerLeft,
  //                   child: Row(
  //                     children: <Widget>[
  //                       Expanded(
  //                         child: Text(
  //                           'Image #$index',
  //                           style: const TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                       Offstage(
  //                         offstage: stuckValue <= 0.0,
  //                         child: Opacity(
  //                           opacity: stuckValue,
  //                           child: IconButton(
  //                             icon: const Icon(Icons.image, color: Colors.white),
  //                             onPressed: () =>
  //                                 Scaffold.of(context).showSnackBar(SnackBar(content: Text('Favorite #$index'))),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //               content: Container(
  //                 // margin: EdgeInsets.all(8),
  //                 height: 200,
  //                 width: MediaQuery.of(context).size.width * 0.5,
  //                 color: Colors.teal,
  //                 child: Image.network(imageList[index],
  //                     fit: BoxFit.cover, width: 100, height: 200),
  //               ),
  //             ))
  // );

      // Center(
      //   // alignment: AlignmentDirectional.center,
      //     child: ListView.builder(
      //       itemCount: imageList.length,
      //         itemBuilder: (context, index) => GFStickyHeaderBuilder(
      //           direction: Axis.vertical,
      //           // enableHeaderOverlap: true,
      //           // stickyContentPosition: GFPosition.end,
      //           stickyContentBuilder:
      //               (BuildContext context, double stuckValue) {
      //             stuckValue = 1.0 - stuckValue.clamp(0.0, 1.0);
      //             return Center(
      //               child: Container(
      //                 height: 50.0,
      //                 width: 100,
      //                 color:
      //                 Colors.grey[900].withOpacity(0.6 + stuckValue * 0.4),
      //                 padding: EdgeInsets.symmetric(horizontal: 16.0),
      //                 alignment: Alignment.centerLeft,
      //                 child: Text(
      //                   'Header #$index',
      //                   style: const TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //             );
      //           },
      //           content: Container(
      //             // margin: EdgeInsets.all(8),
      //             height: 200,
      //             width: 200,
      //             color: Colors.teal,
      //             child: Image.network(imageList[index],
      //                 fit: BoxFit.cover, width: 100, height: 200.0),
      //           ),
      //         ))),
      //     );

    Container(
      height: 600,
      color: Colors.teal,
      child: ListView.builder(
          itemCount: imageList.length,
          itemBuilder: (context, index) => GFStickyHeader(
            enableHeaderOverlap: true,
            direction: Axis.vertical,
            // stickyContentPosition: GFPosition.end,
            stickyContent:  Container(
              // alignment: AlignmentDirectional.centerEnd,
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 50,
                width: 100,
                color: Colors.blueGrey[700],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Image $index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            content: Container(
              // height: 100,
              width: 200,
              child: Image.network(imageList[index],
                fit: BoxFit.cover, height: 200,
              ),
            ),
          )
      ),
    )
  );

//     ListView(
//       children: [
//         Image.network(imageList[3], height: 200, fit: BoxFit.cover,),
//         Image.network(imageList[4], height: 200, fit: BoxFit.cover,),
//         GFStickyHeader(
//           enableHeaderOverlap: true,
//           stickyContent: Container(
//             height: 100,
//             color: Colors.teal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             alignment: Alignment.centerLeft,
//             child: const Text(
//               'Title',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           content: ListView(
//             shrinkWrap: true,
//             physics: const ScrollPhysics(),
//             children: [
//               Image.network(imageList[0], height: 200, fit: BoxFit.fill,),
//               Image.network(imageList[1], height: 200, fit: BoxFit.fill,),
//               Image.network(imageList[2], height: 200, fit: BoxFit.fill,),
//               Image.network(imageList[0], height: 200, fit: BoxFit.fill,),
//               Image.network(imageList[1], height: 200, fit: BoxFit.fill,),
//               Image.network(imageList[2], height: 200, fit: BoxFit.fill,)
//             ],
//           ),
//         )
//       ],
//     ),
// );

//    SingleChildScrollView(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Container(
//            height: 10,
//          ),
//          Radio(
//            value: 0,
//            groupValue: groupValue,
//            onChanged: (val) {
//              setState(() {
//                groupValue = val;
//              });
//            },
//          ),
//          Radio(
//            value: 1,
//            groupValue: groupValue,
//            onChanged: (val) {
//              setState(() {
//                groupValue = val;
//              });
//            },
//          ),
//        ],
//      ),
//    ),
//    bottomSheet: GFBottomSheet(
//      controller: _controller,
////animationDuration: 800,
////      minContentHeight: 100,
//      maxContentHeight: 300,
////      elevation: 10,
//      enableExpandableContent: true,
//      stickyHeaderHeight: 100,
//      stickyHeader: Container(
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10),
//            color: Colors.tealAccent),
////        height: 100,
//        child: const Center(
//          child: Text('Swipe me!'),
//        ),
//      ),
//      contentBody: Container(
//        color: Colors.teal,
//        child: ListView(
//          shrinkWrap: true,
//          physics: const ScrollPhysics(),
//          children: const [
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//            Text('fhj'),
//          ],
//        ),
//      ),
////      stickyFooter: Container(
////        color: Theme.of(context).primaryColor,
////        height: 100,
////        child: const Center(
////          child: Text('I am Footer!'),
////        ),
////      ),
////      stickyFooterHeight: 50,
//    ),
//    floatingActionButton: FloatingActionButton(
//        child: const Icon(Icons.stars),
//        onPressed: () {
//          _controller.isBottomSheetOpened
//              ? _controller.hideBottomSheet()
//              : _controller.showBottomSheet();
//        }),
//  );
}

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: 'Example',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     debugShowCheckedModeBanner: false,
//     home: const MyHomePage(title: 'Example'),
//   );
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//
//   List countryCode = [
//     {'name': 'India', 'dialCode': '91'},
//     {'name': 'xyz', 'dialCode': '92'},
//     {'name': 'abc', 'dialCode': '93'},
//   ];
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: GFAppBar(
//         title: const Text('UI KIt'),
//       ),
//       body: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                     margin: EdgeInsets.only(bottom: 35),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           ' Mobile Number*',
//                         ),
//                         SizedBox(
//                           height: 6,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border(
//                                 bottom: BorderSide(color: Colors.white54, width: 1),
//                               )),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               InkWell(
//                                 onTap: () async {
//                                 },
//                                 child: Container(
//                                   height: 48,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey.withOpacity(0.5),
// //                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //                          border: Border.all(color: Colors.green)
//                                   ),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Text('+91'
//                                       ),
//                                       SizedBox(
//                                         width: 6,
//                                       ),
//                                       Icon(
//                                         Icons.keyboard_arrow_down,
//                                         color: Colors.black,
//                                         size: 16,
//                                       ),
//                                       SizedBox(
//                                         width: 16,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.number,
//                                   validator: (String value) {
//                                     if (value.isEmpty) {
//                                       return 'Please Enter Mobile Number';
//                                     } else
//                                       return null;
//                                   },
//                                   decoration: new InputDecoration(
//                                     hintText: 'Mobile Number',
//                                     border: InputBorder.none,
//                                     filled: true,
//                                     fillColor: Colors.grey.withOpacity(0.2),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(5.0)),
//                                         borderSide: BorderSide(color: Colors.green)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     )),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 16),
//                   child: TextFormField(
//                     // controller: _controller,
//                     decoration: InputDecoration(
//                       labelText: 'Search country',
//                       fillColor: Colors.white,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         borderSide: BorderSide(
//                           color: Colors.grey,
//                         ),
//                       ),
//                       contentPadding: EdgeInsets.all(16),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         borderSide: BorderSide(
//                           color: Colors.grey.withOpacity(0.6),
//                           width: 1.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                     height: MediaQuery.of(context).size.height - 120,
//                     child: ListView.builder(
//                         physics: ScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: countryCode == null ? 0 : countryCode.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             children: <Widget>[
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.of(context).pop(countryCode[index]);
//                                 },
//                                 child: ListTile(
//                                   title: Text(
//                                     countryCode[index]['name'],
//                                   ),
//                                   trailing: Text(
//                                     '+${countryCode[index]['dialCode']}',
//                                   ),
//                                 ),
//                               ),
//                               Divider(
//                                 height: 18,
//                                 color: Colors.grey.withOpacity(0.5),
//                               )
//                             ],
//                           );
//                         }))
//               ],
//             ),
//           )));
