import 'dart:io';
import 'package:carta2/models/allCarsmodel.dart';
import 'package:dio/dio.dart';
import 'package:carta2/Layout/layoutStates.dart';
import 'package:carta2/network/remote/dio_Helper.dart';
import 'package:carta2/shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/AddVehicle/addvehicle.dart';
import '../pages/Contactus/contactScreen.dart';
import '../pages/Home/homeScreen.dart';
import '../pages/carsScreen/carsscreen.dart';
import '../pages/fine/finesScreen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  //initial Constructor.
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.money),
      label: 'Fines',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.car_crash_rounded),
      label: 'cars',
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    FineScreen(),
    CarsScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(CartaBottomNavState());
  }

  List<dynamic> fine = [];

  void getFine() {
    emit(CartaLoadingState());

    DioHelper.getData(
      url: 'https://run.mocky.io/v3/9e4a8f92-4e4a-4217-8f7b-12cbe202ace6',
    ).then((value) {
      print(value.data['fines']);
      fine = value.data['fines'];
      print(fine[0]);

      emit(CartaGetFineSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CartaGetFineErrorState(error.toString()));
    });
  }

  late VehiclesModel vehiclesmodel;

  void getvehicles() {
    DioHelper.getData(
      url: 'http://localhost:4242/vehicles',
      token: token,
    ).then((value) {
      vehiclesmodel = VehiclesModel.fromJson(value.data);
      emit(CartaSuccessAllvehicleState());
    }).catchError((error) {
      print(error.toString());
      emit(CartaErrorAllvehicleState(error));
    });
  }

  //late File carimage;
  // var picker = ImagePicker();

  // Future<void> getcarImage() async {
  //   final pickedimage = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedimage != null) {
  //     //carimage = File(pickedimage.path);
  //     emit(CartaCarImageSuccessState());
  //   } else {
  //     print("No image selected");
  //     emit(CartaCarImageErrorState());
  //   }
  // }
}
