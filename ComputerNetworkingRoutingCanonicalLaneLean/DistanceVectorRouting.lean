import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.RoutingLayer

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure DistanceVectorRouting (R : RoutingLayer) where
  distanceTable : R.packets -> R.nodes -> Float
  periodicUpdate : Prop
  triggeredUpdate : Prop
  countToInfinityMitigation : Prop

structure DistanceVectorEvidence {R : RoutingLayer} (D : DistanceVectorRouting R) where
  periodicUpdateClosed : D.periodicUpdate
  triggeredUpdateClosed : D.triggeredUpdate
  countToInfinityMitigationClosed : D.countToInfinityMitigation

def DistanceVectorClosed {R : RoutingLayer} (D : DistanceVectorRouting R) : Prop :=
  D.periodicUpdate ∧ D.triggeredUpdate ∧ D.countToInfinityMitigation

theorem distance_vector_closed_from_evidence {R : RoutingLayer} (D : DistanceVectorRouting R) (E : DistanceVectorEvidence D) :
    DistanceVectorClosed D := by
  exact And.intro E.periodicUpdateClosed
    (And.intro E.triggeredUpdateClosed E.countToInfinityMitigationClosed)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse