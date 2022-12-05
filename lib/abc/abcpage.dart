import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../items.dart';
import 'bloc/abc_bloc.dart';

class AbcPage extends StatefulWidget {
  AbcPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AbcPage> createState() => _AbcPageState();
}

class _AbcPageState extends State<AbcPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbcBloc, AbcState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AbcSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: Text("ABC"),
              ),
              body: Container(
                padding: EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: state.Abc.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Items(itemsData: state.Abc[index]);
                  },
                ),
              ),
            );
          } else if (state is AbcLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        });
  }
}
