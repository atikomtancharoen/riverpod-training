import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

final activityDetailChangeNotifierProvider =
    ChangeNotifierProvider((ref) => ActivityDetailProvider()); // create new one

class ActivityDetailProvider with ChangeNotifier {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  /// activity state
  Activity? _activity;
  Activity? get activity => _activity;
  set activity(Activity? activity) {
    _activity = activity;
    notifyListeners();
  }

  /// loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void getActivityDetail(String activityKey) async {
    // before load
    activity = null;
    isLoading = true;

    // call api
    activity = await _activityRepo.getActivityDetail(activityKey);
    isLoading = false;
  }
}
