; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117056 () Bool)

(assert start!117056)

(declare-fun res!920107 () Bool)

(declare-fun e!780690 () Bool)

(assert (=> start!117056 (=> (not res!920107) (not e!780690))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93611 0))(
  ( (array!93612 (arr!45204 (Array (_ BitVec 32) (_ BitVec 64))) (size!45755 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93611)

(assert (=> start!117056 (= res!920107 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45755 a!4032))))))

(assert (=> start!117056 e!780690))

(assert (=> start!117056 true))

(declare-fun array_inv!34485 (array!93611) Bool)

(assert (=> start!117056 (array_inv!34485 a!4032)))

(declare-fun b!1378015 () Bool)

(declare-fun res!920106 () Bool)

(assert (=> b!1378015 (=> (not res!920106) (not e!780690))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378015 (= res!920106 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1378016 () Bool)

(declare-fun res!920112 () Bool)

(assert (=> b!1378016 (=> (not res!920112) (not e!780690))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378016 (= res!920112 (= (arrayCountValidKeys!0 (array!93612 (store (arr!45204 a!4032) i!1445 k!2947) (size!45755 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1378017 () Bool)

(declare-fun res!920108 () Bool)

(assert (=> b!1378017 (=> (not res!920108) (not e!780690))))

(assert (=> b!1378017 (= res!920108 (and (bvslt (size!45755 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45755 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378018 () Bool)

(declare-fun res!920111 () Bool)

(assert (=> b!1378018 (=> (not res!920111) (not e!780690))))

(assert (=> b!1378018 (= res!920111 (validKeyInArray!0 (select (arr!45204 a!4032) i!1445)))))

(declare-fun b!1378019 () Bool)

(declare-fun res!920110 () Bool)

(assert (=> b!1378019 (=> (not res!920110) (not e!780690))))

(assert (=> b!1378019 (= res!920110 (not (= to!206 (size!45755 a!4032))))))

(declare-fun b!1378020 () Bool)

(declare-fun res!920109 () Bool)

(assert (=> b!1378020 (=> (not res!920109) (not e!780690))))

(assert (=> b!1378020 (= res!920109 (not (validKeyInArray!0 (select (arr!45204 a!4032) to!206))))))

(declare-fun b!1378021 () Bool)

(assert (=> b!1378021 (= e!780690 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45755 a!4032))))))

(assert (= (and start!117056 res!920107) b!1378018))

(assert (= (and b!1378018 res!920111) b!1378015))

(assert (= (and b!1378015 res!920106) b!1378017))

(assert (= (and b!1378017 res!920108) b!1378016))

(assert (= (and b!1378016 res!920112) b!1378019))

(assert (= (and b!1378019 res!920110) b!1378020))

(assert (= (and b!1378020 res!920109) b!1378021))

(declare-fun m!1262409 () Bool)

(assert (=> start!117056 m!1262409))

(declare-fun m!1262411 () Bool)

(assert (=> b!1378015 m!1262411))

(declare-fun m!1262413 () Bool)

(assert (=> b!1378018 m!1262413))

(assert (=> b!1378018 m!1262413))

(declare-fun m!1262415 () Bool)

(assert (=> b!1378018 m!1262415))

(declare-fun m!1262417 () Bool)

(assert (=> b!1378016 m!1262417))

(declare-fun m!1262419 () Bool)

(assert (=> b!1378016 m!1262419))

(declare-fun m!1262421 () Bool)

(assert (=> b!1378016 m!1262421))

(declare-fun m!1262423 () Bool)

(assert (=> b!1378020 m!1262423))

(assert (=> b!1378020 m!1262423))

(declare-fun m!1262425 () Bool)

(assert (=> b!1378020 m!1262425))

(push 1)

(assert (not b!1378018))

(assert (not b!1378016))

(assert (not b!1378015))

(assert (not start!117056))

(assert (not b!1378020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

