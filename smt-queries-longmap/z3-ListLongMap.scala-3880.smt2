; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53340 () Bool)

(assert start!53340)

(declare-fun b!579629 () Bool)

(declare-fun res!367341 () Bool)

(declare-fun e!333126 () Bool)

(assert (=> b!579629 (=> (not res!367341) (not e!333126))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36186 0))(
  ( (array!36187 (arr!17365 (Array (_ BitVec 32) (_ BitVec 64))) (size!17729 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36186)

(assert (=> b!579629 (= res!367341 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17365 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17365 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579630 () Bool)

(declare-fun res!367347 () Bool)

(declare-fun e!333125 () Bool)

(assert (=> b!579630 (=> (not res!367347) (not e!333125))))

(declare-fun arrayContainsKey!0 (array!36186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579630 (= res!367347 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!367346 () Bool)

(assert (=> start!53340 (=> (not res!367346) (not e!333125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53340 (= res!367346 (validMask!0 mask!3053))))

(assert (=> start!53340 e!333125))

(assert (=> start!53340 true))

(declare-fun array_inv!13224 (array!36186) Bool)

(assert (=> start!53340 (array_inv!13224 a!2986)))

(declare-fun b!579631 () Bool)

(declare-fun res!367342 () Bool)

(assert (=> b!579631 (=> (not res!367342) (not e!333126))))

(declare-datatypes ((List!11313 0))(
  ( (Nil!11310) (Cons!11309 (h!12357 (_ BitVec 64)) (t!17533 List!11313)) )
))
(declare-fun arrayNoDuplicates!0 (array!36186 (_ BitVec 32) List!11313) Bool)

(assert (=> b!579631 (= res!367342 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11310))))

(declare-fun b!579632 () Bool)

(declare-fun res!367343 () Bool)

(assert (=> b!579632 (=> (not res!367343) (not e!333125))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579632 (= res!367343 (validKeyInArray!0 (select (arr!17365 a!2986) j!136)))))

(declare-fun b!579633 () Bool)

(declare-fun res!367348 () Bool)

(assert (=> b!579633 (=> (not res!367348) (not e!333125))))

(assert (=> b!579633 (= res!367348 (and (= (size!17729 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17729 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17729 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579634 () Bool)

(declare-fun res!367345 () Bool)

(assert (=> b!579634 (=> (not res!367345) (not e!333126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36186 (_ BitVec 32)) Bool)

(assert (=> b!579634 (= res!367345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579635 () Bool)

(assert (=> b!579635 (= e!333125 e!333126)))

(declare-fun res!367344 () Bool)

(assert (=> b!579635 (=> (not res!367344) (not e!333126))))

(declare-datatypes ((SeekEntryResult!5761 0))(
  ( (MissingZero!5761 (index!25271 (_ BitVec 32))) (Found!5761 (index!25272 (_ BitVec 32))) (Intermediate!5761 (undefined!6573 Bool) (index!25273 (_ BitVec 32)) (x!54313 (_ BitVec 32))) (Undefined!5761) (MissingVacant!5761 (index!25274 (_ BitVec 32))) )
))
(declare-fun lt!264592 () SeekEntryResult!5761)

(assert (=> b!579635 (= res!367344 (or (= lt!264592 (MissingZero!5761 i!1108)) (= lt!264592 (MissingVacant!5761 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36186 (_ BitVec 32)) SeekEntryResult!5761)

(assert (=> b!579635 (= lt!264592 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579636 () Bool)

(declare-fun res!367340 () Bool)

(assert (=> b!579636 (=> (not res!367340) (not e!333125))))

(assert (=> b!579636 (= res!367340 (validKeyInArray!0 k0!1786))))

(declare-fun b!579637 () Bool)

(assert (=> b!579637 (= e!333126 false)))

(declare-fun lt!264591 () SeekEntryResult!5761)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36186 (_ BitVec 32)) SeekEntryResult!5761)

(assert (=> b!579637 (= lt!264591 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17365 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53340 res!367346) b!579633))

(assert (= (and b!579633 res!367348) b!579632))

(assert (= (and b!579632 res!367343) b!579636))

(assert (= (and b!579636 res!367340) b!579630))

(assert (= (and b!579630 res!367347) b!579635))

(assert (= (and b!579635 res!367344) b!579634))

(assert (= (and b!579634 res!367345) b!579631))

(assert (= (and b!579631 res!367342) b!579629))

(assert (= (and b!579629 res!367341) b!579637))

(declare-fun m!558401 () Bool)

(assert (=> b!579635 m!558401))

(declare-fun m!558403 () Bool)

(assert (=> b!579629 m!558403))

(declare-fun m!558405 () Bool)

(assert (=> b!579629 m!558405))

(declare-fun m!558407 () Bool)

(assert (=> b!579629 m!558407))

(declare-fun m!558409 () Bool)

(assert (=> b!579631 m!558409))

(declare-fun m!558411 () Bool)

(assert (=> b!579632 m!558411))

(assert (=> b!579632 m!558411))

(declare-fun m!558413 () Bool)

(assert (=> b!579632 m!558413))

(assert (=> b!579637 m!558411))

(assert (=> b!579637 m!558411))

(declare-fun m!558415 () Bool)

(assert (=> b!579637 m!558415))

(declare-fun m!558417 () Bool)

(assert (=> b!579630 m!558417))

(declare-fun m!558419 () Bool)

(assert (=> start!53340 m!558419))

(declare-fun m!558421 () Bool)

(assert (=> start!53340 m!558421))

(declare-fun m!558423 () Bool)

(assert (=> b!579634 m!558423))

(declare-fun m!558425 () Bool)

(assert (=> b!579636 m!558425))

(check-sat (not b!579632) (not b!579631) (not b!579630) (not b!579636) (not b!579634) (not b!579637) (not start!53340) (not b!579635))
(check-sat)
