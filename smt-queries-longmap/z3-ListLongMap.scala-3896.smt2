; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53370 () Bool)

(assert start!53370)

(declare-fun b!580463 () Bool)

(declare-fun res!368425 () Bool)

(declare-fun e!333255 () Bool)

(assert (=> b!580463 (=> (not res!368425) (not e!333255))))

(declare-datatypes ((array!36285 0))(
  ( (array!36286 (arr!17417 (Array (_ BitVec 32) (_ BitVec 64))) (size!17782 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36285)

(declare-datatypes ((List!11497 0))(
  ( (Nil!11494) (Cons!11493 (h!12538 (_ BitVec 64)) (t!17716 List!11497)) )
))
(declare-fun arrayNoDuplicates!0 (array!36285 (_ BitVec 32) List!11497) Bool)

(assert (=> b!580463 (= res!368425 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11494))))

(declare-fun b!580464 () Bool)

(assert (=> b!580464 (= e!333255 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5854 0))(
  ( (MissingZero!5854 (index!25643 (_ BitVec 32))) (Found!5854 (index!25644 (_ BitVec 32))) (Intermediate!5854 (undefined!6666 Bool) (index!25645 (_ BitVec 32)) (x!54526 (_ BitVec 32))) (Undefined!5854) (MissingVacant!5854 (index!25646 (_ BitVec 32))) )
))
(declare-fun lt!264525 () SeekEntryResult!5854)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36285 (_ BitVec 32)) SeekEntryResult!5854)

(assert (=> b!580464 (= lt!264525 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17417 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580465 () Bool)

(declare-fun res!368428 () Bool)

(declare-fun e!333254 () Bool)

(assert (=> b!580465 (=> (not res!368428) (not e!333254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580465 (= res!368428 (validKeyInArray!0 (select (arr!17417 a!2986) j!136)))))

(declare-fun b!580466 () Bool)

(declare-fun res!368424 () Bool)

(assert (=> b!580466 (=> (not res!368424) (not e!333254))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580466 (= res!368424 (and (= (size!17782 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17782 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17782 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580467 () Bool)

(declare-fun res!368422 () Bool)

(assert (=> b!580467 (=> (not res!368422) (not e!333254))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580467 (= res!368422 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580468 () Bool)

(declare-fun res!368427 () Bool)

(assert (=> b!580468 (=> (not res!368427) (not e!333254))))

(assert (=> b!580468 (= res!368427 (validKeyInArray!0 k0!1786))))

(declare-fun res!368429 () Bool)

(assert (=> start!53370 (=> (not res!368429) (not e!333254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53370 (= res!368429 (validMask!0 mask!3053))))

(assert (=> start!53370 e!333254))

(assert (=> start!53370 true))

(declare-fun array_inv!13300 (array!36285) Bool)

(assert (=> start!53370 (array_inv!13300 a!2986)))

(declare-fun b!580469 () Bool)

(declare-fun res!368421 () Bool)

(assert (=> b!580469 (=> (not res!368421) (not e!333255))))

(assert (=> b!580469 (= res!368421 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17417 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17417 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580470 () Bool)

(assert (=> b!580470 (= e!333254 e!333255)))

(declare-fun res!368423 () Bool)

(assert (=> b!580470 (=> (not res!368423) (not e!333255))))

(declare-fun lt!264526 () SeekEntryResult!5854)

(assert (=> b!580470 (= res!368423 (or (= lt!264526 (MissingZero!5854 i!1108)) (= lt!264526 (MissingVacant!5854 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36285 (_ BitVec 32)) SeekEntryResult!5854)

(assert (=> b!580470 (= lt!264526 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580471 () Bool)

(declare-fun res!368426 () Bool)

(assert (=> b!580471 (=> (not res!368426) (not e!333255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36285 (_ BitVec 32)) Bool)

(assert (=> b!580471 (= res!368426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53370 res!368429) b!580466))

(assert (= (and b!580466 res!368424) b!580465))

(assert (= (and b!580465 res!368428) b!580468))

(assert (= (and b!580468 res!368427) b!580467))

(assert (= (and b!580467 res!368422) b!580470))

(assert (= (and b!580470 res!368423) b!580471))

(assert (= (and b!580471 res!368426) b!580463))

(assert (= (and b!580463 res!368425) b!580469))

(assert (= (and b!580469 res!368421) b!580464))

(declare-fun m!558517 () Bool)

(assert (=> b!580468 m!558517))

(declare-fun m!558519 () Bool)

(assert (=> b!580470 m!558519))

(declare-fun m!558521 () Bool)

(assert (=> b!580463 m!558521))

(declare-fun m!558523 () Bool)

(assert (=> start!53370 m!558523))

(declare-fun m!558525 () Bool)

(assert (=> start!53370 m!558525))

(declare-fun m!558527 () Bool)

(assert (=> b!580469 m!558527))

(declare-fun m!558529 () Bool)

(assert (=> b!580469 m!558529))

(declare-fun m!558531 () Bool)

(assert (=> b!580469 m!558531))

(declare-fun m!558533 () Bool)

(assert (=> b!580464 m!558533))

(assert (=> b!580464 m!558533))

(declare-fun m!558535 () Bool)

(assert (=> b!580464 m!558535))

(assert (=> b!580465 m!558533))

(assert (=> b!580465 m!558533))

(declare-fun m!558537 () Bool)

(assert (=> b!580465 m!558537))

(declare-fun m!558539 () Bool)

(assert (=> b!580471 m!558539))

(declare-fun m!558541 () Bool)

(assert (=> b!580467 m!558541))

(check-sat (not b!580465) (not b!580471) (not b!580463) (not b!580467) (not b!580468) (not b!580464) (not start!53370) (not b!580470))
(check-sat)
