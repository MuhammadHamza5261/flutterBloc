import '../model/resource_model.dart';
import '../service/response_service.dart';

class ResourceRepository {
  ResourceModel? resourceModel;
  ResponseService responseService = ResponseService();

  Future<ResourceModel> setDataToResourceResource() async {
    resourceModel = await responseService.setDataToResponseService();
    return resourceModel! ;
  }
}
