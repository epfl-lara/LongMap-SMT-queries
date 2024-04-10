; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53516 () Bool)

(assert start!53516)

(declare-fun b!582516 () Bool)

(declare-fun res!370340 () Bool)

(declare-fun e!334012 () Bool)

(assert (=> b!582516 (=> (not res!370340) (not e!334012))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36417 0))(
  ( (array!36418 (arr!17483 (Array (_ BitVec 32) (_ BitVec 64))) (size!17847 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36417)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582516 (= res!370340 (and (= (size!17847 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17847 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17847 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582517 () Bool)

(declare-fun res!370337 () Bool)

(declare-fun e!334014 () Bool)

(assert (=> b!582517 (=> (not res!370337) (not e!334014))))

(declare-datatypes ((List!11524 0))(
  ( (Nil!11521) (Cons!11520 (h!12565 (_ BitVec 64)) (t!17752 List!11524)) )
))
(declare-fun arrayNoDuplicates!0 (array!36417 (_ BitVec 32) List!11524) Bool)

(assert (=> b!582517 (= res!370337 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11521))))

(declare-fun b!582518 () Bool)

(assert (=> b!582518 (= e!334014 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5923 0))(
  ( (MissingZero!5923 (index!25919 (_ BitVec 32))) (Found!5923 (index!25920 (_ BitVec 32))) (Intermediate!5923 (undefined!6735 Bool) (index!25921 (_ BitVec 32)) (x!54768 (_ BitVec 32))) (Undefined!5923) (MissingVacant!5923 (index!25922 (_ BitVec 32))) )
))
(declare-fun lt!265132 () SeekEntryResult!5923)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36417 (_ BitVec 32)) SeekEntryResult!5923)

(assert (=> b!582518 (= lt!265132 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17483 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582519 () Bool)

(declare-fun res!370332 () Bool)

(assert (=> b!582519 (=> (not res!370332) (not e!334014))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!582519 (= res!370332 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17483 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17483 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370336 () Bool)

(assert (=> start!53516 (=> (not res!370336) (not e!334012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53516 (= res!370336 (validMask!0 mask!3053))))

(assert (=> start!53516 e!334012))

(assert (=> start!53516 true))

(declare-fun array_inv!13279 (array!36417) Bool)

(assert (=> start!53516 (array_inv!13279 a!2986)))

(declare-fun b!582520 () Bool)

(declare-fun res!370334 () Bool)

(assert (=> b!582520 (=> (not res!370334) (not e!334012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582520 (= res!370334 (validKeyInArray!0 k!1786))))

(declare-fun b!582521 () Bool)

(declare-fun res!370338 () Bool)

(assert (=> b!582521 (=> (not res!370338) (not e!334012))))

(declare-fun arrayContainsKey!0 (array!36417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582521 (= res!370338 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582522 () Bool)

(declare-fun res!370339 () Bool)

(assert (=> b!582522 (=> (not res!370339) (not e!334012))))

(assert (=> b!582522 (= res!370339 (validKeyInArray!0 (select (arr!17483 a!2986) j!136)))))

(declare-fun b!582523 () Bool)

(assert (=> b!582523 (= e!334012 e!334014)))

(declare-fun res!370333 () Bool)

(assert (=> b!582523 (=> (not res!370333) (not e!334014))))

(declare-fun lt!265131 () SeekEntryResult!5923)

(assert (=> b!582523 (= res!370333 (or (= lt!265131 (MissingZero!5923 i!1108)) (= lt!265131 (MissingVacant!5923 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36417 (_ BitVec 32)) SeekEntryResult!5923)

(assert (=> b!582523 (= lt!265131 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582524 () Bool)

(declare-fun res!370335 () Bool)

(assert (=> b!582524 (=> (not res!370335) (not e!334014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36417 (_ BitVec 32)) Bool)

(assert (=> b!582524 (= res!370335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53516 res!370336) b!582516))

(assert (= (and b!582516 res!370340) b!582522))

(assert (= (and b!582522 res!370339) b!582520))

(assert (= (and b!582520 res!370334) b!582521))

(assert (= (and b!582521 res!370338) b!582523))

(assert (= (and b!582523 res!370333) b!582524))

(assert (= (and b!582524 res!370335) b!582517))

(assert (= (and b!582517 res!370337) b!582519))

(assert (= (and b!582519 res!370332) b!582518))

(declare-fun m!561017 () Bool)

(assert (=> b!582520 m!561017))

(declare-fun m!561019 () Bool)

(assert (=> b!582522 m!561019))

(assert (=> b!582522 m!561019))

(declare-fun m!561021 () Bool)

(assert (=> b!582522 m!561021))

(declare-fun m!561023 () Bool)

(assert (=> b!582517 m!561023))

(declare-fun m!561025 () Bool)

(assert (=> start!53516 m!561025))

(declare-fun m!561027 () Bool)

(assert (=> start!53516 m!561027))

(declare-fun m!561029 () Bool)

(assert (=> b!582519 m!561029))

(declare-fun m!561031 () Bool)

(assert (=> b!582519 m!561031))

(declare-fun m!561033 () Bool)

(assert (=> b!582519 m!561033))

(declare-fun m!561035 () Bool)

(assert (=> b!582524 m!561035))

(declare-fun m!561037 () Bool)

(assert (=> b!582523 m!561037))

(declare-fun m!561039 () Bool)

(assert (=> b!582521 m!561039))

(assert (=> b!582518 m!561019))

(assert (=> b!582518 m!561019))

(declare-fun m!561041 () Bool)

(assert (=> b!582518 m!561041))

(push 1)

(assert (not b!582518))

(assert (not b!582522))

(assert (not start!53516))

(assert (not b!582521))

(assert (not b!582517))

(assert (not b!582520))

(assert (not b!582524))

(assert (not b!582523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

