; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117252 () Bool)

(assert start!117252)

(declare-fun b!1379497 () Bool)

(declare-fun e!781467 () Bool)

(declare-fun e!781466 () Bool)

(assert (=> b!1379497 (= e!781467 e!781466)))

(declare-fun res!921938 () Bool)

(assert (=> b!1379497 (=> (not res!921938) (not e!781466))))

(declare-fun lt!607584 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607593 () (_ BitVec 32))

(assert (=> b!1379497 (= res!921938 (and (= lt!607593 (bvsub lt!607584 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93848 0))(
  ( (array!93849 (arr!45323 (Array (_ BitVec 32) (_ BitVec 64))) (size!45873 (_ BitVec 32))) )
))
(declare-fun lt!607591 () array!93848)

(declare-fun arrayCountValidKeys!0 (array!93848 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379497 (= lt!607593 (arrayCountValidKeys!0 lt!607591 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93848)

(assert (=> b!1379497 (= lt!607584 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379497 (= lt!607591 (array!93849 (store (arr!45323 a!4094) i!1451 k!2953) (size!45873 a!4094)))))

(declare-fun b!1379498 () Bool)

(declare-fun res!921937 () Bool)

(assert (=> b!1379498 (=> (not res!921937) (not e!781467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379498 (= res!921937 (validKeyInArray!0 (select (arr!45323 a!4094) i!1451)))))

(declare-fun b!1379499 () Bool)

(declare-fun res!921939 () Bool)

(assert (=> b!1379499 (=> (not res!921939) (not e!781467))))

(assert (=> b!1379499 (= res!921939 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379500 () Bool)

(declare-fun e!781469 () Bool)

(assert (=> b!1379500 (= e!781466 (not e!781469))))

(declare-fun res!921936 () Bool)

(assert (=> b!1379500 (=> res!921936 e!781469)))

(declare-fun lt!607588 () (_ BitVec 32))

(declare-fun lt!607589 () (_ BitVec 32))

(assert (=> b!1379500 (= res!921936 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45873 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607588 (bvsub lt!607589 #b00000000000000000000000000000001)))))))

(declare-fun lt!607585 () (_ BitVec 32))

(assert (=> b!1379500 (= (bvadd lt!607585 lt!607593) lt!607588)))

(assert (=> b!1379500 (= lt!607588 (arrayCountValidKeys!0 lt!607591 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379500 (= lt!607585 (arrayCountValidKeys!0 lt!607591 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45873 0))(
  ( (Unit!45874) )
))
(declare-fun lt!607590 () Unit!45873)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45873)

(assert (=> b!1379500 (= lt!607590 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607591 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607592 () (_ BitVec 32))

(assert (=> b!1379500 (= (bvadd lt!607592 lt!607584) lt!607589)))

(assert (=> b!1379500 (= lt!607589 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379500 (= lt!607592 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607587 () Unit!45873)

(assert (=> b!1379500 (= lt!607587 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379501 () Bool)

(declare-fun res!921940 () Bool)

(assert (=> b!1379501 (=> (not res!921940) (not e!781467))))

(assert (=> b!1379501 (= res!921940 (and (bvslt (size!45873 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45873 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379502 () Bool)

(assert (=> b!1379502 (= e!781469 true)))

(assert (=> b!1379502 (= (arrayCountValidKeys!0 lt!607591 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607586 () Unit!45873)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93848 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45873)

(assert (=> b!1379502 (= lt!607586 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun res!921935 () Bool)

(assert (=> start!117252 (=> (not res!921935) (not e!781467))))

(assert (=> start!117252 (= res!921935 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45873 a!4094))))))

(assert (=> start!117252 e!781467))

(assert (=> start!117252 true))

(declare-fun array_inv!34351 (array!93848) Bool)

(assert (=> start!117252 (array_inv!34351 a!4094)))

(assert (= (and start!117252 res!921935) b!1379498))

(assert (= (and b!1379498 res!921937) b!1379499))

(assert (= (and b!1379499 res!921939) b!1379501))

(assert (= (and b!1379501 res!921940) b!1379497))

(assert (= (and b!1379497 res!921938) b!1379500))

(assert (= (and b!1379500 (not res!921936)) b!1379502))

(declare-fun m!1264605 () Bool)

(assert (=> b!1379500 m!1264605))

(declare-fun m!1264607 () Bool)

(assert (=> b!1379500 m!1264607))

(declare-fun m!1264609 () Bool)

(assert (=> b!1379500 m!1264609))

(declare-fun m!1264611 () Bool)

(assert (=> b!1379500 m!1264611))

(declare-fun m!1264613 () Bool)

(assert (=> b!1379500 m!1264613))

(declare-fun m!1264615 () Bool)

(assert (=> b!1379500 m!1264615))

(declare-fun m!1264617 () Bool)

(assert (=> b!1379502 m!1264617))

(declare-fun m!1264619 () Bool)

(assert (=> b!1379502 m!1264619))

(declare-fun m!1264621 () Bool)

(assert (=> b!1379502 m!1264621))

(declare-fun m!1264623 () Bool)

(assert (=> start!117252 m!1264623))

(declare-fun m!1264625 () Bool)

(assert (=> b!1379498 m!1264625))

(assert (=> b!1379498 m!1264625))

(declare-fun m!1264627 () Bool)

(assert (=> b!1379498 m!1264627))

(declare-fun m!1264629 () Bool)

(assert (=> b!1379499 m!1264629))

(declare-fun m!1264631 () Bool)

(assert (=> b!1379497 m!1264631))

(declare-fun m!1264633 () Bool)

(assert (=> b!1379497 m!1264633))

(declare-fun m!1264635 () Bool)

(assert (=> b!1379497 m!1264635))

(push 1)

(assert (not b!1379502))

(assert (not b!1379500))

(assert (not b!1379497))

(assert (not b!1379499))

(assert (not start!117252))

