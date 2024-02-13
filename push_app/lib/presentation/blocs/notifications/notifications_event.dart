part of 'notifications_bloc.dart';

sealed class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}


class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  const NotificationStatusChanged(this.status);
}

class NotificationRecived extends NotificationsEvent{
  final PushMessage pushMessage;
  const NotificationRecived(this.pushMessage);
}
