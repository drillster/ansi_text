import 'styles.dart';

/// Provides a wrapper around a text string so that ANSI escape codes may be
/// applied to it.
class AnsiText {
  AnsiText([this._text = '']);

  String _text = '';
  bool styleApplied = false;

  /// Applies a style property.
  void apply(Style style) {
    _text = _applyStyle(style, _text);
  }

  /// Applies a collection of style properties.
  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  String _applyStyle(Style style, String text) {
    styleApplied = true;
    return '${style.toString()}$text';
  }

  /// Returns the string representation including the requested ANSI escape
  /// codes and a terminating "reset" sequence if appropriate.
  @override
  String toString() {
    if (styleApplied) {
      return '$_text${Styles.markup.reset.toString()}';
    } else {
      return _text;
    }
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is AnsiText && other.toString() == toString();

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => toString().hashCode;
}
