; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116884 () Bool)

(assert start!116884)

(declare-fun b!1376421 () Bool)

(declare-fun res!918691 () Bool)

(declare-fun e!779841 () Bool)

(assert (=> b!1376421 (=> (not res!918691) (not e!779841))))

(declare-datatypes ((array!93439 0))(
  ( (array!93440 (arr!45118 (Array (_ BitVec 32) (_ BitVec 64))) (size!45669 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93439)

(assert (=> b!1376421 (= res!918691 (bvslt (size!45669 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918693 () Bool)

(assert (=> start!116884 (=> (not res!918693) (not e!779841))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> start!116884 (= res!918693 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45669 a!4142))))))

(assert (=> start!116884 e!779841))

(assert (=> start!116884 true))

(declare-fun array_inv!34399 (array!93439) Bool)

(assert (=> start!116884 (array_inv!34399 a!4142)))

(declare-fun b!1376420 () Bool)

(declare-fun res!918692 () Bool)

(assert (=> b!1376420 (=> (not res!918692) (not e!779841))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376420 (= res!918692 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1376419 () Bool)

(declare-fun res!918690 () Bool)

(assert (=> b!1376419 (=> (not res!918690) (not e!779841))))

(assert (=> b!1376419 (= res!918690 (validKeyInArray!0 (select (arr!45118 a!4142) i!1457)))))

(declare-fun b!1376422 () Bool)

(assert (=> b!1376422 (= e!779841 (not (and (bvsge (size!45669 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!604549 () (_ BitVec 32))

(declare-fun lt!604548 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93439 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376422 (= (bvadd lt!604549 lt!604548) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45669 a!4142)))))

(declare-datatypes ((Unit!45458 0))(
  ( (Unit!45459) )
))
(declare-fun lt!604553 () Unit!45458)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45458)

(assert (=> b!1376422 (= lt!604553 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45669 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604554 () (_ BitVec 32))

(assert (=> b!1376422 (= lt!604554 lt!604548)))

(assert (=> b!1376422 (= lt!604548 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45669 a!4142)))))

(declare-fun lt!604550 () array!93439)

(assert (=> b!1376422 (= lt!604554 (arrayCountValidKeys!0 lt!604550 (bvadd #b00000000000000000000000000000001 i!1457) (size!45669 a!4142)))))

(declare-fun lt!604552 () Unit!45458)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45458)

(assert (=> b!1376422 (= lt!604552 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376422 (= (arrayCountValidKeys!0 lt!604550 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604549 #b00000000000000000000000000000001))))

(assert (=> b!1376422 (= lt!604549 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376422 (= lt!604550 (array!93440 (store (arr!45118 a!4142) i!1457 k0!2959) (size!45669 a!4142)))))

(declare-fun lt!604551 () Unit!45458)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45458)

(assert (=> b!1376422 (= lt!604551 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(assert (= (and start!116884 res!918693) b!1376419))

(assert (= (and b!1376419 res!918690) b!1376420))

(assert (= (and b!1376420 res!918692) b!1376421))

(assert (= (and b!1376421 res!918691) b!1376422))

(declare-fun m!1260413 () Bool)

(assert (=> start!116884 m!1260413))

(declare-fun m!1260415 () Bool)

(assert (=> b!1376420 m!1260415))

(declare-fun m!1260417 () Bool)

(assert (=> b!1376419 m!1260417))

(assert (=> b!1376419 m!1260417))

(declare-fun m!1260419 () Bool)

(assert (=> b!1376419 m!1260419))

(declare-fun m!1260421 () Bool)

(assert (=> b!1376422 m!1260421))

(declare-fun m!1260423 () Bool)

(assert (=> b!1376422 m!1260423))

(declare-fun m!1260425 () Bool)

(assert (=> b!1376422 m!1260425))

(declare-fun m!1260427 () Bool)

(assert (=> b!1376422 m!1260427))

(declare-fun m!1260429 () Bool)

(assert (=> b!1376422 m!1260429))

(declare-fun m!1260431 () Bool)

(assert (=> b!1376422 m!1260431))

(declare-fun m!1260433 () Bool)

(assert (=> b!1376422 m!1260433))

(declare-fun m!1260435 () Bool)

(assert (=> b!1376422 m!1260435))

(declare-fun m!1260437 () Bool)

(assert (=> b!1376422 m!1260437))

(check-sat (not start!116884) (not b!1376419) (not b!1376422) (not b!1376420))
(check-sat)
