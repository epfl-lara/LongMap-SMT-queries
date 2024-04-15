; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53526 () Bool)

(assert start!53526)

(declare-fun b!582596 () Bool)

(declare-fun res!370555 () Bool)

(declare-fun e!333956 () Bool)

(assert (=> b!582596 (=> (not res!370555) (not e!333956))))

(declare-datatypes ((array!36441 0))(
  ( (array!36442 (arr!17495 (Array (_ BitVec 32) (_ BitVec 64))) (size!17860 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36441)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36441 (_ BitVec 32)) Bool)

(assert (=> b!582596 (= res!370555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582597 () Bool)

(assert (=> b!582597 (= e!333956 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5932 0))(
  ( (MissingZero!5932 (index!25955 (_ BitVec 32))) (Found!5932 (index!25956 (_ BitVec 32))) (Intermediate!5932 (undefined!6744 Bool) (index!25957 (_ BitVec 32)) (x!54812 (_ BitVec 32))) (Undefined!5932) (MissingVacant!5932 (index!25958 (_ BitVec 32))) )
))
(declare-fun lt!264976 () SeekEntryResult!5932)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36441 (_ BitVec 32)) SeekEntryResult!5932)

(assert (=> b!582597 (= lt!264976 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17495 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582598 () Bool)

(declare-fun res!370559 () Bool)

(declare-fun e!333957 () Bool)

(assert (=> b!582598 (=> (not res!370559) (not e!333957))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582598 (= res!370559 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!370561 () Bool)

(assert (=> start!53526 (=> (not res!370561) (not e!333957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53526 (= res!370561 (validMask!0 mask!3053))))

(assert (=> start!53526 e!333957))

(assert (=> start!53526 true))

(declare-fun array_inv!13378 (array!36441) Bool)

(assert (=> start!53526 (array_inv!13378 a!2986)))

(declare-fun b!582599 () Bool)

(declare-fun res!370558 () Bool)

(assert (=> b!582599 (=> (not res!370558) (not e!333957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582599 (= res!370558 (validKeyInArray!0 (select (arr!17495 a!2986) j!136)))))

(declare-fun b!582600 () Bool)

(declare-fun res!370560 () Bool)

(assert (=> b!582600 (=> (not res!370560) (not e!333957))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582600 (= res!370560 (and (= (size!17860 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17860 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17860 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582601 () Bool)

(assert (=> b!582601 (= e!333957 e!333956)))

(declare-fun res!370556 () Bool)

(assert (=> b!582601 (=> (not res!370556) (not e!333956))))

(declare-fun lt!264975 () SeekEntryResult!5932)

(assert (=> b!582601 (= res!370556 (or (= lt!264975 (MissingZero!5932 i!1108)) (= lt!264975 (MissingVacant!5932 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36441 (_ BitVec 32)) SeekEntryResult!5932)

(assert (=> b!582601 (= lt!264975 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582602 () Bool)

(declare-fun res!370557 () Bool)

(assert (=> b!582602 (=> (not res!370557) (not e!333957))))

(assert (=> b!582602 (= res!370557 (validKeyInArray!0 k0!1786))))

(declare-fun b!582603 () Bool)

(declare-fun res!370554 () Bool)

(assert (=> b!582603 (=> (not res!370554) (not e!333956))))

(declare-datatypes ((List!11575 0))(
  ( (Nil!11572) (Cons!11571 (h!12616 (_ BitVec 64)) (t!17794 List!11575)) )
))
(declare-fun arrayNoDuplicates!0 (array!36441 (_ BitVec 32) List!11575) Bool)

(assert (=> b!582603 (= res!370554 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11572))))

(declare-fun b!582604 () Bool)

(declare-fun res!370562 () Bool)

(assert (=> b!582604 (=> (not res!370562) (not e!333956))))

(assert (=> b!582604 (= res!370562 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17495 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17495 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53526 res!370561) b!582600))

(assert (= (and b!582600 res!370560) b!582599))

(assert (= (and b!582599 res!370558) b!582602))

(assert (= (and b!582602 res!370557) b!582598))

(assert (= (and b!582598 res!370559) b!582601))

(assert (= (and b!582601 res!370556) b!582596))

(assert (= (and b!582596 res!370555) b!582603))

(assert (= (and b!582603 res!370554) b!582604))

(assert (= (and b!582604 res!370562) b!582597))

(declare-fun m!560569 () Bool)

(assert (=> b!582598 m!560569))

(declare-fun m!560571 () Bool)

(assert (=> b!582597 m!560571))

(assert (=> b!582597 m!560571))

(declare-fun m!560573 () Bool)

(assert (=> b!582597 m!560573))

(declare-fun m!560575 () Bool)

(assert (=> b!582603 m!560575))

(declare-fun m!560577 () Bool)

(assert (=> b!582604 m!560577))

(declare-fun m!560579 () Bool)

(assert (=> b!582604 m!560579))

(declare-fun m!560581 () Bool)

(assert (=> b!582604 m!560581))

(declare-fun m!560583 () Bool)

(assert (=> b!582596 m!560583))

(declare-fun m!560585 () Bool)

(assert (=> b!582602 m!560585))

(assert (=> b!582599 m!560571))

(assert (=> b!582599 m!560571))

(declare-fun m!560587 () Bool)

(assert (=> b!582599 m!560587))

(declare-fun m!560589 () Bool)

(assert (=> b!582601 m!560589))

(declare-fun m!560591 () Bool)

(assert (=> start!53526 m!560591))

(declare-fun m!560593 () Bool)

(assert (=> start!53526 m!560593))

(check-sat (not b!582601) (not start!53526) (not b!582597) (not b!582602) (not b!582603) (not b!582598) (not b!582599) (not b!582596))
(check-sat)
