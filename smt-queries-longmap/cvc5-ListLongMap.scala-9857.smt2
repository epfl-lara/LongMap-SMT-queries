; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116828 () Bool)

(assert start!116828)

(declare-fun b!1376720 () Bool)

(declare-fun res!919607 () Bool)

(declare-fun e!779846 () Bool)

(assert (=> b!1376720 (=> (not res!919607) (not e!779846))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93497 0))(
  ( (array!93498 (arr!45152 (Array (_ BitVec 32) (_ BitVec 64))) (size!45702 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93497)

(assert (=> b!1376720 (= res!919607 (and (bvslt (size!45702 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45702 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376721 () Bool)

(declare-fun e!779847 () Bool)

(assert (=> b!1376721 (= e!779846 e!779847)))

(declare-fun res!919606 () Bool)

(assert (=> b!1376721 (=> (not res!919606) (not e!779847))))

(declare-fun lt!605347 () (_ BitVec 32))

(declare-fun lt!605346 () (_ BitVec 32))

(assert (=> b!1376721 (= res!919606 (and (= lt!605347 lt!605346) (not (= to!206 (size!45702 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376721 (= lt!605346 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376721 (= lt!605347 (arrayCountValidKeys!0 (array!93498 (store (arr!45152 a!4032) i!1445 k!2947) (size!45702 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376722 () Bool)

(declare-fun res!919604 () Bool)

(assert (=> b!1376722 (=> (not res!919604) (not e!779846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376722 (= res!919604 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376723 () Bool)

(assert (=> b!1376723 (= e!779847 (not true))))

(assert (=> b!1376723 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605346)))

(declare-datatypes ((Unit!45621 0))(
  ( (Unit!45622) )
))
(declare-fun lt!605345 () Unit!45621)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93497 (_ BitVec 32) (_ BitVec 32)) Unit!45621)

(assert (=> b!1376723 (= lt!605345 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376724 () Bool)

(declare-fun res!919609 () Bool)

(assert (=> b!1376724 (=> (not res!919609) (not e!779846))))

(assert (=> b!1376724 (= res!919609 (validKeyInArray!0 (select (arr!45152 a!4032) i!1445)))))

(declare-fun res!919608 () Bool)

(assert (=> start!116828 (=> (not res!919608) (not e!779846))))

(assert (=> start!116828 (= res!919608 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45702 a!4032))))))

(assert (=> start!116828 e!779846))

(assert (=> start!116828 true))

(declare-fun array_inv!34180 (array!93497) Bool)

(assert (=> start!116828 (array_inv!34180 a!4032)))

(declare-fun b!1376725 () Bool)

(declare-fun res!919605 () Bool)

(assert (=> b!1376725 (=> (not res!919605) (not e!779847))))

(assert (=> b!1376725 (= res!919605 (not (validKeyInArray!0 (select (arr!45152 a!4032) to!206))))))

(assert (= (and start!116828 res!919608) b!1376724))

(assert (= (and b!1376724 res!919609) b!1376722))

(assert (= (and b!1376722 res!919604) b!1376720))

(assert (= (and b!1376720 res!919607) b!1376721))

(assert (= (and b!1376721 res!919606) b!1376725))

(assert (= (and b!1376725 res!919605) b!1376723))

(declare-fun m!1260787 () Bool)

(assert (=> b!1376722 m!1260787))

(declare-fun m!1260789 () Bool)

(assert (=> b!1376721 m!1260789))

(declare-fun m!1260791 () Bool)

(assert (=> b!1376721 m!1260791))

(declare-fun m!1260793 () Bool)

(assert (=> b!1376721 m!1260793))

(declare-fun m!1260795 () Bool)

(assert (=> b!1376724 m!1260795))

(assert (=> b!1376724 m!1260795))

(declare-fun m!1260797 () Bool)

(assert (=> b!1376724 m!1260797))

(declare-fun m!1260799 () Bool)

(assert (=> b!1376725 m!1260799))

(assert (=> b!1376725 m!1260799))

(declare-fun m!1260801 () Bool)

(assert (=> b!1376725 m!1260801))

(declare-fun m!1260803 () Bool)

(assert (=> start!116828 m!1260803))

(declare-fun m!1260805 () Bool)

(assert (=> b!1376723 m!1260805))

(declare-fun m!1260807 () Bool)

(assert (=> b!1376723 m!1260807))

(push 1)

(assert (not start!116828))

(assert (not b!1376725))

(assert (not b!1376721))

(assert (not b!1376723))

(assert (not b!1376722))

(assert (not b!1376724))

(check-sat)

