; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136526 () Bool)

(assert start!136526)

(declare-fun b!1577587 () Bool)

(declare-fun res!1077816 () Bool)

(declare-fun e!879907 () Bool)

(assert (=> b!1577587 (=> (not res!1077816) (not e!879907))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105576 0))(
  ( (array!105577 (arr!50902 (Array (_ BitVec 32) (_ BitVec 64))) (size!51454 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105576)

(assert (=> b!1577587 (= res!1077816 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50902 _keys!614) ee!18) k!772)) (not (= (select (arr!50902 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577586 () Bool)

(declare-fun res!1077819 () Bool)

(assert (=> b!1577586 (=> (not res!1077819) (not e!879907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577586 (= res!1077819 (validKeyInArray!0 k!772))))

(declare-fun res!1077817 () Bool)

(assert (=> start!136526 (=> (not res!1077817) (not e!879907))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136526 (= res!1077817 (validMask!0 mask!918))))

(assert (=> start!136526 e!879907))

(assert (=> start!136526 true))

(declare-fun array_inv!39838 (array!105576) Bool)

(assert (=> start!136526 (array_inv!39838 _keys!614)))

(declare-fun b!1577585 () Bool)

(declare-fun res!1077818 () Bool)

(assert (=> b!1577585 (=> (not res!1077818) (not e!879907))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577585 (= res!1077818 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51454 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50902 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577588 () Bool)

(assert (=> b!1577588 (= e!879907 false)))

(declare-fun lt!675849 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577588 (= lt!675849 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136526 res!1077817) b!1577585))

(assert (= (and b!1577585 res!1077818) b!1577586))

(assert (= (and b!1577586 res!1077819) b!1577587))

(assert (= (and b!1577587 res!1077816) b!1577588))

(declare-fun m!1449099 () Bool)

(assert (=> b!1577588 m!1449099))

(declare-fun m!1449101 () Bool)

(assert (=> b!1577586 m!1449101))

(declare-fun m!1449103 () Bool)

(assert (=> start!136526 m!1449103))

(declare-fun m!1449105 () Bool)

(assert (=> start!136526 m!1449105))

(declare-fun m!1449107 () Bool)

(assert (=> b!1577585 m!1449107))

(declare-fun m!1449109 () Bool)

(assert (=> b!1577587 m!1449109))

(push 1)

(assert (not b!1577586))

(assert (not start!136526))

(assert (not b!1577588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

