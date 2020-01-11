import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFButton extends StatefulWidget {
  /// Called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged] callback.
  final ValueChanged<bool> onHighlightChanged;

  /// Defines the default text style, with [Material.textStyle], for the button's [child].
  final TextStyle textStyle;

  /// The border side for the button's [Material].
  final BorderSide borderSide;

  /// The box shadow for the button's [Material], if GFButtonType is solid
  final BoxShadow boxShadow;

  /// Pass [GFColor] or [Color]. The color for the button's [Material] when it has the input focus.
  final dynamic focusColor;

  /// Pass [GFColor] or [Color]. The color for the button's [Material] when a pointer is hovering over it.
  final dynamic hoverColor;

  /// Pass [GFColor] or [Color]. The highlight color for the button's [InkWell].
  final dynamic highlightColor;

  /// Pass [GFColor] or [Color]. The splash color for the button's [InkWell].
  final dynamic splashColor;

  /// The elevation for the button's [Material] when the button is [enabled] but not pressed.
  final double elevation;

  /// The elevation for the button's [Material] when the button is [enabled] and a pointer is hovering over it.
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button is [enabled] and has the input focus.
  final double focusElevation;

  /// The elevation for the button's [Material] when the button is [enabled] and pressed.
  final double highlightElevation;

  /// The elevation for the button's [Material] when the button is not [enabled].
  final double disabledElevation;

  /// The internal padding for the button's [child].
  final EdgeInsetsGeometry padding;

  /// Defines the button's size.
  final BoxConstraints constraints;

  /// The shape of the button's [Material].
  final ShapeBorder borderShape;

  /// Defines the duration of animated changes for [shape] and [elevation].
  final Duration animationDuration;

  /// Typically the button's label.
  final Widget child;

  /// Whether the button is enabled or disabled.
  bool get enabled => onPressed != null;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize materialTapTargetSize;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  /// Button type of [GFType] i.e, solid, outline, outline2x, transparent
  final GFType type;

  /// Button type of [GFButtonShape] i.e, standard, pills, square, shadow, icons
  final GFButtonShape shape;

  /// Pass [GFColor] or [Color]
  final dynamic color;

  /// The fill color of the button when the button is disabled.
  ///
  /// The default value of this color is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// See also:
  ///
  ///  * [color] - the fill color of the button when the button is [enabled].
  final dynamic disabledColor;

  /// Pass [GFColor] or [Color]
  final dynamic textColor;

  /// The color to use for this button's text when the button is disabled.
  ///
  /// The button's [Material.textStyle] will be the current theme's button
  /// text style, [ThemeData.textTheme.button], configured with this color.
  ///
  /// The default value is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// If [textColor] is a [MaterialStateProperty<Color>], [disabledTextColor]
  /// will be ignored.
  ///
  /// See also:
  ///
  ///  * [textColor] - The color to use for this button's text when the button is [enabled].
  final dynamic disabledTextColor;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final dynamic size;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// icon of type [Widget]
  final Widget icon;

  /// icon type of [GFIconPosition] i.e, start, end
  final GFPosition position;

  /// on true state blockButton gives block size button
  final bool blockButton;

  /// on true state full width Button gives full width button
  final bool fullWidthButton;

  /// on true state default box shadow appears around button, if GFButtonType is solid
  final bool buttonBoxShadow;

  /// A set of thirteen colors that can be used to derive the button theme's
  /// colors.
  ///
  /// This property was added much later than the theme's set of highly
  /// specific colors, like [ThemeData.buttonColor], [ThemeData.highlightColor],
  /// [ThemeData.splashColor] etc.
  ///
  /// The colors for new button classes can be defined exclusively in terms
  /// of [colorScheme]. When it's possible, the existing buttons will
  /// (continue to) gradually migrate to it.
  final ColorScheme colorScheme;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback onLongPress;

  /// Create buttons of all types. check out [GFIconButton] for icon buttons, and [GFBadge] for badges
  const GFButton(
      {Key key,
        @required this.onPressed,
        this.onHighlightChanged,
        this.textStyle,
        this.boxShadow,
        this.buttonBoxShadow,
        this.focusColor,
        this.hoverColor,
        this.highlightColor,
        this.splashColor,
        this.elevation = 0.0,
        this.focusElevation = 4.0,
        this.hoverElevation = 4.0,
        this.highlightElevation = 1.0,
        this.disabledElevation = 0.0,
        this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
        this.constraints,
        this.borderShape,
        this.animationDuration = kThemeChangeDuration,
        this.clipBehavior = Clip.none,
        this.focusNode,
        this.autofocus = false,
        MaterialTapTargetSize materialTapTargetSize,
        this.child,
        this.type = GFType.solid,
        this.shape = GFButtonShape.standard,
        this.color = GFColor.primary,
        this.textColor,
        this.position = GFPosition.start,
        this.size = GFSize.medium,
        this.borderSide,
        this.text,
        this.icon,
        this.blockButton,
        this.fullWidthButton,
        this.colorScheme,
        this.enableFeedback,
        this.onLongPress,
        this.disabledColor,
        this.disabledTextColor,
      })
      : materialTapTargetSize =
      materialTapTargetSize ?? MaterialTapTargetSize.padded,
        assert(shape != null, 'Button shape can not be null'),
//        assert(elevation != null && elevation >= 0.0),
        assert(focusElevation != null && focusElevation >= 0.0),
        assert(hoverElevation != null && hoverElevation >= 0.0),
        assert(highlightElevation != null && highlightElevation >= 0.0),
        assert(disabledElevation != null && disabledElevation >= 0.0),
        assert(padding != null),
        assert(animationDuration != null),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(key: key);

  @override
  _GFButtonState createState() => _GFButtonState();
}

