; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134780 () Bool)

(assert start!134780)

(declare-fun res!1073803 () Bool)

(declare-fun e!876341 () Bool)

(assert (=> start!134780 (=> (not res!1073803) (not e!876341))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134780 (= res!1073803 (validMask!0 mask!889))))

(assert (=> start!134780 e!876341))

(assert (=> start!134780 true))

(declare-datatypes ((array!104898 0))(
  ( (array!104899 (arr!50620 (Array (_ BitVec 32) (_ BitVec 64))) (size!51170 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104898)

(declare-fun array_inv!39347 (array!104898) Bool)

(assert (=> start!134780 (array_inv!39347 _keys!600)))

(declare-fun b!1571689 () Bool)

(declare-fun res!1073805 () Bool)

(assert (=> b!1571689 (=> (not res!1073805) (not e!876341))))

(assert (=> b!1571689 (= res!1073805 (= (size!51170 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571690 () Bool)

(declare-fun res!1073804 () Bool)

(assert (=> b!1571690 (=> (not res!1073804) (not e!876341))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571690 (= res!1073804 (validKeyInArray!0 k!754))))

(declare-fun b!1571691 () Bool)

(assert (=> b!1571691 (= e!876341 false)))

(declare-fun lt!673690 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571691 (= lt!673690 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134780 res!1073803) b!1571689))

(assert (= (and b!1571689 res!1073805) b!1571690))

(assert (= (and b!1571690 res!1073804) b!1571691))

(declare-fun m!1445575 () Bool)

(assert (=> start!134780 m!1445575))

(declare-fun m!1445577 () Bool)

(assert (=> start!134780 m!1445577))

(declare-fun m!1445579 () Bool)

(assert (=> b!1571690 m!1445579))

(declare-fun m!1445581 () Bool)

(assert (=> b!1571691 m!1445581))

(push 1)

(assert (not b!1571690))

(assert (not b!1571691))

(assert (not start!134780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

