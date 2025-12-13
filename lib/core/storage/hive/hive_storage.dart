import 'package:hive/hive.dart';

class HiveStorage<T> {
  final String boxName;

  HiveStorage({required this.boxName});

  /// Simpan object ke Hive
  Future<void> saveItem(String key, T item) async {
    var box = await Hive.openBox<T>(boxName);
    await box.put(key, item);
  }

  /// Ambil object dari Hive
  Future<T?> getItem(String key) async {
    var box = await Hive.openBox<T>(boxName);
    return box.get(key);
  }

  /// Hapus object dari Hive
  Future<void> deleteItem(String key) async {
    var box = await Hive.openBox<T>(boxName);
    await box.delete(key);
  }

  /// Cek apakah key ada
  Future<bool> containsKey(String key) async {
    var box = await Hive.openBox<T>(boxName);
    return box.containsKey(key);
  }

  /// Hapus seluruh box
  Future<void> clearAll() async {
    var box = await Hive.openBox<T>(boxName);
    await box.clear();
  }
}
