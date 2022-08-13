import 'package:dofd_driver_panel/data/repository/user_repo.dart';
import 'package:dofd_driver_panel/models/response_model.dart';
import 'package:dofd_driver_panel/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;
  UserModel? _userModel;

  bool get isLoading => _isLoading;

  UserModel? get userModel =>
      _userModel; // frontend can access the user model object like tihs

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body); //from json to object
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}
