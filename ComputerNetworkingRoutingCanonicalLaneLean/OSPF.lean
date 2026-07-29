import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure LinkStatePackage where
  topologyDatabase : Type u
  lsaFlooding : Type v
  spfComputation : Type w
  helloProtocol : Prop
  drSelection : Prop
  areaHierarchy : Prop
  stubArea : Prop

structure LinkStateEvidence (L : LinkStatePackage) where
  helloProtocolClosed : L.helloProtocol
  drSelectionClosed : L.drSelection
  areaHierarchyClosed : L.areaHierarchy
  stubAreaClosed : L.stubArea

def LinkStateClosed (L : LinkStatePackage) : Prop :=
  L.helloProtocol ∧ L.drSelection ∧ L.areaHierarchy ∧ L.stubArea

theorem link_state_closed_from_evidence (L : LinkStatePackage) (E : LinkStateEvidence L) : LinkStateClosed L := by
  exact And.intro E.helloProtocolClosed
    (And.intro E.drSelectionClosed
      (And.intro E.areaHierarchyClosed E.stubAreaClosed))

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse
