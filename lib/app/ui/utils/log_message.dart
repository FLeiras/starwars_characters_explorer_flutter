import 'package:flutter/foundation.dart';

void logMessage(message) {
  if (kDebugMode) {
    print(message);
  }
}
