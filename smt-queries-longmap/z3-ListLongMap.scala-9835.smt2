; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116698 () Bool)

(assert start!116698)

(declare-fun res!918453 () Bool)

(declare-fun e!779148 () Bool)

(assert (=> start!116698 (=> (not res!918453) (not e!779148))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93367 0))(
  ( (array!93368 (arr!45087 (Array (_ BitVec 32) (_ BitVec 64))) (size!45637 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93367)

(assert (=> start!116698 (= res!918453 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45637 a!4032))))))

(assert (=> start!116698 e!779148))

(assert (=> start!116698 true))

(declare-fun array_inv!34115 (array!93367) Bool)

(assert (=> start!116698 (array_inv!34115 a!4032)))

(declare-fun b!1375387 () Bool)

(declare-fun res!918452 () Bool)

(assert (=> b!1375387 (=> (not res!918452) (not e!779148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375387 (= res!918452 (validKeyInArray!0 (select (arr!45087 a!4032) i!1445)))))

(declare-fun b!1375388 () Bool)

(declare-fun res!918451 () Bool)

(assert (=> b!1375388 (=> (not res!918451) (not e!779148))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375388 (= res!918451 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375389 () Bool)

(declare-fun res!918454 () Bool)

(assert (=> b!1375389 (=> (not res!918454) (not e!779148))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375389 (= res!918454 (and (bvslt (size!45637 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45637 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375390 () Bool)

(assert (=> b!1375390 (= e!779148 false)))

(declare-fun lt!604351 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93367 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375390 (= lt!604351 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604350 () (_ BitVec 32))

(assert (=> b!1375390 (= lt!604350 (arrayCountValidKeys!0 (array!93368 (store (arr!45087 a!4032) i!1445 k0!2947) (size!45637 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!116698 res!918453) b!1375387))

(assert (= (and b!1375387 res!918452) b!1375388))

(assert (= (and b!1375388 res!918451) b!1375389))

(assert (= (and b!1375389 res!918454) b!1375390))

(declare-fun m!1259217 () Bool)

(assert (=> start!116698 m!1259217))

(declare-fun m!1259219 () Bool)

(assert (=> b!1375387 m!1259219))

(assert (=> b!1375387 m!1259219))

(declare-fun m!1259221 () Bool)

(assert (=> b!1375387 m!1259221))

(declare-fun m!1259223 () Bool)

(assert (=> b!1375388 m!1259223))

(declare-fun m!1259225 () Bool)

(assert (=> b!1375390 m!1259225))

(declare-fun m!1259227 () Bool)

(assert (=> b!1375390 m!1259227))

(declare-fun m!1259229 () Bool)

(assert (=> b!1375390 m!1259229))

(check-sat (not b!1375388) (not b!1375390) (not start!116698) (not b!1375387))
