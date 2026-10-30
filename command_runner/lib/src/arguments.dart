enum OptionType { flag , option }

class Option {
  Option(this.name , {
    required this.type,
    this.help,
    this.abbr,
    this.defualtValue,
    this.valueHlep,
    });

  final String name;
  final OptionType type;
  final String? help;
  final String? abbr;
  final Object? defualtValue;
  final String? valueHlep;

  String get usage {
    if(abbr != null){
      return '-$abbr, --$name: $help';
    }
    return '--$name: $help';
  }
}