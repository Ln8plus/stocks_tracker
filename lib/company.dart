class Company {
  //attributes = fields in table

  String companyCode;
  String companyName;
  String countryCode;
  String lastTrade;
  String change;
  String changePercent;
  //String PtoE;

  Company(this.companyCode, this.companyName, this.countryCode, this.lastTrade,
      this.change, this.changePercent);

  Company.fromJson(Map<String, dynamic> json) {
    companyCode = json['companyCode'];
    companyName = json['companyName'];
    countryCode = json['countryCode'];
    lastTrade = json['lastTrade'];
    change = json['change'];
    changePercent = json['changePercent'];
    //PtoE = json['PtoE'];
  }
}
