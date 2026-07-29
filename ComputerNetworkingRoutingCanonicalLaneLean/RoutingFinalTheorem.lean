import canonicalLaneMathlib.AdmissibleClass
import CarrierRoutingCanonicalLaneLean.RoutingBridgeLemmas
import CarrierRoutingCanonicalLaneLean.RoutingGateLemmas

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

def ConstrainedRoutingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_routing_endgame (A : AdmissibleClass) :
    ConstrainedRoutingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse