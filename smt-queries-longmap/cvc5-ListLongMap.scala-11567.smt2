; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134734 () Bool)

(assert start!134734)

(declare-fun res!1073692 () Bool)

(declare-fun e!876154 () Bool)

(assert (=> start!134734 (=> (not res!1073692) (not e!876154))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134734 (= res!1073692 (validMask!0 mask!889))))

(assert (=> start!134734 e!876154))

(assert (=> start!134734 true))

(declare-datatypes ((array!104830 0))(
  ( (array!104831 (arr!50587 (Array (_ BitVec 32) (_ BitVec 64))) (size!51139 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104830)

(declare-fun array_inv!39523 (array!104830) Bool)

(assert (=> start!134734 (array_inv!39523 _keys!600)))

(declare-fun b!1571394 () Bool)

(declare-fun res!1073694 () Bool)

(assert (=> b!1571394 (=> (not res!1073694) (not e!876154))))

(assert (=> b!1571394 (= res!1073694 (= (size!51139 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571395 () Bool)

(declare-fun res!1073693 () Bool)

(assert (=> b!1571395 (=> (not res!1073693) (not e!876154))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571395 (= res!1073693 (validKeyInArray!0 k!754))))

(declare-fun b!1571396 () Bool)

(assert (=> b!1571396 (= e!876154 false)))

(declare-fun lt!673410 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571396 (= lt!673410 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134734 res!1073692) b!1571394))

(assert (= (and b!1571394 res!1073694) b!1571395))

(assert (= (and b!1571395 res!1073693) b!1571396))

(declare-fun m!1444699 () Bool)

(assert (=> start!134734 m!1444699))

(declare-fun m!1444701 () Bool)

(assert (=> start!134734 m!1444701))

(declare-fun m!1444703 () Bool)

(assert (=> b!1571395 m!1444703))

(declare-fun m!1444705 () Bool)

(assert (=> b!1571396 m!1444705))

(push 1)

(assert (not b!1571396))

(assert (not b!1571395))

(assert (not start!134734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

