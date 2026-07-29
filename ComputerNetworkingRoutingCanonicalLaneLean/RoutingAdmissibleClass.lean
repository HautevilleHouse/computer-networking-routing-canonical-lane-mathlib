import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure RoutingAdmittedObject where
  networkGraph : Type
  topology : TopologicalSpace networkGraph
  connected : Prop
  routingTable : networkGraph → networkGraph → List networkGraph
  pathValidity : ∀ (src dst : networkGraph), 
    (routingTable src dst).head? = some src ∧ 
    (routingTable src dst).getLast? = some dst
  conclusion : pathValidity

def RoutingWitnessClosed (O : RoutingAdmittedObject) : Prop :=
  O.pathValidity

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse