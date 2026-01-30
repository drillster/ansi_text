import 'styles.dart';

/// Provides a wrapper around a text string so that ANSI escape codes may be
/// applied to it.
class AnsiText {
  AnsiText([this._text = '']);

  String _text = '';

  /// Applies a style property.
  void apply(Style style) {
    _text = _applyStyle(style, _text);
  }

  /// Applies a collection of style properties.
  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  String _applyStyle(Style style, String text) => '${style.toString()}$text';

  /// Returns the string representation including the requested ANSI escape
  /// codes and a terminating "reset" sequence.
  @override
  String toString() => '$_text${Styles.markup.reset.toString()}';
}
