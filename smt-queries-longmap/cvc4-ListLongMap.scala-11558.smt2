; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134634 () Bool)

(assert start!134634)

(declare-fun res!1073514 () Bool)

(declare-fun e!876110 () Bool)

(assert (=> start!134634 (=> (not res!1073514) (not e!876110))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134634 (= res!1073514 (validMask!0 mask!4043))))

(assert (=> start!134634 e!876110))

(assert (=> start!134634 true))

(declare-datatypes ((array!104836 0))(
  ( (array!104837 (arr!50595 (Array (_ BitVec 32) (_ BitVec 64))) (size!51145 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104836)

(declare-fun array_inv!39322 (array!104836) Bool)

(assert (=> start!134634 (array_inv!39322 a!3462)))

(declare-fun b!1571276 () Bool)

(declare-fun res!1073513 () Bool)

(assert (=> b!1571276 (=> (not res!1073513) (not e!876110))))

(assert (=> b!1571276 (= res!1073513 (= (size!51145 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571277 () Bool)

(assert (=> b!1571277 (= e!876110 false)))

(declare-fun lt!673534 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104836 (_ BitVec 32)) Bool)

(assert (=> b!1571277 (= lt!673534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134634 res!1073514) b!1571276))

(assert (= (and b!1571276 res!1073513) b!1571277))

(declare-fun m!1445263 () Bool)

(assert (=> start!134634 m!1445263))

(declare-fun m!1445265 () Bool)

(assert (=> start!134634 m!1445265))

(declare-fun m!1445267 () Bool)

(assert (=> b!1571277 m!1445267))

(push 1)

(assert (not b!1571277))

(assert (not start!134634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

