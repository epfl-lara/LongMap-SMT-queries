; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53698 () Bool)

(assert start!53698)

(declare-fun b!585474 () Bool)

(declare-fun res!373290 () Bool)

(declare-fun e!334997 () Bool)

(assert (=> b!585474 (=> (not res!373290) (not e!334997))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585474 (= res!373290 (validKeyInArray!0 k!1786))))

(declare-fun b!585475 () Bool)

(declare-fun res!373295 () Bool)

(assert (=> b!585475 (=> (not res!373295) (not e!334997))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36599 0))(
  ( (array!36600 (arr!17574 (Array (_ BitVec 32) (_ BitVec 64))) (size!17938 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36599)

(assert (=> b!585475 (= res!373295 (and (= (size!17938 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17938 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17938 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585476 () Bool)

(declare-fun e!334996 () Bool)

(declare-fun e!334998 () Bool)

(assert (=> b!585476 (= e!334996 e!334998)))

(declare-fun res!373299 () Bool)

(assert (=> b!585476 (=> (not res!373299) (not e!334998))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265834 () (_ BitVec 32))

(assert (=> b!585476 (= res!373299 (and (bvsge lt!265834 #b00000000000000000000000000000000) (bvslt lt!265834 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585476 (= lt!265834 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585477 () Bool)

(declare-fun res!373298 () Bool)

(assert (=> b!585477 (=> (not res!373298) (not e!334996))))

(assert (=> b!585477 (= res!373298 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17574 a!2986) index!984) (select (arr!17574 a!2986) j!136))) (not (= (select (arr!17574 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373294 () Bool)

(assert (=> start!53698 (=> (not res!373294) (not e!334997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53698 (= res!373294 (validMask!0 mask!3053))))

(assert (=> start!53698 e!334997))

(assert (=> start!53698 true))

(declare-fun array_inv!13370 (array!36599) Bool)

(assert (=> start!53698 (array_inv!13370 a!2986)))

(declare-fun b!585478 () Bool)

(declare-fun res!373291 () Bool)

(assert (=> b!585478 (=> (not res!373291) (not e!334997))))

(declare-fun arrayContainsKey!0 (array!36599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585478 (= res!373291 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585479 () Bool)

(declare-fun res!373300 () Bool)

(assert (=> b!585479 (=> (not res!373300) (not e!334996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36599 (_ BitVec 32)) Bool)

(assert (=> b!585479 (= res!373300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585480 () Bool)

(declare-fun res!373296 () Bool)

(assert (=> b!585480 (=> (not res!373296) (not e!334996))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6014 0))(
  ( (MissingZero!6014 (index!26283 (_ BitVec 32))) (Found!6014 (index!26284 (_ BitVec 32))) (Intermediate!6014 (undefined!6826 Bool) (index!26285 (_ BitVec 32)) (x!55107 (_ BitVec 32))) (Undefined!6014) (MissingVacant!6014 (index!26286 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36599 (_ BitVec 32)) SeekEntryResult!6014)

(assert (=> b!585480 (= res!373296 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17574 a!2986) j!136) a!2986 mask!3053) (Found!6014 j!136)))))

(declare-fun b!585481 () Bool)

(assert (=> b!585481 (= e!334998 false)))

(declare-fun lt!265832 () SeekEntryResult!6014)

(assert (=> b!585481 (= lt!265832 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265834 vacantSpotIndex!68 (select (arr!17574 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585482 () Bool)

(declare-fun res!373292 () Bool)

(assert (=> b!585482 (=> (not res!373292) (not e!334996))))

(assert (=> b!585482 (= res!373292 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17574 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17574 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585483 () Bool)

(declare-fun res!373297 () Bool)

(assert (=> b!585483 (=> (not res!373297) (not e!334997))))

(assert (=> b!585483 (= res!373297 (validKeyInArray!0 (select (arr!17574 a!2986) j!136)))))

(declare-fun b!585484 () Bool)

(declare-fun res!373301 () Bool)

(assert (=> b!585484 (=> (not res!373301) (not e!334996))))

(declare-datatypes ((List!11615 0))(
  ( (Nil!11612) (Cons!11611 (h!12656 (_ BitVec 64)) (t!17843 List!11615)) )
))
(declare-fun arrayNoDuplicates!0 (array!36599 (_ BitVec 32) List!11615) Bool)

(assert (=> b!585484 (= res!373301 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11612))))

(declare-fun b!585485 () Bool)

(assert (=> b!585485 (= e!334997 e!334996)))

(declare-fun res!373293 () Bool)

(assert (=> b!585485 (=> (not res!373293) (not e!334996))))

(declare-fun lt!265833 () SeekEntryResult!6014)

(assert (=> b!585485 (= res!373293 (or (= lt!265833 (MissingZero!6014 i!1108)) (= lt!265833 (MissingVacant!6014 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36599 (_ BitVec 32)) SeekEntryResult!6014)

(assert (=> b!585485 (= lt!265833 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53698 res!373294) b!585475))

(assert (= (and b!585475 res!373295) b!585483))

(assert (= (and b!585483 res!373297) b!585474))

(assert (= (and b!585474 res!373290) b!585478))

(assert (= (and b!585478 res!373291) b!585485))

(assert (= (and b!585485 res!373293) b!585479))

(assert (= (and b!585479 res!373300) b!585484))

(assert (= (and b!585484 res!373301) b!585482))

(assert (= (and b!585482 res!373292) b!585480))

(assert (= (and b!585480 res!373296) b!585477))

(assert (= (and b!585477 res!373298) b!585476))

(assert (= (and b!585476 res!373299) b!585481))

(declare-fun m!563713 () Bool)

(assert (=> b!585483 m!563713))

(assert (=> b!585483 m!563713))

(declare-fun m!563715 () Bool)

(assert (=> b!585483 m!563715))

(declare-fun m!563717 () Bool)

(assert (=> b!585478 m!563717))

(assert (=> b!585480 m!563713))

(assert (=> b!585480 m!563713))

(declare-fun m!563719 () Bool)

(assert (=> b!585480 m!563719))

(declare-fun m!563721 () Bool)

(assert (=> b!585479 m!563721))

(declare-fun m!563723 () Bool)

(assert (=> b!585476 m!563723))

(declare-fun m!563725 () Bool)

(assert (=> start!53698 m!563725))

(declare-fun m!563727 () Bool)

(assert (=> start!53698 m!563727))

(declare-fun m!563729 () Bool)

(assert (=> b!585484 m!563729))

(declare-fun m!563731 () Bool)

(assert (=> b!585474 m!563731))

(declare-fun m!563733 () Bool)

(assert (=> b!585485 m!563733))

(declare-fun m!563735 () Bool)

(assert (=> b!585477 m!563735))

(assert (=> b!585477 m!563713))

(assert (=> b!585481 m!563713))

(assert (=> b!585481 m!563713))

(declare-fun m!563737 () Bool)

(assert (=> b!585481 m!563737))

(declare-fun m!563739 () Bool)

(assert (=> b!585482 m!563739))

(declare-fun m!563741 () Bool)

(assert (=> b!585482 m!563741))

(declare-fun m!563743 () Bool)

(assert (=> b!585482 m!563743))

(push 1)

