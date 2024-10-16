/*
<DiveCalc is an app to help Public Safety Divers>
Copyright (C) <2024>  <Nicollas Soares Goncalves>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

// ignore_for_file: non_constant_identifier_names
/// Calcula o volume necessário para reflutuar três quartos do peso submerso.
///
/// Este método calcula o volume necessário de um levantador para reflutuar
/// três quartos do peso submerso de um objeto, considerando a profundidade
/// e o volume do cilindro.
///
/// - [weight]: O peso do objeto submerso.
/// - [depth]: A profundidade em que o objeto está submerso.
/// - [lifterWeight]: O peso do levantador (pode ser nulo).
/// - [lifterVolume]: O volume do levantador.
/// - [cylinderVolume]: O volume do cilindro em litros.
///
/// Retorna um `Map` contendo:
/// - `volumeNeeded`: O volume necessário para reflutuar três quartos do peso.
/// - `volumeNeededCylinders`: O número de cilindros necessários para atingir o volume necessário.
Map<String,double?> refloatThreeQuarters({
  required double weight,
  required double depth,
  double? lifterWeight, 
  required double lifterVolume, 
  required double cylinderVolume}) {
  if (lifterWeight == null) {
    double waterWeight = 0.75 * weight;
    double ATA = 1+(depth/10);
    double lift=waterWeight*ATA;
    double volumeNeeded =  lift;

    double volumeNeededCylinders =(lift/lifterVolume).ceilToDouble();


    return {
      'volumeNeeded': volumeNeeded,
      'volumeNeededCylinders': volumeNeededCylinders,
    };
  }else{
    double waterWeight = 0.75 * weight;
    double ATA = 1+(depth/10);
    double lift=waterWeight*ATA;
    double lifterCap = lifterVolume - lifterWeight;
    double volumeNeeded = lift;
    double refloatsNeeded = (lift/lifterCap).ceilToDouble();
    double refloatsWeight = refloatsNeeded * lifterWeight;
    double volumeNeededCylinders = ((waterWeight+refloatsWeight)/lifterCap).ceilToDouble();

    return {
      'volumeNeeded': volumeNeeded,
      'volumeNeededCylinders': volumeNeededCylinders,
      'refloatsNeeded': refloatsNeeded,
  };
  }
}

/// Calcula o volume necessário para reflutuar usando o peso real.
///
/// Este método calcula o volume necessário de um levantador para reflutuar
/// o peso submerso de um objeto, considerando a profundidade
/// e o volume do cilindro.
///
/// - [weight]: O peso do objeto submerso.
/// - [depth]: A profundidade em que o objeto está submerso.
/// - [lifterWeight]: O peso do levantador (pode ser nulo).
/// - [lifterVolume]: O volume do levantador.
/// - [cylinderVolume]: O volume do cilindro em litros.
///
/// Retorna um `Map` contendo:
/// - `volumeNeeded`: O volume necessário para reflutuar três quartos do peso.
/// - `volumeNeededCylinders`: O número de cilindros necessários para atingir o volume necessário.
Map<String,double?> refloatOnetoOne({
  required double weight, 
  required double depth, 
  double? lifterWeight, 
  required double lifterVolume, 
  required double cylinderVolume}) {
  if (lifterWeight == null) {
    double waterWeight = weight;
    double ATA = 1+(depth/10);
    double lift=waterWeight*ATA;
    double volumeNeeded =  lift;

    double volumeNeededCylinders =(waterWeight/lifterVolume).ceilToDouble();


    return {
      'volumeNeeded': volumeNeeded,
      'volumeNeededCylinders': volumeNeededCylinders,
    };
  }else{
    double waterWeight = weight;
    double ATA = 1+(depth/10);
    double lift=waterWeight*ATA;
    double lifterCap = lifterVolume - lifterWeight;
    double refloatsNeeded = (lift/lifterCap).ceilToDouble();
    double refloatsWeight = refloatsNeeded * lifterWeight;
    double volumeNeeded = lift;
    double volumeNeededCylinders = ((waterWeight+refloatsWeight)/lifterCap).ceilToDouble();

    return {
      'volumeNeeded': volumeNeeded,
      'volumeNeededCylinders': volumeNeededCylinders,
      'refloatsNeeded': refloatsNeeded,
  };
  }
}
