; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104176 () Bool)

(assert start!104176)

(declare-fun b!1245472 () Bool)

(declare-fun res!830419 () Bool)

(declare-fun e!706037 () Bool)

(assert (=> b!1245472 (=> (not res!830419) (not e!706037))))

(declare-datatypes ((array!80067 0))(
  ( (array!80068 (arr!38621 (Array (_ BitVec 32) (_ BitVec 64))) (size!39158 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80067)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27437 0))(
  ( (Nil!27434) (Cons!27433 (h!28651 (_ BitVec 64)) (t!40898 List!27437)) )
))
(declare-fun arrayNoDuplicates!0 (array!80067 (_ BitVec 32) List!27437) Bool)

(assert (=> b!1245472 (= res!830419 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27434))))

(declare-fun b!1245473 () Bool)

(declare-fun e!706038 () Bool)

(assert (=> b!1245473 (= e!706037 e!706038)))

(declare-fun res!830418 () Bool)

(assert (=> b!1245473 (=> (not res!830418) (not e!706038))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245473 (= res!830418 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41306 0))(
  ( (Unit!41307) )
))
(declare-fun lt!563095 () Unit!41306)

(declare-fun e!706039 () Unit!41306)

(assert (=> b!1245473 (= lt!563095 e!706039)))

(declare-fun c!122219 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245473 (= c!122219 (validKeyInArray!0 (select (arr!38621 a!3892) from!3270)))))

(declare-fun b!1245474 () Bool)

(declare-fun res!830421 () Bool)

(assert (=> b!1245474 (=> (not res!830421) (not e!706037))))

(assert (=> b!1245474 (= res!830421 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39158 a!3892)) (not (= newFrom!287 (size!39158 a!3892)))))))

(declare-fun res!830420 () Bool)

(assert (=> start!104176 (=> (not res!830420) (not e!706037))))

(assert (=> start!104176 (= res!830420 (and (bvslt (size!39158 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39158 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39158 a!3892))))))

(assert (=> start!104176 e!706037))

(declare-fun array_inv!29559 (array!80067) Bool)

(assert (=> start!104176 (array_inv!29559 a!3892)))

(assert (=> start!104176 true))

(declare-fun b!1245475 () Bool)

(declare-fun Unit!41308 () Unit!41306)

(assert (=> b!1245475 (= e!706039 Unit!41308)))

(declare-fun b!1245476 () Bool)

(declare-fun lt!563094 () Unit!41306)

(assert (=> b!1245476 (= e!706039 lt!563094)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80067 List!27437 List!27437 (_ BitVec 32)) Unit!41306)

(assert (=> b!1245476 (= lt!563094 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27433 (select (arr!38621 a!3892) from!3270) Nil!27434) Nil!27434 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1245476 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27434)))

(declare-fun b!1245477 () Bool)

(assert (=> b!1245477 (= e!706038 false)))

(declare-fun lt!563096 () Bool)

(assert (=> b!1245477 (= lt!563096 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27434))))

(assert (= (and start!104176 res!830420) b!1245472))

(assert (= (and b!1245472 res!830419) b!1245474))

(assert (= (and b!1245474 res!830421) b!1245473))

(assert (= (and b!1245473 c!122219) b!1245476))

(assert (= (and b!1245473 (not c!122219)) b!1245475))

(assert (= (and b!1245473 res!830418) b!1245477))

(declare-fun m!1148155 () Bool)

(assert (=> b!1245473 m!1148155))

(assert (=> b!1245473 m!1148155))

(declare-fun m!1148157 () Bool)

(assert (=> b!1245473 m!1148157))

(assert (=> b!1245476 m!1148155))

(declare-fun m!1148159 () Bool)

(assert (=> b!1245476 m!1148159))

(declare-fun m!1148161 () Bool)

(assert (=> b!1245476 m!1148161))

(declare-fun m!1148163 () Bool)

(assert (=> b!1245472 m!1148163))

(assert (=> b!1245477 m!1148161))

(declare-fun m!1148165 () Bool)

(assert (=> start!104176 m!1148165))

(check-sat (not b!1245477) (not b!1245472) (not b!1245473) (not b!1245476) (not start!104176))
(check-sat)
