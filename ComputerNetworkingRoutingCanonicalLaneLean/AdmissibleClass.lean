import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure RoutingNetwork where
  carrier : Type
  topology : TopologicalSpace carrier

structure RoutingAdmittedObject where
  network : RoutingNetwork
  finiteGraph : Prop
  pathComputationDecidable : Prop
  routingModel : Type
  routingCorrectness : Prop
  conclusion : routingCorrectness

structure RoutingEndgameState where
  object : RoutingAdmittedObject

def RoutingWitnessClosed (O : RoutingAdmittedObject) : Prop :=
  O.routingCorrectness

structure AdmissibleClass where
  object : RoutingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  RoutingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse