; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134816 () Bool)

(assert start!134816)

(declare-fun res!1073860 () Bool)

(declare-fun e!876377 () Bool)

(assert (=> start!134816 (=> (not res!1073860) (not e!876377))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134816 (= res!1073860 (validMask!0 mask!889))))

(assert (=> start!134816 e!876377))

(assert (=> start!134816 true))

(declare-datatypes ((array!104913 0))(
  ( (array!104914 (arr!50626 (Array (_ BitVec 32) (_ BitVec 64))) (size!51176 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104913)

(declare-fun array_inv!39353 (array!104913) Bool)

(assert (=> start!134816 (array_inv!39353 _keys!600)))

(declare-fun b!1571743 () Bool)

(declare-fun res!1073861 () Bool)

(assert (=> b!1571743 (=> (not res!1073861) (not e!876377))))

(assert (=> b!1571743 (= res!1073861 (= (size!51176 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571744 () Bool)

(declare-fun res!1073862 () Bool)

(assert (=> b!1571744 (=> (not res!1073862) (not e!876377))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571744 (= res!1073862 (validKeyInArray!0 k!754))))

(declare-fun b!1571745 () Bool)

(assert (=> b!1571745 (= e!876377 false)))

(declare-fun lt!673726 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571745 (= lt!673726 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134816 res!1073860) b!1571743))

(assert (= (and b!1571743 res!1073861) b!1571744))

(assert (= (and b!1571744 res!1073862) b!1571745))

(declare-fun m!1445623 () Bool)

(assert (=> start!134816 m!1445623))

(declare-fun m!1445625 () Bool)

(assert (=> start!134816 m!1445625))

(declare-fun m!1445627 () Bool)

(assert (=> b!1571744 m!1445627))

(declare-fun m!1445629 () Bool)

(assert (=> b!1571745 m!1445629))

(push 1)

(assert (not start!134816))

(assert (not b!1571745))

(assert (not b!1571744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

