import 'dart:async';
import 'package:flutter/material.dart';

class GFBottomSheet extends StatefulWidget {
  GFBottomSheet({
    Key key,
    @required this.contentBody,
    this.stickyHeader,
    this.stickyFooter,
    this.controller,
    this.minContentHeight = 0,
    this.maxContentHeight = 300,
    this.elevation = 0.0,
    this.stickyFooterHeight = 0.0,
    this.stickyHeaderHeight = 0.0,
    this.animationDuration = 300,
    this.enableExpandableContent = false,
  })  : assert(elevation >= 0.0),
        assert(minContentHeight >= 0.0),
        super(key: key) {
    controller.height = minContentHeight;
    controller.animationDuration = animationDuration;
  }

  /// [minContentHeight] controls the minimum height of the content body.
  /// It Must be greater or equal to 0. Default value is 0.
  final double minContentHeight;

  /// [maxContentHeight] controls the maximum height of the content body.
  /// It Must be greater or equal to 0. Default value is 300.
  final double maxContentHeight;

  /// [stickyHeader] is the header of GFBottomSheet.
  /// User can interact by swiping or tapping the [stickyHeader]
  final Widget stickyHeader;

  /// [contentBody] is the body of GFBottomSheet.
  /// User can interact by tapping the [contentBody]
  final Widget contentBody;

  /// [stickyFooter] is the footer of GFBottomSheet.
  /// User can interact by swiping or tapping the [stickyFooter]
  final Widget stickyFooter;

  /// [stickyFooterHeight] defines the height of GFBottomSheet footer.
  final double stickyFooterHeight;

  /// [stickyHeaderHeight] defines the height of GFBottomSheet footer.
  final double stickyHeaderHeight;

  /// [elevation] controls shadow below the GFBottomSheet material.
  /// Must be greater or equalto 0. Default value is 0.
  final double elevation;

  ///[enableExpandableContent] allows [contentBody] to expand.
  /// Default value is false.
  final bool enableExpandableContent;

  /// [controller] used to control GFBottomSheet behavior like hide/show
  final GFBottomSheetController controller;

  /// Defines the drag animation duration of the GFBottomSheet
  /// Default value is 300.
  final int animationDuration;

  @override
  _GFBottomSheetState createState() => _GFBottomSheetState();
}

class _GFBottomSheetState extends State<GFBottomSheet>
    with TickerProviderStateMixin {
  bool isDragDirectionUp;
  bool showBottomSheet = false;
  Function _controllerListener;
  final StreamController<double> controller = StreamController.broadcast();
  double position;
  bool showContent = false;

  void _onVerticalDragUpdate(data) {
    _setAnimationDuration();
    if (((widget.controller.height - data.delta.dy) >
            widget.minContentHeight) &&
        ((widget.controller.height - data.delta.dy) <
            widget.maxContentHeight)) {
      isDragDirectionUp = data.delta.dy <= 0;
      widget.controller.height -= data.delta.dy;
    }
  }

  void _onVerticalDragEnd(data) {
    _setAnimationDuration();
    if (isDragDirectionUp && widget.controller.value) {
      _showBottomSheet();
    } else if (!isDragDirectionUp && !widget.controller.value) {
      _hideBottomSheet();
    } else {
      widget.controller.value = isDragDirectionUp;
    }
  }

  void _onTap() {
    final bool isBottomSheetOpened =
        widget.controller.height == widget.maxContentHeight;
    widget.controller.value = !isBottomSheetOpened;
  }

  @override
  void initState() {
    super.initState();
    position = widget.minContentHeight;
    widget.controller.value = showBottomSheet;
    _controllerListener = () {
      widget.controller.value ? _showBottomSheet() : _hideBottomSheet();
    };
    widget.controller.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme =
        Theme.of(context).bottomSheetTheme;
    final double elevation =
        widget.elevation ?? bottomSheetTheme.elevation ?? 0;

    final Widget bottomSheet = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.stickyHeader == null
            ? Container()
            : GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                onTap: _onTap,
                child: Container(
                  height: widget.stickyHeaderHeight,
                  child: widget.stickyHeader,
                ),
              ),
        !widget.enableExpandableContent
            ? AnimatedBuilder(
                animation: widget.controller,
                builder: (_, Widget child) => AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(
                      milliseconds: widget.controller.animationDuration),
                  height: widget.controller.height,
                  child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalDragUpdate,
                      onVerticalDragEnd: _onVerticalDragEnd,
                      onTap: _onTap,
                      child: widget.contentBody),
                ),
              )
            : showContent
                ? StreamBuilder(
                    stream: controller.stream,
                    initialData: widget.controller.height,
                    builder: (context, snapshot) => GestureDetector(
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          if (((widget.controller.height - details.delta.dy) >
                                  widget.minContentHeight) &&
                              ((widget.controller.height - details.delta.dy) <
                                  (MediaQuery.of(context).size.height * 0.8 -
                                      widget.stickyFooterHeight -
                                      widget.stickyHeaderHeight))) {
                            isDragDirectionUp = details.delta.dy <= 0;
                            widget.controller.height -= details.delta.dy;
                          }
                          controller.add(widget.controller.height);
                        },
                        onVerticalDragEnd: _onVerticalDragEnd,
                        onTap: _onTap,
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          height: snapshot.hasData == null
                              ? widget.minContentHeight
                              : snapshot.data,
                          child: widget.contentBody,
                        )),
                  )
                : Container(),
        widget.stickyFooter == null
            ? Container()
            : AnimatedBuilder(
                animation: widget.controller,
                builder: (_, Widget child) => AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(
                      milliseconds: widget.controller.animationDuration),
                  height: widget.controller.height != widget.minContentHeight
                      ? widget.stickyFooterHeight
                      : 0.0,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    onTap: _onTap,
                    child: widget.stickyFooter,
                  ),
                ),
              ),
      ],
    );
    return Material(
      elevation: elevation,
      child: bottomSheet,
    );
  }

  void _hideBottomSheet() {
    setState(() {
      showContent = false;
    });
    widget.controller.height = widget.minContentHeight;
  }

  void _showBottomSheet() {
    setState(() {
      showContent = true;
    });
    widget.controller.height = widget.maxContentHeight;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _setAnimationDuration() {
    widget.controller.animationDuration = widget.animationDuration;
  }
}

class GFBottomSheetController extends ValueNotifier<bool> {
  GFBottomSheetController() : super(false);

  /// Defines the height of the GFBottomSheet's contentBody
  double _height;

  /// Defines the drag animation duration of the GFBottomSheet
  int animationDuration;

  // ignore: unnecessary_getters_setters
  set height(double value) => _height = value;

  // ignore: unnecessary_getters_setters
  double get height => _height;

  bool get isBottomSheetOpened => value;

  void hideBottomSheet() => value = false;
  void showBottomSheet() => value = true;
}
