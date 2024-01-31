import '../model/resource_model.dart';

abstract class ResourceState{}

// initial State

class InitialState extends ResourceState{}

//Progress State

class ResourceInProgressState extends ResourceState{}

//Loaded State

class ResourceDataIsLoadedState extends ResourceState
{

  ResourceModel resourceModel;

  ResourceDataIsLoadedState({required this.resourceModel});

}

//error State

class ResourceErrorState extends ResourceState

{
  String error;
  ResourceErrorState(this.error);
}