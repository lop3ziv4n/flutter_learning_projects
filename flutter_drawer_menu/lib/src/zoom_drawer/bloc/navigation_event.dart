part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class NavigationItemEvent extends NavigationEvent {
  final NavigationItem item;

  NavigationItemEvent(this.item);
}
