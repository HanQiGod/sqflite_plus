import 'package:sqflite_plus_platform_interface/sqflite_plus_platform_interface.dart';

/// sqflite_plus_android plugin
class SqfliteAndroid extends SqflitePlatform {
  /// Main entry point called by the Flutter platform.
  ///
  /// Registers this plugin as the default database factory (if not already set).
  static void registerWith() {
    SqflitePlatform.initWithDatabaseFactoryMethodChannel();
  }
}
