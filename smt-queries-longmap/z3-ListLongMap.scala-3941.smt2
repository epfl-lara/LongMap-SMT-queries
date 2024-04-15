; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53640 () Bool)

(assert start!53640)

(declare-fun b!584447 () Bool)

(declare-fun res!372408 () Bool)

(declare-fun e!334571 () Bool)

(assert (=> b!584447 (=> (not res!372408) (not e!334571))))

(declare-datatypes ((array!36555 0))(
  ( (array!36556 (arr!17552 (Array (_ BitVec 32) (_ BitVec 64))) (size!17917 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36555)

(declare-datatypes ((List!11632 0))(
  ( (Nil!11629) (Cons!11628 (h!12673 (_ BitVec 64)) (t!17851 List!11632)) )
))
(declare-fun arrayNoDuplicates!0 (array!36555 (_ BitVec 32) List!11632) Bool)

(assert (=> b!584447 (= res!372408 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11629))))

(declare-fun b!584448 () Bool)

(declare-fun res!372413 () Bool)

(declare-fun e!334570 () Bool)

(assert (=> b!584448 (=> (not res!372413) (not e!334570))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584448 (= res!372413 (validKeyInArray!0 k0!1786))))

(declare-fun b!584449 () Bool)

(declare-fun e!334569 () Bool)

(assert (=> b!584449 (= e!334571 e!334569)))

(declare-fun res!372412 () Bool)

(assert (=> b!584449 (=> (not res!372412) (not e!334569))))

(declare-fun lt!265411 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!584449 (= res!372412 (and (bvsge lt!265411 #b00000000000000000000000000000000) (bvslt lt!265411 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584449 (= lt!265411 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584450 () Bool)

(declare-fun res!372415 () Bool)

(assert (=> b!584450 (=> (not res!372415) (not e!334570))))

(declare-fun arrayContainsKey!0 (array!36555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584450 (= res!372415 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372406 () Bool)

(assert (=> start!53640 (=> (not res!372406) (not e!334570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53640 (= res!372406 (validMask!0 mask!3053))))

(assert (=> start!53640 e!334570))

(assert (=> start!53640 true))

(declare-fun array_inv!13435 (array!36555) Bool)

(assert (=> start!53640 (array_inv!13435 a!2986)))

(declare-fun b!584451 () Bool)

(assert (=> b!584451 (= e!334569 false)))

(declare-datatypes ((SeekEntryResult!5989 0))(
  ( (MissingZero!5989 (index!26183 (_ BitVec 32))) (Found!5989 (index!26184 (_ BitVec 32))) (Intermediate!5989 (undefined!6801 Bool) (index!26185 (_ BitVec 32)) (x!55021 (_ BitVec 32))) (Undefined!5989) (MissingVacant!5989 (index!26186 (_ BitVec 32))) )
))
(declare-fun lt!265409 () SeekEntryResult!5989)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36555 (_ BitVec 32)) SeekEntryResult!5989)

(assert (=> b!584451 (= lt!265409 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265411 vacantSpotIndex!68 (select (arr!17552 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584452 () Bool)

(declare-fun res!372407 () Bool)

(assert (=> b!584452 (=> (not res!372407) (not e!334571))))

(assert (=> b!584452 (= res!372407 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17552 a!2986) index!984) (select (arr!17552 a!2986) j!136))) (not (= (select (arr!17552 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584453 () Bool)

(declare-fun res!372416 () Bool)

(assert (=> b!584453 (=> (not res!372416) (not e!334571))))

(assert (=> b!584453 (= res!372416 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17552 a!2986) j!136) a!2986 mask!3053) (Found!5989 j!136)))))

(declare-fun b!584454 () Bool)

(declare-fun res!372410 () Bool)

(assert (=> b!584454 (=> (not res!372410) (not e!334571))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584454 (= res!372410 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17552 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17552 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584455 () Bool)

(declare-fun res!372405 () Bool)

(assert (=> b!584455 (=> (not res!372405) (not e!334571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36555 (_ BitVec 32)) Bool)

(assert (=> b!584455 (= res!372405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584456 () Bool)

(declare-fun res!372409 () Bool)

(assert (=> b!584456 (=> (not res!372409) (not e!334570))))

(assert (=> b!584456 (= res!372409 (and (= (size!17917 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17917 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17917 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584457 () Bool)

(declare-fun res!372414 () Bool)

(assert (=> b!584457 (=> (not res!372414) (not e!334570))))

(assert (=> b!584457 (= res!372414 (validKeyInArray!0 (select (arr!17552 a!2986) j!136)))))

(declare-fun b!584458 () Bool)

(assert (=> b!584458 (= e!334570 e!334571)))

(declare-fun res!372411 () Bool)

(assert (=> b!584458 (=> (not res!372411) (not e!334571))))

(declare-fun lt!265410 () SeekEntryResult!5989)

(assert (=> b!584458 (= res!372411 (or (= lt!265410 (MissingZero!5989 i!1108)) (= lt!265410 (MissingVacant!5989 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36555 (_ BitVec 32)) SeekEntryResult!5989)

(assert (=> b!584458 (= lt!265410 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53640 res!372406) b!584456))

(assert (= (and b!584456 res!372409) b!584457))

(assert (= (and b!584457 res!372414) b!584448))

(assert (= (and b!584448 res!372413) b!584450))

(assert (= (and b!584450 res!372415) b!584458))

(assert (= (and b!584458 res!372411) b!584455))

(assert (= (and b!584455 res!372405) b!584447))

(assert (= (and b!584447 res!372408) b!584454))

(assert (= (and b!584454 res!372410) b!584453))

(assert (= (and b!584453 res!372416) b!584452))

(assert (= (and b!584452 res!372407) b!584449))

(assert (= (and b!584449 res!372412) b!584451))

(declare-fun m!562255 () Bool)

(assert (=> b!584449 m!562255))

(declare-fun m!562257 () Bool)

(assert (=> b!584454 m!562257))

(declare-fun m!562259 () Bool)

(assert (=> b!584454 m!562259))

(declare-fun m!562261 () Bool)

(assert (=> b!584454 m!562261))

(declare-fun m!562263 () Bool)

(assert (=> b!584457 m!562263))

(assert (=> b!584457 m!562263))

(declare-fun m!562265 () Bool)

(assert (=> b!584457 m!562265))

(declare-fun m!562267 () Bool)

(assert (=> start!53640 m!562267))

(declare-fun m!562269 () Bool)

(assert (=> start!53640 m!562269))

(declare-fun m!562271 () Bool)

(assert (=> b!584450 m!562271))

(declare-fun m!562273 () Bool)

(assert (=> b!584458 m!562273))

(assert (=> b!584453 m!562263))

(assert (=> b!584453 m!562263))

(declare-fun m!562275 () Bool)

(assert (=> b!584453 m!562275))

(assert (=> b!584451 m!562263))

(assert (=> b!584451 m!562263))

(declare-fun m!562277 () Bool)

(assert (=> b!584451 m!562277))

(declare-fun m!562279 () Bool)

(assert (=> b!584455 m!562279))

(declare-fun m!562281 () Bool)

(assert (=> b!584452 m!562281))

(assert (=> b!584452 m!562263))

(declare-fun m!562283 () Bool)

(assert (=> b!584447 m!562283))

(declare-fun m!562285 () Bool)

(assert (=> b!584448 m!562285))

(check-sat (not b!584455) (not b!584449) (not b!584453) (not start!53640) (not b!584458) (not b!584457) (not b!584447) (not b!584451) (not b!584450) (not b!584448))
(check-sat)
