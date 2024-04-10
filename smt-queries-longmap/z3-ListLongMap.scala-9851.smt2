; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116794 () Bool)

(assert start!116794)

(declare-fun b!1376400 () Bool)

(declare-fun e!779715 () Bool)

(declare-datatypes ((array!93463 0))(
  ( (array!93464 (arr!45135 (Array (_ BitVec 32) (_ BitVec 64))) (size!45685 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93463)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376400 (= e!779715 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!45685 a!4032)) to!206) #b00000000000000000000000000000000))))

(declare-fun b!1376401 () Bool)

(declare-fun res!919284 () Bool)

(assert (=> b!1376401 (=> (not res!919284) (not e!779715))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376401 (= res!919284 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376402 () Bool)

(declare-fun res!919285 () Bool)

(assert (=> b!1376402 (=> (not res!919285) (not e!779715))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93463 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376402 (= res!919285 (= (arrayCountValidKeys!0 (array!93464 (store (arr!45135 a!4032) i!1445 k0!2947) (size!45685 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun res!919288 () Bool)

(assert (=> start!116794 (=> (not res!919288) (not e!779715))))

(assert (=> start!116794 (= res!919288 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45685 a!4032))))))

(assert (=> start!116794 e!779715))

(assert (=> start!116794 true))

(declare-fun array_inv!34163 (array!93463) Bool)

(assert (=> start!116794 (array_inv!34163 a!4032)))

(declare-fun b!1376403 () Bool)

(declare-fun res!919287 () Bool)

(assert (=> b!1376403 (=> (not res!919287) (not e!779715))))

(assert (=> b!1376403 (= res!919287 (and (bvslt (size!45685 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45685 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376404 () Bool)

(declare-fun res!919286 () Bool)

(assert (=> b!1376404 (=> (not res!919286) (not e!779715))))

(assert (=> b!1376404 (= res!919286 (validKeyInArray!0 (select (arr!45135 a!4032) i!1445)))))

(assert (= (and start!116794 res!919288) b!1376404))

(assert (= (and b!1376404 res!919286) b!1376401))

(assert (= (and b!1376401 res!919284) b!1376403))

(assert (= (and b!1376403 res!919287) b!1376402))

(assert (= (and b!1376402 res!919285) b!1376400))

(declare-fun m!1260465 () Bool)

(assert (=> b!1376401 m!1260465))

(declare-fun m!1260467 () Bool)

(assert (=> b!1376402 m!1260467))

(declare-fun m!1260469 () Bool)

(assert (=> b!1376402 m!1260469))

(declare-fun m!1260471 () Bool)

(assert (=> b!1376402 m!1260471))

(declare-fun m!1260473 () Bool)

(assert (=> start!116794 m!1260473))

(declare-fun m!1260475 () Bool)

(assert (=> b!1376404 m!1260475))

(assert (=> b!1376404 m!1260475))

(declare-fun m!1260477 () Bool)

(assert (=> b!1376404 m!1260477))

(check-sat (not start!116794) (not b!1376401) (not b!1376402) (not b!1376404))
(check-sat)
