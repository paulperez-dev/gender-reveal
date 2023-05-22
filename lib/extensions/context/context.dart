import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as widget;

/// `Navigator.of(context)` as `context.navigator`
extension XContextNavigator on BuildContext {
  /// Returns the navigator state from the closest [Navigator] ancestor.
  ///
  /// `context.navigator` is equivalent to [widgets.Navigator.of].
  NavigatorState get navigator {
    return Navigator.of(this);
  }
}

/// `precacheImage(..., context, ...)` as `context.precacheImage(...)`
extension XContextPrecacheImage on BuildContext {
  /// Prefetches an image into the image cache.
  ///
  /// Equivalent to [precacheImage].
  Future<void> precacheImage(
    ImageProvider provider, {
    Size? size,
    ImageErrorListener? onError,
  }) {
    return widget.precacheImage(
      provider,
      this,
      size: size,
      onError: onError,
    );
  }
}

/// `Theme.of(context)` as `context.theme`
extension XContextTheme on BuildContext {
  /// Returns the [ThemeData] from the closest context ancestor.
  ///
  /// `context.theme` is equivalent to [Theme.of].
  ThemeData get theme {
    return Theme.of(this);
  }
}

/// `Theme.of(context).textTheme` as `context.textTheme`
extension XContextTextStyle on BuildContext {
  /// Returns the [TextTheme] from the closest Theme ancestor.
  ///
  /// `context.textTheme` is equivalent to `Theme.of(context).textTheme`.
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

/// `Intended to use in the after calling Compare() to know if the two
/// objects are equal`
extension XInt on int {
  /// Returns `true` if both objects are equal.
  bool get isZero {
    return this == 0;
  }
}
