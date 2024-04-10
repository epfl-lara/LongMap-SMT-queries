; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136572 () Bool)

(assert start!136572)

(declare-fun b!1577960 () Bool)

(declare-fun res!1078005 () Bool)

(declare-fun e!880135 () Bool)

(assert (=> b!1577960 (=> (not res!1078005) (not e!880135))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105655 0))(
  ( (array!105656 (arr!50942 (Array (_ BitVec 32) (_ BitVec 64))) (size!51492 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105655)

(declare-fun k0!772 () (_ BitVec 64))

(assert (=> b!1577960 (= res!1078005 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50942 _keys!614) ee!18) k0!772)) (not (= (select (arr!50942 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577961 () Bool)

(assert (=> b!1577961 (= e!880135 false)))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun lt!676150 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577961 (= lt!676150 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577958 () Bool)

(declare-fun res!1078007 () Bool)

(assert (=> b!1577958 (=> (not res!1078007) (not e!880135))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577958 (= res!1078007 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51492 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50942 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577959 () Bool)

(declare-fun res!1078006 () Bool)

(assert (=> b!1577959 (=> (not res!1078006) (not e!880135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577959 (= res!1078006 (validKeyInArray!0 k0!772))))

(declare-fun res!1078008 () Bool)

(assert (=> start!136572 (=> (not res!1078008) (not e!880135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136572 (= res!1078008 (validMask!0 mask!918))))

(assert (=> start!136572 e!880135))

(assert (=> start!136572 true))

(declare-fun array_inv!39669 (array!105655) Bool)

(assert (=> start!136572 (array_inv!39669 _keys!614)))

(assert (= (and start!136572 res!1078008) b!1577958))

(assert (= (and b!1577958 res!1078007) b!1577959))

(assert (= (and b!1577959 res!1078006) b!1577960))

(assert (= (and b!1577960 res!1078005) b!1577961))

(declare-fun m!1450051 () Bool)

(assert (=> b!1577958 m!1450051))

(declare-fun m!1450053 () Bool)

(assert (=> b!1577959 m!1450053))

(declare-fun m!1450055 () Bool)

(assert (=> start!136572 m!1450055))

(declare-fun m!1450057 () Bool)

(assert (=> start!136572 m!1450057))

(declare-fun m!1450059 () Bool)

(assert (=> b!1577960 m!1450059))

(declare-fun m!1450061 () Bool)

(assert (=> b!1577961 m!1450061))

(check-sat (not b!1577959) (not start!136572) (not b!1577961))
