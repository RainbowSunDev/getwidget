import 'dart:async';
//import 'dart:ffi';
import 'package:flutter/material.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class GFSlider extends StatefulWidget {
  GFSlider(
      {@required this.items,
      this.pagerSize,
      this.passiveIndicator,
      this.activeIndicator,
      this.pagination,
      this.height,
      this.aspectRatio: 16 / 9,
      this.viewportFraction: 0.8,
      this.initialPage: 0,
      int realPage: 10000,
      this.enableInfiniteScroll: true,
      this.reverse: false,
      this.autoPlay: false,
      this.autoPlayInterval: const Duration(seconds: 4),
      this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
      this.autoPlayCurve: Curves.fastOutSlowIn,
      this.pauseAutoPlayOnTouch,
      this.enlargeMainPage = false,
      this.onPageChanged,
      this.scrollPhysics,
      this.scrollDirection: Axis.horizontal})
      : this.realPage =
            enableInfiniteScroll ? realPage + initialPage : initialPage,
        this.pageController = PageController(
          viewportFraction: viewportFraction,
          initialPage:
              enableInfiniteScroll ? realPage + initialPage : initialPage,
        );

  /// The pagination dots size can be defined using [double].
  final double pagerSize;

  /// The slider pagination's active color.
  final Color activeIndicator;

  /// The slider pagination's passive color.
  final Color passiveIndicator;

  /// The [GFSlider] shows pagination on state true.
  final bool pagination;

  /// The widgets to be shown as sliders.
  final List<Widget> items;

  /// Set slide widget height and overrides any existing [aspectRatio].
  final double height;

  /// Aspect ratio is used if no height have been declared. Defaults to 16:9 aspect ratio.
  final double aspectRatio;

  /// The fraction of the viewport that each page should occupy. Defaults to 0.8, which means each page fills 80% of the slide.
  final num viewportFraction;

  /// The initial page to show when first creating the [GFSlider]. Defaults to 0.
  final num initialPage;

  /// The actual index of the [PageView].
  final num realPage;

  /// Determines if slides should loop infinitely or be limited to item length. Defaults to true, i.e. infinite loop.
  final bool enableInfiniteScroll;

  /// Reverse the order of items if set to true. Defaults to false.
  final bool reverse;

  /// Enables auto play, sliding one page at a time. Use [autoPlayInterval] to determent the frequency of slides. Defaults to false.
  final bool autoPlay;

  /// Sets Duration to determent the frequency of slides when [autoPlay] is set to true. Defaults to 4 seconds.
  final Duration autoPlayInterval;

  /// The animation duration between two transitioning pages while in auto playback. Defaults to 800 ms.
  final Duration autoPlayAnimationDuration;

  /// Determines the animation curve physics. Defaults to [Curves.fastOutSlowIn].
  final Curve autoPlayCurve;

  /// Sets a timer on touch detected that pause the auto play with the given [Duration]. Touch Detection is only active if [autoPlay] is true.
  final Duration pauseAutoPlayOnTouch;

  /// Determines if current page should be larger then the side images,
  /// creating a feeling of depth in the carousel. Defaults to false.
  final bool enlargeMainPage;

  /// The axis along which the page view scrolls. Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Called whenever the page in the center of the viewport changes.
  final Function(int index) onPageChanged;

  /// How the carousel should respond to user input.
  ///
  /// For example, determines how the items continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics scrollPhysics;

  /// [pageController] is created using the properties passed to the constructor
  /// and can be used to control the [PageView] it is passed to.
  final PageController pageController;

  /// Animates the controlled [GFSlider] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> nextPage({Duration duration, Curve curve}) {
    return pageController.nextPage(duration: duration, curve: curve);
  }

  /// Animates the controlled [GFSlider] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> previousPage({Duration duration, Curve curve}) {
    return pageController.previousPage(duration: duration, curve: curve);
  }

  /// Changes which page is displayed in the controlled [GFSlider].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int page) {
    final index =
        _getRealIndex(pageController.page.toInt(), realPage, items.length);
    return pageController
        .jumpToPage(pageController.page.toInt() + page - index);
  }

  /// Animates the controlled [GFSlider] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> animateToPage(int page, {Duration duration, Curve curve}) {
    final index =
        _getRealIndex(pageController.page.toInt(), realPage, items.length);
    return pageController.animateToPage(
        pageController.page.toInt() + page - index,
        duration: duration,
        curve: curve);
  }

  @override
  _GFSliderState createState() => _GFSliderState();
}

