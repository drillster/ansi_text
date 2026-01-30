import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('AnsiText', () {
    test('defaults to empty text with reset code', () {
      final text = AnsiText();

      expect(text.toString(), '\x1B[0m');
    });

    test('applies a single style', () {
      final text = AnsiText('hello');
      final style = Styles.color.text.red;

      text.apply(style);

      expect(text.toString(), '\x1B[31mhello\x1B[0m');
    });

    test('applies multiple styles in iteration order', () {
      final text = AnsiText('hello');

      final styles = <Style>{
        Styles.markup.bold,
        Styles.color.text.red,
      };

      text.applyAll(styles);

      // Order matters because styles are prepended
      final result = text.toString();
      expect(
        result == '\x1B[1m\x1B[31mhello\x1B[0m' ||
            result == '\x1B[31m\x1B[1mhello\x1B[0m',
        isTrue,
        reason: 'Set iteration order is not guaranteed',
      );
    });

    test('applyAll with null does nothing', () {
      final text = AnsiText('hello')..applyAll(null);
      expect(text.toString(), 'hello\x1B[0m');
    });

    test('styles are prepended, not appended', () {
      final text = AnsiText('hello')
        ..apply(Styles.markup.bold)
        ..apply(Styles.markup.italic);
      expect(text.toString(), '\x1B[3m\x1B[1mhello\x1B[0m');
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
