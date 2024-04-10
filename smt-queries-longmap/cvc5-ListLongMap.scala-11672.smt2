; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136558 () Bool)

(assert start!136558)

(declare-fun b!1577875 () Bool)

(declare-fun res!1077921 () Bool)

(declare-fun e!880094 () Bool)

(assert (=> b!1577875 (=> (not res!1077921) (not e!880094))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577875 (= res!1077921 (validKeyInArray!0 k!772))))

(declare-fun b!1577876 () Bool)

(declare-fun res!1077923 () Bool)

(assert (=> b!1577876 (=> (not res!1077923) (not e!880094))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105641 0))(
  ( (array!105642 (arr!50935 (Array (_ BitVec 32) (_ BitVec 64))) (size!51485 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105641)

(assert (=> b!1577876 (= res!1077923 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50935 _keys!614) ee!18) k!772)) (not (= (select (arr!50935 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077922 () Bool)

(assert (=> start!136558 (=> (not res!1077922) (not e!880094))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136558 (= res!1077922 (validMask!0 mask!918))))

(assert (=> start!136558 e!880094))

(assert (=> start!136558 true))

(declare-fun array_inv!39662 (array!105641) Bool)

(assert (=> start!136558 (array_inv!39662 _keys!614)))

(declare-fun b!1577877 () Bool)

(assert (=> b!1577877 (= e!880094 false)))

(declare-fun lt!676129 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577877 (= lt!676129 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577874 () Bool)

(declare-fun res!1077924 () Bool)

(assert (=> b!1577874 (=> (not res!1077924) (not e!880094))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577874 (= res!1077924 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51485 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50935 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136558 res!1077922) b!1577874))

(assert (= (and b!1577874 res!1077924) b!1577875))

(assert (= (and b!1577875 res!1077921) b!1577876))

(assert (= (and b!1577876 res!1077923) b!1577877))

(declare-fun m!1449967 () Bool)

(assert (=> b!1577874 m!1449967))

(declare-fun m!1449969 () Bool)

(assert (=> b!1577876 m!1449969))

(declare-fun m!1449971 () Bool)

(assert (=> start!136558 m!1449971))

(declare-fun m!1449973 () Bool)

(assert (=> start!136558 m!1449973))

(declare-fun m!1449975 () Bool)

(assert (=> b!1577875 m!1449975))

(declare-fun m!1449977 () Bool)

(assert (=> b!1577877 m!1449977))

(push 1)

(assert (not b!1577877))

(assert (not b!1577875))

(assert (not start!136558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

