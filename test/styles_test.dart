import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('Markup styles', () {
    test('reset', () {
      expect(Styles.markup.reset.code, '0');
    });

    test('bold', () {
      expect(Styles.markup.bold.code, '1');
    });

    test('underline', () {
      expect(Styles.markup.underline.code, '4');
    });

    test('strikethrough', () {
      expect(Styles.markup.strikethrough.code, '9');
    });
  });

  group('Text colors', () {
    test('basic foreground colors', () {
      expect(Styles.color.text.black.code, '30');
      expect(Styles.color.text.red.code, '31');
      expect(Styles.color.text.green.code, '32');
      expect(Styles.color.text.yellow.code, '33');
      expect(Styles.color.text.blue.code, '34');
      expect(Styles.color.text.magenta.code, '35');
      expect(Styles.color.text.cyan.code, '36');
      expect(Styles.color.text.white.code, '37');
    });

    test('normal foreground color', () {
      expect(Styles.color.text.normal.code, '39');
    });

    test('bright foreground colors', () {
      expect(Styles.color.text.bright.black.code, '90');
      expect(Styles.color.text.bright.red.code, '91');
      expect(Styles.color.text.bright.green.code, '92');
      expect(Styles.color.text.bright.yellow.code, '93');
      expect(Styles.color.text.bright.blue.code, '94');
      expect(Styles.color.text.bright.magenta.code, '95');
      expect(Styles.color.text.bright.cyan.code, '96');
      expect(Styles.color.text.bright.white.code, '97');
    });
  });

  group('Background colors', () {
    test('basic background colors', () {
      expect(Styles.color.background.black.code, '40');
      expect(Styles.color.background.red.code, '41');
      expect(Styles.color.background.green.code, '42');
      expect(Styles.color.background.yellow.code, '43');
      expect(Styles.color.background.blue.code, '44');
      expect(Styles.color.background.magenta.code, '45');
      expect(Styles.color.background.cyan.code, '46');
      expect(Styles.color.background.white.code, '47');
    });

    test('normal background color', () {
      expect(Styles.color.background.normal.code, '49');
    });

    test('bright background colors', () {
      expect(Styles.color.background.bright.black.code, '100');
      expect(Styles.color.background.bright.red.code, '101');
      expect(Styles.color.background.bright.green.code, '102');
      expect(Styles.color.background.bright.yellow.code, '103');
      expect(Styles.color.background.bright.blue.code, '104');
      expect(Styles.color.background.bright.magenta.code, '105');
      expect(Styles.color.background.bright.cyan.code, '106');
      expect(Styles.color.background.bright.white.code, '107');
    });
  });

  group('8-bit RGB colors (256-color palette)', () {
    test('foreground rgb', () {
      expect(Styles.color.text.rgb(1, 2, 3).code, '38;5;67');
    });

    test('background rgb', () {
      expect(Styles.color.background.rgb(5, 5, 5).code, '48;5;231');
    });

    test('rgb values are clamped to 0–5', () {
      expect(Styles.color.text.rgb(-1, 10, 2).code, '38;5;48');
    });
  });

  group('Grayscale colors', () {
    test('foreground grayscale', () {
      expect(Styles.color.text.gray(0).code, '38;5;232');
      expect(Styles.color.text.gray(23).code, '38;5;255');
    });

    test('background grayscale', () {
      expect(Styles.color.background.gray(10).code, '48;5;242');
    });

    test('grayscale values are clamped to 0–23', () {
      expect(Styles.color.text.gray(-5).code, '38;5;232');
      expect(Styles.color.text.gray(100).code, '38;5;255');
    });
  });

  group('True color (24-bit)', () {
    test('foreground true color', () {
      expect(
        Styles.color.text.trueColor(255, 128, 64).code,
        '38;2;255;128;64',
      );
    });

    test('background true color', () {
      expect(
        Styles.color.background.trueColor(1, 2, 3).code,
        '48;2;1;2;3',
      );
    });

    test('true color values are clamped to 0–255', () {
      expect(
        Styles.color.text.trueColor(-1, 300, 42).code,
        '38;2;0;255;42',
      );
    });
  });
}
