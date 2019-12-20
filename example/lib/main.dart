import 'package:flutter/material.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/badge/gf_icon_badge.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/header_bar/gf_title_bar.dart';
import 'package:ui_kit/components/image/gf_image_overlay.dart';
import 'package:ui_kit/components/button_bar/gf_button_bar.dart';
import 'package:ui_kit/types/gf_type.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI_KIT_EXAMPLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UI_KIT_EXAMPLE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Card(
              child: Column(
                children: <Widget>[
                  Text("czsd"),
                  Row(
                    children: <Widget>[
                      OutlineButton(onPressed: null, child: Text("dscds"), color: Colors.orange, ),
                      FlatButton(onPressed: null, child: Text("dchbvj"))
                    ],
                  )
                ],
              ),
            ),

            GFButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GFButton(onPressed: null, child: Text("like"), icon: Icon(Icons.favorite_border), type: GFType.transparent,),
                GFButton(onPressed: null, child: Text("comment"),),
                GFButton(onPressed: null, child: Text("share"), icon: Icon(Icons.share), type: GFType.outline,),
              ],
            ),

            GFTitleBar(
              avatar: GFAvatar(
                child: Text("tb"),
              ),
              title: Text('title'),
              subTitle: Text('subtitle'),
              icon: GFIconButton(
                type: GFType.transparent,
                icon: Icon(Icons.favorite_border),
              ),
            ),

            GFCard(
              avatar: GFAvatar(
                child: Text("tb"),
              ),
              title: Text('title'),
              subTitle: Text('subtitle'),
              icon: GFIconButton(
                icon: Icon(Icons.favorite_border),
                type: GFType.transparent,
              ),
              image: Image.asset("lib/assets/pizza.jpeg"),
              content: Text("Flutter "
                  "Flutter is Google's mobile UI framework for crafting high-quality native interfaces on iOS and Android in "),
              buttonBar: GFButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GFButton(onPressed: null, child: Text("favorite"), icon: Icon(Icons.favorite_border), type: GFType.transparent, ),
                  GFButton(onPressed: null, child: Text("share"), icon: Icon(Icons.share), type: GFType.outline, ),
                ],
              ),

            ),





//            GFCard(
//              headertype: GFAtb(),
//              po
//              image
//              overlaytext
//              content: Text("content"),
//      buttonbar: gfbb()
//            ),
//
//            gfbb(
//              children[
//
//              ]
//            )
//            GFimageoverlay()

            GFAvatar(
//              radius: 20.0,
              child: Text("de"),
              backgroundColor: Colors.pink,
//              backgroundImage: ,
//              foregroundColor: Colors.deepOrangeAccent,
//              shape: GFShape.standard,
//              size: GFSize.medium,
//              borderRadius: BorderRadius.circular(20.0),
            ),
            GFIconBadges(
              onPressed: null,
              child: GFIconButton(
                onPressed: null,
                icon: Icon(Icons.ac_unit),
              ),
              counterChild: GFBadge(
                text: '12',
//                color: GFColor.dark,
//                shape: GFShape.circle,
//                size: GFSize.small,
//                border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//                textColor: GFColor.white,
//                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//                borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.orange, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
              ),
            ),
            GFIconButton(
              onPressed: null,
              icon: Icon(Icons.ac_unit),
//              iconSize: 12.0,
//              type: GFType.solid,
//              shape: GFShape.pills,
//              size: GFSize.large,
//              buttonBoxShadow: true,
//              color: GFColor.primary,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
            ),
            GFButtonBadge(
              onPressed: null,
//              position: GFIconPosition.start,
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
              text: 'goodies',
//              color: GFColor.danger,
//              shape: GFShape.pills,
//              type: GFType.outline,
//              size: GFSize.small,
            counterChild: GFBadge(
              child: Text("12"),
//              color: GFColor.dark,
//              shape: GFShape.circle,
//              size: GFSize.small,
//              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              textColor: GFColor.white,
//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
            ),
            ),
            GFBadge(
              text: '12',
//              color: GFColor.dark,
//              shape: GFShape.circle,
//              size: GFSize.small,
//              border: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              textColor: GFColor.white,
//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
            ),
            GFButton(
//              type: GFType.solid,
//              shape: GFShape.pills,
              text: 'goodies',
              onPressed: () {},
//              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.0),
//              size: GFSize.large,
//              buttonBoxShadow: true,
//              blockButton: true,
//              fullWidthButton: true,
//              color: GFColor.primary,
//              textColor: GFColor.secondary,
//              icon: Icon(Icons.error, color: Colors.white,),
//              position: GFIconPosition.start,
//              boxShadow: BoxShadow(
//                color: Colors.pink,
//                blurRadius: 2.0,
//                spreadRadius: 1.0,
//                offset: Offset.zero,
//              ),
//              borderSide: BorderSide(color: Colors.pink, width: 1.0, style: BorderStyle.solid),
//              borderShape: RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.zero),
            ),
          ],
        ),
      )
    );
  }
}
