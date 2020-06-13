part of 'theme_bloc.dart';



abstract class ThemeEvent extends Equatable {
  const ThemeEvent([List props = const <dynamic>[]]);
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    @required this.theme,
  }) : super([theme]);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
