; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53682 () Bool)

(assert start!53682)

(declare-fun b!585186 () Bool)

(declare-fun res!373008 () Bool)

(declare-fun e!334901 () Bool)

(assert (=> b!585186 (=> (not res!373008) (not e!334901))))

(declare-datatypes ((array!36583 0))(
  ( (array!36584 (arr!17566 (Array (_ BitVec 32) (_ BitVec 64))) (size!17930 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36583)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585186 (= res!373008 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585187 () Bool)

(declare-fun res!373009 () Bool)

(declare-fun e!334899 () Bool)

(assert (=> b!585187 (=> (not res!373009) (not e!334899))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36583 (_ BitVec 32)) Bool)

(assert (=> b!585187 (= res!373009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585188 () Bool)

(declare-fun e!334902 () Bool)

(assert (=> b!585188 (= e!334902 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6006 0))(
  ( (MissingZero!6006 (index!26251 (_ BitVec 32))) (Found!6006 (index!26252 (_ BitVec 32))) (Intermediate!6006 (undefined!6818 Bool) (index!26253 (_ BitVec 32)) (x!55075 (_ BitVec 32))) (Undefined!6006) (MissingVacant!6006 (index!26254 (_ BitVec 32))) )
))
(declare-fun lt!265760 () SeekEntryResult!6006)

(declare-fun lt!265762 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36583 (_ BitVec 32)) SeekEntryResult!6006)

(assert (=> b!585188 (= lt!265760 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265762 vacantSpotIndex!68 (select (arr!17566 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585189 () Bool)

(declare-fun res!373013 () Bool)

(assert (=> b!585189 (=> (not res!373013) (not e!334899))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585189 (= res!373013 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17566 a!2986) index!984) (select (arr!17566 a!2986) j!136))) (not (= (select (arr!17566 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373010 () Bool)

(assert (=> start!53682 (=> (not res!373010) (not e!334901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53682 (= res!373010 (validMask!0 mask!3053))))

(assert (=> start!53682 e!334901))

(assert (=> start!53682 true))

(declare-fun array_inv!13362 (array!36583) Bool)

(assert (=> start!53682 (array_inv!13362 a!2986)))

(declare-fun b!585190 () Bool)

(declare-fun res!373011 () Bool)

(assert (=> b!585190 (=> (not res!373011) (not e!334901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585190 (= res!373011 (validKeyInArray!0 k0!1786))))

(declare-fun b!585191 () Bool)

(declare-fun res!373012 () Bool)

(assert (=> b!585191 (=> (not res!373012) (not e!334901))))

(assert (=> b!585191 (= res!373012 (validKeyInArray!0 (select (arr!17566 a!2986) j!136)))))

(declare-fun b!585192 () Bool)

(declare-fun res!373007 () Bool)

(assert (=> b!585192 (=> (not res!373007) (not e!334899))))

(declare-datatypes ((List!11607 0))(
  ( (Nil!11604) (Cons!11603 (h!12648 (_ BitVec 64)) (t!17835 List!11607)) )
))
(declare-fun arrayNoDuplicates!0 (array!36583 (_ BitVec 32) List!11607) Bool)

(assert (=> b!585192 (= res!373007 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11604))))

(declare-fun b!585193 () Bool)

(declare-fun res!373005 () Bool)

(assert (=> b!585193 (=> (not res!373005) (not e!334899))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585193 (= res!373005 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17566 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17566 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585194 () Bool)

(declare-fun res!373004 () Bool)

(assert (=> b!585194 (=> (not res!373004) (not e!334899))))

(assert (=> b!585194 (= res!373004 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17566 a!2986) j!136) a!2986 mask!3053) (Found!6006 j!136)))))

(declare-fun b!585195 () Bool)

(declare-fun res!373003 () Bool)

(assert (=> b!585195 (=> (not res!373003) (not e!334901))))

(assert (=> b!585195 (= res!373003 (and (= (size!17930 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17930 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17930 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585196 () Bool)

(assert (=> b!585196 (= e!334901 e!334899)))

(declare-fun res!373002 () Bool)

(assert (=> b!585196 (=> (not res!373002) (not e!334899))))

(declare-fun lt!265761 () SeekEntryResult!6006)

(assert (=> b!585196 (= res!373002 (or (= lt!265761 (MissingZero!6006 i!1108)) (= lt!265761 (MissingVacant!6006 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36583 (_ BitVec 32)) SeekEntryResult!6006)

(assert (=> b!585196 (= lt!265761 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585197 () Bool)

(assert (=> b!585197 (= e!334899 e!334902)))

(declare-fun res!373006 () Bool)

(assert (=> b!585197 (=> (not res!373006) (not e!334902))))

(assert (=> b!585197 (= res!373006 (and (bvsge lt!265762 #b00000000000000000000000000000000) (bvslt lt!265762 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585197 (= lt!265762 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53682 res!373010) b!585195))

(assert (= (and b!585195 res!373003) b!585191))

(assert (= (and b!585191 res!373012) b!585190))

(assert (= (and b!585190 res!373011) b!585186))

(assert (= (and b!585186 res!373008) b!585196))

(assert (= (and b!585196 res!373002) b!585187))

(assert (= (and b!585187 res!373009) b!585192))

(assert (= (and b!585192 res!373007) b!585193))

(assert (= (and b!585193 res!373005) b!585194))

(assert (= (and b!585194 res!373004) b!585189))

(assert (= (and b!585189 res!373013) b!585197))

(assert (= (and b!585197 res!373006) b!585188))

(declare-fun m!563457 () Bool)

(assert (=> b!585190 m!563457))

(declare-fun m!563459 () Bool)

(assert (=> b!585189 m!563459))

(declare-fun m!563461 () Bool)

(assert (=> b!585189 m!563461))

(declare-fun m!563463 () Bool)

(assert (=> b!585196 m!563463))

(assert (=> b!585194 m!563461))

(assert (=> b!585194 m!563461))

(declare-fun m!563465 () Bool)

(assert (=> b!585194 m!563465))

(assert (=> b!585191 m!563461))

(assert (=> b!585191 m!563461))

(declare-fun m!563467 () Bool)

(assert (=> b!585191 m!563467))

(declare-fun m!563469 () Bool)

(assert (=> b!585197 m!563469))

(declare-fun m!563471 () Bool)

(assert (=> start!53682 m!563471))

(declare-fun m!563473 () Bool)

(assert (=> start!53682 m!563473))

(assert (=> b!585188 m!563461))

(assert (=> b!585188 m!563461))

(declare-fun m!563475 () Bool)

(assert (=> b!585188 m!563475))

(declare-fun m!563477 () Bool)

(assert (=> b!585186 m!563477))

(declare-fun m!563479 () Bool)

(assert (=> b!585193 m!563479))

(declare-fun m!563481 () Bool)

(assert (=> b!585193 m!563481))

(declare-fun m!563483 () Bool)

(assert (=> b!585193 m!563483))

(declare-fun m!563485 () Bool)

(assert (=> b!585192 m!563485))

(declare-fun m!563487 () Bool)

(assert (=> b!585187 m!563487))

(check-sat (not b!585196) (not b!585191) (not b!585190) (not b!585197) (not b!585192) (not b!585194) (not b!585187) (not b!585186) (not start!53682) (not b!585188))
