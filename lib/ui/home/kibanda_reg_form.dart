

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/constants/constants.dart';
import 'package:kibanda_kb/ui/home/kibanda_otp_page.dart';

import '../../cubits/kibanda/create_kibanda_cubit.dart';
import '../../cubits/obscure_password_cubit.dart';

class KibandaRegForm extends StatelessWidget {
  KibandaRegForm({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kibanda Registration'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    Constants.kwik_logo,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'firstname',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'lastname',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderPhoneField(
                    name: 'telephone',
                    valueTransformer: (val) {
                      return val!.substring(val.length - 9);
                    },
                    priorityListByIsoCode: ['KE'],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    defaultSelectedCountryIsoCode: 'KE',
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'password',
                    controller: passwordController,
                    obscureText: context.watch<ObscurePasswordCubit>().state,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      (val) {
                        if (val!
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        } else {
                          return 'Password must contain at least one special character and a Capital letter';
                        }
                      }
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: CupertinoButton(
                          child: context.watch<ObscurePasswordCubit>().state
                              ? const Icon(CupertinoIcons.lock)
                              : const Icon(CupertinoIcons.lock_open),
                          onPressed: () {
                            context.read<ObscurePasswordCubit>().emit(
                                !context.read<ObscurePasswordCubit>().state);
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'confirmpassword',
                    obscureText: context.watch<ObscurePasswordCubit>().state,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      (val) {
                        if (val!
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        } else {
                          return 'Password must contain at least one special character and a Capital letter';
                        }
                      },
                      FormBuilderValidators.match(passwordController.text,
                          errorText: 'Passwords must match'),
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      suffixIcon: CupertinoButton(
                          child: context.watch<ObscurePasswordCubit>().state
                              ? const Icon(CupertinoIcons.lock)
                              : const Icon(CupertinoIcons.lock_open),
                          onPressed: () {
                            context.read<ObscurePasswordCubit>().emit(
                                !context.read<ObscurePasswordCubit>().state);
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<CreateKibandaCubit, CreateKibandaState>(
                    listener: (context, state) {
                      state.maybeWhen(orElse: () {}, success: () {});
                    },
                    builder: (context, state) {
                      return state.maybeWhen(orElse: () {
                        return CupertinoButton(
                          child: const Text('Register'),
                          color: Palette.orangeColor,
                          onPressed: () async {
                            if (_formKey.currentState!.saveAndValidate()) {
                              await context
                                  .read<CreateKibandaCubit>()
                                  .createKibanda(
                                      data: _formKey.currentState!.value);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => KibandaOtpPage(
                                     
                                      data: _formKey.currentState!.value))));
                            }
                          },
                        );
                      }, loading: () {
                        return const SpinKitCircle(
                          color: Palette.orangeColor,
                        );
                      });
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
