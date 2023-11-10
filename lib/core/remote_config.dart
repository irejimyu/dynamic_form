import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<FirebaseRemoteConfig> setupRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ),
  );

  remoteConfig.setDefaults(
    <String, dynamic>{
      "type": "scaffold",
      "args": {
        "appBar": {
          "type": "app_bar",
          "args": {
            "title": {
              "type": "text",
              "args": {"text": "Dynamic Widgets"}
            }
          }
        },
        "body": {
          "type": "circular_progress_indicator",
        }
      }
    },
  );

  return remoteConfig;
}
