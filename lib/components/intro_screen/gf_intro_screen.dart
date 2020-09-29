import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroScreen extends StatefulWidget {
  const GFIntroScreen({
    Key key,
    @required this.pageController,
    @required this.slides,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.introScreenBottomNavigationBar,
    this.showIntroSCreenBottomNavigationBar = true,
    this.currentIndex = 0,
    this.pageCount = 0,
    this.child,
    this.navigationBarColor = GFColors.SUCCESS,
    this.navigationBarHeight = 50,
    this.navigationBarShape,
    this.navigationBarWidth,
    this.navigationBarPadding = const EdgeInsets.all(8),
    this.navigationBarMargin = const EdgeInsets.all(8),
    this.showDivider = true,
    this.dividerColor = Colors.white,
    this.dividerHeight = 1,
    this.dividerThickness = 2,
    this.dotShape,
    this.inActiveColor = GFColors.LIGHT,
    this.activeColor = GFColors.PRIMARY,
    this.dotHeight = 12,
    this.dotWidth = 12,
    this.dotMargin = const EdgeInsets.symmetric(horizontal: 2),
    this.backButton,
    this.forwardButton,
    this.doneButton,
    this.skipButton,
    this.onDoneTap,
    this.onForwardButtonTap,
    this.onBackButtonTap,
    this.onSkipTap,
    this.forwardButtonText = 'NEXT',
    this.backButtonText = 'BACK',
    this.doneButtonText = 'GO',
    this.skipButtonText = 'SKIP',
    this.skipButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.doneButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.backButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.forwardButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.showButton = true,
    this.showPagination = true,
  }) : super(key: key);

  /// defines the list of slides
  final List<Widget> slides;

  /// default controller for the [GFIntroScreen] component
  final PageController pageController;

  /// background color of the [GFIntroScreen] component
  final Color color;

  /// defines [GFIntroScreen] height
  final double height;


  /// defines [GFIntroScreen] width
  final double width;

  /// defines [GFIntroScreen] border radius to defines slide shape
  final BorderRadius borderRadius;

  /// defines [GFIntroScreen] border
  final Border border;

  /// defines [GFIntroScreen]'s bottom navigation bar
  final GFIntroScreenBottomNavigationBar introScreenBottomNavigationBar;

  /// on true state, displays [GFIntroScreenBottomNavigationBar], defaults to true
  final bool showIntroSCreenBottomNavigationBar;

  /// defines the currentIndex of [GFIntroScreen] slides, default value is 0
  final int currentIndex;

  /// defines the length of [GFIntroScreen] slides, default value is 0
  final int pageCount;

  /// defines [GFIntroScreenBottomNavigationBar], it takes any widget
  final Widget child;

  /// defines [GFIntroScreenBottomNavigationBar] height
  final double navigationBarHeight;

  /// defines [GFIntroScreenBottomNavigationBar] width
  final double navigationBarWidth;

  /// defines [GFIntroScreenBottomNavigationBar] padding
  final EdgeInsets navigationBarPadding;

  /// defines [GFIntroScreenBottomNavigationBar] margin
  final EdgeInsets navigationBarMargin;

  /// defines [GFIntroScreenBottomNavigationBar] color
  final dynamic navigationBarColor;

  /// defines the shape of [GFIntroScreenBottomNavigationBar]
  final ShapeBorder navigationBarShape;

  /// Called when the forward button is tapped
  final VoidCallback onForwardButtonTap;

  /// Called when the back button is tapped
  final VoidCallback onBackButtonTap;

  /// Called when the done button is tapped
  final VoidCallback onDoneTap;

  /// Called when the skip button is tapped
  final VoidCallback onSkipTap;

  /// defines the backButton widget
  final Widget backButton;

  /// defines the forwardButton widget
  final Widget forwardButton;

  /// defines the doneButton widget
  final Widget doneButton;

  /// defines the skipButton widget
  final Widget skipButton;

  /// defines the backButton text
  final String backButtonText;

  /// defines the forwardButton text
  final String forwardButtonText;

  /// defines the doneButton text
  final String doneButtonText;

  /// defines the skipButton text
  final String skipButtonText;

  /// defines the skipButton textStyle
  final TextStyle skipButtonTextStyle;

  /// defines the doneButton textStyle
  final TextStyle doneButtonTextStyle;

  /// defines the backButton textStyle
  final TextStyle backButtonTextStyle;

  /// defines the forwardButton textStyle
  final TextStyle forwardButtonTextStyle;

  /// on true state, displays [Divider], defaults to true
  final bool showDivider;

  /// on true state, displays buttons, defaults to true
  final bool showButton;

  /// on true state, displays pagination, defaults to true
  final bool showPagination;

  /// defines divider height
  final double dividerHeight;

  /// defines divider thickness
  final double dividerThickness;

  /// defines divider color
  final dynamic dividerColor;

  /// defines pagination shape
  final ShapeBorder dotShape;

  /// defines pagination inactive color
  final Color inActiveColor;

  /// defines pagination active color
  final Color activeColor;

  /// defines pagination height
  final double dotHeight;

  /// defines pagination width
  final double dotWidth;

  /// defines pagination in between space
  final EdgeInsets dotMargin;

  @override
  _GFIntroScreenState createState() => _GFIntroScreenState();
}

