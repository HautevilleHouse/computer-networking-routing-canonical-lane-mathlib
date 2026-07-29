import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure RoutingLayer where
  packets : Type u
  nodes : Type v
  links : Type w
  forwardingTable : nodes -> packets -> nodes
  costMetric : nodes -> nodes -> Float
  convergence : Prop
  loopFree : Prop

structure RoutingLayerEvidence (R : RoutingLayer) where
  convergenceClosed : R.convergence
  loopFreeClosed : R.loopFree

def RoutingLayerClosed (R : RoutingLayer) : Prop :=
  R.convergence ∧ R.loopFree

theorem routing_layer_closed_from_evidence (R : RoutingLayer) (E : RoutingLayerEvidence R) :
    RoutingLayerClosed R := by
  exact And.intro E.convergenceClosed E.loopFreeClosed

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse