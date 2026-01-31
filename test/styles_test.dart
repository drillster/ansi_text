import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('Markup styles', () {
    test('bold', () {
      expect(Styles.markup.bold.activate, '1');
      expect(Styles.markup.bold.reset, '22');
    });

    test('faint', () {
      expect(Styles.markup.faint.activate, '2');
      expect(Styles.markup.faint.reset, '22');
    });

    test('italic', () {
      expect(Styles.markup.italic.activate, '3');
      expect(Styles.markup.italic.reset, '23');
    });

    test('underline', () {
      expect(Styles.markup.underline.activate, '4');
      expect(Styles.markup.underline.reset, '24');
    });

    test('blinking', () {
      expect(Styles.markup.blinking.activate, '5');
      expect(Styles.markup.blinking.reset, '25');
    });

    test('inverted', () {
      expect(Styles.markup.inverted.activate, '7');
      expect(Styles.markup.inverted.reset, '27');
    });

    test('concealed', () {
      expect(Styles.markup.concealed.activate, '8');
      expect(Styles.markup.concealed.reset, '28');
    });

    test('strikethrough', () {
      expect(Styles.markup.strikethrough.activate, '9');
      expect(Styles.markup.strikethrough.reset, '29');
    });
  });

  group('Text colors', () {
    test('basic foreground colors', () {
      expect(Styles.color.text.black.activate, '30');
      expect(Styles.color.text.black.reset, '39');
      expect(Styles.color.text.red.activate, '31');
      expect(Styles.color.text.red.reset, '39');
      expect(Styles.color.text.green.activate, '32');
      expect(Styles.color.text.green.reset, '39');
      expect(Styles.color.text.yellow.activate, '33');
      expect(Styles.color.text.yellow.reset, '39');
      expect(Styles.color.text.blue.activate, '34');
      expect(Styles.color.text.blue.reset, '39');
      expect(Styles.color.text.magenta.activate, '35');
      expect(Styles.color.text.magenta.reset, '39');
      expect(Styles.color.text.cyan.activate, '36');
      expect(Styles.color.text.cyan.reset, '39');
      expect(Styles.color.text.white.activate, '37');
      expect(Styles.color.text.white.reset, '39');
    });

    test('bright foreground colors', () {
      expect(Styles.color.text.bright.black.activate, '90');
      expect(Styles.color.text.bright.black.reset, '39');
      expect(Styles.color.text.bright.red.activate, '91');
      expect(Styles.color.text.bright.red.reset, '39');
      expect(Styles.color.text.bright.green.activate, '92');
      expect(Styles.color.text.bright.green.reset, '39');
      expect(Styles.color.text.bright.yellow.activate, '93');
      expect(Styles.color.text.bright.yellow.reset, '39');
      expect(Styles.color.text.bright.blue.activate, '94');
      expect(Styles.color.text.bright.blue.reset, '39');
      expect(Styles.color.text.bright.magenta.activate, '95');
      expect(Styles.color.text.bright.magenta.reset, '39');
      expect(Styles.color.text.bright.cyan.activate, '96');
      expect(Styles.color.text.bright.cyan.reset, '39');
      expect(Styles.color.text.bright.white.activate, '97');
      expect(Styles.color.text.bright.white.reset, '39');
    });
  });

  group('Background colors', () {
    test('basic background colors', () {
      expect(Styles.color.background.black.activate, '40');
      expect(Styles.color.background.black.reset, '49');
      expect(Styles.color.background.red.activate, '41');
      expect(Styles.color.background.red.reset, '49');
      expect(Styles.color.background.green.activate, '42');
      expect(Styles.color.background.green.reset, '49');
      expect(Styles.color.background.yellow.activate, '43');
      expect(Styles.color.background.yellow.reset, '49');
      expect(Styles.color.background.blue.activate, '44');
      expect(Styles.color.background.blue.reset, '49');
      expect(Styles.color.background.magenta.activate, '45');
      expect(Styles.color.background.magenta.reset, '49');
      expect(Styles.color.background.cyan.activate, '46');
      expect(Styles.color.background.cyan.reset, '49');
      expect(Styles.color.background.white.activate, '47');
      expect(Styles.color.background.white.reset, '49');
    });

    test('bright background colors', () {
      expect(Styles.color.background.bright.black.activate, '100');
      expect(Styles.color.background.bright.black.reset, '49');
      expect(Styles.color.background.bright.red.activate, '101');
      expect(Styles.color.background.bright.red.reset, '49');
      expect(Styles.color.background.bright.green.activate, '102');
      expect(Styles.color.background.bright.green.reset, '49');
      expect(Styles.color.background.bright.yellow.activate, '103');
      expect(Styles.color.background.bright.yellow.reset, '49');
      expect(Styles.color.background.bright.blue.activate, '104');
      expect(Styles.color.background.bright.blue.reset, '49');
      expect(Styles.color.background.bright.magenta.activate, '105');
      expect(Styles.color.background.bright.magenta.reset, '49');
      expect(Styles.color.background.bright.cyan.activate, '106');
      expect(Styles.color.background.bright.cyan.reset, '49');
      expect(Styles.color.background.bright.white.activate, '107');
      expect(Styles.color.background.bright.white.reset, '49');
    });
  });

  group('8-bit RGB colors (256-color palette)', () {
    test('foreground rgb', () {
      expect(Styles.color.text.rgb(1, 2, 3).activate, '38;5;67');
      expect(Styles.color.text.rgb(1, 2, 3).reset, '39');
    });

    test('background rgb', () {
      expect(Styles.color.background.rgb(5, 5, 5).activate, '48;5;231');
      expect(Styles.color.background.rgb(5, 5, 5).reset, '49');
    });

    test('rgb values are clamped to 0–5', () {
      expect(Styles.color.text.rgb(-1, 10, 2).activate, '38;5;48');
      expect(Styles.color.text.rgb(-1, 10, 2).reset, '39');
    });
  });

  group('Grayscale colors', () {
    test('foreground grayscale', () {
      expect(Styles.color.text.gray(0).activate, '38;5;232');
      expect(Styles.color.text.gray(0).reset, '39');
      expect(Styles.color.text.gray(23).activate, '38;5;255');
      expect(Styles.color.text.gray(23).reset, '39');
    });

    test('background grayscale', () {
      expect(Styles.color.background.gray(10).activate, '48;5;242');
      expect(Styles.color.background.gray(10).reset, '49');
    });

    test('grayscale values are clamped to 0–23', () {
      expect(Styles.color.text.gray(-5).activate, '38;5;232');
      expect(Styles.color.text.gray(-5).reset, '39');
      expect(Styles.color.text.gray(100).activate, '38;5;255');
      expect(Styles.color.text.gray(100).reset, '39');
    });
  });

  group('True color (24-bit)', () {
    test('foreground true color', () {
      expect(Styles.color.text.trueColor(255, 128, 64).activate,
          '38;2;255;128;64');
      expect(Styles.color.text.trueColor(255, 128, 64).reset, '39');
    });

    test('background true color', () {
      expect(Styles.color.background.trueColor(1, 2, 3).activate, '48;2;1;2;3');
      expect(Styles.color.background.trueColor(1, 2, 3).reset, '49');
    });

    test('true color values are clamped to 0–255', () {
      expect(
          Styles.color.text.trueColor(-1, 300, 42).activate, '38;2;0;255;42');
      expect(Styles.color.text.trueColor(-1, 300, 42).reset, '39');
    });
  });
}
