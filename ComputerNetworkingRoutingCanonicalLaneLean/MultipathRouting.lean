import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure MultipathPackage where
  loadBalancing : Prop
  equalCostPaths : Prop
  unequalCostPaths : Prop
  perPacketDecision : Prop
  perFlowDecision : Prop
  hashAlgorithm : Prop

structure MultipathEvidence (M : MultipathPackage) where
  loadBalancingClosed : M.loadBalancing
  equalCostPathsClosed : M.equalCostPaths
  unequalCostPathsClosed : M.unequalCostPaths
  perPacketDecisionClosed : M.perPacketDecision
  perFlowDecisionClosed : M.perFlowDecision
  hashAlgorithmClosed : M.hashAlgorithm

def MultipathClosed (M : MultipathPackage) : Prop :=
  M.loadBalancing ∧ M.equalCostPaths ∧ M.unequalCostPaths ∧
  M.perPacketDecision ∧ M.perFlowDecision ∧ M.hashAlgorithm

theorem multipath_closed_from_evidence (M : MultipathPackage) (E : MultipathEvidence M) : MultipathClosed M := by
  exact And.intro E.loadBalancingClosed
    (And.intro E.equalCostPathsClosed
      (And.intro E.unequalCostPathsClosed
        (And.intro E.perPacketDecisionClosed
          (And.intro E.perFlowDecisionClosed E.hashAlgorithmClosed))))

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse
