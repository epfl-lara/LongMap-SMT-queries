; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116998 () Bool)

(assert start!116998)

(declare-fun b!1377537 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun e!780490 () Bool)

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93553 0))(
  ( (array!93554 (arr!45175 (Array (_ BitVec 32) (_ BitVec 64))) (size!45726 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93553)

(assert (=> b!1377537 (= e!780490 (and (= to!206 (size!45726 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1377538 () Bool)

(declare-fun res!919631 () Bool)

(assert (=> b!1377538 (=> (not res!919631) (not e!780490))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377538 (= res!919631 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377539 () Bool)

(declare-fun res!919632 () Bool)

(assert (=> b!1377539 (=> (not res!919632) (not e!780490))))

(assert (=> b!1377539 (= res!919632 (and (bvslt (size!45726 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45726 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919629 () Bool)

(assert (=> start!116998 (=> (not res!919629) (not e!780490))))

(assert (=> start!116998 (= res!919629 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45726 a!4032))))))

(assert (=> start!116998 e!780490))

(assert (=> start!116998 true))

(declare-fun array_inv!34456 (array!93553) Bool)

(assert (=> start!116998 (array_inv!34456 a!4032)))

(declare-fun b!1377540 () Bool)

(declare-fun res!919630 () Bool)

(assert (=> b!1377540 (=> (not res!919630) (not e!780490))))

(declare-fun arrayCountValidKeys!0 (array!93553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377540 (= res!919630 (= (arrayCountValidKeys!0 (array!93554 (store (arr!45175 a!4032) i!1445 k0!2947) (size!45726 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1377541 () Bool)

(declare-fun res!919628 () Bool)

(assert (=> b!1377541 (=> (not res!919628) (not e!780490))))

(assert (=> b!1377541 (= res!919628 (validKeyInArray!0 (select (arr!45175 a!4032) i!1445)))))

(assert (= (and start!116998 res!919629) b!1377541))

(assert (= (and b!1377541 res!919628) b!1377538))

(assert (= (and b!1377538 res!919631) b!1377539))

(assert (= (and b!1377539 res!919632) b!1377540))

(assert (= (and b!1377540 res!919630) b!1377537))

(declare-fun m!1261923 () Bool)

(assert (=> b!1377538 m!1261923))

(declare-fun m!1261925 () Bool)

(assert (=> start!116998 m!1261925))

(declare-fun m!1261927 () Bool)

(assert (=> b!1377540 m!1261927))

(declare-fun m!1261929 () Bool)

(assert (=> b!1377540 m!1261929))

(declare-fun m!1261931 () Bool)

(assert (=> b!1377540 m!1261931))

(declare-fun m!1261933 () Bool)

(assert (=> b!1377541 m!1261933))

(assert (=> b!1377541 m!1261933))

(declare-fun m!1261935 () Bool)

(assert (=> b!1377541 m!1261935))

(check-sat (not b!1377538) (not start!116998) (not b!1377540) (not b!1377541))
(check-sat)
