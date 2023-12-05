import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_remote_config_app/main.dart';

class FireaseRemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  FireaseRemoteConfigService() : _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
          fetchTimeout: const Duration(milliseconds: 0),
          minimumFetchInterval: Duration.zero),
    ).catchError((error) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');

    });
    await _remoteConfig.fetchAndActivate();
  }

  String get welcome => _remoteConfig.getString('welcome_message');

  // app_version data
  String get appVersion => _remoteConfig.getString('app_version');
}
