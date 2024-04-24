; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136808 () Bool)

(assert start!136808)

(declare-fun b!1579686 () Bool)

(declare-fun res!1078373 () Bool)

(declare-fun e!881255 () Bool)

(assert (=> b!1579686 (=> (not res!1078373) (not e!881255))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105699 0))(
  ( (array!105700 (arr!50961 (Array (_ BitVec 32) (_ BitVec 64))) (size!51512 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105699)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1579686 (= res!1078373 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51512 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579687 () Bool)

(declare-fun res!1078376 () Bool)

(assert (=> b!1579687 (=> (not res!1078376) (not e!881255))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579687 (= res!1078376 (validKeyInArray!0 k!768))))

(declare-fun b!1579689 () Bool)

(assert (=> b!1579689 (= e!881255 false)))

(declare-fun lt!676881 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579689 (= lt!676881 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579688 () Bool)

(declare-fun res!1078374 () Bool)

(assert (=> b!1579688 (=> (not res!1078374) (not e!881255))))

(assert (=> b!1579688 (= res!1078374 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50961 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50961 _keys!610) ee!12) (select (arr!50961 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078375 () Bool)

(assert (=> start!136808 (=> (not res!1078375) (not e!881255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136808 (= res!1078375 (validMask!0 mask!910))))

(assert (=> start!136808 e!881255))

(assert (=> start!136808 true))

(declare-fun array_inv!39916 (array!105699) Bool)

(assert (=> start!136808 (array_inv!39916 _keys!610)))

(assert (= (and start!136808 res!1078375) b!1579686))

(assert (= (and b!1579686 res!1078373) b!1579687))

(assert (= (and b!1579687 res!1078376) b!1579688))

(assert (= (and b!1579688 res!1078374) b!1579689))

(declare-fun m!1451813 () Bool)

(assert (=> b!1579687 m!1451813))

(declare-fun m!1451815 () Bool)

(assert (=> b!1579689 m!1451815))

(declare-fun m!1451817 () Bool)

(assert (=> b!1579688 m!1451817))

(declare-fun m!1451819 () Bool)

(assert (=> start!136808 m!1451819))

(declare-fun m!1451821 () Bool)

(assert (=> start!136808 m!1451821))

(push 1)

(assert (not b!1579689))

(assert (not start!136808))

(assert (not b!1579687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

