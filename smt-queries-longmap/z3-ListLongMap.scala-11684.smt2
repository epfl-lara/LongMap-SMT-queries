; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136618 () Bool)

(assert start!136618)

(declare-fun res!1078170 () Bool)

(declare-fun e!880111 () Bool)

(assert (=> start!136618 (=> (not res!1078170) (not e!880111))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136618 (= res!1078170 (validMask!0 mask!918))))

(assert (=> start!136618 e!880111))

(assert (=> start!136618 true))

(declare-datatypes ((array!105647 0))(
  ( (array!105648 (arr!50936 (Array (_ BitVec 32) (_ BitVec 64))) (size!51488 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105647)

(declare-fun array_inv!39872 (array!105647) Bool)

(assert (=> start!136618 (array_inv!39872 _keys!614)))

(declare-fun b!1577937 () Bool)

(declare-fun res!1078169 () Bool)

(assert (=> b!1577937 (=> (not res!1078169) (not e!880111))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577937 (= res!1078169 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51488 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50936 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577938 () Bool)

(declare-fun res!1078168 () Bool)

(assert (=> b!1577938 (=> (not res!1078168) (not e!880111))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577938 (= res!1078168 (validKeyInArray!0 k0!772))))

(declare-fun b!1577939 () Bool)

(assert (=> b!1577939 (= e!880111 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50936 _keys!614) ee!18) k0!772)) (= (select (arr!50936 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!10 (size!51488 _keys!614))))))

(assert (= (and start!136618 res!1078170) b!1577937))

(assert (= (and b!1577937 res!1078169) b!1577938))

(assert (= (and b!1577938 res!1078168) b!1577939))

(declare-fun m!1449459 () Bool)

(assert (=> start!136618 m!1449459))

(declare-fun m!1449461 () Bool)

(assert (=> start!136618 m!1449461))

(declare-fun m!1449463 () Bool)

(assert (=> b!1577937 m!1449463))

(declare-fun m!1449465 () Bool)

(assert (=> b!1577938 m!1449465))

(declare-fun m!1449467 () Bool)

(assert (=> b!1577939 m!1449467))

(check-sat (not start!136618) (not b!1577938))
(check-sat)
