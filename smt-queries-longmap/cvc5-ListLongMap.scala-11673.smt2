; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136564 () Bool)

(assert start!136564)

(declare-fun b!1577910 () Bool)

(declare-fun res!1077960 () Bool)

(declare-fun e!880112 () Bool)

(assert (=> b!1577910 (=> (not res!1077960) (not e!880112))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105647 0))(
  ( (array!105648 (arr!50938 (Array (_ BitVec 32) (_ BitVec 64))) (size!51488 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105647)

(assert (=> b!1577910 (= res!1077960 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51488 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50938 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577911 () Bool)

(declare-fun res!1077958 () Bool)

(assert (=> b!1577911 (=> (not res!1077958) (not e!880112))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577911 (= res!1077958 (validKeyInArray!0 k!772))))

(declare-fun res!1077957 () Bool)

(assert (=> start!136564 (=> (not res!1077957) (not e!880112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136564 (= res!1077957 (validMask!0 mask!918))))

(assert (=> start!136564 e!880112))

(assert (=> start!136564 true))

(declare-fun array_inv!39665 (array!105647) Bool)

(assert (=> start!136564 (array_inv!39665 _keys!614)))

(declare-fun b!1577912 () Bool)

(declare-fun res!1077959 () Bool)

(assert (=> b!1577912 (=> (not res!1077959) (not e!880112))))

(assert (=> b!1577912 (= res!1077959 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50938 _keys!614) ee!18) k!772)) (not (= (select (arr!50938 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577913 () Bool)

(assert (=> b!1577913 (= e!880112 false)))

(declare-fun lt!676138 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577913 (= lt!676138 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136564 res!1077957) b!1577910))

(assert (= (and b!1577910 res!1077960) b!1577911))

(assert (= (and b!1577911 res!1077958) b!1577912))

(assert (= (and b!1577912 res!1077959) b!1577913))

(declare-fun m!1450003 () Bool)

(assert (=> b!1577910 m!1450003))

(declare-fun m!1450005 () Bool)

(assert (=> b!1577912 m!1450005))

(declare-fun m!1450007 () Bool)

(assert (=> b!1577911 m!1450007))

(declare-fun m!1450009 () Bool)

(assert (=> b!1577913 m!1450009))

(declare-fun m!1450011 () Bool)

(assert (=> start!136564 m!1450011))

(declare-fun m!1450013 () Bool)

(assert (=> start!136564 m!1450013))

(push 1)

(assert (not b!1577911))

(assert (not start!136564))

(assert (not b!1577913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

