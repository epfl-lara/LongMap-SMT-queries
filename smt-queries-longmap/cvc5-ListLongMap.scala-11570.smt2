; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134776 () Bool)

(assert start!134776)

(declare-fun res!1073777 () Bool)

(declare-fun e!876208 () Bool)

(assert (=> start!134776 (=> (not res!1073777) (not e!876208))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134776 (= res!1073777 (validMask!0 mask!889))))

(assert (=> start!134776 e!876208))

(assert (=> start!134776 true))

(declare-datatypes ((array!104851 0))(
  ( (array!104852 (arr!50596 (Array (_ BitVec 32) (_ BitVec 64))) (size!51148 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104851)

(declare-fun array_inv!39532 (array!104851) Bool)

(assert (=> start!134776 (array_inv!39532 _keys!600)))

(declare-fun b!1571475 () Bool)

(declare-fun res!1073778 () Bool)

(assert (=> b!1571475 (=> (not res!1073778) (not e!876208))))

(assert (=> b!1571475 (= res!1073778 (= (size!51148 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571476 () Bool)

(declare-fun res!1073776 () Bool)

(assert (=> b!1571476 (=> (not res!1073776) (not e!876208))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571476 (= res!1073776 (validKeyInArray!0 k!754))))

(declare-fun b!1571477 () Bool)

(assert (=> b!1571477 (= e!876208 false)))

(declare-fun lt!673455 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571477 (= lt!673455 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134776 res!1073777) b!1571475))

(assert (= (and b!1571475 res!1073778) b!1571476))

(assert (= (and b!1571476 res!1073776) b!1571477))

(declare-fun m!1444771 () Bool)

(assert (=> start!134776 m!1444771))

(declare-fun m!1444773 () Bool)

(assert (=> start!134776 m!1444773))

(declare-fun m!1444775 () Bool)

(assert (=> b!1571476 m!1444775))

(declare-fun m!1444777 () Bool)

(assert (=> b!1571477 m!1444777))

(push 1)

(assert (not b!1571476))

(assert (not start!134776))

(assert (not b!1571477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

