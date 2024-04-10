; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134744 () Bool)

(assert start!134744)

(declare-fun res!1073746 () Bool)

(declare-fun e!876304 () Bool)

(assert (=> start!134744 (=> (not res!1073746) (not e!876304))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134744 (= res!1073746 (validMask!0 mask!889))))

(assert (=> start!134744 e!876304))

(assert (=> start!134744 true))

(declare-datatypes ((array!104883 0))(
  ( (array!104884 (arr!50614 (Array (_ BitVec 32) (_ BitVec 64))) (size!51164 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104883)

(declare-fun array_inv!39341 (array!104883) Bool)

(assert (=> start!134744 (array_inv!39341 _keys!600)))

(declare-fun b!1571635 () Bool)

(declare-fun res!1073748 () Bool)

(assert (=> b!1571635 (=> (not res!1073748) (not e!876304))))

(assert (=> b!1571635 (= res!1073748 (= (size!51164 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571636 () Bool)

(declare-fun res!1073747 () Bool)

(assert (=> b!1571636 (=> (not res!1073747) (not e!876304))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571636 (= res!1073747 (validKeyInArray!0 k!754))))

(declare-fun b!1571637 () Bool)

(assert (=> b!1571637 (= e!876304 false)))

(declare-fun lt!673654 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571637 (= lt!673654 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134744 res!1073746) b!1571635))

(assert (= (and b!1571635 res!1073748) b!1571636))

(assert (= (and b!1571636 res!1073747) b!1571637))

(declare-fun m!1445527 () Bool)

(assert (=> start!134744 m!1445527))

(declare-fun m!1445529 () Bool)

(assert (=> start!134744 m!1445529))

(declare-fun m!1445531 () Bool)

(assert (=> b!1571636 m!1445531))

(declare-fun m!1445533 () Bool)

(assert (=> b!1571637 m!1445533))

(push 1)

(assert (not b!1571636))

(assert (not start!134744))

(assert (not b!1571637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

