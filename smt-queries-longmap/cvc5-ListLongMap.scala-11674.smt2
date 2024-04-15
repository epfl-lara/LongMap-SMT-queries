; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136538 () Bool)

(assert start!136538)

(declare-fun b!1577657 () Bool)

(declare-fun res!1077889 () Bool)

(declare-fun e!879944 () Bool)

(assert (=> b!1577657 (=> (not res!1077889) (not e!879944))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105588 0))(
  ( (array!105589 (arr!50908 (Array (_ BitVec 32) (_ BitVec 64))) (size!51460 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105588)

(assert (=> b!1577657 (= res!1077889 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51460 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50908 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577659 () Bool)

(declare-fun res!1077890 () Bool)

(assert (=> b!1577659 (=> (not res!1077890) (not e!879944))))

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1577659 (= res!1077890 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50908 _keys!614) ee!18) k!772)) (not (= (select (arr!50908 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577658 () Bool)

(declare-fun res!1077888 () Bool)

(assert (=> b!1577658 (=> (not res!1077888) (not e!879944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577658 (= res!1077888 (validKeyInArray!0 k!772))))

(declare-fun b!1577660 () Bool)

(assert (=> b!1577660 (= e!879944 false)))

(declare-fun lt!675867 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577660 (= lt!675867 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1077891 () Bool)

(assert (=> start!136538 (=> (not res!1077891) (not e!879944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136538 (= res!1077891 (validMask!0 mask!918))))

(assert (=> start!136538 e!879944))

(assert (=> start!136538 true))

(declare-fun array_inv!39844 (array!105588) Bool)

(assert (=> start!136538 (array_inv!39844 _keys!614)))

(assert (= (and start!136538 res!1077891) b!1577657))

(assert (= (and b!1577657 res!1077889) b!1577658))

(assert (= (and b!1577658 res!1077888) b!1577659))

(assert (= (and b!1577659 res!1077890) b!1577660))

(declare-fun m!1449171 () Bool)

(assert (=> start!136538 m!1449171))

(declare-fun m!1449173 () Bool)

(assert (=> start!136538 m!1449173))

(declare-fun m!1449175 () Bool)

(assert (=> b!1577657 m!1449175))

(declare-fun m!1449177 () Bool)

(assert (=> b!1577658 m!1449177))

(declare-fun m!1449179 () Bool)

(assert (=> b!1577659 m!1449179))

(declare-fun m!1449181 () Bool)

(assert (=> b!1577660 m!1449181))

(push 1)

(assert (not b!1577660))

(assert (not start!136538))

(assert (not b!1577658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

