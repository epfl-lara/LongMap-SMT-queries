; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53586 () Bool)

(assert start!53586)

(declare-fun b!583475 () Bool)

(declare-fun res!371438 () Bool)

(declare-fun e!334247 () Bool)

(assert (=> b!583475 (=> (not res!371438) (not e!334247))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36501 0))(
  ( (array!36502 (arr!17525 (Array (_ BitVec 32) (_ BitVec 64))) (size!17890 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36501)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583475 (= res!371438 (and (= (size!17890 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17890 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17890 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!371437 () Bool)

(assert (=> start!53586 (=> (not res!371437) (not e!334247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53586 (= res!371437 (validMask!0 mask!3053))))

(assert (=> start!53586 e!334247))

(assert (=> start!53586 true))

(declare-fun array_inv!13408 (array!36501) Bool)

(assert (=> start!53586 (array_inv!13408 a!2986)))

(declare-fun b!583476 () Bool)

(declare-fun res!371439 () Bool)

(assert (=> b!583476 (=> (not res!371439) (not e!334247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583476 (= res!371439 (validKeyInArray!0 (select (arr!17525 a!2986) j!136)))))

(declare-fun b!583477 () Bool)

(declare-fun e!334245 () Bool)

(declare-fun e!334246 () Bool)

(assert (=> b!583477 (= e!334245 e!334246)))

(declare-fun res!371444 () Bool)

(assert (=> b!583477 (=> (not res!371444) (not e!334246))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265168 () (_ BitVec 32))

(assert (=> b!583477 (= res!371444 (and (bvsge lt!265168 #b00000000000000000000000000000000) (bvslt lt!265168 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583477 (= lt!265168 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583478 () Bool)

(declare-fun res!371435 () Bool)

(assert (=> b!583478 (=> (not res!371435) (not e!334245))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!583478 (= res!371435 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17525 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17525 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583479 () Bool)

(declare-fun res!371433 () Bool)

(assert (=> b!583479 (=> (not res!371433) (not e!334245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36501 (_ BitVec 32)) Bool)

(assert (=> b!583479 (= res!371433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583480 () Bool)

(assert (=> b!583480 (= e!334247 e!334245)))

(declare-fun res!371442 () Bool)

(assert (=> b!583480 (=> (not res!371442) (not e!334245))))

(declare-datatypes ((SeekEntryResult!5962 0))(
  ( (MissingZero!5962 (index!26075 (_ BitVec 32))) (Found!5962 (index!26076 (_ BitVec 32))) (Intermediate!5962 (undefined!6774 Bool) (index!26077 (_ BitVec 32)) (x!54922 (_ BitVec 32))) (Undefined!5962) (MissingVacant!5962 (index!26078 (_ BitVec 32))) )
))
(declare-fun lt!265166 () SeekEntryResult!5962)

(assert (=> b!583480 (= res!371442 (or (= lt!265166 (MissingZero!5962 i!1108)) (= lt!265166 (MissingVacant!5962 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36501 (_ BitVec 32)) SeekEntryResult!5962)

(assert (=> b!583480 (= lt!265166 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583481 () Bool)

(declare-fun res!371441 () Bool)

(assert (=> b!583481 (=> (not res!371441) (not e!334245))))

(declare-datatypes ((List!11605 0))(
  ( (Nil!11602) (Cons!11601 (h!12646 (_ BitVec 64)) (t!17824 List!11605)) )
))
(declare-fun arrayNoDuplicates!0 (array!36501 (_ BitVec 32) List!11605) Bool)

(assert (=> b!583481 (= res!371441 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11602))))

(declare-fun b!583482 () Bool)

(assert (=> b!583482 (= e!334246 false)))

(declare-fun lt!265167 () SeekEntryResult!5962)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36501 (_ BitVec 32)) SeekEntryResult!5962)

(assert (=> b!583482 (= lt!265167 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265168 vacantSpotIndex!68 (select (arr!17525 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583483 () Bool)

(declare-fun res!371434 () Bool)

(assert (=> b!583483 (=> (not res!371434) (not e!334247))))

(assert (=> b!583483 (= res!371434 (validKeyInArray!0 k0!1786))))

(declare-fun b!583484 () Bool)

(declare-fun res!371436 () Bool)

(assert (=> b!583484 (=> (not res!371436) (not e!334245))))

(assert (=> b!583484 (= res!371436 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17525 a!2986) j!136) a!2986 mask!3053) (Found!5962 j!136)))))

(declare-fun b!583485 () Bool)

(declare-fun res!371440 () Bool)

(assert (=> b!583485 (=> (not res!371440) (not e!334247))))

(declare-fun arrayContainsKey!0 (array!36501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583485 (= res!371440 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583486 () Bool)

(declare-fun res!371443 () Bool)

(assert (=> b!583486 (=> (not res!371443) (not e!334245))))

(assert (=> b!583486 (= res!371443 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17525 a!2986) index!984) (select (arr!17525 a!2986) j!136))) (not (= (select (arr!17525 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53586 res!371437) b!583475))

(assert (= (and b!583475 res!371438) b!583476))

(assert (= (and b!583476 res!371439) b!583483))

(assert (= (and b!583483 res!371434) b!583485))

(assert (= (and b!583485 res!371440) b!583480))

(assert (= (and b!583480 res!371442) b!583479))

(assert (= (and b!583479 res!371433) b!583481))

(assert (= (and b!583481 res!371441) b!583478))

(assert (= (and b!583478 res!371435) b!583484))

(assert (= (and b!583484 res!371436) b!583486))

(assert (= (and b!583486 res!371443) b!583477))

(assert (= (and b!583477 res!371444) b!583482))

(declare-fun m!561391 () Bool)

(assert (=> b!583478 m!561391))

(declare-fun m!561393 () Bool)

(assert (=> b!583478 m!561393))

(declare-fun m!561395 () Bool)

(assert (=> b!583478 m!561395))

(declare-fun m!561397 () Bool)

(assert (=> b!583485 m!561397))

(declare-fun m!561399 () Bool)

(assert (=> b!583486 m!561399))

(declare-fun m!561401 () Bool)

(assert (=> b!583486 m!561401))

(declare-fun m!561403 () Bool)

(assert (=> b!583480 m!561403))

(assert (=> b!583482 m!561401))

(assert (=> b!583482 m!561401))

(declare-fun m!561405 () Bool)

(assert (=> b!583482 m!561405))

(declare-fun m!561407 () Bool)

(assert (=> b!583477 m!561407))

(assert (=> b!583476 m!561401))

(assert (=> b!583476 m!561401))

(declare-fun m!561409 () Bool)

(assert (=> b!583476 m!561409))

(declare-fun m!561411 () Bool)

(assert (=> b!583483 m!561411))

(declare-fun m!561413 () Bool)

(assert (=> start!53586 m!561413))

(declare-fun m!561415 () Bool)

(assert (=> start!53586 m!561415))

(declare-fun m!561417 () Bool)

(assert (=> b!583481 m!561417))

(declare-fun m!561419 () Bool)

(assert (=> b!583479 m!561419))

(assert (=> b!583484 m!561401))

(assert (=> b!583484 m!561401))

(declare-fun m!561421 () Bool)

(assert (=> b!583484 m!561421))

(check-sat (not b!583481) (not start!53586) (not b!583484) (not b!583476) (not b!583477) (not b!583485) (not b!583479) (not b!583483) (not b!583482) (not b!583480))
(check-sat)
