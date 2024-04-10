; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116524 () Bool)

(assert start!116524)

(declare-fun res!917563 () Bool)

(declare-fun e!778596 () Bool)

(assert (=> start!116524 (=> (not res!917563) (not e!778596))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93224 0))(
  ( (array!93225 (arr!45018 (Array (_ BitVec 32) (_ BitVec 64))) (size!45568 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93224)

(assert (=> start!116524 (= res!917563 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45568 a!4142))))))

(assert (=> start!116524 e!778596))

(assert (=> start!116524 true))

(declare-fun array_inv!34046 (array!93224) Bool)

(assert (=> start!116524 (array_inv!34046 a!4142)))

(declare-fun b!1374379 () Bool)

(declare-fun res!917566 () Bool)

(assert (=> b!1374379 (=> (not res!917566) (not e!778596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374379 (= res!917566 (validKeyInArray!0 (select (arr!45018 a!4142) i!1457)))))

(declare-fun b!1374382 () Bool)

(assert (=> b!1374382 (= e!778596 (not true))))

(declare-fun lt!603465 () array!93224)

(declare-fun arrayCountValidKeys!0 (array!93224 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374382 (= (arrayCountValidKeys!0 lt!603465 (bvadd #b00000000000000000000000000000001 i!1457) (size!45568 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45568 a!4142)))))

(declare-datatypes ((Unit!45437 0))(
  ( (Unit!45438) )
))
(declare-fun lt!603466 () Unit!45437)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45437)

(assert (=> b!1374382 (= lt!603466 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374382 (= (arrayCountValidKeys!0 lt!603465 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374382 (= lt!603465 (array!93225 (store (arr!45018 a!4142) i!1457 k0!2959) (size!45568 a!4142)))))

(declare-fun lt!603464 () Unit!45437)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45437)

(assert (=> b!1374382 (= lt!603464 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374380 () Bool)

(declare-fun res!917564 () Bool)

(assert (=> b!1374380 (=> (not res!917564) (not e!778596))))

(assert (=> b!1374380 (= res!917564 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374381 () Bool)

(declare-fun res!917565 () Bool)

(assert (=> b!1374381 (=> (not res!917565) (not e!778596))))

(assert (=> b!1374381 (= res!917565 (bvslt (size!45568 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116524 res!917563) b!1374379))

(assert (= (and b!1374379 res!917566) b!1374380))

(assert (= (and b!1374380 res!917564) b!1374381))

(assert (= (and b!1374381 res!917565) b!1374382))

(declare-fun m!1257695 () Bool)

(assert (=> start!116524 m!1257695))

(declare-fun m!1257697 () Bool)

(assert (=> b!1374379 m!1257697))

(assert (=> b!1374379 m!1257697))

(declare-fun m!1257699 () Bool)

(assert (=> b!1374379 m!1257699))

(declare-fun m!1257701 () Bool)

(assert (=> b!1374382 m!1257701))

(declare-fun m!1257703 () Bool)

(assert (=> b!1374382 m!1257703))

(declare-fun m!1257705 () Bool)

(assert (=> b!1374382 m!1257705))

(declare-fun m!1257707 () Bool)

(assert (=> b!1374382 m!1257707))

(declare-fun m!1257709 () Bool)

(assert (=> b!1374382 m!1257709))

(declare-fun m!1257711 () Bool)

(assert (=> b!1374382 m!1257711))

(declare-fun m!1257713 () Bool)

(assert (=> b!1374382 m!1257713))

(declare-fun m!1257715 () Bool)

(assert (=> b!1374380 m!1257715))

(check-sat (not b!1374379) (not b!1374380) (not start!116524) (not b!1374382))
