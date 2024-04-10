; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116820 () Bool)

(assert start!116820)

(declare-fun res!919524 () Bool)

(declare-fun e!779819 () Bool)

(assert (=> start!116820 (=> (not res!919524) (not e!779819))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93489 0))(
  ( (array!93490 (arr!45148 (Array (_ BitVec 32) (_ BitVec 64))) (size!45698 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93489)

(assert (=> start!116820 (= res!919524 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45698 a!4032))))))

(assert (=> start!116820 e!779819))

(assert (=> start!116820 true))

(declare-fun array_inv!34176 (array!93489) Bool)

(assert (=> start!116820 (array_inv!34176 a!4032)))

(declare-fun b!1376638 () Bool)

(declare-fun res!919523 () Bool)

(assert (=> b!1376638 (=> (not res!919523) (not e!779819))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376638 (= res!919523 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376639 () Bool)

(declare-fun res!919525 () Bool)

(declare-fun e!779818 () Bool)

(assert (=> b!1376639 (=> (not res!919525) (not e!779818))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376639 (= res!919525 (validKeyInArray!0 (select (arr!45148 a!4032) to!206)))))

(declare-fun b!1376640 () Bool)

(declare-fun e!779821 () Bool)

(assert (=> b!1376640 (= e!779818 (not e!779821))))

(declare-fun res!919527 () Bool)

(assert (=> b!1376640 (=> (not res!919527) (not e!779821))))

(assert (=> b!1376640 (= res!919527 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45698 a!4032))))))

(declare-fun lt!605338 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93489 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376640 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605338))))

(declare-datatypes ((Unit!45619 0))(
  ( (Unit!45620) )
))
(declare-fun lt!605337 () Unit!45619)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93489 (_ BitVec 32) (_ BitVec 32)) Unit!45619)

(assert (=> b!1376640 (= lt!605337 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376641 () Bool)

(declare-fun res!919528 () Bool)

(assert (=> b!1376641 (=> (not res!919528) (not e!779819))))

(assert (=> b!1376641 (= res!919528 (validKeyInArray!0 (select (arr!45148 a!4032) i!1445)))))

(declare-fun b!1376642 () Bool)

(assert (=> b!1376642 (= e!779819 e!779818)))

(declare-fun res!919522 () Bool)

(assert (=> b!1376642 (=> (not res!919522) (not e!779818))))

(declare-fun lt!605336 () (_ BitVec 32))

(assert (=> b!1376642 (= res!919522 (and (= lt!605336 lt!605338) (not (= to!206 (size!45698 a!4032)))))))

(assert (=> b!1376642 (= lt!605338 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376642 (= lt!605336 (arrayCountValidKeys!0 (array!93490 (store (arr!45148 a!4032) i!1445 k!2947) (size!45698 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376643 () Bool)

(declare-fun res!919526 () Bool)

(assert (=> b!1376643 (=> (not res!919526) (not e!779819))))

(assert (=> b!1376643 (= res!919526 (and (bvslt (size!45698 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45698 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376644 () Bool)

(assert (=> b!1376644 (= e!779821 (validKeyInArray!0 (select (store (arr!45148 a!4032) i!1445 k!2947) to!206)))))

(assert (= (and start!116820 res!919524) b!1376641))

(assert (= (and b!1376641 res!919528) b!1376638))

(assert (= (and b!1376638 res!919523) b!1376643))

(assert (= (and b!1376643 res!919526) b!1376642))

(assert (= (and b!1376642 res!919522) b!1376639))

(assert (= (and b!1376639 res!919525) b!1376640))

(assert (= (and b!1376640 res!919527) b!1376644))

(declare-fun m!1260707 () Bool)

(assert (=> b!1376638 m!1260707))

(declare-fun m!1260709 () Bool)

(assert (=> b!1376640 m!1260709))

(declare-fun m!1260711 () Bool)

(assert (=> b!1376640 m!1260711))

(declare-fun m!1260713 () Bool)

(assert (=> b!1376641 m!1260713))

(assert (=> b!1376641 m!1260713))

(declare-fun m!1260715 () Bool)

(assert (=> b!1376641 m!1260715))

(declare-fun m!1260717 () Bool)

(assert (=> b!1376642 m!1260717))

(declare-fun m!1260719 () Bool)

(assert (=> b!1376642 m!1260719))

(declare-fun m!1260721 () Bool)

(assert (=> b!1376642 m!1260721))

(declare-fun m!1260723 () Bool)

(assert (=> start!116820 m!1260723))

(declare-fun m!1260725 () Bool)

(assert (=> b!1376639 m!1260725))

(assert (=> b!1376639 m!1260725))

(declare-fun m!1260727 () Bool)

(assert (=> b!1376639 m!1260727))

(assert (=> b!1376644 m!1260719))

(declare-fun m!1260729 () Bool)

(assert (=> b!1376644 m!1260729))

(assert (=> b!1376644 m!1260729))

(declare-fun m!1260731 () Bool)

(assert (=> b!1376644 m!1260731))

(push 1)

(assert (not b!1376644))

(assert (not b!1376638))

(assert (not b!1376642))

(assert (not b!1376640))

(assert (not b!1376639))

(assert (not b!1376641))

(assert (not start!116820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

