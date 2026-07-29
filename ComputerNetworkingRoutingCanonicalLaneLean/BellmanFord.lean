import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure DistanceVectorPackage where
  graph : Type u
  vertex : Type v
  distanceMatrix : Type w
  initialization : Prop
  iterativeUpdate : Prop
  convergenceCondition : Prop
  countToInfinity : Prop
  poisonReverse : Prop

structure DistanceVectorEvidence (D : DistanceVectorPackage) where
  initializationClosed : D.initialization
  iterativeUpdateClosed : D.iterativeUpdate
  convergenceConditionClosed : D.convergenceCondition
  countToInfinityClosed : D.countToInfinity
  poisonReverseClosed : D.poisonReverse

def DistanceVectorClosed (D : DistanceVectorPackage) : Prop :=
  D.initialization ∧ D.iterativeUpdate ∧ D.convergenceCondition ∧
  D.countToInfinity ∧ D.poisonReverse

theorem distance_vector_closed_from_evidence (D : DistanceVectorPackage) (E : DistanceVectorEvidence D) : DistanceVectorClosed D := by
  exact And.intro E.initializationClosed
    (And.intro E.iterativeUpdateClosed
      (And.intro E.convergenceConditionClosed
        (And.intro E.countToInfinityClosed E.poisonReverseClosed)))

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse
