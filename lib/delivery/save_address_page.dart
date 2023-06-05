import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/address/address/address_cubit.dart';
import 'package:kibanda_kb/cubits/address/address/address_type_index_cubit.dart';
import 'package:kibanda_kb/cubits/address/save_address_cubit/save_address_cubit.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';
import 'package:location_geocoder/geocoder.dart' as g;

class SaveAddressPage extends StatelessWidget {
  final g.Address address;
  const SaveAddressPage({
    Key? key,
    required this.address,
  }) : super(key: key);
  static var _formKey = GlobalKey<FormBuilderState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Container(
            height: 40,
            decoration: const BoxDecoration(
                color: Palette.greyColor,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Center(
              child: Text(
                address.featureName!,
                style: const TextStyle(color: Palette.placeholderGrey, fontSize: 16),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              top: 0,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LocationTypeWidget(
                          index: 0,
                          label: 'Work',
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        const LocationTypeWidget(
                          index: 1,
                          label: 'Home',
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        const LocationTypeWidget(index: 2, label: 'Other')
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    FormBuilderTextField(
                        name: 'name',
                        onTap: () {},
                        onSubmitted: (val) {},
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          fillColor: Palette.greyColor,
                          contentPadding: EdgeInsets.symmetric(vertical: 3),
                          hintText: 'Work/ office name',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Palette.greyColor)),
                          hintStyle: TextStyle(color: Palette.placeholderGrey),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                        name: 'address_street',
                        onTap: () {},
                        onSubmitted: (val) {},
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          fillColor: Palette.greyColor,
                          contentPadding: EdgeInsets.symmetric(vertical: 3),
                          hintText: 'Street/ city',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Palette.greyColor)),
                          hintStyle: TextStyle(color: Palette.placeholderGrey),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                        name: 'flat_number',
                        onTap: () {},
                        onSubmitted: (val) {},
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          fillColor: Palette.greyColor,
                          contentPadding: EdgeInsets.symmetric(vertical: 3),
                          hintText: 'Flat Number',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Palette.greyColor)),
                          hintStyle: TextStyle(color: Palette.placeholderGrey),
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: BlocConsumer<SaveAddressCubit, SaveAddressState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        success: () {
                          AppToast.showToast(
                              message: 'Success', isError: false);
                          context.read<AddressCubit>().getAddresses();
                          AutoRouter.of(context)
                              .popUntilRouteWithName('MainHomeRoute');
                        },
                        failed: (e) {
                          AppToast.showToast(message: e, isError: true);
                        });
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                        loading: () =>
                            const SpinKitSpinningLines(color: Palette.greenColor),
                        orElse: () {
                          return CupertinoButton(
                            onPressed: () {
                              if (_formKey.currentState!.saveAndValidate()) {
                                var data = {
                                  ..._formKey.currentState!.value,
                                  'landmark': address.featureName,
                                  'zipcode': '00100',
                                  'latitude':
                                      address.coordinates.latitude.toString(),
                                  'longitude':
                                      address.coordinates.longitude.toString(),
                                  'name_title': address.locality.toString(),
                                  'address_type': context
                                              .read<AddressTypeIndexCubit>()
                                              .state ==
                                          0
                                      ? 'work'
                                      : context
                                                  .read<AddressTypeIndexCubit>()
                                                  .state ==
                                              0
                                          ? 'home'
                                          : 'other'
                                };
                                context
                                    .read<SaveAddressCubit>()
                                    .saveAddress(data: data);
                              }
                            },
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 46,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Palette.orangeColor,
                                        border: Border.all(
                                            color: Palette.orangeColor)),
                                    child: const Center(
                                      child: Text(
                                        'Save address',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ))
          ],
        ));
  }
}

class LocationTypeWidget extends StatelessWidget {
  final int index;
  final String label;
  const LocationTypeWidget({Key? key, required this.index, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        context.read<AddressTypeIndexCubit>().change(index);
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: context.watch<AddressTypeIndexCubit>().state == index
                  ? Colors.white
                  : Palette.greyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: context.watch<AddressTypeIndexCubit>().state == index
                      ? Palette.greenColor
                      : Palette.greyColor,
                  width: 2)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: Text(
              label,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ))),
    );
  }
}
