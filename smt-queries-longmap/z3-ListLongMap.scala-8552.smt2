; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104442 () Bool)

(assert start!104442)

(declare-fun b!1246469 () Bool)

(declare-fun res!831806 () Bool)

(declare-fun e!706933 () Bool)

(assert (=> b!1246469 (=> (not res!831806) (not e!706933))))

(declare-datatypes ((array!80234 0))(
  ( (array!80235 (arr!38694 (Array (_ BitVec 32) (_ BitVec 64))) (size!39230 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80234)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27497 0))(
  ( (Nil!27494) (Cons!27493 (h!28702 (_ BitVec 64)) (t!40966 List!27497)) )
))
(declare-fun arrayNoDuplicates!0 (array!80234 (_ BitVec 32) List!27497) Bool)

(assert (=> b!1246469 (= res!831806 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27494))))

(declare-fun res!831807 () Bool)

(assert (=> start!104442 (=> (not res!831807) (not e!706933))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104442 (= res!831807 (and (bvslt (size!39230 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39230 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39230 a!3892))))))

(assert (=> start!104442 e!706933))

(declare-fun array_inv!29542 (array!80234) Bool)

(assert (=> start!104442 (array_inv!29542 a!3892)))

(assert (=> start!104442 true))

(declare-fun b!1246470 () Bool)

(declare-fun res!831808 () Bool)

(assert (=> b!1246470 (=> (not res!831808) (not e!706933))))

(assert (=> b!1246470 (= res!831808 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39230 a!3892)) (not (= newFrom!287 (size!39230 a!3892)))))))

(declare-fun b!1246471 () Bool)

(declare-datatypes ((Unit!41414 0))(
  ( (Unit!41415) )
))
(declare-fun e!706934 () Unit!41414)

(declare-fun lt!563093 () Unit!41414)

(assert (=> b!1246471 (= e!706934 lt!563093)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80234 List!27497 List!27497 (_ BitVec 32)) Unit!41414)

(assert (=> b!1246471 (= lt!563093 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27493 (select (arr!38694 a!3892) from!3270) Nil!27494) Nil!27494 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246471 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27494)))

(declare-fun b!1246472 () Bool)

(declare-fun Unit!41416 () Unit!41414)

(assert (=> b!1246472 (= e!706934 Unit!41416)))

(declare-fun b!1246473 () Bool)

(assert (=> b!1246473 (= e!706933 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun lt!563094 () Unit!41414)

(assert (=> b!1246473 (= lt!563094 e!706934)))

(declare-fun c!122016 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246473 (= c!122016 (validKeyInArray!0 (select (arr!38694 a!3892) from!3270)))))

(assert (= (and start!104442 res!831807) b!1246469))

(assert (= (and b!1246469 res!831806) b!1246470))

(assert (= (and b!1246470 res!831808) b!1246473))

(assert (= (and b!1246473 c!122016) b!1246471))

(assert (= (and b!1246473 (not c!122016)) b!1246472))

(declare-fun m!1148297 () Bool)

(assert (=> b!1246469 m!1148297))

(declare-fun m!1148299 () Bool)

(assert (=> start!104442 m!1148299))

(declare-fun m!1148301 () Bool)

(assert (=> b!1246471 m!1148301))

(declare-fun m!1148303 () Bool)

(assert (=> b!1246471 m!1148303))

(declare-fun m!1148305 () Bool)

(assert (=> b!1246471 m!1148305))

(assert (=> b!1246473 m!1148301))

(assert (=> b!1246473 m!1148301))

(declare-fun m!1148307 () Bool)

(assert (=> b!1246473 m!1148307))

(check-sat (not b!1246473) (not start!104442) (not b!1246469) (not b!1246471))
(check-sat)
