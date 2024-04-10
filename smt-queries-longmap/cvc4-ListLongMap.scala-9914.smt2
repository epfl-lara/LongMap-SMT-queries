; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117256 () Bool)

(assert start!117256)

(declare-fun b!1379533 () Bool)

(declare-fun res!921971 () Bool)

(declare-fun e!781491 () Bool)

(assert (=> b!1379533 (=> (not res!921971) (not e!781491))))

(declare-datatypes ((array!93852 0))(
  ( (array!93853 (arr!45325 (Array (_ BitVec 32) (_ BitVec 64))) (size!45875 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93852)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379533 (= res!921971 (and (bvslt (size!45875 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45875 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379534 () Bool)

(declare-fun e!781490 () Bool)

(assert (=> b!1379534 (= e!781490 true)))

(declare-fun lt!607645 () array!93852)

(declare-fun arrayCountValidKeys!0 (array!93852 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379534 (= (arrayCountValidKeys!0 lt!607645 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-datatypes ((Unit!45877 0))(
  ( (Unit!45878) )
))
(declare-fun lt!607651 () Unit!45877)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93852 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45877)

(assert (=> b!1379534 (= lt!607651 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379535 () Bool)

(declare-fun e!781493 () Bool)

(assert (=> b!1379535 (= e!781493 (not e!781490))))

(declare-fun res!921975 () Bool)

(assert (=> b!1379535 (=> res!921975 e!781490)))

(declare-fun lt!607649 () (_ BitVec 32))

(declare-fun lt!607650 () (_ BitVec 32))

(assert (=> b!1379535 (= res!921975 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45875 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607649 (bvsub lt!607650 #b00000000000000000000000000000001)))))))

(declare-fun lt!607646 () (_ BitVec 32))

(declare-fun lt!607644 () (_ BitVec 32))

(assert (=> b!1379535 (= (bvadd lt!607646 lt!607644) lt!607649)))

(assert (=> b!1379535 (= lt!607649 (arrayCountValidKeys!0 lt!607645 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379535 (= lt!607646 (arrayCountValidKeys!0 lt!607645 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607653 () Unit!45877)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45877)

(assert (=> b!1379535 (= lt!607653 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607645 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607652 () (_ BitVec 32))

(declare-fun lt!607648 () (_ BitVec 32))

(assert (=> b!1379535 (= (bvadd lt!607652 lt!607648) lt!607650)))

(assert (=> b!1379535 (= lt!607650 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379535 (= lt!607652 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607647 () Unit!45877)

(assert (=> b!1379535 (= lt!607647 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379536 () Bool)

(declare-fun res!921974 () Bool)

(assert (=> b!1379536 (=> (not res!921974) (not e!781491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379536 (= res!921974 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379537 () Bool)

(assert (=> b!1379537 (= e!781491 e!781493)))

(declare-fun res!921976 () Bool)

(assert (=> b!1379537 (=> (not res!921976) (not e!781493))))

(assert (=> b!1379537 (= res!921976 (and (= lt!607644 (bvsub lt!607648 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379537 (= lt!607644 (arrayCountValidKeys!0 lt!607645 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379537 (= lt!607648 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379537 (= lt!607645 (array!93853 (store (arr!45325 a!4094) i!1451 k!2953) (size!45875 a!4094)))))

(declare-fun res!921972 () Bool)

(assert (=> start!117256 (=> (not res!921972) (not e!781491))))

(assert (=> start!117256 (= res!921972 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45875 a!4094))))))

(assert (=> start!117256 e!781491))

(assert (=> start!117256 true))

(declare-fun array_inv!34353 (array!93852) Bool)

(assert (=> start!117256 (array_inv!34353 a!4094)))

(declare-fun b!1379538 () Bool)

(declare-fun res!921973 () Bool)

(assert (=> b!1379538 (=> (not res!921973) (not e!781491))))

(assert (=> b!1379538 (= res!921973 (validKeyInArray!0 (select (arr!45325 a!4094) i!1451)))))

(assert (= (and start!117256 res!921972) b!1379538))

(assert (= (and b!1379538 res!921973) b!1379536))

(assert (= (and b!1379536 res!921974) b!1379533))

(assert (= (and b!1379533 res!921971) b!1379537))

(assert (= (and b!1379537 res!921976) b!1379535))

(assert (= (and b!1379535 (not res!921975)) b!1379534))

(declare-fun m!1264669 () Bool)

(assert (=> b!1379537 m!1264669))

(declare-fun m!1264671 () Bool)

(assert (=> b!1379537 m!1264671))

(declare-fun m!1264673 () Bool)

(assert (=> b!1379537 m!1264673))

(declare-fun m!1264675 () Bool)

(assert (=> b!1379534 m!1264675))

(declare-fun m!1264677 () Bool)

(assert (=> b!1379534 m!1264677))

(declare-fun m!1264679 () Bool)

(assert (=> b!1379534 m!1264679))

(declare-fun m!1264681 () Bool)

(assert (=> b!1379536 m!1264681))

(declare-fun m!1264683 () Bool)

(assert (=> start!117256 m!1264683))

(declare-fun m!1264685 () Bool)

(assert (=> b!1379535 m!1264685))

(declare-fun m!1264687 () Bool)

(assert (=> b!1379535 m!1264687))

(declare-fun m!1264689 () Bool)

(assert (=> b!1379535 m!1264689))

(declare-fun m!1264691 () Bool)

(assert (=> b!1379535 m!1264691))

(declare-fun m!1264693 () Bool)

(assert (=> b!1379535 m!1264693))

(declare-fun m!1264695 () Bool)

(assert (=> b!1379535 m!1264695))

(declare-fun m!1264697 () Bool)

(assert (=> b!1379538 m!1264697))

(assert (=> b!1379538 m!1264697))

(declare-fun m!1264699 () Bool)

(assert (=> b!1379538 m!1264699))

(push 1)

(assert (not b!1379537))

(assert (not start!117256))

(assert (not b!1379534))

(assert (not b!1379535))

(assert (not b!1379536))

(assert (not b!1379538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

