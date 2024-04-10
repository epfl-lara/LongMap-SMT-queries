; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53618 () Bool)

(assert start!53618)

(declare-fun b!584034 () Bool)

(declare-fun e!334517 () Bool)

(declare-fun e!334516 () Bool)

(assert (=> b!584034 (= e!334517 e!334516)))

(declare-fun res!371851 () Bool)

(assert (=> b!584034 (=> (not res!371851) (not e!334516))))

(declare-datatypes ((SeekEntryResult!5974 0))(
  ( (MissingZero!5974 (index!26123 (_ BitVec 32))) (Found!5974 (index!26124 (_ BitVec 32))) (Intermediate!5974 (undefined!6786 Bool) (index!26125 (_ BitVec 32)) (x!54955 (_ BitVec 32))) (Undefined!5974) (MissingVacant!5974 (index!26126 (_ BitVec 32))) )
))
(declare-fun lt!265473 () SeekEntryResult!5974)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584034 (= res!371851 (or (= lt!265473 (MissingZero!5974 i!1108)) (= lt!265473 (MissingVacant!5974 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36519 0))(
  ( (array!36520 (arr!17534 (Array (_ BitVec 32) (_ BitVec 64))) (size!17898 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36519)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36519 (_ BitVec 32)) SeekEntryResult!5974)

(assert (=> b!584034 (= lt!265473 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584035 () Bool)

(declare-fun res!371856 () Bool)

(assert (=> b!584035 (=> (not res!371856) (not e!334517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584035 (= res!371856 (validKeyInArray!0 k!1786))))

(declare-fun b!584036 () Bool)

(declare-fun e!334515 () Bool)

(assert (=> b!584036 (= e!334516 e!334515)))

(declare-fun res!371858 () Bool)

(assert (=> b!584036 (=> (not res!371858) (not e!334515))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265472 () (_ BitVec 32))

(assert (=> b!584036 (= res!371858 (and (bvsge lt!265472 #b00000000000000000000000000000000) (bvslt lt!265472 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584036 (= lt!265472 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584037 () Bool)

(declare-fun res!371850 () Bool)

(assert (=> b!584037 (=> (not res!371850) (not e!334517))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!584037 (= res!371850 (and (= (size!17898 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17898 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17898 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584038 () Bool)

(declare-fun res!371857 () Bool)

(assert (=> b!584038 (=> (not res!371857) (not e!334517))))

(assert (=> b!584038 (= res!371857 (validKeyInArray!0 (select (arr!17534 a!2986) j!136)))))

(declare-fun b!584039 () Bool)

(declare-fun res!371861 () Bool)

(assert (=> b!584039 (=> (not res!371861) (not e!334516))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36519 (_ BitVec 32)) SeekEntryResult!5974)

(assert (=> b!584039 (= res!371861 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17534 a!2986) j!136) a!2986 mask!3053) (Found!5974 j!136)))))

(declare-fun b!584040 () Bool)

(declare-fun res!371852 () Bool)

(assert (=> b!584040 (=> (not res!371852) (not e!334517))))

(declare-fun arrayContainsKey!0 (array!36519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584040 (= res!371852 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584041 () Bool)

(declare-fun res!371853 () Bool)

(assert (=> b!584041 (=> (not res!371853) (not e!334516))))

(assert (=> b!584041 (= res!371853 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17534 a!2986) index!984) (select (arr!17534 a!2986) j!136))) (not (= (select (arr!17534 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!371855 () Bool)

(assert (=> start!53618 (=> (not res!371855) (not e!334517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53618 (= res!371855 (validMask!0 mask!3053))))

(assert (=> start!53618 e!334517))

(assert (=> start!53618 true))

(declare-fun array_inv!13330 (array!36519) Bool)

(assert (=> start!53618 (array_inv!13330 a!2986)))

(declare-fun b!584042 () Bool)

(declare-fun res!371860 () Bool)

(assert (=> b!584042 (=> (not res!371860) (not e!334516))))

(declare-datatypes ((List!11575 0))(
  ( (Nil!11572) (Cons!11571 (h!12616 (_ BitVec 64)) (t!17803 List!11575)) )
))
(declare-fun arrayNoDuplicates!0 (array!36519 (_ BitVec 32) List!11575) Bool)

(assert (=> b!584042 (= res!371860 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11572))))

(declare-fun b!584043 () Bool)

(assert (=> b!584043 (= e!334515 false)))

(declare-fun lt!265474 () SeekEntryResult!5974)

(assert (=> b!584043 (= lt!265474 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265472 vacantSpotIndex!68 (select (arr!17534 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584044 () Bool)

(declare-fun res!371854 () Bool)

(assert (=> b!584044 (=> (not res!371854) (not e!334516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36519 (_ BitVec 32)) Bool)

(assert (=> b!584044 (= res!371854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584045 () Bool)

(declare-fun res!371859 () Bool)

(assert (=> b!584045 (=> (not res!371859) (not e!334516))))

(assert (=> b!584045 (= res!371859 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17534 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17534 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53618 res!371855) b!584037))

(assert (= (and b!584037 res!371850) b!584038))

(assert (= (and b!584038 res!371857) b!584035))

(assert (= (and b!584035 res!371856) b!584040))

(assert (= (and b!584040 res!371852) b!584034))

(assert (= (and b!584034 res!371851) b!584044))

(assert (= (and b!584044 res!371854) b!584042))

(assert (= (and b!584042 res!371860) b!584045))

(assert (= (and b!584045 res!371859) b!584039))

(assert (= (and b!584039 res!371861) b!584041))

(assert (= (and b!584041 res!371853) b!584036))

(assert (= (and b!584036 res!371858) b!584043))

(declare-fun m!562433 () Bool)

(assert (=> b!584034 m!562433))

(declare-fun m!562435 () Bool)

(assert (=> start!53618 m!562435))

(declare-fun m!562437 () Bool)

(assert (=> start!53618 m!562437))

(declare-fun m!562439 () Bool)

(assert (=> b!584036 m!562439))

(declare-fun m!562441 () Bool)

(assert (=> b!584038 m!562441))

(assert (=> b!584038 m!562441))

(declare-fun m!562443 () Bool)

(assert (=> b!584038 m!562443))

(declare-fun m!562445 () Bool)

(assert (=> b!584035 m!562445))

(declare-fun m!562447 () Bool)

(assert (=> b!584040 m!562447))

(declare-fun m!562449 () Bool)

(assert (=> b!584041 m!562449))

(assert (=> b!584041 m!562441))

(declare-fun m!562451 () Bool)

(assert (=> b!584044 m!562451))

(assert (=> b!584043 m!562441))

(assert (=> b!584043 m!562441))

(declare-fun m!562453 () Bool)

(assert (=> b!584043 m!562453))

(assert (=> b!584039 m!562441))

(assert (=> b!584039 m!562441))

(declare-fun m!562455 () Bool)

(assert (=> b!584039 m!562455))

(declare-fun m!562457 () Bool)

(assert (=> b!584042 m!562457))

(declare-fun m!562459 () Bool)

(assert (=> b!584045 m!562459))

(declare-fun m!562461 () Bool)

(assert (=> b!584045 m!562461))

(declare-fun m!562463 () Bool)

(assert (=> b!584045 m!562463))

(push 1)

(assert (not b!584039))

(assert (not b!584040))

(assert (not start!53618))

(assert (not b!584036))

(assert (not b!584038))

(assert (not b!584044))

