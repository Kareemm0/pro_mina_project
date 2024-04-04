import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.dio) : super(HomeInitialState());

  final Dio dio;

  XFile? image;
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    image = pickedFile != null ? XFile(pickedFile.path) : null;
  }

  getGellary() async {
    emit(GetImagesLoadingState());
    try {
      final response =
          await dio.get("https://flutter.prominaagency.com/api/my-gallery",
              options: Options(headers: {
                'Authorization':
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNmU2YTUzNjdmZTI3YmVhNWZiYzMyNmQ2MTFkM2E0YzBjYjlhOWExMGNkMTRlOGU5OWQ3ZWI0MGU5MmZmZTZmZGQxNmRlMjg5ZmY4M2ViM2IiLCJpYXQiOjE3MTIyNTMwNTEuMTE1NDUxLCJuYmYiOjE3MTIyNTMwNTEuMTE1NDUyLCJleHAiOjE3NDM3ODkwNTEuMTEzNzE2LCJzdWIiOiIyMDAiLCJzY29wZXMiOltdfQ.FpBSn0_CXe1VZ5O5qiKXhPY48H1-P_k6zYhtGKSiH8-lvj1SWU_qy8U2Mi_ixILwkWFLvzrSok1gDKRFZasMV90AtLEl2sGf-3ovdKY7Sl3_3Bi1meSK6_HvSogeHVzdXHNCnfdLPvmg2lZ71fDFFDKcOwHAC39c8OLFkTxq76S4TEQ6uUJs9R4rGNqOA1U9CLyliguSzfRci1A5M4EtHb_Fom6BgRGhKzTFpdYObqqEJ4wjDBZDoH9La2dSdzIj3c7zIlaxQYqvDyBeO57vjUtkfHUVWRTULD3ecbTik1itP4alD10sLQriRADhmQtbMHnVO570xfiG0hVSMEQwPmohnJ9kj0EX5mgOWRtdSTlEWKXqtzLqOzbDIWhMR-p9bChVA7waQQ7Dfkg_MgiUn31dSTFbq4im9Zp6FAsUFwDthZXkhPOvFx-LmBPJTpz97Z0Tz3SYHI-xoK-C8kmEy7gzyFjNnd2h4Jz1O70WtTiiXii9Kn7MPzmHPxbqurAbjRYDiVIsEV71H0jLdnfNnKVDatUYTvwzPtoe4smx7RR0OEI2q97SCF3gg4yusejtzqxOu8k7EQqH2P30CrV_NA0lPD1nfSU7_F-xMuFPjpTbbthMUo-16jI0wG-zRw5wBC1K719WIkrwHZ33nR7GTmJNzTgkgKcaJ6Lm7qA6tWA"
              }));

      if (response.statusMessage == 'success') {
        emit(GetImageSuccessStateState());
        print("================Success=======");
      }
    } catch (error) {
      emit(GetImagesFailureState(errorMessage: error.toString()));
      print("=========================Failure==========$error");
    }
  }
}
