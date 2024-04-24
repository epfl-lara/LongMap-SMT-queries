; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53490 () Bool)

(assert start!53490)

(declare-fun b!581672 () Bool)

(declare-fun e!333799 () Bool)

(assert (=> b!581672 (= e!333799 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5836 0))(
  ( (MissingZero!5836 (index!25571 (_ BitVec 32))) (Found!5836 (index!25572 (_ BitVec 32))) (Intermediate!5836 (undefined!6648 Bool) (index!25573 (_ BitVec 32)) (x!54588 (_ BitVec 32))) (Undefined!5836) (MissingVacant!5836 (index!25574 (_ BitVec 32))) )
))
(declare-fun lt!265023 () SeekEntryResult!5836)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36336 0))(
  ( (array!36337 (arr!17440 (Array (_ BitVec 32) (_ BitVec 64))) (size!17804 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36336)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36336 (_ BitVec 32)) SeekEntryResult!5836)

(assert (=> b!581672 (= lt!265023 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17440 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581673 () Bool)

(declare-fun res!369389 () Bool)

(declare-fun e!333800 () Bool)

(assert (=> b!581673 (=> (not res!369389) (not e!333800))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581673 (= res!369389 (validKeyInArray!0 k0!1786))))

(declare-fun res!369386 () Bool)

(assert (=> start!53490 (=> (not res!369386) (not e!333800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53490 (= res!369386 (validMask!0 mask!3053))))

(assert (=> start!53490 e!333800))

(assert (=> start!53490 true))

(declare-fun array_inv!13299 (array!36336) Bool)

(assert (=> start!53490 (array_inv!13299 a!2986)))

(declare-fun b!581674 () Bool)

(declare-fun res!369388 () Bool)

(assert (=> b!581674 (=> (not res!369388) (not e!333799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36336 (_ BitVec 32)) Bool)

(assert (=> b!581674 (= res!369388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581675 () Bool)

(declare-fun res!369391 () Bool)

(assert (=> b!581675 (=> (not res!369391) (not e!333799))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581675 (= res!369391 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17440 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17440 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581676 () Bool)

(declare-fun res!369383 () Bool)

(assert (=> b!581676 (=> (not res!369383) (not e!333800))))

(assert (=> b!581676 (= res!369383 (and (= (size!17804 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17804 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17804 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581677 () Bool)

(declare-fun res!369387 () Bool)

(assert (=> b!581677 (=> (not res!369387) (not e!333800))))

(declare-fun arrayContainsKey!0 (array!36336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581677 (= res!369387 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581678 () Bool)

(declare-fun res!369384 () Bool)

(assert (=> b!581678 (=> (not res!369384) (not e!333800))))

(assert (=> b!581678 (= res!369384 (validKeyInArray!0 (select (arr!17440 a!2986) j!136)))))

(declare-fun b!581679 () Bool)

(assert (=> b!581679 (= e!333800 e!333799)))

(declare-fun res!369385 () Bool)

(assert (=> b!581679 (=> (not res!369385) (not e!333799))))

(declare-fun lt!265024 () SeekEntryResult!5836)

(assert (=> b!581679 (= res!369385 (or (= lt!265024 (MissingZero!5836 i!1108)) (= lt!265024 (MissingVacant!5836 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36336 (_ BitVec 32)) SeekEntryResult!5836)

(assert (=> b!581679 (= lt!265024 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581680 () Bool)

(declare-fun res!369390 () Bool)

(assert (=> b!581680 (=> (not res!369390) (not e!333799))))

(declare-datatypes ((List!11388 0))(
  ( (Nil!11385) (Cons!11384 (h!12432 (_ BitVec 64)) (t!17608 List!11388)) )
))
(declare-fun arrayNoDuplicates!0 (array!36336 (_ BitVec 32) List!11388) Bool)

(assert (=> b!581680 (= res!369390 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11385))))

(assert (= (and start!53490 res!369386) b!581676))

(assert (= (and b!581676 res!369383) b!581678))

(assert (= (and b!581678 res!369384) b!581673))

(assert (= (and b!581673 res!369389) b!581677))

(assert (= (and b!581677 res!369387) b!581679))

(assert (= (and b!581679 res!369385) b!581674))

(assert (= (and b!581674 res!369388) b!581680))

(assert (= (and b!581680 res!369390) b!581675))

(assert (= (and b!581675 res!369391) b!581672))

(declare-fun m!560363 () Bool)

(assert (=> start!53490 m!560363))

(declare-fun m!560365 () Bool)

(assert (=> start!53490 m!560365))

(declare-fun m!560367 () Bool)

(assert (=> b!581675 m!560367))

(declare-fun m!560369 () Bool)

(assert (=> b!581675 m!560369))

(declare-fun m!560371 () Bool)

(assert (=> b!581675 m!560371))

(declare-fun m!560373 () Bool)

(assert (=> b!581678 m!560373))

(assert (=> b!581678 m!560373))

(declare-fun m!560375 () Bool)

(assert (=> b!581678 m!560375))

(declare-fun m!560377 () Bool)

(assert (=> b!581673 m!560377))

(assert (=> b!581672 m!560373))

(assert (=> b!581672 m!560373))

(declare-fun m!560379 () Bool)

(assert (=> b!581672 m!560379))

(declare-fun m!560381 () Bool)

(assert (=> b!581674 m!560381))

(declare-fun m!560383 () Bool)

(assert (=> b!581680 m!560383))

(declare-fun m!560385 () Bool)

(assert (=> b!581679 m!560385))

(declare-fun m!560387 () Bool)

(assert (=> b!581677 m!560387))

(check-sat (not start!53490) (not b!581679) (not b!581672) (not b!581678) (not b!581677) (not b!581674) (not b!581673) (not b!581680))
(check-sat)
