; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57150 () Bool)

(assert start!57150)

(declare-fun b!632246 () Bool)

(declare-fun e!361486 () Bool)

(declare-fun e!361489 () Bool)

(assert (=> b!632246 (= e!361486 e!361489)))

(declare-fun res!408798 () Bool)

(assert (=> b!632246 (=> (not res!408798) (not e!361489))))

(declare-datatypes ((SeekEntryResult!6682 0))(
  ( (MissingZero!6682 (index!29021 (_ BitVec 32))) (Found!6682 (index!29022 (_ BitVec 32))) (Intermediate!6682 (undefined!7494 Bool) (index!29023 (_ BitVec 32)) (x!57912 (_ BitVec 32))) (Undefined!6682) (MissingVacant!6682 (index!29024 (_ BitVec 32))) )
))
(declare-fun lt!292153 () SeekEntryResult!6682)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632246 (= res!408798 (or (= lt!292153 (MissingZero!6682 i!1108)) (= lt!292153 (MissingVacant!6682 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38112 0))(
  ( (array!38113 (arr!18286 (Array (_ BitVec 32) (_ BitVec 64))) (size!18650 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38112)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38112 (_ BitVec 32)) SeekEntryResult!6682)

(assert (=> b!632246 (= lt!292153 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632247 () Bool)

(declare-fun res!408799 () Bool)

(assert (=> b!632247 (=> (not res!408799) (not e!361486))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!632247 (= res!408799 (and (= (size!18650 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18650 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18650 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632248 () Bool)

(declare-fun e!361485 () Bool)

(declare-fun lt!292158 () SeekEntryResult!6682)

(declare-fun lt!292154 () SeekEntryResult!6682)

(assert (=> b!632248 (= e!361485 (= lt!292158 lt!292154))))

(declare-fun b!632249 () Bool)

(declare-fun res!408802 () Bool)

(assert (=> b!632249 (=> (not res!408802) (not e!361486))))

(declare-fun arrayContainsKey!0 (array!38112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632249 (= res!408802 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632250 () Bool)

(declare-fun res!408796 () Bool)

(assert (=> b!632250 (=> (not res!408796) (not e!361486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632250 (= res!408796 (validKeyInArray!0 k0!1786))))

(declare-fun b!632251 () Bool)

(declare-fun e!361484 () Bool)

(assert (=> b!632251 (= e!361484 true)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632251 (= (select (store (arr!18286 a!2986) i!1108 k0!1786) index!984) (select (arr!18286 a!2986) j!136))))

(declare-fun b!632252 () Bool)

(declare-fun res!408793 () Bool)

(assert (=> b!632252 (=> (not res!408793) (not e!361486))))

(assert (=> b!632252 (= res!408793 (validKeyInArray!0 (select (arr!18286 a!2986) j!136)))))

(declare-fun b!632253 () Bool)

(declare-fun e!361490 () Bool)

(assert (=> b!632253 (= e!361490 (not e!361484))))

(declare-fun res!408800 () Bool)

(assert (=> b!632253 (=> res!408800 e!361484)))

(declare-fun lt!292156 () SeekEntryResult!6682)

(assert (=> b!632253 (= res!408800 (not (= lt!292156 (Found!6682 index!984))))))

(declare-datatypes ((Unit!21237 0))(
  ( (Unit!21238) )
))
(declare-fun lt!292159 () Unit!21237)

(declare-fun e!361487 () Unit!21237)

(assert (=> b!632253 (= lt!292159 e!361487)))

(declare-fun c!72095 () Bool)

(assert (=> b!632253 (= c!72095 (= lt!292156 Undefined!6682))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!292157 () array!38112)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292155 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38112 (_ BitVec 32)) SeekEntryResult!6682)

(assert (=> b!632253 (= lt!292156 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292155 lt!292157 mask!3053))))

(assert (=> b!632253 e!361485))

(declare-fun res!408797 () Bool)

(assert (=> b!632253 (=> (not res!408797) (not e!361485))))

(declare-fun lt!292151 () (_ BitVec 32))

(assert (=> b!632253 (= res!408797 (= lt!292154 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292151 vacantSpotIndex!68 lt!292155 lt!292157 mask!3053)))))

(assert (=> b!632253 (= lt!292154 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292151 vacantSpotIndex!68 (select (arr!18286 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632253 (= lt!292155 (select (store (arr!18286 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292152 () Unit!21237)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38112 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21237)

(assert (=> b!632253 (= lt!292152 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292151 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632253 (= lt!292151 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!632255 () Bool)

(declare-fun res!408801 () Bool)

(assert (=> b!632255 (=> (not res!408801) (not e!361489))))

(assert (=> b!632255 (= res!408801 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18286 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632256 () Bool)

(declare-fun Unit!21239 () Unit!21237)

(assert (=> b!632256 (= e!361487 Unit!21239)))

(assert (=> b!632256 false))

(declare-fun b!632257 () Bool)

(declare-fun res!408794 () Bool)

(assert (=> b!632257 (=> (not res!408794) (not e!361489))))

(declare-datatypes ((List!12234 0))(
  ( (Nil!12231) (Cons!12230 (h!13278 (_ BitVec 64)) (t!18454 List!12234)) )
))
(declare-fun arrayNoDuplicates!0 (array!38112 (_ BitVec 32) List!12234) Bool)

(assert (=> b!632257 (= res!408794 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12231))))

(declare-fun b!632258 () Bool)

(declare-fun e!361491 () Bool)

(assert (=> b!632258 (= e!361489 e!361491)))

(declare-fun res!408805 () Bool)

(assert (=> b!632258 (=> (not res!408805) (not e!361491))))

(assert (=> b!632258 (= res!408805 (= (select (store (arr!18286 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632258 (= lt!292157 (array!38113 (store (arr!18286 a!2986) i!1108 k0!1786) (size!18650 a!2986)))))

(declare-fun b!632254 () Bool)

(declare-fun res!408795 () Bool)

(assert (=> b!632254 (=> (not res!408795) (not e!361489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38112 (_ BitVec 32)) Bool)

(assert (=> b!632254 (= res!408795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!408803 () Bool)

(assert (=> start!57150 (=> (not res!408803) (not e!361486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57150 (= res!408803 (validMask!0 mask!3053))))

(assert (=> start!57150 e!361486))

(assert (=> start!57150 true))

(declare-fun array_inv!14145 (array!38112) Bool)

(assert (=> start!57150 (array_inv!14145 a!2986)))

(declare-fun b!632259 () Bool)

(declare-fun Unit!21240 () Unit!21237)

(assert (=> b!632259 (= e!361487 Unit!21240)))

(declare-fun b!632260 () Bool)

(assert (=> b!632260 (= e!361491 e!361490)))

(declare-fun res!408804 () Bool)

(assert (=> b!632260 (=> (not res!408804) (not e!361490))))

(assert (=> b!632260 (= res!408804 (and (= lt!292158 (Found!6682 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18286 a!2986) index!984) (select (arr!18286 a!2986) j!136))) (not (= (select (arr!18286 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632260 (= lt!292158 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18286 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57150 res!408803) b!632247))

(assert (= (and b!632247 res!408799) b!632252))

(assert (= (and b!632252 res!408793) b!632250))

(assert (= (and b!632250 res!408796) b!632249))

(assert (= (and b!632249 res!408802) b!632246))

(assert (= (and b!632246 res!408798) b!632254))

(assert (= (and b!632254 res!408795) b!632257))

(assert (= (and b!632257 res!408794) b!632255))

(assert (= (and b!632255 res!408801) b!632258))

(assert (= (and b!632258 res!408805) b!632260))

(assert (= (and b!632260 res!408804) b!632253))

(assert (= (and b!632253 res!408797) b!632248))

(assert (= (and b!632253 c!72095) b!632256))

(assert (= (and b!632253 (not c!72095)) b!632259))

(assert (= (and b!632253 (not res!408800)) b!632251))

(declare-fun m!607411 () Bool)

(assert (=> b!632250 m!607411))

(declare-fun m!607413 () Bool)

(assert (=> b!632257 m!607413))

(declare-fun m!607415 () Bool)

(assert (=> b!632249 m!607415))

(declare-fun m!607417 () Bool)

(assert (=> b!632260 m!607417))

(declare-fun m!607419 () Bool)

(assert (=> b!632260 m!607419))

(assert (=> b!632260 m!607419))

(declare-fun m!607421 () Bool)

(assert (=> b!632260 m!607421))

(declare-fun m!607423 () Bool)

(assert (=> b!632253 m!607423))

(assert (=> b!632253 m!607419))

(declare-fun m!607425 () Bool)

(assert (=> b!632253 m!607425))

(declare-fun m!607427 () Bool)

(assert (=> b!632253 m!607427))

(assert (=> b!632253 m!607419))

(declare-fun m!607429 () Bool)

(assert (=> b!632253 m!607429))

(declare-fun m!607431 () Bool)

(assert (=> b!632253 m!607431))

(declare-fun m!607433 () Bool)

(assert (=> b!632253 m!607433))

(declare-fun m!607435 () Bool)

(assert (=> b!632253 m!607435))

(assert (=> b!632258 m!607425))

(declare-fun m!607437 () Bool)

(assert (=> b!632258 m!607437))

(declare-fun m!607439 () Bool)

(assert (=> b!632254 m!607439))

(assert (=> b!632251 m!607425))

(declare-fun m!607441 () Bool)

(assert (=> b!632251 m!607441))

(assert (=> b!632251 m!607419))

(declare-fun m!607443 () Bool)

(assert (=> start!57150 m!607443))

(declare-fun m!607445 () Bool)

(assert (=> start!57150 m!607445))

(declare-fun m!607447 () Bool)

(assert (=> b!632255 m!607447))

(declare-fun m!607449 () Bool)

(assert (=> b!632246 m!607449))

(assert (=> b!632252 m!607419))

(assert (=> b!632252 m!607419))

(declare-fun m!607451 () Bool)

(assert (=> b!632252 m!607451))

(check-sat (not b!632253) (not b!632250) (not b!632257) (not b!632249) (not b!632260) (not start!57150) (not b!632254) (not b!632252) (not b!632246))
(check-sat)
