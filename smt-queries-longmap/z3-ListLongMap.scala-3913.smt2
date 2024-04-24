; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53538 () Bool)

(assert start!53538)

(declare-fun b!582338 () Bool)

(declare-fun res!370053 () Bool)

(declare-fun e!334017 () Bool)

(assert (=> b!582338 (=> (not res!370053) (not e!334017))))

(declare-datatypes ((array!36384 0))(
  ( (array!36385 (arr!17464 (Array (_ BitVec 32) (_ BitVec 64))) (size!17828 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36384)

(declare-datatypes ((List!11412 0))(
  ( (Nil!11409) (Cons!11408 (h!12456 (_ BitVec 64)) (t!17632 List!11412)) )
))
(declare-fun arrayNoDuplicates!0 (array!36384 (_ BitVec 32) List!11412) Bool)

(assert (=> b!582338 (= res!370053 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11409))))

(declare-fun b!582339 () Bool)

(declare-fun res!370051 () Bool)

(declare-fun e!334015 () Bool)

(assert (=> b!582339 (=> (not res!370051) (not e!334015))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582339 (= res!370051 (validKeyInArray!0 (select (arr!17464 a!2986) j!136)))))

(declare-fun res!370054 () Bool)

(assert (=> start!53538 (=> (not res!370054) (not e!334015))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53538 (= res!370054 (validMask!0 mask!3053))))

(assert (=> start!53538 e!334015))

(assert (=> start!53538 true))

(declare-fun array_inv!13323 (array!36384) Bool)

(assert (=> start!53538 (array_inv!13323 a!2986)))

(declare-fun b!582340 () Bool)

(declare-fun res!370057 () Bool)

(assert (=> b!582340 (=> (not res!370057) (not e!334017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36384 (_ BitVec 32)) Bool)

(assert (=> b!582340 (= res!370057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582341 () Bool)

(assert (=> b!582341 (= e!334017 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5860 0))(
  ( (MissingZero!5860 (index!25667 (_ BitVec 32))) (Found!5860 (index!25668 (_ BitVec 32))) (Intermediate!5860 (undefined!6672 Bool) (index!25669 (_ BitVec 32)) (x!54676 (_ BitVec 32))) (Undefined!5860) (MissingVacant!5860 (index!25670 (_ BitVec 32))) )
))
(declare-fun lt!265159 () SeekEntryResult!5860)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36384 (_ BitVec 32)) SeekEntryResult!5860)

(assert (=> b!582341 (= lt!265159 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17464 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582342 () Bool)

(declare-fun res!370052 () Bool)

(assert (=> b!582342 (=> (not res!370052) (not e!334015))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582342 (= res!370052 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582343 () Bool)

(declare-fun res!370050 () Bool)

(assert (=> b!582343 (=> (not res!370050) (not e!334015))))

(assert (=> b!582343 (= res!370050 (validKeyInArray!0 k0!1786))))

(declare-fun b!582344 () Bool)

(assert (=> b!582344 (= e!334015 e!334017)))

(declare-fun res!370049 () Bool)

(assert (=> b!582344 (=> (not res!370049) (not e!334017))))

(declare-fun lt!265158 () SeekEntryResult!5860)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582344 (= res!370049 (or (= lt!265158 (MissingZero!5860 i!1108)) (= lt!265158 (MissingVacant!5860 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36384 (_ BitVec 32)) SeekEntryResult!5860)

(assert (=> b!582344 (= lt!265158 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582345 () Bool)

(declare-fun res!370056 () Bool)

(assert (=> b!582345 (=> (not res!370056) (not e!334015))))

(assert (=> b!582345 (= res!370056 (and (= (size!17828 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17828 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17828 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582346 () Bool)

(declare-fun res!370055 () Bool)

(assert (=> b!582346 (=> (not res!370055) (not e!334017))))

(assert (=> b!582346 (= res!370055 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17464 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17464 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53538 res!370054) b!582345))

(assert (= (and b!582345 res!370056) b!582339))

(assert (= (and b!582339 res!370051) b!582343))

(assert (= (and b!582343 res!370050) b!582342))

(assert (= (and b!582342 res!370052) b!582344))

(assert (= (and b!582344 res!370049) b!582340))

(assert (= (and b!582340 res!370057) b!582338))

(assert (= (and b!582338 res!370053) b!582346))

(assert (= (and b!582346 res!370055) b!582341))

(declare-fun m!561005 () Bool)

(assert (=> b!582340 m!561005))

(declare-fun m!561007 () Bool)

(assert (=> start!53538 m!561007))

(declare-fun m!561009 () Bool)

(assert (=> start!53538 m!561009))

(declare-fun m!561011 () Bool)

(assert (=> b!582341 m!561011))

(assert (=> b!582341 m!561011))

(declare-fun m!561013 () Bool)

(assert (=> b!582341 m!561013))

(declare-fun m!561015 () Bool)

(assert (=> b!582338 m!561015))

(declare-fun m!561017 () Bool)

(assert (=> b!582343 m!561017))

(declare-fun m!561019 () Bool)

(assert (=> b!582344 m!561019))

(assert (=> b!582339 m!561011))

(assert (=> b!582339 m!561011))

(declare-fun m!561021 () Bool)

(assert (=> b!582339 m!561021))

(declare-fun m!561023 () Bool)

(assert (=> b!582346 m!561023))

(declare-fun m!561025 () Bool)

(assert (=> b!582346 m!561025))

(declare-fun m!561027 () Bool)

(assert (=> b!582346 m!561027))

(declare-fun m!561029 () Bool)

(assert (=> b!582342 m!561029))

(check-sat (not b!582338) (not b!582339) (not b!582343) (not b!582341) (not start!53538) (not b!582340) (not b!582342) (not b!582344))
(check-sat)
