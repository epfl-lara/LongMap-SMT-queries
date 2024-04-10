; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53582 () Bool)

(assert start!53582)

(declare-fun b!583416 () Bool)

(declare-fun res!371239 () Bool)

(declare-fun e!334310 () Bool)

(assert (=> b!583416 (=> (not res!371239) (not e!334310))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36483 0))(
  ( (array!36484 (arr!17516 (Array (_ BitVec 32) (_ BitVec 64))) (size!17880 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36483)

(assert (=> b!583416 (= res!371239 (and (= (size!17880 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17880 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17880 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583417 () Bool)

(declare-fun res!371232 () Bool)

(declare-fun e!334311 () Bool)

(assert (=> b!583417 (=> (not res!371232) (not e!334311))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583417 (= res!371232 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17516 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17516 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583418 () Bool)

(declare-fun res!371238 () Bool)

(assert (=> b!583418 (=> (not res!371238) (not e!334310))))

(declare-fun arrayContainsKey!0 (array!36483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583418 (= res!371238 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583419 () Bool)

(declare-fun res!371234 () Bool)

(assert (=> b!583419 (=> (not res!371234) (not e!334311))))

(declare-datatypes ((List!11557 0))(
  ( (Nil!11554) (Cons!11553 (h!12598 (_ BitVec 64)) (t!17785 List!11557)) )
))
(declare-fun arrayNoDuplicates!0 (array!36483 (_ BitVec 32) List!11557) Bool)

(assert (=> b!583419 (= res!371234 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11554))))

(declare-fun b!583420 () Bool)

(assert (=> b!583420 (= e!334311 false)))

(declare-datatypes ((SeekEntryResult!5956 0))(
  ( (MissingZero!5956 (index!26051 (_ BitVec 32))) (Found!5956 (index!26052 (_ BitVec 32))) (Intermediate!5956 (undefined!6768 Bool) (index!26053 (_ BitVec 32)) (x!54889 (_ BitVec 32))) (Undefined!5956) (MissingVacant!5956 (index!26054 (_ BitVec 32))) )
))
(declare-fun lt!265320 () SeekEntryResult!5956)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36483 (_ BitVec 32)) SeekEntryResult!5956)

(assert (=> b!583420 (= lt!265320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17516 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583421 () Bool)

(declare-fun res!371233 () Bool)

(assert (=> b!583421 (=> (not res!371233) (not e!334310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583421 (= res!371233 (validKeyInArray!0 (select (arr!17516 a!2986) j!136)))))

(declare-fun b!583423 () Bool)

(declare-fun res!371237 () Bool)

(assert (=> b!583423 (=> (not res!371237) (not e!334310))))

(assert (=> b!583423 (= res!371237 (validKeyInArray!0 k!1786))))

(declare-fun b!583424 () Bool)

(assert (=> b!583424 (= e!334310 e!334311)))

(declare-fun res!371240 () Bool)

(assert (=> b!583424 (=> (not res!371240) (not e!334311))))

(declare-fun lt!265321 () SeekEntryResult!5956)

(assert (=> b!583424 (= res!371240 (or (= lt!265321 (MissingZero!5956 i!1108)) (= lt!265321 (MissingVacant!5956 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36483 (_ BitVec 32)) SeekEntryResult!5956)

(assert (=> b!583424 (= lt!265321 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!371235 () Bool)

(assert (=> start!53582 (=> (not res!371235) (not e!334310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53582 (= res!371235 (validMask!0 mask!3053))))

(assert (=> start!53582 e!334310))

(assert (=> start!53582 true))

(declare-fun array_inv!13312 (array!36483) Bool)

(assert (=> start!53582 (array_inv!13312 a!2986)))

(declare-fun b!583422 () Bool)

(declare-fun res!371236 () Bool)

(assert (=> b!583422 (=> (not res!371236) (not e!334311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36483 (_ BitVec 32)) Bool)

(assert (=> b!583422 (= res!371236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53582 res!371235) b!583416))

(assert (= (and b!583416 res!371239) b!583421))

(assert (= (and b!583421 res!371233) b!583423))

(assert (= (and b!583423 res!371237) b!583418))

(assert (= (and b!583418 res!371238) b!583424))

(assert (= (and b!583424 res!371240) b!583422))

(assert (= (and b!583422 res!371236) b!583419))

(assert (= (and b!583419 res!371234) b!583417))

(assert (= (and b!583417 res!371232) b!583420))

(declare-fun m!561881 () Bool)

(assert (=> b!583424 m!561881))

(declare-fun m!561883 () Bool)

(assert (=> b!583420 m!561883))

(assert (=> b!583420 m!561883))

(declare-fun m!561885 () Bool)

(assert (=> b!583420 m!561885))

(declare-fun m!561887 () Bool)

(assert (=> b!583422 m!561887))

(declare-fun m!561889 () Bool)

(assert (=> start!53582 m!561889))

(declare-fun m!561891 () Bool)

(assert (=> start!53582 m!561891))

(declare-fun m!561893 () Bool)

(assert (=> b!583418 m!561893))

(assert (=> b!583421 m!561883))

(assert (=> b!583421 m!561883))

(declare-fun m!561895 () Bool)

(assert (=> b!583421 m!561895))

(declare-fun m!561897 () Bool)

(assert (=> b!583423 m!561897))

(declare-fun m!561899 () Bool)

(assert (=> b!583419 m!561899))

(declare-fun m!561901 () Bool)

(assert (=> b!583417 m!561901))

(declare-fun m!561903 () Bool)

(assert (=> b!583417 m!561903))

(declare-fun m!561905 () Bool)

(assert (=> b!583417 m!561905))

(push 1)

