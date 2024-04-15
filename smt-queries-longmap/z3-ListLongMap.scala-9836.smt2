; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116698 () Bool)

(assert start!116698)

(declare-fun b!1375354 () Bool)

(declare-fun e!779135 () Bool)

(assert (=> b!1375354 (= e!779135 (not true))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93321 0))(
  ( (array!93322 (arr!45064 (Array (_ BitVec 32) (_ BitVec 64))) (size!45616 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93321)

(declare-fun lt!604184 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375354 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!604184)))

(declare-datatypes ((Unit!45384 0))(
  ( (Unit!45385) )
))
(declare-fun lt!604183 () Unit!45384)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93321 (_ BitVec 32) (_ BitVec 32)) Unit!45384)

(assert (=> b!1375354 (= lt!604183 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375355 () Bool)

(declare-fun res!918456 () Bool)

(declare-fun e!779136 () Bool)

(assert (=> b!1375355 (=> (not res!918456) (not e!779136))))

(assert (=> b!1375355 (= res!918456 (and (bvslt (size!45616 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45616 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375356 () Bool)

(assert (=> b!1375356 (= e!779136 e!779135)))

(declare-fun res!918453 () Bool)

(assert (=> b!1375356 (=> (not res!918453) (not e!779135))))

(declare-fun lt!604182 () (_ BitVec 32))

(assert (=> b!1375356 (= res!918453 (and (= lt!604182 lt!604184) (not (= to!206 (size!45616 a!4032)))))))

(assert (=> b!1375356 (= lt!604184 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375356 (= lt!604182 (arrayCountValidKeys!0 (array!93322 (store (arr!45064 a!4032) i!1445 k0!2947) (size!45616 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375357 () Bool)

(declare-fun res!918457 () Bool)

(assert (=> b!1375357 (=> (not res!918457) (not e!779135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375357 (= res!918457 (not (validKeyInArray!0 (select (arr!45064 a!4032) to!206))))))

(declare-fun res!918458 () Bool)

(assert (=> start!116698 (=> (not res!918458) (not e!779136))))

(assert (=> start!116698 (= res!918458 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45616 a!4032))))))

(assert (=> start!116698 e!779136))

(assert (=> start!116698 true))

(declare-fun array_inv!34297 (array!93321) Bool)

(assert (=> start!116698 (array_inv!34297 a!4032)))

(declare-fun b!1375358 () Bool)

(declare-fun res!918455 () Bool)

(assert (=> b!1375358 (=> (not res!918455) (not e!779136))))

(assert (=> b!1375358 (= res!918455 (validKeyInArray!0 (select (arr!45064 a!4032) i!1445)))))

(declare-fun b!1375359 () Bool)

(declare-fun res!918454 () Bool)

(assert (=> b!1375359 (=> (not res!918454) (not e!779136))))

(assert (=> b!1375359 (= res!918454 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116698 res!918458) b!1375358))

(assert (= (and b!1375358 res!918455) b!1375359))

(assert (= (and b!1375359 res!918454) b!1375355))

(assert (= (and b!1375355 res!918456) b!1375356))

(assert (= (and b!1375356 res!918453) b!1375357))

(assert (= (and b!1375357 res!918457) b!1375354))

(declare-fun m!1258743 () Bool)

(assert (=> b!1375356 m!1258743))

(declare-fun m!1258745 () Bool)

(assert (=> b!1375356 m!1258745))

(declare-fun m!1258747 () Bool)

(assert (=> b!1375356 m!1258747))

(declare-fun m!1258749 () Bool)

(assert (=> b!1375357 m!1258749))

(assert (=> b!1375357 m!1258749))

(declare-fun m!1258751 () Bool)

(assert (=> b!1375357 m!1258751))

(declare-fun m!1258753 () Bool)

(assert (=> b!1375354 m!1258753))

(declare-fun m!1258755 () Bool)

(assert (=> b!1375354 m!1258755))

(declare-fun m!1258757 () Bool)

(assert (=> b!1375359 m!1258757))

(declare-fun m!1258759 () Bool)

(assert (=> start!116698 m!1258759))

(declare-fun m!1258761 () Bool)

(assert (=> b!1375358 m!1258761))

(assert (=> b!1375358 m!1258761))

(declare-fun m!1258763 () Bool)

(assert (=> b!1375358 m!1258763))

(check-sat (not b!1375354) (not b!1375359) (not b!1375356) (not start!116698) (not b!1375358) (not b!1375357))
(check-sat)
