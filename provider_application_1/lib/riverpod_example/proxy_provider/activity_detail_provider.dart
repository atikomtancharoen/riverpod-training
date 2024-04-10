import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import 'home_provider.dart';

final activityDetailChangeNotifierProvider = ChangeNotifierProvider(
  (ref) {
    final homeProvider = ref.watch(homeChangeNotifierProvider);
    return ActivityDetailProvider(homeProvider.selectedActivity);
  },
);

// final activityDetailChangeNotifierProvider = ChangeNotifierProvider(
//   (ref) {
//     final homeProvider = ref.read(homeChangeNotifierProvider);
//     final userNotifier = ActivityDetailProvider(homeProvider.selectedActivity);

//     ref.listen(homeChangeNotifierProvider, (previous, next) {
//       if (previous?.selectedActivity != next.selectedActivity) {
//         userNotifier.activity = next.selectedActivity;
//       }
//     });

//     return userNotifier;
//   },
// );

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
