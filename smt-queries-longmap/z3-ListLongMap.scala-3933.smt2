; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53592 () Bool)

(assert start!53592)

(declare-fun b!583583 () Bool)

(declare-fun e!334284 () Bool)

(declare-fun e!334282 () Bool)

(assert (=> b!583583 (= e!334284 e!334282)))

(declare-fun res!371542 () Bool)

(assert (=> b!583583 (=> (not res!371542) (not e!334282))))

(declare-datatypes ((SeekEntryResult!5965 0))(
  ( (MissingZero!5965 (index!26087 (_ BitVec 32))) (Found!5965 (index!26088 (_ BitVec 32))) (Intermediate!5965 (undefined!6777 Bool) (index!26089 (_ BitVec 32)) (x!54933 (_ BitVec 32))) (Undefined!5965) (MissingVacant!5965 (index!26090 (_ BitVec 32))) )
))
(declare-fun lt!265193 () SeekEntryResult!5965)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583583 (= res!371542 (or (= lt!265193 (MissingZero!5965 i!1108)) (= lt!265193 (MissingVacant!5965 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36507 0))(
  ( (array!36508 (arr!17528 (Array (_ BitVec 32) (_ BitVec 64))) (size!17893 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36507)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36507 (_ BitVec 32)) SeekEntryResult!5965)

(assert (=> b!583583 (= lt!265193 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!371547 () Bool)

(assert (=> start!53592 (=> (not res!371547) (not e!334284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53592 (= res!371547 (validMask!0 mask!3053))))

(assert (=> start!53592 e!334284))

(assert (=> start!53592 true))

(declare-fun array_inv!13411 (array!36507) Bool)

(assert (=> start!53592 (array_inv!13411 a!2986)))

(declare-fun b!583584 () Bool)

(declare-fun res!371548 () Bool)

(assert (=> b!583584 (=> (not res!371548) (not e!334282))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36507 (_ BitVec 32)) SeekEntryResult!5965)

(assert (=> b!583584 (= res!371548 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17528 a!2986) j!136) a!2986 mask!3053) (Found!5965 j!136)))))

(declare-fun b!583585 () Bool)

(declare-fun res!371545 () Bool)

(assert (=> b!583585 (=> (not res!371545) (not e!334282))))

(assert (=> b!583585 (= res!371545 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17528 a!2986) index!984) (select (arr!17528 a!2986) j!136))) (not (= (select (arr!17528 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583586 () Bool)

(declare-fun e!334281 () Bool)

(assert (=> b!583586 (= e!334281 false)))

(declare-fun lt!265195 () (_ BitVec 32))

(declare-fun lt!265194 () SeekEntryResult!5965)

(assert (=> b!583586 (= lt!265194 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265195 vacantSpotIndex!68 (select (arr!17528 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583587 () Bool)

(declare-fun res!371546 () Bool)

(assert (=> b!583587 (=> (not res!371546) (not e!334282))))

(declare-datatypes ((List!11608 0))(
  ( (Nil!11605) (Cons!11604 (h!12649 (_ BitVec 64)) (t!17827 List!11608)) )
))
(declare-fun arrayNoDuplicates!0 (array!36507 (_ BitVec 32) List!11608) Bool)

(assert (=> b!583587 (= res!371546 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11605))))

(declare-fun b!583588 () Bool)

(declare-fun res!371549 () Bool)

(assert (=> b!583588 (=> (not res!371549) (not e!334282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36507 (_ BitVec 32)) Bool)

(assert (=> b!583588 (= res!371549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583589 () Bool)

(assert (=> b!583589 (= e!334282 e!334281)))

(declare-fun res!371544 () Bool)

(assert (=> b!583589 (=> (not res!371544) (not e!334281))))

(assert (=> b!583589 (= res!371544 (and (bvsge lt!265195 #b00000000000000000000000000000000) (bvslt lt!265195 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583589 (= lt!265195 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583590 () Bool)

(declare-fun res!371552 () Bool)

(assert (=> b!583590 (=> (not res!371552) (not e!334284))))

(declare-fun arrayContainsKey!0 (array!36507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583590 (= res!371552 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583591 () Bool)

(declare-fun res!371551 () Bool)

(assert (=> b!583591 (=> (not res!371551) (not e!334282))))

(assert (=> b!583591 (= res!371551 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17528 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17528 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583592 () Bool)

(declare-fun res!371543 () Bool)

(assert (=> b!583592 (=> (not res!371543) (not e!334284))))

(assert (=> b!583592 (= res!371543 (and (= (size!17893 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17893 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17893 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583593 () Bool)

(declare-fun res!371550 () Bool)

(assert (=> b!583593 (=> (not res!371550) (not e!334284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583593 (= res!371550 (validKeyInArray!0 k0!1786))))

(declare-fun b!583594 () Bool)

(declare-fun res!371541 () Bool)

(assert (=> b!583594 (=> (not res!371541) (not e!334284))))

(assert (=> b!583594 (= res!371541 (validKeyInArray!0 (select (arr!17528 a!2986) j!136)))))

(assert (= (and start!53592 res!371547) b!583592))

(assert (= (and b!583592 res!371543) b!583594))

(assert (= (and b!583594 res!371541) b!583593))

(assert (= (and b!583593 res!371550) b!583590))

(assert (= (and b!583590 res!371552) b!583583))

(assert (= (and b!583583 res!371542) b!583588))

(assert (= (and b!583588 res!371549) b!583587))

(assert (= (and b!583587 res!371546) b!583591))

(assert (= (and b!583591 res!371551) b!583584))

(assert (= (and b!583584 res!371548) b!583585))

(assert (= (and b!583585 res!371545) b!583589))

(assert (= (and b!583589 res!371544) b!583586))

(declare-fun m!561487 () Bool)

(assert (=> b!583588 m!561487))

(declare-fun m!561489 () Bool)

(assert (=> b!583584 m!561489))

(assert (=> b!583584 m!561489))

(declare-fun m!561491 () Bool)

(assert (=> b!583584 m!561491))

(declare-fun m!561493 () Bool)

(assert (=> b!583593 m!561493))

(declare-fun m!561495 () Bool)

(assert (=> b!583591 m!561495))

(declare-fun m!561497 () Bool)

(assert (=> b!583591 m!561497))

(declare-fun m!561499 () Bool)

(assert (=> b!583591 m!561499))

(assert (=> b!583594 m!561489))

(assert (=> b!583594 m!561489))

(declare-fun m!561501 () Bool)

(assert (=> b!583594 m!561501))

(declare-fun m!561503 () Bool)

(assert (=> b!583587 m!561503))

(declare-fun m!561505 () Bool)

(assert (=> b!583589 m!561505))

(declare-fun m!561507 () Bool)

(assert (=> start!53592 m!561507))

(declare-fun m!561509 () Bool)

(assert (=> start!53592 m!561509))

(assert (=> b!583586 m!561489))

(assert (=> b!583586 m!561489))

(declare-fun m!561511 () Bool)

(assert (=> b!583586 m!561511))

(declare-fun m!561513 () Bool)

(assert (=> b!583585 m!561513))

(assert (=> b!583585 m!561489))

(declare-fun m!561515 () Bool)

(assert (=> b!583590 m!561515))

(declare-fun m!561517 () Bool)

(assert (=> b!583583 m!561517))

(check-sat (not b!583588) (not start!53592) (not b!583587) (not b!583583) (not b!583590) (not b!583593) (not b!583586) (not b!583584) (not b!583589) (not b!583594))
(check-sat)
