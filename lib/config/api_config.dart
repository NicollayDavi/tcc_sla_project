import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class ApiConfig {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8080'; // Web (Chrome)
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080'; // Emulador Android
    } else if (Platform.isIOS) {
      return 'http://localhost:8080'; 
      // se rodar em iPhone físico, troque para o IP da sua máquina ex: 'http://192.168.0.15:8080'
    } else {
      return 'http://localhost:8080';
    }
  }
}
