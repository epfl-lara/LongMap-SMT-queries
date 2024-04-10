; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134592 () Bool)

(assert start!134592)

(declare-fun res!1073424 () Bool)

(declare-fun e!876028 () Bool)

(assert (=> start!134592 (=> (not res!1073424) (not e!876028))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134592 (= res!1073424 (validMask!0 mask!4043))))

(assert (=> start!134592 e!876028))

(assert (=> start!134592 true))

(declare-datatypes ((array!104815 0))(
  ( (array!104816 (arr!50586 (Array (_ BitVec 32) (_ BitVec 64))) (size!51136 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104815)

(declare-fun array_inv!39313 (array!104815) Bool)

(assert (=> start!134592 (array_inv!39313 a!3462)))

(declare-fun b!1571168 () Bool)

(declare-fun res!1073423 () Bool)

(assert (=> b!1571168 (=> (not res!1073423) (not e!876028))))

(assert (=> b!1571168 (= res!1073423 (= (size!51136 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571169 () Bool)

(assert (=> b!1571169 (= e!876028 false)))

(declare-fun lt!673489 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104815 (_ BitVec 32)) Bool)

(assert (=> b!1571169 (= lt!673489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134592 res!1073424) b!1571168))

(assert (= (and b!1571168 res!1073423) b!1571169))

(declare-fun m!1445167 () Bool)

(assert (=> start!134592 m!1445167))

(declare-fun m!1445169 () Bool)

(assert (=> start!134592 m!1445169))

(declare-fun m!1445171 () Bool)

(assert (=> b!1571169 m!1445171))

(push 1)

(assert (not start!134592))

(assert (not b!1571169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

