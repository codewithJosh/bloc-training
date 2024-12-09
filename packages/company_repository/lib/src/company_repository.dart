import 'models/models.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies();

  // Future<Company?> getCompanyById({
  //   required String id,
  // });
}
