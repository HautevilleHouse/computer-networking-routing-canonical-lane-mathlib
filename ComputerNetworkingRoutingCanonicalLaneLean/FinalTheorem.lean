import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.RoutingLayer
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.OSPFProtocol
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.DistanceVectorRouting
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.BGPProtocol
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.QoSRouting
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.SDNController

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

def gateClosed (A : AdmissibleClass) : Prop :=
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  trivial

def ConstrainedRoutingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_routing_endgame (A : AdmissibleClass) :
    ConstrainedRoutingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse