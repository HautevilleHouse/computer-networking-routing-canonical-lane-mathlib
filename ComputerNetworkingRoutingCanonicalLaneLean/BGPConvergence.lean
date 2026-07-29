import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure BGPPackage where
  autonomousSystems : Type u
  prefix : Type v
  routeMap : Type w
  localPref : Prop
  asPathLength : Prop
  med : Prop
  ebgpMultihop : Prop
  nextHopReachable : Prop

structure BGPEvidence (B : BGPPackage) where
  localPrefClosed : B.localPref
  asPathLengthClosed : B.asPathLength
  medClosed : B.med
  ebgpMultihopClosed : B.ebgpMultihop
  nextHopReachableClosed : B.nextHopReachable

def BGPClosed (B : BGPPackage) : Prop :=
  B.localPref ∧ B.asPathLength ∧ B.med ∧ B.ebgpMultihop ∧ B.nextHopReachable

theorem bgp_closed_from_evidence (B : BGPPackage) (E : BGPEvidence B) : BGPClosed B := by
  exact And.intro E.localPrefClosed
    (And.intro E.asPathLengthClosed
      (And.intro E.medClosed
        (And.intro E.ebgpMultihopClosed E.nextHopReachableClosed)))

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse
