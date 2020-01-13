import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/badge/gf_badge.dart';
import 'package:ui_kit/components/badge/gf_button_badge.dart';
import 'package:ui_kit/components/badge/gf_icon_badge.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/components/typography/gf_typography.dart';
import 'package:ui_kit/components/tabs/gf_tabs.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_typography_type.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';
import 'package:flutter/cupertino.dart';

class BadgesPage extends StatefulWidget {
  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: getGFColor(GFColor.success),
          ),
        ),
        backgroundColor: getGFColor(GFColor.dark),
        title: Text(
          'Badges',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: GFTypography(
              text: 'With Buttons',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),
          GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Primary',
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Second',
                        color: GFColor.secondary,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Success',
                        color: GFColor.success,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Warning',
                        color: GFColor.warning,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Danger',
                        color: GFColor.danger,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Info',
                        color: GFColor.info,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Light',
                        color: GFColor.light,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Dark',
                        textStyle: TextStyle(color: getGFColor(GFColor.white)),
                        color: GFColor.dark,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: GFButtonBadge(
                        icon: GFBadge(
                          text: '6',
                          shape: GFBadgeShape.pills,
                        ),
                        onPressed: () {},
                        text: 'Link',
                        color: GFColor.transparent,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: GFTypography(
              text: 'Icon with Badges',
              type: GFTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: Color(0xFF19CA4B),
            ),
          ),
          GFCard(
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/primary.svg',
                              color: getGFColor(GFColor.primary),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/secondary.svg',
                              color: getGFColor(GFColor.secondary),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/success.svg',
                              color: getGFColor(GFColor.success),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/warning.svg',
                              color: getGFColor(GFColor.warning),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/danger.svg',
                              color: getGFColor(GFColor.danger),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.circle,
                          size: GFSize.small,
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/info.svg',
                              color: getGFColor(GFColor.info),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.standard,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/light.svg',
                              color: getGFColor(GFColor.light),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.square,
                          size: GFSize.small,
                        )),
                    GFIconBadge(
                        child: GFIconButton(
                            type: GFType.transparent,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'lib/assets/icons/dark.svg',
                              color: getGFColor(GFColor.dark),
                            )),
                        counterChild: GFBadge(
                          text: '12',
                          shape: GFBadgeShape.pills,
                          size: GFSize.small,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
