import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerHeaderPictures extends StatelessWidget {
  const DrawerHeaderPictures({
    Key key,
    this.currentAccountPicture,
    this.otherAccountsPictures,
  }) : super(key: key);

  final Widget currentAccountPicture;
  final List<Widget> otherAccountsPictures;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          top: 0.0,
          end: 0.0,
          child: Row(
            children: (otherAccountsPictures ?? <Widget>[]).take(3).map<Widget>((Widget picture) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Semantics(
                  container: true,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    width: 48.0,
                    height: 48.0,
                    child: picture,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          top: 0.0,
          child: Semantics(
            explicitChildNodes: true,
            child: SizedBox(
              width: 72.0,
              height: 72.0,
              child: currentAccountPicture,
            ),
          ),
        ),
      ],
    );
  }
}

/// A material design [Drawer] header that identifies the app's user.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// See also:
///
///  * [DrawerHeader], for a drawer header that doesn't show user accounts.
///  * <https://material.io/design/components/navigation-drawer.html#anatomy>
class GFDrawerHeader extends StatefulWidget {
  /// Creates a material design drawer header.
  ///
  /// Requires one of its ancestors to be a [Material] widget.
  const GFDrawerHeader({
    Key key,
    this.decoration,
    this.margin = const EdgeInsets.only(bottom: 8.0),
    this.currentAccountPicture,
    this.otherAccountsPictures,
    this.child,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  /// The header's background. If decoration is null then a [BoxDecoration]
  /// with its background color set to the current theme's primaryColor is used.
  final Decoration decoration;

  /// The margin around the drawer header.
  final EdgeInsetsGeometry margin;

  /// A widget placed in the upper-left corner that represents the current
  /// user's account. Normally a [CircleAvatar].
  final Widget currentAccountPicture;

  /// A list of widgets that represent the current user's other accounts.
  /// Up to three of these widgets will be arranged in a row in the header's
  /// upper-right corner. Normally a list of [CircleAvatar] widgets.
  final List<Widget> otherAccountsPictures;

  /// A widget to be placed inside the drawer header, inset by the [padding].
  ///
  /// This widget will be sized to the size of the header. To position the child
  /// precisely, consider using an [Align] or [Center] widget.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The duration for animations of the [decoration].
  final Duration duration;

  /// The curve for animations of the [decoration].
  final Curve curve;

  @override
  _GFDrawerHeaderState createState() => _GFDrawerHeaderState();
}

class _GFDrawerHeaderState extends State<GFDrawerHeader> {

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    return Semantics(
      container: true,
      label: MaterialLocalizations.of(context).signedInLabel,
      child: DrawerHeader(
        decoration: widget.decoration ?? BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        margin: widget.margin,
        padding: const EdgeInsetsDirectional.only(top: 16.0, start: 16.0),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16.0),
                  child: DrawerHeaderPictures(
                    currentAccountPicture: widget.currentAccountPicture,
                    otherAccountsPictures: widget.otherAccountsPictures,
                  ),
                ),
              ),
              AnimatedContainer(
                padding: EdgeInsets.only(bottom: 16.0),
                duration: widget.duration,
                curve: widget.curve,
                child: widget.child
              ),
            ],
          ),
        ),
      ),
    );
  }
}
