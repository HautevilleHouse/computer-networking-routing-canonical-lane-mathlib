import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.RoutingLayer

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure OSPFProtocol (R : RoutingLayer) where
  areaId : Nat
  helloInterval : Float
  deadInterval : Float
  neighborDiscovery : Prop
  lsaFlooding : Prop
  spfComputation : Prop

structure OSPFEvidence {R : RoutingLayer} (O : OSPFProtocol R) where
  neighborDiscoveryClosed : O.neighborDiscovery
  lsaFloodingClosed : O.lsaFlooding
  spfComputationClosed : O.spfComputation

def OSPFClosed {R : RoutingLayer} (O : OSPFProtocol R) : Prop :=
  O.neighborDiscovery ∧ O.lsaFlooding ∧ O.spfComputation

theorem ospf_closed_from_evidence {R : RoutingLayer} (O : OSPFProtocol R) (E : OSPFEvidence O) :
    OSPFClosed O := by
  exact And.intro E.neighborDiscoveryClosed
    (And.intro E.lsaFloodingClosed E.spfComputationClosed)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse