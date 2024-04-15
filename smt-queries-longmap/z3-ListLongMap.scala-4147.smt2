; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56556 () Bool)

(assert start!56556)

(declare-fun b!626354 () Bool)

(declare-fun res!404202 () Bool)

(declare-fun e!358841 () Bool)

(assert (=> b!626354 (=> (not res!404202) (not e!358841))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626354 (= res!404202 (validKeyInArray!0 k0!1786))))

(declare-fun b!626355 () Bool)

(declare-fun e!358840 () Bool)

(assert (=> b!626355 (= e!358841 e!358840)))

(declare-fun res!404201 () Bool)

(assert (=> b!626355 (=> (not res!404201) (not e!358840))))

(declare-datatypes ((SeekEntryResult!6607 0))(
  ( (MissingZero!6607 (index!28712 (_ BitVec 32))) (Found!6607 (index!28713 (_ BitVec 32))) (Intermediate!6607 (undefined!7419 Bool) (index!28714 (_ BitVec 32)) (x!57470 (_ BitVec 32))) (Undefined!6607) (MissingVacant!6607 (index!28715 (_ BitVec 32))) )
))
(declare-fun lt!289884 () SeekEntryResult!6607)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626355 (= res!404201 (or (= lt!289884 (MissingZero!6607 i!1108)) (= lt!289884 (MissingVacant!6607 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37860 0))(
  ( (array!37861 (arr!18170 (Array (_ BitVec 32) (_ BitVec 64))) (size!18535 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37860)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37860 (_ BitVec 32)) SeekEntryResult!6607)

(assert (=> b!626355 (= lt!289884 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626356 () Bool)

(assert (=> b!626356 (= e!358840 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!289885 () SeekEntryResult!6607)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37860 (_ BitVec 32)) SeekEntryResult!6607)

(assert (=> b!626356 (= lt!289885 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18170 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626358 () Bool)

(declare-fun res!404200 () Bool)

(assert (=> b!626358 (=> (not res!404200) (not e!358841))))

(assert (=> b!626358 (= res!404200 (validKeyInArray!0 (select (arr!18170 a!2986) j!136)))))

(declare-fun b!626359 () Bool)

(declare-fun res!404198 () Bool)

(assert (=> b!626359 (=> (not res!404198) (not e!358840))))

(assert (=> b!626359 (= res!404198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18170 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18170 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626360 () Bool)

(declare-fun res!404203 () Bool)

(assert (=> b!626360 (=> (not res!404203) (not e!358840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37860 (_ BitVec 32)) Bool)

(assert (=> b!626360 (= res!404203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626361 () Bool)

(declare-fun res!404196 () Bool)

(assert (=> b!626361 (=> (not res!404196) (not e!358841))))

(declare-fun arrayContainsKey!0 (array!37860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626361 (= res!404196 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626362 () Bool)

(declare-fun res!404199 () Bool)

(assert (=> b!626362 (=> (not res!404199) (not e!358840))))

(declare-datatypes ((List!12250 0))(
  ( (Nil!12247) (Cons!12246 (h!13291 (_ BitVec 64)) (t!18469 List!12250)) )
))
(declare-fun arrayNoDuplicates!0 (array!37860 (_ BitVec 32) List!12250) Bool)

(assert (=> b!626362 (= res!404199 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12247))))

(declare-fun b!626357 () Bool)

(declare-fun res!404204 () Bool)

(assert (=> b!626357 (=> (not res!404204) (not e!358841))))

(assert (=> b!626357 (= res!404204 (and (= (size!18535 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18535 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18535 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!404197 () Bool)

(assert (=> start!56556 (=> (not res!404197) (not e!358841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56556 (= res!404197 (validMask!0 mask!3053))))

(assert (=> start!56556 e!358841))

(assert (=> start!56556 true))

(declare-fun array_inv!14053 (array!37860) Bool)

(assert (=> start!56556 (array_inv!14053 a!2986)))

(assert (= (and start!56556 res!404197) b!626357))

(assert (= (and b!626357 res!404204) b!626358))

(assert (= (and b!626358 res!404200) b!626354))

(assert (= (and b!626354 res!404202) b!626361))

(assert (= (and b!626361 res!404196) b!626355))

(assert (= (and b!626355 res!404201) b!626360))

(assert (= (and b!626360 res!404203) b!626362))

(assert (= (and b!626362 res!404199) b!626359))

(assert (= (and b!626359 res!404198) b!626356))

(declare-fun m!601231 () Bool)

(assert (=> b!626359 m!601231))

(declare-fun m!601233 () Bool)

(assert (=> b!626359 m!601233))

(declare-fun m!601235 () Bool)

(assert (=> b!626359 m!601235))

(declare-fun m!601237 () Bool)

(assert (=> start!56556 m!601237))

(declare-fun m!601239 () Bool)

(assert (=> start!56556 m!601239))

(declare-fun m!601241 () Bool)

(assert (=> b!626356 m!601241))

(assert (=> b!626356 m!601241))

(declare-fun m!601243 () Bool)

(assert (=> b!626356 m!601243))

(declare-fun m!601245 () Bool)

(assert (=> b!626354 m!601245))

(declare-fun m!601247 () Bool)

(assert (=> b!626360 m!601247))

(declare-fun m!601249 () Bool)

(assert (=> b!626362 m!601249))

(declare-fun m!601251 () Bool)

(assert (=> b!626355 m!601251))

(assert (=> b!626358 m!601241))

(assert (=> b!626358 m!601241))

(declare-fun m!601253 () Bool)

(assert (=> b!626358 m!601253))

(declare-fun m!601255 () Bool)

(assert (=> b!626361 m!601255))

(check-sat (not start!56556) (not b!626361) (not b!626358) (not b!626360) (not b!626354) (not b!626355) (not b!626362) (not b!626356))
(check-sat)
