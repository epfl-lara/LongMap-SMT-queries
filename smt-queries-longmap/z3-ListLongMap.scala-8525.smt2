; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104182 () Bool)

(assert start!104182)

(declare-fun b!1245526 () Bool)

(declare-fun e!706073 () Bool)

(declare-fun e!706074 () Bool)

(assert (=> b!1245526 (= e!706073 e!706074)))

(declare-fun res!830455 () Bool)

(assert (=> b!1245526 (=> (not res!830455) (not e!706074))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245526 (= res!830455 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41315 0))(
  ( (Unit!41316) )
))
(declare-fun lt!563121 () Unit!41315)

(declare-fun e!706075 () Unit!41315)

(assert (=> b!1245526 (= lt!563121 e!706075)))

(declare-fun c!122228 () Bool)

(declare-datatypes ((array!80073 0))(
  ( (array!80074 (arr!38624 (Array (_ BitVec 32) (_ BitVec 64))) (size!39161 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80073)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245526 (= c!122228 (validKeyInArray!0 (select (arr!38624 a!3892) from!3270)))))

(declare-fun b!1245527 () Bool)

(assert (=> b!1245527 (= e!706074 false)))

(declare-fun lt!563123 () Bool)

(declare-datatypes ((List!27440 0))(
  ( (Nil!27437) (Cons!27436 (h!28654 (_ BitVec 64)) (t!40901 List!27440)) )
))
(declare-fun arrayNoDuplicates!0 (array!80073 (_ BitVec 32) List!27440) Bool)

(assert (=> b!1245527 (= lt!563123 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27437))))

(declare-fun b!1245528 () Bool)

(declare-fun res!830457 () Bool)

(assert (=> b!1245528 (=> (not res!830457) (not e!706073))))

(assert (=> b!1245528 (= res!830457 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39161 a!3892)) (not (= newFrom!287 (size!39161 a!3892)))))))

(declare-fun b!1245529 () Bool)

(declare-fun res!830456 () Bool)

(assert (=> b!1245529 (=> (not res!830456) (not e!706073))))

(assert (=> b!1245529 (= res!830456 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27437))))

(declare-fun b!1245530 () Bool)

(declare-fun Unit!41317 () Unit!41315)

(assert (=> b!1245530 (= e!706075 Unit!41317)))

(declare-fun res!830454 () Bool)

(assert (=> start!104182 (=> (not res!830454) (not e!706073))))

(assert (=> start!104182 (= res!830454 (and (bvslt (size!39161 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39161 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39161 a!3892))))))

(assert (=> start!104182 e!706073))

(declare-fun array_inv!29562 (array!80073) Bool)

(assert (=> start!104182 (array_inv!29562 a!3892)))

(assert (=> start!104182 true))

(declare-fun b!1245531 () Bool)

(declare-fun lt!563122 () Unit!41315)

(assert (=> b!1245531 (= e!706075 lt!563122)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80073 List!27440 List!27440 (_ BitVec 32)) Unit!41315)

(assert (=> b!1245531 (= lt!563122 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27436 (select (arr!38624 a!3892) from!3270) Nil!27437) Nil!27437 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1245531 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27437)))

(assert (= (and start!104182 res!830454) b!1245529))

(assert (= (and b!1245529 res!830456) b!1245528))

(assert (= (and b!1245528 res!830457) b!1245526))

(assert (= (and b!1245526 c!122228) b!1245531))

(assert (= (and b!1245526 (not c!122228)) b!1245530))

(assert (= (and b!1245526 res!830455) b!1245527))

(declare-fun m!1148191 () Bool)

(assert (=> b!1245527 m!1148191))

(declare-fun m!1148193 () Bool)

(assert (=> start!104182 m!1148193))

(declare-fun m!1148195 () Bool)

(assert (=> b!1245529 m!1148195))

(declare-fun m!1148197 () Bool)

(assert (=> b!1245531 m!1148197))

(declare-fun m!1148199 () Bool)

(assert (=> b!1245531 m!1148199))

(assert (=> b!1245531 m!1148191))

(assert (=> b!1245526 m!1148197))

(assert (=> b!1245526 m!1148197))

(declare-fun m!1148201 () Bool)

(assert (=> b!1245526 m!1148201))

(check-sat (not b!1245527) (not start!104182) (not b!1245531) (not b!1245529) (not b!1245526))
(check-sat)
