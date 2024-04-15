; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53514 () Bool)

(assert start!53514)

(declare-fun b!582434 () Bool)

(declare-fun e!333901 () Bool)

(declare-fun e!333902 () Bool)

(assert (=> b!582434 (= e!333901 e!333902)))

(declare-fun res!370396 () Bool)

(assert (=> b!582434 (=> (not res!370396) (not e!333902))))

(declare-datatypes ((SeekEntryResult!5926 0))(
  ( (MissingZero!5926 (index!25931 (_ BitVec 32))) (Found!5926 (index!25932 (_ BitVec 32))) (Intermediate!5926 (undefined!6738 Bool) (index!25933 (_ BitVec 32)) (x!54790 (_ BitVec 32))) (Undefined!5926) (MissingVacant!5926 (index!25934 (_ BitVec 32))) )
))
(declare-fun lt!264939 () SeekEntryResult!5926)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582434 (= res!370396 (or (= lt!264939 (MissingZero!5926 i!1108)) (= lt!264939 (MissingVacant!5926 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36429 0))(
  ( (array!36430 (arr!17489 (Array (_ BitVec 32) (_ BitVec 64))) (size!17854 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36429)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36429 (_ BitVec 32)) SeekEntryResult!5926)

(assert (=> b!582434 (= lt!264939 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582435 () Bool)

(declare-fun res!370400 () Bool)

(assert (=> b!582435 (=> (not res!370400) (not e!333901))))

(declare-fun arrayContainsKey!0 (array!36429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582435 (= res!370400 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582436 () Bool)

(declare-fun res!370397 () Bool)

(assert (=> b!582436 (=> (not res!370397) (not e!333902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36429 (_ BitVec 32)) Bool)

(assert (=> b!582436 (= res!370397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582437 () Bool)

(declare-fun res!370392 () Bool)

(assert (=> b!582437 (=> (not res!370392) (not e!333901))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582437 (= res!370392 (validKeyInArray!0 (select (arr!17489 a!2986) j!136)))))

(declare-fun b!582438 () Bool)

(assert (=> b!582438 (= e!333902 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264940 () SeekEntryResult!5926)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36429 (_ BitVec 32)) SeekEntryResult!5926)

(assert (=> b!582438 (= lt!264940 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17489 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582439 () Bool)

(declare-fun res!370394 () Bool)

(assert (=> b!582439 (=> (not res!370394) (not e!333902))))

(declare-datatypes ((List!11569 0))(
  ( (Nil!11566) (Cons!11565 (h!12610 (_ BitVec 64)) (t!17788 List!11569)) )
))
(declare-fun arrayNoDuplicates!0 (array!36429 (_ BitVec 32) List!11569) Bool)

(assert (=> b!582439 (= res!370394 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11566))))

(declare-fun b!582440 () Bool)

(declare-fun res!370399 () Bool)

(assert (=> b!582440 (=> (not res!370399) (not e!333901))))

(assert (=> b!582440 (= res!370399 (validKeyInArray!0 k0!1786))))

(declare-fun res!370393 () Bool)

(assert (=> start!53514 (=> (not res!370393) (not e!333901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53514 (= res!370393 (validMask!0 mask!3053))))

(assert (=> start!53514 e!333901))

(assert (=> start!53514 true))

(declare-fun array_inv!13372 (array!36429) Bool)

(assert (=> start!53514 (array_inv!13372 a!2986)))

(declare-fun b!582441 () Bool)

(declare-fun res!370395 () Bool)

(assert (=> b!582441 (=> (not res!370395) (not e!333901))))

(assert (=> b!582441 (= res!370395 (and (= (size!17854 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17854 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17854 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582442 () Bool)

(declare-fun res!370398 () Bool)

(assert (=> b!582442 (=> (not res!370398) (not e!333902))))

(assert (=> b!582442 (= res!370398 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17489 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17489 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53514 res!370393) b!582441))

(assert (= (and b!582441 res!370395) b!582437))

(assert (= (and b!582437 res!370392) b!582440))

(assert (= (and b!582440 res!370399) b!582435))

(assert (= (and b!582435 res!370400) b!582434))

(assert (= (and b!582434 res!370396) b!582436))

(assert (= (and b!582436 res!370397) b!582439))

(assert (= (and b!582439 res!370394) b!582442))

(assert (= (and b!582442 res!370398) b!582438))

(declare-fun m!560413 () Bool)

(assert (=> b!582437 m!560413))

(assert (=> b!582437 m!560413))

(declare-fun m!560415 () Bool)

(assert (=> b!582437 m!560415))

(declare-fun m!560417 () Bool)

(assert (=> b!582436 m!560417))

(declare-fun m!560419 () Bool)

(assert (=> b!582439 m!560419))

(declare-fun m!560421 () Bool)

(assert (=> start!53514 m!560421))

(declare-fun m!560423 () Bool)

(assert (=> start!53514 m!560423))

(declare-fun m!560425 () Bool)

(assert (=> b!582440 m!560425))

(declare-fun m!560427 () Bool)

(assert (=> b!582434 m!560427))

(declare-fun m!560429 () Bool)

(assert (=> b!582442 m!560429))

(declare-fun m!560431 () Bool)

(assert (=> b!582442 m!560431))

(declare-fun m!560433 () Bool)

(assert (=> b!582442 m!560433))

(declare-fun m!560435 () Bool)

(assert (=> b!582435 m!560435))

(assert (=> b!582438 m!560413))

(assert (=> b!582438 m!560413))

(declare-fun m!560437 () Bool)

(assert (=> b!582438 m!560437))

(check-sat (not b!582436) (not b!582435) (not b!582438) (not b!582439) (not b!582440) (not start!53514) (not b!582434) (not b!582437))
(check-sat)
