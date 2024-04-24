; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55974 () Bool)

(assert start!55974)

(declare-fun b!612679 () Bool)

(declare-fun e!351190 () Bool)

(declare-fun e!351186 () Bool)

(assert (=> b!612679 (= e!351190 e!351186)))

(declare-fun res!394151 () Bool)

(assert (=> b!612679 (=> (not res!394151) (not e!351186))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37389 0))(
  ( (array!37390 (arr!17938 (Array (_ BitVec 32) (_ BitVec 64))) (size!18302 (_ BitVec 32))) )
))
(declare-fun lt!280543 () array!37389)

(declare-fun a!2986 () array!37389)

(declare-fun arrayContainsKey!0 (array!37389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612679 (= res!394151 (arrayContainsKey!0 lt!280543 (select (arr!17938 a!2986) j!136) j!136))))

(declare-fun b!612680 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612680 (= e!351186 (arrayContainsKey!0 lt!280543 (select (arr!17938 a!2986) j!136) index!984))))

(declare-fun b!612681 () Bool)

(declare-fun e!351185 () Bool)

(assert (=> b!612681 (= e!351185 e!351190)))

(declare-fun res!394148 () Bool)

(assert (=> b!612681 (=> res!394148 e!351190)))

(declare-fun lt!280553 () (_ BitVec 64))

(declare-fun lt!280557 () (_ BitVec 64))

(assert (=> b!612681 (= res!394148 (or (not (= (select (arr!17938 a!2986) j!136) lt!280557)) (not (= (select (arr!17938 a!2986) j!136) lt!280553)) (bvsge j!136 index!984)))))

(declare-fun b!612682 () Bool)

(declare-fun e!351198 () Bool)

(assert (=> b!612682 (= e!351198 (arrayContainsKey!0 lt!280543 (select (arr!17938 a!2986) j!136) index!984))))

(declare-fun b!612683 () Bool)

(declare-fun e!351189 () Bool)

(declare-fun e!351188 () Bool)

(assert (=> b!612683 (= e!351189 e!351188)))

(declare-fun res!394142 () Bool)

(assert (=> b!612683 (=> (not res!394142) (not e!351188))))

