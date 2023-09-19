abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottomNevBarState extends NewsStates{}

class NewsGetDataBusinessLoadingState extends NewsStates{}

class NewsGetDataSuccessBusinessState extends NewsStates{}

class NewsGetDataErrorBusinessState extends NewsStates{
  final String error;
  NewsGetDataErrorBusinessState(this.error);
}



class NewsGetDataSportsLoadingState extends NewsStates{}

class NewsGetDataSuccessSportsState extends NewsStates{}

class NewsGetDataErrorSportsState extends NewsStates {
  final String error;

  NewsGetDataErrorSportsState(this.error);

}

class NewsGetDataScienceLoadingState extends NewsStates{}

class NewsGetDataSuccessScienceState extends NewsStates{}

class NewsGetDataErrorScienceState extends NewsStates {
  final String error;

  NewsGetDataErrorScienceState(this.error);

}




abstract class AppStates {}

class AppInitialState extends AppStates{}

class NewsChangeAppModeState extends AppStates {}