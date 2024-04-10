; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116800 () Bool)

(assert start!116800)

(declare-fun b!1376445 () Bool)

(declare-fun e!779733 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93469 0))(
  ( (array!93470 (arr!45138 (Array (_ BitVec 32) (_ BitVec 64))) (size!45688 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93469)

(assert (=> b!1376445 (= e!779733 (and (not (= to!206 (size!45688 a!4032))) (bvsge to!206 (size!45688 a!4032))))))

(declare-fun b!1376446 () Bool)

(declare-fun res!919331 () Bool)

(assert (=> b!1376446 (=> (not res!919331) (not e!779733))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376446 (= res!919331 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376447 () Bool)

(declare-fun res!919329 () Bool)

(assert (=> b!1376447 (=> (not res!919329) (not e!779733))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1376447 (= res!919329 (validKeyInArray!0 (select (arr!45138 a!4032) i!1445)))))

(declare-fun b!1376448 () Bool)

(declare-fun res!919333 () Bool)

(assert (=> b!1376448 (=> (not res!919333) (not e!779733))))

(declare-fun arrayCountValidKeys!0 (array!93469 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376448 (= res!919333 (= (arrayCountValidKeys!0 (array!93470 (store (arr!45138 a!4032) i!1445 k0!2947) (size!45688 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun res!919330 () Bool)

(assert (=> start!116800 (=> (not res!919330) (not e!779733))))

(assert (=> start!116800 (= res!919330 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45688 a!4032))))))

(assert (=> start!116800 e!779733))

(assert (=> start!116800 true))

(declare-fun array_inv!34166 (array!93469) Bool)

(assert (=> start!116800 (array_inv!34166 a!4032)))

(declare-fun b!1376449 () Bool)

(declare-fun res!919332 () Bool)

(assert (=> b!1376449 (=> (not res!919332) (not e!779733))))

(assert (=> b!1376449 (= res!919332 (and (bvslt (size!45688 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45688 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116800 res!919330) b!1376447))

(assert (= (and b!1376447 res!919329) b!1376446))

(assert (= (and b!1376446 res!919331) b!1376449))

(assert (= (and b!1376449 res!919332) b!1376448))

(assert (= (and b!1376448 res!919333) b!1376445))

(declare-fun m!1260507 () Bool)

(assert (=> b!1376446 m!1260507))

(declare-fun m!1260509 () Bool)

(assert (=> b!1376447 m!1260509))

(assert (=> b!1376447 m!1260509))

(declare-fun m!1260511 () Bool)

(assert (=> b!1376447 m!1260511))

(declare-fun m!1260513 () Bool)

(assert (=> b!1376448 m!1260513))

(declare-fun m!1260515 () Bool)

(assert (=> b!1376448 m!1260515))

(declare-fun m!1260517 () Bool)

(assert (=> b!1376448 m!1260517))

(declare-fun m!1260519 () Bool)

(assert (=> start!116800 m!1260519))

(check-sat (not b!1376446) (not b!1376447) (not b!1376448) (not start!116800))
(check-sat)
