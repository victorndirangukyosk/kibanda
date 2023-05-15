// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/routes/router.gr.dart';

import '../cubits/customer_address/user_location_cubit.dart';
import 'geolocator_service.dart';

class ChooseLocationPage extends StatelessWidget {
  const ChooseLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                zoom: 14,
                target: LatLng(
                    context.read<UserLocationCubit>().state.latitude!,
                    context.read<UserLocationCubit>().state.longitude!)),
            zoomControlsEnabled: false,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: Palette.limeGreenColor.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          height: 56,
                          decoration: const BoxDecoration(
                              color: Palette.greyColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Center(
                            child: FormBuilderTextField(
                                name: 'search_parameter',
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(SearchCityRoute());
                                },
                                onSubmitted: (val) {
                                  AutoRouter.of(context)
                                      .push(SearchCityRoute(searchQuery: val));
                                },
                                textInputAction: TextInputAction.search,
                                decoration: const InputDecoration(
                                    fillColor: Palette.greyColor,
                                    hintText: 'Search street or city',
                                    hintStyle: TextStyle(
                                        color: Palette.placeholderGrey),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Palette.placeholderGrey,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none)),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Or",
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoButton(
                        onPressed: () async{
                          
                          var addresses=await GeolocationService.getLocationFromCoordinates(latitude:context.read<UserLocationCubit>().state.latitude!, longitude:context.read<UserLocationCubit>().state.longitude!);
                          AutoRouter.of(context)
                              .push(ContinueWithThisLocationRoute(address: addresses[0]));
                        },
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.compass,
                              color: Colors.black,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Center(
                              child: Text(
                                'Use your current location',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: 50,
              left: 20,
              child: CupertinoButton(
                padding: const EdgeInsets.all(0),
                color: Palette.greenColor.withOpacity(0.2),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ],
      ),
    );
  }
}
