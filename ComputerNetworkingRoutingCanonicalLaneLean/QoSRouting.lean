import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.RoutingLayer

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure QoSRouting (R : RoutingLayer) where
  bandwidth : R.nodes -> R.nodes -> Float
  latency : R.nodes -> R.nodes -> Float
  jitter : R.nodes -> R.nodes -> Float
  constraintBasedRouting : Prop
  admissionControl : Prop
  trafficShaping : Prop

structure QoSEvidence {R : RoutingLayer} (Q : QoSRouting R) where
  constraintBasedRoutingClosed : Q.constraintBasedRouting
  admissionControlClosed : Q.admissionControl
  trafficShapingClosed : Q.trafficShaping

def QoSClosed {R : RoutingLayer} (Q : QoSRouting R) : Prop :=
  Q.constraintBasedRouting ∧ Q.admissionControl ∧ Q.trafficShaping

theorem qos_closed_from_evidence {R : RoutingLayer} (Q : QoSRouting R) (E : QoSEvidence Q) :
    QoSClosed Q := by
  exact And.intro E.constraintBasedRoutingClosed
    (And.intro E.admissionControlClosed E.trafficShapingClosed)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse