// ignore_for_file: avoid_classes_with_only_static_members

class CarbonFootPrint {
  // >> Emission unit = kg of CO2

  // Common electric devices consumptions

  // Assumming that power usage of fan per hour is 65 watts
  static const double kwhUsedByFanPerHour = 0.065;

  // Assumming the TV is LED and is 35 inches in size
  // Source: https://www.rtings.com/tv/learn/led-oled-power-consumption-and-electricity-cost
 

  // Electricity(kWh)
  static const double emissionPerUnitElectricity = 0.85;

  // Water(L)
  static const double emissionPerUnitWater = 0.28;

  // Petrol(L)
  static const double emissionPerlitFrieght = 0.1135 ;

  static const double emissionPerkgRec = 0.59;

 
  static const double avgEmissionDueToTravel = 128.43;
  static const double avgEmissionDueToRecyclePerDay = 102.5;
  static const double avgEmissionDueToManufacture = 100;

  // Get the daily carbon footprint of your Manufacturing activities
  static double getManufacturingFootPrint(
    double totalElectricity,
    double totalwater,
    double totalfossil,
  ) {
 
    final double emissionDueToElectricity =
        emissionPerUnitElectricity * totalElectricity;

     final double emissionDueToWater =
      totalwater * emissionPerUnitWater;

    final double emissionDueToFossils =
      totalfossil * emissionPerlitFrieght;
    

    return emissionDueToElectricity + emissionDueToWater + emissionDueToFossils;
  }

  // Get the daily footprint of your travel related activities
  static double getTravelFootPrint(double distanceTravelledByFrieght,
  double efficiency, double petrolconsume,) {
    return (distanceTravelledByFrieght/efficiency)*emissionPerlitFrieght;
  }

  // Get the daily footprint of your food related activities
  static double getRecycleFootPrint(
    double volumeOfMaterials,
    double electricR,
    double waterR,

  ) {
    return electricR * emissionPerUnitElectricity + waterR * emissionPerUnitWater + volumeOfMaterials * emissionPerkgRec;
  }

  // Get total carbon footprint according to daily activities
  static double getTotalCarbonFootPrint(
    // Household
    double manu1,
    double manu2,
    double manu3,


    // Travel
    double travel1,
    double travel2,
    double travel3,

    // Food
    double recycle1,
    double recycle2,
    double recycle3,
  ) {
    return getManufacturingFootPrint(
            manu1, manu2, manu3,) +
        getTravelFootPrint(travel1, travel2,
            travel3,) +
        getRecycleFootPrint(recycle1,recycle2,
            recycle3,);
  }
}
