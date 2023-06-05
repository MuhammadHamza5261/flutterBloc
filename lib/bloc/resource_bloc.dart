import 'package:bloc_implementation_flutter/bloc/resource_event.dart';
import 'package:bloc_implementation_flutter/bloc/resource_state.dart';
import 'package:bloc_implementation_flutter/model/resource_model.dart';
import 'package:bloc_implementation_flutter/repository/response_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState>
{
  ResourceModel? resourceModel;
  ResourceRepository resourceRepository = ResourceRepository();

  ResourceBloc() : super(InitialState())
  {
    on<ResourceEvent>((event,emit)
    async
    {
      if(event is SetDataToResourceEvent)
        {
          emit(ResourceInProgressState());
          try
              {
                resourceModel = await resourceRepository.setDataToResourceResource() ;
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