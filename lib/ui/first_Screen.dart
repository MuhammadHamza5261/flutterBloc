import 'package:bloc_implementation_flutter/bloc/resource_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/resource_bloc.dart';
import '../bloc/resource_event.dart';

//stl

class BlocImplement extends StatelessWidget {
  const BlocImplement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Show List'),
      ),
      body: const BlocImplementSTF(),
    );
  }
}
//stf
class BlocImplementSTF extends StatefulWidget {
  const BlocImplementSTF({Key? key}) : super(key: key);

  @override
  State<BlocImplementSTF> createState() => _BlocImplementSTFState();
}

class _BlocImplementSTFState extends State<BlocImplementSTF> {


  // call api on init method in flutter then they will run on when the app is start

  @override
  void initState() {
    //call the bloc method on init state
    BlocProvider.of<ResourceBloc>(context).add(SetDataToResourceEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

   var width = MediaQuery.of(context).size.width;
   var height = MediaQuery.of(context).size.height;


    return  SafeArea(
      child: BlocBuilder<ResourceBloc,ResourceState>(
        builder: (context,state){
          return state is ResourceInProgressState ?
              const Center(
                child: CircularProgressIndicator(),
              ):
              state is ResourceDataIsLoadedState?
              SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: height*0.05),
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: state.resourceModel.data.length,
                            itemBuilder: (context,i){
                            const NeverScrollableScrollPhysics();
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),

                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: ListTile(
                                  selectedColor: Colors.grey.shade300,

                                  leading: Text('${state.resourceModel.data[i].id}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  title: Text(state.resourceModel.data[i].name,
                                    style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  ),
                                  subtitle: Text(state.resourceModel.data[i].pantoneValue,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: Text(state.resourceModel.data[i].color,
                                    style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  ),
                                ),
                              );
                            },
                        ),
                      ),
                             ],
                             ),
               ),
          ): const SizedBox();
          }
      ),
    );
  }
}
// 0xff
///
// Column(
// children: [
//
// Text('Id: ${state.resourceModel.data[i].id}',style: const TextStyle(fontSize: 25.0,color: Colors.black),),
// Text('Name: ${state.resourceModel.data[i].name}',style: const TextStyle(fontSize: 25.0,),),
// Text('Year: ${state.resourceModel.data[i].year}',style: const TextStyle(fontSize: 25.0,),),
// Text('Color: ${state.resourceModel.data[i].color}',style: const TextStyle(fontSize: 25.0,),),
// Text('Pantone_value: ${state.resourceModel.data[i].pantoneValue}',style: const TextStyle(fontSize: 25.0,),),
// ],
// );

