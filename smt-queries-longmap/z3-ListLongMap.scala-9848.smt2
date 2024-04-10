; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116776 () Bool)

(assert start!116776)

(declare-fun b!1376281 () Bool)

(declare-fun e!779661 () Bool)

(assert (=> b!1376281 (= e!779661 false)))

(declare-fun lt!605259 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93445 0))(
  ( (array!93446 (arr!45126 (Array (_ BitVec 32) (_ BitVec 64))) (size!45676 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93445)

(declare-fun arrayCountValidKeys!0 (array!93445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376281 (= lt!605259 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun lt!605260 () (_ BitVec 32))

(assert (=> b!1376281 (= lt!605260 (arrayCountValidKeys!0 (array!93446 (store (arr!45126 a!4032) i!1445 k0!2947) (size!45676 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376278 () Bool)

(declare-fun res!919165 () Bool)

(assert (=> b!1376278 (=> (not res!919165) (not e!779661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376278 (= res!919165 (validKeyInArray!0 (select (arr!45126 a!4032) i!1445)))))

(declare-fun res!919163 () Bool)

(assert (=> start!116776 (=> (not res!919163) (not e!779661))))

(assert (=> start!116776 (= res!919163 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45676 a!4032))))))

(assert (=> start!116776 e!779661))

(assert (=> start!116776 true))

(declare-fun array_inv!34154 (array!93445) Bool)

(assert (=> start!116776 (array_inv!34154 a!4032)))

(declare-fun b!1376279 () Bool)

(declare-fun res!919164 () Bool)

(assert (=> b!1376279 (=> (not res!919164) (not e!779661))))

(assert (=> b!1376279 (= res!919164 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376280 () Bool)

(declare-fun res!919162 () Bool)

(assert (=> b!1376280 (=> (not res!919162) (not e!779661))))

(assert (=> b!1376280 (= res!919162 (and (bvslt (size!45676 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45676 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116776 res!919163) b!1376278))

(assert (= (and b!1376278 res!919165) b!1376279))

(assert (= (and b!1376279 res!919164) b!1376280))

(assert (= (and b!1376280 res!919162) b!1376281))

(declare-fun m!1260339 () Bool)

(assert (=> b!1376281 m!1260339))

(declare-fun m!1260341 () Bool)

(assert (=> b!1376281 m!1260341))

(declare-fun m!1260343 () Bool)

(assert (=> b!1376281 m!1260343))

(declare-fun m!1260345 () Bool)

(assert (=> b!1376278 m!1260345))

(assert (=> b!1376278 m!1260345))

(declare-fun m!1260347 () Bool)

(assert (=> b!1376278 m!1260347))

(declare-fun m!1260349 () Bool)

(assert (=> start!116776 m!1260349))

(declare-fun m!1260351 () Bool)

(assert (=> b!1376279 m!1260351))

(check-sat (not b!1376279) (not b!1376278) (not b!1376281) (not start!116776))
