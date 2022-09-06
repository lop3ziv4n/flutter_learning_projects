part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  final NavigationItem item;

  const NavigationState(this.item);
}

class NavigationInitialState extends NavigationState {
  const NavigationInitialState() : super(NavigationItem.homePage);
}

class NavigationSetState extends NavigationState {
  final NavigationItem newItem;

  const NavigationSetState(this.newItem) : super(newItem);
}

enum NavigationItem { homePage, mapPage, walletPage }
