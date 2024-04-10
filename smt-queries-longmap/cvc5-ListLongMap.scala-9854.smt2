; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116810 () Bool)

(assert start!116810)

(declare-fun b!1376540 () Bool)

(declare-fun e!779766 () Bool)

(declare-fun e!779765 () Bool)

(assert (=> b!1376540 (= e!779766 e!779765)))

(declare-fun res!919426 () Bool)

(assert (=> b!1376540 (=> (not res!919426) (not e!779765))))

(declare-fun lt!605292 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605293 () (_ BitVec 32))

(declare-datatypes ((array!93479 0))(
  ( (array!93480 (arr!45143 (Array (_ BitVec 32) (_ BitVec 64))) (size!45693 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93479)

(assert (=> b!1376540 (= res!919426 (and (= lt!605292 lt!605293) (not (= to!206 (size!45693 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93479 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376540 (= lt!605293 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376540 (= lt!605292 (arrayCountValidKeys!0 (array!93480 (store (arr!45143 a!4032) i!1445 k!2947) (size!45693 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!919429 () Bool)

(assert (=> start!116810 (=> (not res!919429) (not e!779766))))

(assert (=> start!116810 (= res!919429 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45693 a!4032))))))

(assert (=> start!116810 e!779766))

(assert (=> start!116810 true))

(declare-fun array_inv!34171 (array!93479) Bool)

(assert (=> start!116810 (array_inv!34171 a!4032)))

(declare-fun b!1376541 () Bool)

(declare-fun res!919427 () Bool)

(assert (=> b!1376541 (=> (not res!919427) (not e!779765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376541 (= res!919427 (validKeyInArray!0 (select (arr!45143 a!4032) to!206)))))

(declare-fun b!1376542 () Bool)

(declare-fun res!919428 () Bool)

(assert (=> b!1376542 (=> (not res!919428) (not e!779766))))

(assert (=> b!1376542 (= res!919428 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376543 () Bool)

(declare-fun res!919425 () Bool)

(assert (=> b!1376543 (=> (not res!919425) (not e!779766))))

(assert (=> b!1376543 (= res!919425 (validKeyInArray!0 (select (arr!45143 a!4032) i!1445)))))

(declare-fun b!1376544 () Bool)

(declare-fun res!919424 () Bool)

(assert (=> b!1376544 (=> (not res!919424) (not e!779766))))

(assert (=> b!1376544 (= res!919424 (and (bvslt (size!45693 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45693 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376545 () Bool)

(assert (=> b!1376545 (= e!779765 (not true))))

(assert (=> b!1376545 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605293))))

(declare-datatypes ((Unit!45609 0))(
  ( (Unit!45610) )
))
(declare-fun lt!605291 () Unit!45609)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93479 (_ BitVec 32) (_ BitVec 32)) Unit!45609)

(assert (=> b!1376545 (= lt!605291 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!116810 res!919429) b!1376543))

(assert (= (and b!1376543 res!919425) b!1376542))

(assert (= (and b!1376542 res!919428) b!1376544))

(assert (= (and b!1376544 res!919424) b!1376540))

(assert (= (and b!1376540 res!919426) b!1376541))

(assert (= (and b!1376541 res!919427) b!1376545))

(declare-fun m!1260589 () Bool)

(assert (=> b!1376540 m!1260589))

(declare-fun m!1260591 () Bool)

(assert (=> b!1376540 m!1260591))

(declare-fun m!1260593 () Bool)

(assert (=> b!1376540 m!1260593))

(declare-fun m!1260595 () Bool)

(assert (=> b!1376542 m!1260595))

(declare-fun m!1260597 () Bool)

(assert (=> b!1376541 m!1260597))

(assert (=> b!1376541 m!1260597))

(declare-fun m!1260599 () Bool)

(assert (=> b!1376541 m!1260599))

(declare-fun m!1260601 () Bool)

(assert (=> start!116810 m!1260601))

(declare-fun m!1260603 () Bool)

(assert (=> b!1376543 m!1260603))

(assert (=> b!1376543 m!1260603))

(declare-fun m!1260605 () Bool)

(assert (=> b!1376543 m!1260605))

(declare-fun m!1260607 () Bool)

(assert (=> b!1376545 m!1260607))

(declare-fun m!1260609 () Bool)

(assert (=> b!1376545 m!1260609))

(push 1)

(assert (not b!1376542))

(assert (not b!1376541))

(assert (not b!1376545))

(assert (not start!116810))

(assert (not b!1376543))

(assert (not b!1376540))

(check-sat)

