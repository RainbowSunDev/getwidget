//import 'package:flutter/material.dart';
//import 'package:getflutter/getflutter.dart';
//
//class GFProgressBar extends StatefulWidget {
//  @override
//  _GFProgressBarState createState() => _GFProgressBarState();
//}
//
//class _GFProgressBarState extends State<GFProgressBar> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}


import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_progress_type.dart';
import 'package:vector_math/vector_math_64.dart' as math;

enum LinearStrokeCap { butt, round, roundAll , circular}

enum CircularStrokeCap { butt, round, square }

enum ArcType {
  HALF,
  FULL,
}

class GFProgressBar extends StatefulWidget {

///width of the
  final double width;

  ///Height of the line
  final double lineHeight;


  ///First color applied to the complete line
  final Color backgroundColor;

  Color get progressBarColor => _progressBarColor;

  Color _progressBarColor;

  ///true if you want the Line to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget at the left of the Line
  final Widget leading;


  final dynamic fillColor;

  ///widget at the right of the Line
  final Widget trailing;

  ///widget inside the Line
  final Widget child;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, roundAll
  final LinearStrokeCap linearBarType;

  ///alignment of the Row (leading-widget-child-trailing)
  final MainAxisAlignment alignment;

  ///padding to the GFProgressBar
  final EdgeInsets padding;

  /// set true if you want to animate the linear from the last progressPercent value you set
  final bool animateFromLastPercentage;

  /// If present, this will make the progress bar colored by this gradient.
  ///
  /// This will override [progressBarColor]. It is an error to provide both.
  final LinearGradient linearGradient;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set true if you want to animate the linear from the right to left (RTL)
  final bool fromRightToLeft;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter mask;

  /// Set true if you want to display only part of [linearGradient] based on progressPercent value
  /// (ie. create 'VU effect'). If no [linearGradient] is specified this option is ignored.
  final bool clipLinearGradient;

  final GFProgressType type ;

  ///Width of the line of the Circle
  final double circleWidth;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, square
  final CircularStrokeCap circularBarType;

  ///the angle which the circle will start the progress (in degrees, eg: 0.0, 45.0, 90.0)
  final double circleStartAngle;


  /// set the arc type
  final ArcType arcType;

  /// set a circular background color when use the arcType property
  final Color arcBackgroundColor;

  /// set true when you want to display the progress in reverse mode
  final bool reverse;
  final double radius;

  final double percentage;



  GFProgressBar({
    Key key,
    this.percentage = 0.2,
    this.circleWidth = 5.0,
    this.circleStartAngle = 0.0,
    @required this.radius,
    this.backgroundColor = const Color(0xFFB8C7CB),
    Color progressBarColor,
    this.linearGradient,
    this.animation = false,
    this.animationDuration = 500,
    this.child,
    this.addAutomaticKeepAlive = true,
    this.circularBarType,
    this.arcBackgroundColor,
    this.arcType,
    this.animateFromLastPercentage = false,
    this.reverse = false,
    this.mask,
    this.type,
    this.lineHeight = 5.0,
    this.width,
    this.fromRightToLeft = false,
    this.leading,
    this.trailing,
    this.linearBarType,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.alignment = MainAxisAlignment.start,
    this.clipLinearGradient = false,
    this.fillColor,




  }) : super(key: key) {
    if (linearGradient != null && progressBarColor != null) {
      throw ArgumentError(
          'Cannot provide both linearGradient and progressBarColor');
    }
    _progressBarColor = progressBarColor ?? Colors.red;

    assert(circleStartAngle >= 0.0);
    if (percentage < 0.0 || percentage > 1.0) {
      throw Exception("Percent value must be a double between 0.0 and 1.0");
    }

    if (arcType == null && arcBackgroundColor != null) {
      throw ArgumentError('arcType is required when you arcBackgroundColor');
    }
  }

  @override
  _GFProgressBarState createState() => _GFProgressBarState();
}

class _GFProgressBarState extends State<GFProgressBar>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {


  AnimationController _animationController, circular_animation_controller;
  Animation _animation, circular_animation;
  double _progressPercent = 0.0;
  double _percentage = 0.0;

