; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117020 () Bool)

(assert start!117020)

(declare-fun b!1377688 () Bool)

(declare-fun e!780555 () Bool)

(assert (=> b!1377688 (= e!780555 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93575 0))(
  ( (array!93576 (arr!45186 (Array (_ BitVec 32) (_ BitVec 64))) (size!45737 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93575)

(declare-fun lt!605765 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93575 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377688 (= lt!605765 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605766 () (_ BitVec 32))

(assert (=> b!1377688 (= lt!605766 (arrayCountValidKeys!0 (array!93576 (store (arr!45186 a!4032) i!1445 k!2947) (size!45737 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!919777 () Bool)

(assert (=> start!117020 (=> (not res!919777) (not e!780555))))

(assert (=> start!117020 (= res!919777 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45737 a!4032))))))

(assert (=> start!117020 e!780555))

(assert (=> start!117020 true))

(declare-fun array_inv!34467 (array!93575) Bool)

(assert (=> start!117020 (array_inv!34467 a!4032)))

(declare-fun b!1377685 () Bool)

(declare-fun res!919778 () Bool)

(assert (=> b!1377685 (=> (not res!919778) (not e!780555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377685 (= res!919778 (validKeyInArray!0 (select (arr!45186 a!4032) i!1445)))))

(declare-fun b!1377686 () Bool)

(declare-fun res!919779 () Bool)

(assert (=> b!1377686 (=> (not res!919779) (not e!780555))))

(assert (=> b!1377686 (= res!919779 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377687 () Bool)

(declare-fun res!919776 () Bool)

(assert (=> b!1377687 (=> (not res!919776) (not e!780555))))

(assert (=> b!1377687 (= res!919776 (and (bvslt (size!45737 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45737 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!117020 res!919777) b!1377685))

(assert (= (and b!1377685 res!919778) b!1377686))

(assert (= (and b!1377686 res!919779) b!1377687))

(assert (= (and b!1377687 res!919776) b!1377688))

(declare-fun m!1262077 () Bool)

(assert (=> b!1377688 m!1262077))

(declare-fun m!1262079 () Bool)

(assert (=> b!1377688 m!1262079))

(declare-fun m!1262081 () Bool)

(assert (=> b!1377688 m!1262081))

(declare-fun m!1262083 () Bool)

(assert (=> start!117020 m!1262083))

(declare-fun m!1262085 () Bool)

(assert (=> b!1377685 m!1262085))

(assert (=> b!1377685 m!1262085))

(declare-fun m!1262087 () Bool)

(assert (=> b!1377685 m!1262087))

(declare-fun m!1262089 () Bool)

(assert (=> b!1377686 m!1262089))

(push 1)

(assert (not b!1377685))

(assert (not b!1377686))

(assert (not b!1377688))

(assert (not start!117020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

