import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dofd_driver_panel/base/custom_loader.dart';
import 'package:dofd_driver_panel/base/show_custom_snackbar.dart';
import 'package:dofd_driver_panel/controllers/auth_controller.dart';
import 'package:dofd_driver_panel/models/signup_body_model.dart';
import 'package:dofd_driver_panel/routes/route_helper.dart';
import 'package:dofd_driver_panel/utils/colors.dart';
import 'package:dofd_driver_panel/utils/dimensions.dart';
import 'package:dofd_driver_panel/widgets/app_text_field.dart';
import 'package:dofd_driver_panel/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      String email = emailController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name!", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number!", title: "Phone");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address!", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address!",
            title: "Not valid");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password!", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar(
            "Your password needs to be longer than 6 characters!",
            title: "Weak password");
      } else {
        showCustomSnackBar("ALL WENT WELL", title: "PERFECT");
        SignUpBody signUpBody = new SignUpBody(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // app logo
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: AppColors.mainBackgroundColor,
                            radius: Dimensions.height20 * 4,
                            backgroundImage:
                                AssetImage("assets/image/logo_pink.jpg"),
                          ),
                        ),
                      ),

                      // email
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      // password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.lock,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      //name
                      AppTextField(
                          textController: nameController,
                          hintText: "Name",
                          icon: Icons.person),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      // phone
                      AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      // Sign up button
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              color: Colors.white,
                              text: "Sign Up",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      RichText(
                          text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                              text: "Have an account already?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20))),

                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      // sign up options
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
