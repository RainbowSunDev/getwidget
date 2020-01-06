import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFIconButton extends StatefulWidget {
  /// The size of the icon inside the button.
  final double iconSize;

  /// The padding around the button's icon.
  final EdgeInsetsGeometry padding;

  /// Defines how the icon is positioned within the IconButton.
  final AlignmentGeometry alignment;

  /// The icon to display inside the button.
  final Widget icon;

  /// The color for the button's icon when it has the input focus.
  final Color focusColor;

  /// The color for the button's icon when a pointer is hovering over it.
  final Color hoverColor;

  /// Button type of [GFType] i.e, solid, outline, transparent
  final GFType type;

  /// Button type of [GFButtonShape] i.e, standard, pills, square, shadow, icons
  final GFButtonShape shape;

  /// Pass [GFColor] or [Color]
  final dynamic color;

  /// Pass [GFColor] or [Color]. The primary color of the button when the button is in the down (pressed) state.
  final dynamic splashColor;

  /// Pass [GFColor] or [Color]. The secondary color of the button when the button is in the down (pressed) state.
  final dynamic highlightColor;

  /// Pass [GFColor] or [Color]. The color to use for the icon inside the button, if the icon is disabled.
  final dynamic disabledColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Text that describes the action that will occur when the button is pressed.
  final String tooltip;

  /// The box shadow for the button's [Material].
  final BoxShadow boxShadow;

  /// The shape and border for the button's [Material].
  final ShapeBorder borderShape;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final dynamic size;

  /// on true state default box shadow appears around button
  final bool buttonBoxShadow;

  /// The border side for the button's [Material].
  final BorderSide borderSide;

  /// Create icon buttons of all types. check out [GFButton] for buttons
  const GFIconButton(
      {Key key,
      this.iconSize = 0.0,
      this.padding = const EdgeInsets.all(8.0),
      this.alignment = Alignment.center,
      @required this.icon,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor,
      this.disabledColor,
      @required this.onPressed,
      this.focusNode,
      this.autofocus = false,
      this.tooltip,
      this.type = GFType.transparent,
      this.shape = GFButtonShape.standard,
      this.color = GFColor.primary,
      this.borderShape,
      this.boxShadow,
      this.size = GFSize.medium,
      this.buttonBoxShadow,
      this.borderSide})
      : assert(iconSize != null),
        assert(padding != null),
        assert(alignment != null),
        assert(autofocus != null),
        assert(icon != null),
        super(key: key);

  @override
  _GFIconButtonState createState() => _GFIconButtonState();
}

class _GFIconButtonState extends State<GFIconButton> {
  Color color;
  Function onPressed;
  GFType type;
  GFButtonShape shape;
  BoxShadow boxShadow;
  double height;
  double width;
  double iconPixel;

  @override
  void initState() {
    this.color = getGFColor(widget.color);
    this.onPressed = widget.onPressed;
    this.type = widget.type;
    this.shape = widget.shape;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    Color currentColor;
    if (widget.onPressed != null)
      currentColor = widget.color;
    else
      currentColor = widget.disabledColor ?? Theme.of(context).disabledColor;

    final Color themeColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    final BorderSide outlineBorder = BorderSide(
      color: widget.borderSide == null ? themeColor : widget.borderSide.color,
      width: widget.borderSide?.width ?? 1.0,
    );

    final BorderSide shapeBorder = widget.type == GFType.outline
        ? outlineBorder
        : widget.borderSide != null
            ? widget.borderSide
            : BorderSide(
                color: this.color,
                width: 0.0,
              );

    ShapeBorder shape;

    if (this.shape == GFButtonShape.pills) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    } else if (this.shape == GFButtonShape.square) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), side: shapeBorder);
    } else if (this.shape == GFButtonShape.standard) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    } else {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    }

    if (widget.size == GFSize.small) {
      this.height = 36.0;
      this.width = 36.0;
      this.iconPixel = 24.0;
    } else if (widget.size == GFSize.medium) {
      this.height = 44.0;
      this.width = 44.0;
      this.iconPixel = 24.0;
    } else if (widget.size == GFSize.large) {
      this.height = 50.0;
      this.width = 50.0;
      this.iconPixel = 28.0;
    } else {
      this.height = 44.0;
      this.width = 44.0;
      this.iconPixel = 24.0;
    }

    Widget result = Container(
      height:
          widget.shape == GFButtonShape.pills ? this.height + 6 : this.height,
      width: widget.shape == GFButtonShape.pills ? this.width + 6 : this.width,
      padding: widget.padding,
      child: IconTheme.merge(
        data: IconThemeData(
          size: widget.iconSize > 0.0 ? widget.iconSize : this.iconPixel,
          color: currentColor,
        ),
        child: widget.icon,
      ),
    );

    if (widget.tooltip != null) {
      result = Tooltip(
        message: widget.tooltip,
        child: result,
      );
    }

    BoxDecoration getBoxShadow() {
      if (widget.type != GFType.transparent) {
        if (widget.boxShadow == null && widget.buttonBoxShadow != true) {
          return null;
        } else {
          return BoxDecoration(
              color: widget.type == GFType.transparent ||
                      widget.type == GFType.outline
                  ? Colors.transparent
                  : this.color,
              borderRadius: widget.shape == GFButtonShape.pills
                  ? BorderRadius.circular(50.0)
                  : widget.shape == GFButtonShape.standard
                      ? BorderRadius.circular(5.0)
                      : BorderRadius.zero,
              boxShadow: [
                widget.boxShadow == null && widget.buttonBoxShadow == true
                    ? BoxShadow(
                        color: themeColor,
                        blurRadius: 1.5,
                        spreadRadius: 2.0,
                        offset: Offset.zero,
                      )
                    : widget.boxShadow != null
                        ? widget.boxShadow
                        : BoxShadow(
                            color: Theme.of(context).canvasColor,
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                            offset: Offset.zero,
                          )
              ]);
        }
      }
      return null;
    }

    return Semantics(
      button: true,
      enabled: widget.onPressed != null,
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 60.0, maxHeight: 60.0),
          child: Container(
            height: widget.shape == GFButtonShape.pills
                ? this.height + 6
                : this.height,
            width: widget.shape == GFButtonShape.pills
                ? this.width + 6
                : this.width,
            decoration: getBoxShadow(),
            child: Material(
              shape: widget.type == GFType.transparent
                  ? null
                  : widget.borderShape == null ? shape : widget.borderShape,
              color: widget.type == GFType.transparent ||
                      widget.type == GFType.outline
                  ? Colors.transparent
                  : this.color,
              type: widget.type == GFType.transparent
                  ? MaterialType.transparency
                  : MaterialType.button,
              child: InkResponse(
                onTap: widget.onPressed,
                child: result,
                focusColor: widget.focusColor != null
                    ? getGFColor(widget.focusColor)
                    : Theme.of(context).focusColor,
                hoverColor: widget.hoverColor != null
                    ? getGFColor(widget.hoverColor)
                    : Theme.of(context).hoverColor,
                highlightColor: widget.highlightColor != null
                    ? getGFColor(widget.highlightColor)
                    : Theme.of(context).highlightColor,
                splashColor: widget.splashColor != null
                    ? getGFColor(widget.splashColor)
                    : Theme.of(context).splashColor,
                radius: math.max(
                  Material.defaultSplashRadius,
                  (widget.iconSize +
                          math.min(widget.padding.horizontal,
                              widget.padding.vertical)) *
                      0.7,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
