; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116896 () Bool)

(assert start!116896)

(declare-fun b!1377476 () Bool)

(declare-fun res!920199 () Bool)

(declare-fun e!780274 () Bool)

(assert (=> b!1377476 (=> (not res!920199) (not e!780274))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377476 (= res!920199 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377478 () Bool)

(assert (=> b!1377478 (= e!780274 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!606069 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93565 0))(
  ( (array!93566 (arr!45186 (Array (_ BitVec 32) (_ BitVec 64))) (size!45736 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93565)

(declare-fun arrayCountValidKeys!0 (array!93565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377478 (= lt!606069 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606070 () (_ BitVec 32))

(assert (=> b!1377478 (= lt!606070 (arrayCountValidKeys!0 (array!93566 (store (arr!45186 a!4032) i!1445 k0!2947) (size!45736 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1377477 () Bool)

(declare-fun res!920198 () Bool)

(assert (=> b!1377477 (=> (not res!920198) (not e!780274))))

(assert (=> b!1377477 (= res!920198 (and (bvslt (size!45736 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45736 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377475 () Bool)

(declare-fun res!920197 () Bool)

(assert (=> b!1377475 (=> (not res!920197) (not e!780274))))

(assert (=> b!1377475 (= res!920197 (validKeyInArray!0 (select (arr!45186 a!4032) i!1445)))))

(declare-fun res!920200 () Bool)

(assert (=> start!116896 (=> (not res!920200) (not e!780274))))

(assert (=> start!116896 (= res!920200 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45736 a!4032))))))

(assert (=> start!116896 e!780274))

(assert (=> start!116896 true))

(declare-fun array_inv!34214 (array!93565) Bool)

(assert (=> start!116896 (array_inv!34214 a!4032)))

(assert (= (and start!116896 res!920200) b!1377475))

(assert (= (and b!1377475 res!920197) b!1377476))

(assert (= (and b!1377476 res!920199) b!1377477))

(assert (= (and b!1377477 res!920198) b!1377478))

(declare-fun m!1261795 () Bool)

(assert (=> b!1377476 m!1261795))

(declare-fun m!1261797 () Bool)

(assert (=> b!1377478 m!1261797))

(declare-fun m!1261799 () Bool)

(assert (=> b!1377478 m!1261799))

(declare-fun m!1261801 () Bool)

(assert (=> b!1377478 m!1261801))

(declare-fun m!1261803 () Bool)

(assert (=> b!1377475 m!1261803))

(assert (=> b!1377475 m!1261803))

(declare-fun m!1261805 () Bool)

(assert (=> b!1377475 m!1261805))

(declare-fun m!1261807 () Bool)

(assert (=> start!116896 m!1261807))

(check-sat (not b!1377478) (not b!1377475) (not start!116896) (not b!1377476))
