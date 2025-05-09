import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';


class CacheManager {
  static late CacheOptions cacheOptions;

  static Future<void> init() async {
    final dir = await getTemporaryDirectory();
    cacheOptions = CacheOptions(
      store: HiveCacheStore(dir.path),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
    );
  }

  static DioCacheInterceptor get cacheInterceptor => DioCacheInterceptor(options: cacheOptions);
}
