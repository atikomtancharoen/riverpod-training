import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo.dart';

// We now use AsyncNotifierProvider instead of FutureProvider
final todoListAsyncNotifierProvider =
    AsyncNotifierProvider.autoDispose<TodoList, List<Todo>>(TodoList.new);

// We use an AsyncNotifier because our logic is asynchronous.
// More specifically, we'll need AutoDisposeAsyncNotifier because
// of the "autoDispose" modifier.
class TodoList extends AutoDisposeAsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    return [
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod'),
    ];
  }

  Future<void> addTodo(Todo todo) async {
    // We can then manually update the local cache. For this, we'll need to
    // obtain the previous state.
    // Caution: The previous state may still be loading or in error state.
    // A graceful way of handling this would be to read `this.future` instead
    // of `this.state`, which would enable awaiting the loading state, and
    // throw an error if the state is in error state.
    final previousState = await future;

    // We update the local cache to match the new state.
    // This will notify all listeners.
    state = AsyncData([...previousState, todo]);
  }
}
