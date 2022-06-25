import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/Services/auth_services.dart';
import 'package:ropstam_task/Widgets/buttons.dart';

import '../../../Constants/colors.dart';
import '../../../Themes/input_decoration.dart';
import '../../../Widgets/custom_textfield.dart';
import '../../../Widgets/spacers.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailForcusScope = FocusNode();
  final _passwordForcusScope = FocusNode();

  bool _isVisible = false;
  bool _isLoading = false;

  _tryLogin() async {
    //checks whether the form is valid or not
    final isValid = _loginFormKey.currentState!.validate();

    FocusScope.of(context).unfocus();
//if the form is not validated it returns and ask the user about the required  fields.
    if (!isValid) {
      return;
    }
    //if the form is validted it saves the form and data move forward
    _loginFormKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    try {
      //calls the login method in the Authservices class And tries to login
      // the login method returns the data that has been got in the response against our request.
      final userData =
          await Provider.of<AuthServices>(context, listen: false).signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailForcusScope.dispose();
    _passwordForcusScope.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          // this method is defined to make a custom textfield
          buildTextFormField(
            context: context,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,

            // inputdecoration method returns the InputDecoration for the
            //textfield and is managed to have a same decoration for all the
            //TextFields. So you just need to call it and pass it the required
            //params.
            //You can also change the decoration if you need to by passing the
            //params.
            //Its just so that you don't have to repeat the code again and again
            decoration: inputDecoration(
              context: context,
              hint: 'Email',
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              // if (value!.isEmpty) {
              //   return "Please provide an email!";
              // } else if (!value.contains('@')) {
              //   return 'Please enter a valid email address';
              // }
              return null;
            },
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordForcusScope);
            },
          ),
          verticalSpacer(20),
          buildTextFormField(
            context: context,
            controller: _passwordController,
            focusNode: _passwordForcusScope,
            obscureText: !_isVisible,
            decoration: inputDecoration(
              context: context,
              hint: 'Password',
              fillColor: Colors.white,
              filled: true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: Icon(
                  _isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
            validator: (value) {
              // if (value!.isEmpty) {
              //   return "Password must not be empty!";
              // } else if (value.length < 8) {
              //   return "Password must be at least characters";
              // }
              return null;
            },
          ),

          Align(
            alignment: Alignment.centerRight,
            child: customTextButton(
              onPressed: () {},
              text: 'Recovery Password',
            ),
          ),
          verticalSpacer(30),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : buildMaterialButton(
                  context: context,
                  text: 'Login',
                  // calls the method _tryLogin to login
                  onPressed: _tryLogin,
                ),
          verticalSpacer(30),
          const Text(
            'or Continue with',
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          verticalSpacer(30),
          SizedBox(
            width: screenWidth * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // widget to make social login icons to is seperated because to make the widget only once
                _otherSocialIconButton(
                  iconUrl: 'assets/icons/google.png',
                  onPressed: () {},
                ),
                _otherSocialIconButton(
                  iconUrl: 'assets/icons/apple-logo.png',
                  onPressed: () {},
                ),
                _otherSocialIconButton(
                  iconUrl: 'assets/icons/facebook.png',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          verticalSpacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Not a member?',
              ),
              customTextButton(
                onPressed: () {},
                text: 'Register now',
                color: AppColors.kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell _otherSocialIconButton({
    required String? iconUrl,
    required Function? onPressed,
  }) {
    return InkWell(
      onTap: () => onPressed!(),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 50,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.white,
            // width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Image.asset(
          iconUrl!,
        ),
      ),
    );
  }
}
