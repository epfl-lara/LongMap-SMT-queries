; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117264 () Bool)

(assert start!117264)

(declare-fun b!1379587 () Bool)

(declare-fun e!781520 () Bool)

(declare-fun e!781519 () Bool)

(assert (=> b!1379587 (= e!781520 e!781519)))

(declare-fun res!922028 () Bool)

(assert (=> b!1379587 (=> (not res!922028) (not e!781519))))

(declare-datatypes ((array!93860 0))(
  ( (array!93861 (arr!45329 (Array (_ BitVec 32) (_ BitVec 64))) (size!45879 (_ BitVec 32))) )
))
(declare-fun lt!607674 () array!93860)

(declare-fun a!4094 () array!93860)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93860 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379587 (= res!922028 (= (arrayCountValidKeys!0 lt!607674 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379587 (= lt!607674 (array!93861 (store (arr!45329 a!4094) i!1451 k!2953) (size!45879 a!4094)))))

(declare-fun b!1379588 () Bool)

(declare-fun res!922026 () Bool)

(assert (=> b!1379588 (=> (not res!922026) (not e!781520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379588 (= res!922026 (validKeyInArray!0 (select (arr!45329 a!4094) i!1451)))))

(declare-fun b!1379589 () Bool)

(declare-fun res!922030 () Bool)

(assert (=> b!1379589 (=> (not res!922030) (not e!781520))))

(assert (=> b!1379589 (= res!922030 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379590 () Bool)

(declare-fun res!922025 () Bool)

(assert (=> b!1379590 (=> (not res!922025) (not e!781520))))

(assert (=> b!1379590 (= res!922025 (and (bvslt (size!45879 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45879 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!922027 () Bool)

(assert (=> start!117264 (=> (not res!922027) (not e!781520))))

(assert (=> start!117264 (= res!922027 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45879 a!4094))))))

(assert (=> start!117264 e!781520))

(assert (=> start!117264 true))

(declare-fun array_inv!34357 (array!93860) Bool)

(assert (=> start!117264 (array_inv!34357 a!4094)))

(declare-fun b!1379591 () Bool)

(assert (=> b!1379591 (= e!781519 (not (= (arrayCountValidKeys!0 lt!607674 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))))

(declare-fun b!1379592 () Bool)

(declare-fun res!922029 () Bool)

(assert (=> b!1379592 (=> (not res!922029) (not e!781519))))

(assert (=> b!1379592 (= res!922029 (bvsle from!3466 #b00000000000000000000000000000000))))

(assert (= (and start!117264 res!922027) b!1379588))

(assert (= (and b!1379588 res!922026) b!1379589))

(assert (= (and b!1379589 res!922030) b!1379590))

(assert (= (and b!1379590 res!922025) b!1379587))

(assert (= (and b!1379587 res!922028) b!1379592))

(assert (= (and b!1379592 res!922029) b!1379591))

(declare-fun m!1264743 () Bool)

(assert (=> start!117264 m!1264743))

(declare-fun m!1264745 () Bool)

(assert (=> b!1379587 m!1264745))

(declare-fun m!1264747 () Bool)

(assert (=> b!1379587 m!1264747))

(declare-fun m!1264749 () Bool)

(assert (=> b!1379587 m!1264749))

(declare-fun m!1264751 () Bool)

(assert (=> b!1379589 m!1264751))

(declare-fun m!1264753 () Bool)

(assert (=> b!1379591 m!1264753))

(declare-fun m!1264755 () Bool)

(assert (=> b!1379591 m!1264755))

(declare-fun m!1264757 () Bool)

(assert (=> b!1379588 m!1264757))

(assert (=> b!1379588 m!1264757))

(declare-fun m!1264759 () Bool)

(assert (=> b!1379588 m!1264759))

(push 1)

(assert (not b!1379587))

(assert (not b!1379591))

(assert (not b!1379589))

(assert (not b!1379588))

(assert (not start!117264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

