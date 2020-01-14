/// [GFSize] is used to change the size of the widget.
enum GFSize {
  /// [GFSize.small] is used for small size widget
  small,

  /// Default size if [GFSize.medium] is used for medium size widget
  medium,

  /// [GFSize.large] is used for large size widget
  large,
}

const double SMALL = 30.0;
const double MEDIUM = 35.0;
const double LARGE = 40.0;
//const double BLOCK = 40.0;

/// Pass [GFSize] or [double]
double getGFSize(dynamic size) {
  if (size is double) {
    return size;
  } else {
    switch (size) {
      case GFSize.small:
        return SMALL;
        break;
      case GFSize.medium:
        return MEDIUM;
        break;
      case GFSize.large:
        return LARGE;
        break;
      default:
        return MEDIUM;
        break;
    }
  }
}
