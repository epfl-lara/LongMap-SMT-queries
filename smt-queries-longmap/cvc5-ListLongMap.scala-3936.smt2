; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53626 () Bool)

(assert start!53626)

(declare-fun b!584178 () Bool)

(declare-fun e!334566 () Bool)

(assert (=> b!584178 (= e!334566 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36527 0))(
  ( (array!36528 (arr!17538 (Array (_ BitVec 32) (_ BitVec 64))) (size!17902 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36527)

(declare-fun lt!265508 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5978 0))(
  ( (MissingZero!5978 (index!26139 (_ BitVec 32))) (Found!5978 (index!26140 (_ BitVec 32))) (Intermediate!5978 (undefined!6790 Bool) (index!26141 (_ BitVec 32)) (x!54975 (_ BitVec 32))) (Undefined!5978) (MissingVacant!5978 (index!26142 (_ BitVec 32))) )
))
(declare-fun lt!265510 () SeekEntryResult!5978)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36527 (_ BitVec 32)) SeekEntryResult!5978)

(assert (=> b!584178 (= lt!265510 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265508 vacantSpotIndex!68 (select (arr!17538 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!372001 () Bool)

(declare-fun e!334563 () Bool)

(assert (=> start!53626 (=> (not res!372001) (not e!334563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53626 (= res!372001 (validMask!0 mask!3053))))

(assert (=> start!53626 e!334563))

(assert (=> start!53626 true))

(declare-fun array_inv!13334 (array!36527) Bool)

(assert (=> start!53626 (array_inv!13334 a!2986)))

(declare-fun b!584179 () Bool)

(declare-fun res!372005 () Bool)

(declare-fun e!334564 () Bool)

(assert (=> b!584179 (=> (not res!372005) (not e!334564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36527 (_ BitVec 32)) Bool)

(assert (=> b!584179 (= res!372005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584180 () Bool)

(declare-fun res!371995 () Bool)

(assert (=> b!584180 (=> (not res!371995) (not e!334563))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584180 (= res!371995 (validKeyInArray!0 k!1786))))

(declare-fun b!584181 () Bool)

(declare-fun res!371997 () Bool)

(assert (=> b!584181 (=> (not res!371997) (not e!334564))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584181 (= res!371997 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17538 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17538 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584182 () Bool)

(declare-fun res!371996 () Bool)

(assert (=> b!584182 (=> (not res!371996) (not e!334563))))

(assert (=> b!584182 (= res!371996 (and (= (size!17902 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17902 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17902 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584183 () Bool)

(declare-fun res!372002 () Bool)

(assert (=> b!584183 (=> (not res!372002) (not e!334563))))

(declare-fun arrayContainsKey!0 (array!36527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584183 (= res!372002 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584184 () Bool)

(assert (=> b!584184 (= e!334564 e!334566)))

(declare-fun res!372003 () Bool)

(assert (=> b!584184 (=> (not res!372003) (not e!334566))))

(assert (=> b!584184 (= res!372003 (and (bvsge lt!265508 #b00000000000000000000000000000000) (bvslt lt!265508 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584184 (= lt!265508 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584185 () Bool)

(declare-fun res!372000 () Bool)

(assert (=> b!584185 (=> (not res!372000) (not e!334564))))

(assert (=> b!584185 (= res!372000 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17538 a!2986) j!136) a!2986 mask!3053) (Found!5978 j!136)))))

(declare-fun b!584186 () Bool)

(declare-fun res!372004 () Bool)

(assert (=> b!584186 (=> (not res!372004) (not e!334564))))

(declare-datatypes ((List!11579 0))(
  ( (Nil!11576) (Cons!11575 (h!12620 (_ BitVec 64)) (t!17807 List!11579)) )
))
(declare-fun arrayNoDuplicates!0 (array!36527 (_ BitVec 32) List!11579) Bool)

(assert (=> b!584186 (= res!372004 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11576))))

(declare-fun b!584187 () Bool)

(declare-fun res!371998 () Bool)

(assert (=> b!584187 (=> (not res!371998) (not e!334564))))

(assert (=> b!584187 (= res!371998 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17538 a!2986) index!984) (select (arr!17538 a!2986) j!136))) (not (= (select (arr!17538 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584188 () Bool)

(assert (=> b!584188 (= e!334563 e!334564)))

(declare-fun res!371994 () Bool)

(assert (=> b!584188 (=> (not res!371994) (not e!334564))))

(declare-fun lt!265509 () SeekEntryResult!5978)

(assert (=> b!584188 (= res!371994 (or (= lt!265509 (MissingZero!5978 i!1108)) (= lt!265509 (MissingVacant!5978 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36527 (_ BitVec 32)) SeekEntryResult!5978)

(assert (=> b!584188 (= lt!265509 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584189 () Bool)

(declare-fun res!371999 () Bool)

(assert (=> b!584189 (=> (not res!371999) (not e!334563))))

(assert (=> b!584189 (= res!371999 (validKeyInArray!0 (select (arr!17538 a!2986) j!136)))))

(assert (= (and start!53626 res!372001) b!584182))

(assert (= (and b!584182 res!371996) b!584189))

(assert (= (and b!584189 res!371999) b!584180))

(assert (= (and b!584180 res!371995) b!584183))

(assert (= (and b!584183 res!372002) b!584188))

(assert (= (and b!584188 res!371994) b!584179))

(assert (= (and b!584179 res!372005) b!584186))

(assert (= (and b!584186 res!372004) b!584181))

(assert (= (and b!584181 res!371997) b!584185))

(assert (= (and b!584185 res!372000) b!584187))

(assert (= (and b!584187 res!371998) b!584184))

(assert (= (and b!584184 res!372003) b!584178))

(declare-fun m!562561 () Bool)

(assert (=> b!584178 m!562561))

(assert (=> b!584178 m!562561))

(declare-fun m!562563 () Bool)

(assert (=> b!584178 m!562563))

(declare-fun m!562565 () Bool)

(assert (=> b!584188 m!562565))

(declare-fun m!562567 () Bool)

(assert (=> b!584179 m!562567))

(assert (=> b!584185 m!562561))

(assert (=> b!584185 m!562561))

(declare-fun m!562569 () Bool)

(assert (=> b!584185 m!562569))

(declare-fun m!562571 () Bool)

(assert (=> b!584181 m!562571))

(declare-fun m!562573 () Bool)

(assert (=> b!584181 m!562573))

(declare-fun m!562575 () Bool)

(assert (=> b!584181 m!562575))

(declare-fun m!562577 () Bool)

(assert (=> b!584183 m!562577))

(assert (=> b!584189 m!562561))

(assert (=> b!584189 m!562561))

(declare-fun m!562579 () Bool)

(assert (=> b!584189 m!562579))

(declare-fun m!562581 () Bool)

(assert (=> b!584187 m!562581))

(assert (=> b!584187 m!562561))

(declare-fun m!562583 () Bool)

(assert (=> b!584180 m!562583))

(declare-fun m!562585 () Bool)

(assert (=> b!584184 m!562585))

(declare-fun m!562587 () Bool)

(assert (=> b!584186 m!562587))

(declare-fun m!562589 () Bool)

(assert (=> start!53626 m!562589))

(declare-fun m!562591 () Bool)

(assert (=> start!53626 m!562591))

(push 1)

(assert (not b!584179))

(assert (not b!584186))

(assert (not b!584178))

