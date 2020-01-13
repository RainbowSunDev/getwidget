import 'package:flutter/material.dart';
import 'package:gf_web/screens/layout/layout.dart';
import '../../styles/styles.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';

import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/size/gf_size.dart';

class SquareButtons extends StatefulWidget {
  @override
  _SquareButtonsState createState() => _SquareButtonsState();
}

class _SquareButtonsState extends State<SquareButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        body: ListView(
          children: <Widget>[
            Text('Square Buttons', style: hintStyleTextblackbolder(),),
            SizedBox(
              height: 20,
            ),
            Text('Buttons of type square which comes in different sizes that can be used in forms, alerts, and more...', style: hintStyleTextblackdull(),),
            SizedBox(
              height: 30,
            ),
            Text('Solid Buttons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Primary',
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Secondary',
                        color: GFColor.secondary,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Success',
                        shape: GFButtonShape.square,
                        color: GFColor.success,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        text: 'Warning',
                        shape: GFButtonShape.square,
                        color: GFColor.warning,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'danger',
                        color: GFColor.danger,
                      ))
                    ],
                  ),
SizedBox(
  height: 20,
),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Info',
                        color: GFColor.info,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Light',
                        color: GFColor.light,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Dark',
                        color: GFColor.dark,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Link',
                        color: GFColor.transparent,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Text('Disabled Buttons',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        shape: GFButtonShape.square,
                        onPressed:null,
                        text: 'Primary',
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'Secondary',
                        color: GFColor.secondary,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'Success',
                        color: GFColor.success,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'Warning',
                        color: GFColor.warning,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'danger',
                        color: GFColor.danger,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'Info',
                        color: GFColor.info,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'Light',
                        color: GFColor.light,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed:null,
                        shape: GFButtonShape.square,
                        text: 'Dark',
                        color: GFColor.dark,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: GFButton(
                        onPressed: (){},
                        shape: GFButtonShape.square,
                        text: 'Link',
                        color: GFColor.transparent,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(''))

                    ],
                  ),

                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Text('Transparent Buttons',  style: hintStyleTextblackbold(),),
            // GFCard(
            //   content: Column(
            //     children: <Widget>[
            //       Row(
            //         children: <Widget>[
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Primary',
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Secondary',
            //             color: GFColor.secondary,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Success',
            //             color: GFColor.success,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Warning',
            //             color: GFColor.warning,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'danger',
            //             color: GFColor.danger,
            //             type: GFType.transparent,
            //           ))
            //         ],
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Info',
            //             color: GFColor.info,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Light',
            //             color: GFColor.light,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed:null,
            //             text: 'Dark',
            //             color: GFColor.dark,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: GFButton(
            //             onPressed: (){},
            //             text: 'Link',
            //             color: GFColor.transparent,
            //             type: GFType.transparent,
            //           )),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Expanded(child: Text(''))

            //         ],
            //       ),

            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            Text(' Button Sizes',  style: hintStyleTextblackbold(),),
            GFCard(
              content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child:GFButton(
                        shape: GFButtonShape.square,
                              onPressed: (){},
                              child: Text("Large",
                                  ),

                              size: GFSize.large,
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:GFButton(
                        shape: GFButtonShape.square,
                        onPressed: (){},
                        child: Text("Medium",
                            ),
                        size: GFSize.medium,
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:GFButton(
                        shape: GFButtonShape.square,
                        onPressed: (){},
                        child: Text("Small",
                            ),
                        size: GFSize.small,
                      ),
                      ),

                    ],
                  ),


                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(' Block Buttons',  style: hintStyleTextblackbold(),),
            GFCard(
              content:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        GFButton(
                          onPressed: (){},
                        shape: GFButtonShape.square,
                          blockButton: true,
                          child: Text("Large",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.large,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        GFButton(
                          onPressed: (){},
                        shape: GFButtonShape.square,
                          blockButton: true,
                          child: Text("Normal",
                              style: TextStyle(
                                  color: getGFColor(GFColor.white))),
                          color: GFColor.primary,
                          size: GFSize.medium,
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        GFButton(
                          onPressed: (){},
                        shape: GFButtonShape.square,
                          blockButton: true,
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

            )
          ],
        ),
      ),
    );
  }
}
