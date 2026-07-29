import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure DistanceVector where
  vector : List (Nat × Nat)
  consistent : Prop

structure ConvergenceCondition where
  networkStable : Prop
  noUpdatesRemaining : Prop

structure ConvergenceProof where
  monotonicDecrease : Prop
  loopFreedom : Prop
  optimalPathFound : Prop

def ConvergenceClosed (C : ConvergenceProof) : Prop :=
  C.monotonicDecrease ∧ C.loopFreedom ∧ C.optimalPathFound

theorem convergence_from_proof (C : ConvergenceProof) (hMon : C.monotonicDecrease) (hLoop : C.loopFreedom) (hOpt : C.optimalPathFound) : ConvergenceClosed C := by
  exact And.intro hMon (And.intro hLoop hOpt)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse