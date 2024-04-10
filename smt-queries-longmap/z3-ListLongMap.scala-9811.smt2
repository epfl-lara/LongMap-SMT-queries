; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116518 () Bool)

(assert start!116518)

(declare-fun b!1374339 () Bool)

(declare-fun e!778576 () Bool)

(assert (=> b!1374339 (= e!778576 true)))

(declare-fun lt!603435 () (_ BitVec 32))

(declare-datatypes ((array!93218 0))(
  ( (array!93219 (arr!45015 (Array (_ BitVec 32) (_ BitVec 64))) (size!45565 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93218)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93218 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374339 (= lt!603435 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603434 () (_ BitVec 32))

(declare-fun lt!603436 () array!93218)

(assert (=> b!1374339 (= lt!603434 (arrayCountValidKeys!0 lt!603436 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374340 () Bool)

(declare-fun res!917523 () Bool)

(declare-fun e!778574 () Bool)

(assert (=> b!1374340 (=> (not res!917523) (not e!778574))))

(assert (=> b!1374340 (= res!917523 (bvslt (size!45565 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374341 () Bool)

(assert (=> b!1374341 (= e!778574 (not e!778576))))

(declare-fun res!917527 () Bool)

(assert (=> b!1374341 (=> res!917527 e!778576)))

(assert (=> b!1374341 (= res!917527 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374341 (= (arrayCountValidKeys!0 lt!603436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374341 (= lt!603436 (array!93219 (store (arr!45015 a!4142) i!1457 k0!2959) (size!45565 a!4142)))))

(declare-datatypes ((Unit!45431 0))(
  ( (Unit!45432) )
))
(declare-fun lt!603433 () Unit!45431)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45431)

(assert (=> b!1374341 (= lt!603433 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374342 () Bool)

(declare-fun res!917526 () Bool)

(assert (=> b!1374342 (=> (not res!917526) (not e!778574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374342 (= res!917526 (validKeyInArray!0 (select (arr!45015 a!4142) i!1457)))))

(declare-fun b!1374343 () Bool)

(declare-fun res!917524 () Bool)

(assert (=> b!1374343 (=> (not res!917524) (not e!778574))))

(assert (=> b!1374343 (= res!917524 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917525 () Bool)

(assert (=> start!116518 (=> (not res!917525) (not e!778574))))

(assert (=> start!116518 (= res!917525 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45565 a!4142))))))

(assert (=> start!116518 e!778574))

(assert (=> start!116518 true))

(declare-fun array_inv!34043 (array!93218) Bool)

(assert (=> start!116518 (array_inv!34043 a!4142)))

(assert (= (and start!116518 res!917525) b!1374342))

(assert (= (and b!1374342 res!917526) b!1374343))

(assert (= (and b!1374343 res!917524) b!1374340))

(assert (= (and b!1374340 res!917523) b!1374341))

(assert (= (and b!1374341 (not res!917527)) b!1374339))

(declare-fun m!1257633 () Bool)

(assert (=> b!1374342 m!1257633))

(assert (=> b!1374342 m!1257633))

(declare-fun m!1257635 () Bool)

(assert (=> b!1374342 m!1257635))

(declare-fun m!1257637 () Bool)

(assert (=> b!1374339 m!1257637))

(declare-fun m!1257639 () Bool)

(assert (=> b!1374339 m!1257639))

(declare-fun m!1257641 () Bool)

(assert (=> b!1374341 m!1257641))

(declare-fun m!1257643 () Bool)

(assert (=> b!1374341 m!1257643))

(declare-fun m!1257645 () Bool)

(assert (=> b!1374341 m!1257645))

(declare-fun m!1257647 () Bool)

(assert (=> b!1374341 m!1257647))

(declare-fun m!1257649 () Bool)

(assert (=> b!1374343 m!1257649))

(declare-fun m!1257651 () Bool)

(assert (=> start!116518 m!1257651))

(check-sat (not b!1374339) (not b!1374343) (not b!1374341) (not b!1374342) (not start!116518))
