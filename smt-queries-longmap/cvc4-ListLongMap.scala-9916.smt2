; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117262 () Bool)

(assert start!117262)

(declare-fun b!1379536 () Bool)

(declare-fun res!922017 () Bool)

(declare-fun e!781496 () Bool)

(assert (=> b!1379536 (=> (not res!922017) (not e!781496))))

(declare-datatypes ((array!93812 0))(
  ( (array!93813 (arr!45305 (Array (_ BitVec 32) (_ BitVec 64))) (size!45857 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93812)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379536 (= res!922017 (and (bvslt (size!45857 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45857 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379538 () Bool)

(declare-fun res!922019 () Bool)

(assert (=> b!1379538 (=> (not res!922019) (not e!781496))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379538 (= res!922019 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379539 () Bool)

(declare-fun res!922018 () Bool)

(assert (=> b!1379539 (=> (not res!922018) (not e!781496))))

(assert (=> b!1379539 (= res!922018 (validKeyInArray!0 (select (arr!45305 a!4094) i!1451)))))

(declare-fun b!1379540 () Bool)

(declare-fun e!781498 () Bool)

(assert (=> b!1379540 (= e!781496 e!781498)))

(declare-fun res!922020 () Bool)

(assert (=> b!1379540 (=> (not res!922020) (not e!781498))))

(declare-fun lt!607493 () array!93812)

(declare-fun arrayCountValidKeys!0 (array!93812 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379540 (= res!922020 (= (arrayCountValidKeys!0 lt!607493 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(assert (=> b!1379540 (= lt!607493 (array!93813 (store (arr!45305 a!4094) i!1451 k!2953) (size!45857 a!4094)))))

(declare-fun b!1379541 () Bool)

(assert (=> b!1379541 (= e!781498 (not (= (arrayCountValidKeys!0 lt!607493 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))))

(declare-fun b!1379537 () Bool)

(declare-fun res!922022 () Bool)

(assert (=> b!1379537 (=> (not res!922022) (not e!781498))))

(assert (=> b!1379537 (= res!922022 (bvsle from!3466 #b00000000000000000000000000000000))))

(declare-fun res!922021 () Bool)

(assert (=> start!117262 (=> (not res!922021) (not e!781496))))

(assert (=> start!117262 (= res!922021 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45857 a!4094))))))

(assert (=> start!117262 e!781496))

(assert (=> start!117262 true))

(declare-fun array_inv!34538 (array!93812) Bool)

(assert (=> start!117262 (array_inv!34538 a!4094)))

(assert (= (and start!117262 res!922021) b!1379539))

(assert (= (and b!1379539 res!922018) b!1379538))

(assert (= (and b!1379538 res!922019) b!1379536))

(assert (= (and b!1379536 res!922017) b!1379540))

(assert (= (and b!1379540 res!922020) b!1379537))

(assert (= (and b!1379537 res!922022) b!1379541))

(declare-fun m!1264257 () Bool)

(assert (=> b!1379540 m!1264257))

(declare-fun m!1264259 () Bool)

(assert (=> b!1379540 m!1264259))

(declare-fun m!1264261 () Bool)

(assert (=> b!1379540 m!1264261))

(declare-fun m!1264263 () Bool)

(assert (=> b!1379539 m!1264263))

(assert (=> b!1379539 m!1264263))

(declare-fun m!1264265 () Bool)

(assert (=> b!1379539 m!1264265))

(declare-fun m!1264267 () Bool)

(assert (=> start!117262 m!1264267))

(declare-fun m!1264269 () Bool)

(assert (=> b!1379538 m!1264269))

(declare-fun m!1264271 () Bool)

(assert (=> b!1379541 m!1264271))

(declare-fun m!1264273 () Bool)

(assert (=> b!1379541 m!1264273))

(push 1)

(assert (not b!1379541))

(assert (not b!1379540))

(assert (not b!1379539))

(assert (not start!117262))

(assert (not b!1379538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

