import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/constants/constants.dart';
import 'package:kibanda_kb/cubits/kibanda/create_kibanda_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';

class KibandaOtpPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const KibandaOtpPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Kibanda OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              Constants.kwik_logo,
              height: 40,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                labelText: 'Enter 4 digit pin sent to your number',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<CreateKibandaCubit, CreateKibandaState>(
              listener: (context, state) {
                state.maybeWhen(orElse: () {}, success: () {});
              },
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return CupertinoButton(
                    child: Text('Register'),
                    color: Palette.orangeColor,
                    onPressed: () async {
                      await context
                          .read<CreateKibandaCubit>()
                          .verifyKibanda(data: {
                        ...data,
                        'signup_otp': otpController.text,
                      });

                      AutoRouter.of(context).push(MainHomeRoute());
                    },
                  );
                }, loading: () {
                  return SpinKitCircle(
                    color: Palette.orangeColor,
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
