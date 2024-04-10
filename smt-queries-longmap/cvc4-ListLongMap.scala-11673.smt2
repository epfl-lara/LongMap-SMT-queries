; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136568 () Bool)

(assert start!136568)

(declare-fun res!1077984 () Bool)

(declare-fun e!880123 () Bool)

(assert (=> start!136568 (=> (not res!1077984) (not e!880123))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136568 (= res!1077984 (validMask!0 mask!918))))

(assert (=> start!136568 e!880123))

(assert (=> start!136568 true))

(declare-datatypes ((array!105651 0))(
  ( (array!105652 (arr!50940 (Array (_ BitVec 32) (_ BitVec 64))) (size!51490 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105651)

(declare-fun array_inv!39667 (array!105651) Bool)

(assert (=> start!136568 (array_inv!39667 _keys!614)))

(declare-fun b!1577936 () Bool)

(declare-fun res!1077981 () Bool)

(assert (=> b!1577936 (=> (not res!1077981) (not e!880123))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577936 (= res!1077981 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50940 _keys!614) ee!18) k!772)) (not (= (select (arr!50940 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577937 () Bool)

(assert (=> b!1577937 (= e!880123 false)))

(declare-fun lt!676144 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577937 (= lt!676144 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577934 () Bool)

(declare-fun res!1077982 () Bool)

(assert (=> b!1577934 (=> (not res!1077982) (not e!880123))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577934 (= res!1077982 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51490 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50940 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577935 () Bool)

(declare-fun res!1077983 () Bool)

(assert (=> b!1577935 (=> (not res!1077983) (not e!880123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577935 (= res!1077983 (validKeyInArray!0 k!772))))

(assert (= (and start!136568 res!1077984) b!1577934))

(assert (= (and b!1577934 res!1077982) b!1577935))

(assert (= (and b!1577935 res!1077983) b!1577936))

(assert (= (and b!1577936 res!1077981) b!1577937))

(declare-fun m!1450027 () Bool)

(assert (=> b!1577935 m!1450027))

(declare-fun m!1450029 () Bool)

(assert (=> b!1577934 m!1450029))

(declare-fun m!1450031 () Bool)

(assert (=> b!1577937 m!1450031))

(declare-fun m!1450033 () Bool)

(assert (=> b!1577936 m!1450033))

(declare-fun m!1450035 () Bool)

(assert (=> start!136568 m!1450035))

(declare-fun m!1450037 () Bool)

(assert (=> start!136568 m!1450037))

(push 1)

(assert (not b!1577935))

(assert (not start!136568))

(assert (not b!1577937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

