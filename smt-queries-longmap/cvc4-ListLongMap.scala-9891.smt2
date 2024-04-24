; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117324 () Bool)

(assert start!117324)

(declare-fun res!921398 () Bool)

(declare-fun e!781665 () Bool)

(assert (=> start!117324 (=> (not res!921398) (not e!781665))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93825 0))(
  ( (array!93826 (arr!45308 (Array (_ BitVec 32) (_ BitVec 64))) (size!45859 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93825)

(assert (=> start!117324 (= res!921398 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45859 a!4094))))))

(assert (=> start!117324 e!781665))

(assert (=> start!117324 true))

(declare-fun array_inv!34589 (array!93825) Bool)

(assert (=> start!117324 (array_inv!34589 a!4094)))

(declare-fun b!1379653 () Bool)

(declare-fun e!781664 () Bool)

(assert (=> b!1379653 (= e!781665 e!781664)))

(declare-fun res!921400 () Bool)

(assert (=> b!1379653 (=> (not res!921400) (not e!781664))))

(declare-fun lt!606976 () (_ BitVec 32))

(declare-fun lt!606974 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379653 (= res!921400 (and (= lt!606976 (bvsub lt!606974 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606975 () array!93825)

(declare-fun arrayCountValidKeys!0 (array!93825 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379653 (= lt!606976 (arrayCountValidKeys!0 lt!606975 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379653 (= lt!606974 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379653 (= lt!606975 (array!93826 (store (arr!45308 a!4094) i!1451 k!2953) (size!45859 a!4094)))))

(declare-fun b!1379654 () Bool)

(declare-fun res!921399 () Bool)

(assert (=> b!1379654 (=> (not res!921399) (not e!781665))))

(assert (=> b!1379654 (= res!921399 (and (bvslt (size!45859 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45859 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379655 () Bool)

(declare-fun res!921402 () Bool)

(assert (=> b!1379655 (=> (not res!921402) (not e!781665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379655 (= res!921402 (validKeyInArray!0 (select (arr!45308 a!4094) i!1451)))))

(declare-fun b!1379656 () Bool)

(declare-fun res!921401 () Bool)

(assert (=> b!1379656 (=> (not res!921401) (not e!781665))))

(assert (=> b!1379656 (= res!921401 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379657 () Bool)

(assert (=> b!1379657 (= e!781664 (not true))))

(assert (=> b!1379657 (= (bvadd (arrayCountValidKeys!0 lt!606975 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606976) (arrayCountValidKeys!0 lt!606975 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45712 0))(
  ( (Unit!45713) )
))
(declare-fun lt!606972 () Unit!45712)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45712)

(assert (=> b!1379657 (= lt!606972 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606975 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379657 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606974) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606973 () Unit!45712)

(assert (=> b!1379657 (= lt!606973 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117324 res!921398) b!1379655))

(assert (= (and b!1379655 res!921402) b!1379656))

(assert (= (and b!1379656 res!921401) b!1379654))

(assert (= (and b!1379654 res!921399) b!1379653))

(assert (= (and b!1379653 res!921400) b!1379657))

(declare-fun m!1264539 () Bool)

(assert (=> b!1379653 m!1264539))

(declare-fun m!1264541 () Bool)

(assert (=> b!1379653 m!1264541))

(declare-fun m!1264543 () Bool)

(assert (=> b!1379653 m!1264543))

(declare-fun m!1264545 () Bool)

(assert (=> b!1379657 m!1264545))

(declare-fun m!1264547 () Bool)

(assert (=> b!1379657 m!1264547))

(declare-fun m!1264549 () Bool)

(assert (=> b!1379657 m!1264549))

(declare-fun m!1264551 () Bool)

(assert (=> b!1379657 m!1264551))

(declare-fun m!1264553 () Bool)

(assert (=> b!1379657 m!1264553))

(declare-fun m!1264555 () Bool)

(assert (=> b!1379657 m!1264555))

(declare-fun m!1264557 () Bool)

(assert (=> start!117324 m!1264557))

(declare-fun m!1264559 () Bool)

(assert (=> b!1379655 m!1264559))

(assert (=> b!1379655 m!1264559))

(declare-fun m!1264561 () Bool)

(assert (=> b!1379655 m!1264561))

(declare-fun m!1264563 () Bool)

(assert (=> b!1379656 m!1264563))

(push 1)

(assert (not b!1379656))

(assert (not start!117324))

(assert (not b!1379653))

(assert (not b!1379657))

(assert (not b!1379655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

