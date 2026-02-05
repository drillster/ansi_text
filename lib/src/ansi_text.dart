import 'styles.dart';

/// Provides a wrapper around a text string so that ANSI escape codes may be
/// applied to it.
class AnsiText {
  /// Creates a new AnsiText, optionally containing some text.
  AnsiText([this._text = '']);

  /// Provides a global on/off switch for the use of markup and color. Setting
  /// [enabled] to `false` suppresses the use of any ANSI escape codes.
  static bool enabled = true;

  final String _text;
  final _styles = <Style>[];
  Uri? _hyperlink;

  static const _esc = '\u{1B}';
  static const _bel = '\u{7}';

  /// Applies a style property.
  void apply(Style style) {
    if (!_styles.contains(style)) {
      _styles.add(style);
    }
  }

  /// Applies a collection of style properties.
  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  /// Turns this `AnsiText` object into a clickable hyperlink. The URI is
  /// emitted verbatim as per OSC 8.
  // ignore: use_setters_to_change_properties
  void hyperlink(Uri hyperlink) {
    _hyperlink = hyperlink;
  }

  /// Returns the string representation including the requested ANSI escape
  /// codes and a terminating "reset" sequence if appropriate.
  ///
  /// ANSI escape sequences (including SGR and OSC) are suppressed if the
  /// global `enabled` is set to `false`.
  @override
  String toString() {
    if (!enabled) {
      return _text;
    }

    final uri = _hyperlink?.toString().isNotEmpty == true ? _hyperlink : null;
    if (_styles.isEmpty && uri == null) {
      return _text;
    }

    final buffer = StringBuffer();
    if (uri != null) {
      buffer.write(_osc8Open(uri));
    }
    if (_styles.isNotEmpty) {
      buffer.write(_escapeCodesFromStyles(_styles));
    }
    buffer.write(_text);
    if (_styles.isNotEmpty) {
      buffer.write(_resetCodesFromStyles(_styles));
    }
    if (uri != null) {
      buffer.write(_osc8Close());
    }
    return buffer.toString();
  }

  String _escapeCodesFromStyles(List<Style> styles) =>
      styles.isEmpty ? '' : '$_esc[${styles.map((s) => s.activate).join(';')}m';

  String _resetCodesFromStyles(List<Style> styles) =>
      styles.isEmpty ? '' : '$_esc[${styles.map((s) => s.reset).join(';')}m';

  String _osc8Open(Uri uri) => '$_esc]8;;$uri$_bel';
  String _osc8Close() => '$_esc]8;;$_bel';

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! AnsiText) {
      return false;
    }

    return _text == other._text &&
        _listEquals(_styles, other._styles) &&
        _hyperlink == other._hyperlink;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => Object.hash(_text, Object.hashAll(_styles), _hyperlink);

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
