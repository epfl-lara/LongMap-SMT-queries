; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116818 () Bool)

(assert start!116818)

(declare-fun b!1376617 () Bool)

(declare-fun e!779806 () Bool)

(declare-fun e!779809 () Bool)

(assert (=> b!1376617 (= e!779806 (not e!779809))))

(declare-fun res!919505 () Bool)

(assert (=> b!1376617 (=> (not res!919505) (not e!779809))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93487 0))(
  ( (array!93488 (arr!45147 (Array (_ BitVec 32) (_ BitVec 64))) (size!45697 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93487)

(assert (=> b!1376617 (= res!919505 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45697 a!4032))))))

(declare-fun lt!605329 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376617 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605329))))

(declare-datatypes ((Unit!45617 0))(
  ( (Unit!45618) )
))
(declare-fun lt!605328 () Unit!45617)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93487 (_ BitVec 32) (_ BitVec 32)) Unit!45617)

(assert (=> b!1376617 (= lt!605328 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376618 () Bool)

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376618 (= e!779809 (validKeyInArray!0 (select (store (arr!45147 a!4032) i!1445 k0!2947) to!206)))))

(declare-fun b!1376619 () Bool)

(declare-fun res!919502 () Bool)

(assert (=> b!1376619 (=> (not res!919502) (not e!779806))))

(assert (=> b!1376619 (= res!919502 (validKeyInArray!0 (select (arr!45147 a!4032) to!206)))))

(declare-fun b!1376620 () Bool)

(declare-fun res!919503 () Bool)

(declare-fun e!779807 () Bool)

(assert (=> b!1376620 (=> (not res!919503) (not e!779807))))

(assert (=> b!1376620 (= res!919503 (validKeyInArray!0 (select (arr!45147 a!4032) i!1445)))))

(declare-fun b!1376621 () Bool)

(declare-fun res!919507 () Bool)

(assert (=> b!1376621 (=> (not res!919507) (not e!779807))))

(assert (=> b!1376621 (= res!919507 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919501 () Bool)

(assert (=> start!116818 (=> (not res!919501) (not e!779807))))

(assert (=> start!116818 (= res!919501 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45697 a!4032))))))

(assert (=> start!116818 e!779807))

(assert (=> start!116818 true))

(declare-fun array_inv!34175 (array!93487) Bool)

(assert (=> start!116818 (array_inv!34175 a!4032)))

(declare-fun b!1376622 () Bool)

(assert (=> b!1376622 (= e!779807 e!779806)))

(declare-fun res!919504 () Bool)

(assert (=> b!1376622 (=> (not res!919504) (not e!779806))))

(declare-fun lt!605327 () (_ BitVec 32))

(assert (=> b!1376622 (= res!919504 (and (= lt!605327 lt!605329) (not (= to!206 (size!45697 a!4032)))))))

(assert (=> b!1376622 (= lt!605329 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376622 (= lt!605327 (arrayCountValidKeys!0 (array!93488 (store (arr!45147 a!4032) i!1445 k0!2947) (size!45697 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376623 () Bool)

(declare-fun res!919506 () Bool)

(assert (=> b!1376623 (=> (not res!919506) (not e!779807))))

(assert (=> b!1376623 (= res!919506 (and (bvslt (size!45697 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45697 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116818 res!919501) b!1376620))

(assert (= (and b!1376620 res!919503) b!1376621))

(assert (= (and b!1376621 res!919507) b!1376623))

(assert (= (and b!1376623 res!919506) b!1376622))

(assert (= (and b!1376622 res!919504) b!1376619))

(assert (= (and b!1376619 res!919502) b!1376617))

(assert (= (and b!1376617 res!919505) b!1376618))

(declare-fun m!1260681 () Bool)

(assert (=> b!1376618 m!1260681))

(declare-fun m!1260683 () Bool)

(assert (=> b!1376618 m!1260683))

(assert (=> b!1376618 m!1260683))

(declare-fun m!1260685 () Bool)

(assert (=> b!1376618 m!1260685))

(declare-fun m!1260687 () Bool)

(assert (=> b!1376620 m!1260687))

(assert (=> b!1376620 m!1260687))

(declare-fun m!1260689 () Bool)

(assert (=> b!1376620 m!1260689))

(declare-fun m!1260691 () Bool)

(assert (=> b!1376622 m!1260691))

(assert (=> b!1376622 m!1260681))

(declare-fun m!1260693 () Bool)

(assert (=> b!1376622 m!1260693))

(declare-fun m!1260695 () Bool)

(assert (=> b!1376619 m!1260695))

(assert (=> b!1376619 m!1260695))

(declare-fun m!1260697 () Bool)

(assert (=> b!1376619 m!1260697))

(declare-fun m!1260699 () Bool)

(assert (=> start!116818 m!1260699))

(declare-fun m!1260701 () Bool)

(assert (=> b!1376621 m!1260701))

(declare-fun m!1260703 () Bool)

(assert (=> b!1376617 m!1260703))

(declare-fun m!1260705 () Bool)

(assert (=> b!1376617 m!1260705))

(check-sat (not b!1376622) (not b!1376620) (not b!1376619) (not b!1376617) (not start!116818) (not b!1376618) (not b!1376621))
(check-sat)
