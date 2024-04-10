; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53382 () Bool)

(assert start!53382)

(declare-fun b!580676 () Bool)

(declare-fun res!368492 () Bool)

(declare-fun e!333411 () Bool)

(assert (=> b!580676 (=> (not res!368492) (not e!333411))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36283 0))(
  ( (array!36284 (arr!17416 (Array (_ BitVec 32) (_ BitVec 64))) (size!17780 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36283)

(declare-datatypes ((SeekEntryResult!5856 0))(
  ( (MissingZero!5856 (index!25651 (_ BitVec 32))) (Found!5856 (index!25652 (_ BitVec 32))) (Intermediate!5856 (undefined!6668 Bool) (index!25653 (_ BitVec 32)) (x!54525 (_ BitVec 32))) (Undefined!5856) (MissingVacant!5856 (index!25654 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36283 (_ BitVec 32)) SeekEntryResult!5856)

(assert (=> b!580676 (= res!368492 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17416 a!2986) j!136) a!2986 mask!3053) (Found!5856 j!136)))))

(declare-fun b!580677 () Bool)

(declare-fun res!368494 () Bool)

(declare-fun e!333409 () Bool)

(assert (=> b!580677 (=> (not res!368494) (not e!333409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580677 (= res!368494 (validKeyInArray!0 (select (arr!17416 a!2986) j!136)))))

(declare-fun b!580678 () Bool)

(declare-fun res!368495 () Bool)

(assert (=> b!580678 (=> (not res!368495) (not e!333409))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580678 (= res!368495 (and (= (size!17780 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17780 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17780 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580679 () Bool)

(declare-fun res!368500 () Bool)

(assert (=> b!580679 (=> (not res!368500) (not e!333409))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580679 (= res!368500 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580680 () Bool)

(declare-fun res!368498 () Bool)

(assert (=> b!580680 (=> (not res!368498) (not e!333411))))

(declare-datatypes ((List!11457 0))(
  ( (Nil!11454) (Cons!11453 (h!12498 (_ BitVec 64)) (t!17685 List!11457)) )
))
(declare-fun arrayNoDuplicates!0 (array!36283 (_ BitVec 32) List!11457) Bool)

(assert (=> b!580680 (= res!368498 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11454))))

(declare-fun b!580681 () Bool)

(assert (=> b!580681 (= e!333409 e!333411)))

(declare-fun res!368496 () Bool)

(assert (=> b!580681 (=> (not res!368496) (not e!333411))))

(declare-fun lt!264751 () SeekEntryResult!5856)

(assert (=> b!580681 (= res!368496 (or (= lt!264751 (MissingZero!5856 i!1108)) (= lt!264751 (MissingVacant!5856 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36283 (_ BitVec 32)) SeekEntryResult!5856)

(assert (=> b!580681 (= lt!264751 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580682 () Bool)

(assert (=> b!580682 (= e!333411 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17416 a!2986) index!984) (select (arr!17416 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!580683 () Bool)

(declare-fun res!368493 () Bool)

(assert (=> b!580683 (=> (not res!368493) (not e!333409))))

(assert (=> b!580683 (= res!368493 (validKeyInArray!0 k0!1786))))

(declare-fun res!368497 () Bool)

(assert (=> start!53382 (=> (not res!368497) (not e!333409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53382 (= res!368497 (validMask!0 mask!3053))))

(assert (=> start!53382 e!333409))

(assert (=> start!53382 true))

(declare-fun array_inv!13212 (array!36283) Bool)

(assert (=> start!53382 (array_inv!13212 a!2986)))

(declare-fun b!580684 () Bool)

(declare-fun res!368501 () Bool)

(assert (=> b!580684 (=> (not res!368501) (not e!333411))))

(assert (=> b!580684 (= res!368501 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17416 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17416 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580685 () Bool)

(declare-fun res!368499 () Bool)

(assert (=> b!580685 (=> (not res!368499) (not e!333411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36283 (_ BitVec 32)) Bool)

(assert (=> b!580685 (= res!368499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53382 res!368497) b!580678))

(assert (= (and b!580678 res!368495) b!580677))

(assert (= (and b!580677 res!368494) b!580683))

(assert (= (and b!580683 res!368493) b!580679))

(assert (= (and b!580679 res!368500) b!580681))

(assert (= (and b!580681 res!368496) b!580685))

(assert (= (and b!580685 res!368499) b!580680))

(assert (= (and b!580680 res!368498) b!580684))

(assert (= (and b!580684 res!368501) b!580676))

(assert (= (and b!580676 res!368492) b!580682))

(declare-fun m!559247 () Bool)

(assert (=> b!580685 m!559247))

(declare-fun m!559249 () Bool)

(assert (=> b!580681 m!559249))

(declare-fun m!559251 () Bool)

(assert (=> b!580676 m!559251))

(assert (=> b!580676 m!559251))

(declare-fun m!559253 () Bool)

(assert (=> b!580676 m!559253))

(declare-fun m!559255 () Bool)

(assert (=> b!580684 m!559255))

(declare-fun m!559257 () Bool)

(assert (=> b!580684 m!559257))

(declare-fun m!559259 () Bool)

(assert (=> b!580684 m!559259))

(declare-fun m!559261 () Bool)

(assert (=> b!580679 m!559261))

(declare-fun m!559263 () Bool)

(assert (=> b!580683 m!559263))

(declare-fun m!559265 () Bool)

(assert (=> b!580680 m!559265))

(assert (=> b!580677 m!559251))

(assert (=> b!580677 m!559251))

(declare-fun m!559267 () Bool)

(assert (=> b!580677 m!559267))

(declare-fun m!559269 () Bool)

(assert (=> b!580682 m!559269))

(assert (=> b!580682 m!559251))

(declare-fun m!559271 () Bool)

(assert (=> start!53382 m!559271))

(declare-fun m!559273 () Bool)

(assert (=> start!53382 m!559273))

(check-sat (not b!580683) (not start!53382) (not b!580677) (not b!580680) (not b!580681) (not b!580685) (not b!580676) (not b!580679))
(check-sat)
