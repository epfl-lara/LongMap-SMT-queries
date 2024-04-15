; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116806 () Bool)

(assert start!116806)

(declare-fun b!1376479 () Bool)

(declare-fun res!919398 () Bool)

(declare-fun e!779740 () Bool)

(assert (=> b!1376479 (=> (not res!919398) (not e!779740))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376479 (= res!919398 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376480 () Bool)

(declare-fun res!919403 () Bool)

(assert (=> b!1376480 (=> (not res!919403) (not e!779740))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93429 0))(
  ( (array!93430 (arr!45118 (Array (_ BitVec 32) (_ BitVec 64))) (size!45670 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93429)

(assert (=> b!1376480 (= res!919403 (and (bvslt (size!45670 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45670 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376481 () Bool)

(declare-fun e!779738 () Bool)

(assert (=> b!1376481 (= e!779740 e!779738)))

(declare-fun res!919402 () Bool)

(assert (=> b!1376481 (=> (not res!919402) (not e!779738))))

(declare-fun lt!605111 () (_ BitVec 32))

(declare-fun lt!605110 () (_ BitVec 32))

(assert (=> b!1376481 (= res!919402 (and (= lt!605111 lt!605110) (not (= to!206 (size!45670 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93429 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376481 (= lt!605110 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376481 (= lt!605111 (arrayCountValidKeys!0 (array!93430 (store (arr!45118 a!4032) i!1445 k0!2947) (size!45670 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376483 () Bool)

(declare-fun res!919401 () Bool)

(assert (=> b!1376483 (=> (not res!919401) (not e!779740))))

(assert (=> b!1376483 (= res!919401 (validKeyInArray!0 (select (arr!45118 a!4032) i!1445)))))

(declare-fun b!1376484 () Bool)

(declare-fun res!919399 () Bool)

(assert (=> b!1376484 (=> (not res!919399) (not e!779738))))

(assert (=> b!1376484 (= res!919399 (validKeyInArray!0 (select (arr!45118 a!4032) to!206)))))

(declare-fun res!919400 () Bool)

(assert (=> start!116806 (=> (not res!919400) (not e!779740))))

(assert (=> start!116806 (= res!919400 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45670 a!4032))))))

(assert (=> start!116806 e!779740))

(assert (=> start!116806 true))

(declare-fun array_inv!34351 (array!93429) Bool)

(assert (=> start!116806 (array_inv!34351 a!4032)))

(declare-fun b!1376482 () Bool)

(assert (=> b!1376482 (= e!779738 (not true))))

(assert (=> b!1376482 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605110))))

(declare-datatypes ((Unit!45450 0))(
  ( (Unit!45451) )
))
(declare-fun lt!605109 () Unit!45450)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93429 (_ BitVec 32) (_ BitVec 32)) Unit!45450)

(assert (=> b!1376482 (= lt!605109 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!116806 res!919400) b!1376483))

(assert (= (and b!1376483 res!919401) b!1376479))

(assert (= (and b!1376479 res!919398) b!1376480))

(assert (= (and b!1376480 res!919403) b!1376481))

(assert (= (and b!1376481 res!919402) b!1376484))

(assert (= (and b!1376484 res!919399) b!1376482))

(declare-fun m!1260095 () Bool)

(assert (=> b!1376481 m!1260095))

(declare-fun m!1260097 () Bool)

(assert (=> b!1376481 m!1260097))

(declare-fun m!1260099 () Bool)

(assert (=> b!1376481 m!1260099))

(declare-fun m!1260101 () Bool)

(assert (=> b!1376479 m!1260101))

(declare-fun m!1260103 () Bool)

(assert (=> b!1376482 m!1260103))

(declare-fun m!1260105 () Bool)

(assert (=> b!1376482 m!1260105))

(declare-fun m!1260107 () Bool)

(assert (=> b!1376484 m!1260107))

(assert (=> b!1376484 m!1260107))

(declare-fun m!1260109 () Bool)

(assert (=> b!1376484 m!1260109))

(declare-fun m!1260111 () Bool)

(assert (=> b!1376483 m!1260111))

(assert (=> b!1376483 m!1260111))

(declare-fun m!1260113 () Bool)

(assert (=> b!1376483 m!1260113))

(declare-fun m!1260115 () Bool)

(assert (=> start!116806 m!1260115))

(check-sat (not b!1376482) (not b!1376481) (not b!1376479) (not start!116806) (not b!1376483) (not b!1376484))
(check-sat)
