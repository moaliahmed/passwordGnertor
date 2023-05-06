import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgnerator/bloc/viewPassword/view_password_cubit.dart';
import 'package:passwordgnerator/component/mainButtonSheet.dart';
import '../component/password_item.dart';

class HistoryScrean extends StatefulWidget {
  const HistoryScrean({super.key});

  @override
  State<HistoryScrean> createState() => _HistoryScreanState();
}

class _HistoryScreanState extends State<HistoryScrean> {
  @override
  void initState() {
    BlocProvider.of<ViewPasswordCubit>(context).viewData();
    super.initState();
  }

  String dataStorg = '';
  @override
  Widget build(BuildContext context) {
   // var passwordList = BlocProvider.of<ViewPasswordCubit>(context).passwordList ?? [];
   var cubit = ViewPasswordCubit.get(context);
    return Scaffold(
      body: BlocBuilder<ViewPasswordCubit, ViewPasswordState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: cubit.passwordList!.length,
            itemBuilder: (context, index) {
              return passwordItem(
                password:cubit.passwordList![index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) {
            return mainButtonSheet();
          },
        );
      }),
    );
  }
}
