import '../model/resource_model.dart';

abstract class ResourceState{}

class InitialState extends ResourceState{}

class ResourceInProgressState extends ResourceState{}

class ResourceDataIsLoadedState extends ResourceState
{
  ResourceModel resourceModel;

  ResourceDataIsLoadedState({required this.resourceModel});

}

class ResourceErrorState extends ResourceState
{
  String error;
  ResourceErrorState(this.error);
}