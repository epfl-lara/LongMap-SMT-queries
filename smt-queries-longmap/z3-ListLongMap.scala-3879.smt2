; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53286 () Bool)

(assert start!53286)

(declare-fun b!579375 () Bool)

(declare-fun e!332977 () Bool)

(declare-fun e!332979 () Bool)

(assert (=> b!579375 (= e!332977 e!332979)))

(declare-fun res!367199 () Bool)

(assert (=> b!579375 (=> (not res!367199) (not e!332979))))

(declare-datatypes ((SeekEntryResult!5808 0))(
  ( (MissingZero!5808 (index!25459 (_ BitVec 32))) (Found!5808 (index!25460 (_ BitVec 32))) (Intermediate!5808 (undefined!6620 Bool) (index!25461 (_ BitVec 32)) (x!54349 (_ BitVec 32))) (Undefined!5808) (MissingVacant!5808 (index!25462 (_ BitVec 32))) )
))
(declare-fun lt!264469 () SeekEntryResult!5808)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579375 (= res!367199 (or (= lt!264469 (MissingZero!5808 i!1108)) (= lt!264469 (MissingVacant!5808 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36187 0))(
  ( (array!36188 (arr!17368 (Array (_ BitVec 32) (_ BitVec 64))) (size!17732 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36187)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36187 (_ BitVec 32)) SeekEntryResult!5808)

(assert (=> b!579375 (= lt!264469 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579376 () Bool)

(declare-fun res!367195 () Bool)

(assert (=> b!579376 (=> (not res!367195) (not e!332977))))

(declare-fun arrayContainsKey!0 (array!36187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579376 (= res!367195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579377 () Bool)

(declare-fun res!367192 () Bool)

(assert (=> b!579377 (=> (not res!367192) (not e!332979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36187 (_ BitVec 32)) Bool)

(assert (=> b!579377 (= res!367192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579378 () Bool)

(declare-fun res!367196 () Bool)

(assert (=> b!579378 (=> (not res!367196) (not e!332979))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579378 (= res!367196 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17368 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17368 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579379 () Bool)

(declare-fun res!367198 () Bool)

(assert (=> b!579379 (=> (not res!367198) (not e!332979))))

(declare-datatypes ((List!11409 0))(
  ( (Nil!11406) (Cons!11405 (h!12450 (_ BitVec 64)) (t!17637 List!11409)) )
))
(declare-fun arrayNoDuplicates!0 (array!36187 (_ BitVec 32) List!11409) Bool)

(assert (=> b!579379 (= res!367198 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11406))))

(declare-fun b!579380 () Bool)

(declare-fun res!367193 () Bool)

(assert (=> b!579380 (=> (not res!367193) (not e!332977))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579380 (= res!367193 (and (= (size!17732 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17732 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17732 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579381 () Bool)

(assert (=> b!579381 (= e!332979 false)))

(declare-fun lt!264468 () SeekEntryResult!5808)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36187 (_ BitVec 32)) SeekEntryResult!5808)

(assert (=> b!579381 (= lt!264468 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17368 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!367194 () Bool)

(assert (=> start!53286 (=> (not res!367194) (not e!332977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53286 (= res!367194 (validMask!0 mask!3053))))

(assert (=> start!53286 e!332977))

(assert (=> start!53286 true))

(declare-fun array_inv!13164 (array!36187) Bool)

(assert (=> start!53286 (array_inv!13164 a!2986)))

(declare-fun b!579382 () Bool)

(declare-fun res!367197 () Bool)

(assert (=> b!579382 (=> (not res!367197) (not e!332977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579382 (= res!367197 (validKeyInArray!0 k0!1786))))

(declare-fun b!579383 () Bool)

(declare-fun res!367191 () Bool)

(assert (=> b!579383 (=> (not res!367191) (not e!332977))))

(assert (=> b!579383 (= res!367191 (validKeyInArray!0 (select (arr!17368 a!2986) j!136)))))

(assert (= (and start!53286 res!367194) b!579380))

(assert (= (and b!579380 res!367193) b!579383))

(assert (= (and b!579383 res!367191) b!579382))

(assert (= (and b!579382 res!367197) b!579376))

(assert (= (and b!579376 res!367195) b!579375))

(assert (= (and b!579375 res!367199) b!579377))

(assert (= (and b!579377 res!367192) b!579379))

(assert (= (and b!579379 res!367198) b!579378))

(assert (= (and b!579378 res!367196) b!579381))

(declare-fun m!557997 () Bool)

(assert (=> b!579379 m!557997))

(declare-fun m!557999 () Bool)

(assert (=> b!579375 m!557999))

(declare-fun m!558001 () Bool)

(assert (=> b!579383 m!558001))

(assert (=> b!579383 m!558001))

(declare-fun m!558003 () Bool)

(assert (=> b!579383 m!558003))

(declare-fun m!558005 () Bool)

(assert (=> b!579377 m!558005))

(declare-fun m!558007 () Bool)

(assert (=> b!579378 m!558007))

(declare-fun m!558009 () Bool)

(assert (=> b!579378 m!558009))

(declare-fun m!558011 () Bool)

(assert (=> b!579378 m!558011))

(declare-fun m!558013 () Bool)

(assert (=> start!53286 m!558013))

(declare-fun m!558015 () Bool)

(assert (=> start!53286 m!558015))

(declare-fun m!558017 () Bool)

(assert (=> b!579382 m!558017))

(declare-fun m!558019 () Bool)

(assert (=> b!579376 m!558019))

(assert (=> b!579381 m!558001))

(assert (=> b!579381 m!558001))

(declare-fun m!558021 () Bool)

(assert (=> b!579381 m!558021))

(check-sat (not b!579383) (not b!579382) (not b!579376) (not b!579379) (not b!579381) (not start!53286) (not b!579377) (not b!579375))
(check-sat)
