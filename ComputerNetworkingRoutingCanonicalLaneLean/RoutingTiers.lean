import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure RoutedPacket (A : AdmissibleClass) where
  source : Nat
  destination : Nat
  payload : String
  hops : Nat

structure RoutingTable (A : AdmissibleClass) where
  entries : List (Nat × Nat × Nat)  -- (dest, nextHop, metric)
  consistent : Prop

structure TierPackage (A : AdmissibleClass) where
  interiorTier : Prop
  edgeTier : Prop
  tierAssignment : RoutedPacket A → Nat
  forwardingDecision : Prop

def TierClosed {A : AdmissibleClass} (T : TierPackage A) : Prop :=
  T.interiorTier ∧ T.edgeTier ∧ T.forwardingDecision

theorem tierClosed_from_evidence {A : AdmissibleClass} (T : TierPackage A) (hInt : T.interiorTier) (hEdge : T.edgeTier) (hFwd : T.forwardingDecision) : TierClosed T := by
  exact And.intro hInt (And.intro hEdge hFwd)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse