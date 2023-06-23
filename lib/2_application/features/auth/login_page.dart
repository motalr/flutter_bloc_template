import 'package:booktaxi/1_domain/entities/core/page_config.dart';
import 'package:booktaxi/2_application/features/auth/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/dependency_container.dart';
import '../../../core/theme/theme_config.dart';
import '../../base/bloc/app_base_cubit.dart';
import '../../widgets/social_auth_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/loading_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => sl<LoginCubit>(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const pageConfig = PageConfig(
    name: 'login',
    child: LoginPage(),
  );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          LoadingOverlay.instance.show(context);
        } else {
          LoadingOverlay.instance.hide();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN PAGE',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: usernameController,
                        context: context,
                        prefixIcon: const Icon(Icons.shield_outlined),
                        hintText: AppLocalizations.of(context)!.label_Username,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter a valid username.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        isObscured: true,
                        context: context,
                        prefixIcon: const Icon(Icons.lock_person_outlined),
                        hintText: AppLocalizations.of(context)!.label_Password,
                        controller: passwordController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'password is empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final isValid =
                              _formKey.currentState?.validate() ?? false;

                          if (isValid) {
                            context
                                .read<LoginCubit>()
                                .login('hello', 'password', true);
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
                SocialAuthButton(
                  text: AppLocalizations.of(context)!
                      .label_Continue_with_Facebook,
                  colorTheme: ThemeConfig.primaryColor,
                  onPressed: () {},
                  iconLogo: const Icon(
                    Icons.facebook_rounded,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SocialAuthButton(
                  text:
                      AppLocalizations.of(context)!.label_Continue_with_Google,
                  colorTheme: ThemeConfig.googleRedColor,
                  onPressed: () {},
                  imageLogo: Image.asset(
                    'lib/core/assets/images/btn_google.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                BlocBuilder<AppBaseCubit, AppBaseState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        print('switch theme: $value');
                        context.read<AppBaseCubit>().themeChanged(value);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
