; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53646 () Bool)

(assert start!53646)

(declare-fun b!584555 () Bool)

(declare-fun res!372521 () Bool)

(declare-fun e!334605 () Bool)

(assert (=> b!584555 (=> (not res!372521) (not e!334605))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584555 (= res!372521 (validKeyInArray!0 k0!1786))))

(declare-fun b!584556 () Bool)

(declare-fun res!372516 () Bool)

(declare-fun e!334607 () Bool)

(assert (=> b!584556 (=> (not res!372516) (not e!334607))))

(declare-datatypes ((array!36561 0))(
  ( (array!36562 (arr!17555 (Array (_ BitVec 32) (_ BitVec 64))) (size!17920 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36561)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36561 (_ BitVec 32)) Bool)

(assert (=> b!584556 (= res!372516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584557 () Bool)

(declare-fun res!372524 () Bool)

(assert (=> b!584557 (=> (not res!372524) (not e!334607))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584557 (= res!372524 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17555 a!2986) index!984) (select (arr!17555 a!2986) j!136))) (not (= (select (arr!17555 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584558 () Bool)

(declare-fun res!372522 () Bool)

(assert (=> b!584558 (=> (not res!372522) (not e!334605))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584558 (= res!372522 (and (= (size!17920 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17920 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17920 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584559 () Bool)

(assert (=> b!584559 (= e!334605 e!334607)))

(declare-fun res!372520 () Bool)

(assert (=> b!584559 (=> (not res!372520) (not e!334607))))

(declare-datatypes ((SeekEntryResult!5992 0))(
  ( (MissingZero!5992 (index!26195 (_ BitVec 32))) (Found!5992 (index!26196 (_ BitVec 32))) (Intermediate!5992 (undefined!6804 Bool) (index!26197 (_ BitVec 32)) (x!55032 (_ BitVec 32))) (Undefined!5992) (MissingVacant!5992 (index!26198 (_ BitVec 32))) )
))
(declare-fun lt!265436 () SeekEntryResult!5992)

(assert (=> b!584559 (= res!372520 (or (= lt!265436 (MissingZero!5992 i!1108)) (= lt!265436 (MissingVacant!5992 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36561 (_ BitVec 32)) SeekEntryResult!5992)

(assert (=> b!584559 (= lt!265436 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584560 () Bool)

(declare-fun res!372513 () Bool)

(assert (=> b!584560 (=> (not res!372513) (not e!334607))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36561 (_ BitVec 32)) SeekEntryResult!5992)

(assert (=> b!584560 (= res!372513 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17555 a!2986) j!136) a!2986 mask!3053) (Found!5992 j!136)))))

(declare-fun b!584561 () Bool)

(declare-fun res!372519 () Bool)

(assert (=> b!584561 (=> (not res!372519) (not e!334605))))

(assert (=> b!584561 (= res!372519 (validKeyInArray!0 (select (arr!17555 a!2986) j!136)))))

(declare-fun b!584562 () Bool)

(declare-fun res!372517 () Bool)

(assert (=> b!584562 (=> (not res!372517) (not e!334605))))

(declare-fun arrayContainsKey!0 (array!36561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584562 (= res!372517 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584563 () Bool)

(declare-fun e!334608 () Bool)

(assert (=> b!584563 (= e!334607 e!334608)))

(declare-fun res!372514 () Bool)

(assert (=> b!584563 (=> (not res!372514) (not e!334608))))

(declare-fun lt!265438 () (_ BitVec 32))

(assert (=> b!584563 (= res!372514 (and (bvsge lt!265438 #b00000000000000000000000000000000) (bvslt lt!265438 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584563 (= lt!265438 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!372523 () Bool)

(assert (=> start!53646 (=> (not res!372523) (not e!334605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53646 (= res!372523 (validMask!0 mask!3053))))

(assert (=> start!53646 e!334605))

(assert (=> start!53646 true))

(declare-fun array_inv!13438 (array!36561) Bool)

(assert (=> start!53646 (array_inv!13438 a!2986)))

(declare-fun b!584564 () Bool)

(assert (=> b!584564 (= e!334608 false)))

(declare-fun lt!265437 () SeekEntryResult!5992)

(assert (=> b!584564 (= lt!265437 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265438 vacantSpotIndex!68 (select (arr!17555 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584565 () Bool)

(declare-fun res!372518 () Bool)

(assert (=> b!584565 (=> (not res!372518) (not e!334607))))

(assert (=> b!584565 (= res!372518 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17555 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17555 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584566 () Bool)

(declare-fun res!372515 () Bool)

(assert (=> b!584566 (=> (not res!372515) (not e!334607))))

(declare-datatypes ((List!11635 0))(
  ( (Nil!11632) (Cons!11631 (h!12676 (_ BitVec 64)) (t!17854 List!11635)) )
))
(declare-fun arrayNoDuplicates!0 (array!36561 (_ BitVec 32) List!11635) Bool)

(assert (=> b!584566 (= res!372515 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11632))))

(assert (= (and start!53646 res!372523) b!584558))

(assert (= (and b!584558 res!372522) b!584561))

(assert (= (and b!584561 res!372519) b!584555))

(assert (= (and b!584555 res!372521) b!584562))

(assert (= (and b!584562 res!372517) b!584559))

(assert (= (and b!584559 res!372520) b!584556))

(assert (= (and b!584556 res!372516) b!584566))

(assert (= (and b!584566 res!372515) b!584565))

(assert (= (and b!584565 res!372518) b!584560))

(assert (= (and b!584560 res!372513) b!584557))

(assert (= (and b!584557 res!372524) b!584563))

(assert (= (and b!584563 res!372514) b!584564))

(declare-fun m!562351 () Bool)

(assert (=> b!584560 m!562351))

(assert (=> b!584560 m!562351))

(declare-fun m!562353 () Bool)

(assert (=> b!584560 m!562353))

(declare-fun m!562355 () Bool)

(assert (=> b!584565 m!562355))

(declare-fun m!562357 () Bool)

(assert (=> b!584565 m!562357))

(declare-fun m!562359 () Bool)

(assert (=> b!584565 m!562359))

(assert (=> b!584561 m!562351))

(assert (=> b!584561 m!562351))

(declare-fun m!562361 () Bool)

(assert (=> b!584561 m!562361))

(declare-fun m!562363 () Bool)

(assert (=> b!584563 m!562363))

(assert (=> b!584564 m!562351))

(assert (=> b!584564 m!562351))

(declare-fun m!562365 () Bool)

(assert (=> b!584564 m!562365))

(declare-fun m!562367 () Bool)

(assert (=> b!584557 m!562367))

(assert (=> b!584557 m!562351))

(declare-fun m!562369 () Bool)

(assert (=> b!584555 m!562369))

(declare-fun m!562371 () Bool)

(assert (=> b!584556 m!562371))

(declare-fun m!562373 () Bool)

(assert (=> start!53646 m!562373))

(declare-fun m!562375 () Bool)

(assert (=> start!53646 m!562375))

(declare-fun m!562377 () Bool)

(assert (=> b!584559 m!562377))

(declare-fun m!562379 () Bool)

(assert (=> b!584566 m!562379))

(declare-fun m!562381 () Bool)

(assert (=> b!584562 m!562381))

(check-sat (not b!584564) (not b!584563) (not b!584555) (not b!584562) (not b!584561) (not start!53646) (not b!584556) (not b!584566) (not b!584559) (not b!584560))
(check-sat)
