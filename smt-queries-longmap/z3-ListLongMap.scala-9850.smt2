; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116788 () Bool)

(assert start!116788)

(declare-fun b!1376361 () Bool)

(declare-fun res!919246 () Bool)

(declare-fun e!779698 () Bool)

(assert (=> b!1376361 (=> (not res!919246) (not e!779698))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93457 0))(
  ( (array!93458 (arr!45132 (Array (_ BitVec 32) (_ BitVec 64))) (size!45682 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93457)

(assert (=> b!1376361 (= res!919246 (and (bvslt (size!45682 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45682 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919245 () Bool)

(assert (=> start!116788 (=> (not res!919245) (not e!779698))))

(assert (=> start!116788 (= res!919245 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45682 a!4032))))))

(assert (=> start!116788 e!779698))

(assert (=> start!116788 true))

(declare-fun array_inv!34160 (array!93457) Bool)

(assert (=> start!116788 (array_inv!34160 a!4032)))

(declare-fun b!1376362 () Bool)

(assert (=> b!1376362 (= e!779698 false)))

(declare-fun lt!605278 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93457 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376362 (= lt!605278 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun lt!605277 () (_ BitVec 32))

(assert (=> b!1376362 (= lt!605277 (arrayCountValidKeys!0 (array!93458 (store (arr!45132 a!4032) i!1445 k0!2947) (size!45682 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376359 () Bool)

(declare-fun res!919244 () Bool)

(assert (=> b!1376359 (=> (not res!919244) (not e!779698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376359 (= res!919244 (validKeyInArray!0 (select (arr!45132 a!4032) i!1445)))))

(declare-fun b!1376360 () Bool)

(declare-fun res!919243 () Bool)

(assert (=> b!1376360 (=> (not res!919243) (not e!779698))))

(assert (=> b!1376360 (= res!919243 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116788 res!919245) b!1376359))

(assert (= (and b!1376359 res!919244) b!1376360))

(assert (= (and b!1376360 res!919243) b!1376361))

(assert (= (and b!1376361 res!919246) b!1376362))

(declare-fun m!1260423 () Bool)

(assert (=> start!116788 m!1260423))

(declare-fun m!1260425 () Bool)

(assert (=> b!1376362 m!1260425))

(declare-fun m!1260427 () Bool)

(assert (=> b!1376362 m!1260427))

(declare-fun m!1260429 () Bool)

(assert (=> b!1376362 m!1260429))

(declare-fun m!1260431 () Bool)

(assert (=> b!1376359 m!1260431))

(assert (=> b!1376359 m!1260431))

(declare-fun m!1260433 () Bool)

(assert (=> b!1376359 m!1260433))

(declare-fun m!1260435 () Bool)

(assert (=> b!1376360 m!1260435))

(check-sat (not start!116788) (not b!1376360) (not b!1376359) (not b!1376362))
