import 'package:flutter/material.dart';
import 'package:ui_kit/components/tabs/gf_segment_tabs.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/types/gf_toggle_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';
import 'package:flutter/cupertino.dart';

class StandardButtons extends StatefulWidget {
  @override
  _StandardButtonsState createState() => _StandardButtonsState();
}

class _StandardButtonsState extends State<StandardButtons> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getGFColor(GFColor.dark),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          child:  Icon(CupertinoIcons.back, color: getGFColor(GFColor.success), ),),
        title: Text(
          'Standard Buttons',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body:

     Column(
       children: <Widget>[
         Container(
           height: 40,
           margin: EdgeInsets.only(top:20),
           child:  GFSegmentTabs(
             tabController: tabController,
//              height: 38.0,
              width: 280.0,
             initialIndex: 0,
             length: 3,
             tabs: <Widget>[
               Text(
                 "Solid",
               ),
               Tab(
                 child: Text(
                   "Outline",
                 ),
               ),
               Tab(
                 child: Text(
                   "Outline 2x",
                 ),
               ),
             ],
               tabBarColor: getGFColor(GFColor.light),
               indicatorSize: TabBarIndicatorSize.tab,
               labelColor: getGFColor(GFColor.white),
               unselectedLabelColor: Colors.white,
               indicator: BoxDecoration(
                 color: getGFColor(GFColor.dark),
                 border: Border(bottom: BorderSide(color: getGFColor(GFColor.success), width: 3.0,),),
//                borderRadius: BorderRadius.circular(2.0)
               ),
               indicatorPadding: EdgeInsets.all(8.0),
               indicatorWeight: 2.0,
               border: Border.all(color: Colors.white, width: 2.0),
           ),
//
//            
         ),
         
         Container(
           height: MediaQuery.of(context).size.height-140,
           child: GFTabBarView(
                controller: tabController,
                height: 400.0,
                children: <Widget>[
                  Container(
//              color: Colors.red,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 30),
                          child: GFTypography(
                            text: 'Default',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    shape: GFButtonShape.standard,
                                    child: Text("Primary",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.primary,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Secondary",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Success",
                                    ),
                                    color: GFColor.success,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Warning",
                                    ),
                                    color: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Danger",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Info",
                                    ),
                                    color: GFColor.info,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Light",
                                    ),
                                    color: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Dark",
                                      style:
                                      TextStyle(color: getGFColor(GFColor.white)),
                                    ),
                                    color: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.solid,
                                    color: GFColor.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Disabled State',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    shape: GFButtonShape.standard,
                                    child: Text("Primary",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.primary,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text("Secondary",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Success",
                                    ),
                                    color: GFColor.success,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Warning",
                                    ),
                                    color: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text("Danger",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Info",
                                    ),
                                    color: GFColor.info,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Light",
                                    ),
                                    color: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Dark",
                                      style:
                                      TextStyle(color: getGFColor(GFColor.white)),
                                    ),
                                    color: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.solid,
                                    color: GFColor.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Transparent Buttons',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Primary",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.primary,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Secondary",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Success",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.success,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Warning",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Danger",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Info",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.info,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Light",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Dark",
                                    ),
                                    type: GFType.transparent,
                                    textColor: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Button Sizes',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Large",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.primary,
                                    size: GFSize.large,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Normal",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.primary,
                                    size: GFSize.medium,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Small",
                                        style: TextStyle(
                                            color: getGFColor(GFColor.white))),
                                    color: GFColor.primary,
                                    size: GFSize.small,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Block Buttons',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text("Large",
                                    style:
                                    TextStyle(color: getGFColor(GFColor.white))),
                                color: GFColor.primary,
                                size: GFSize.large,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text("Normal",
                                    style:
                                    TextStyle(color: getGFColor(GFColor.white))),
                                color: GFColor.primary,
                                size: GFSize.medium,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text("Small",
                                    style:
                                    TextStyle(color: getGFColor(GFColor.white))),
                                color: GFColor.primary,
                                size: GFSize.small,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

//tab 2
                  Container(
//              color: Colors.red,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 30),
                          child: GFTypography(
                            text: 'Default',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Primary",
                                    ),
                                    type: GFType.outline,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Secondary"),
                                    type: GFType.outline,
                                    color: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Success",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.success,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Warning",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Danger",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Info",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.info,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Light",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Dark",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Disabled State',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Primary",
                                    ),
                                    type: GFType.outline,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text("Secondary"),
                                    type: GFType.outline,
                                    color: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Success",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.success,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Warning",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Danger",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Info",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.info,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Light",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Dark",
                                    ),
                                    type: GFType.outline,
                                    color: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Button Sizes',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Large",
                                    ),
                                    color: GFColor.primary,
                                    size: GFSize.large,
                                    type: GFType.outline,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Normal",
                                    ),
                                    color: GFColor.primary,
                                    size: GFSize.medium,
                                    type: GFType.outline,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Small",
                                    ),
                                    color: GFColor.primary,
                                    size: GFSize.small,
                                    type: GFType.outline,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Block Buttons',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text(
                                  "Large",
                                ),
                                color: GFColor.primary,
                                size: GFSize.large,
                                type: GFType.outline,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text(
                                  "Normal",
                                ),
                                color: GFColor.primary,
                                size: GFSize.medium,
                                type: GFType.outline,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text(
                                  "Small",
                                ),
                                color: GFColor.primary,
                                size: GFSize.small,
                                type: GFType.outline,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

//tab 3
                  Container(
//              color: Colors.red,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 30),
                          child: GFTypography(
                            text: 'Default',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Primary",
                                    ),
                                    type: GFType.outline2x,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text("Secondary"),
                                    type: GFType.outline2x,
                                    color: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Success",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.success,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Warning",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Danger",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Info",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.info,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Light",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Dark",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Disabled State',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Primary",
                                    ),
                                    type: GFType.outline2x,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text("Secondary"),
                                    type: GFType.outline2x,
                                    color: GFColor.secondary,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Success",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.success,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Warning",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.warning,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Danger",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.danger,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Info",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.info,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Light",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.light,
                                  ),
                                  GFButton(
                                    onPressed: null,
                                    child: Text(
                                      "Dark",
                                    ),
                                    type: GFType.outline2x,
                                    color: GFColor.dark,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Link",
                                    ),
                                    type: GFType.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Button Sizes',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Large",
                                    ),
                                    color: GFColor.primary,
                                    size: GFSize.large,
                                    type: GFType.outline2x,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Normal",
                                    ),
                                    color: GFColor.primary,
                                    size: GFSize.medium,
                                    type: GFType.outline2x,
                                  ),
                                  GFButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Small",
                                    ),
                                    color: GFColor.primary,
                                    size: GFSize.small,
                                    type: GFType.outline2x,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: GFTypography(
                            text: 'Block Buttons',
                            type: GFTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Color(0xFF19CA4B),
                          ),
                        ),
                        GFCard(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text(
                                  "Large",
                                ),
                                color: GFColor.primary,
                                size: GFSize.large,
                                type: GFType.outline2x,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text(
                                  "Normal",
                                ),
                                color: GFColor.primary,
                                size: GFSize.medium,
                                type: GFType.outline2x,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GFButton(
                                onPressed: () {},
                                blockButton: true,
                                child: Text(
                                  "Small",
                                ),
                                color: GFColor.primary,
                                size: GFSize.small,
                                type: GFType.outline2x,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ]
            ),
         )
       ],
     )
    );
  }
}



