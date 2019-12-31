import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFToast extends StatefulWidget {
  ///
  GFToast({
    Key key,
    this.child,
    this.button,
    this.backgroundColor,
    this.text,
    this.textStyle = const TextStyle(color: Colors.white70),
  }) : super(key: key);

  /// child of  type [Widget]is alternative to text key. text will get priority over child
  final Widget child;

  /// button of type [Widget],or you can use [GFButton] for easy implementation with [GFToast]
  final Widget button;

  ///pass color of type [Color] or [GFColor] for background of [GFToast]
  final dynamic backgroundColor;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// textStyle will be applicable to text only and not for the child
  final TextStyle textStyle;

  @override
  _GFToastState createState() => _GFToastState();
}

class _GFToastState extends State<GFToast> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  Timer timer;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.1))
        .animate(controller);

    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: offset, child:
    ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50.0, minWidth: 340),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: widget.backgroundColor != null
              ? getGFColor(widget.backgroundColor)
              : Color(0xff323232),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: widget.text != null
                  ? Text(widget.text, style: widget.textStyle)
                  : (widget.child ?? Container()),
            ),
            SizedBox(
              width: 10,
            ),
            widget.button != null
                ? Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.topRight,
                  child: widget.button,
                ))
                : Container()
          ],
        ),
      ),
    ));
  }
}
