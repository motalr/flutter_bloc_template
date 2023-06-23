part of 'app_base_cubit.dart';

abstract class AppBaseState extends Equatable {
  final ThemeMode? themeMode;

  const AppBaseState({
    this.themeMode,
  });

  @override
  List<Object> get props => [];
}

class AppBaseInitial extends AppBaseState {
  const AppBaseInitial({
    super.themeMode,
  });
  @override
  List<Object> get props => [];
}

class AppBaseLoadingState extends AppBaseState {
  const AppBaseLoadingState({
    super.themeMode,
  });
  @override
  List<Object> get props => [];
}

class AppBaseLoadedState extends AppBaseState {
  const AppBaseLoadedState({
    super.themeMode,
  });
  @override
  List<Object> get props => [themeMode ?? ThemeMode.system];
}

class AppBaseErrorState extends AppBaseState {
  const AppBaseErrorState({
    required super.themeMode,
  });
  @override
  List<Object> get props => [];
}
