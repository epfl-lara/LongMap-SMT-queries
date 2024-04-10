; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56984 () Bool)

(assert start!56984)

(declare-fun b!630613 () Bool)

(declare-fun res!407629 () Bool)

(declare-fun e!360597 () Bool)

(assert (=> b!630613 (=> (not res!407629) (not e!360597))))

(declare-datatypes ((array!38060 0))(
  ( (array!38061 (arr!18264 (Array (_ BitVec 32) (_ BitVec 64))) (size!18628 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38060)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630613 (= res!407629 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630614 () Bool)

(declare-fun e!360601 () Bool)

(assert (=> b!630614 (= e!360597 e!360601)))

(declare-fun res!407631 () Bool)

(assert (=> b!630614 (=> (not res!407631) (not e!360601))))

(declare-datatypes ((SeekEntryResult!6704 0))(
  ( (MissingZero!6704 (index!29106 (_ BitVec 32))) (Found!6704 (index!29107 (_ BitVec 32))) (Intermediate!6704 (undefined!7516 Bool) (index!29108 (_ BitVec 32)) (x!57850 (_ BitVec 32))) (Undefined!6704) (MissingVacant!6704 (index!29109 (_ BitVec 32))) )
))
(declare-fun lt!291260 () SeekEntryResult!6704)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630614 (= res!407631 (or (= lt!291260 (MissingZero!6704 i!1108)) (= lt!291260 (MissingVacant!6704 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38060 (_ BitVec 32)) SeekEntryResult!6704)

(assert (=> b!630614 (= lt!291260 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630615 () Bool)

(declare-fun e!360602 () Bool)

(assert (=> b!630615 (= e!360602 (not true))))

(declare-datatypes ((Unit!21150 0))(
  ( (Unit!21151) )
))
(declare-fun lt!291262 () Unit!21150)

(declare-fun e!360603 () Unit!21150)

(assert (=> b!630615 (= lt!291262 e!360603)))

(declare-fun c!71861 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!291261 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!291256 () array!38060)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38060 (_ BitVec 32)) SeekEntryResult!6704)

(assert (=> b!630615 (= c!71861 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291261 lt!291256 mask!3053) Undefined!6704))))

(declare-fun e!360599 () Bool)

(assert (=> b!630615 e!360599))

(declare-fun res!407633 () Bool)

(assert (=> b!630615 (=> (not res!407633) (not e!360599))))

(declare-fun lt!291259 () (_ BitVec 32))

(declare-fun lt!291258 () SeekEntryResult!6704)

(assert (=> b!630615 (= res!407633 (= lt!291258 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291259 vacantSpotIndex!68 lt!291261 lt!291256 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630615 (= lt!291258 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291259 vacantSpotIndex!68 (select (arr!18264 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630615 (= lt!291261 (select (store (arr!18264 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291257 () Unit!21150)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38060 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21150)

(assert (=> b!630615 (= lt!291257 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291259 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630615 (= lt!291259 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630616 () Bool)

(declare-fun Unit!21152 () Unit!21150)

(assert (=> b!630616 (= e!360603 Unit!21152)))

(declare-fun b!630617 () Bool)

(declare-fun e!360600 () Bool)

(assert (=> b!630617 (= e!360600 e!360602)))

(declare-fun res!407625 () Bool)

(assert (=> b!630617 (=> (not res!407625) (not e!360602))))

(declare-fun lt!291255 () SeekEntryResult!6704)

(assert (=> b!630617 (= res!407625 (and (= lt!291255 (Found!6704 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18264 a!2986) index!984) (select (arr!18264 a!2986) j!136))) (not (= (select (arr!18264 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630617 (= lt!291255 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18264 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630618 () Bool)

(declare-fun res!407632 () Bool)

(assert (=> b!630618 (=> (not res!407632) (not e!360597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630618 (= res!407632 (validKeyInArray!0 k!1786))))

(declare-fun b!630619 () Bool)

(declare-fun res!407626 () Bool)

(assert (=> b!630619 (=> (not res!407626) (not e!360597))))

(assert (=> b!630619 (= res!407626 (and (= (size!18628 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18628 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18628 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630620 () Bool)

(declare-fun res!407635 () Bool)

(assert (=> b!630620 (=> (not res!407635) (not e!360597))))

(assert (=> b!630620 (= res!407635 (validKeyInArray!0 (select (arr!18264 a!2986) j!136)))))

(declare-fun b!630621 () Bool)

(declare-fun res!407628 () Bool)

(assert (=> b!630621 (=> (not res!407628) (not e!360601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38060 (_ BitVec 32)) Bool)

(assert (=> b!630621 (= res!407628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630622 () Bool)

(declare-fun res!407630 () Bool)

(assert (=> b!630622 (=> (not res!407630) (not e!360601))))

(declare-datatypes ((List!12305 0))(
  ( (Nil!12302) (Cons!12301 (h!13346 (_ BitVec 64)) (t!18533 List!12305)) )
))
(declare-fun arrayNoDuplicates!0 (array!38060 (_ BitVec 32) List!12305) Bool)

(assert (=> b!630622 (= res!407630 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12302))))

(declare-fun b!630623 () Bool)

(assert (=> b!630623 (= e!360601 e!360600)))

(declare-fun res!407634 () Bool)

(assert (=> b!630623 (=> (not res!407634) (not e!360600))))

(assert (=> b!630623 (= res!407634 (= (select (store (arr!18264 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630623 (= lt!291256 (array!38061 (store (arr!18264 a!2986) i!1108 k!1786) (size!18628 a!2986)))))

(declare-fun b!630624 () Bool)

(declare-fun Unit!21153 () Unit!21150)

(assert (=> b!630624 (= e!360603 Unit!21153)))

(assert (=> b!630624 false))

(declare-fun b!630625 () Bool)

(declare-fun res!407636 () Bool)

(assert (=> b!630625 (=> (not res!407636) (not e!360601))))

(assert (=> b!630625 (= res!407636 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18264 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630626 () Bool)

(assert (=> b!630626 (= e!360599 (= lt!291255 lt!291258))))

(declare-fun res!407627 () Bool)

(assert (=> start!56984 (=> (not res!407627) (not e!360597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56984 (= res!407627 (validMask!0 mask!3053))))

(assert (=> start!56984 e!360597))

(assert (=> start!56984 true))

(declare-fun array_inv!14060 (array!38060) Bool)

(assert (=> start!56984 (array_inv!14060 a!2986)))

(assert (= (and start!56984 res!407627) b!630619))

(assert (= (and b!630619 res!407626) b!630620))

(assert (= (and b!630620 res!407635) b!630618))

(assert (= (and b!630618 res!407632) b!630613))

(assert (= (and b!630613 res!407629) b!630614))

(assert (= (and b!630614 res!407631) b!630621))

(assert (= (and b!630621 res!407628) b!630622))

(assert (= (and b!630622 res!407630) b!630625))

(assert (= (and b!630625 res!407636) b!630623))

(assert (= (and b!630623 res!407634) b!630617))

(assert (= (and b!630617 res!407625) b!630615))

(assert (= (and b!630615 res!407633) b!630626))

(assert (= (and b!630615 c!71861) b!630624))

(assert (= (and b!630615 (not c!71861)) b!630616))

(declare-fun m!605583 () Bool)

(assert (=> b!630623 m!605583))

(declare-fun m!605585 () Bool)

(assert (=> b!630623 m!605585))

(declare-fun m!605587 () Bool)

(assert (=> start!56984 m!605587))

(declare-fun m!605589 () Bool)

(assert (=> start!56984 m!605589))

(declare-fun m!605591 () Bool)

(assert (=> b!630614 m!605591))

(declare-fun m!605593 () Bool)

(assert (=> b!630620 m!605593))

(assert (=> b!630620 m!605593))

(declare-fun m!605595 () Bool)

(assert (=> b!630620 m!605595))

(declare-fun m!605597 () Bool)

(assert (=> b!630622 m!605597))

(declare-fun m!605599 () Bool)

(assert (=> b!630618 m!605599))

(declare-fun m!605601 () Bool)

(assert (=> b!630625 m!605601))

(declare-fun m!605603 () Bool)

(assert (=> b!630613 m!605603))

(declare-fun m!605605 () Bool)

(assert (=> b!630615 m!605605))

(declare-fun m!605607 () Bool)

(assert (=> b!630615 m!605607))

(assert (=> b!630615 m!605593))

(assert (=> b!630615 m!605583))

(assert (=> b!630615 m!605593))

(declare-fun m!605609 () Bool)

(assert (=> b!630615 m!605609))

(declare-fun m!605611 () Bool)

(assert (=> b!630615 m!605611))

(declare-fun m!605613 () Bool)

(assert (=> b!630615 m!605613))

(declare-fun m!605615 () Bool)

(assert (=> b!630615 m!605615))

(declare-fun m!605617 () Bool)

(assert (=> b!630617 m!605617))

(assert (=> b!630617 m!605593))

(assert (=> b!630617 m!605593))

(declare-fun m!605619 () Bool)

(assert (=> b!630617 m!605619))

(declare-fun m!605621 () Bool)

(assert (=> b!630621 m!605621))

(push 1)

