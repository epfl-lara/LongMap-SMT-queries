; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117008 () Bool)

(assert start!117008)

(declare-fun b!1377604 () Bool)

(declare-fun res!919698 () Bool)

(declare-fun e!780520 () Bool)

(assert (=> b!1377604 (=> (not res!919698) (not e!780520))))

(declare-datatypes ((array!93563 0))(
  ( (array!93564 (arr!45180 (Array (_ BitVec 32) (_ BitVec 64))) (size!45731 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93563)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377604 (= res!919698 (validKeyInArray!0 (select (arr!45180 a!4032) i!1445)))))

(declare-fun b!1377606 () Bool)

(declare-fun res!919695 () Bool)

(assert (=> b!1377606 (=> (not res!919695) (not e!780520))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1377606 (= res!919695 (and (bvslt (size!45731 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45731 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377607 () Bool)

(assert (=> b!1377607 (= e!780520 false)))

(declare-fun lt!605748 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93563 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377607 (= lt!605748 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605747 () (_ BitVec 32))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377607 (= lt!605747 (arrayCountValidKeys!0 (array!93564 (store (arr!45180 a!4032) i!1445 k!2947) (size!45731 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1377605 () Bool)

(declare-fun res!919696 () Bool)

(assert (=> b!1377605 (=> (not res!919696) (not e!780520))))

(assert (=> b!1377605 (= res!919696 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919697 () Bool)

(assert (=> start!117008 (=> (not res!919697) (not e!780520))))

(assert (=> start!117008 (= res!919697 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45731 a!4032))))))

(assert (=> start!117008 e!780520))

(assert (=> start!117008 true))

(declare-fun array_inv!34461 (array!93563) Bool)

(assert (=> start!117008 (array_inv!34461 a!4032)))

(assert (= (and start!117008 res!919697) b!1377604))

(assert (= (and b!1377604 res!919698) b!1377605))

(assert (= (and b!1377605 res!919696) b!1377606))

(assert (= (and b!1377606 res!919695) b!1377607))

(declare-fun m!1261993 () Bool)

(assert (=> b!1377604 m!1261993))

(assert (=> b!1377604 m!1261993))

(declare-fun m!1261995 () Bool)

(assert (=> b!1377604 m!1261995))

(declare-fun m!1261997 () Bool)

(assert (=> b!1377607 m!1261997))

(declare-fun m!1261999 () Bool)

(assert (=> b!1377607 m!1261999))

(declare-fun m!1262001 () Bool)

(assert (=> b!1377607 m!1262001))

(declare-fun m!1262003 () Bool)

(assert (=> b!1377605 m!1262003))

(declare-fun m!1262005 () Bool)

(assert (=> start!117008 m!1262005))

(push 1)

(assert (not b!1377607))

(assert (not b!1377605))

(assert (not b!1377604))

(assert (not start!117008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

