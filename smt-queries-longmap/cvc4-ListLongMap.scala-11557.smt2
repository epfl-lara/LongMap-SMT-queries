; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134628 () Bool)

(assert start!134628)

(declare-fun res!1073495 () Bool)

(declare-fun e!876092 () Bool)

(assert (=> start!134628 (=> (not res!1073495) (not e!876092))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134628 (= res!1073495 (validMask!0 mask!4043))))

(assert (=> start!134628 e!876092))

(assert (=> start!134628 true))

(declare-datatypes ((array!104830 0))(
  ( (array!104831 (arr!50592 (Array (_ BitVec 32) (_ BitVec 64))) (size!51142 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104830)

(declare-fun array_inv!39319 (array!104830) Bool)

(assert (=> start!134628 (array_inv!39319 a!3462)))

(declare-fun b!1571258 () Bool)

(declare-fun res!1073496 () Bool)

(assert (=> b!1571258 (=> (not res!1073496) (not e!876092))))

(assert (=> b!1571258 (= res!1073496 (= (size!51142 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571259 () Bool)

(assert (=> b!1571259 (= e!876092 false)))

(declare-fun lt!673525 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104830 (_ BitVec 32)) Bool)

(assert (=> b!1571259 (= lt!673525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134628 res!1073495) b!1571258))

(assert (= (and b!1571258 res!1073496) b!1571259))

(declare-fun m!1445245 () Bool)

(assert (=> start!134628 m!1445245))

(declare-fun m!1445247 () Bool)

(assert (=> start!134628 m!1445247))

(declare-fun m!1445249 () Bool)

(assert (=> b!1571259 m!1445249))

(push 1)

(assert (not b!1571259))

(assert (not start!134628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

