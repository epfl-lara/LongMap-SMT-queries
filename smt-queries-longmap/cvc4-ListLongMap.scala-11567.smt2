; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134784 () Bool)

(assert start!134784)

(declare-fun res!1073821 () Bool)

(declare-fun e!876352 () Bool)

(assert (=> start!134784 (=> (not res!1073821) (not e!876352))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134784 (= res!1073821 (validMask!0 mask!889))))

(assert (=> start!134784 e!876352))

(assert (=> start!134784 true))

(declare-datatypes ((array!104902 0))(
  ( (array!104903 (arr!50622 (Array (_ BitVec 32) (_ BitVec 64))) (size!51172 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104902)

(declare-fun array_inv!39349 (array!104902) Bool)

(assert (=> start!134784 (array_inv!39349 _keys!600)))

(declare-fun b!1571707 () Bool)

(declare-fun res!1073822 () Bool)

(assert (=> b!1571707 (=> (not res!1073822) (not e!876352))))

(assert (=> b!1571707 (= res!1073822 (= (size!51172 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571708 () Bool)

(declare-fun res!1073823 () Bool)

(assert (=> b!1571708 (=> (not res!1073823) (not e!876352))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571708 (= res!1073823 (validKeyInArray!0 k!754))))

(declare-fun b!1571709 () Bool)

(assert (=> b!1571709 (= e!876352 false)))

(declare-fun lt!673696 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571709 (= lt!673696 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134784 res!1073821) b!1571707))

(assert (= (and b!1571707 res!1073822) b!1571708))

(assert (= (and b!1571708 res!1073823) b!1571709))

(declare-fun m!1445591 () Bool)

(assert (=> start!134784 m!1445591))

(declare-fun m!1445593 () Bool)

(assert (=> start!134784 m!1445593))

(declare-fun m!1445595 () Bool)

(assert (=> b!1571708 m!1445595))

(declare-fun m!1445597 () Bool)

(assert (=> b!1571709 m!1445597))

(push 1)

(assert (not b!1571708))

(assert (not b!1571709))

(assert (not start!134784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

