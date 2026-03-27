import 'dart:io';

import 'package:path/path.dart';
import 'package:process_run/shell_run.dart';

var appExp1Path = join('.dart_tool', 'sqflite_test', 'exp1');
var appExp2Path = join('.dart_tool', 'sqflite_test', 'exp2');

Future<void> main() async {
  await createAndBuildIos(appPath: appExp1Path, lang: 'objc');
  await createAndBuildIos(appPath: appExp2Path, lang: 'swift');
}

Future<void> createAndBuildIos({
  required String appPath,
  required String lang,
}) async {
  var shell = Shell();

  try {
    await Directory(appPath).delete(recursive: true);
  } catch (_) {}
  await shell.run(
    'flutter create --template app --platforms ios --ios-language $lang ${shellArgument(appPath)}',
  );

  shell = shell.cd(appPath);
  await fixProject(appPath);
  await shell.run('flutter build ios --debug --no-codesign');
}

Future<void> fixProject(String appPath) async {
  var shell = Shell().cd(appPath);
  await shell.run(
    'flutter pub add sqflite_plus_example --path ../../../../sqflite_plus/example',
  );
  await addDepOverrides(appPath);
}

Future<void> addDepOverrides(String appPath) async {
  var overrides = '''
dependency_overrides:
  sqflite_plus:
    path: ../../../../sqflite_plus
  sqflite_plus_darwin:
    path: ../../../../sqflite_plus_darwin
  sqflite_plus_android:
    path: ../../../../sqflite_plus_android
  sqflite_plus_platform_interface:
    path: ../../../../sqflite_plus_platform_interface
  sqflite_plus_common:
    path: ../../../../sqflite_plus_common
''';

  var pubspecFile = File(join(appPath, 'pubspec.yaml'));
  var content = await pubspecFile.readAsString();
  content = '$content\n$overrides';
  await pubspecFile.writeAsString(content);
}
