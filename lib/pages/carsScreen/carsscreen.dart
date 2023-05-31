import 'package:carta2/Layout/layoutCubit.dart';
import 'package:carta2/Layout/layoutStates.dart';
import 'package:carta2/models/allCarsmodel.dart';
import 'package:carta2/pages/carsScreen/vDetail.dart';
import 'package:carta2/shared/Components/components.dart';
import 'package:carta2/shared/constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VehiclesModel vvmodel;
    var cc = LayoutCubit.get(context).vehiclesmodel.vehicles;
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: LayoutCubit.get(context).vehiclesmodel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VDetail(
                              vv: cc[index],
                            )));
              },
              child: buildVehicleItem(cc[index]),
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: LayoutCubit.get(context).vehiclesmodel.vehicles.length,
          ),
          fallback: (context) => CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildVehicleItem(Vehicles vmodel) => Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          padding: EdgeInsets.all(20),
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CAR OWNER ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      Text(
                        '$user_name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        vmodel.license,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expire Data",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vmodel.licenseExpiredDate,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Model",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vmodel.manufacturer,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class CarsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
