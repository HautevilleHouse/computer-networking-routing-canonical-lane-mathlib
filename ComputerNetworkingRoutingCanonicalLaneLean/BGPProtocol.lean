import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.RoutingLayer

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure BGPProtocol (R : RoutingLayer) where
  asPath : List R.nodes
  localPreference : Nat
  multiExitDisc : Nat
  ibgpFullMesh : Prop
  ebgpPeering : Prop
  routeReflector : Prop

structure BGPEvidence {R : RoutingLayer} (B : BGPProtocol R) where
  ibgpFullMeshClosed : B.ibgpFullMesh
  ebgpPeeringClosed : B.ebgpPeering
  routeReflectorClosed : B.routeReflector

def BGPClosed {R : RoutingLayer} (B : BGPProtocol R) : Prop :=
  B.ibgpFullMesh ∧ B.ebgpPeering ∧ B.routeReflector

theorem bgp_closed_from_evidence {R : RoutingLayer} (B : BGPProtocol R) (E : BGPEvidence B) :
    BGPClosed B := by
  exact And.intro E.ibgpFullMeshClosed
    (And.intro E.ebgpPeeringClosed E.routeReflectorClosed)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse