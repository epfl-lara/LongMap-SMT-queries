; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114118 () Bool)

(assert start!114118)

(declare-fun b!1355330 () Bool)

(declare-fun res!900275 () Bool)

(declare-fun e!769710 () Bool)

(assert (=> b!1355330 (=> (not res!900275) (not e!769710))))

(declare-datatypes ((List!31639 0))(
  ( (Nil!31636) (Cons!31635 (h!32844 (_ BitVec 64)) (t!46297 List!31639)) )
))
(declare-fun acc!759 () List!31639)

(declare-datatypes ((array!92300 0))(
  ( (array!92301 (arr!44598 (Array (_ BitVec 32) (_ BitVec 64))) (size!45148 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92300)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92300 (_ BitVec 32) List!31639) Bool)

(assert (=> b!1355330 (= res!900275 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355331 () Bool)

(declare-datatypes ((Unit!44535 0))(
  ( (Unit!44536) )
))
(declare-fun e!769711 () Unit!44535)

(declare-fun lt!598584 () Unit!44535)

(assert (=> b!1355331 (= e!769711 lt!598584)))

(declare-fun lt!598588 () Unit!44535)

(declare-fun lemmaListSubSeqRefl!0 (List!31639) Unit!44535)

(assert (=> b!1355331 (= lt!598588 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!768 (List!31639 List!31639) Bool)

(assert (=> b!1355331 (subseq!768 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92300 List!31639 List!31639 (_ BitVec 32)) Unit!44535)

(declare-fun $colon$colon!783 (List!31639 (_ BitVec 64)) List!31639)

(assert (=> b!1355331 (= lt!598584 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!783 acc!759 (select (arr!44598 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355331 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355332 () Bool)

(declare-fun e!769708 () Bool)

(assert (=> b!1355332 (= e!769710 e!769708)))

(declare-fun res!900283 () Bool)

(assert (=> b!1355332 (=> (not res!900283) (not e!769708))))

(declare-fun lt!598586 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355332 (= res!900283 (and (not (= from!3120 i!1404)) (not lt!598586) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598587 () Unit!44535)

(assert (=> b!1355332 (= lt!598587 e!769711)))

(declare-fun c!126968 () Bool)

(assert (=> b!1355332 (= c!126968 lt!598586)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355332 (= lt!598586 (validKeyInArray!0 (select (arr!44598 a!3742) from!3120)))))

(declare-fun b!1355333 () Bool)

(declare-fun Unit!44537 () Unit!44535)

(assert (=> b!1355333 (= e!769711 Unit!44537)))

(declare-fun b!1355334 () Bool)

(declare-fun res!900277 () Bool)

(assert (=> b!1355334 (=> (not res!900277) (not e!769710))))

(declare-fun noDuplicate!2205 (List!31639) Bool)

(assert (=> b!1355334 (= res!900277 (noDuplicate!2205 acc!759))))

(declare-fun b!1355335 () Bool)

(declare-fun res!900281 () Bool)

(assert (=> b!1355335 (=> (not res!900281) (not e!769710))))

(declare-fun contains!9348 (List!31639 (_ BitVec 64)) Bool)

(assert (=> b!1355335 (= res!900281 (not (contains!9348 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355336 () Bool)

(declare-fun res!900276 () Bool)

(assert (=> b!1355336 (=> (not res!900276) (not e!769710))))

(assert (=> b!1355336 (= res!900276 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45148 a!3742)))))

(declare-fun res!900278 () Bool)

(assert (=> start!114118 (=> (not res!900278) (not e!769710))))

(assert (=> start!114118 (= res!900278 (and (bvslt (size!45148 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45148 a!3742))))))

(assert (=> start!114118 e!769710))

(assert (=> start!114118 true))

(declare-fun array_inv!33626 (array!92300) Bool)

(assert (=> start!114118 (array_inv!33626 a!3742)))

(declare-fun b!1355337 () Bool)

(declare-fun res!900280 () Bool)

(assert (=> b!1355337 (=> (not res!900280) (not e!769710))))

(assert (=> b!1355337 (= res!900280 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31636))))

(declare-fun b!1355338 () Bool)

(declare-fun res!900282 () Bool)

(assert (=> b!1355338 (=> (not res!900282) (not e!769710))))

(assert (=> b!1355338 (= res!900282 (not (contains!9348 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355339 () Bool)

(declare-fun res!900279 () Bool)

(assert (=> b!1355339 (=> (not res!900279) (not e!769710))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355339 (= res!900279 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355340 () Bool)

(declare-fun res!900274 () Bool)

(assert (=> b!1355340 (=> (not res!900274) (not e!769710))))

(assert (=> b!1355340 (= res!900274 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45148 a!3742))))))

(declare-fun b!1355341 () Bool)

(assert (=> b!1355341 (= e!769708 false)))

(declare-fun lt!598585 () Bool)

(assert (=> b!1355341 (= lt!598585 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114118 res!900278) b!1355334))

(assert (= (and b!1355334 res!900277) b!1355338))

(assert (= (and b!1355338 res!900282) b!1355335))

(assert (= (and b!1355335 res!900281) b!1355337))

(assert (= (and b!1355337 res!900280) b!1355330))

(assert (= (and b!1355330 res!900275) b!1355340))

(assert (= (and b!1355340 res!900274) b!1355339))

(assert (= (and b!1355339 res!900279) b!1355336))

(assert (= (and b!1355336 res!900276) b!1355332))

(assert (= (and b!1355332 c!126968) b!1355331))

(assert (= (and b!1355332 (not c!126968)) b!1355333))

(assert (= (and b!1355332 res!900283) b!1355341))

(declare-fun m!1241537 () Bool)

(assert (=> b!1355332 m!1241537))

(assert (=> b!1355332 m!1241537))

(declare-fun m!1241539 () Bool)

(assert (=> b!1355332 m!1241539))

(declare-fun m!1241541 () Bool)

(assert (=> b!1355330 m!1241541))

(declare-fun m!1241543 () Bool)

(assert (=> b!1355338 m!1241543))

(declare-fun m!1241545 () Bool)

(assert (=> b!1355334 m!1241545))

(declare-fun m!1241547 () Bool)

(assert (=> b!1355331 m!1241547))

(assert (=> b!1355331 m!1241537))

(declare-fun m!1241549 () Bool)

(assert (=> b!1355331 m!1241549))

(declare-fun m!1241551 () Bool)

(assert (=> b!1355331 m!1241551))

(declare-fun m!1241553 () Bool)

(assert (=> b!1355331 m!1241553))

(assert (=> b!1355331 m!1241537))

(assert (=> b!1355331 m!1241549))

(declare-fun m!1241555 () Bool)

(assert (=> b!1355331 m!1241555))

(declare-fun m!1241557 () Bool)

(assert (=> b!1355339 m!1241557))

(declare-fun m!1241559 () Bool)

(assert (=> start!114118 m!1241559))

(declare-fun m!1241561 () Bool)

(assert (=> b!1355335 m!1241561))

(declare-fun m!1241563 () Bool)

(assert (=> b!1355337 m!1241563))

(assert (=> b!1355341 m!1241553))

(check-sat (not b!1355330) (not b!1355337) (not b!1355334) (not b!1355331) (not b!1355338) (not b!1355339) (not b!1355341) (not b!1355335) (not b!1355332) (not start!114118))
(check-sat)
