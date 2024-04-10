; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116812 () Bool)

(assert start!116812)

(declare-fun b!1376558 () Bool)

(declare-fun res!919446 () Bool)

(declare-fun e!779774 () Bool)

(assert (=> b!1376558 (=> (not res!919446) (not e!779774))))

(declare-datatypes ((array!93481 0))(
  ( (array!93482 (arr!45144 (Array (_ BitVec 32) (_ BitVec 64))) (size!45694 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93481)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376558 (= res!919446 (validKeyInArray!0 (select (arr!45144 a!4032) i!1445)))))

(declare-fun b!1376559 () Bool)

(declare-fun e!779776 () Bool)

(assert (=> b!1376559 (= e!779776 (not true))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605301 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93481 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376559 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605301))))

(declare-datatypes ((Unit!45611 0))(
  ( (Unit!45612) )
))
(declare-fun lt!605300 () Unit!45611)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93481 (_ BitVec 32) (_ BitVec 32)) Unit!45611)

(assert (=> b!1376559 (= lt!605300 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376560 () Bool)

(declare-fun res!919444 () Bool)

(assert (=> b!1376560 (=> (not res!919444) (not e!779776))))

(assert (=> b!1376560 (= res!919444 (validKeyInArray!0 (select (arr!45144 a!4032) to!206)))))

(declare-fun b!1376561 () Bool)

(declare-fun res!919447 () Bool)

(assert (=> b!1376561 (=> (not res!919447) (not e!779774))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376561 (= res!919447 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376562 () Bool)

(assert (=> b!1376562 (= e!779774 e!779776)))

(declare-fun res!919442 () Bool)

(assert (=> b!1376562 (=> (not res!919442) (not e!779776))))

(declare-fun lt!605302 () (_ BitVec 32))

(assert (=> b!1376562 (= res!919442 (and (= lt!605302 lt!605301) (not (= to!206 (size!45694 a!4032)))))))

(assert (=> b!1376562 (= lt!605301 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376562 (= lt!605302 (arrayCountValidKeys!0 (array!93482 (store (arr!45144 a!4032) i!1445 k0!2947) (size!45694 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!919443 () Bool)

(assert (=> start!116812 (=> (not res!919443) (not e!779774))))

(assert (=> start!116812 (= res!919443 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45694 a!4032))))))

(assert (=> start!116812 e!779774))

(assert (=> start!116812 true))

(declare-fun array_inv!34172 (array!93481) Bool)

(assert (=> start!116812 (array_inv!34172 a!4032)))

(declare-fun b!1376563 () Bool)

(declare-fun res!919445 () Bool)

(assert (=> b!1376563 (=> (not res!919445) (not e!779774))))

(assert (=> b!1376563 (= res!919445 (and (bvslt (size!45694 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45694 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116812 res!919443) b!1376558))

(assert (= (and b!1376558 res!919446) b!1376561))

(assert (= (and b!1376561 res!919447) b!1376563))

(assert (= (and b!1376563 res!919445) b!1376562))

(assert (= (and b!1376562 res!919442) b!1376560))

(assert (= (and b!1376560 res!919444) b!1376559))

(declare-fun m!1260611 () Bool)

(assert (=> b!1376562 m!1260611))

(declare-fun m!1260613 () Bool)

(assert (=> b!1376562 m!1260613))

(declare-fun m!1260615 () Bool)

(assert (=> b!1376562 m!1260615))

(declare-fun m!1260617 () Bool)

(assert (=> b!1376558 m!1260617))

(assert (=> b!1376558 m!1260617))

(declare-fun m!1260619 () Bool)

(assert (=> b!1376558 m!1260619))

(declare-fun m!1260621 () Bool)

(assert (=> b!1376559 m!1260621))

(declare-fun m!1260623 () Bool)

(assert (=> b!1376559 m!1260623))

(declare-fun m!1260625 () Bool)

(assert (=> start!116812 m!1260625))

(declare-fun m!1260627 () Bool)

(assert (=> b!1376560 m!1260627))

(assert (=> b!1376560 m!1260627))

(declare-fun m!1260629 () Bool)

(assert (=> b!1376560 m!1260629))

(declare-fun m!1260631 () Bool)

(assert (=> b!1376561 m!1260631))

(check-sat (not b!1376559) (not start!116812) (not b!1376561) (not b!1376562) (not b!1376558) (not b!1376560))
