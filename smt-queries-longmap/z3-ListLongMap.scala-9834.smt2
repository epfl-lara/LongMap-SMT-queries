; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116692 () Bool)

(assert start!116692)

(declare-fun res!918412 () Bool)

(declare-fun e!779127 () Bool)

(assert (=> start!116692 (=> (not res!918412) (not e!779127))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93361 0))(
  ( (array!93362 (arr!45084 (Array (_ BitVec 32) (_ BitVec 64))) (size!45634 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93361)

(assert (=> start!116692 (= res!918412 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45634 a!4032))))))

(assert (=> start!116692 e!779127))

(assert (=> start!116692 true))

(declare-fun array_inv!34112 (array!93361) Bool)

(assert (=> start!116692 (array_inv!34112 a!4032)))

(declare-fun b!1375343 () Bool)

(declare-fun res!918407 () Bool)

(assert (=> b!1375343 (=> (not res!918407) (not e!779127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375343 (= res!918407 (validKeyInArray!0 (select (arr!45084 a!4032) i!1445)))))

(declare-fun b!1375344 () Bool)

(declare-fun e!779126 () Bool)

(assert (=> b!1375344 (= e!779127 e!779126)))

(declare-fun res!918411 () Bool)

(assert (=> b!1375344 (=> (not res!918411) (not e!779126))))

(declare-fun lt!604329 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604330 () (_ BitVec 32))

(assert (=> b!1375344 (= res!918411 (and (= lt!604330 lt!604329) (not (= to!206 (size!45634 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93361 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375344 (= lt!604329 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375344 (= lt!604330 (arrayCountValidKeys!0 (array!93362 (store (arr!45084 a!4032) i!1445 k0!2947) (size!45634 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375345 () Bool)

(declare-fun res!918409 () Bool)

(assert (=> b!1375345 (=> (not res!918409) (not e!779127))))

(assert (=> b!1375345 (= res!918409 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375346 () Bool)

(assert (=> b!1375346 (= e!779126 (not true))))

(assert (=> b!1375346 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!604329))))

(declare-datatypes ((Unit!45539 0))(
  ( (Unit!45540) )
))
(declare-fun lt!604328 () Unit!45539)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93361 (_ BitVec 32) (_ BitVec 32)) Unit!45539)

(assert (=> b!1375346 (= lt!604328 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375347 () Bool)

(declare-fun res!918408 () Bool)

(assert (=> b!1375347 (=> (not res!918408) (not e!779126))))

(assert (=> b!1375347 (= res!918408 (validKeyInArray!0 (select (arr!45084 a!4032) to!206)))))

(declare-fun b!1375348 () Bool)

(declare-fun res!918410 () Bool)

(assert (=> b!1375348 (=> (not res!918410) (not e!779127))))

(assert (=> b!1375348 (= res!918410 (and (bvslt (size!45634 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45634 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116692 res!918412) b!1375343))

(assert (= (and b!1375343 res!918407) b!1375345))

(assert (= (and b!1375345 res!918409) b!1375348))

(assert (= (and b!1375348 res!918410) b!1375344))

(assert (= (and b!1375344 res!918411) b!1375347))

(assert (= (and b!1375347 res!918408) b!1375346))

(declare-fun m!1259159 () Bool)

(assert (=> b!1375344 m!1259159))

(declare-fun m!1259161 () Bool)

(assert (=> b!1375344 m!1259161))

(declare-fun m!1259163 () Bool)

(assert (=> b!1375344 m!1259163))

(declare-fun m!1259165 () Bool)

(assert (=> b!1375343 m!1259165))

(assert (=> b!1375343 m!1259165))

(declare-fun m!1259167 () Bool)

(assert (=> b!1375343 m!1259167))

(declare-fun m!1259169 () Bool)

(assert (=> b!1375347 m!1259169))

(assert (=> b!1375347 m!1259169))

(declare-fun m!1259171 () Bool)

(assert (=> b!1375347 m!1259171))

(declare-fun m!1259173 () Bool)

(assert (=> b!1375345 m!1259173))

(declare-fun m!1259175 () Bool)

(assert (=> b!1375346 m!1259175))

(declare-fun m!1259177 () Bool)

(assert (=> b!1375346 m!1259177))

(declare-fun m!1259179 () Bool)

(assert (=> start!116692 m!1259179))

(check-sat (not b!1375345) (not b!1375343) (not b!1375346) (not b!1375344) (not b!1375347) (not start!116692))
(check-sat)
