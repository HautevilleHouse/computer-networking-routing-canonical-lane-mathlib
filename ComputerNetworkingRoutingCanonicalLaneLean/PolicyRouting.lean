import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure PolicyRoutingPackage where
  routeFilter : Type u
  communityAttribute : Type v
  localPreference : Type w
  importPolicy : Prop
  exportPolicy : Prop
  routeOrigin : Prop
  asPathPrepender : Prop

structure PolicyRoutingEvidence (P : PolicyRoutingPackage) where
  importPolicyClosed : P.importPolicy
  exportPolicyClosed : P.exportPolicy
  routeOriginClosed : P.routeOrigin
  asPathPrependerClosed : P.asPathPrepender

def PolicyRoutingClosed (P : PolicyRoutingPackage) : Prop :=
  P.importPolicy ∧ P.exportPolicy ∧ P.routeOrigin ∧ P.asPathPrepender

theorem policy_routing_closed_from_evidence (P : PolicyRoutingPackage) (E : PolicyRoutingEvidence P) : PolicyRoutingClosed P := by
  exact And.intro E.importPolicyClosed
    (And.intro E.exportPolicyClosed
      (And.intro E.routeOriginClosed E.asPathPrependerClosed))

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse
