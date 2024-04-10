; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134746 () Bool)

(assert start!134746)

(declare-fun res!1073757 () Bool)

(declare-fun e!876311 () Bool)

(assert (=> start!134746 (=> (not res!1073757) (not e!876311))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134746 (= res!1073757 (validMask!0 mask!889))))

(assert (=> start!134746 e!876311))

(assert (=> start!134746 true))

(declare-datatypes ((array!104885 0))(
  ( (array!104886 (arr!50615 (Array (_ BitVec 32) (_ BitVec 64))) (size!51165 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104885)

(declare-fun array_inv!39342 (array!104885) Bool)

(assert (=> start!134746 (array_inv!39342 _keys!600)))

(declare-fun b!1571644 () Bool)

(declare-fun res!1073756 () Bool)

(assert (=> b!1571644 (=> (not res!1073756) (not e!876311))))

(assert (=> b!1571644 (= res!1073756 (= (size!51165 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571645 () Bool)

(declare-fun res!1073755 () Bool)

(assert (=> b!1571645 (=> (not res!1073755) (not e!876311))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571645 (= res!1073755 (validKeyInArray!0 k0!754))))

(declare-fun b!1571646 () Bool)

(assert (=> b!1571646 (= e!876311 false)))

(declare-fun lt!673657 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571646 (= lt!673657 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134746 res!1073757) b!1571644))

(assert (= (and b!1571644 res!1073756) b!1571645))

(assert (= (and b!1571645 res!1073755) b!1571646))

(declare-fun m!1445535 () Bool)

(assert (=> start!134746 m!1445535))

(declare-fun m!1445537 () Bool)

(assert (=> start!134746 m!1445537))

(declare-fun m!1445539 () Bool)

(assert (=> b!1571645 m!1445539))

(declare-fun m!1445541 () Bool)

(assert (=> b!1571646 m!1445541))

(check-sat (not b!1571645) (not start!134746) (not b!1571646))
(check-sat)
