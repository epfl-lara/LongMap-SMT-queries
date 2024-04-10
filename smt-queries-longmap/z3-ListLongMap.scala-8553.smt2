; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104448 () Bool)

(assert start!104448)

(declare-fun res!831834 () Bool)

(declare-fun e!706959 () Bool)

(assert (=> start!104448 (=> (not res!831834) (not e!706959))))

(declare-datatypes ((array!80240 0))(
  ( (array!80241 (arr!38697 (Array (_ BitVec 32) (_ BitVec 64))) (size!39233 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80240)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104448 (= res!831834 (and (bvslt (size!39233 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39233 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39233 a!3892))))))

(assert (=> start!104448 e!706959))

(declare-fun array_inv!29545 (array!80240) Bool)

(assert (=> start!104448 (array_inv!29545 a!3892)))

(assert (=> start!104448 true))

(declare-fun b!1246514 () Bool)

(declare-fun res!831835 () Bool)

(assert (=> b!1246514 (=> (not res!831835) (not e!706959))))

(assert (=> b!1246514 (= res!831835 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39233 a!3892)) (not (= newFrom!287 (size!39233 a!3892)))))))

(declare-fun b!1246515 () Bool)

(declare-fun res!831833 () Bool)

(assert (=> b!1246515 (=> (not res!831833) (not e!706959))))

(declare-datatypes ((List!27500 0))(
  ( (Nil!27497) (Cons!27496 (h!28705 (_ BitVec 64)) (t!40969 List!27500)) )
))
(declare-fun arrayNoDuplicates!0 (array!80240 (_ BitVec 32) List!27500) Bool)

(assert (=> b!1246515 (= res!831833 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27497))))

(declare-fun b!1246516 () Bool)

(declare-datatypes ((Unit!41423 0))(
  ( (Unit!41424) )
))
(declare-fun e!706960 () Unit!41423)

(declare-fun Unit!41425 () Unit!41423)

(assert (=> b!1246516 (= e!706960 Unit!41425)))

(declare-fun b!1246517 () Bool)

(assert (=> b!1246517 (= e!706959 false)))

(declare-fun lt!563111 () Unit!41423)

(assert (=> b!1246517 (= lt!563111 e!706960)))

(declare-fun c!122025 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246517 (= c!122025 (validKeyInArray!0 (select (arr!38697 a!3892) from!3270)))))

(declare-fun b!1246518 () Bool)

(declare-fun lt!563112 () Unit!41423)

(assert (=> b!1246518 (= e!706960 lt!563112)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80240 List!27500 List!27500 (_ BitVec 32)) Unit!41423)

(assert (=> b!1246518 (= lt!563112 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27496 (select (arr!38697 a!3892) from!3270) Nil!27497) Nil!27497 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246518 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27497)))

(assert (= (and start!104448 res!831834) b!1246515))

(assert (= (and b!1246515 res!831833) b!1246514))

(assert (= (and b!1246514 res!831835) b!1246517))

(assert (= (and b!1246517 c!122025) b!1246518))

(assert (= (and b!1246517 (not c!122025)) b!1246516))

(declare-fun m!1148333 () Bool)

(assert (=> start!104448 m!1148333))

(declare-fun m!1148335 () Bool)

(assert (=> b!1246515 m!1148335))

(declare-fun m!1148337 () Bool)

(assert (=> b!1246517 m!1148337))

(assert (=> b!1246517 m!1148337))

(declare-fun m!1148339 () Bool)

(assert (=> b!1246517 m!1148339))

(assert (=> b!1246518 m!1148337))

(declare-fun m!1148341 () Bool)

(assert (=> b!1246518 m!1148341))

(declare-fun m!1148343 () Bool)

(assert (=> b!1246518 m!1148343))

(check-sat (not b!1246518) (not start!104448) (not b!1246515) (not b!1246517))
