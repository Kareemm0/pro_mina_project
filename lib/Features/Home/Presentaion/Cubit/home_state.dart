abstract class HomeState {}

class HomeInitialState extends HomeState {}

class UploadPictureState extends HomeState {}

class GetImagesLoadingState extends HomeState {}

class GetImageSuccessStateState extends HomeState {}

class GetImagesFailureState extends HomeState {
  final String errorMessage;

  GetImagesFailureState({required this.errorMessage});
}
