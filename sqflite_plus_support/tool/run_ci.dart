import 'package:dev_build/package.dart';
import 'package:path/path.dart';

Future main() async {
  for (var dir in [
    'sqflite_plus_common',
    'sqflite_plus_common_test',
    'sqflite_plus_common_ffi',
    join('sqflite_plus', 'example'),
    'sqflite_plus',
    'sqflite_plus_darwin',
    'sqflite_plus_android',
    'sqflite_plus_platform_interface',
    join('packages', 'console_test_app'),
    join('packages_flutter', 'sqflite_example_common'),
  ]) {
    await packageRunCi(join('..', dir));
  }

  // These projects perform build in their test and sometimes fails, at least
  // more frequently that the other standard format/analyze/test.
  for (var dir in ['sqflite_plus_support', 'sqflite_plus_test_app']) {
    await packageRunCi(
      join('..', dir),
      options: PackageRunCiOptions(noTest: true),
    );
  }
}
