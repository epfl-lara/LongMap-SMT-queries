; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117316 () Bool)

(assert start!117316)

(declare-fun res!921341 () Bool)

(declare-fun e!781629 () Bool)

(assert (=> start!117316 (=> (not res!921341) (not e!781629))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93817 0))(
  ( (array!93818 (arr!45304 (Array (_ BitVec 32) (_ BitVec 64))) (size!45855 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93817)

(assert (=> start!117316 (= res!921341 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45855 a!4094))))))

(assert (=> start!117316 e!781629))

(assert (=> start!117316 true))

(declare-fun array_inv!34585 (array!93817) Bool)

(assert (=> start!117316 (array_inv!34585 a!4094)))

(declare-fun b!1379593 () Bool)

(declare-fun e!781628 () Bool)

(assert (=> b!1379593 (= e!781629 e!781628)))

(declare-fun res!921339 () Bool)

(assert (=> b!1379593 (=> (not res!921339) (not e!781628))))

(declare-fun lt!606912 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606916 () (_ BitVec 32))

(assert (=> b!1379593 (= res!921339 (and (= lt!606916 (bvsub lt!606912 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606913 () array!93817)

(declare-fun arrayCountValidKeys!0 (array!93817 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379593 (= lt!606916 (arrayCountValidKeys!0 lt!606913 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379593 (= lt!606912 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379593 (= lt!606913 (array!93818 (store (arr!45304 a!4094) i!1451 k0!2953) (size!45855 a!4094)))))

(declare-fun b!1379594 () Bool)

(declare-fun res!921340 () Bool)

(assert (=> b!1379594 (=> (not res!921340) (not e!781629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379594 (= res!921340 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379595 () Bool)

(assert (=> b!1379595 (= e!781628 (not true))))

(assert (=> b!1379595 (= (bvadd (arrayCountValidKeys!0 lt!606913 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606916) (arrayCountValidKeys!0 lt!606913 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45704 0))(
  ( (Unit!45705) )
))
(declare-fun lt!606915 () Unit!45704)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45704)

(assert (=> b!1379595 (= lt!606915 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606913 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379595 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606912) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606914 () Unit!45704)

(assert (=> b!1379595 (= lt!606914 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379596 () Bool)

(declare-fun res!921342 () Bool)

(assert (=> b!1379596 (=> (not res!921342) (not e!781629))))

(assert (=> b!1379596 (= res!921342 (validKeyInArray!0 (select (arr!45304 a!4094) i!1451)))))

(declare-fun b!1379597 () Bool)

(declare-fun res!921338 () Bool)

(assert (=> b!1379597 (=> (not res!921338) (not e!781629))))

(assert (=> b!1379597 (= res!921338 (and (bvslt (size!45855 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45855 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117316 res!921341) b!1379596))

(assert (= (and b!1379596 res!921342) b!1379594))

(assert (= (and b!1379594 res!921340) b!1379597))

(assert (= (and b!1379597 res!921338) b!1379593))

(assert (= (and b!1379593 res!921339) b!1379595))

(declare-fun m!1264435 () Bool)

(assert (=> b!1379596 m!1264435))

(assert (=> b!1379596 m!1264435))

(declare-fun m!1264437 () Bool)

(assert (=> b!1379596 m!1264437))

(declare-fun m!1264439 () Bool)

(assert (=> b!1379594 m!1264439))

(declare-fun m!1264441 () Bool)

(assert (=> b!1379595 m!1264441))

(declare-fun m!1264443 () Bool)

(assert (=> b!1379595 m!1264443))

(declare-fun m!1264445 () Bool)

(assert (=> b!1379595 m!1264445))

(declare-fun m!1264447 () Bool)

(assert (=> b!1379595 m!1264447))

(declare-fun m!1264449 () Bool)

(assert (=> b!1379595 m!1264449))

(declare-fun m!1264451 () Bool)

(assert (=> b!1379595 m!1264451))

(declare-fun m!1264453 () Bool)

(assert (=> start!117316 m!1264453))

(declare-fun m!1264455 () Bool)

(assert (=> b!1379593 m!1264455))

(declare-fun m!1264457 () Bool)

(assert (=> b!1379593 m!1264457))

(declare-fun m!1264459 () Bool)

(assert (=> b!1379593 m!1264459))

(check-sat (not start!117316) (not b!1379596) (not b!1379594) (not b!1379593) (not b!1379595))
(check-sat)
