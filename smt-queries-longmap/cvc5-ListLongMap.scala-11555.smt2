; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134588 () Bool)

(assert start!134588)

(declare-fun res!1073411 () Bool)

(declare-fun e!876016 () Bool)

(assert (=> start!134588 (=> (not res!1073411) (not e!876016))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134588 (= res!1073411 (validMask!0 mask!4043))))

(assert (=> start!134588 e!876016))

(assert (=> start!134588 true))

(declare-datatypes ((array!104811 0))(
  ( (array!104812 (arr!50584 (Array (_ BitVec 32) (_ BitVec 64))) (size!51134 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104811)

(declare-fun array_inv!39311 (array!104811) Bool)

(assert (=> start!134588 (array_inv!39311 a!3462)))

(declare-fun b!1571156 () Bool)

(declare-fun res!1073412 () Bool)

(assert (=> b!1571156 (=> (not res!1073412) (not e!876016))))

(assert (=> b!1571156 (= res!1073412 (= (size!51134 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571157 () Bool)

(assert (=> b!1571157 (= e!876016 false)))

(declare-fun lt!673483 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104811 (_ BitVec 32)) Bool)

(assert (=> b!1571157 (= lt!673483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134588 res!1073411) b!1571156))

(assert (= (and b!1571156 res!1073412) b!1571157))

(declare-fun m!1445155 () Bool)

(assert (=> start!134588 m!1445155))

(declare-fun m!1445157 () Bool)

(assert (=> start!134588 m!1445157))

(declare-fun m!1445159 () Bool)

(assert (=> b!1571157 m!1445159))

(push 1)

(assert (not start!134588))

(assert (not b!1571157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

