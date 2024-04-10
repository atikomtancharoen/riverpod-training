import 'package:flutter/foundation.dart';

import '../../activity.dart';

class ActivityDetailProvider with ChangeNotifier {
  ActivityDetailProvider(
    this._activity,
  );

  /// activity state
  Activity? _activity;
  Activity? get activity => _activity;
  set activity(Activity? activity) {
    _activity = activity;
    notifyListeners();
  }
}
