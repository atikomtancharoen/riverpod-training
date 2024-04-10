import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

/// A "functional" provider
///
///
final activityProvider = FutureProvider.autoDispose
    // We use the ".family" modifier.
    // The "String" generic type corresponds to the argument type.
    // Our provider now receives an extra argument on top of "ref": the activity type.
    .family<Activity, String>((ref, activityKey) async {
  final activityRepo = ActivityRepositoryImp();
  return await activityRepo.getActivityDetail(activityKey);
});

/// Again, for notifier we use the ".family" modifier, and specify the argument as type "String".
///
///
final activityProvider2 =
    AsyncNotifierProvider.autoDispose.family<ActivityNotifier, Activity, String>(
  ActivityNotifier.new,
);

// When using ".family" with notifiers, we need to change the notifier subclass:
// AsyncNotifier -> FamilyAsyncNotifier
// AutoDisposeAsyncNotifier -> AutoDisposeFamilyAsyncNotifier
class ActivityNotifier extends AutoDisposeFamilyAsyncNotifier<Activity, String> {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  /// Family arguments are passed to the build method and accessible with this.arg
  @override
  Future<Activity> build(String activityKey) async {
    // Arguments are also available with "arg"
    debugPrint(arg);

    return _activityRepo.getActivityDetail(activityKey);
  }
}
