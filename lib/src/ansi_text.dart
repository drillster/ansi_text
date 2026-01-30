import 'styles.dart';

/// Provides a wrapper around a text string so that ANSI control codes may be
/// applied to it.
class AnsiText {
  AnsiText([this._text = '']);

  String _text = '';

  /// Applies a style property.
  void apply(Style style) {
    _text = _applyStyle(style, _text);
  }

  /// Applies a collection of style property.
  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  String _applyStyle(Style style, String text) => '${style.toString()}$text';

  /// Returns the string representation including ANSI control codes and
  /// terminated with a "reset".
  @override
  String toString() => '$_text${Styles.markup.reset.toString()}';
}
