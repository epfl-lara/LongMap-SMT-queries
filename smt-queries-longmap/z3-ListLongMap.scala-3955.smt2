; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53790 () Bool)

(assert start!53790)

(declare-fun b!586383 () Bool)

(declare-fun res!374094 () Bool)

(declare-fun e!335322 () Bool)

(assert (=> b!586383 (=> (not res!374094) (not e!335322))))

(declare-datatypes ((array!36636 0))(
  ( (array!36637 (arr!17590 (Array (_ BitVec 32) (_ BitVec 64))) (size!17954 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36636)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586383 (= res!374094 (validKeyInArray!0 (select (arr!17590 a!2986) j!136)))))

(declare-fun b!586384 () Bool)

(declare-fun res!374097 () Bool)

(assert (=> b!586384 (=> (not res!374097) (not e!335322))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586384 (= res!374097 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586385 () Bool)

(declare-fun res!374103 () Bool)

(assert (=> b!586385 (=> (not res!374103) (not e!335322))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586385 (= res!374103 (and (= (size!17954 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17954 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17954 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586386 () Bool)

(declare-fun res!374095 () Bool)

(declare-fun e!335320 () Bool)

(assert (=> b!586386 (=> (not res!374095) (not e!335320))))

(declare-datatypes ((List!11538 0))(
  ( (Nil!11535) (Cons!11534 (h!12582 (_ BitVec 64)) (t!17758 List!11538)) )
))
(declare-fun arrayNoDuplicates!0 (array!36636 (_ BitVec 32) List!11538) Bool)

(assert (=> b!586386 (= res!374095 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11535))))

(declare-fun b!586387 () Bool)

(declare-fun res!374096 () Bool)

(assert (=> b!586387 (=> (not res!374096) (not e!335322))))

(assert (=> b!586387 (= res!374096 (validKeyInArray!0 k0!1786))))

(declare-fun b!586388 () Bool)

(declare-fun res!374100 () Bool)

(assert (=> b!586388 (=> (not res!374100) (not e!335320))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586388 (= res!374100 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17590 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17590 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!374098 () Bool)

(assert (=> start!53790 (=> (not res!374098) (not e!335322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53790 (= res!374098 (validMask!0 mask!3053))))

(assert (=> start!53790 e!335322))

(assert (=> start!53790 true))

(declare-fun array_inv!13449 (array!36636) Bool)

(assert (=> start!53790 (array_inv!13449 a!2986)))

(declare-fun b!586389 () Bool)

(assert (=> b!586389 (= e!335322 e!335320)))

(declare-fun res!374104 () Bool)

(assert (=> b!586389 (=> (not res!374104) (not e!335320))))

(declare-datatypes ((SeekEntryResult!5986 0))(
  ( (MissingZero!5986 (index!26171 (_ BitVec 32))) (Found!5986 (index!26172 (_ BitVec 32))) (Intermediate!5986 (undefined!6798 Bool) (index!26173 (_ BitVec 32)) (x!55138 (_ BitVec 32))) (Undefined!5986) (MissingVacant!5986 (index!26174 (_ BitVec 32))) )
))
(declare-fun lt!266125 () SeekEntryResult!5986)

(assert (=> b!586389 (= res!374104 (or (= lt!266125 (MissingZero!5986 i!1108)) (= lt!266125 (MissingVacant!5986 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36636 (_ BitVec 32)) SeekEntryResult!5986)

(assert (=> b!586389 (= lt!266125 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586390 () Bool)

(declare-fun res!374101 () Bool)

(assert (=> b!586390 (=> (not res!374101) (not e!335320))))

(assert (=> b!586390 (= res!374101 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17590 a!2986) index!984) (select (arr!17590 a!2986) j!136))) (not (= (select (arr!17590 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586391 () Bool)

(declare-fun res!374099 () Bool)

(assert (=> b!586391 (=> (not res!374099) (not e!335320))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36636 (_ BitVec 32)) SeekEntryResult!5986)

(assert (=> b!586391 (= res!374099 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17590 a!2986) j!136) a!2986 mask!3053) (Found!5986 j!136)))))

(declare-fun b!586392 () Bool)

(declare-fun res!374102 () Bool)

(assert (=> b!586392 (=> (not res!374102) (not e!335320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36636 (_ BitVec 32)) Bool)

(assert (=> b!586392 (= res!374102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586393 () Bool)

(assert (=> b!586393 (= e!335320 (not true))))

(declare-fun lt!266124 () (_ BitVec 32))

(assert (=> b!586393 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266124 vacantSpotIndex!68 (select (arr!17590 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266124 vacantSpotIndex!68 (select (store (arr!17590 a!2986) i!1108 k0!1786) j!136) (array!36637 (store (arr!17590 a!2986) i!1108 k0!1786) (size!17954 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18169 0))(
  ( (Unit!18170) )
))
(declare-fun lt!266123 () Unit!18169)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36636 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18169)

(assert (=> b!586393 (= lt!266123 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266124 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586393 (= lt!266124 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!53790 res!374098) b!586385))

(assert (= (and b!586385 res!374103) b!586383))

(assert (= (and b!586383 res!374094) b!586387))

(assert (= (and b!586387 res!374096) b!586384))

(assert (= (and b!586384 res!374097) b!586389))

(assert (= (and b!586389 res!374104) b!586392))

(assert (= (and b!586392 res!374102) b!586386))

(assert (= (and b!586386 res!374095) b!586388))

(assert (= (and b!586388 res!374100) b!586391))

(assert (= (and b!586391 res!374099) b!586390))

(assert (= (and b!586390 res!374101) b!586393))

(declare-fun m!564851 () Bool)

(assert (=> start!53790 m!564851))

(declare-fun m!564853 () Bool)

(assert (=> start!53790 m!564853))

(declare-fun m!564855 () Bool)

(assert (=> b!586388 m!564855))

(declare-fun m!564857 () Bool)

(assert (=> b!586388 m!564857))

(declare-fun m!564859 () Bool)

(assert (=> b!586388 m!564859))

(declare-fun m!564861 () Bool)

(assert (=> b!586389 m!564861))

(declare-fun m!564863 () Bool)

(assert (=> b!586387 m!564863))

(declare-fun m!564865 () Bool)

(assert (=> b!586384 m!564865))

(declare-fun m!564867 () Bool)

(assert (=> b!586390 m!564867))

(declare-fun m!564869 () Bool)

(assert (=> b!586390 m!564869))

(declare-fun m!564871 () Bool)

(assert (=> b!586386 m!564871))

(declare-fun m!564873 () Bool)

(assert (=> b!586393 m!564873))

(declare-fun m!564875 () Bool)

(assert (=> b!586393 m!564875))

(assert (=> b!586393 m!564869))

(assert (=> b!586393 m!564869))

(declare-fun m!564877 () Bool)

(assert (=> b!586393 m!564877))

(declare-fun m!564879 () Bool)

(assert (=> b!586393 m!564879))

(assert (=> b!586393 m!564875))

(declare-fun m!564881 () Bool)

(assert (=> b!586393 m!564881))

(assert (=> b!586393 m!564857))

(assert (=> b!586383 m!564869))

(assert (=> b!586383 m!564869))

(declare-fun m!564883 () Bool)

(assert (=> b!586383 m!564883))

(assert (=> b!586391 m!564869))

(assert (=> b!586391 m!564869))

(declare-fun m!564885 () Bool)

(assert (=> b!586391 m!564885))

(declare-fun m!564887 () Bool)

(assert (=> b!586392 m!564887))

(check-sat (not b!586391) (not b!586384) (not b!586387) (not b!586392) (not b!586386) (not start!53790) (not b!586389) (not b!586383) (not b!586393))
(check-sat)
