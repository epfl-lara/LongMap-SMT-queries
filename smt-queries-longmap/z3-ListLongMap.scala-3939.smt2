; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53694 () Bool)

(assert start!53694)

(declare-fun b!584711 () Bool)

(declare-fun res!372422 () Bool)

(declare-fun e!334800 () Bool)

(assert (=> b!584711 (=> (not res!372422) (not e!334800))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36540 0))(
  ( (array!36541 (arr!17542 (Array (_ BitVec 32) (_ BitVec 64))) (size!17906 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36540)

(assert (=> b!584711 (= res!372422 (and (= (size!17906 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17906 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17906 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584712 () Bool)

(declare-fun res!372430 () Bool)

(declare-fun e!334801 () Bool)

(assert (=> b!584712 (=> (not res!372430) (not e!334801))))

(declare-datatypes ((List!11490 0))(
  ( (Nil!11487) (Cons!11486 (h!12534 (_ BitVec 64)) (t!17710 List!11490)) )
))
(declare-fun arrayNoDuplicates!0 (array!36540 (_ BitVec 32) List!11490) Bool)

(assert (=> b!584712 (= res!372430 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11487))))

(declare-fun b!584713 () Bool)

(declare-fun res!372433 () Bool)

(assert (=> b!584713 (=> (not res!372433) (not e!334800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584713 (= res!372433 (validKeyInArray!0 (select (arr!17542 a!2986) j!136)))))

(declare-fun b!584714 () Bool)

(declare-fun res!372425 () Bool)

(assert (=> b!584714 (=> (not res!372425) (not e!334801))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5938 0))(
  ( (MissingZero!5938 (index!25979 (_ BitVec 32))) (Found!5938 (index!25980 (_ BitVec 32))) (Intermediate!5938 (undefined!6750 Bool) (index!25981 (_ BitVec 32)) (x!54962 (_ BitVec 32))) (Undefined!5938) (MissingVacant!5938 (index!25982 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36540 (_ BitVec 32)) SeekEntryResult!5938)

(assert (=> b!584714 (= res!372425 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17542 a!2986) j!136) a!2986 mask!3053) (Found!5938 j!136)))))

(declare-fun b!584715 () Bool)

(declare-fun res!372426 () Bool)

(assert (=> b!584715 (=> (not res!372426) (not e!334800))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!584715 (= res!372426 (validKeyInArray!0 k0!1786))))

(declare-fun b!584716 () Bool)

(declare-fun res!372429 () Bool)

(assert (=> b!584716 (=> (not res!372429) (not e!334801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36540 (_ BitVec 32)) Bool)

(assert (=> b!584716 (= res!372429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584717 () Bool)

(declare-fun res!372427 () Bool)

(assert (=> b!584717 (=> (not res!372427) (not e!334800))))

(declare-fun arrayContainsKey!0 (array!36540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584717 (= res!372427 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584718 () Bool)

(declare-fun e!334803 () Bool)

(assert (=> b!584718 (= e!334801 e!334803)))

(declare-fun res!372424 () Bool)

(assert (=> b!584718 (=> (not res!372424) (not e!334803))))

(declare-fun lt!265692 () (_ BitVec 32))

(assert (=> b!584718 (= res!372424 (and (bvsge lt!265692 #b00000000000000000000000000000000) (bvslt lt!265692 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584718 (= lt!265692 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584720 () Bool)

(assert (=> b!584720 (= e!334800 e!334801)))

(declare-fun res!372432 () Bool)

(assert (=> b!584720 (=> (not res!372432) (not e!334801))))

(declare-fun lt!265691 () SeekEntryResult!5938)

(assert (=> b!584720 (= res!372432 (or (= lt!265691 (MissingZero!5938 i!1108)) (= lt!265691 (MissingVacant!5938 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36540 (_ BitVec 32)) SeekEntryResult!5938)

(assert (=> b!584720 (= lt!265691 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584721 () Bool)

(declare-fun res!372423 () Bool)

(assert (=> b!584721 (=> (not res!372423) (not e!334801))))

(assert (=> b!584721 (= res!372423 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17542 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17542 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584722 () Bool)

(declare-fun res!372431 () Bool)

(assert (=> b!584722 (=> (not res!372431) (not e!334801))))

(assert (=> b!584722 (= res!372431 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17542 a!2986) index!984) (select (arr!17542 a!2986) j!136))) (not (= (select (arr!17542 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!372428 () Bool)

(assert (=> start!53694 (=> (not res!372428) (not e!334800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53694 (= res!372428 (validMask!0 mask!3053))))

(assert (=> start!53694 e!334800))

(assert (=> start!53694 true))

(declare-fun array_inv!13401 (array!36540) Bool)

(assert (=> start!53694 (array_inv!13401 a!2986)))

(declare-fun b!584719 () Bool)

(assert (=> b!584719 (= e!334803 false)))

(declare-fun lt!265693 () SeekEntryResult!5938)

(assert (=> b!584719 (= lt!265693 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265692 vacantSpotIndex!68 (select (arr!17542 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53694 res!372428) b!584711))

(assert (= (and b!584711 res!372422) b!584713))

(assert (= (and b!584713 res!372433) b!584715))

(assert (= (and b!584715 res!372426) b!584717))

(assert (= (and b!584717 res!372427) b!584720))

(assert (= (and b!584720 res!372432) b!584716))

(assert (= (and b!584716 res!372429) b!584712))

(assert (= (and b!584712 res!372430) b!584721))

(assert (= (and b!584721 res!372423) b!584714))

(assert (= (and b!584714 res!372425) b!584722))

(assert (= (and b!584722 res!372431) b!584718))

(assert (= (and b!584718 res!372424) b!584719))

(declare-fun m!563207 () Bool)

(assert (=> b!584713 m!563207))

(assert (=> b!584713 m!563207))

(declare-fun m!563209 () Bool)

(assert (=> b!584713 m!563209))

(assert (=> b!584719 m!563207))

(assert (=> b!584719 m!563207))

(declare-fun m!563211 () Bool)

(assert (=> b!584719 m!563211))

(declare-fun m!563213 () Bool)

(assert (=> b!584715 m!563213))

(assert (=> b!584714 m!563207))

(assert (=> b!584714 m!563207))

(declare-fun m!563215 () Bool)

(assert (=> b!584714 m!563215))

(declare-fun m!563217 () Bool)

(assert (=> b!584721 m!563217))

(declare-fun m!563219 () Bool)

(assert (=> b!584721 m!563219))

(declare-fun m!563221 () Bool)

(assert (=> b!584721 m!563221))

(declare-fun m!563223 () Bool)

(assert (=> b!584716 m!563223))

(declare-fun m!563225 () Bool)

(assert (=> b!584722 m!563225))

(assert (=> b!584722 m!563207))

(declare-fun m!563227 () Bool)

(assert (=> b!584712 m!563227))

(declare-fun m!563229 () Bool)

(assert (=> start!53694 m!563229))

(declare-fun m!563231 () Bool)

(assert (=> start!53694 m!563231))

(declare-fun m!563233 () Bool)

(assert (=> b!584720 m!563233))

(declare-fun m!563235 () Bool)

(assert (=> b!584718 m!563235))

(declare-fun m!563237 () Bool)

(assert (=> b!584717 m!563237))

(check-sat (not b!584718) (not b!584720) (not b!584714) (not b!584712) (not b!584715) (not b!584716) (not start!53694) (not b!584719) (not b!584717) (not b!584713))
(check-sat)
