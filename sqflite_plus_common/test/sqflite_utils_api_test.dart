import 'package:sqflite_plus_common/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('sqflite/utils', () {
    // Check that public api are exported
    test('exported', () {
      for (var value in <dynamic>[
        sqflitePragmaPrefix,
        sqflitePragmaDbDefensiveOff,
      ]) {
        expect(value, isNotNull);
      }
    });
  });
}