  @override
  void initState() {
    if (widget.animation) {
      _animationController = new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation =
      Tween(begin: 0.0, end: widget.percentage).animate(
          _animationController)
        ..addListener(() {
          setState(() {
            _progressPercent = _animation.value;
          });
        });
      _animationController.forward();
    } else {
      _updateprogressPercent();
    }


    if (widget.animation) {
      circular_animation_controller = new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      circular_animation =
      Tween(begin: 0.0, end: widget.percentage).animate(circular_animation_controller)
        ..addListener(() {
          setState(() {
            _percentage = circular_animation.value;
          });
        });
      circular_animation_controller.forward();
    } else {
      _updateProgress();
    }

  }




_updateProgress() {
  setState(() {
    _percentage = widget.percentage;
  });
}

  _updateprogressPercent() {
    setState(() {
      _progressPercent = widget.percentage;
    });
  }
  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    if (circular_animation_controller != null) {
      circular_animation_controller.dispose();
    }
    super.dispose();
  }


  @override
  void didUpdateWidget(GFProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      if (_animationController != null) {
        _animationController.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
            begin: widget.animateFromLastPercentage ? oldWidget.percentage : 0.0,
            end: widget.percentage)
            .animate(_animationController);
        _animationController.forward(from: 0.0);
      } else {
        _updateprogressPercent();
      }
    }
    if (oldWidget.percentage != widget.percentage ||
        oldWidget.circleStartAngle != widget.circleStartAngle) {
      if (circular_animation_controller != null) {
        circular_animation_controller.duration =
            Duration(milliseconds: widget.animationDuration);
        circular_animation = Tween(
            begin: widget.animateFromLastPercentage ? oldWidget.percentage : 0.0,
            end: widget.percentage)
            .animate(circular_animation_controller);
        circular_animation_controller.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    super.build(context);
    var item = List<Widget>();
    if (widget.leading != null) {
      item.add(widget.leading);
    }
    final hasSetWidth = widget.width != null;
    var containerWidget = Container(
      width: hasSetWidth ? widget.width : double.infinity,
      decoration: BoxDecoration(
          shape: widget.type == GFProgressType.round?BoxShape.circle?? widget.type==GFProgressType.square:BoxShape.rectangle
      ),
      height: widget.lineHeight,
      padding: widget.padding,
      child:  widget.type==GFProgressType.linear?CustomPaint(
        painter: LinearPainter(
          fromRightToLeft: widget.fromRightToLeft,
          progress: _progressPercent,
          child: widget.child,
          progressBarColor: widget.progressBarColor,
          linearGradient: widget.linearGradient,
          backgroundColor: widget.backgroundColor,
          linearBarType: widget.linearBarType,
          circleWidth: widget.lineHeight,
          mask: widget.mask,
          clipLinearGradient: widget.clipLinearGradient,
        ),

        child: (widget.child != null)
            ?  widget.child
            : Container(),
      ):CustomPaint(
        painter: CirclePainter(
            progress: _percentage * 360,
            progressBarColor: widget.progressBarColor,
            backgroundColor: widget.backgroundColor,
            circleStartAngle: widget.circleStartAngle,
            circularBarType: widget.circularBarType,
            radius: (widget.radius / 2) - widget.circleWidth / 2,
            circleWidth: widget.circleWidth,
            arcBackgroundColor: widget.arcBackgroundColor,
            arcType: widget.arcType,
            reverse: widget.reverse,
            linearGradient: widget.linearGradient,
            mask: widget.mask),
        child: (widget.child != null)
            ? Center(child: widget.child)
            : Container(),
      )
    );



    if (hasSetWidth) {
      item.add(containerWidget);
    } else {
      item.add(Expanded(
        child: containerWidget,
      ));
    }
    if (widget.trailing != null) {
      item.add(widget.trailing);
    }

    return widget.type == GFProgressType.linear? Material(
      color: Colors.transparent,
      child: new Container(
          child: Row(
            mainAxisAlignment: widget.alignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: item,
          )),
    ): Material(
      color: widget.fillColor,
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: item,
          )),
    );

  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

class LinearPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintLine = new Paint();
  final circleWidth;
  final progress;
  final child;
  final fromRightToLeft;
  final Color progressBarColor;
  final Color backgroundColor;
  final LinearStrokeCap linearBarType;
  final LinearGradient linearGradient;
  final MaskFilter mask;
  final bool clipLinearGradient;

  LinearPainter({
    this.circleWidth,
    this.progress,
    this.child,
    this.fromRightToLeft,
    this.progressBarColor,
    this.backgroundColor,
    this.linearBarType = LinearStrokeCap.butt,
    this.linearGradient,
    this.mask,
    this.clipLinearGradient,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = circleWidth;

    _paintLine.color = progress.toString() == "0.0"
        ? progressBarColor.withOpacity(0.0)
        : progressBarColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = circleWidth;

    if (linearBarType == LinearStrokeCap.round) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (linearBarType == LinearStrokeCap.butt) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.round;
      _paintBackground.strokeCap = StrokeCap.round;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);

    if (mask != null) {
      _paintLine.maskFilter = mask;
    }

    if (fromRightToLeft) {
      final xProgress = size.width - size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderRightToLeft(size, xProgress);
      }
      canvas.drawLine(end, Offset(xProgress, size.height / 2), _paintLine);
    } else {
      final xProgress = size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderLeftToRight(size, xProgress);
      }
      canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
    }
  }

  Shader _createGradientShaderRightToLeft(Size size, double xProgress) {
    Offset shaderEndPoint =
    clipLinearGradient ? Offset.zero : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset(size.width, size.height),
        shaderEndPoint,
      ),
    );
  }

  Shader _createGradientShaderLeftToRight(Size size, double xProgress) {
    Offset shaderEndPoint = clipLinearGradient
        ? Offset(size.width, size.height)
        : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset.zero,
        shaderEndPoint,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



class CirclePainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final Paint _paintBackgroundStartAngle = Paint();
  final double circleWidth;
  final double progress;
  final double radius;
  final Color progressBarColor;
  final Color backgroundColor;
  final CircularStrokeCap circularBarType;
  final double circleStartAngle;
  final LinearGradient linearGradient;
  final Color arcBackgroundColor;
  final ArcType arcType;
  final bool reverse;
  final MaskFilter mask;

  CirclePainter(
      {this.circleWidth,
        this.progress,
        @required this.radius,
        this.progressBarColor,
        this.backgroundColor,
        this.circleStartAngle = 0.0,
        this.circularBarType = CircularStrokeCap.round,
        this.linearGradient,
        this.reverse,
        this.arcBackgroundColor,
        this.arcType,
        this.mask}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = circleWidth;

    if (arcBackgroundColor != null) {
      _paintBackgroundStartAngle.color = arcBackgroundColor;
      _paintBackgroundStartAngle.style = PaintingStyle.stroke;
      _paintBackgroundStartAngle.strokeWidth = circleWidth;
    }

    _paintLine.color = progressBarColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = circleWidth;
    if (circularBarType == CircularStrokeCap.round) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (circularBarType == CircularStrokeCap.butt) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.square;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final child = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(child, radius, _paintBackground);

    if (mask != null) {
      _paintLine.maskFilter = mask;
    }
    if (linearGradient != null) {
      _paintLine.shader = linearGradient.createShader(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
      );
    }

    double fixedStartAngle = circleStartAngle;

    double circleStartAngleFixedMargin = 1.0;
    if (arcType != null) {
      if (arcType == ArcType.FULL) {
        fixedStartAngle = 220;
        circleStartAngleFixedMargin = 172 / fixedStartAngle;
      } else {
        fixedStartAngle = 270;
        circleStartAngleFixedMargin = 135 / fixedStartAngle;
      }
    }

    if (arcBackgroundColor != null) {
      canvas.drawArc(
        Rect.fromCircle(center: child, radius: radius),
        math.radians(-90.0 + fixedStartAngle),
        math.radians(360 * circleStartAngleFixedMargin),
        false,
        _paintBackgroundStartAngle,
      );
    }

    if (reverse) {
      final start =
      math.radians(360 * circleStartAngleFixedMargin - 90.0 + fixedStartAngle);
      final end = math.radians(-progress * circleStartAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    } else {
      final start = math.radians(-90.0 + fixedStartAngle);
      final end = math.radians(progress * circleStartAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

