import 'styles.dart';

/// Provides a wrapper around a text string so that ANSI escape codes may be
/// applied to it.
class AnsiText {
  AnsiText([this._text = '']);

  final String _text;
  final _appliedStyles = <Style>[];

  /// Applies a style property.
  void apply(Style style) {
    _appliedStyles.add(style);
  }

  /// Applies a collection of style properties.
  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  /// Returns the string representation including the requested ANSI escape
  /// codes and a terminating "reset" sequence if appropriate.
  @override
  String toString() {
    if (_appliedStyles.isEmpty) {
      return _text;
    } else {
      final buffer = StringBuffer();
      for (final style in _appliedStyles) {
        buffer.write(_escapeCodeFromStyle(style));
      }
      buffer
        ..write(_text)
        ..write(_escapeCodeFromStyle(Styles.markup.reset));
      return buffer.toString();
    }
  }

  String _escapeCodeFromStyle(Style style) => '\u{1B}[${style.code}m';

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is AnsiText && other.toString() == toString();

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => toString().hashCode;
}
