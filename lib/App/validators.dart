abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordlValidator = NonEmptyStringValidator();
  final String invalidEmailErrorDiscription = ("Email can't be empty");
  final String invalidPasswordErrorDiscription = ("Password can't be empty");
}
