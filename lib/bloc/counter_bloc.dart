import 'package:flutter_bloc/flutter_bloc.dart';

class CounterEvent {
  final int? value;
  CounterEvent({this.value});
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      emit(state + (event.value ?? 1));
    });
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("perubahan $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print("error $error");
    super.onError(error, stackTrace);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print("transition $transition");
    super.onTransition(transition);
  }
}
