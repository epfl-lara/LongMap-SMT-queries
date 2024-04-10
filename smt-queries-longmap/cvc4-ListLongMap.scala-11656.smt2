; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136322 () Bool)

(assert start!136322)

(declare-fun b!1577044 () Bool)

(declare-fun res!1077308 () Bool)

(declare-fun e!879638 () Bool)

(assert (=> b!1577044 (=> (not res!1077308) (not e!879638))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577044 (= res!1077308 (validKeyInArray!0 k!768))))

(declare-fun b!1577043 () Bool)

(declare-fun res!1077309 () Bool)

(assert (=> b!1577043 (=> (not res!1077309) (not e!879638))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105534 0))(
  ( (array!105535 (arr!50889 (Array (_ BitVec 32) (_ BitVec 64))) (size!51439 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105534)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577043 (= res!1077309 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51439 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577046 () Bool)

(assert (=> b!1577046 (= e!879638 false)))

(declare-fun lt!675919 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577046 (= lt!675919 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077306 () Bool)

(assert (=> start!136322 (=> (not res!1077306) (not e!879638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136322 (= res!1077306 (validMask!0 mask!910))))

(assert (=> start!136322 e!879638))

(assert (=> start!136322 true))

(declare-fun array_inv!39616 (array!105534) Bool)

(assert (=> start!136322 (array_inv!39616 _keys!610)))

(declare-fun b!1577045 () Bool)

(declare-fun res!1077307 () Bool)

(assert (=> b!1577045 (=> (not res!1077307) (not e!879638))))

(assert (=> b!1577045 (= res!1077307 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50889 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50889 _keys!610) ee!12) (select (arr!50889 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136322 res!1077306) b!1577043))

(assert (= (and b!1577043 res!1077309) b!1577044))

(assert (= (and b!1577044 res!1077308) b!1577045))

(assert (= (and b!1577045 res!1077307) b!1577046))

(declare-fun m!1449375 () Bool)

(assert (=> b!1577044 m!1449375))

(declare-fun m!1449377 () Bool)

(assert (=> b!1577046 m!1449377))

(declare-fun m!1449379 () Bool)

(assert (=> start!136322 m!1449379))

(declare-fun m!1449381 () Bool)

(assert (=> start!136322 m!1449381))

(declare-fun m!1449383 () Bool)

(assert (=> b!1577045 m!1449383))

(push 1)

(assert (not b!1577046))

(assert (not start!136322))

(assert (not b!1577044))

(check-sat)

(pop 1)

(push 1)

