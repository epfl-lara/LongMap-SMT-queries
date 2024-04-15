; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116776 () Bool)

(assert start!116776)

(declare-fun b!1376243 () Bool)

(declare-fun res!919164 () Bool)

(declare-fun e!779647 () Bool)

(assert (=> b!1376243 (=> (not res!919164) (not e!779647))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376243 (= res!919164 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93399 0))(
  ( (array!93400 (arr!45103 (Array (_ BitVec 32) (_ BitVec 64))) (size!45655 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93399)

(declare-fun b!1376244 () Bool)

(assert (=> b!1376244 (= e!779647 (and (= to!206 (size!45655 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1376245 () Bool)

(declare-fun res!919166 () Bool)

(assert (=> b!1376245 (=> (not res!919166) (not e!779647))))

(assert (=> b!1376245 (= res!919166 (validKeyInArray!0 (select (arr!45103 a!4032) i!1445)))))

(declare-fun b!1376246 () Bool)

(declare-fun res!919163 () Bool)

(assert (=> b!1376246 (=> (not res!919163) (not e!779647))))

(assert (=> b!1376246 (= res!919163 (and (bvslt (size!45655 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45655 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376247 () Bool)

(declare-fun res!919162 () Bool)

(assert (=> b!1376247 (=> (not res!919162) (not e!779647))))

(declare-fun arrayCountValidKeys!0 (array!93399 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376247 (= res!919162 (= (arrayCountValidKeys!0 (array!93400 (store (arr!45103 a!4032) i!1445 k0!2947) (size!45655 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun res!919165 () Bool)

(assert (=> start!116776 (=> (not res!919165) (not e!779647))))

(assert (=> start!116776 (= res!919165 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45655 a!4032))))))

(assert (=> start!116776 e!779647))

(assert (=> start!116776 true))

(declare-fun array_inv!34336 (array!93399) Bool)

(assert (=> start!116776 (array_inv!34336 a!4032)))

(assert (= (and start!116776 res!919165) b!1376245))

(assert (= (and b!1376245 res!919166) b!1376243))

(assert (= (and b!1376243 res!919164) b!1376246))

(assert (= (and b!1376246 res!919163) b!1376247))

(assert (= (and b!1376247 res!919162) b!1376244))

(declare-fun m!1259873 () Bool)

(assert (=> b!1376243 m!1259873))

(declare-fun m!1259875 () Bool)

(assert (=> b!1376245 m!1259875))

(assert (=> b!1376245 m!1259875))

(declare-fun m!1259877 () Bool)

(assert (=> b!1376245 m!1259877))

(declare-fun m!1259879 () Bool)

(assert (=> b!1376247 m!1259879))

(declare-fun m!1259881 () Bool)

(assert (=> b!1376247 m!1259881))

(declare-fun m!1259883 () Bool)

(assert (=> b!1376247 m!1259883))

(declare-fun m!1259885 () Bool)

(assert (=> start!116776 m!1259885))

(check-sat (not b!1376247) (not start!116776) (not b!1376243) (not b!1376245))
(check-sat)
