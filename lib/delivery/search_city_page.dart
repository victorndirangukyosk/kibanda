

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/customer_address/selected_location_cubit.dart';
import 'package:kibanda_kb/delivery/geolocator_service.dart';
import 'package:kibanda_kb/routes/router.gr.dart';

import '../cubits/customer_address/places_auto_complete_cubit.dart';

class SearchCityPage extends StatelessWidget {
  final String? searchQuery;
  const SearchCityPage({Key? key, this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Palette.greyColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Center(
            child: FormBuilderTextField(
                name: 'search_parameter',
                controller: TextEditingController(text: searchQuery ?? ''),
                onTap: () {},
                onSubmitted: (val) async {
                  
                  final predictions =
                      await GeolocationService.getAddressesFromQuery(
                          address: val!);

                  context.read<PlacesAutoCompleteCubit>().save(predictions);
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    fillColor: Palette.greyColor,
                    contentPadding: EdgeInsets.symmetric(vertical: 3),
                    hintText: 'Search street or city',
                    hintStyle: TextStyle(color: Palette.placeholderGrey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Palette.placeholderGrey,
                    ),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
        ),
      ),
      body: context.watch<PlacesAutoCompleteCubit>().state.length < 1
          ? Center(
              child: SvgPicture.asset(
                'assets/svgs/big_flag.svg',
                height: 200,
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context.read<SelectedLocationCubit>().save(
                        context.read<PlacesAutoCompleteCubit>().state[index]);
                    AutoRouter.of(context).push(SaveAddressRoute(
                      address: context.read<PlacesAutoCompleteCubit>().state[index]
                    ));
                  },
                  title: Text(context
                      .watch<PlacesAutoCompleteCubit>()
                      .state[index]
                      .locality!),
                  subtitle: Text(context
                      .watch<PlacesAutoCompleteCubit>()
                      .state[index]
                      .locality!),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12,
                );
              },
              itemCount: context.watch<PlacesAutoCompleteCubit>().state.length),
    );
  }
}
