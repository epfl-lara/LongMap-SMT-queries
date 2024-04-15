; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53232 () Bool)

(assert start!53232)

(declare-fun b!578592 () Bool)

(declare-fun e!332633 () Bool)

(declare-fun e!332634 () Bool)

(assert (=> b!578592 (= e!332633 e!332634)))

(declare-fun res!366557 () Bool)

(assert (=> b!578592 (=> (not res!366557) (not e!332634))))

(declare-datatypes ((SeekEntryResult!5785 0))(
  ( (MissingZero!5785 (index!25367 (_ BitVec 32))) (Found!5785 (index!25368 (_ BitVec 32))) (Intermediate!5785 (undefined!6597 Bool) (index!25369 (_ BitVec 32)) (x!54273 (_ BitVec 32))) (Undefined!5785) (MissingVacant!5785 (index!25370 (_ BitVec 32))) )
))
(declare-fun lt!264120 () SeekEntryResult!5785)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578592 (= res!366557 (or (= lt!264120 (MissingZero!5785 i!1108)) (= lt!264120 (MissingVacant!5785 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36147 0))(
  ( (array!36148 (arr!17348 (Array (_ BitVec 32) (_ BitVec 64))) (size!17713 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36147)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36147 (_ BitVec 32)) SeekEntryResult!5785)

(assert (=> b!578592 (= lt!264120 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578593 () Bool)

(assert (=> b!578593 (= e!332634 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264121 () SeekEntryResult!5785)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36147 (_ BitVec 32)) SeekEntryResult!5785)

(assert (=> b!578593 (= lt!264121 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17348 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578594 () Bool)

(declare-fun res!366551 () Bool)

(assert (=> b!578594 (=> (not res!366551) (not e!332634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36147 (_ BitVec 32)) Bool)

(assert (=> b!578594 (= res!366551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578595 () Bool)

(declare-fun res!366556 () Bool)

(assert (=> b!578595 (=> (not res!366556) (not e!332634))))

(assert (=> b!578595 (= res!366556 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17348 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17348 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578596 () Bool)

(declare-fun res!366552 () Bool)

(assert (=> b!578596 (=> (not res!366552) (not e!332633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578596 (= res!366552 (validKeyInArray!0 (select (arr!17348 a!2986) j!136)))))

(declare-fun b!578597 () Bool)

(declare-fun res!366550 () Bool)

(assert (=> b!578597 (=> (not res!366550) (not e!332633))))

(declare-fun arrayContainsKey!0 (array!36147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578597 (= res!366550 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578591 () Bool)

(declare-fun res!366554 () Bool)

(assert (=> b!578591 (=> (not res!366554) (not e!332633))))

(assert (=> b!578591 (= res!366554 (validKeyInArray!0 k0!1786))))

(declare-fun res!366553 () Bool)

(assert (=> start!53232 (=> (not res!366553) (not e!332633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53232 (= res!366553 (validMask!0 mask!3053))))

(assert (=> start!53232 e!332633))

(assert (=> start!53232 true))

(declare-fun array_inv!13231 (array!36147) Bool)

(assert (=> start!53232 (array_inv!13231 a!2986)))

(declare-fun b!578598 () Bool)

(declare-fun res!366555 () Bool)

(assert (=> b!578598 (=> (not res!366555) (not e!332634))))

(declare-datatypes ((List!11428 0))(
  ( (Nil!11425) (Cons!11424 (h!12469 (_ BitVec 64)) (t!17647 List!11428)) )
))
(declare-fun arrayNoDuplicates!0 (array!36147 (_ BitVec 32) List!11428) Bool)

(assert (=> b!578598 (= res!366555 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11425))))

(declare-fun b!578599 () Bool)

(declare-fun res!366549 () Bool)

(assert (=> b!578599 (=> (not res!366549) (not e!332633))))

(assert (=> b!578599 (= res!366549 (and (= (size!17713 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17713 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17713 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53232 res!366553) b!578599))

(assert (= (and b!578599 res!366549) b!578596))

(assert (= (and b!578596 res!366552) b!578591))

(assert (= (and b!578591 res!366554) b!578597))

(assert (= (and b!578597 res!366550) b!578592))

(assert (= (and b!578592 res!366557) b!578594))

(assert (= (and b!578594 res!366551) b!578598))

(assert (= (and b!578598 res!366555) b!578595))

(assert (= (and b!578595 res!366556) b!578593))

(declare-fun m!556717 () Bool)

(assert (=> b!578591 m!556717))

(declare-fun m!556719 () Bool)

(assert (=> b!578596 m!556719))

(assert (=> b!578596 m!556719))

(declare-fun m!556721 () Bool)

(assert (=> b!578596 m!556721))

(declare-fun m!556723 () Bool)

(assert (=> b!578597 m!556723))

(declare-fun m!556725 () Bool)

(assert (=> b!578592 m!556725))

(declare-fun m!556727 () Bool)

(assert (=> start!53232 m!556727))

(declare-fun m!556729 () Bool)

(assert (=> start!53232 m!556729))

(declare-fun m!556731 () Bool)

(assert (=> b!578595 m!556731))

(declare-fun m!556733 () Bool)

(assert (=> b!578595 m!556733))

(declare-fun m!556735 () Bool)

(assert (=> b!578595 m!556735))

(assert (=> b!578593 m!556719))

(assert (=> b!578593 m!556719))

(declare-fun m!556737 () Bool)

(assert (=> b!578593 m!556737))

(declare-fun m!556739 () Bool)

(assert (=> b!578598 m!556739))

(declare-fun m!556741 () Bool)

(assert (=> b!578594 m!556741))

(check-sat (not b!578591) (not start!53232) (not b!578598) (not b!578597) (not b!578596) (not b!578594) (not b!578592) (not b!578593))
(check-sat)
