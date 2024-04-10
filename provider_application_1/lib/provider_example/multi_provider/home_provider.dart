import 'package:flutter/foundation.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

class HomeProvider with ChangeNotifier {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  /// activity list state
  List<Activity> _activityList = [];
  List<Activity> get activityList => _activityList;
  set activityList(List<Activity> activityList) {
    _activityList = activityList;
    notifyListeners();
  }

  /// loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void addActivity() async {
    isLoading = true;
    activityList = [
      ..._activityList,
      await _activityRepo.getActivity(),
    ];
    isLoading = false;
  }
}
