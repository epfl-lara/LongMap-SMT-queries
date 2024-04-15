; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53220 () Bool)

(assert start!53220)

(declare-fun b!578422 () Bool)

(declare-fun res!366385 () Bool)

(declare-fun e!332580 () Bool)

(assert (=> b!578422 (=> (not res!366385) (not e!332580))))

(declare-datatypes ((array!36135 0))(
  ( (array!36136 (arr!17342 (Array (_ BitVec 32) (_ BitVec 64))) (size!17707 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36135)

(declare-datatypes ((List!11422 0))(
  ( (Nil!11419) (Cons!11418 (h!12463 (_ BitVec 64)) (t!17641 List!11422)) )
))
(declare-fun arrayNoDuplicates!0 (array!36135 (_ BitVec 32) List!11422) Bool)

(assert (=> b!578422 (= res!366385 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11419))))

(declare-fun b!578423 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!578423 (= e!332580 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!578424 () Bool)

(declare-fun res!366383 () Bool)

(assert (=> b!578424 (=> (not res!366383) (not e!332580))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578424 (= res!366383 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17342 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17342 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578425 () Bool)

(declare-fun res!366389 () Bool)

(declare-fun e!332578 () Bool)

(assert (=> b!578425 (=> (not res!366389) (not e!332578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578425 (= res!366389 (validKeyInArray!0 k0!1786))))

(declare-fun b!578426 () Bool)

(declare-fun res!366382 () Bool)

(assert (=> b!578426 (=> (not res!366382) (not e!332578))))

(declare-fun arrayContainsKey!0 (array!36135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578426 (= res!366382 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578427 () Bool)

(assert (=> b!578427 (= e!332578 e!332580)))

(declare-fun res!366380 () Bool)

(assert (=> b!578427 (=> (not res!366380) (not e!332580))))

(declare-datatypes ((SeekEntryResult!5779 0))(
  ( (MissingZero!5779 (index!25343 (_ BitVec 32))) (Found!5779 (index!25344 (_ BitVec 32))) (Intermediate!5779 (undefined!6591 Bool) (index!25345 (_ BitVec 32)) (x!54251 (_ BitVec 32))) (Undefined!5779) (MissingVacant!5779 (index!25346 (_ BitVec 32))) )
))
(declare-fun lt!264091 () SeekEntryResult!5779)

(assert (=> b!578427 (= res!366380 (or (= lt!264091 (MissingZero!5779 i!1108)) (= lt!264091 (MissingVacant!5779 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36135 (_ BitVec 32)) SeekEntryResult!5779)

(assert (=> b!578427 (= lt!264091 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578428 () Bool)

(declare-fun res!366388 () Bool)

(assert (=> b!578428 (=> (not res!366388) (not e!332580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36135 (_ BitVec 32)) Bool)

(assert (=> b!578428 (= res!366388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578429 () Bool)

(declare-fun res!366384 () Bool)

(assert (=> b!578429 (=> (not res!366384) (not e!332578))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578429 (= res!366384 (and (= (size!17707 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17707 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17707 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578430 () Bool)

(declare-fun res!366386 () Bool)

(assert (=> b!578430 (=> (not res!366386) (not e!332578))))

(assert (=> b!578430 (= res!366386 (validKeyInArray!0 (select (arr!17342 a!2986) j!136)))))

(declare-fun res!366381 () Bool)

(assert (=> start!53220 (=> (not res!366381) (not e!332578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53220 (= res!366381 (validMask!0 mask!3053))))

(assert (=> start!53220 e!332578))

(assert (=> start!53220 true))

(declare-fun array_inv!13225 (array!36135) Bool)

(assert (=> start!53220 (array_inv!13225 a!2986)))

(declare-fun b!578431 () Bool)

(declare-fun res!366387 () Bool)

(assert (=> b!578431 (=> (not res!366387) (not e!332580))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36135 (_ BitVec 32)) SeekEntryResult!5779)

(assert (=> b!578431 (= res!366387 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17342 a!2986) j!136) a!2986 mask!3053) (Found!5779 j!136)))))

(assert (= (and start!53220 res!366381) b!578429))

(assert (= (and b!578429 res!366384) b!578430))

(assert (= (and b!578430 res!366386) b!578425))

(assert (= (and b!578425 res!366389) b!578426))

(assert (= (and b!578426 res!366382) b!578427))

(assert (= (and b!578427 res!366380) b!578428))

(assert (= (and b!578428 res!366388) b!578422))

(assert (= (and b!578422 res!366385) b!578424))

(assert (= (and b!578424 res!366383) b!578431))

(assert (= (and b!578431 res!366387) b!578423))

(declare-fun m!556561 () Bool)

(assert (=> b!578430 m!556561))

(assert (=> b!578430 m!556561))

(declare-fun m!556563 () Bool)

(assert (=> b!578430 m!556563))

(declare-fun m!556565 () Bool)

(assert (=> b!578428 m!556565))

(declare-fun m!556567 () Bool)

(assert (=> b!578422 m!556567))

(declare-fun m!556569 () Bool)

(assert (=> b!578424 m!556569))

(declare-fun m!556571 () Bool)

(assert (=> b!578424 m!556571))

(declare-fun m!556573 () Bool)

(assert (=> b!578424 m!556573))

(declare-fun m!556575 () Bool)

(assert (=> start!53220 m!556575))

(declare-fun m!556577 () Bool)

(assert (=> start!53220 m!556577))

(declare-fun m!556579 () Bool)

(assert (=> b!578425 m!556579))

(assert (=> b!578431 m!556561))

(assert (=> b!578431 m!556561))

(declare-fun m!556581 () Bool)

(assert (=> b!578431 m!556581))

(declare-fun m!556583 () Bool)

(assert (=> b!578426 m!556583))

(declare-fun m!556585 () Bool)

(assert (=> b!578427 m!556585))

(check-sat (not b!578427) (not b!578431) (not b!578426) (not b!578425) (not b!578428) (not b!578422) (not b!578430) (not start!53220))
(check-sat)
