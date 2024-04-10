; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134826 () Bool)

(assert start!134826)

(declare-fun res!1073905 () Bool)

(declare-fun e!876406 () Bool)

(assert (=> start!134826 (=> (not res!1073905) (not e!876406))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134826 (= res!1073905 (validMask!0 mask!889))))

(assert (=> start!134826 e!876406))

(assert (=> start!134826 true))

(declare-datatypes ((array!104923 0))(
  ( (array!104924 (arr!50631 (Array (_ BitVec 32) (_ BitVec 64))) (size!51181 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104923)

(declare-fun array_inv!39358 (array!104923) Bool)

(assert (=> start!134826 (array_inv!39358 _keys!600)))

(declare-fun b!1571788 () Bool)

(declare-fun res!1073906 () Bool)

(assert (=> b!1571788 (=> (not res!1073906) (not e!876406))))

(assert (=> b!1571788 (= res!1073906 (= (size!51181 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571789 () Bool)

(declare-fun res!1073907 () Bool)

(assert (=> b!1571789 (=> (not res!1073907) (not e!876406))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571789 (= res!1073907 (validKeyInArray!0 k!754))))

(declare-fun b!1571790 () Bool)

(assert (=> b!1571790 (= e!876406 false)))

(declare-fun lt!673741 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571790 (= lt!673741 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134826 res!1073905) b!1571788))

(assert (= (and b!1571788 res!1073906) b!1571789))

(assert (= (and b!1571789 res!1073907) b!1571790))

(declare-fun m!1445663 () Bool)

(assert (=> start!134826 m!1445663))

(declare-fun m!1445665 () Bool)

(assert (=> start!134826 m!1445665))

(declare-fun m!1445667 () Bool)

(assert (=> b!1571789 m!1445667))

(declare-fun m!1445669 () Bool)

(assert (=> b!1571790 m!1445669))

(push 1)

(assert (not start!134826))

(assert (not b!1571789))

(assert (not b!1571790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

