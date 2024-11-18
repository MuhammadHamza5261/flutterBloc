import 'package:bloc_implementation_flutter/bloc/resource_event.dart';
import 'package:bloc_implementation_flutter/bloc/resource_state.dart';
import 'package:bloc_implementation_flutter/model/resource_model.dart';
import 'package:bloc_implementation_flutter/repository/response_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState>
{
  //use the model
  ResourceModel? resourceModel;
  //use the repository
  ResourceRepository resourceRepository = ResourceRepository();

  // call the constructor and add initialState

  ResourceBloc() : super(InitialState())
  {
    on<ResourceEvent>((event,emit) async
    {
      //call the event
      if(event is SetDataToResourceEvent)
        {
          emit(ResourceInProgressState());
          try
              {

                resourceModel = await resourceRepository.setDataToResourceResource();
                
                //emit the loaded state and put model
                emit(ResourceDataIsLoadedState(resourceModel: resourceModel!));
              }

              catch(e)
              {
                emit(ResourceErrorState(e.toString()));
              }
        }
    });
  }
}