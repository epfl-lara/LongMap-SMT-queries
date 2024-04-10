; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53372 () Bool)

(assert start!53372)

(declare-fun b!580536 () Bool)

(declare-fun res!368359 () Bool)

(declare-fun e!333364 () Bool)

(assert (=> b!580536 (=> (not res!368359) (not e!333364))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36273 0))(
  ( (array!36274 (arr!17411 (Array (_ BitVec 32) (_ BitVec 64))) (size!17775 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36273)

(assert (=> b!580536 (= res!368359 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17411 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17411 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580537 () Bool)

(assert (=> b!580537 (= e!333364 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5851 0))(
  ( (MissingZero!5851 (index!25631 (_ BitVec 32))) (Found!5851 (index!25632 (_ BitVec 32))) (Intermediate!5851 (undefined!6663 Bool) (index!25633 (_ BitVec 32)) (x!54504 (_ BitVec 32))) (Undefined!5851) (MissingVacant!5851 (index!25634 (_ BitVec 32))) )
))
(declare-fun lt!264727 () SeekEntryResult!5851)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36273 (_ BitVec 32)) SeekEntryResult!5851)

(assert (=> b!580537 (= lt!264727 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17411 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580538 () Bool)

(declare-fun res!368352 () Bool)

(assert (=> b!580538 (=> (not res!368352) (not e!333364))))

(declare-datatypes ((List!11452 0))(
  ( (Nil!11449) (Cons!11448 (h!12493 (_ BitVec 64)) (t!17680 List!11452)) )
))
(declare-fun arrayNoDuplicates!0 (array!36273 (_ BitVec 32) List!11452) Bool)

(assert (=> b!580538 (= res!368352 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11449))))

(declare-fun res!368358 () Bool)

(declare-fun e!333365 () Bool)

(assert (=> start!53372 (=> (not res!368358) (not e!333365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53372 (= res!368358 (validMask!0 mask!3053))))

(assert (=> start!53372 e!333365))

(assert (=> start!53372 true))

(declare-fun array_inv!13207 (array!36273) Bool)

(assert (=> start!53372 (array_inv!13207 a!2986)))

(declare-fun b!580539 () Bool)

(declare-fun res!368355 () Bool)

(assert (=> b!580539 (=> (not res!368355) (not e!333364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36273 (_ BitVec 32)) Bool)

(assert (=> b!580539 (= res!368355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580540 () Bool)

(declare-fun res!368353 () Bool)

(assert (=> b!580540 (=> (not res!368353) (not e!333365))))

(assert (=> b!580540 (= res!368353 (and (= (size!17775 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17775 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17775 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580541 () Bool)

(declare-fun res!368356 () Bool)

(assert (=> b!580541 (=> (not res!368356) (not e!333365))))

(declare-fun arrayContainsKey!0 (array!36273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580541 (= res!368356 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580542 () Bool)

(declare-fun res!368360 () Bool)

(assert (=> b!580542 (=> (not res!368360) (not e!333365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580542 (= res!368360 (validKeyInArray!0 (select (arr!17411 a!2986) j!136)))))

(declare-fun b!580543 () Bool)

(declare-fun res!368357 () Bool)

(assert (=> b!580543 (=> (not res!368357) (not e!333365))))

(assert (=> b!580543 (= res!368357 (validKeyInArray!0 k!1786))))

(declare-fun b!580544 () Bool)

(assert (=> b!580544 (= e!333365 e!333364)))

(declare-fun res!368354 () Bool)

(assert (=> b!580544 (=> (not res!368354) (not e!333364))))

(declare-fun lt!264726 () SeekEntryResult!5851)

(assert (=> b!580544 (= res!368354 (or (= lt!264726 (MissingZero!5851 i!1108)) (= lt!264726 (MissingVacant!5851 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36273 (_ BitVec 32)) SeekEntryResult!5851)

(assert (=> b!580544 (= lt!264726 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53372 res!368358) b!580540))

(assert (= (and b!580540 res!368353) b!580542))

(assert (= (and b!580542 res!368360) b!580543))

(assert (= (and b!580543 res!368357) b!580541))

(assert (= (and b!580541 res!368356) b!580544))

(assert (= (and b!580544 res!368354) b!580539))

(assert (= (and b!580539 res!368355) b!580538))

(assert (= (and b!580538 res!368352) b!580536))

(assert (= (and b!580536 res!368359) b!580537))

(declare-fun m!559115 () Bool)

(assert (=> b!580544 m!559115))

(declare-fun m!559117 () Bool)

(assert (=> b!580538 m!559117))

(declare-fun m!559119 () Bool)

(assert (=> b!580536 m!559119))

(declare-fun m!559121 () Bool)

(assert (=> b!580536 m!559121))

(declare-fun m!559123 () Bool)

(assert (=> b!580536 m!559123))

(declare-fun m!559125 () Bool)

(assert (=> b!580543 m!559125))

(declare-fun m!559127 () Bool)

(assert (=> b!580541 m!559127))

(declare-fun m!559129 () Bool)

(assert (=> b!580542 m!559129))

(assert (=> b!580542 m!559129))

(declare-fun m!559131 () Bool)

(assert (=> b!580542 m!559131))

(declare-fun m!559133 () Bool)

(assert (=> b!580539 m!559133))

(assert (=> b!580537 m!559129))

(assert (=> b!580537 m!559129))

(declare-fun m!559135 () Bool)

(assert (=> b!580537 m!559135))

(declare-fun m!559137 () Bool)

(assert (=> start!53372 m!559137))

(declare-fun m!559139 () Bool)

(assert (=> start!53372 m!559139))

(push 1)

