class Statistics {
  String countryLong;
  String countryShort;
  int cases;
  int recovered;
  int unresolved;
  int deaths;
  int newCasesToday;
  int newDeathsToday;
  int activeCases;
  int seriousCases;

  Statistics.fromJson(
      String countryLong, String countryShort, Map<String, dynamic> data) {
    this.countryLong = countryLong;
    this.countryShort = countryShort;
    this.cases = data["total_cases"];
    this.recovered = data["total_recovered"];
    this.unresolved = data["total_unresolved"];
    this.deaths = data["total_deaths"];
    this.newCasesToday = data["total_new_cases_today"];
    this.newDeathsToday = data["total_new_deaths_today"];
    this.activeCases = data["total_active_cases"];
    this.seriousCases = data["total_serious_cases"];
  }

  @override
  String toString() {
    return 'Statistics{countryLong: $countryLong, countryShort: $countryShort, cases: $cases, recovered: $recovered, unresolved: $unresolved, deaths: $deaths, newCasesToday: $newCasesToday, newDeathsToday: $newDeathsToday, activeCases: $activeCases, seriousCases: $seriousCases}';
  }
}
