import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cubit/map/marker_cubit.dart';
import 'package:location_geocoder/geocoder.dart' as g;

import '../../../../routes/router.gr.dart';
import '../cubits/customer_address/user_location_cubit.dart';

class ContinueWithThisLocationPage extends StatefulWidget {
  final g.Address address;
  const ContinueWithThisLocationPage({Key? key, required this.address})
      : super(key: key);

  @override
  State<ContinueWithThisLocationPage> createState() =>
      _ContinueWithThisLocationPageState();
}

class _ContinueWithThisLocationPageState
    extends State<ContinueWithThisLocationPage> {
  @override
  Widget build(BuildContext context) {
    var marker = Marker(
        markerId: MarkerId('user_location_point'),
        position: LatLng(context.read<UserLocationCubit>().state.latitude!,
            context.read<UserLocationCubit>().state.longitude!));
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) async {},
            markers: context.read<MarkerCubit>().state,
            initialCameraPosition: CameraPosition(
                zoom: 14,
                target: LatLng(
                    context.read<UserLocationCubit>().state.latitude!,
                    context.read<UserLocationCubit>().state.longitude!)),
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  color: Palette.orangeColor.withOpacity(0.4),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Palette.greyColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        widget.address.featureName!,
                        style: TextStyle(color: Palette.placeholderGrey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: CupertinoButton(
                onPressed: () {
                  AutoRouter.of(context)
                      .push(SaveAddressRoute(address: widget.address));
                },
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 46,
                        child: Center(
                          child: Text(
                            'Continue with this location',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Palette.orangeColor,
                            border: Border.all(color: Palette.orangeColor)),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