(declare-datatypes ((SeekEntryResult!6334 0))(
  ( (MissingZero!6334 (index!27620 (_ BitVec 32))) (Found!6334 (index!27621 (_ BitVec 32))) (Intermediate!6334 (undefined!7146 Bool) (index!27622 (_ BitVec 32)) (x!56585 (_ BitVec 32))) (Undefined!6334) (MissingVacant!6334 (index!27623 (_ BitVec 32))) )
))
(declare-fun lt!280556 () SeekEntryResult!6334)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!612683 (= res!394142 (and (= lt!280556 (Found!6334 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17938 a!2986) index!984) (select (arr!17938 a!2986) j!136))) (not (= (select (arr!17938 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37389 (_ BitVec 32)) SeekEntryResult!6334)

(assert (=> b!612683 (= lt!280556 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17938 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612684 () Bool)

(declare-fun e!351197 () Bool)

(declare-fun lt!280558 () SeekEntryResult!6334)

(assert (=> b!612684 (= e!351197 (= lt!280556 lt!280558))))

(declare-fun b!612685 () Bool)

(declare-fun res!394136 () Bool)

(declare-fun e!351194 () Bool)

(assert (=> b!612685 (=> (not res!394136) (not e!351194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612685 (= res!394136 (validKeyInArray!0 (select (arr!17938 a!2986) j!136)))))

(declare-fun b!612686 () Bool)

(declare-datatypes ((Unit!19657 0))(
  ( (Unit!19658) )
))
(declare-fun e!351196 () Unit!19657)

(declare-fun Unit!19659 () Unit!19657)

(assert (=> b!612686 (= e!351196 Unit!19659)))

(declare-fun lt!280548 () Unit!19657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19657)

(assert (=> b!612686 (= lt!280548 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280543 (select (arr!17938 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612686 (arrayContainsKey!0 lt!280543 (select (arr!17938 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!280547 () Unit!19657)

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((List!11886 0))(
  ( (Nil!11883) (Cons!11882 (h!12930 (_ BitVec 64)) (t!18106 List!11886)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11886) Unit!19657)

(assert (=> b!612686 (= lt!280547 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11883))))

(declare-fun arrayNoDuplicates!0 (array!37389 (_ BitVec 32) List!11886) Bool)

(assert (=> b!612686 (arrayNoDuplicates!0 lt!280543 #b00000000000000000000000000000000 Nil!11883)))

(declare-fun lt!280552 () Unit!19657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37389 (_ BitVec 32) (_ BitVec 32)) Unit!19657)

(assert (=> b!612686 (= lt!280552 (lemmaNoDuplicateFromThenFromBigger!0 lt!280543 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612686 (arrayNoDuplicates!0 lt!280543 j!136 Nil!11883)))

(declare-fun lt!280546 () Unit!19657)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37389 (_ BitVec 64) (_ BitVec 32) List!11886) Unit!19657)

(assert (=> b!612686 (= lt!280546 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280543 (select (arr!17938 a!2986) j!136) j!136 Nil!11883))))

(assert (=> b!612686 false))

(declare-fun b!612687 () Bool)

(declare-fun res!394149 () Bool)

(assert (=> b!612687 (=> (not res!394149) (not e!351194))))

(assert (=> b!612687 (= res!394149 (validKeyInArray!0 k0!1786))))

(declare-fun res!394152 () Bool)

(assert (=> start!55974 (=> (not res!394152) (not e!351194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55974 (= res!394152 (validMask!0 mask!3053))))

(assert (=> start!55974 e!351194))

(assert (=> start!55974 true))

(declare-fun array_inv!13797 (array!37389) Bool)

(assert (=> start!55974 (array_inv!13797 a!2986)))

(declare-fun b!612678 () Bool)

(declare-fun e!351195 () Unit!19657)

(declare-fun Unit!19660 () Unit!19657)

(assert (=> b!612678 (= e!351195 Unit!19660)))

(declare-fun b!612688 () Bool)

(declare-fun res!394145 () Bool)

(assert (=> b!612688 (=> (not res!394145) (not e!351194))))

(assert (=> b!612688 (= res!394145 (and (= (size!18302 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18302 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18302 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612689 () Bool)

(declare-fun Unit!19661 () Unit!19657)

(assert (=> b!612689 (= e!351196 Unit!19661)))

(declare-fun b!612690 () Bool)

(declare-fun res!394141 () Bool)

(declare-fun e!351184 () Bool)

(assert (=> b!612690 (=> (not res!394141) (not e!351184))))

(assert (=> b!612690 (= res!394141 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17938 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612691 () Bool)

(declare-fun res!394138 () Bool)

(assert (=> b!612691 (=> (not res!394138) (not e!351194))))

(assert (=> b!612691 (= res!394138 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612692 () Bool)

(declare-fun res!394153 () Bool)

(assert (=> b!612692 (=> (not res!394153) (not e!351184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37389 (_ BitVec 32)) Bool)

(assert (=> b!612692 (= res!394153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612693 () Bool)

(declare-fun res!394147 () Bool)

(assert (=> b!612693 (=> (not res!394147) (not e!351184))))

(assert (=> b!612693 (= res!394147 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11883))))

(declare-fun b!612694 () Bool)

(assert (=> b!612694 (= e!351194 e!351184)))

(declare-fun res!394135 () Bool)

(assert (=> b!612694 (=> (not res!394135) (not e!351184))))

(declare-fun lt!280554 () SeekEntryResult!6334)

(assert (=> b!612694 (= res!394135 (or (= lt!280554 (MissingZero!6334 i!1108)) (= lt!280554 (MissingVacant!6334 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37389 (_ BitVec 32)) SeekEntryResult!6334)

(assert (=> b!612694 (= lt!280554 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612695 () Bool)

(declare-fun Unit!19662 () Unit!19657)

(assert (=> b!612695 (= e!351195 Unit!19662)))

(assert (=> b!612695 false))

(declare-fun b!612696 () Bool)

(declare-fun e!351191 () Bool)

(declare-fun e!351193 () Bool)

(assert (=> b!612696 (= e!351191 e!351193)))

(declare-fun res!394137 () Bool)

(assert (=> b!612696 (=> res!394137 e!351193)))

(assert (=> b!612696 (= res!394137 (or (not (= (select (arr!17938 a!2986) j!136) lt!280557)) (not (= (select (arr!17938 a!2986) j!136) lt!280553))))))

(assert (=> b!612696 e!351185))

(declare-fun res!394146 () Bool)

(assert (=> b!612696 (=> (not res!394146) (not e!351185))))

(assert (=> b!612696 (= res!394146 (= lt!280553 (select (arr!17938 a!2986) j!136)))))

(assert (=> b!612696 (= lt!280553 (select (store (arr!17938 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612697 () Bool)

(assert (=> b!612697 (= e!351184 e!351189)))

(declare-fun res!394150 () Bool)

(assert (=> b!612697 (=> (not res!394150) (not e!351189))))

(assert (=> b!612697 (= res!394150 (= (select (store (arr!17938 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612697 (= lt!280543 (array!37390 (store (arr!17938 a!2986) i!1108 k0!1786) (size!18302 a!2986)))))

(declare-fun b!612698 () Bool)

(assert (=> b!612698 (= e!351188 (not e!351191))))

(declare-fun res!394139 () Bool)

(assert (=> b!612698 (=> res!394139 e!351191)))

(declare-fun lt!280550 () SeekEntryResult!6334)

(assert (=> b!612698 (= res!394139 (not (= lt!280550 (Found!6334 index!984))))))

(declare-fun lt!280551 () Unit!19657)

(assert (=> b!612698 (= lt!280551 e!351195)))

(declare-fun c!69641 () Bool)

(assert (=> b!612698 (= c!69641 (= lt!280550 Undefined!6334))))

(assert (=> b!612698 (= lt!280550 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280557 lt!280543 mask!3053))))

(assert (=> b!612698 e!351197))

(declare-fun res!394144 () Bool)

(assert (=> b!612698 (=> (not res!394144) (not e!351197))))

(declare-fun lt!280549 () (_ BitVec 32))

(assert (=> b!612698 (= res!394144 (= lt!280558 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280549 vacantSpotIndex!68 lt!280557 lt!280543 mask!3053)))))

(assert (=> b!612698 (= lt!280558 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280549 vacantSpotIndex!68 (select (arr!17938 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612698 (= lt!280557 (select (store (arr!17938 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280545 () Unit!19657)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19657)

(assert (=> b!612698 (= lt!280545 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280549 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612698 (= lt!280549 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!612699 () Bool)

(declare-fun e!351187 () Bool)

(assert (=> b!612699 (= e!351193 e!351187)))

(declare-fun res!394143 () Bool)

(assert (=> b!612699 (=> res!394143 e!351187)))

(assert (=> b!612699 (= res!394143 (bvsge index!984 j!136))))

(declare-fun lt!280555 () Unit!19657)

(assert (=> b!612699 (= lt!280555 e!351196)))

(declare-fun c!69640 () Bool)

(assert (=> b!612699 (= c!69640 (bvslt j!136 index!984))))

(declare-fun b!612700 () Bool)

(assert (=> b!612700 (= e!351187 true)))

(assert (=> b!612700 (arrayNoDuplicates!0 lt!280543 #b00000000000000000000000000000000 Nil!11883)))

(declare-fun lt!280544 () Unit!19657)

(assert (=> b!612700 (= lt!280544 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11883))))

(assert (=> b!612700 (arrayContainsKey!0 lt!280543 (select (arr!17938 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280542 () Unit!19657)

(assert (=> b!612700 (= lt!280542 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280543 (select (arr!17938 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!612700 e!351198))

(declare-fun res!394140 () Bool)

(assert (=> b!612700 (=> (not res!394140) (not e!351198))))

(assert (=> b!612700 (= res!394140 (arrayContainsKey!0 lt!280543 (select (arr!17938 a!2986) j!136) j!136))))

(assert (= (and start!55974 res!394152) b!612688))

(assert (= (and b!612688 res!394145) b!612685))

(assert (= (and b!612685 res!394136) b!612687))

(assert (= (and b!612687 res!394149) b!612691))

(assert (= (and b!612691 res!394138) b!612694))

(assert (= (and b!612694 res!394135) b!612692))

(assert (= (and b!612692 res!394153) b!612693))

(assert (= (and b!612693 res!394147) b!612690))

(assert (= (and b!612690 res!394141) b!612697))

(assert (= (and b!612697 res!394150) b!612683))

(assert (= (and b!612683 res!394142) b!612698))

(assert (= (and b!612698 res!394144) b!612684))

(assert (= (and b!612698 c!69641) b!612695))

(assert (= (and b!612698 (not c!69641)) b!612678))

(assert (= (and b!612698 (not res!394139)) b!612696))

(assert (= (and b!612696 res!394146) b!612681))

(assert (= (and b!612681 (not res!394148)) b!612679))

(assert (= (and b!612679 res!394151) b!612680))

(assert (= (and b!612696 (not res!394137)) b!612699))

(assert (= (and b!612699 c!69640) b!612686))

(assert (= (and b!612699 (not c!69640)) b!612689))

(assert (= (and b!612699 (not res!394143)) b!612700))

(assert (= (and b!612700 res!394140) b!612682))

(declare-fun m!589301 () Bool)

(assert (=> b!612700 m!589301))

(declare-fun m!589303 () Bool)

(assert (=> b!612700 m!589303))

(assert (=> b!612700 m!589301))

(assert (=> b!612700 m!589301))

(declare-fun m!589305 () Bool)

(assert (=> b!612700 m!589305))

(declare-fun m!589307 () Bool)

(assert (=> b!612700 m!589307))

(declare-fun m!589309 () Bool)

(assert (=> b!612700 m!589309))

(assert (=> b!612700 m!589301))

(declare-fun m!589311 () Bool)

(assert (=> b!612700 m!589311))

(declare-fun m!589313 () Bool)

(assert (=> b!612690 m!589313))

(declare-fun m!589315 () Bool)

(assert (=> b!612693 m!589315))

(declare-fun m!589317 () Bool)

(assert (=> b!612697 m!589317))

(declare-fun m!589319 () Bool)

(assert (=> b!612697 m!589319))

(declare-fun m!589321 () Bool)

(assert (=> b!612683 m!589321))

(assert (=> b!612683 m!589301))

(assert (=> b!612683 m!589301))

(declare-fun m!589323 () Bool)

(assert (=> b!612683 m!589323))

(assert (=> b!612686 m!589301))

(declare-fun m!589325 () Bool)

(assert (=> b!612686 m!589325))

(declare-fun m!589327 () Bool)

(assert (=> b!612686 m!589327))

(assert (=> b!612686 m!589301))

(assert (=> b!612686 m!589301))

(declare-fun m!589329 () Bool)

(assert (=> b!612686 m!589329))

(assert (=> b!612686 m!589307))

(declare-fun m!589331 () Bool)

(assert (=> b!612686 m!589331))

(assert (=> b!612686 m!589309))

(assert (=> b!612686 m!589301))

(declare-fun m!589333 () Bool)

(assert (=> b!612686 m!589333))

(declare-fun m!589335 () Bool)

(assert (=> b!612698 m!589335))

(assert (=> b!612698 m!589301))

(assert (=> b!612698 m!589317))

(declare-fun m!589337 () Bool)

(assert (=> b!612698 m!589337))

(declare-fun m!589339 () Bool)

(assert (=> b!612698 m!589339))

(assert (=> b!612698 m!589301))

(declare-fun m!589341 () Bool)

(assert (=> b!612698 m!589341))

(declare-fun m!589343 () Bool)

(assert (=> b!612698 m!589343))

(declare-fun m!589345 () Bool)

(assert (=> b!612698 m!589345))

(assert (=> b!612696 m!589301))

(assert (=> b!612696 m!589317))

(declare-fun m!589347 () Bool)

(assert (=> b!612696 m!589347))

(declare-fun m!589349 () Bool)

(assert (=> start!55974 m!589349))

(declare-fun m!589351 () Bool)

(assert (=> start!55974 m!589351))

(assert (=> b!612682 m!589301))

(assert (=> b!612682 m!589301))

(declare-fun m!589353 () Bool)

(assert (=> b!612682 m!589353))

(assert (=> b!612679 m!589301))

(assert (=> b!612679 m!589301))

(assert (=> b!612679 m!589305))

(declare-fun m!589355 () Bool)

(assert (=> b!612692 m!589355))

(assert (=> b!612680 m!589301))

(assert (=> b!612680 m!589301))

(assert (=> b!612680 m!589353))

(assert (=> b!612685 m!589301))

(assert (=> b!612685 m!589301))

(declare-fun m!589357 () Bool)

(assert (=> b!612685 m!589357))

(assert (=> b!612681 m!589301))

(declare-fun m!589359 () Bool)

(assert (=> b!612687 m!589359))

(declare-fun m!589361 () Bool)

(assert (=> b!612694 m!589361))

(declare-fun m!589363 () Bool)

(assert (=> b!612691 m!589363))

(check-sat (not b!612679) (not b!612682) (not b!612698) (not b!612693) (not b!612687) (not b!612680) (not b!612694) (not b!612700) (not b!612691) (not b!612683) (not b!612692) (not b!612686) (not b!612685) (not start!55974))
(check-sat)
