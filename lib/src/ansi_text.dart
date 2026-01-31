import 'styles.dart';

/// Provides a wrapper around a text string so that ANSI escape codes may be
/// applied to it.
class AnsiText {
  AnsiText([this._text = '']);

  final String _text;
  final _styles = <Style>[];

  /// Applies a style property.
  void apply(Style style) {
    _styles.add(style);
  }

  /// Applies a collection of style properties.
  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  /// Returns the string representation including the requested ANSI escape
  /// codes and a terminating "reset" sequence if appropriate.
  @override
  String toString() {
    if (_styles.isEmpty) {
      return _text;
    } else {
      final buffer = StringBuffer()
        ..write(_escapeCodesFromStyles(_styles))
        ..write(_text)
        ..write(_escapeCodesFromStyles([Styles.markup.reset]));
      return buffer.toString();
    }
  }

  String _escapeCodesFromStyles(List<Style> styles) {
    if (styles.isEmpty) {
      return '';
    }
    return '\u{1B}[${styles.map((s) => s.code).join(';')}m';
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! AnsiText) {
      return false;
    }

    return _text == other._text && _listEquals(_styles, other._styles);
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => Object.hash(_text, Object.hashAll(_styles));

  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
}
