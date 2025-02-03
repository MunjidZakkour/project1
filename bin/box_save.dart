import 'package:hive/hive.dart';
import 'task.dart';

class StorageBox {
  final Box _box;

  StorageBox._(this._box);

  static Future<StorageBox> init(String boxName,String boxFolderName) async {
    Hive.init(boxFolderName);
    Hive.registerAdapter(TaskAdapter());
    Box openBox = await Hive.openBox(boxName);
    StorageBox instanceValue = StorageBox._(openBox);
    return instanceValue;
  }

  Future<void> save(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<void> deleteByKey(String key) async {
    await _box.delete(key);
  }

  dynamic getByKey(String key, [dynamic defaultValue]) {
    return _box.get(key, defaultValue: defaultValue);
  }
}
