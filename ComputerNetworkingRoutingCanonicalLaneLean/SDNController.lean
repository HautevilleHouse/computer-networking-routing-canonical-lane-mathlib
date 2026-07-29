import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.RoutingLayer

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure SDNController (R : RoutingLayer) where
  globalView : R.nodes -> R.links -> Prop
  flowTable : R.packets -> List R.nodes
  northboundAPI : Prop
  southboundAPI : Prop
  consistency : Prop
  faultTolerance : Prop

structure SDNControllerEvidence {R : RoutingLayer} (S : SDNController R) where
  northboundAPIClosed : S.northboundAPI
  southboundAPIClosed : S.southboundAPI
  consistencyClosed : S.consistency
  faultToleranceClosed : S.faultTolerance

def SDNControllerClosed {R : RoutingLayer} (S : SDNController R) : Prop :=
  S.northboundAPI ∧ S.southboundAPI ∧ S.consistency ∧ S.faultTolerance

theorem sdn_controller_closed_from_evidence {R : RoutingLayer} (S : SDNController R) (E : SDNControllerEvidence S) :
    SDNControllerClosed S := by
  exact And.intro E.northboundAPIClosed
    (And.intro E.southboundAPIClosed
      (And.intro E.consistencyClosed E.faultToleranceClosed))

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse