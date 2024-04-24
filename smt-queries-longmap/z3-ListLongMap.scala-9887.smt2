; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117298 () Bool)

(assert start!117298)

(declare-fun b!1379451 () Bool)

(declare-fun res!921199 () Bool)

(declare-fun e!781547 () Bool)

(assert (=> b!1379451 (=> (not res!921199) (not e!781547))))

(declare-datatypes ((array!93799 0))(
  ( (array!93800 (arr!45295 (Array (_ BitVec 32) (_ BitVec 64))) (size!45846 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93799)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379451 (= res!921199 (and (bvslt (size!45846 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45846 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379452 () Bool)

(declare-fun e!781546 () Bool)

(assert (=> b!1379452 (= e!781546 (not true))))

(declare-fun lt!606799 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379452 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606799) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45686 0))(
  ( (Unit!45687) )
))
(declare-fun lt!606798 () Unit!45686)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45686)

(assert (=> b!1379452 (= lt!606798 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379453 () Bool)

(declare-fun res!921197 () Bool)

(assert (=> b!1379453 (=> (not res!921197) (not e!781546))))

(assert (=> b!1379453 (= res!921197 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1379454 () Bool)

(assert (=> b!1379454 (= e!781547 e!781546)))

(declare-fun res!921201 () Bool)

(assert (=> b!1379454 (=> (not res!921201) (not e!781546))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379454 (= res!921201 (= (arrayCountValidKeys!0 (array!93800 (store (arr!45295 a!4094) i!1451 k0!2953) (size!45846 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606799 #b00000000000000000000000000000001)))))

(assert (=> b!1379454 (= lt!606799 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921200 () Bool)

(assert (=> start!117298 (=> (not res!921200) (not e!781547))))

(assert (=> start!117298 (= res!921200 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45846 a!4094))))))

(assert (=> start!117298 e!781547))

(assert (=> start!117298 true))

(declare-fun array_inv!34576 (array!93799) Bool)

(assert (=> start!117298 (array_inv!34576 a!4094)))

(declare-fun b!1379455 () Bool)

(declare-fun res!921196 () Bool)

(assert (=> b!1379455 (=> (not res!921196) (not e!781547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379455 (= res!921196 (validKeyInArray!0 (select (arr!45295 a!4094) i!1451)))))

(declare-fun b!1379456 () Bool)

(declare-fun res!921198 () Bool)

(assert (=> b!1379456 (=> (not res!921198) (not e!781547))))

(assert (=> b!1379456 (= res!921198 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117298 res!921200) b!1379455))

(assert (= (and b!1379455 res!921196) b!1379456))

(assert (= (and b!1379456 res!921198) b!1379451))

(assert (= (and b!1379451 res!921199) b!1379454))

(assert (= (and b!1379454 res!921201) b!1379453))

(assert (= (and b!1379453 res!921197) b!1379452))

(declare-fun m!1264219 () Bool)

(assert (=> b!1379455 m!1264219))

(assert (=> b!1379455 m!1264219))

(declare-fun m!1264221 () Bool)

(assert (=> b!1379455 m!1264221))

(declare-fun m!1264223 () Bool)

(assert (=> start!117298 m!1264223))

(declare-fun m!1264225 () Bool)

(assert (=> b!1379456 m!1264225))

(declare-fun m!1264227 () Bool)

(assert (=> b!1379454 m!1264227))

(declare-fun m!1264229 () Bool)

(assert (=> b!1379454 m!1264229))

(declare-fun m!1264231 () Bool)

(assert (=> b!1379454 m!1264231))

(declare-fun m!1264233 () Bool)

(assert (=> b!1379452 m!1264233))

(declare-fun m!1264235 () Bool)

(assert (=> b!1379452 m!1264235))

(declare-fun m!1264237 () Bool)

(assert (=> b!1379452 m!1264237))

(check-sat (not b!1379452) (not b!1379454) (not start!117298) (not b!1379455) (not b!1379456))
(check-sat)