class _GFSliderState extends State<GFSlider> with TickerProviderStateMixin {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = getPlayTimer();
  }

  Timer getPlayTimer() {
    return Timer.periodic(widget.autoPlayInterval, (_) {
      if (widget.autoPlay) {
        widget.pageController.nextPage(
            duration: widget.autoPlayAnimationDuration,
            curve: widget.autoPlayCurve);
      }
    });
  }

  void pauseOnTouch() {
    timer.cancel();
    timer = Timer(widget.pauseAutoPlayOnTouch, () {
      timer = getPlayTimer();
    });
  }

  Widget getPageWrapper(Widget child) {
    if (widget.height != null) {
      final Widget wrapper = Container(height: widget.height, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.aspectRatio, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    }
  }

  Widget addGestureDetection(Widget child) =>
      GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        getPageWrapper(PageView.builder(
          physics: widget.scrollPhysics,
          scrollDirection: widget.scrollDirection,
          controller: widget.pageController,
          reverse: widget.reverse,
          itemCount: widget.enableInfiniteScroll ? null : widget.items.length,
          onPageChanged: (int index) {
            int currentPage = _getRealIndex(index + widget.initialPage,
                widget.realPage, widget.items.length);
            if (widget.onPageChanged != null) {
              widget.onPageChanged(currentPage);
              _current = currentPage;
            }
            _current = currentPage;
          },
          itemBuilder: (BuildContext context, int i) {
            final int index = _getRealIndex(
                i + widget.initialPage, widget.realPage, widget.items.length);

            return AnimatedBuilder(
              animation: widget.pageController,
              child: widget.items[index],
              builder: (BuildContext context, child) {
                // on the first render, the pageController.page is null,
                // this is a dirty hack
                if (widget.pageController.position.minScrollExtent == null ||
                    widget.pageController.position.maxScrollExtent == null) {
                  Future.delayed(Duration(microseconds: 1), () {
                    setState(() {});
                  });
                  return Container();
                }
                double value = widget.pageController.page - i;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);

                final double height = widget.height ??
                    MediaQuery.of(context).size.width *
                        (1 / widget.aspectRatio);
                final double distortionValue = widget.enlargeMainPage
                    ? Curves.easeOut.transform(value)
                    : 1.0;

                if (widget.scrollDirection == Axis.horizontal) {
                  return Center(
                      child: SizedBox(
                          height: distortionValue * height, child: child));
                } else {
                  return Center(
                      child: SizedBox(
                          width: distortionValue *
                              MediaQuery.of(context).size.width,
                          child: child));
                }
              },
            );
          },
        )),
        widget.pagination == true
            ? Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(
                      widget.items,
                      (indexx, url) {
                        return Container(
                          width:
                              widget.pagerSize == null ? 8.0 : widget.pagerSize,
                          height:
                              widget.pagerSize == null ? 8.0 : widget.pagerSize,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == indexx
                                ? widget.activeIndicator == null
                                    ? Color.fromRGBO(0, 0, 0, 0.9)
                                    : widget.activeIndicator
                                : widget.passiveIndicator == null
                                    ? Color.fromRGBO(0, 0, 0, 0.4)
                                    : widget.passiveIndicator,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

/// Converts an index of a set size to the corresponding index of a collection of another size
/// as if they were circular.
///
/// Takes a [position] from collection Foo, a [base] from where Foo's index originated
/// and the [length] of a second collection Baa, for which the correlating index is sought.
///
/// For example; We have a Carousel of 10000(simulating infinity) but only 6 images.
/// We need to repeat the images to give the illusion of a never ending stream.
/// By calling _getRealIndex with position and base we get an offset.
/// This offset modulo our length, 6, will return a number between 0 and 5, which represent the image
/// to be placed in the given position.
int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remainder(offset, length);
}

/// Returns the remainder of the modulo operation [input] % [source], and adjust it for
/// negative values.
int _remainder(int input, int source) {
  final int result = input % source;
  return result < 0 ? source + result : result;
}
