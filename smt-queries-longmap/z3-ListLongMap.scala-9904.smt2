; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117400 () Bool)

(assert start!117400)

(declare-fun b!1380234 () Bool)

(declare-fun res!921980 () Bool)

(declare-fun e!781989 () Bool)

(assert (=> b!1380234 (=> (not res!921980) (not e!781989))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380234 (= res!921980 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1380235 () Bool)

(declare-fun res!921984 () Bool)

(assert (=> b!1380235 (=> (not res!921984) (not e!781989))))

(declare-datatypes ((array!93901 0))(
  ( (array!93902 (arr!45346 (Array (_ BitVec 32) (_ BitVec 64))) (size!45897 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93901)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1380235 (= res!921984 (validKeyInArray!0 (select (arr!45346 a!4094) i!1451)))))

(declare-fun b!1380236 () Bool)

(declare-fun e!781988 () Bool)

(assert (=> b!1380236 (= e!781989 e!781988)))

(declare-fun res!921983 () Bool)

(assert (=> b!1380236 (=> (not res!921983) (not e!781988))))

(declare-fun lt!607500 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93901 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380236 (= res!921983 (= (arrayCountValidKeys!0 (array!93902 (store (arr!45346 a!4094) i!1451 k0!2953) (size!45897 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607500 #b00000000000000000000000000000001)))))

(assert (=> b!1380236 (= lt!607500 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380237 () Bool)

(declare-fun res!921982 () Bool)

(assert (=> b!1380237 (=> (not res!921982) (not e!781989))))

(assert (=> b!1380237 (= res!921982 (and (bvslt (size!45897 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45897 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1380238 () Bool)

(assert (=> b!1380238 (= e!781988 (not true))))

(assert (=> b!1380238 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607500) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45752 0))(
  ( (Unit!45753) )
))
(declare-fun lt!607501 () Unit!45752)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45752)

(assert (=> b!1380238 (= lt!607501 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921979 () Bool)

(assert (=> start!117400 (=> (not res!921979) (not e!781989))))

(assert (=> start!117400 (= res!921979 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45897 a!4094))))))

(assert (=> start!117400 e!781989))

(assert (=> start!117400 true))

(declare-fun array_inv!34627 (array!93901) Bool)

(assert (=> start!117400 (array_inv!34627 a!4094)))

(declare-fun b!1380239 () Bool)

(declare-fun res!921981 () Bool)

(assert (=> b!1380239 (=> (not res!921981) (not e!781988))))

(assert (=> b!1380239 (= res!921981 (bvsgt from!3466 #b00000000000000000000000000000000))))

(assert (= (and start!117400 res!921979) b!1380235))

(assert (= (and b!1380235 res!921984) b!1380234))

(assert (= (and b!1380234 res!921980) b!1380237))

(assert (= (and b!1380237 res!921982) b!1380236))

(assert (= (and b!1380236 res!921983) b!1380239))

(assert (= (and b!1380239 res!921981) b!1380238))

(declare-fun m!1265383 () Bool)

(assert (=> b!1380238 m!1265383))

(declare-fun m!1265385 () Bool)

(assert (=> b!1380238 m!1265385))

(declare-fun m!1265387 () Bool)

(assert (=> b!1380238 m!1265387))

(declare-fun m!1265389 () Bool)

(assert (=> b!1380236 m!1265389))

(declare-fun m!1265391 () Bool)

(assert (=> b!1380236 m!1265391))

(declare-fun m!1265393 () Bool)

(assert (=> b!1380236 m!1265393))

(declare-fun m!1265395 () Bool)

(assert (=> b!1380235 m!1265395))

(assert (=> b!1380235 m!1265395))

(declare-fun m!1265397 () Bool)

(assert (=> b!1380235 m!1265397))

(declare-fun m!1265399 () Bool)

(assert (=> start!117400 m!1265399))

(declare-fun m!1265401 () Bool)

(assert (=> b!1380234 m!1265401))

(check-sat (not b!1380238) (not b!1380234) (not b!1380235) (not b!1380236) (not start!117400))
(check-sat)
