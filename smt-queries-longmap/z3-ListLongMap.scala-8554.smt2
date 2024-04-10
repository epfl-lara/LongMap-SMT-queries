; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104454 () Bool)

(assert start!104454)

(declare-fun b!1246559 () Bool)

(declare-fun res!831860 () Bool)

(declare-fun e!706988 () Bool)

(assert (=> b!1246559 (=> (not res!831860) (not e!706988))))

(declare-datatypes ((array!80246 0))(
  ( (array!80247 (arr!38700 (Array (_ BitVec 32) (_ BitVec 64))) (size!39236 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80246)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27503 0))(
  ( (Nil!27500) (Cons!27499 (h!28708 (_ BitVec 64)) (t!40972 List!27503)) )
))
(declare-fun arrayNoDuplicates!0 (array!80246 (_ BitVec 32) List!27503) Bool)

(assert (=> b!1246559 (= res!831860 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27500))))

(declare-fun b!1246560 () Bool)

(declare-fun res!831861 () Bool)

(assert (=> b!1246560 (=> (not res!831861) (not e!706988))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246560 (= res!831861 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39236 a!3892)) (not (= newFrom!287 (size!39236 a!3892)))))))

(declare-fun b!1246561 () Bool)

(assert (=> b!1246561 (= e!706988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvslt newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41432 0))(
  ( (Unit!41433) )
))
(declare-fun lt!563129 () Unit!41432)

(declare-fun e!706986 () Unit!41432)

(assert (=> b!1246561 (= lt!563129 e!706986)))

(declare-fun c!122034 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246561 (= c!122034 (validKeyInArray!0 (select (arr!38700 a!3892) from!3270)))))

(declare-fun b!1246562 () Bool)

(declare-fun lt!563130 () Unit!41432)

(assert (=> b!1246562 (= e!706986 lt!563130)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80246 List!27503 List!27503 (_ BitVec 32)) Unit!41432)

(assert (=> b!1246562 (= lt!563130 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27499 (select (arr!38700 a!3892) from!3270) Nil!27500) Nil!27500 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246562 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27500)))

(declare-fun b!1246563 () Bool)

(declare-fun Unit!41434 () Unit!41432)

(assert (=> b!1246563 (= e!706986 Unit!41434)))

(declare-fun res!831862 () Bool)

(assert (=> start!104454 (=> (not res!831862) (not e!706988))))

(assert (=> start!104454 (= res!831862 (and (bvslt (size!39236 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39236 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39236 a!3892))))))

(assert (=> start!104454 e!706988))

(declare-fun array_inv!29548 (array!80246) Bool)

(assert (=> start!104454 (array_inv!29548 a!3892)))

(assert (=> start!104454 true))

(assert (= (and start!104454 res!831862) b!1246559))

(assert (= (and b!1246559 res!831860) b!1246560))

(assert (= (and b!1246560 res!831861) b!1246561))

(assert (= (and b!1246561 c!122034) b!1246562))

(assert (= (and b!1246561 (not c!122034)) b!1246563))

(declare-fun m!1148369 () Bool)

(assert (=> b!1246559 m!1148369))

(declare-fun m!1148371 () Bool)

(assert (=> b!1246561 m!1148371))

(assert (=> b!1246561 m!1148371))

(declare-fun m!1148373 () Bool)

(assert (=> b!1246561 m!1148373))

(assert (=> b!1246562 m!1148371))

(declare-fun m!1148375 () Bool)

(assert (=> b!1246562 m!1148375))

(declare-fun m!1148377 () Bool)

(assert (=> b!1246562 m!1148377))

(declare-fun m!1148379 () Bool)

(assert (=> start!104454 m!1148379))

(check-sat (not start!104454) (not b!1246559) (not b!1246561) (not b!1246562))
(check-sat)
