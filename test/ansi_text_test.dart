import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('AnsiText', () {
    test('defaults to empty text without reset sequence', () {
      final text = AnsiText();
      expect(text.toString(), isEmpty);
    });

    test('there is no reset sequence if no styles are applied', () {
      final text = AnsiText('hello');
      expect(text.toString(), 'hello');
    });

    test('applies a single style', () {
      final text = AnsiText('hello');
      expect(text.toString(), 'hello');
      final style = Styles.color.text.red;
      text.apply(style);
      expect(text.toString(), '\x1B[31mhello\x1B[39m');
    });

    test('turning off ANSI formatting suppresses escape codes', () {
      final text = AnsiText('hello');
      expect(text.toString(), 'hello');
      final style = Styles.color.text.red;
      text.apply(style);
      expect(text.toString(), '\x1B[31mhello\x1B[39m');
      AnsiText.enabled = false;
      expect(text.toString(), 'hello');
      AnsiText.enabled = true;
      expect(text.toString(), '\x1B[31mhello\x1B[39m');
    });

    test('applying the same style twice has no additional effect', () {
      final text = AnsiText('hello');
      expect(text.toString(), 'hello');
      final style = Styles.color.text.red;
      text
        ..apply(style)
        ..apply(style);
      expect(text.toString(), '\x1B[31mhello\x1B[39m');
    });

    test('applies multiple styles in iteration order', () {
      final text = AnsiText('hello')
        ..applyAll({
          Styles.markup.bold,
          Styles.color.text.red,
        });
      final result = text.toString();
      expect(result, '\x1B[1;31mhello\x1B[22;39m');
    });

    test('applyAll with null does nothing', () {
      final text = AnsiText('hello')..applyAll(null);
      expect(text.toString(), 'hello');
    });

    test('styles are combined (appended, not prepended)', () {
      final text = AnsiText('hello')
        ..apply(Styles.markup.bold)
        ..apply(Styles.markup.italic);
      expect(text.toString(), '\x1B[1;3mhello\x1B[22;23m');
    });

    test('equality is based on rendered output', () {
      final a = AnsiText('hello')..apply(Styles.color.text.red);
      final b = AnsiText('hello')..apply(Styles.color.text.red);

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when rendered output differs', () {
      final a = AnsiText('hello')..apply(Styles.color.text.red);
      final b = AnsiText('hello')..apply(Styles.color.text.blue);

      expect(a == b, isFalse);
    });

    test('different internal state but same output is equal', () {
      final a = AnsiText('hello');
      final b = AnsiText('hello');

      expect(a, equals(b));
    });
  });
}
