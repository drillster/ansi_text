import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('AnsiText', () {
    tearDown(() {
      AnsiText.enabled = true;
    });

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

    test('applies a hyperlink, but no styles', () {
      final text = AnsiText('example');
      expect(text.toString(), 'example');
      text.hyperlink(Uri.parse('https://example.com'));
      expect(text.toString(),
          '\x1B]8;;https://example.com\x07example\x1B]8;;\x07');
    });

    test('empty hyperlink does not insert OSC 8 open/close sequence', () {
      final text = AnsiText('example')..hyperlink(Uri());
      expect(text.toString(), 'example');
    });

    test(
        'for combinations of styles and hyperlink, the SGR styles are always applied inside the hyperlink',
        () {
      final text0 = AnsiText('example');
      expect(text0.toString(), 'example');
      text0
        ..bold()
        ..hyperlink(Uri.parse('https://example.com'));
      expect(text0.toString(),
          '\x1B]8;;https://example.com\x07\x1B[1mexample\x1B[22m\x1B]8;;\x07');
      final text1 = AnsiText('example');
      expect(text1.toString(), 'example');
      text1
        ..hyperlink(Uri.parse('https://example.com'))
        ..bold();
      expect(text1.toString(),
          '\x1B]8;;https://example.com\x07\x1B[1mexample\x1B[22m\x1B]8;;\x07');
    });

    test(
        'turning off ANSI formatting suppresses escape codes for both formatting and hyperlinking',
        () {
      addTearDown(() => AnsiText.enabled = true);

      final text = AnsiText('hello');
      expect(text.toString(), 'hello');
      final style = Styles.color.text.red;
      text
        ..apply(style)
        ..hyperlink(Uri(host: 'example.com'));
      expect(text.toString(),
          '\x1B]8;;//example.com\x07\x1B[31mhello\x1B[39m\x1B]8;;\x07');
      AnsiText.enabled = false;
      expect(text.toString(), 'hello');
      AnsiText.enabled = true;
      expect(text.toString(),
          '\x1B]8;;//example.com\x07\x1B[31mhello\x1B[39m\x1B]8;;\x07');
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

    test('applies multiple styles in iteration order using a set', () {
      final text = AnsiText('hello')
        ..applyAll({
          Styles.markup.bold,
          Styles.color.text.red,
        });
      final result = text.toString();
      expect(result, '\x1B[1;31mhello\x1B[22;39m');
    });

    test('applies multiple styles in iteration order using a list', () {
      final text = AnsiText('hello')
        ..applyAll([
          Styles.markup.bold,
          Styles.color.text.red,
        ]);
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

    test('deduplicates reset codes when multiple styles share the same reset',
        () {
      final text = AnsiText('hello')
        ..bold()
        ..faint()
        ..red()
        ..yellow();
      expect(text.toString(), '\x1B[1;2;31;33mhello\x1B[22;39m');
    });

    test('deduplicates background color reset codes', () {
      final text = AnsiText('hello')
        ..bgRed()
        ..bgBlue();
      expect(text.toString(), '\x1B[41;44mhello\x1B[49m');
    });

    test('equality is based on text, styles and hyperlink', () {
      final a = AnsiText('hello')
        ..apply(Styles.color.text.red)
        ..hyperlink(Uri());
      final b = AnsiText('hello')
        ..apply(Styles.color.text.red)
        ..hyperlink(Uri());

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('equality with dynamically generated styles', () {
      final a = AnsiText('hello')..apply(Styles.color.text.rgb(1, 2, 3));
      final b = AnsiText('hello')..apply(Styles.color.text.rgb(1, 2, 3));

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('applying dynamically generated style twice has no additional effect',
        () {
      final text = AnsiText('hello')
        ..apply(Styles.color.text.rgb(1, 2, 3))
        ..apply(Styles.color.text.rgb(1, 2, 3));

      expect(text.toString(), '\x1B[38;5;67mhello\x1B[39m');
    });

    test('inequality when applied styles differ', () {
      final a = AnsiText('hello')..apply(Styles.color.text.red);
      final b = AnsiText('hello')..apply(Styles.color.text.blue);

      expect(a == b, isFalse);
    });

    test('inequality when applied hyperlinks differ', () {
      final a = AnsiText('hello')..hyperlink(Uri(host: 'a'));
      final b = AnsiText('hello')..hyperlink(Uri(host: 'b'));

      expect(a == b, isFalse);
    });

    test('different internal state but same output is equal', () {
      final a = AnsiText('hello');
      final b = AnsiText('hello');

      expect(a, equals(b));
    });

    group('getters', () {
      test('text returns raw unstyled string', () {
        final text = AnsiText('hello world')..bold();
        expect(text.text, 'hello world');
      });

      test('styles returns an unmodifiable list of applied styles', () {
        final text = AnsiText('styled')
          ..bold()
          ..red();
        expect(text.styles, [Styles.markup.bold, Styles.color.text.red]);

        expect(() => text.styles.add(Styles.markup.italic),
            throwsUnsupportedError);
      });

      test('hyperlinkUri returns the attached Uri or null', () {
        final textWithoutLink = AnsiText('no link');
        expect(textWithoutLink.hyperlinkUri, isNull);

        final uri = Uri.parse('https://example.com');
        final textWithLink = AnsiText('link')..hyperlink(uri);
        expect(textWithLink.hyperlinkUri, equals(uri));
      });
    });
  });
}
