; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116816 () Bool)

(assert start!116816)

(declare-fun b!1376596 () Bool)

(declare-fun res!919480 () Bool)

(declare-fun e!779794 () Bool)

(assert (=> b!1376596 (=> (not res!919480) (not e!779794))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376596 (= res!919480 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376597 () Bool)

(declare-fun res!919481 () Bool)

(declare-fun e!779797 () Bool)

(assert (=> b!1376597 (=> (not res!919481) (not e!779797))))

(declare-datatypes ((array!93485 0))(
  ( (array!93486 (arr!45146 (Array (_ BitVec 32) (_ BitVec 64))) (size!45696 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93485)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376597 (= res!919481 (validKeyInArray!0 (select (arr!45146 a!4032) to!206)))))

(declare-fun res!919484 () Bool)

(assert (=> start!116816 (=> (not res!919484) (not e!779794))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> start!116816 (= res!919484 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45696 a!4032))))))

(assert (=> start!116816 e!779794))

(assert (=> start!116816 true))

(declare-fun array_inv!34174 (array!93485) Bool)

(assert (=> start!116816 (array_inv!34174 a!4032)))

(declare-fun b!1376598 () Bool)

(declare-fun res!919482 () Bool)

(assert (=> b!1376598 (=> (not res!919482) (not e!779794))))

(assert (=> b!1376598 (= res!919482 (validKeyInArray!0 (select (arr!45146 a!4032) i!1445)))))

(declare-fun e!779795 () Bool)

(declare-fun b!1376599 () Bool)

(assert (=> b!1376599 (= e!779795 (validKeyInArray!0 (select (store (arr!45146 a!4032) i!1445 k!2947) to!206)))))

(declare-fun b!1376600 () Bool)

(assert (=> b!1376600 (= e!779797 (not e!779795))))

(declare-fun res!919485 () Bool)

(assert (=> b!1376600 (=> (not res!919485) (not e!779795))))

(assert (=> b!1376600 (= res!919485 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45696 a!4032))))))

(declare-fun lt!605319 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376600 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605319))))

(declare-datatypes ((Unit!45615 0))(
  ( (Unit!45616) )
))
(declare-fun lt!605320 () Unit!45615)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93485 (_ BitVec 32) (_ BitVec 32)) Unit!45615)

(assert (=> b!1376600 (= lt!605320 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376601 () Bool)

(assert (=> b!1376601 (= e!779794 e!779797)))

(declare-fun res!919483 () Bool)

(assert (=> b!1376601 (=> (not res!919483) (not e!779797))))

(declare-fun lt!605318 () (_ BitVec 32))

(assert (=> b!1376601 (= res!919483 (and (= lt!605318 lt!605319) (not (= to!206 (size!45696 a!4032)))))))

(assert (=> b!1376601 (= lt!605319 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376601 (= lt!605318 (arrayCountValidKeys!0 (array!93486 (store (arr!45146 a!4032) i!1445 k!2947) (size!45696 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376602 () Bool)

(declare-fun res!919486 () Bool)

(assert (=> b!1376602 (=> (not res!919486) (not e!779794))))

(assert (=> b!1376602 (= res!919486 (and (bvslt (size!45696 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45696 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116816 res!919484) b!1376598))

(assert (= (and b!1376598 res!919482) b!1376596))

(assert (= (and b!1376596 res!919480) b!1376602))

(assert (= (and b!1376602 res!919486) b!1376601))

(assert (= (and b!1376601 res!919483) b!1376597))

(assert (= (and b!1376597 res!919481) b!1376600))

(assert (= (and b!1376600 res!919485) b!1376599))

(declare-fun m!1260655 () Bool)

(assert (=> start!116816 m!1260655))

(declare-fun m!1260657 () Bool)

(assert (=> b!1376597 m!1260657))

(assert (=> b!1376597 m!1260657))

(declare-fun m!1260659 () Bool)

(assert (=> b!1376597 m!1260659))

(declare-fun m!1260661 () Bool)

(assert (=> b!1376600 m!1260661))

(declare-fun m!1260663 () Bool)

(assert (=> b!1376600 m!1260663))

(declare-fun m!1260665 () Bool)

(assert (=> b!1376596 m!1260665))

(declare-fun m!1260667 () Bool)

(assert (=> b!1376599 m!1260667))

(declare-fun m!1260669 () Bool)

(assert (=> b!1376599 m!1260669))

(assert (=> b!1376599 m!1260669))

(declare-fun m!1260671 () Bool)

(assert (=> b!1376599 m!1260671))

(declare-fun m!1260673 () Bool)

(assert (=> b!1376601 m!1260673))

(assert (=> b!1376601 m!1260667))

(declare-fun m!1260675 () Bool)

(assert (=> b!1376601 m!1260675))

(declare-fun m!1260677 () Bool)

(assert (=> b!1376598 m!1260677))

(assert (=> b!1376598 m!1260677))

(declare-fun m!1260679 () Bool)

(assert (=> b!1376598 m!1260679))

(push 1)

(assert (not b!1376596))

(assert (not b!1376598))

(assert (not start!116816))

(assert (not b!1376599))

(assert (not b!1376597))

(assert (not b!1376601))

(assert (not b!1376600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

