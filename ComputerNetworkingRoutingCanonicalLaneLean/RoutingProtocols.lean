import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

inductive ProtocolType where
  | OSPF
  | BGP
  | RIP
  | Static

structure ProtocolPackage (A : AdmissibleClass) where
  protocol : ProtocolType
  adjacencyEstablished : Prop
  routePropagation : Prop
  policyEnforced : Prop

def ProtocolClosed {A : AdmissibleClass} (P : ProtocolPackage A) : Prop :=
  P.adjacencyEstablished ∧ P.routePropagation ∧ P.policyEnforced

theorem protocol_closed_from_evidence {A : AdmissibleClass} (P : ProtocolPackage A) (hAdj : P.adjacencyEstablished) (hProp : P.routePropagation) (hPol : P.policyEnforced) : ProtocolClosed P := by
  exact And.intro hAdj (And.intro hProp hPol)

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse