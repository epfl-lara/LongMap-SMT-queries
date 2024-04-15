; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116824 () Bool)

(assert start!116824)

(declare-fun b!1376659 () Bool)

(declare-fun res!919581 () Bool)

(declare-fun e!779821 () Bool)

(assert (=> b!1376659 (=> (not res!919581) (not e!779821))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376659 (= res!919581 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376660 () Bool)

(declare-fun res!919580 () Bool)

(assert (=> b!1376660 (=> (not res!919580) (not e!779821))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93447 0))(
  ( (array!93448 (arr!45127 (Array (_ BitVec 32) (_ BitVec 64))) (size!45679 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93447)

(assert (=> b!1376660 (= res!919580 (and (bvslt (size!45679 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45679 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376661 () Bool)

(declare-fun res!919582 () Bool)

(assert (=> b!1376661 (=> (not res!919582) (not e!779821))))

(assert (=> b!1376661 (= res!919582 (validKeyInArray!0 (select (arr!45127 a!4032) i!1445)))))

(declare-fun res!919583 () Bool)

(assert (=> start!116824 (=> (not res!919583) (not e!779821))))

(assert (=> start!116824 (= res!919583 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45679 a!4032))))))

(assert (=> start!116824 e!779821))

(assert (=> start!116824 true))

(declare-fun array_inv!34360 (array!93447) Bool)

(assert (=> start!116824 (array_inv!34360 a!4032)))

(declare-fun b!1376662 () Bool)

(declare-fun e!779820 () Bool)

(assert (=> b!1376662 (= e!779821 e!779820)))

(declare-fun res!919579 () Bool)

(assert (=> b!1376662 (=> (not res!919579) (not e!779820))))

(declare-fun lt!605163 () (_ BitVec 32))

(declare-fun lt!605164 () (_ BitVec 32))

(assert (=> b!1376662 (= res!919579 (and (= lt!605163 lt!605164) (not (= to!206 (size!45679 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93447 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376662 (= lt!605164 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376662 (= lt!605163 (arrayCountValidKeys!0 (array!93448 (store (arr!45127 a!4032) i!1445 k0!2947) (size!45679 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376663 () Bool)

(assert (=> b!1376663 (= e!779820 (not true))))

(assert (=> b!1376663 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605164)))

(declare-datatypes ((Unit!45462 0))(
  ( (Unit!45463) )
))
(declare-fun lt!605165 () Unit!45462)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93447 (_ BitVec 32) (_ BitVec 32)) Unit!45462)

(assert (=> b!1376663 (= lt!605165 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376664 () Bool)

(declare-fun res!919578 () Bool)

(assert (=> b!1376664 (=> (not res!919578) (not e!779820))))

(assert (=> b!1376664 (= res!919578 (not (validKeyInArray!0 (select (arr!45127 a!4032) to!206))))))

(assert (= (and start!116824 res!919583) b!1376661))

(assert (= (and b!1376661 res!919582) b!1376659))

(assert (= (and b!1376659 res!919581) b!1376660))

(assert (= (and b!1376660 res!919580) b!1376662))

(assert (= (and b!1376662 res!919579) b!1376664))

(assert (= (and b!1376664 res!919578) b!1376663))

(declare-fun m!1260293 () Bool)

(assert (=> start!116824 m!1260293))

(declare-fun m!1260295 () Bool)

(assert (=> b!1376661 m!1260295))

(assert (=> b!1376661 m!1260295))

(declare-fun m!1260297 () Bool)

(assert (=> b!1376661 m!1260297))

(declare-fun m!1260299 () Bool)

(assert (=> b!1376662 m!1260299))

(declare-fun m!1260301 () Bool)

(assert (=> b!1376662 m!1260301))

(declare-fun m!1260303 () Bool)

(assert (=> b!1376662 m!1260303))

(declare-fun m!1260305 () Bool)

(assert (=> b!1376663 m!1260305))

(declare-fun m!1260307 () Bool)

(assert (=> b!1376663 m!1260307))

(declare-fun m!1260309 () Bool)

(assert (=> b!1376664 m!1260309))

(assert (=> b!1376664 m!1260309))

(declare-fun m!1260311 () Bool)

(assert (=> b!1376664 m!1260311))

(declare-fun m!1260313 () Bool)

(assert (=> b!1376659 m!1260313))

(check-sat (not b!1376662) (not b!1376664) (not b!1376663) (not b!1376659) (not start!116824) (not b!1376661))
(check-sat)
