; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117420 () Bool)

(assert start!117420)

(declare-fun b!1380400 () Bool)

(declare-fun e!782077 () Bool)

(declare-fun e!782078 () Bool)

(assert (=> b!1380400 (= e!782077 e!782078)))

(declare-fun res!922149 () Bool)

(assert (=> b!1380400 (=> (not res!922149) (not e!782078))))

(declare-fun lt!607606 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607604 () (_ BitVec 32))

(assert (=> b!1380400 (= res!922149 (and (= lt!607606 (bvsub lt!607604 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93921 0))(
  ( (array!93922 (arr!45356 (Array (_ BitVec 32) (_ BitVec 64))) (size!45907 (_ BitVec 32))) )
))
(declare-fun lt!607603 () array!93921)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93921 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380400 (= lt!607606 (arrayCountValidKeys!0 lt!607603 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93921)

(assert (=> b!1380400 (= lt!607604 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1380400 (= lt!607603 (array!93922 (store (arr!45356 a!4094) i!1451 k!2953) (size!45907 a!4094)))))

(declare-fun b!1380402 () Bool)

(declare-fun res!922148 () Bool)

(assert (=> b!1380402 (=> (not res!922148) (not e!782077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380402 (= res!922148 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380403 () Bool)

(declare-fun res!922147 () Bool)

(assert (=> b!1380403 (=> (not res!922147) (not e!782077))))

(assert (=> b!1380403 (= res!922147 (and (bvslt (size!45907 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45907 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380404 () Bool)

(assert (=> b!1380404 (= e!782078 (not true))))

(assert (=> b!1380404 (= (bvadd (arrayCountValidKeys!0 lt!607603 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607606) (arrayCountValidKeys!0 lt!607603 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45772 0))(
  ( (Unit!45773) )
))
(declare-fun lt!607605 () Unit!45772)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45772)

(assert (=> b!1380404 (= lt!607605 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607603 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1380404 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607604) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607602 () Unit!45772)

(assert (=> b!1380404 (= lt!607602 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380401 () Bool)

(declare-fun res!922145 () Bool)

(assert (=> b!1380401 (=> (not res!922145) (not e!782077))))

(assert (=> b!1380401 (= res!922145 (validKeyInArray!0 (select (arr!45356 a!4094) i!1451)))))

(declare-fun res!922146 () Bool)

(assert (=> start!117420 (=> (not res!922146) (not e!782077))))

(assert (=> start!117420 (= res!922146 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45907 a!4094))))))

(assert (=> start!117420 e!782077))

(assert (=> start!117420 true))

(declare-fun array_inv!34637 (array!93921) Bool)

(assert (=> start!117420 (array_inv!34637 a!4094)))

(assert (= (and start!117420 res!922146) b!1380401))

(assert (= (and b!1380401 res!922145) b!1380402))

(assert (= (and b!1380402 res!922148) b!1380403))

(assert (= (and b!1380403 res!922147) b!1380400))

(assert (= (and b!1380400 res!922149) b!1380404))

(declare-fun m!1265607 () Bool)

(assert (=> b!1380404 m!1265607))

(declare-fun m!1265609 () Bool)

(assert (=> b!1380404 m!1265609))

(declare-fun m!1265611 () Bool)

(assert (=> b!1380404 m!1265611))

(declare-fun m!1265613 () Bool)

(assert (=> b!1380404 m!1265613))

(declare-fun m!1265615 () Bool)

(assert (=> b!1380404 m!1265615))

(declare-fun m!1265617 () Bool)

(assert (=> b!1380404 m!1265617))

(declare-fun m!1265619 () Bool)

(assert (=> b!1380400 m!1265619))

(declare-fun m!1265621 () Bool)

(assert (=> b!1380400 m!1265621))

(declare-fun m!1265623 () Bool)

(assert (=> b!1380400 m!1265623))

(declare-fun m!1265625 () Bool)

(assert (=> b!1380402 m!1265625))

(declare-fun m!1265627 () Bool)

(assert (=> start!117420 m!1265627))

(declare-fun m!1265629 () Bool)

(assert (=> b!1380401 m!1265629))

(assert (=> b!1380401 m!1265629))

(declare-fun m!1265631 () Bool)

(assert (=> b!1380401 m!1265631))

(push 1)

(assert (not b!1380404))

(assert (not b!1380402))

(assert (not start!117420))

(assert (not b!1380400))

(assert (not b!1380401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

