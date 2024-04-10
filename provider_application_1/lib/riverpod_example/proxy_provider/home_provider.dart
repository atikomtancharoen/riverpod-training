import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

final homeChangeNotifierProvider = ChangeNotifierProvider(
  (ref) {
    return HomeProvider();
  },
); // create new one

class HomeProvider with ChangeNotifier {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  /// activity list state
  List<Activity> _activityList = [];
  List<Activity> get activityList => _activityList;
  set activityList(List<Activity> activityList) {
    _activityList = activityList;
    notifyListeners();
  }

  /// selected activity state
  late Activity _selectedActivity;
  Activity get selectedActivity => _selectedActivity;
  set selectedActivity(Activity selectedActivity) {
    _selectedActivity = selectedActivity;
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
