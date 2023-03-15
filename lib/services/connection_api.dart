import 'package:door_remote_control/services/preferences_service.dart';
import 'package:http/http.dart' as http;

class ConnectionApi {
  static Future<void> sendMessage(String data) async {
    PreferencesService service = await PreferencesService.instance;
    String url = 'http://${service.getIpAddress}/control?cmd=$data';

    await http.get(Uri.parse(url));
  }
}
