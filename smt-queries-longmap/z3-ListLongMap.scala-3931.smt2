; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53598 () Bool)

(assert start!53598)

(declare-fun b!583674 () Bool)

(declare-fun res!371498 () Bool)

(declare-fun e!334395 () Bool)

(assert (=> b!583674 (=> (not res!371498) (not e!334395))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36499 0))(
  ( (array!36500 (arr!17524 (Array (_ BitVec 32) (_ BitVec 64))) (size!17888 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36499)

(assert (=> b!583674 (= res!371498 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17524 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17524 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!371493 () Bool)

(declare-fun e!334398 () Bool)

(assert (=> start!53598 (=> (not res!371493) (not e!334398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53598 (= res!371493 (validMask!0 mask!3053))))

(assert (=> start!53598 e!334398))

(assert (=> start!53598 true))

(declare-fun array_inv!13320 (array!36499) Bool)

(assert (=> start!53598 (array_inv!13320 a!2986)))

(declare-fun b!583675 () Bool)

(declare-fun res!371501 () Bool)

(assert (=> b!583675 (=> (not res!371501) (not e!334395))))

(declare-datatypes ((List!11565 0))(
  ( (Nil!11562) (Cons!11561 (h!12606 (_ BitVec 64)) (t!17793 List!11565)) )
))
(declare-fun arrayNoDuplicates!0 (array!36499 (_ BitVec 32) List!11565) Bool)

(assert (=> b!583675 (= res!371501 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11562))))

(declare-fun b!583676 () Bool)

(declare-fun res!371496 () Bool)

(assert (=> b!583676 (=> (not res!371496) (not e!334395))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583676 (= res!371496 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17524 a!2986) index!984) (select (arr!17524 a!2986) j!136))) (not (= (select (arr!17524 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583677 () Bool)

(declare-fun res!371494 () Bool)

(assert (=> b!583677 (=> (not res!371494) (not e!334398))))

(declare-fun arrayContainsKey!0 (array!36499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583677 (= res!371494 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583678 () Bool)

(declare-fun res!371491 () Bool)

(assert (=> b!583678 (=> (not res!371491) (not e!334398))))

(assert (=> b!583678 (= res!371491 (and (= (size!17888 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17888 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17888 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583679 () Bool)

(declare-fun res!371497 () Bool)

(assert (=> b!583679 (=> (not res!371497) (not e!334395))))

(declare-datatypes ((SeekEntryResult!5964 0))(
  ( (MissingZero!5964 (index!26083 (_ BitVec 32))) (Found!5964 (index!26084 (_ BitVec 32))) (Intermediate!5964 (undefined!6776 Bool) (index!26085 (_ BitVec 32)) (x!54921 (_ BitVec 32))) (Undefined!5964) (MissingVacant!5964 (index!26086 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36499 (_ BitVec 32)) SeekEntryResult!5964)

(assert (=> b!583679 (= res!371497 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17524 a!2986) j!136) a!2986 mask!3053) (Found!5964 j!136)))))

(declare-fun b!583680 () Bool)

(declare-fun e!334397 () Bool)

(assert (=> b!583680 (= e!334395 e!334397)))

(declare-fun res!371495 () Bool)

(assert (=> b!583680 (=> (not res!371495) (not e!334397))))

(declare-fun lt!265382 () (_ BitVec 32))

(assert (=> b!583680 (= res!371495 (and (bvsge lt!265382 #b00000000000000000000000000000000) (bvslt lt!265382 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583680 (= lt!265382 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583681 () Bool)

(declare-fun res!371499 () Bool)

(assert (=> b!583681 (=> (not res!371499) (not e!334398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583681 (= res!371499 (validKeyInArray!0 k0!1786))))

(declare-fun b!583682 () Bool)

(assert (=> b!583682 (= e!334397 false)))

(declare-fun lt!265383 () SeekEntryResult!5964)

(assert (=> b!583682 (= lt!265383 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265382 vacantSpotIndex!68 (select (arr!17524 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583683 () Bool)

(assert (=> b!583683 (= e!334398 e!334395)))

(declare-fun res!371500 () Bool)

(assert (=> b!583683 (=> (not res!371500) (not e!334395))))

(declare-fun lt!265384 () SeekEntryResult!5964)

(assert (=> b!583683 (= res!371500 (or (= lt!265384 (MissingZero!5964 i!1108)) (= lt!265384 (MissingVacant!5964 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36499 (_ BitVec 32)) SeekEntryResult!5964)

(assert (=> b!583683 (= lt!265384 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583684 () Bool)

(declare-fun res!371492 () Bool)

(assert (=> b!583684 (=> (not res!371492) (not e!334395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36499 (_ BitVec 32)) Bool)

(assert (=> b!583684 (= res!371492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583685 () Bool)

(declare-fun res!371490 () Bool)

(assert (=> b!583685 (=> (not res!371490) (not e!334398))))

(assert (=> b!583685 (= res!371490 (validKeyInArray!0 (select (arr!17524 a!2986) j!136)))))

(assert (= (and start!53598 res!371493) b!583678))

(assert (= (and b!583678 res!371491) b!583685))

(assert (= (and b!583685 res!371490) b!583681))

(assert (= (and b!583681 res!371499) b!583677))

(assert (= (and b!583677 res!371494) b!583683))

(assert (= (and b!583683 res!371500) b!583684))

(assert (= (and b!583684 res!371492) b!583675))

(assert (= (and b!583675 res!371501) b!583674))

(assert (= (and b!583674 res!371498) b!583679))

(assert (= (and b!583679 res!371497) b!583676))

(assert (= (and b!583676 res!371496) b!583680))

(assert (= (and b!583680 res!371495) b!583682))

(declare-fun m!562113 () Bool)

(assert (=> start!53598 m!562113))

(declare-fun m!562115 () Bool)

(assert (=> start!53598 m!562115))

(declare-fun m!562117 () Bool)

(assert (=> b!583681 m!562117))

(declare-fun m!562119 () Bool)

(assert (=> b!583680 m!562119))

(declare-fun m!562121 () Bool)

(assert (=> b!583685 m!562121))

(assert (=> b!583685 m!562121))

(declare-fun m!562123 () Bool)

(assert (=> b!583685 m!562123))

(declare-fun m!562125 () Bool)

(assert (=> b!583674 m!562125))

(declare-fun m!562127 () Bool)

(assert (=> b!583674 m!562127))

(declare-fun m!562129 () Bool)

(assert (=> b!583674 m!562129))

(assert (=> b!583679 m!562121))

(assert (=> b!583679 m!562121))

(declare-fun m!562131 () Bool)

(assert (=> b!583679 m!562131))

(declare-fun m!562133 () Bool)

(assert (=> b!583675 m!562133))

(declare-fun m!562135 () Bool)

(assert (=> b!583684 m!562135))

(declare-fun m!562137 () Bool)

(assert (=> b!583683 m!562137))

(declare-fun m!562139 () Bool)

(assert (=> b!583677 m!562139))

(assert (=> b!583682 m!562121))

(assert (=> b!583682 m!562121))

(declare-fun m!562141 () Bool)

(assert (=> b!583682 m!562141))

(declare-fun m!562143 () Bool)

(assert (=> b!583676 m!562143))

(assert (=> b!583676 m!562121))

(check-sat (not b!583680) (not b!583679) (not b!583675) (not b!583683) (not b!583682) (not start!53598) (not b!583681) (not b!583685) (not b!583677) (not b!583684))
(check-sat)
