; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116830 () Bool)

(assert start!116830)

(declare-fun b!1376738 () Bool)

(declare-fun e!779856 () Bool)

(declare-fun e!779857 () Bool)

(assert (=> b!1376738 (= e!779856 e!779857)))

(declare-fun res!919622 () Bool)

(assert (=> b!1376738 (=> (not res!919622) (not e!779857))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93499 0))(
  ( (array!93500 (arr!45153 (Array (_ BitVec 32) (_ BitVec 64))) (size!45703 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93499)

(declare-fun lt!605354 () (_ BitVec 32))

(declare-fun lt!605356 () (_ BitVec 32))

(assert (=> b!1376738 (= res!919622 (and (= lt!605356 lt!605354) (not (= to!206 (size!45703 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93499 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376738 (= lt!605354 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376738 (= lt!605356 (arrayCountValidKeys!0 (array!93500 (store (arr!45153 a!4032) i!1445 k0!2947) (size!45703 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376739 () Bool)

(declare-fun res!919623 () Bool)

(assert (=> b!1376739 (=> (not res!919623) (not e!779856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376739 (= res!919623 (validKeyInArray!0 (select (arr!45153 a!4032) i!1445)))))

(declare-fun b!1376740 () Bool)

(declare-fun res!919624 () Bool)

(assert (=> b!1376740 (=> (not res!919624) (not e!779856))))

(assert (=> b!1376740 (= res!919624 (and (bvslt (size!45703 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45703 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376741 () Bool)

(assert (=> b!1376741 (= e!779857 (not true))))

(assert (=> b!1376741 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605354)))

(declare-datatypes ((Unit!45623 0))(
  ( (Unit!45624) )
))
(declare-fun lt!605355 () Unit!45623)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93499 (_ BitVec 32) (_ BitVec 32)) Unit!45623)

(assert (=> b!1376741 (= lt!605355 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376742 () Bool)

(declare-fun res!919625 () Bool)

(assert (=> b!1376742 (=> (not res!919625) (not e!779857))))

(assert (=> b!1376742 (= res!919625 (not (validKeyInArray!0 (select (arr!45153 a!4032) to!206))))))

(declare-fun b!1376743 () Bool)

(declare-fun res!919626 () Bool)

(assert (=> b!1376743 (=> (not res!919626) (not e!779856))))

(assert (=> b!1376743 (= res!919626 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919627 () Bool)

(assert (=> start!116830 (=> (not res!919627) (not e!779856))))

(assert (=> start!116830 (= res!919627 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45703 a!4032))))))

(assert (=> start!116830 e!779856))

(assert (=> start!116830 true))

(declare-fun array_inv!34181 (array!93499) Bool)

(assert (=> start!116830 (array_inv!34181 a!4032)))

(assert (= (and start!116830 res!919627) b!1376739))

(assert (= (and b!1376739 res!919623) b!1376743))

(assert (= (and b!1376743 res!919626) b!1376740))

(assert (= (and b!1376740 res!919624) b!1376738))

(assert (= (and b!1376738 res!919622) b!1376742))

(assert (= (and b!1376742 res!919625) b!1376741))

(declare-fun m!1260809 () Bool)

(assert (=> b!1376741 m!1260809))

(declare-fun m!1260811 () Bool)

(assert (=> b!1376741 m!1260811))

(declare-fun m!1260813 () Bool)

(assert (=> b!1376743 m!1260813))

(declare-fun m!1260815 () Bool)

(assert (=> start!116830 m!1260815))

(declare-fun m!1260817 () Bool)

(assert (=> b!1376738 m!1260817))

(declare-fun m!1260819 () Bool)

(assert (=> b!1376738 m!1260819))

(declare-fun m!1260821 () Bool)

(assert (=> b!1376738 m!1260821))

(declare-fun m!1260823 () Bool)

(assert (=> b!1376739 m!1260823))

(assert (=> b!1376739 m!1260823))

(declare-fun m!1260825 () Bool)

(assert (=> b!1376739 m!1260825))

(declare-fun m!1260827 () Bool)

(assert (=> b!1376742 m!1260827))

(assert (=> b!1376742 m!1260827))

(declare-fun m!1260829 () Bool)

(assert (=> b!1376742 m!1260829))

(check-sat (not b!1376742) (not b!1376738) (not b!1376741) (not start!116830) (not b!1376743) (not b!1376739))
