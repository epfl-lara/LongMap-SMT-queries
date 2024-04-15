; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116834 () Bool)

(assert start!116834)

(declare-fun b!1376757 () Bool)

(declare-fun e!779872 () Bool)

(declare-fun e!779874 () Bool)

(assert (=> b!1376757 (= e!779872 (not e!779874))))

(declare-fun res!919682 () Bool)

(assert (=> b!1376757 (=> (not res!919682) (not e!779874))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93457 0))(
  ( (array!93458 (arr!45132 (Array (_ BitVec 32) (_ BitVec 64))) (size!45684 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93457)

(assert (=> b!1376757 (= res!919682 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45684 a!4032))))))

(declare-fun lt!605210 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93457 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376757 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605210)))

(declare-datatypes ((Unit!45472 0))(
  ( (Unit!45473) )
))
(declare-fun lt!605209 () Unit!45472)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93457 (_ BitVec 32) (_ BitVec 32)) Unit!45472)

(assert (=> b!1376757 (= lt!605209 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376758 () Bool)

(declare-fun res!919677 () Bool)

(assert (=> b!1376758 (=> (not res!919677) (not e!779872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376758 (= res!919677 (not (validKeyInArray!0 (select (arr!45132 a!4032) to!206))))))

(declare-fun b!1376760 () Bool)

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376760 (= e!779874 (not (validKeyInArray!0 (select (store (arr!45132 a!4032) i!1445 k!2947) to!206))))))

(declare-fun b!1376761 () Bool)

(declare-fun e!779875 () Bool)

(assert (=> b!1376761 (= e!779875 e!779872)))

(declare-fun res!919678 () Bool)

(assert (=> b!1376761 (=> (not res!919678) (not e!779872))))

(declare-fun lt!605208 () (_ BitVec 32))

(assert (=> b!1376761 (= res!919678 (and (= lt!605208 lt!605210) (not (= to!206 (size!45684 a!4032)))))))

(assert (=> b!1376761 (= lt!605210 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376761 (= lt!605208 (arrayCountValidKeys!0 (array!93458 (store (arr!45132 a!4032) i!1445 k!2947) (size!45684 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376762 () Bool)

(declare-fun res!919679 () Bool)

(assert (=> b!1376762 (=> (not res!919679) (not e!779875))))

(assert (=> b!1376762 (= res!919679 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376763 () Bool)

(declare-fun res!919676 () Bool)

(assert (=> b!1376763 (=> (not res!919676) (not e!779875))))

(assert (=> b!1376763 (= res!919676 (validKeyInArray!0 (select (arr!45132 a!4032) i!1445)))))

(declare-fun b!1376759 () Bool)

(declare-fun res!919680 () Bool)

(assert (=> b!1376759 (=> (not res!919680) (not e!779875))))

(assert (=> b!1376759 (= res!919680 (and (bvslt (size!45684 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45684 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919681 () Bool)

(assert (=> start!116834 (=> (not res!919681) (not e!779875))))

(assert (=> start!116834 (= res!919681 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45684 a!4032))))))

(assert (=> start!116834 e!779875))

(assert (=> start!116834 true))

(declare-fun array_inv!34365 (array!93457) Bool)

(assert (=> start!116834 (array_inv!34365 a!4032)))

(assert (= (and start!116834 res!919681) b!1376763))

(assert (= (and b!1376763 res!919676) b!1376762))

(assert (= (and b!1376762 res!919679) b!1376759))

(assert (= (and b!1376759 res!919680) b!1376761))

(assert (= (and b!1376761 res!919678) b!1376758))

(assert (= (and b!1376758 res!919677) b!1376757))

(assert (= (and b!1376757 res!919682) b!1376760))

(declare-fun m!1260411 () Bool)

(assert (=> b!1376758 m!1260411))

(assert (=> b!1376758 m!1260411))

(declare-fun m!1260413 () Bool)

(assert (=> b!1376758 m!1260413))

(declare-fun m!1260415 () Bool)

(assert (=> b!1376762 m!1260415))

(declare-fun m!1260417 () Bool)

(assert (=> b!1376761 m!1260417))

(declare-fun m!1260419 () Bool)

(assert (=> b!1376761 m!1260419))

(declare-fun m!1260421 () Bool)

(assert (=> b!1376761 m!1260421))

(assert (=> b!1376760 m!1260419))

(declare-fun m!1260423 () Bool)

(assert (=> b!1376760 m!1260423))

(assert (=> b!1376760 m!1260423))

(declare-fun m!1260425 () Bool)

(assert (=> b!1376760 m!1260425))

(declare-fun m!1260427 () Bool)

(assert (=> start!116834 m!1260427))

(declare-fun m!1260429 () Bool)

(assert (=> b!1376757 m!1260429))

(declare-fun m!1260431 () Bool)

(assert (=> b!1376757 m!1260431))

(declare-fun m!1260433 () Bool)

(assert (=> b!1376763 m!1260433))

(assert (=> b!1376763 m!1260433))

(declare-fun m!1260435 () Bool)

(assert (=> b!1376763 m!1260435))

(push 1)

(assert (not b!1376762))

(assert (not b!1376763))

(assert (not start!116834))

(assert (not b!1376761))

(assert (not b!1376758))

(assert (not b!1376757))

(assert (not b!1376760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

