import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dofd_driver_panel/base/custom_loader.dart';
import 'package:dofd_driver_panel/base/show_custom_snackbar.dart';
import 'package:dofd_driver_panel/controllers/auth_controller.dart';
import 'package:dofd_driver_panel/pages/auth/sign_up_page.dart';
import 'package:dofd_driver_panel/routes/route_helper.dart';
import 'package:dofd_driver_panel/utils/colors.dart';
import 'package:dofd_driver_panel/utils/dimensions.dart';
import 'package:dofd_driver_panel/widgets/app_text_field.dart';
import 'package:dofd_driver_panel/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String password = passwordController.text.trim();
      String email = emailController.text.trim();

      if (email.isEmpty) {
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
        authController.login(email, password).then((status) {
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
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
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

                      //welcome
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        child: Column(
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  fontSize: Dimensions.font20 * 3 +
                                      Dimensions.font20 / 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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

                      RichText(
                          text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20))),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),

                      // Sign up button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
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
                              text: "Sign In",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),

                      // sign up options
                      RichText(
                          text: TextSpan(
                              text: "Don\'t have an account? ",
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: Colors.grey[500]),
                              children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage()),
                              text: "Sign up",
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                            )
                          ])),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
