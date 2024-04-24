; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53640 () Bool)

(assert start!53640)

(declare-fun b!583739 () Bool)

(declare-fun res!371454 () Bool)

(declare-fun e!334478 () Bool)

(assert (=> b!583739 (=> (not res!371454) (not e!334478))))

(declare-datatypes ((array!36486 0))(
  ( (array!36487 (arr!17515 (Array (_ BitVec 32) (_ BitVec 64))) (size!17879 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36486)

(declare-datatypes ((List!11463 0))(
  ( (Nil!11460) (Cons!11459 (h!12507 (_ BitVec 64)) (t!17683 List!11463)) )
))
(declare-fun arrayNoDuplicates!0 (array!36486 (_ BitVec 32) List!11463) Bool)

(assert (=> b!583739 (= res!371454 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11460))))

(declare-fun b!583740 () Bool)

(declare-fun res!371456 () Bool)

(assert (=> b!583740 (=> (not res!371456) (not e!334478))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36486 (_ BitVec 32)) Bool)

(assert (=> b!583740 (= res!371456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583741 () Bool)

(declare-fun res!371458 () Bool)

(declare-fun e!334476 () Bool)

(assert (=> b!583741 (=> (not res!371458) (not e!334476))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583741 (= res!371458 (and (= (size!17879 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17879 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17879 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583742 () Bool)

(declare-fun res!371459 () Bool)

(assert (=> b!583742 (=> (not res!371459) (not e!334476))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583742 (= res!371459 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583743 () Bool)

(declare-fun res!371452 () Bool)

(assert (=> b!583743 (=> (not res!371452) (not e!334476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583743 (= res!371452 (validKeyInArray!0 k0!1786))))

(declare-fun b!583744 () Bool)

(declare-fun res!371450 () Bool)

(assert (=> b!583744 (=> (not res!371450) (not e!334476))))

(assert (=> b!583744 (= res!371450 (validKeyInArray!0 (select (arr!17515 a!2986) j!136)))))

(declare-fun res!371453 () Bool)

(assert (=> start!53640 (=> (not res!371453) (not e!334476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53640 (= res!371453 (validMask!0 mask!3053))))

(assert (=> start!53640 e!334476))

(assert (=> start!53640 true))

(declare-fun array_inv!13374 (array!36486) Bool)

(assert (=> start!53640 (array_inv!13374 a!2986)))

(declare-fun b!583745 () Bool)

(declare-fun e!334477 () Bool)

(assert (=> b!583745 (= e!334478 e!334477)))

(declare-fun res!371455 () Bool)

(assert (=> b!583745 (=> (not res!371455) (not e!334477))))

(declare-fun lt!265448 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!583745 (= res!371455 (and (bvsge lt!265448 #b00000000000000000000000000000000) (bvslt lt!265448 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583745 (= lt!265448 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!583746 () Bool)

(declare-fun res!371457 () Bool)

(assert (=> b!583746 (=> (not res!371457) (not e!334478))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5911 0))(
  ( (MissingZero!5911 (index!25871 (_ BitVec 32))) (Found!5911 (index!25872 (_ BitVec 32))) (Intermediate!5911 (undefined!6723 Bool) (index!25873 (_ BitVec 32)) (x!54863 (_ BitVec 32))) (Undefined!5911) (MissingVacant!5911 (index!25874 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36486 (_ BitVec 32)) SeekEntryResult!5911)

(assert (=> b!583746 (= res!371457 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17515 a!2986) j!136) a!2986 mask!3053) (Found!5911 j!136)))))

(declare-fun b!583747 () Bool)

(declare-fun res!371461 () Bool)

(assert (=> b!583747 (=> (not res!371461) (not e!334478))))

(assert (=> b!583747 (= res!371461 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17515 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17515 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583748 () Bool)

(assert (=> b!583748 (= e!334476 e!334478)))

(declare-fun res!371451 () Bool)

(assert (=> b!583748 (=> (not res!371451) (not e!334478))))

(declare-fun lt!265449 () SeekEntryResult!5911)

(assert (=> b!583748 (= res!371451 (or (= lt!265449 (MissingZero!5911 i!1108)) (= lt!265449 (MissingVacant!5911 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36486 (_ BitVec 32)) SeekEntryResult!5911)

(assert (=> b!583748 (= lt!265449 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583749 () Bool)

(declare-fun res!371460 () Bool)

(assert (=> b!583749 (=> (not res!371460) (not e!334478))))

(assert (=> b!583749 (= res!371460 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17515 a!2986) index!984) (select (arr!17515 a!2986) j!136))) (not (= (select (arr!17515 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583750 () Bool)

(assert (=> b!583750 (= e!334477 false)))

(declare-fun lt!265450 () SeekEntryResult!5911)

(assert (=> b!583750 (= lt!265450 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265448 vacantSpotIndex!68 (select (arr!17515 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53640 res!371453) b!583741))

(assert (= (and b!583741 res!371458) b!583744))

(assert (= (and b!583744 res!371450) b!583743))

(assert (= (and b!583743 res!371452) b!583742))

(assert (= (and b!583742 res!371459) b!583748))

(assert (= (and b!583748 res!371451) b!583740))

(assert (= (and b!583740 res!371456) b!583739))

(assert (= (and b!583739 res!371454) b!583747))

(assert (= (and b!583747 res!371461) b!583746))

(assert (= (and b!583746 res!371457) b!583749))

(assert (= (and b!583749 res!371460) b!583745))

(assert (= (and b!583745 res!371455) b!583750))

(declare-fun m!562343 () Bool)

(assert (=> b!583742 m!562343))

(declare-fun m!562345 () Bool)

(assert (=> b!583748 m!562345))

(declare-fun m!562347 () Bool)

(assert (=> b!583747 m!562347))

(declare-fun m!562349 () Bool)

(assert (=> b!583747 m!562349))

(declare-fun m!562351 () Bool)

(assert (=> b!583747 m!562351))

(declare-fun m!562353 () Bool)

(assert (=> b!583749 m!562353))

(declare-fun m!562355 () Bool)

(assert (=> b!583749 m!562355))

(assert (=> b!583746 m!562355))

(assert (=> b!583746 m!562355))

(declare-fun m!562357 () Bool)

(assert (=> b!583746 m!562357))

(assert (=> b!583744 m!562355))

(assert (=> b!583744 m!562355))

(declare-fun m!562359 () Bool)

(assert (=> b!583744 m!562359))

(declare-fun m!562361 () Bool)

(assert (=> b!583743 m!562361))

(declare-fun m!562363 () Bool)

(assert (=> b!583740 m!562363))

(declare-fun m!562365 () Bool)

(assert (=> b!583745 m!562365))

(declare-fun m!562367 () Bool)

(assert (=> start!53640 m!562367))

(declare-fun m!562369 () Bool)

(assert (=> start!53640 m!562369))

(declare-fun m!562371 () Bool)

(assert (=> b!583739 m!562371))

(assert (=> b!583750 m!562355))

(assert (=> b!583750 m!562355))

(declare-fun m!562373 () Bool)

(assert (=> b!583750 m!562373))

(check-sat (not b!583744) (not start!53640) (not b!583750) (not b!583746) (not b!583740) (not b!583745) (not b!583742) (not b!583743) (not b!583739) (not b!583748))
(check-sat)
