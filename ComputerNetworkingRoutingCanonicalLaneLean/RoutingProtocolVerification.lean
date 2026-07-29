import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure RoutingProtocolPackage where
  networkModel : Type
  stateSpace : Type
  initialState : stateSpace
  updateRule : stateSpace → stateSpace
  convergenceCondition : Prop
  loopFreedom : Prop

structure RoutingProtocolEvidence (P : RoutingProtocolPackage) where
  convergenceConditionClosed : P.convergenceCondition
  loopFreedomClosed : P.loopFreedom

def RoutingProtocolClosed (P : RoutingProtocolPackage) : Prop :=
  P.convergenceCondition ∧ P.loopFreedom

theorem routing_protocol_closed_from_evidence (P : RoutingProtocolPackage)
    (E : RoutingProtocolEvidence P) : RoutingProtocolClosed P := by
  exact And.intro E.convergenceConditionClosed E.loopFreedomClosed

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse