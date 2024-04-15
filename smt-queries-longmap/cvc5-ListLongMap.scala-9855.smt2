; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116816 () Bool)

(assert start!116816)

(declare-fun res!919501 () Bool)

(declare-fun e!779794 () Bool)

(assert (=> start!116816 (=> (not res!919501) (not e!779794))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93439 0))(
  ( (array!93440 (arr!45123 (Array (_ BitVec 32) (_ BitVec 64))) (size!45675 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93439)

(assert (=> start!116816 (= res!919501 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45675 a!4032))))))

(assert (=> start!116816 e!779794))

(assert (=> start!116816 true))

(declare-fun array_inv!34356 (array!93439) Bool)

(assert (=> start!116816 (array_inv!34356 a!4032)))

(declare-fun b!1376577 () Bool)

(declare-fun e!779792 () Bool)

(declare-fun e!779793 () Bool)

(assert (=> b!1376577 (= e!779792 (not e!779793))))

(declare-fun res!919497 () Bool)

(assert (=> b!1376577 (=> (not res!919497) (not e!779793))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376577 (= res!919497 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45675 a!4032))))))

(declare-fun lt!605156 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93439 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376577 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605156))))

(declare-datatypes ((Unit!45460 0))(
  ( (Unit!45461) )
))
(declare-fun lt!605155 () Unit!45460)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93439 (_ BitVec 32) (_ BitVec 32)) Unit!45460)

(assert (=> b!1376577 (= lt!605155 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376578 () Bool)

(declare-fun res!919496 () Bool)

(assert (=> b!1376578 (=> (not res!919496) (not e!779792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376578 (= res!919496 (validKeyInArray!0 (select (arr!45123 a!4032) to!206)))))

(declare-fun b!1376579 () Bool)

(declare-fun res!919500 () Bool)

(assert (=> b!1376579 (=> (not res!919500) (not e!779794))))

(assert (=> b!1376579 (= res!919500 (validKeyInArray!0 (select (arr!45123 a!4032) i!1445)))))

(declare-fun b!1376580 () Bool)

(declare-fun res!919499 () Bool)

(assert (=> b!1376580 (=> (not res!919499) (not e!779794))))

(assert (=> b!1376580 (= res!919499 (and (bvslt (size!45675 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45675 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376581 () Bool)

(assert (=> b!1376581 (= e!779794 e!779792)))

(declare-fun res!919502 () Bool)

(assert (=> b!1376581 (=> (not res!919502) (not e!779792))))

(declare-fun lt!605154 () (_ BitVec 32))

(assert (=> b!1376581 (= res!919502 (and (= lt!605154 lt!605156) (not (= to!206 (size!45675 a!4032)))))))

(assert (=> b!1376581 (= lt!605156 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376581 (= lt!605154 (arrayCountValidKeys!0 (array!93440 (store (arr!45123 a!4032) i!1445 k!2947) (size!45675 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376582 () Bool)

(assert (=> b!1376582 (= e!779793 (validKeyInArray!0 (select (store (arr!45123 a!4032) i!1445 k!2947) to!206)))))

(declare-fun b!1376583 () Bool)

(declare-fun res!919498 () Bool)

(assert (=> b!1376583 (=> (not res!919498) (not e!779794))))

(assert (=> b!1376583 (= res!919498 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116816 res!919501) b!1376579))

(assert (= (and b!1376579 res!919500) b!1376583))

(assert (= (and b!1376583 res!919498) b!1376580))

(assert (= (and b!1376580 res!919499) b!1376581))

(assert (= (and b!1376581 res!919502) b!1376578))

(assert (= (and b!1376578 res!919496) b!1376577))

(assert (= (and b!1376577 res!919497) b!1376582))

(declare-fun m!1260213 () Bool)

(assert (=> b!1376582 m!1260213))

(declare-fun m!1260215 () Bool)

(assert (=> b!1376582 m!1260215))

(assert (=> b!1376582 m!1260215))

(declare-fun m!1260217 () Bool)

(assert (=> b!1376582 m!1260217))

(declare-fun m!1260219 () Bool)

(assert (=> b!1376581 m!1260219))

(assert (=> b!1376581 m!1260213))

(declare-fun m!1260221 () Bool)

(assert (=> b!1376581 m!1260221))

(declare-fun m!1260223 () Bool)

(assert (=> b!1376577 m!1260223))

(declare-fun m!1260225 () Bool)

(assert (=> b!1376577 m!1260225))

(declare-fun m!1260227 () Bool)

(assert (=> b!1376579 m!1260227))

(assert (=> b!1376579 m!1260227))

(declare-fun m!1260229 () Bool)

(assert (=> b!1376579 m!1260229))

(declare-fun m!1260231 () Bool)

(assert (=> b!1376583 m!1260231))

(declare-fun m!1260233 () Bool)

(assert (=> start!116816 m!1260233))

(declare-fun m!1260235 () Bool)

(assert (=> b!1376578 m!1260235))

(assert (=> b!1376578 m!1260235))

(declare-fun m!1260237 () Bool)

(assert (=> b!1376578 m!1260237))

(push 1)

(assert (not b!1376579))

(assert (not b!1376583))

(assert (not b!1376582))

(assert (not b!1376577))

(assert (not start!116816))

(assert (not b!1376578))

(assert (not b!1376581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

