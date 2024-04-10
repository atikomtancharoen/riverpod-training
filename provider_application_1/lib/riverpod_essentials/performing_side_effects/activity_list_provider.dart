import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

final activityAsyncNotifierProvider =
    AsyncNotifierProvider.autoDispose<ActivityAsyncNotifier, List<Activity>>(
        ActivityAsyncNotifier.new);

class ActivityAsyncNotifier extends AutoDisposeAsyncNotifier<List<Activity>> {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  @override
  FutureOr<List<Activity>> build() async {
    final activity = await _activityRepo.getActivity();
    return [activity];
  }

  Future<void> addActivity() async {
    final previousState = await future.onError((error, stackTrace) => []);
    state = const AsyncLoading();
    final activity = await _activityRepo.getActivity();
    state = AsyncData([...previousState, activity]);
  }
}
