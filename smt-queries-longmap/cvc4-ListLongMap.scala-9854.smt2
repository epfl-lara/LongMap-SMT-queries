; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116814 () Bool)

(assert start!116814)

(declare-fun b!1376576 () Bool)

(declare-fun res!919463 () Bool)

(declare-fun e!779783 () Bool)

(assert (=> b!1376576 (=> (not res!919463) (not e!779783))))

(declare-datatypes ((array!93483 0))(
  ( (array!93484 (arr!45145 (Array (_ BitVec 32) (_ BitVec 64))) (size!45695 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93483)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376576 (= res!919463 (validKeyInArray!0 (select (arr!45145 a!4032) i!1445)))))

(declare-fun b!1376577 () Bool)

(declare-fun e!779785 () Bool)

(assert (=> b!1376577 (= e!779783 e!779785)))

(declare-fun res!919460 () Bool)

(assert (=> b!1376577 (=> (not res!919460) (not e!779785))))

(declare-fun lt!605311 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605310 () (_ BitVec 32))

(assert (=> b!1376577 (= res!919460 (and (= lt!605311 lt!605310) (not (= to!206 (size!45695 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376577 (= lt!605310 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376577 (= lt!605311 (arrayCountValidKeys!0 (array!93484 (store (arr!45145 a!4032) i!1445 k!2947) (size!45695 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376578 () Bool)

(assert (=> b!1376578 (= e!779785 (not true))))

(assert (=> b!1376578 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605310))))

(declare-datatypes ((Unit!45613 0))(
  ( (Unit!45614) )
))
(declare-fun lt!605309 () Unit!45613)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93483 (_ BitVec 32) (_ BitVec 32)) Unit!45613)

(assert (=> b!1376578 (= lt!605309 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376579 () Bool)

(declare-fun res!919464 () Bool)

(assert (=> b!1376579 (=> (not res!919464) (not e!779783))))

(assert (=> b!1376579 (= res!919464 (and (bvslt (size!45695 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45695 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376580 () Bool)

(declare-fun res!919461 () Bool)

(assert (=> b!1376580 (=> (not res!919461) (not e!779783))))

(assert (=> b!1376580 (= res!919461 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376581 () Bool)

(declare-fun res!919465 () Bool)

(assert (=> b!1376581 (=> (not res!919465) (not e!779785))))

(assert (=> b!1376581 (= res!919465 (validKeyInArray!0 (select (arr!45145 a!4032) to!206)))))

(declare-fun res!919462 () Bool)

(assert (=> start!116814 (=> (not res!919462) (not e!779783))))

(assert (=> start!116814 (= res!919462 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45695 a!4032))))))

(assert (=> start!116814 e!779783))

(assert (=> start!116814 true))

(declare-fun array_inv!34173 (array!93483) Bool)

(assert (=> start!116814 (array_inv!34173 a!4032)))

(assert (= (and start!116814 res!919462) b!1376576))

(assert (= (and b!1376576 res!919463) b!1376580))

(assert (= (and b!1376580 res!919461) b!1376579))

(assert (= (and b!1376579 res!919464) b!1376577))

(assert (= (and b!1376577 res!919460) b!1376581))

(assert (= (and b!1376581 res!919465) b!1376578))

(declare-fun m!1260633 () Bool)

(assert (=> b!1376576 m!1260633))

(assert (=> b!1376576 m!1260633))

(declare-fun m!1260635 () Bool)

(assert (=> b!1376576 m!1260635))

(declare-fun m!1260637 () Bool)

(assert (=> b!1376580 m!1260637))

(declare-fun m!1260639 () Bool)

(assert (=> start!116814 m!1260639))

(declare-fun m!1260641 () Bool)

(assert (=> b!1376578 m!1260641))

(declare-fun m!1260643 () Bool)

(assert (=> b!1376578 m!1260643))

(declare-fun m!1260645 () Bool)

(assert (=> b!1376577 m!1260645))

(declare-fun m!1260647 () Bool)

(assert (=> b!1376577 m!1260647))

(declare-fun m!1260649 () Bool)

(assert (=> b!1376577 m!1260649))

(declare-fun m!1260651 () Bool)

(assert (=> b!1376581 m!1260651))

(assert (=> b!1376581 m!1260651))

(declare-fun m!1260653 () Bool)

(assert (=> b!1376581 m!1260653))

(push 1)

(assert (not b!1376578))

(assert (not b!1376576))

(assert (not b!1376580))

(assert (not b!1376577))

(assert (not b!1376581))

(assert (not start!116814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

