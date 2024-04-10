import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

typedef EagerActivityParameters = ({String type});

final eagerActivityProvider = AsyncNotifierProvider.autoDispose
    .family<EagerActivityNotifier, Activity, EagerActivityParameters>(
  EagerActivityNotifier.new,
);

class EagerActivityNotifier
    extends AutoDisposeFamilyAsyncNotifier<Activity, EagerActivityParameters> {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  EagerActivityNotifier() {
    debugPrint("EagerActivityNotifier: call init()");
  }

  @override
  Future<Activity> build(EagerActivityParameters arg) async {
    debugPrint("EagerActivityNotifier: call build()");
    return _activityRepo.getActivity();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _activityRepo.getActivity());
  }
}
