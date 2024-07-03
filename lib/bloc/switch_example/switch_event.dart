import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();
  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotifications extends SwitchEvents {}

class EnableNotifications extends SwitchEvents {}

class DisableNotifications extends SwitchEvents {}

class SliderEvent extends SwitchEvents {
  double slider;
  SliderEvent({
    required this.slider,
  });

  @override
  List<Object> get props => [slider];
}
