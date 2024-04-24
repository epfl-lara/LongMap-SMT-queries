; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135232 () Bool)

(assert start!135232)

(declare-fun res!1074738 () Bool)

(declare-fun e!877897 () Bool)

(assert (=> start!135232 (=> (not res!1074738) (not e!877897))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135232 (= res!1074738 (validMask!0 mask!889))))

(assert (=> start!135232 e!877897))

(assert (=> start!135232 true))

(declare-datatypes ((array!105039 0))(
  ( (array!105040 (arr!50682 (Array (_ BitVec 32) (_ BitVec 64))) (size!51233 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105039)

(declare-fun array_inv!39637 (array!105039) Bool)

(assert (=> start!135232 (array_inv!39637 _keys!600)))

(declare-fun b!1574197 () Bool)

(declare-fun res!1074739 () Bool)

(assert (=> b!1574197 (=> (not res!1074739) (not e!877897))))

(assert (=> b!1574197 (= res!1074739 (= (size!51233 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574198 () Bool)

(declare-fun res!1074740 () Bool)

(assert (=> b!1574198 (=> (not res!1074740) (not e!877897))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574198 (= res!1074740 (validKeyInArray!0 k!754))))

(declare-fun b!1574199 () Bool)

(assert (=> b!1574199 (= e!877897 false)))

(declare-fun lt!674640 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574199 (= lt!674640 (toIndex!0 k!754 mask!889))))

(assert (= (and start!135232 res!1074738) b!1574197))

(assert (= (and b!1574197 res!1074739) b!1574198))

(assert (= (and b!1574198 res!1074740) b!1574199))

(declare-fun m!1447897 () Bool)

(assert (=> start!135232 m!1447897))

(declare-fun m!1447899 () Bool)

(assert (=> start!135232 m!1447899))

(declare-fun m!1447901 () Bool)

(assert (=> b!1574198 m!1447901))

(declare-fun m!1447903 () Bool)

(assert (=> b!1574199 m!1447903))

(push 1)

(assert (not b!1574198))

(assert (not start!135232))

(assert (not b!1574199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

