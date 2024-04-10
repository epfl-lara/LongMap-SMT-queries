; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136656 () Bool)

(assert start!136656)

(declare-fun res!1078308 () Bool)

(declare-fun e!880316 () Bool)

(assert (=> start!136656 (=> (not res!1078308) (not e!880316))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136656 (= res!1078308 (validMask!0 mask!918))))

(assert (=> start!136656 e!880316))

(assert (=> start!136656 true))

(declare-datatypes ((array!105718 0))(
  ( (array!105719 (arr!50972 (Array (_ BitVec 32) (_ BitVec 64))) (size!51522 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105718)

(declare-fun array_inv!39699 (array!105718) Bool)

(assert (=> start!136656 (array_inv!39699 _keys!614)))

(declare-fun b!1578259 () Bool)

(declare-fun res!1078307 () Bool)

(assert (=> b!1578259 (=> (not res!1078307) (not e!880316))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578259 (= res!1078307 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51522 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50972 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578260 () Bool)

(declare-fun res!1078306 () Bool)

(assert (=> b!1578260 (=> (not res!1078306) (not e!880316))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578260 (= res!1078306 (validKeyInArray!0 k0!772))))

(declare-fun b!1578261 () Bool)

(assert (=> b!1578261 (= e!880316 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50972 _keys!614) ee!18) k0!772)) (= (select (arr!50972 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!10 (size!51522 _keys!614))))))

(assert (= (and start!136656 res!1078308) b!1578259))

(assert (= (and b!1578259 res!1078307) b!1578260))

(assert (= (and b!1578260 res!1078306) b!1578261))

(declare-fun m!1450361 () Bool)

(assert (=> start!136656 m!1450361))

(declare-fun m!1450363 () Bool)

(assert (=> start!136656 m!1450363))

(declare-fun m!1450365 () Bool)

(assert (=> b!1578259 m!1450365))

(declare-fun m!1450367 () Bool)

(assert (=> b!1578260 m!1450367))

(declare-fun m!1450369 () Bool)

(assert (=> b!1578261 m!1450369))

(check-sat (not b!1578260) (not start!136656))
(check-sat)