class _GFButtonState extends State<GFButton> {
  Color color;
  Color disabledColor;
  Color textColor;
  Color disabledTextColor;
  Widget child;
  Widget icon;
  Function onPressed;
  GFType type;
  GFButtonShape shape;
  double size;
  GFPosition position;
  BoxShadow boxShadow;

  final Set<MaterialState> _states = <MaterialState>{};

  @override
  void initState() {
    this.color = getGFColor(widget.color);
    this.textColor = getGFColor(widget.textColor);
    this.child = widget.text != null ? Text(widget.text) : widget.child;
    this.icon = widget.icon;
    this.onPressed = widget.onPressed;
    this.type = widget.type;
    this.shape = widget.shape;
    this.size = getGFSize(widget.size);
    this.position = widget.position;
    this.disabledColor = getGFColor(widget.disabledColor);
    this.disabledTextColor = getGFColor(widget.disabledTextColor);

    _updateState(MaterialState.disabled, !widget.enabled);
    super.initState();
  }

  bool get _hovered => _states.contains(MaterialState.hovered);
   bool get _focused => _states.contains(MaterialState.focused);
  bool get _pressed => _states.contains(MaterialState.pressed);
  bool get _disabled => _states.contains(MaterialState.disabled);

  double buttonWidth() {
    if (widget.blockButton == true) {
      return MediaQuery.of(context).size.width * 0.88;
    } else if (widget.fullWidthButton == true) {
      return MediaQuery.of(context).size.width;
    } else {
      return null;
    }
  }

  void _updateState(MaterialState state, bool value) {
    value ? _states.add(state) : _states.remove(state);
  }

  void _handleHighlightChanged(bool value) {
    if (_pressed != value) {
      setState(() {
        _updateState(MaterialState.pressed, value);
        if (widget.onHighlightChanged != null) {
          widget.onHighlightChanged(value);
        }
      });
    }
  }

  void _handleHoveredChanged(bool value) {
    if (_hovered != value) {
      setState(() {
        _updateState(MaterialState.hovered, value);
      });
    }
  }

   void _handleFocusedChanged(bool value) {
     if (_focused != value) {
       setState(() {
         _updateState(MaterialState.focused, value);
       });
     }
   }

