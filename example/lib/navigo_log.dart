class NavigoLog {
  bool hasDebug = false;


  static print(String tag, String msg,{hasDebug = false}) {
    print(tag, msg);
  }
}
