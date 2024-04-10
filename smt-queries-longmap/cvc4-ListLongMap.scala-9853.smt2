; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116808 () Bool)

(assert start!116808)

(declare-fun b!1376521 () Bool)

(declare-fun res!919406 () Bool)

(declare-fun e!779758 () Bool)

(assert (=> b!1376521 (=> (not res!919406) (not e!779758))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93477 0))(
  ( (array!93478 (arr!45142 (Array (_ BitVec 32) (_ BitVec 64))) (size!45692 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93477)

(declare-fun arrayCountValidKeys!0 (array!93477 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376521 (= res!919406 (= (arrayCountValidKeys!0 (array!93478 (store (arr!45142 a!4032) i!1445 k!2947) (size!45692 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376522 () Bool)

(declare-fun res!919410 () Bool)

(assert (=> b!1376522 (=> (not res!919410) (not e!779758))))

(assert (=> b!1376522 (= res!919410 (and (bvslt (size!45692 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45692 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376523 () Bool)

(declare-fun res!919405 () Bool)

(assert (=> b!1376523 (=> (not res!919405) (not e!779758))))

(assert (=> b!1376523 (= res!919405 (not (= to!206 (size!45692 a!4032))))))

(declare-fun b!1376524 () Bool)

(declare-fun res!919411 () Bool)

(assert (=> b!1376524 (=> (not res!919411) (not e!779758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376524 (= res!919411 (validKeyInArray!0 (select (arr!45142 a!4032) to!206)))))

(declare-fun b!1376525 () Bool)

(assert (=> b!1376525 (= e!779758 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45692 a!4032))))))

(declare-fun b!1376526 () Bool)

(declare-fun res!919409 () Bool)

(assert (=> b!1376526 (=> (not res!919409) (not e!779758))))

(assert (=> b!1376526 (= res!919409 (validKeyInArray!0 (select (arr!45142 a!4032) i!1445)))))

(declare-fun res!919408 () Bool)

(assert (=> start!116808 (=> (not res!919408) (not e!779758))))

(assert (=> start!116808 (= res!919408 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45692 a!4032))))))

(assert (=> start!116808 e!779758))

(assert (=> start!116808 true))

(declare-fun array_inv!34170 (array!93477) Bool)

(assert (=> start!116808 (array_inv!34170 a!4032)))

(declare-fun b!1376527 () Bool)

(declare-fun res!919407 () Bool)

(assert (=> b!1376527 (=> (not res!919407) (not e!779758))))

(assert (=> b!1376527 (= res!919407 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116808 res!919408) b!1376526))

(assert (= (and b!1376526 res!919409) b!1376527))

(assert (= (and b!1376527 res!919407) b!1376522))

(assert (= (and b!1376522 res!919410) b!1376521))

(assert (= (and b!1376521 res!919406) b!1376523))

(assert (= (and b!1376523 res!919405) b!1376524))

(assert (= (and b!1376524 res!919411) b!1376525))

(declare-fun m!1260571 () Bool)

(assert (=> b!1376521 m!1260571))

(declare-fun m!1260573 () Bool)

(assert (=> b!1376521 m!1260573))

(declare-fun m!1260575 () Bool)

(assert (=> b!1376521 m!1260575))

(declare-fun m!1260577 () Bool)

(assert (=> b!1376527 m!1260577))

(declare-fun m!1260579 () Bool)

(assert (=> start!116808 m!1260579))

(declare-fun m!1260581 () Bool)

(assert (=> b!1376526 m!1260581))

(assert (=> b!1376526 m!1260581))

(declare-fun m!1260583 () Bool)

(assert (=> b!1376526 m!1260583))

(declare-fun m!1260585 () Bool)

(assert (=> b!1376524 m!1260585))

(assert (=> b!1376524 m!1260585))

(declare-fun m!1260587 () Bool)

(assert (=> b!1376524 m!1260587))

(push 1)

(assert (not b!1376521))

(assert (not b!1376527))

(assert (not start!116808))

(assert (not b!1376526))

(assert (not b!1376524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

