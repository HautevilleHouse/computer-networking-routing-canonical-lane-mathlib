import HautevilleHouse.ComputerNetworkingRoutingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ComputerNetworkingRoutingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RoutingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComputerNetworkingRoutingCanonicalLaneLean
end HautevilleHouse