
import 'package:bloc_implementation_flutter/bloc/resource_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/resource_bloc.dart';
import '../bloc/resource_event.dart';
class BlocImplement extends StatelessWidget {
  const BlocImplement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text('Bloc Implementation'),
      ),
      body: const BlocImplementSTF(),
    );
  }
}
///stf
class BlocImplementSTF extends StatefulWidget {
  const BlocImplementSTF({Key? key}) : super(key: key);

  @override
  State<BlocImplementSTF> createState() => _BlocImplementSTFState();
}

class _BlocImplementSTFState extends State<BlocImplementSTF> {


  /// call api on init method in flutter then they will run on when the app is start

  @override
  void initState() {
    ///call the bloc method on init state
    BlocProvider.of<ResourceBloc>(context).add(SetDataToResourceEvent());
    super.initState();
  }



  late double width;
  late double height;


  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    return  SafeArea(
      child: BlocBuilder<ResourceBloc,ResourceState>(
        builder: (context,state){
          return state is ResourceInProgressState ?
              const Center(
                child: CircularProgressIndicator(),
              ):
              state is ResourceDataIsLoadedState?
          SingleChildScrollView(
            child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: state.resourceModel.data.length,
                        itemBuilder: (context,i){
                        const NeverScrollableScrollPhysics();
                          return  Column(
                            children: [
                              Text('Id: ${state.resourceModel.data[i].id}',style: const TextStyle(fontSize: 25.0,color: Colors.black),),
                              Text('Name ${state.resourceModel.data[i].name}',style: const TextStyle(fontSize: 25.0,),),
                              Text('Year ${state.resourceModel.data[i].year}',style: const TextStyle(fontSize: 25.0,),),
                              Text('Color ${state.resourceModel.data[i].color}',style: const TextStyle(fontSize: 25.0,),),
                              Text('Pantone_value ${state.resourceModel.data[i].pantoneValue}',style: const TextStyle(fontSize: 25.0,),),
                            ],
                          );
                        },
                    ),
            ],
            ),
          ): SizedBox();
          }
      ),
    );
  }
}

