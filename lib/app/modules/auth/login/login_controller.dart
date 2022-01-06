import 'package:cuidapet_mobile/app/core/exceptions/social_login_canceled.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/messages.dart';
import 'package:cuidapet_mobile/app/models/social_type.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserService _userService;
  final Logger _log;

  _LoginControllerBase({
    required UserService userService,
    required Logger log
  }) : _userService = userService,
  _log = log;


  Future<void> login(String login, String password) async {
    try {
      Loader.show();
      await _userService.login(login, password);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on UserNotfoundException {
      Loader.hide();
      Messages.alert('Login ou senha inválidos');
    } catch (e, s) {
      Loader.hide();
      _log.error('Erro ao realizar login', e, s);
      Messages.alert('Erro ao realizar login tente novamente mais tarde!!!');
    }
  }

  Future<void> socialLogin(SocialType loginType) async {
    try {
      Loader.show();
      await _userService.socialLogin(loginType);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on SocialLoginCanceled {
     Loader.hide();
     _log.error('Login Cancelado'); 
     Messages.info('Login cancelado');
    } on UserExistsException catch(e,s) {
     Loader.hide();
     _log.error('Usuário registrado com outro provedor', e, s); 
     Messages.alert(e.message ?? '');
    } catch (e, s) {
     Loader.hide();
     _log.error('Erro ao realizar login', e, s);
     Messages.alert('Erro ao realizar login');
    }
  }
}
