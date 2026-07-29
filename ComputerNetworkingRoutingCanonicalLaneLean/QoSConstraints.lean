import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

structure FlowSpec where
  source : Nat
  destination : Nat
  bandwidth : Nat
  latency : Nat

structure QoSConfiguration where
  bandwidthReserved : Prop
  latencyGuaranteed : Prop
  policyApplied : Prop

def QoSClosed (Q : QoSConfiguration) : Prop :=
  Q.bandwidthReserved ∧ Q.latencyGuaranteed ∧ Q.policyApplied

theorem qos_closed_from_evidence (Q : QoSConfiguration) (hBW : Q.bandwidthReserved) (hLat : Q.latencyGuaranteed) (hPol : Q.policyApplied) : QoSClosed Q := by
  exact And.intro hBW (And.intro hLat hPol)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse