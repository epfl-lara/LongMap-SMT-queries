; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53756 () Bool)

(assert start!53756)

(declare-fun b!586438 () Bool)

(declare-fun res!374258 () Bool)

(declare-fun e!335263 () Bool)

(assert (=> b!586438 (=> (not res!374258) (not e!335263))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36657 0))(
  ( (array!36658 (arr!17603 (Array (_ BitVec 32) (_ BitVec 64))) (size!17967 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36657)

(declare-datatypes ((SeekEntryResult!6043 0))(
  ( (MissingZero!6043 (index!26399 (_ BitVec 32))) (Found!6043 (index!26400 (_ BitVec 32))) (Intermediate!6043 (undefined!6855 Bool) (index!26401 (_ BitVec 32)) (x!55208 (_ BitVec 32))) (Undefined!6043) (MissingVacant!6043 (index!26402 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36657 (_ BitVec 32)) SeekEntryResult!6043)

(assert (=> b!586438 (= res!374258 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17603 a!2986) j!136) a!2986 mask!3053) (Found!6043 j!136)))))

(declare-fun res!374260 () Bool)

(declare-fun e!335265 () Bool)

(assert (=> start!53756 (=> (not res!374260) (not e!335265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53756 (= res!374260 (validMask!0 mask!3053))))

(assert (=> start!53756 e!335265))

(assert (=> start!53756 true))

(declare-fun array_inv!13399 (array!36657) Bool)

(assert (=> start!53756 (array_inv!13399 a!2986)))

(declare-fun b!586439 () Bool)

(assert (=> b!586439 (= e!335263 (not true))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!266094 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586439 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266094 vacantSpotIndex!68 (select (arr!17603 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266094 vacantSpotIndex!68 (select (store (arr!17603 a!2986) i!1108 k!1786) j!136) (array!36658 (store (arr!17603 a!2986) i!1108 k!1786) (size!17967 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18206 0))(
  ( (Unit!18207) )
))
(declare-fun lt!266095 () Unit!18206)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18206)

(assert (=> b!586439 (= lt!266095 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266094 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586439 (= lt!266094 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586440 () Bool)

(declare-fun res!374259 () Bool)

(assert (=> b!586440 (=> (not res!374259) (not e!335263))))

(declare-datatypes ((List!11644 0))(
  ( (Nil!11641) (Cons!11640 (h!12685 (_ BitVec 64)) (t!17872 List!11644)) )
))
(declare-fun arrayNoDuplicates!0 (array!36657 (_ BitVec 32) List!11644) Bool)

(assert (=> b!586440 (= res!374259 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11641))))

(declare-fun b!586441 () Bool)

(declare-fun res!374264 () Bool)

(assert (=> b!586441 (=> (not res!374264) (not e!335265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586441 (= res!374264 (validKeyInArray!0 (select (arr!17603 a!2986) j!136)))))

(declare-fun b!586442 () Bool)

(declare-fun res!374257 () Bool)

(assert (=> b!586442 (=> (not res!374257) (not e!335263))))

(assert (=> b!586442 (= res!374257 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17603 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17603 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586443 () Bool)

(declare-fun res!374254 () Bool)

(assert (=> b!586443 (=> (not res!374254) (not e!335263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36657 (_ BitVec 32)) Bool)

(assert (=> b!586443 (= res!374254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586444 () Bool)

(declare-fun res!374261 () Bool)

(assert (=> b!586444 (=> (not res!374261) (not e!335265))))

(assert (=> b!586444 (= res!374261 (and (= (size!17967 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17967 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17967 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586445 () Bool)

(declare-fun res!374255 () Bool)

(assert (=> b!586445 (=> (not res!374255) (not e!335265))))

(declare-fun arrayContainsKey!0 (array!36657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586445 (= res!374255 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586446 () Bool)

(assert (=> b!586446 (= e!335265 e!335263)))

(declare-fun res!374256 () Bool)

(assert (=> b!586446 (=> (not res!374256) (not e!335263))))

(declare-fun lt!266093 () SeekEntryResult!6043)

(assert (=> b!586446 (= res!374256 (or (= lt!266093 (MissingZero!6043 i!1108)) (= lt!266093 (MissingVacant!6043 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36657 (_ BitVec 32)) SeekEntryResult!6043)

(assert (=> b!586446 (= lt!266093 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586447 () Bool)

(declare-fun res!374262 () Bool)

(assert (=> b!586447 (=> (not res!374262) (not e!335265))))

(assert (=> b!586447 (= res!374262 (validKeyInArray!0 k!1786))))

(declare-fun b!586448 () Bool)

(declare-fun res!374263 () Bool)

(assert (=> b!586448 (=> (not res!374263) (not e!335263))))

(assert (=> b!586448 (= res!374263 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17603 a!2986) index!984) (select (arr!17603 a!2986) j!136))) (not (= (select (arr!17603 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53756 res!374260) b!586444))

(assert (= (and b!586444 res!374261) b!586441))

(assert (= (and b!586441 res!374264) b!586447))

(assert (= (and b!586447 res!374262) b!586445))

(assert (= (and b!586445 res!374255) b!586446))

(assert (= (and b!586446 res!374256) b!586443))

(assert (= (and b!586443 res!374254) b!586440))

(assert (= (and b!586440 res!374259) b!586442))

(assert (= (and b!586442 res!374257) b!586438))

(assert (= (and b!586438 res!374258) b!586448))

(assert (= (and b!586448 res!374263) b!586439))

(declare-fun m!564797 () Bool)

(assert (=> b!586445 m!564797))

(declare-fun m!564799 () Bool)

(assert (=> b!586443 m!564799))

(declare-fun m!564801 () Bool)

(assert (=> b!586448 m!564801))

(declare-fun m!564803 () Bool)

(assert (=> b!586448 m!564803))

(declare-fun m!564805 () Bool)

(assert (=> b!586439 m!564805))

(declare-fun m!564807 () Bool)

(assert (=> b!586439 m!564807))

(assert (=> b!586439 m!564803))

(declare-fun m!564809 () Bool)

(assert (=> b!586439 m!564809))

(declare-fun m!564811 () Bool)

(assert (=> b!586439 m!564811))

(assert (=> b!586439 m!564807))

(declare-fun m!564813 () Bool)

(assert (=> b!586439 m!564813))

(assert (=> b!586439 m!564803))

(declare-fun m!564815 () Bool)

(assert (=> b!586439 m!564815))

(declare-fun m!564817 () Bool)

(assert (=> b!586442 m!564817))

(assert (=> b!586442 m!564809))

(declare-fun m!564819 () Bool)

(assert (=> b!586442 m!564819))

(declare-fun m!564821 () Bool)

(assert (=> b!586446 m!564821))

(assert (=> b!586438 m!564803))

(assert (=> b!586438 m!564803))

(declare-fun m!564823 () Bool)

(assert (=> b!586438 m!564823))

(declare-fun m!564825 () Bool)

(assert (=> b!586440 m!564825))

(declare-fun m!564827 () Bool)

(assert (=> start!53756 m!564827))

(declare-fun m!564829 () Bool)

(assert (=> start!53756 m!564829))

(declare-fun m!564831 () Bool)

(assert (=> b!586447 m!564831))

(assert (=> b!586441 m!564803))

(assert (=> b!586441 m!564803))

(declare-fun m!564833 () Bool)

(assert (=> b!586441 m!564833))

(push 1)

