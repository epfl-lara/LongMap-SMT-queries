; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103936 () Bool)

(assert start!103936)

(declare-fun b!1244112 () Bool)

(declare-fun res!829863 () Bool)

(declare-fun e!705152 () Bool)

(assert (=> b!1244112 (=> (not res!829863) (not e!705152))))

(declare-datatypes ((array!80028 0))(
  ( (array!80029 (arr!38607 (Array (_ BitVec 32) (_ BitVec 64))) (size!39143 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80028)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1244112 (= res!829863 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39143 a!3892)) (not (= newFrom!287 (size!39143 a!3892)))))))

(declare-fun b!1244113 () Bool)

(declare-datatypes ((Unit!41327 0))(
  ( (Unit!41328) )
))
(declare-fun e!705153 () Unit!41327)

(declare-fun lt!562590 () Unit!41327)

(assert (=> b!1244113 (= e!705153 lt!562590)))

(declare-datatypes ((List!27410 0))(
  ( (Nil!27407) (Cons!27406 (h!28615 (_ BitVec 64)) (t!40879 List!27410)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80028 List!27410 List!27410 (_ BitVec 32)) Unit!41327)

(assert (=> b!1244113 (= lt!562590 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27406 (select (arr!38607 a!3892) from!3270) Nil!27407) Nil!27407 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80028 (_ BitVec 32) List!27410) Bool)

(assert (=> b!1244113 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27407)))

(declare-fun b!1244114 () Bool)

(declare-fun e!705151 () Bool)

(assert (=> b!1244114 (= e!705152 e!705151)))

(declare-fun res!829862 () Bool)

(assert (=> b!1244114 (=> (not res!829862) (not e!705151))))

(assert (=> b!1244114 (= res!829862 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562591 () Unit!41327)

(assert (=> b!1244114 (= lt!562591 e!705153)))

(declare-fun c!121810 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244114 (= c!121810 (validKeyInArray!0 (select (arr!38607 a!3892) from!3270)))))

(declare-fun b!1244115 () Bool)

(declare-fun Unit!41329 () Unit!41327)

(assert (=> b!1244115 (= e!705153 Unit!41329)))

(declare-fun b!1244116 () Bool)

(declare-fun res!829861 () Bool)

(assert (=> b!1244116 (=> (not res!829861) (not e!705152))))

(assert (=> b!1244116 (= res!829861 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27407))))

(declare-fun b!1244117 () Bool)

(assert (=> b!1244117 (= e!705151 false)))

(declare-fun lt!562592 () Bool)

(assert (=> b!1244117 (= lt!562592 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27407))))

(declare-fun res!829864 () Bool)

(assert (=> start!103936 (=> (not res!829864) (not e!705152))))

(assert (=> start!103936 (= res!829864 (and (bvslt (size!39143 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39143 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39143 a!3892))))))

(assert (=> start!103936 e!705152))

(declare-fun array_inv!29455 (array!80028) Bool)

(assert (=> start!103936 (array_inv!29455 a!3892)))

(assert (=> start!103936 true))

(assert (= (and start!103936 res!829864) b!1244116))

(assert (= (and b!1244116 res!829861) b!1244112))

(assert (= (and b!1244112 res!829863) b!1244114))

(assert (= (and b!1244114 c!121810) b!1244113))

(assert (= (and b!1244114 (not c!121810)) b!1244115))

(assert (= (and b!1244114 res!829862) b!1244117))

(declare-fun m!1146491 () Bool)

(assert (=> b!1244113 m!1146491))

(declare-fun m!1146493 () Bool)

(assert (=> b!1244113 m!1146493))

(declare-fun m!1146495 () Bool)

(assert (=> b!1244113 m!1146495))

(declare-fun m!1146497 () Bool)

(assert (=> b!1244116 m!1146497))

(assert (=> b!1244114 m!1146491))

(assert (=> b!1244114 m!1146491))

(declare-fun m!1146499 () Bool)

(assert (=> b!1244114 m!1146499))

(declare-fun m!1146501 () Bool)

(assert (=> start!103936 m!1146501))

(assert (=> b!1244117 m!1146495))

(check-sat (not b!1244116) (not b!1244114) (not start!103936) (not b!1244113) (not b!1244117))