  @override
  void didUpdateWidget(GFButton oldWidget) {
    _updateState(MaterialState.disabled, !widget.enabled);
    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (_disabled && _pressed) {
      _handleHighlightChanged(false);
    }
    super.didUpdateWidget(oldWidget);
  }

  double get _effectiveElevation {
    // These conditionals are in order of precedence, so be careful about
    // reorganizing them.
    if (_disabled) {
      return widget.disabledElevation;
    }
    if (_pressed) {
      return widget.highlightElevation;
    }
    if (_hovered) {
      return widget.hoverElevation;
    }
    if (_focused) {
      return widget.focusElevation;
    }
    return widget.elevation;
  }


  @override
  Widget build(BuildContext context) {
    ShapeBorder shape;

    Color getBorderColor() {
      if(widget.enabled){
        final Color fillColor = this.color == null ? getGFColor(GFColor.primary) : this.color;
        if (fillColor != null)
          return fillColor;
      }else{
        if (this.disabledColor != null)
          return this.disabledColor;
        else {
          return this.color.withOpacity(0.48);
        }
      }
    }

    Color getDisabledFillColor() {
      if (widget.type == GFType.transparent || widget.type == GFType.outline || widget.type == GFType.outline2x)
        return Colors.transparent;
      if (this.disabledColor != null)
        return this.disabledColor;
      else {
        return this.color.withOpacity(0.48);
      }
    }

    Color getColor() {
      if (widget.type == GFType.transparent || widget.type == GFType.outline || widget.type == GFType.outline2x)
        return Colors.transparent;
      else{
        final Color fillColor = this.color == null ? getGFColor(GFColor.primary) : this.color;
        if (fillColor != null)
          return fillColor;
      }
    }

    Color getDisabledTextColor() {

      if (this.disabledTextColor != null)
        return this.disabledTextColor;
      else if (widget.type == GFType.outline || widget.type == GFType.outline2x || widget.type == GFType.transparent){
        return this.color;
      }else{
        return getGFColor(GFColor.dark);
      }
    }


    Color getTextColor() {

      if (widget.type == GFType.outline || widget.type == GFType.outline2x || widget.type == GFType.transparent){
        return widget.enabled ? this.textColor == null ?
        this.color == getGFColor(GFColor.transparent) ? getGFColor(GFColor.dark) : this.color : this.textColor : getDisabledTextColor();
      }
      if (this.textColor == null) {
        if(this.color == getGFColor(GFColor.transparent)){
          return getGFColor(GFColor.dark);
        }else {
          return getGFColor(GFColor.white);
        }
      }
      else{
        return this.textColor;
      }
    }

    final Color effectiveTextColor = MaterialStateProperty.resolveAs<Color>(
        widget.textStyle?.color, _states);
    final Color themeColor =
    Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    final BorderSide outlineBorder = BorderSide(
      color: this.color == null
          ? themeColor
          : widget.borderSide == null ? getBorderColor() : widget.borderSide.color,
      width: widget.borderSide?.width == null ?  widget.type == GFType.outline2x ? 2.0 : 1.0 : widget.borderSide?.width,
    );

    Size minSize;
    switch (widget.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        minSize = const Size(48.0, 48.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
        break;
      default:
        minSize = Size.zero;
        break;
    }



    final BorderSide shapeBorder = widget.type == GFType.outline || widget.type == GFType.outline2x
        ? outlineBorder
        : widget.borderSide != null
        ? widget.borderSide
        : BorderSide(
      color: this.color == null ? themeColor : getBorderColor(),
      width: 0.0,
    );

    if (this.shape == GFButtonShape.pills) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    } else if (this.shape == GFButtonShape.square) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), side: shapeBorder);
    } else if (this.shape == GFButtonShape.standard) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0), side: shapeBorder);
    } else {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    }

    BoxDecoration getBoxShadow() {
      if (widget.type != GFType.transparent) {
        if (widget.boxShadow == null && widget.buttonBoxShadow != true) {
          return null;
        } else {
          return BoxDecoration(
              color: widget.type == GFType.transparent ||
                  widget.type == GFType.outline || widget.type == GFType.outline2x
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
                ),
              ]);
        }
      }
      return null;
    }

    getTextStyle(){
      if(widget.size == GFSize.small){
        return TextStyle(color: widget.enabled ? getTextColor() : getDisabledTextColor(), fontSize: 12);
      }else if(widget.size == GFSize.medium){
        return TextStyle(color: widget.enabled ? getTextColor() : getDisabledTextColor(), fontSize: 13, fontWeight: FontWeight.w400);
      }
      else if(widget.size == GFSize.large){
        return TextStyle(color: widget.enabled ? getTextColor() : getDisabledTextColor(), fontSize: 14, fontWeight: FontWeight.w500);
      }
    }

    final Widget result = Container(
      constraints: this.icon == null
          ? BoxConstraints(minWidth: 80.0)
          : BoxConstraints(minWidth: 90.0),
      decoration: widget.type == GFType.solid ? getBoxShadow() : null,
      child: Material(
        elevation: _effectiveElevation,
        textStyle: widget.textStyle == null
            ? getTextStyle()
            : widget.textStyle,
        shape: widget.type == GFType.transparent
            ? null
            : widget.borderShape == null ? shape : widget.borderShape,
        color: widget.enabled ? getColor() : getDisabledFillColor(),
        type: this.color == null
            ? MaterialType.transparency
            : MaterialType.button,
        animationDuration: widget.animationDuration,
        clipBehavior: widget.clipBehavior,
        child: InkWell(
          focusNode: widget.focusNode,
          canRequestFocus: widget.enabled,
          onFocusChange: _handleFocusedChanged,
          autofocus: widget.autofocus,
          onHighlightChanged: _handleHighlightChanged,
          onHover: _handleHoveredChanged,
          onTap: widget.onPressed,
          onLongPress: widget.onLongPress,
          enableFeedback: widget.enableFeedback,
          splashColor: getGFColor(widget.splashColor),
          highlightColor: getGFColor(widget.highlightColor),
          focusColor: getGFColor(widget.focusColor),
          hoverColor: getGFColor(widget.hoverColor),
          customBorder: widget.type == GFType.transparent
              ? null
              : widget.borderShape == null ? shape : widget.borderShape,
          child: IconTheme.merge(
            data: IconThemeData(color: effectiveTextColor),
            child: Container(
              height: this.size,
              width: buttonWidth(),
              padding: widget.padding,
              child: Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: this.icon != null &&
                    (this.position == GFPosition.start ||
                        this.position == null)
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    this.icon,
                    const SizedBox(width: 8.0),
                    this.child
                  ],
                )
                    : this.icon != null && (this.position == GFPosition.end)
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    this.child,
                    const SizedBox(width: 8.0),
                    this.icon
                  ],
                )
                    : this.child,
              ),
            ),
          ),
        ),
      ),
    );

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: _handleFocusedChanged,
          autofocus: widget.autofocus,
          child: result
        ),
      ),
    );
  }
}

/// A widget to pad the area around a [MaterialButton]'s inner [Material].
///
/// Redirect taps that occur in the padded area around the child to the center
/// of the child. This increases the size of the button and the button's
/// "tap target", but not its material or its ink splashes.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({
    Key key,
    Widget child,
    this.minSize,
  }) : super(key: key, child: child);

  final Size minSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInputPadding(minSize);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox child]) : super(child);

  Size get minSize => _minSize;
  Size _minSize;
  set minSize(Size value) {
    if (_minSize == value) return;
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMinIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMinIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMaxIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMaxIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  void performLayout() {
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      final double height = math.max(child.size.width, minSize.width);
      final double width = math.max(child.size.height, minSize.height);
      size = constraints.constrain(Size(height, width));
      final BoxParentData childParentData = child.parentData;
      childParentData.offset = Alignment.center.alongOffset(size - child.size);
    } else {
      size = Size.zero;
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final Offset center = child.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (BoxHitTestResult result, Offset position) {
        assert(position == center);
        return child.hitTest(result, position: center);
      },
    );
  }
}