; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134820 () Bool)

(assert start!134820)

(declare-fun res!1073879 () Bool)

(declare-fun e!876388 () Bool)

(assert (=> start!134820 (=> (not res!1073879) (not e!876388))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134820 (= res!1073879 (validMask!0 mask!889))))

(assert (=> start!134820 e!876388))

(assert (=> start!134820 true))

(declare-datatypes ((array!104917 0))(
  ( (array!104918 (arr!50628 (Array (_ BitVec 32) (_ BitVec 64))) (size!51178 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104917)

(declare-fun array_inv!39355 (array!104917) Bool)

(assert (=> start!134820 (array_inv!39355 _keys!600)))

(declare-fun b!1571761 () Bool)

(declare-fun res!1073880 () Bool)

(assert (=> b!1571761 (=> (not res!1073880) (not e!876388))))

(assert (=> b!1571761 (= res!1073880 (= (size!51178 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571762 () Bool)

(declare-fun res!1073878 () Bool)

(assert (=> b!1571762 (=> (not res!1073878) (not e!876388))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571762 (= res!1073878 (validKeyInArray!0 k!754))))

(declare-fun b!1571763 () Bool)

(assert (=> b!1571763 (= e!876388 false)))

(declare-fun lt!673732 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571763 (= lt!673732 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134820 res!1073879) b!1571761))

(assert (= (and b!1571761 res!1073880) b!1571762))

(assert (= (and b!1571762 res!1073878) b!1571763))

(declare-fun m!1445639 () Bool)

(assert (=> start!134820 m!1445639))

(declare-fun m!1445641 () Bool)

(assert (=> start!134820 m!1445641))

(declare-fun m!1445643 () Bool)

(assert (=> b!1571762 m!1445643))

(declare-fun m!1445645 () Bool)

(assert (=> b!1571763 m!1445645))

(push 1)

(assert (not b!1571762))

(assert (not start!134820))

(assert (not b!1571763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