class _GFIntroScreenState extends State<GFIntroScreen> {
  PageController _pageController;
  int currentIndex;
  List<Widget> pages;

  @override
  void initState() {
    _pageController = widget.pageController != null
        ? widget.pageController
        : PageController(initialPage: 0);
    currentIndex = _pageController.initialPage;
    if (widget.pageController != null) {
      _pageController = widget.pageController;
    }
    _pageController.addListener(() {
      if (mounted) {
        setState(() {
          currentIndex = _pageController.page.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
            border: widget.border ?? Border.all(width: 0),
            color: widget.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: widget.slides,
                ),
              ),
              widget.showIntroSCreenBottomNavigationBar
                  ? widget.introScreenBottomNavigationBar ??
                      GFIntroScreenBottomNavigationBar(
                        pageController: _pageController,
                        pageCount: widget.slides.length,
                        currentIndex: currentIndex,
                        child: widget.child,
                        navigationBarColor: widget.navigationBarColor,
                        navigationBarHeight: widget.navigationBarHeight,
                        navigationBarShape: widget.navigationBarShape,
                        navigationBarWidth: widget.navigationBarWidth,
                        navigationBarPadding: widget.navigationBarPadding,
                        navigationBarMargin: widget.navigationBarMargin,
                        showDivider: widget.showDivider,
                        dividerColor: widget.dividerColor,
                        dividerHeight: widget.dividerHeight,
                        dividerThickness: widget.dividerThickness,
                        dotShape: widget.dotShape,
                        inActiveColor: widget.inActiveColor,
                        activeColor: widget.activeColor,
                        dotHeight: widget.dotHeight,
                        dotWidth: widget.dotWidth,
                        dotMargin: widget.dotMargin,
                        backButton: widget.backButton,
                        forwardButton: widget.forwardButton,
                        doneButton: widget.doneButton,
                        skipButton: widget.skipButton,
                        onDoneTap: widget.onDoneTap,
                        onForwardButtonTap: widget.onForwardButtonTap,
                        onBackButtonTap: widget.onBackButtonTap,
                        onSkipTap: widget.onSkipTap,
                        forwardButtonText: widget.forwardButtonText,
                        backButtonText: widget.backButtonText,
                        doneButtonText: widget.doneButtonText,
                        skipButtonText: widget.skipButtonText,
                        skipButtonTextStyle: widget.skipButtonTextStyle,
                        doneButtonTextStyle: widget.doneButtonTextStyle,
                        backButtonTextStyle: widget.backButtonTextStyle,
                        forwardButtonTextStyle: widget.forwardButtonTextStyle,
                        showButton: widget.showButton,
                        showPagination: widget.showPagination,
                      )
                  : Container(),
            ],
          ),
        ),
      );
}
