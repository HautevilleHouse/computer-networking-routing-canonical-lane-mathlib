import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure RoutingPolicy where
  localPreferences : Type
  exportRules : Type
  policyConsistency : Prop
  routePreferenceOrder : Prop

structure RoutingPolicyCompositionPackage (P : RoutingPolicy) where
  policy1 : P
  policy2 : P
  composedPolicy : P
  compositionCorrect : Prop

structure RoutingPolicyCompositionEvidence {P : RoutingPolicy}
    (C : RoutingPolicyCompositionPackage P) where
  compositionCorrectClosed : C.compositionCorrect

def RoutingPolicyCompositionClosed {P : RoutingPolicy}
    (C : RoutingPolicyCompositionPackage P) : Prop :=
  C.compositionCorrect

theorem routing_policy_composition_closed_from_evidence
    {P : RoutingPolicy} (C : RoutingPolicyCompositionPackage P)
    (E : RoutingPolicyCompositionEvidence C) : RoutingPolicyCompositionClosed C := by
  exact E.compositionCorrectClosed

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse