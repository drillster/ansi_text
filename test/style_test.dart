import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('Style', () {
    test('markup', () {
      final style = Styles.markup.bold;
      expect(style.code, '1');
      expect(style.toString(), '\x1B[1m');
    });

    test('text color', () {
      final style = Styles.color.text.black;
      expect(style.code, '30');
    });

    test('background color', () {
      final style = Styles.color.background.red;
      expect(style.code, '41');
    });
  });
}
