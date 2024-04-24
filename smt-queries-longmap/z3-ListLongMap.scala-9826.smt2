; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116872 () Bool)

(assert start!116872)

(declare-fun b!1376348 () Bool)

(declare-fun res!918620 () Bool)

(declare-fun e!779805 () Bool)

(assert (=> b!1376348 (=> (not res!918620) (not e!779805))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376348 (= res!918620 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1376349 () Bool)

(declare-fun res!918621 () Bool)

(assert (=> b!1376349 (=> (not res!918621) (not e!779805))))

(declare-datatypes ((array!93427 0))(
  ( (array!93428 (arr!45112 (Array (_ BitVec 32) (_ BitVec 64))) (size!45663 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93427)

(assert (=> b!1376349 (= res!918621 (bvslt (size!45663 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918619 () Bool)

(assert (=> start!116872 (=> (not res!918619) (not e!779805))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> start!116872 (= res!918619 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45663 a!4142))))))

(assert (=> start!116872 e!779805))

(assert (=> start!116872 true))

(declare-fun array_inv!34393 (array!93427) Bool)

(assert (=> start!116872 (array_inv!34393 a!4142)))

(declare-fun b!1376347 () Bool)

(declare-fun res!918618 () Bool)

(assert (=> b!1376347 (=> (not res!918618) (not e!779805))))

(assert (=> b!1376347 (= res!918618 (validKeyInArray!0 (select (arr!45112 a!4142) i!1457)))))

(declare-fun b!1376350 () Bool)

(assert (=> b!1376350 (= e!779805 (not (and (bvsge (size!45663 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!604450 () array!93427)

(declare-fun arrayCountValidKeys!0 (array!93427 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376350 (= (arrayCountValidKeys!0 lt!604450 (bvadd #b00000000000000000000000000000001 i!1457) (size!45663 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45663 a!4142)))))

(declare-datatypes ((Unit!45446 0))(
  ( (Unit!45447) )
))
(declare-fun lt!604452 () Unit!45446)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45446)

(assert (=> b!1376350 (= lt!604452 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376350 (= (arrayCountValidKeys!0 lt!604450 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1376350 (= lt!604450 (array!93428 (store (arr!45112 a!4142) i!1457 k0!2959) (size!45663 a!4142)))))

(declare-fun lt!604451 () Unit!45446)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45446)

(assert (=> b!1376350 (= lt!604451 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(assert (= (and start!116872 res!918619) b!1376347))

(assert (= (and b!1376347 res!918618) b!1376348))

(assert (= (and b!1376348 res!918620) b!1376349))

(assert (= (and b!1376349 res!918621) b!1376350))

(declare-fun m!1260269 () Bool)

(assert (=> b!1376348 m!1260269))

(declare-fun m!1260271 () Bool)

(assert (=> start!116872 m!1260271))

(declare-fun m!1260273 () Bool)

(assert (=> b!1376347 m!1260273))

(assert (=> b!1376347 m!1260273))

(declare-fun m!1260275 () Bool)

(assert (=> b!1376347 m!1260275))

(declare-fun m!1260277 () Bool)

(assert (=> b!1376350 m!1260277))

(declare-fun m!1260279 () Bool)

(assert (=> b!1376350 m!1260279))

(declare-fun m!1260281 () Bool)

(assert (=> b!1376350 m!1260281))

(declare-fun m!1260283 () Bool)

(assert (=> b!1376350 m!1260283))

(declare-fun m!1260285 () Bool)

(assert (=> b!1376350 m!1260285))

(declare-fun m!1260287 () Bool)

(assert (=> b!1376350 m!1260287))

(declare-fun m!1260289 () Bool)

(assert (=> b!1376350 m!1260289))

(check-sat (not start!116872) (not b!1376348) (not b!1376347) (not b!1376350))
(check-sat)
