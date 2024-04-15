; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53286 () Bool)

(assert start!53286)

(declare-fun b!579320 () Bool)

(declare-fun res!367282 () Bool)

(declare-fun e!332877 () Bool)

(assert (=> b!579320 (=> (not res!367282) (not e!332877))))

(declare-datatypes ((array!36201 0))(
  ( (array!36202 (arr!17375 (Array (_ BitVec 32) (_ BitVec 64))) (size!17740 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36201)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579320 (= res!367282 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579321 () Bool)

(declare-fun res!367281 () Bool)

(assert (=> b!579321 (=> (not res!367281) (not e!332877))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579321 (= res!367281 (validKeyInArray!0 (select (arr!17375 a!2986) j!136)))))

(declare-fun b!579322 () Bool)

(declare-fun e!332875 () Bool)

(assert (=> b!579322 (= e!332875 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5812 0))(
  ( (MissingZero!5812 (index!25475 (_ BitVec 32))) (Found!5812 (index!25476 (_ BitVec 32))) (Intermediate!5812 (undefined!6624 Bool) (index!25477 (_ BitVec 32)) (x!54372 (_ BitVec 32))) (Undefined!5812) (MissingVacant!5812 (index!25478 (_ BitVec 32))) )
))
(declare-fun lt!264283 () SeekEntryResult!5812)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36201 (_ BitVec 32)) SeekEntryResult!5812)

(assert (=> b!579322 (= lt!264283 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17375 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579323 () Bool)

(declare-fun res!367285 () Bool)

(assert (=> b!579323 (=> (not res!367285) (not e!332877))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579323 (= res!367285 (and (= (size!17740 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17740 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17740 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579324 () Bool)

(declare-fun res!367278 () Bool)

(assert (=> b!579324 (=> (not res!367278) (not e!332877))))

(assert (=> b!579324 (= res!367278 (validKeyInArray!0 k0!1786))))

(declare-fun b!579326 () Bool)

(declare-fun res!367280 () Bool)

(assert (=> b!579326 (=> (not res!367280) (not e!332875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36201 (_ BitVec 32)) Bool)

(assert (=> b!579326 (= res!367280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!367286 () Bool)

(assert (=> start!53286 (=> (not res!367286) (not e!332877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53286 (= res!367286 (validMask!0 mask!3053))))

(assert (=> start!53286 e!332877))

(assert (=> start!53286 true))

(declare-fun array_inv!13258 (array!36201) Bool)

(assert (=> start!53286 (array_inv!13258 a!2986)))

(declare-fun b!579325 () Bool)

(declare-fun res!367279 () Bool)

(assert (=> b!579325 (=> (not res!367279) (not e!332875))))

(assert (=> b!579325 (= res!367279 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17375 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17375 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579327 () Bool)

(assert (=> b!579327 (= e!332877 e!332875)))

(declare-fun res!367284 () Bool)

(assert (=> b!579327 (=> (not res!367284) (not e!332875))))

(declare-fun lt!264282 () SeekEntryResult!5812)

(assert (=> b!579327 (= res!367284 (or (= lt!264282 (MissingZero!5812 i!1108)) (= lt!264282 (MissingVacant!5812 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36201 (_ BitVec 32)) SeekEntryResult!5812)

(assert (=> b!579327 (= lt!264282 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579328 () Bool)

(declare-fun res!367283 () Bool)

(assert (=> b!579328 (=> (not res!367283) (not e!332875))))

(declare-datatypes ((List!11455 0))(
  ( (Nil!11452) (Cons!11451 (h!12496 (_ BitVec 64)) (t!17674 List!11455)) )
))
(declare-fun arrayNoDuplicates!0 (array!36201 (_ BitVec 32) List!11455) Bool)

(assert (=> b!579328 (= res!367283 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11452))))

(assert (= (and start!53286 res!367286) b!579323))

(assert (= (and b!579323 res!367285) b!579321))

(assert (= (and b!579321 res!367281) b!579324))

(assert (= (and b!579324 res!367278) b!579320))

(assert (= (and b!579320 res!367282) b!579327))

(assert (= (and b!579327 res!367284) b!579326))

(assert (= (and b!579326 res!367280) b!579328))

(assert (= (and b!579328 res!367283) b!579325))

(assert (= (and b!579325 res!367279) b!579322))

(declare-fun m!557419 () Bool)

(assert (=> b!579326 m!557419))

(declare-fun m!557421 () Bool)

(assert (=> b!579324 m!557421))

(declare-fun m!557423 () Bool)

(assert (=> b!579328 m!557423))

(declare-fun m!557425 () Bool)

(assert (=> b!579327 m!557425))

(declare-fun m!557427 () Bool)

(assert (=> b!579320 m!557427))

(declare-fun m!557429 () Bool)

(assert (=> b!579321 m!557429))

(assert (=> b!579321 m!557429))

(declare-fun m!557431 () Bool)

(assert (=> b!579321 m!557431))

(assert (=> b!579322 m!557429))

(assert (=> b!579322 m!557429))

(declare-fun m!557433 () Bool)

(assert (=> b!579322 m!557433))

(declare-fun m!557435 () Bool)

(assert (=> b!579325 m!557435))

(declare-fun m!557437 () Bool)

(assert (=> b!579325 m!557437))

(declare-fun m!557439 () Bool)

(assert (=> b!579325 m!557439))

(declare-fun m!557441 () Bool)

(assert (=> start!53286 m!557441))

(declare-fun m!557443 () Bool)

(assert (=> start!53286 m!557443))

(check-sat (not b!579324) (not b!579322) (not b!579327) (not b!579326) (not b!579321) (not b!579328) (not b!579320) (not start!53286))
(check-sat)
