// import 'package:conditional_builder/conditional_builder.dart';
import 'package:carta2/Layout/layoutCubit.dart';
import 'package:carta2/Layout/layoutStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../shared/Components/components.dart';

class FineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var fine_list = LayoutCubit.get(context).fine;

        return ConditionalBuilder(
          condition: true,
          builder: (context) => ListView.separated(
            // physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildFineItem(fine_list[index], function: () {}),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 2,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
