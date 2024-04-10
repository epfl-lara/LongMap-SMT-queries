; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134624 () Bool)

(assert start!134624)

(declare-fun res!1073484 () Bool)

(declare-fun e!876080 () Bool)

(assert (=> start!134624 (=> (not res!1073484) (not e!876080))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134624 (= res!1073484 (validMask!0 mask!4043))))

(assert (=> start!134624 e!876080))

(assert (=> start!134624 true))

(declare-datatypes ((array!104826 0))(
  ( (array!104827 (arr!50590 (Array (_ BitVec 32) (_ BitVec 64))) (size!51140 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104826)

(declare-fun array_inv!39317 (array!104826) Bool)

(assert (=> start!134624 (array_inv!39317 a!3462)))

(declare-fun b!1571246 () Bool)

(declare-fun res!1073483 () Bool)

(assert (=> b!1571246 (=> (not res!1073483) (not e!876080))))

(assert (=> b!1571246 (= res!1073483 (= (size!51140 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571247 () Bool)

(assert (=> b!1571247 (= e!876080 false)))

(declare-fun lt!673519 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104826 (_ BitVec 32)) Bool)

(assert (=> b!1571247 (= lt!673519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134624 res!1073484) b!1571246))

(assert (= (and b!1571246 res!1073483) b!1571247))

(declare-fun m!1445233 () Bool)

(assert (=> start!134624 m!1445233))

(declare-fun m!1445235 () Bool)

(assert (=> start!134624 m!1445235))

(declare-fun m!1445237 () Bool)

(assert (=> b!1571247 m!1445237))

(push 1)

(assert (not start!134624))

(assert (not b!1571247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

