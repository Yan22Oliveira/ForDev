import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication{

  Future<AccontEntity>auth({
    @required String email,
    @required String password,
  });

}