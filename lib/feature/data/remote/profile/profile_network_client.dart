import 'package:cleaning_duty_project/core/constants/constants.dart';
import 'package:cleaning_duty_project/core/errors/exceptions.dart';
import 'package:cleaning_duty_project/core/networks/network_client.dart';
import 'package:cleaning_duty_project/feature/data/entities/response/profile/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileNetworkClient {
  final NetworkClient networkClient;

  ProfileNetworkClient(this.networkClient);

  Future<ProfileResponse> getProfile(int id) async {
    final response = await networkClient.invoke(
      '${Constants.api_get_profile}/$id',
      RequestType.get,
    );
    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(response.data);
    } else {
      throw ServerException.withException(
          dioError: DioException(
        response: response,
        requestOptions: response.requestOptions,
      ));
    }
  }
}
