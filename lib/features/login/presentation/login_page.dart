import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/constants/app_images.dart';
import 'package:victor_trevisan_login_app/core/constants/app_routes.dart';
import 'package:victor_trevisan_login_app/core/generic/app_scroll_and_expanded.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';
import 'package:victor_trevisan_login_app/features/login/presentation/controller/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController controller = GetIt.instance<LoginPageController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Center(
          child: Container(
            constraints: const BoxConstraints.tightFor(width: 400, height: 800),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: AppScrollAndExpanded(
              showScrollBar: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          AppImages.loginImage,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,                          
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: emailController,
                        enabled: true,
                        cursorColor: AppColors.darkGrey,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: AppColors.darkGrey),
                          prefixIcon:
                              Icon(Icons.email, color: AppColors.darkGrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: AppColors.darkBlue),
                          ),
                          errorStyle: TextStyle(color: AppColors.darkRed),
                        ),
                        validator: controller.validateEmail,
                        onFieldSubmitted: (_) async {
                          if (_formKey.currentState!.validate() &&
                              await controller.login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text)) {
                            NavigationUtils.pushReplacement(
                                AppRoutes.home.path);
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        return TextFormField(
                          controller: passwordController,
                          enabled: true,
                          obscureText: controller.isObscure.value,
                          cursorColor: AppColors.darkGrey,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            hintText: 'Senha',
                            hintStyle:
                                const TextStyle(color: AppColors.darkGrey),
                            prefixIcon: const Icon(Icons.lock,
                                color: AppColors.darkGrey),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: AppColors.darkBlue),
                            ),
                            errorStyle: const TextStyle(
                              color: AppColors.darkRed,
                            ),
                            suffix: InkWell(
                              mouseCursor: WidgetStateMouseCursor.clickable,
                              child: Icon(
                                controller.isObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.darkGrey,
                              ),
                              onTap: () {
                                controller.isObscure.value =
                                    !controller.isObscure.value;
                              },
                            ),
                          ),
                          validator: controller.validatePassword,
                          onFieldSubmitted: (_) async {
                            if (_formKey.currentState!.validate() &&
                                await controller.login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text)) {
                              NavigationUtils.pushReplacement(
                                  AppRoutes.home.path);
                            }
                          },
                        );
                      }),
                      Expanded(child: Container()),
                      Obx(() {
                        return Center(
                          child: InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate() &&
                                  await controller.login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text)) {
                                NavigationUtils.pushReplacement(
                                    AppRoutes.home.path);
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.lightBlue,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.darkBlue,
                                    width: 2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.lightBlue,
                                      blurRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ]),
                              child: Center(
                                child: controller.isLoading.value
                                    ? const CircularProgressIndicator(
                                        color: AppColors.white,
                                      )
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                              ),
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        if (controller.errorMessage.isNotEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _showErrorDialog(controller.errorMessage.value);
                          });
                        }
                        return const SizedBox.shrink();
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(errorMessage),
          backgroundColor: AppColors.white,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.errorMessage.value = '';
              },
              child:
                  const Text('OK', style: TextStyle(color: AppColors.darkBlue)),
            ),
          ],
        );
      },
    );
  }
}
