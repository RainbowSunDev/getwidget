import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFRadioButton<T> extends StatefulWidget {
  const GFRadioButton(
      {Key key,
      this.size = GFSize.SMALL,
      this.type = GFRadioButtonType.basic,
      this.radioColor = GFColors.SUCCESS,
      this.activebgColor = GFColors.WHITE,
      this.inactivebgColor = GFColors.WHITE,
      this.activeBorderColor = GFColors.DARK,
      this.inactiveBorderColor = GFColors.DARK,
      this.onChanged,
      this.value,
      this.activeIcon = const Icon(
        Icons.check,
        size: 20,
        color: GFColors.DARK,
      ),
      this.inactiveIcon = const Icon(
        Icons.close,
        size: 20,
        color: GFColors.DARK,
      ),
      this.custombgColor = GFColors.SUCCESS,
      this.groupValue,
        this.autofocus = false,
        this.focusNode
      }) : assert(autofocus != null),
        super(key: key);

  /// type of [GFRadioButtonType] which is of four type is basic, sqaure, circular and custom
  final GFRadioButtonType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  // type pf [Color] used to change the checkcolor when the checkbox is active
  final Color radioColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activebgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactivebgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

//  ///Used to set the current state of the checkbox
//  final bool value;
//
//  /// The currently selected value for a group of radio buttons.
//  ///
//  /// This radio button is considered selected if its [value] matches the
//  /// [groupValue].
//  final bool groupValue;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color custombgColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T groupValue;

  @override
  _GFRadioButtonState createState() => _GFRadioButtonState();
}

class _GFRadioButtonState extends State<GFRadioButton> {
  bool get enabled => widget.onChanged != null;

  @override
  void initState() {
    super.initState();
  }


  void _handleChanged(bool selected) {
    bool selected = false;
    if(widget.value == widget.groupValue){
      selected = true;
    }
    if (selected == null) {
      widget.onChanged(null);
      return;
    }
    if (selected) {
      widget.onChanged(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    focusNode: widget.focusNode,
    autofocus: widget.autofocus,
    enabled: enabled,
    child: InkWell(
        canRequestFocus: enabled,
        onTap: widget.onChanged != null ?
            () {
              bool selected = false;
              if(widget.value == widget.groupValue){
                selected = widget.value;
              }
              if (selected == null) {
                widget.onChanged(null);
              }
              if (selected) {
                widget.onChanged(widget.value);
              }
          return selected;
        } : null,
//        onTap: enabled ? _handleChanged : null,
        child: Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
                color: enabled ? widget.activebgColor : widget.inactivebgColor,
                borderRadius: widget.type == GFRadioButtonType.basic
                    ? BorderRadius.circular(50)
                    : widget.type == GFRadioButtonType.square
                        ? BorderRadius.circular(0)
                        : BorderRadius.circular(10),
                border: Border.all(
                    color: enabled
                        ? widget.activeBorderColor
                        : widget.inactiveBorderColor)),
            child: enabled
                ? widget.type == GFRadioButtonType.basic ||
                        widget.type == GFRadioButtonType.square
                    ? Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: widget.size * 0.7,
                            height: widget.size * 0.7,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: widget.radioColor),
                          )
                        ],
                      )
                    : widget.type == GFRadioButtonType.blunt
                        ? Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                width: widget.size * 0.8,
                                height: widget.size * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    color: widget.custombgColor),
                              )
                            ],
                          )
                        : widget.type == GFRadioButtonType.custom
                            ? widget.activeIcon
                            : widget.inactiveIcon
                : widget.inactiveIcon)),
  );
}
