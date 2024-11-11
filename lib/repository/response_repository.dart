import '../model/resource_model.dart';
import '../service/response_service.dart';

class ResourceRepository {
  //get the model
  ResourceModel? resourceModel;
  //get the service
  ResponseService responseService = ResponseService();
  //now we create a repo method
  Future<ResourceModel> setDataToResourceResource() async {

    //call the service method
    resourceModel = await responseService.setDataToResponseService();
    return resourceModel!;

  }
}
