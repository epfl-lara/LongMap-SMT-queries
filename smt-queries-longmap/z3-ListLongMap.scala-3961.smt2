; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53778 () Bool)

(assert start!53778)

(declare-fun b!586802 () Bool)

(declare-fun res!374627 () Bool)

(declare-fun e!335363 () Bool)

(assert (=> b!586802 (=> (not res!374627) (not e!335363))))

(declare-datatypes ((array!36679 0))(
  ( (array!36680 (arr!17614 (Array (_ BitVec 32) (_ BitVec 64))) (size!17978 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36679)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586802 (= res!374627 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586803 () Bool)

(declare-fun res!374623 () Bool)

(declare-fun e!335362 () Bool)

(assert (=> b!586803 (=> (not res!374623) (not e!335362))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586803 (= res!374623 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17614 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17614 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586804 () Bool)

(assert (=> b!586804 (= e!335363 e!335362)))

(declare-fun res!374622 () Bool)

(assert (=> b!586804 (=> (not res!374622) (not e!335362))))

(declare-datatypes ((SeekEntryResult!6054 0))(
  ( (MissingZero!6054 (index!26443 (_ BitVec 32))) (Found!6054 (index!26444 (_ BitVec 32))) (Intermediate!6054 (undefined!6866 Bool) (index!26445 (_ BitVec 32)) (x!55251 (_ BitVec 32))) (Undefined!6054) (MissingVacant!6054 (index!26446 (_ BitVec 32))) )
))
(declare-fun lt!266193 () SeekEntryResult!6054)

(assert (=> b!586804 (= res!374622 (or (= lt!266193 (MissingZero!6054 i!1108)) (= lt!266193 (MissingVacant!6054 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36679 (_ BitVec 32)) SeekEntryResult!6054)

(assert (=> b!586804 (= lt!266193 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586805 () Bool)

(declare-fun res!374619 () Bool)

(assert (=> b!586805 (=> (not res!374619) (not e!335362))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!586805 (= res!374619 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17614 a!2986) index!984) (select (arr!17614 a!2986) j!136))) (not (= (select (arr!17614 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586801 () Bool)

(declare-fun res!374617 () Bool)

(assert (=> b!586801 (=> (not res!374617) (not e!335363))))

(assert (=> b!586801 (= res!374617 (and (= (size!17978 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17978 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17978 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!374626 () Bool)

(assert (=> start!53778 (=> (not res!374626) (not e!335363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53778 (= res!374626 (validMask!0 mask!3053))))

(assert (=> start!53778 e!335363))

(assert (=> start!53778 true))

(declare-fun array_inv!13410 (array!36679) Bool)

(assert (=> start!53778 (array_inv!13410 a!2986)))

(declare-fun b!586806 () Bool)

(declare-fun res!374625 () Bool)

(assert (=> b!586806 (=> (not res!374625) (not e!335362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36679 (_ BitVec 32)) Bool)

(assert (=> b!586806 (= res!374625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586807 () Bool)

(declare-fun res!374618 () Bool)

(assert (=> b!586807 (=> (not res!374618) (not e!335363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586807 (= res!374618 (validKeyInArray!0 k0!1786))))

(declare-fun b!586808 () Bool)

(declare-fun res!374621 () Bool)

(assert (=> b!586808 (=> (not res!374621) (not e!335362))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36679 (_ BitVec 32)) SeekEntryResult!6054)

(assert (=> b!586808 (= res!374621 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17614 a!2986) j!136) a!2986 mask!3053) (Found!6054 j!136)))))

(declare-fun b!586809 () Bool)

(assert (=> b!586809 (= e!335362 (not true))))

(declare-fun lt!266192 () (_ BitVec 32))

(assert (=> b!586809 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266192 vacantSpotIndex!68 (select (arr!17614 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266192 vacantSpotIndex!68 (select (store (arr!17614 a!2986) i!1108 k0!1786) j!136) (array!36680 (store (arr!17614 a!2986) i!1108 k0!1786) (size!17978 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18228 0))(
  ( (Unit!18229) )
))
(declare-fun lt!266194 () Unit!18228)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36679 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18228)

(assert (=> b!586809 (= lt!266194 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266192 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586809 (= lt!266192 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586810 () Bool)

(declare-fun res!374624 () Bool)

(assert (=> b!586810 (=> (not res!374624) (not e!335362))))

(declare-datatypes ((List!11655 0))(
  ( (Nil!11652) (Cons!11651 (h!12696 (_ BitVec 64)) (t!17883 List!11655)) )
))
(declare-fun arrayNoDuplicates!0 (array!36679 (_ BitVec 32) List!11655) Bool)

(assert (=> b!586810 (= res!374624 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11652))))

(declare-fun b!586811 () Bool)

(declare-fun res!374620 () Bool)

(assert (=> b!586811 (=> (not res!374620) (not e!335363))))

(assert (=> b!586811 (= res!374620 (validKeyInArray!0 (select (arr!17614 a!2986) j!136)))))

(assert (= (and start!53778 res!374626) b!586801))

(assert (= (and b!586801 res!374617) b!586811))

(assert (= (and b!586811 res!374620) b!586807))

(assert (= (and b!586807 res!374618) b!586802))

(assert (= (and b!586802 res!374627) b!586804))

(assert (= (and b!586804 res!374622) b!586806))

(assert (= (and b!586806 res!374625) b!586810))

(assert (= (and b!586810 res!374624) b!586803))

(assert (= (and b!586803 res!374623) b!586808))

(assert (= (and b!586808 res!374621) b!586805))

(assert (= (and b!586805 res!374619) b!586809))

(declare-fun m!565215 () Bool)

(assert (=> b!586807 m!565215))

(declare-fun m!565217 () Bool)

(assert (=> b!586803 m!565217))

(declare-fun m!565219 () Bool)

(assert (=> b!586803 m!565219))

(declare-fun m!565221 () Bool)

(assert (=> b!586803 m!565221))

(declare-fun m!565223 () Bool)

(assert (=> b!586809 m!565223))

(declare-fun m!565225 () Bool)

(assert (=> b!586809 m!565225))

(declare-fun m!565227 () Bool)

(assert (=> b!586809 m!565227))

(assert (=> b!586809 m!565223))

(declare-fun m!565229 () Bool)

(assert (=> b!586809 m!565229))

(assert (=> b!586809 m!565219))

(assert (=> b!586809 m!565229))

(declare-fun m!565231 () Bool)

(assert (=> b!586809 m!565231))

(declare-fun m!565233 () Bool)

(assert (=> b!586809 m!565233))

(declare-fun m!565235 () Bool)

(assert (=> b!586810 m!565235))

(declare-fun m!565237 () Bool)

(assert (=> b!586804 m!565237))

(declare-fun m!565239 () Bool)

(assert (=> start!53778 m!565239))

(declare-fun m!565241 () Bool)

(assert (=> start!53778 m!565241))

(declare-fun m!565243 () Bool)

(assert (=> b!586806 m!565243))

(assert (=> b!586808 m!565229))

(assert (=> b!586808 m!565229))

(declare-fun m!565245 () Bool)

(assert (=> b!586808 m!565245))

(assert (=> b!586811 m!565229))

(assert (=> b!586811 m!565229))

(declare-fun m!565247 () Bool)

(assert (=> b!586811 m!565247))

(declare-fun m!565249 () Bool)

(assert (=> b!586802 m!565249))

(declare-fun m!565251 () Bool)

(assert (=> b!586805 m!565251))

(assert (=> b!586805 m!565229))

(check-sat (not b!586808) (not b!586807) (not b!586810) (not b!586804) (not b!586809) (not b!586806) (not b!586802) (not start!53778) (not b!586811))
(check-sat)
