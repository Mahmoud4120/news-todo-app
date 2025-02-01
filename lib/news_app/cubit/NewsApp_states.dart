abstract class NewsAppStates{}
class NewsAppInitialStates extends NewsAppStates{}
class NewsAppBottomSheetStates extends NewsAppStates{}
class NewsGetBusinessLoadingStates extends NewsAppStates{}
class NewsGetBusinessSuccessStates extends NewsAppStates{}
class NewsGetBusinessErrorStates extends NewsAppStates{
  NewsGetBusinessErrorStates(String string);
}
class NewsGetSportsLoadingStates extends NewsAppStates{}
class NewsGetSportsSuccessStates extends NewsAppStates{}
class NewsGetSportsErrorStates extends NewsAppStates{
  NewsGetSportsErrorStates(String string);
}
class NewsGetScienceLoadingStates extends NewsAppStates{}
class NewsGetScienceSuccessStates extends NewsAppStates{}
class NewsGetScienceErrorStates extends NewsAppStates{
  NewsGetScienceErrorStates(String string);
}
class NewsChangeAppThemeStates extends NewsAppStates{}
class NewsGetSearchLoadingStates extends NewsAppStates{}
class NewsGetSearchSuccessStates extends NewsAppStates{}
class NewsGetSearchErrorStates extends NewsAppStates{
  NewsGetSearchErrorStates(String string);
}