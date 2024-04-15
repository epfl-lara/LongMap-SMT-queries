; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59594 () Bool)

(assert start!59594)

(declare-fun b!658795 () Bool)

(declare-fun res!427302 () Bool)

(declare-fun e!378454 () Bool)

(assert (=> b!658795 (=> (not res!427302) (not e!378454))))

(declare-datatypes ((array!38763 0))(
  ( (array!38764 (arr!18578 (Array (_ BitVec 32) (_ BitVec 64))) (size!18943 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38763)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658795 (= res!427302 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658796 () Bool)

(declare-fun res!427303 () Bool)

(assert (=> b!658796 (=> (not res!427303) (not e!378454))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658796 (= res!427303 (validKeyInArray!0 (select (arr!18578 a!2986) j!136)))))

(declare-fun b!658797 () Bool)

(declare-datatypes ((Unit!22922 0))(
  ( (Unit!22923) )
))
(declare-fun e!378457 () Unit!22922)

(declare-fun Unit!22924 () Unit!22922)

(assert (=> b!658797 (= e!378457 Unit!22924)))

(declare-fun b!658798 () Bool)

(declare-fun Unit!22925 () Unit!22922)

(assert (=> b!658798 (= e!378457 Unit!22925)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!427294 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658798 (= res!427294 (= (select (store (arr!18578 a!2986) i!1108 k0!1786) index!984) (select (arr!18578 a!2986) j!136)))))

(declare-fun e!378458 () Bool)

(assert (=> b!658798 (=> (not res!427294) (not e!378458))))

(assert (=> b!658798 e!378458))

(declare-fun c!76122 () Bool)

(assert (=> b!658798 (= c!76122 (bvslt j!136 index!984))))

(declare-fun lt!308164 () Unit!22922)

(declare-fun e!378449 () Unit!22922)

(assert (=> b!658798 (= lt!308164 e!378449)))

(declare-fun c!76120 () Bool)

(assert (=> b!658798 (= c!76120 (bvslt index!984 j!136))))

(declare-fun lt!308168 () Unit!22922)

(declare-fun e!378450 () Unit!22922)

(assert (=> b!658798 (= lt!308168 e!378450)))

(assert (=> b!658798 false))

(declare-fun b!658799 () Bool)

(declare-fun res!427304 () Bool)

(assert (=> b!658799 (=> (not res!427304) (not e!378454))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!658799 (= res!427304 (and (= (size!18943 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18943 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18943 a!2986)) (not (= i!1108 j!136))))))

(declare-datatypes ((SeekEntryResult!7015 0))(
  ( (MissingZero!7015 (index!30425 (_ BitVec 32))) (Found!7015 (index!30426 (_ BitVec 32))) (Intermediate!7015 (undefined!7827 Bool) (index!30427 (_ BitVec 32)) (x!59221 (_ BitVec 32))) (Undefined!7015) (MissingVacant!7015 (index!30428 (_ BitVec 32))) )
))
(declare-fun lt!308161 () SeekEntryResult!7015)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun b!658800 () Bool)

(declare-fun lt!308169 () SeekEntryResult!7015)

(declare-fun e!378455 () Bool)

(assert (=> b!658800 (= e!378455 (not (or (= lt!308161 (MissingVacant!7015 vacantSpotIndex!68)) (= lt!308169 lt!308161))))))

(declare-fun lt!308162 () Unit!22922)

(assert (=> b!658800 (= lt!308162 e!378457)))

(declare-fun c!76121 () Bool)

(assert (=> b!658800 (= c!76121 (= lt!308161 (Found!7015 index!984)))))

(declare-fun lt!308172 () Unit!22922)

(declare-fun e!378446 () Unit!22922)

(assert (=> b!658800 (= lt!308172 e!378446)))

(declare-fun c!76119 () Bool)

(assert (=> b!658800 (= c!76119 (= lt!308161 Undefined!7015))))

(declare-fun lt!308157 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!308160 () array!38763)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38763 (_ BitVec 32)) SeekEntryResult!7015)

(assert (=> b!658800 (= lt!308161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308157 lt!308160 mask!3053))))

(declare-fun e!378456 () Bool)

(assert (=> b!658800 e!378456))

(declare-fun res!427295 () Bool)

(assert (=> b!658800 (=> (not res!427295) (not e!378456))))

(declare-fun lt!308155 () SeekEntryResult!7015)

(declare-fun lt!308171 () (_ BitVec 32))

(assert (=> b!658800 (= res!427295 (= lt!308155 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 lt!308157 lt!308160 mask!3053)))))

(assert (=> b!658800 (= lt!308155 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658800 (= lt!308157 (select (store (arr!18578 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308156 () Unit!22922)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22922)

(assert (=> b!658800 (= lt!308156 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658800 (= lt!308171 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658801 () Bool)

(assert (=> b!658801 false))

(declare-fun lt!308166 () Unit!22922)

(declare-datatypes ((List!12658 0))(
  ( (Nil!12655) (Cons!12654 (h!13699 (_ BitVec 64)) (t!18877 List!12658)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38763 (_ BitVec 64) (_ BitVec 32) List!12658) Unit!22922)

(assert (=> b!658801 (= lt!308166 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136 Nil!12655))))

(declare-fun arrayNoDuplicates!0 (array!38763 (_ BitVec 32) List!12658) Bool)

(assert (=> b!658801 (arrayNoDuplicates!0 lt!308160 j!136 Nil!12655)))

(declare-fun lt!308165 () Unit!22922)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38763 (_ BitVec 32) (_ BitVec 32)) Unit!22922)

(assert (=> b!658801 (= lt!308165 (lemmaNoDuplicateFromThenFromBigger!0 lt!308160 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658801 (arrayNoDuplicates!0 lt!308160 #b00000000000000000000000000000000 Nil!12655)))

(declare-fun lt!308158 () Unit!22922)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12658) Unit!22922)

(assert (=> b!658801 (= lt!308158 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12655))))

(assert (=> b!658801 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308170 () Unit!22922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22922)

(assert (=> b!658801 (= lt!308170 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22926 () Unit!22922)

(assert (=> b!658801 (= e!378449 Unit!22926)))

(declare-fun e!378445 () Bool)

(declare-fun b!658802 () Bool)

(assert (=> b!658802 (= e!378445 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984))))

(declare-fun b!658804 () Bool)

(declare-fun e!378451 () Bool)

(declare-fun e!378447 () Bool)

(assert (=> b!658804 (= e!378451 e!378447)))

(declare-fun res!427291 () Bool)

(assert (=> b!658804 (=> (not res!427291) (not e!378447))))

(assert (=> b!658804 (= res!427291 (= (select (store (arr!18578 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658804 (= lt!308160 (array!38764 (store (arr!18578 a!2986) i!1108 k0!1786) (size!18943 a!2986)))))

(declare-fun b!658805 () Bool)

(declare-fun res!427306 () Bool)

(assert (=> b!658805 (= res!427306 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136))))

(assert (=> b!658805 (=> (not res!427306) (not e!378445))))

(declare-fun e!378452 () Bool)

(assert (=> b!658805 (= e!378452 e!378445)))

(declare-fun b!658806 () Bool)

(assert (=> b!658806 (= e!378447 e!378455)))

(declare-fun res!427301 () Bool)

(assert (=> b!658806 (=> (not res!427301) (not e!378455))))

(assert (=> b!658806 (= res!427301 (and (= lt!308169 (Found!7015 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18578 a!2986) index!984) (select (arr!18578 a!2986) j!136))) (not (= (select (arr!18578 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658806 (= lt!308169 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658807 () Bool)

(declare-fun Unit!22927 () Unit!22922)

(assert (=> b!658807 (= e!378449 Unit!22927)))

(declare-fun b!658808 () Bool)

(declare-fun Unit!22928 () Unit!22922)

(assert (=> b!658808 (= e!378446 Unit!22928)))

(declare-fun b!658809 () Bool)

(declare-fun res!427296 () Bool)

(assert (=> b!658809 (=> (not res!427296) (not e!378451))))

(assert (=> b!658809 (= res!427296 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12655))))

(declare-fun b!658810 () Bool)

(declare-fun res!427297 () Bool)

(assert (=> b!658810 (=> (not res!427297) (not e!378451))))

(assert (=> b!658810 (= res!427297 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18578 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658811 () Bool)

(assert (=> b!658811 (= e!378454 e!378451)))

(declare-fun res!427305 () Bool)

(assert (=> b!658811 (=> (not res!427305) (not e!378451))))

(declare-fun lt!308167 () SeekEntryResult!7015)

(assert (=> b!658811 (= res!427305 (or (= lt!308167 (MissingZero!7015 i!1108)) (= lt!308167 (MissingVacant!7015 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38763 (_ BitVec 32)) SeekEntryResult!7015)

(assert (=> b!658811 (= lt!308167 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658812 () Bool)

(declare-fun res!427293 () Bool)

(assert (=> b!658812 (=> (not res!427293) (not e!378451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38763 (_ BitVec 32)) Bool)

(assert (=> b!658812 (= res!427293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658813 () Bool)

(assert (=> b!658813 false))

(declare-fun lt!308159 () Unit!22922)

(assert (=> b!658813 (= lt!308159 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984 Nil!12655))))

(assert (=> b!658813 (arrayNoDuplicates!0 lt!308160 index!984 Nil!12655)))

(declare-fun lt!308154 () Unit!22922)

(assert (=> b!658813 (= lt!308154 (lemmaNoDuplicateFromThenFromBigger!0 lt!308160 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658813 (arrayNoDuplicates!0 lt!308160 #b00000000000000000000000000000000 Nil!12655)))

(declare-fun lt!308153 () Unit!22922)

(assert (=> b!658813 (= lt!308153 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12655))))

(assert (=> b!658813 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308163 () Unit!22922)

(assert (=> b!658813 (= lt!308163 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378448 () Bool)

(assert (=> b!658813 e!378448))

(declare-fun res!427300 () Bool)

(assert (=> b!658813 (=> (not res!427300) (not e!378448))))

(assert (=> b!658813 (= res!427300 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136))))

(declare-fun Unit!22929 () Unit!22922)

(assert (=> b!658813 (= e!378450 Unit!22929)))

(declare-fun b!658814 () Bool)

(assert (=> b!658814 (= e!378456 (= lt!308169 lt!308155))))

(declare-fun b!658815 () Bool)

(declare-fun res!427298 () Bool)

(assert (=> b!658815 (=> (not res!427298) (not e!378454))))

(assert (=> b!658815 (= res!427298 (validKeyInArray!0 k0!1786))))

(declare-fun b!658816 () Bool)

(declare-fun Unit!22930 () Unit!22922)

(assert (=> b!658816 (= e!378446 Unit!22930)))

(assert (=> b!658816 false))

(declare-fun b!658817 () Bool)

(declare-fun Unit!22931 () Unit!22922)

(assert (=> b!658817 (= e!378450 Unit!22931)))

(declare-fun b!658818 () Bool)

(assert (=> b!658818 (= e!378448 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984))))

(declare-fun b!658803 () Bool)

(declare-fun res!427292 () Bool)

(assert (=> b!658803 (= res!427292 (bvsge j!136 index!984))))

(assert (=> b!658803 (=> res!427292 e!378452)))

(assert (=> b!658803 (= e!378458 e!378452)))

(declare-fun res!427299 () Bool)

(assert (=> start!59594 (=> (not res!427299) (not e!378454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59594 (= res!427299 (validMask!0 mask!3053))))

(assert (=> start!59594 e!378454))

(assert (=> start!59594 true))

(declare-fun array_inv!14461 (array!38763) Bool)

(assert (=> start!59594 (array_inv!14461 a!2986)))

(assert (= (and start!59594 res!427299) b!658799))

(assert (= (and b!658799 res!427304) b!658796))

(assert (= (and b!658796 res!427303) b!658815))

(assert (= (and b!658815 res!427298) b!658795))

(assert (= (and b!658795 res!427302) b!658811))

(assert (= (and b!658811 res!427305) b!658812))

(assert (= (and b!658812 res!427293) b!658809))

(assert (= (and b!658809 res!427296) b!658810))

(assert (= (and b!658810 res!427297) b!658804))

(assert (= (and b!658804 res!427291) b!658806))

(assert (= (and b!658806 res!427301) b!658800))

(assert (= (and b!658800 res!427295) b!658814))

(assert (= (and b!658800 c!76119) b!658816))

(assert (= (and b!658800 (not c!76119)) b!658808))

(assert (= (and b!658800 c!76121) b!658798))

(assert (= (and b!658800 (not c!76121)) b!658797))

(assert (= (and b!658798 res!427294) b!658803))

(assert (= (and b!658803 (not res!427292)) b!658805))

(assert (= (and b!658805 res!427306) b!658802))

(assert (= (and b!658798 c!76122) b!658801))

(assert (= (and b!658798 (not c!76122)) b!658807))

(assert (= (and b!658798 c!76120) b!658813))

(assert (= (and b!658798 (not c!76120)) b!658817))

(assert (= (and b!658813 res!427300) b!658818))

(declare-fun m!631275 () Bool)

(assert (=> b!658800 m!631275))

(declare-fun m!631277 () Bool)

(assert (=> b!658800 m!631277))

(declare-fun m!631279 () Bool)

(assert (=> b!658800 m!631279))

(assert (=> b!658800 m!631275))

(declare-fun m!631281 () Bool)

(assert (=> b!658800 m!631281))

(declare-fun m!631283 () Bool)

(assert (=> b!658800 m!631283))

(declare-fun m!631285 () Bool)

(assert (=> b!658800 m!631285))

(declare-fun m!631287 () Bool)

(assert (=> b!658800 m!631287))

(declare-fun m!631289 () Bool)

(assert (=> b!658800 m!631289))

(declare-fun m!631291 () Bool)

(assert (=> b!658811 m!631291))

(assert (=> b!658796 m!631275))

(assert (=> b!658796 m!631275))

(declare-fun m!631293 () Bool)

(assert (=> b!658796 m!631293))

(assert (=> b!658801 m!631275))

(declare-fun m!631295 () Bool)

(assert (=> b!658801 m!631295))

(declare-fun m!631297 () Bool)

(assert (=> b!658801 m!631297))

(assert (=> b!658801 m!631275))

(declare-fun m!631299 () Bool)

(assert (=> b!658801 m!631299))

(assert (=> b!658801 m!631275))

(declare-fun m!631301 () Bool)

(assert (=> b!658801 m!631301))

(declare-fun m!631303 () Bool)

(assert (=> b!658801 m!631303))

(declare-fun m!631305 () Bool)

(assert (=> b!658801 m!631305))

(assert (=> b!658801 m!631275))

(declare-fun m!631307 () Bool)

(assert (=> b!658801 m!631307))

(declare-fun m!631309 () Bool)

(assert (=> start!59594 m!631309))

(declare-fun m!631311 () Bool)

(assert (=> start!59594 m!631311))

(assert (=> b!658805 m!631275))

(assert (=> b!658805 m!631275))

(declare-fun m!631313 () Bool)

(assert (=> b!658805 m!631313))

(assert (=> b!658798 m!631277))

(declare-fun m!631315 () Bool)

(assert (=> b!658798 m!631315))

(assert (=> b!658798 m!631275))

(declare-fun m!631317 () Bool)

(assert (=> b!658812 m!631317))

(declare-fun m!631319 () Bool)

(assert (=> b!658806 m!631319))

(assert (=> b!658806 m!631275))

(assert (=> b!658806 m!631275))

(declare-fun m!631321 () Bool)

(assert (=> b!658806 m!631321))

(declare-fun m!631323 () Bool)

(assert (=> b!658795 m!631323))

(assert (=> b!658804 m!631277))

(declare-fun m!631325 () Bool)

(assert (=> b!658804 m!631325))

(assert (=> b!658818 m!631275))

(assert (=> b!658818 m!631275))

(declare-fun m!631327 () Bool)

(assert (=> b!658818 m!631327))

(declare-fun m!631329 () Bool)

(assert (=> b!658810 m!631329))

(declare-fun m!631331 () Bool)

(assert (=> b!658809 m!631331))

(assert (=> b!658813 m!631275))

(assert (=> b!658813 m!631297))

(declare-fun m!631333 () Bool)

(assert (=> b!658813 m!631333))

(assert (=> b!658813 m!631275))

(declare-fun m!631335 () Bool)

(assert (=> b!658813 m!631335))

(assert (=> b!658813 m!631305))

(declare-fun m!631337 () Bool)

(assert (=> b!658813 m!631337))

(assert (=> b!658813 m!631275))

(assert (=> b!658813 m!631313))

(assert (=> b!658813 m!631275))

(declare-fun m!631339 () Bool)

(assert (=> b!658813 m!631339))

(assert (=> b!658813 m!631275))

(declare-fun m!631341 () Bool)

(assert (=> b!658813 m!631341))

(assert (=> b!658802 m!631275))

(assert (=> b!658802 m!631275))

(assert (=> b!658802 m!631327))

(declare-fun m!631343 () Bool)

(assert (=> b!658815 m!631343))

(check-sat (not b!658796) (not b!658813) (not b!658809) (not b!658795) (not b!658815) (not b!658806) (not b!658805) (not start!59594) (not b!658812) (not b!658802) (not b!658801) (not b!658818) (not b!658811) (not b!658800))
(check-sat)
(get-model)

(declare-fun d!92735 () Bool)

(assert (=> d!92735 (= (validKeyInArray!0 (select (arr!18578 a!2986) j!136)) (and (not (= (select (arr!18578 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18578 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!658796 d!92735))

(declare-fun d!92737 () Bool)

(declare-fun res!427407 () Bool)

(declare-fun e!378547 () Bool)

(assert (=> d!92737 (=> res!427407 e!378547)))

(assert (=> d!92737 (= res!427407 (= (select (arr!18578 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92737 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!378547)))

(declare-fun b!658967 () Bool)

(declare-fun e!378548 () Bool)

(assert (=> b!658967 (= e!378547 e!378548)))

(declare-fun res!427408 () Bool)

(assert (=> b!658967 (=> (not res!427408) (not e!378548))))

(assert (=> b!658967 (= res!427408 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18943 a!2986)))))

(declare-fun b!658968 () Bool)

(assert (=> b!658968 (= e!378548 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92737 (not res!427407)) b!658967))

(assert (= (and b!658967 res!427408) b!658968))

(declare-fun m!631485 () Bool)

(assert (=> d!92737 m!631485))

(declare-fun m!631487 () Bool)

(assert (=> b!658968 m!631487))

(assert (=> b!658795 d!92737))

(declare-fun b!658981 () Bool)

(declare-fun e!378557 () SeekEntryResult!7015)

(assert (=> b!658981 (= e!378557 (MissingVacant!7015 vacantSpotIndex!68))))

(declare-fun b!658982 () Bool)

(declare-fun e!378555 () SeekEntryResult!7015)

(declare-fun e!378556 () SeekEntryResult!7015)

(assert (=> b!658982 (= e!378555 e!378556)))

(declare-fun lt!308298 () (_ BitVec 64))

(declare-fun c!76155 () Bool)

(assert (=> b!658982 (= c!76155 (= lt!308298 (select (arr!18578 a!2986) j!136)))))

(declare-fun b!658983 () Bool)

(assert (=> b!658983 (= e!378557 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658984 () Bool)

(declare-fun c!76153 () Bool)

(assert (=> b!658984 (= c!76153 (= lt!308298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658984 (= e!378556 e!378557)))

(declare-fun b!658985 () Bool)

(assert (=> b!658985 (= e!378555 Undefined!7015)))

(declare-fun b!658986 () Bool)

(assert (=> b!658986 (= e!378556 (Found!7015 index!984))))

(declare-fun lt!308297 () SeekEntryResult!7015)

(declare-fun d!92739 () Bool)

(get-info :version)

(assert (=> d!92739 (and (or ((_ is Undefined!7015) lt!308297) (not ((_ is Found!7015) lt!308297)) (and (bvsge (index!30426 lt!308297) #b00000000000000000000000000000000) (bvslt (index!30426 lt!308297) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308297) ((_ is Found!7015) lt!308297) (not ((_ is MissingVacant!7015) lt!308297)) (not (= (index!30428 lt!308297) vacantSpotIndex!68)) (and (bvsge (index!30428 lt!308297) #b00000000000000000000000000000000) (bvslt (index!30428 lt!308297) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308297) (ite ((_ is Found!7015) lt!308297) (= (select (arr!18578 a!2986) (index!30426 lt!308297)) (select (arr!18578 a!2986) j!136)) (and ((_ is MissingVacant!7015) lt!308297) (= (index!30428 lt!308297) vacantSpotIndex!68) (= (select (arr!18578 a!2986) (index!30428 lt!308297)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92739 (= lt!308297 e!378555)))

(declare-fun c!76154 () Bool)

(assert (=> d!92739 (= c!76154 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92739 (= lt!308298 (select (arr!18578 a!2986) index!984))))

(assert (=> d!92739 (validMask!0 mask!3053)))

(assert (=> d!92739 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053) lt!308297)))

(assert (= (and d!92739 c!76154) b!658985))

(assert (= (and d!92739 (not c!76154)) b!658982))

(assert (= (and b!658982 c!76155) b!658986))

(assert (= (and b!658982 (not c!76155)) b!658984))

(assert (= (and b!658984 c!76153) b!658981))

(assert (= (and b!658984 (not c!76153)) b!658983))

(assert (=> b!658983 m!631285))

(assert (=> b!658983 m!631285))

(assert (=> b!658983 m!631275))

(declare-fun m!631489 () Bool)

(assert (=> b!658983 m!631489))

(declare-fun m!631491 () Bool)

(assert (=> d!92739 m!631491))

(declare-fun m!631493 () Bool)

(assert (=> d!92739 m!631493))

(assert (=> d!92739 m!631319))

(assert (=> d!92739 m!631309))

(assert (=> b!658806 d!92739))

(declare-fun d!92741 () Bool)

(declare-fun res!427409 () Bool)

(declare-fun e!378558 () Bool)

(assert (=> d!92741 (=> res!427409 e!378558)))

(assert (=> d!92741 (= res!427409 (= (select (arr!18578 lt!308160) j!136) (select (arr!18578 a!2986) j!136)))))

(assert (=> d!92741 (= (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136) e!378558)))

(declare-fun b!658987 () Bool)

(declare-fun e!378559 () Bool)

(assert (=> b!658987 (= e!378558 e!378559)))

(declare-fun res!427410 () Bool)

(assert (=> b!658987 (=> (not res!427410) (not e!378559))))

(assert (=> b!658987 (= res!427410 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18943 lt!308160)))))

(declare-fun b!658988 () Bool)

(assert (=> b!658988 (= e!378559 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92741 (not res!427409)) b!658987))

(assert (= (and b!658987 res!427410) b!658988))

(declare-fun m!631495 () Bool)

(assert (=> d!92741 m!631495))

(assert (=> b!658988 m!631275))

(declare-fun m!631497 () Bool)

(assert (=> b!658988 m!631497))

(assert (=> b!658805 d!92741))

(declare-fun d!92743 () Bool)

(assert (=> d!92743 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!658815 d!92743))

(declare-fun d!92745 () Bool)

(assert (=> d!92745 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308301 () Unit!22922)

(declare-fun choose!114 (array!38763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22922)

(assert (=> d!92745 (= lt!308301 (choose!114 lt!308160 (select (arr!18578 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92745 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92745 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!308301)))

(declare-fun bs!19569 () Bool)

(assert (= bs!19569 d!92745))

(assert (=> bs!19569 m!631275))

(assert (=> bs!19569 m!631341))

(assert (=> bs!19569 m!631275))

(declare-fun m!631499 () Bool)

(assert (=> bs!19569 m!631499))

(assert (=> b!658813 d!92745))

(declare-fun d!92747 () Bool)

(declare-fun res!427411 () Bool)

(declare-fun e!378560 () Bool)

(assert (=> d!92747 (=> res!427411 e!378560)))

(assert (=> d!92747 (= res!427411 (= (select (arr!18578 lt!308160) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18578 a!2986) j!136)))))

(assert (=> d!92747 (= (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!378560)))

(declare-fun b!658989 () Bool)

(declare-fun e!378561 () Bool)

(assert (=> b!658989 (= e!378560 e!378561)))

(declare-fun res!427412 () Bool)

(assert (=> b!658989 (=> (not res!427412) (not e!378561))))

(assert (=> b!658989 (= res!427412 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18943 lt!308160)))))

(declare-fun b!658990 () Bool)

(assert (=> b!658990 (= e!378561 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92747 (not res!427411)) b!658989))

(assert (= (and b!658989 res!427412) b!658990))

(declare-fun m!631501 () Bool)

(assert (=> d!92747 m!631501))

(assert (=> b!658990 m!631275))

(declare-fun m!631503 () Bool)

(assert (=> b!658990 m!631503))

(assert (=> b!658813 d!92747))

(declare-fun bm!33859 () Bool)

(declare-fun call!33862 () Bool)

(declare-fun c!76158 () Bool)

(assert (=> bm!33859 (= call!33862 (arrayNoDuplicates!0 lt!308160 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76158 (Cons!12654 (select (arr!18578 lt!308160) #b00000000000000000000000000000000) Nil!12655) Nil!12655)))))

(declare-fun b!659001 () Bool)

(declare-fun e!378573 () Bool)

(assert (=> b!659001 (= e!378573 call!33862)))

(declare-fun b!659002 () Bool)

(declare-fun e!378572 () Bool)

(assert (=> b!659002 (= e!378572 e!378573)))

(assert (=> b!659002 (= c!76158 (validKeyInArray!0 (select (arr!18578 lt!308160) #b00000000000000000000000000000000)))))

(declare-fun b!659003 () Bool)

(declare-fun e!378570 () Bool)

(declare-fun contains!3180 (List!12658 (_ BitVec 64)) Bool)

(assert (=> b!659003 (= e!378570 (contains!3180 Nil!12655 (select (arr!18578 lt!308160) #b00000000000000000000000000000000)))))

(declare-fun d!92749 () Bool)

(declare-fun res!427419 () Bool)

(declare-fun e!378571 () Bool)

(assert (=> d!92749 (=> res!427419 e!378571)))

(assert (=> d!92749 (= res!427419 (bvsge #b00000000000000000000000000000000 (size!18943 lt!308160)))))

(assert (=> d!92749 (= (arrayNoDuplicates!0 lt!308160 #b00000000000000000000000000000000 Nil!12655) e!378571)))

(declare-fun b!659004 () Bool)

(assert (=> b!659004 (= e!378571 e!378572)))

(declare-fun res!427420 () Bool)

(assert (=> b!659004 (=> (not res!427420) (not e!378572))))

(assert (=> b!659004 (= res!427420 (not e!378570))))

(declare-fun res!427421 () Bool)

(assert (=> b!659004 (=> (not res!427421) (not e!378570))))

(assert (=> b!659004 (= res!427421 (validKeyInArray!0 (select (arr!18578 lt!308160) #b00000000000000000000000000000000)))))

(declare-fun b!659005 () Bool)

(assert (=> b!659005 (= e!378573 call!33862)))

(assert (= (and d!92749 (not res!427419)) b!659004))

(assert (= (and b!659004 res!427421) b!659003))

(assert (= (and b!659004 res!427420) b!659002))

(assert (= (and b!659002 c!76158) b!659005))

(assert (= (and b!659002 (not c!76158)) b!659001))

(assert (= (or b!659005 b!659001) bm!33859))

(declare-fun m!631505 () Bool)

(assert (=> bm!33859 m!631505))

(declare-fun m!631507 () Bool)

(assert (=> bm!33859 m!631507))

(assert (=> b!659002 m!631505))

(assert (=> b!659002 m!631505))

(declare-fun m!631509 () Bool)

(assert (=> b!659002 m!631509))

(assert (=> b!659003 m!631505))

(assert (=> b!659003 m!631505))

(declare-fun m!631511 () Bool)

(assert (=> b!659003 m!631511))

(assert (=> b!659004 m!631505))

(assert (=> b!659004 m!631505))

(assert (=> b!659004 m!631509))

(assert (=> b!658813 d!92749))

(assert (=> b!658813 d!92741))

(declare-fun call!33863 () Bool)

(declare-fun bm!33860 () Bool)

(declare-fun c!76159 () Bool)

(assert (=> bm!33860 (= call!33863 (arrayNoDuplicates!0 lt!308160 (bvadd index!984 #b00000000000000000000000000000001) (ite c!76159 (Cons!12654 (select (arr!18578 lt!308160) index!984) Nil!12655) Nil!12655)))))

(declare-fun b!659006 () Bool)

(declare-fun e!378577 () Bool)

(assert (=> b!659006 (= e!378577 call!33863)))

(declare-fun b!659007 () Bool)

(declare-fun e!378576 () Bool)

(assert (=> b!659007 (= e!378576 e!378577)))

(assert (=> b!659007 (= c!76159 (validKeyInArray!0 (select (arr!18578 lt!308160) index!984)))))

(declare-fun b!659008 () Bool)

(declare-fun e!378574 () Bool)

(assert (=> b!659008 (= e!378574 (contains!3180 Nil!12655 (select (arr!18578 lt!308160) index!984)))))

(declare-fun d!92751 () Bool)

(declare-fun res!427422 () Bool)

(declare-fun e!378575 () Bool)

(assert (=> d!92751 (=> res!427422 e!378575)))

(assert (=> d!92751 (= res!427422 (bvsge index!984 (size!18943 lt!308160)))))

(assert (=> d!92751 (= (arrayNoDuplicates!0 lt!308160 index!984 Nil!12655) e!378575)))

(declare-fun b!659009 () Bool)

(assert (=> b!659009 (= e!378575 e!378576)))

(declare-fun res!427423 () Bool)

(assert (=> b!659009 (=> (not res!427423) (not e!378576))))

(assert (=> b!659009 (= res!427423 (not e!378574))))

(declare-fun res!427424 () Bool)

(assert (=> b!659009 (=> (not res!427424) (not e!378574))))

(assert (=> b!659009 (= res!427424 (validKeyInArray!0 (select (arr!18578 lt!308160) index!984)))))

(declare-fun b!659010 () Bool)

(assert (=> b!659010 (= e!378577 call!33863)))

(assert (= (and d!92751 (not res!427422)) b!659009))

(assert (= (and b!659009 res!427424) b!659008))

(assert (= (and b!659009 res!427423) b!659007))

(assert (= (and b!659007 c!76159) b!659010))

(assert (= (and b!659007 (not c!76159)) b!659006))

(assert (= (or b!659010 b!659006) bm!33860))

(declare-fun m!631513 () Bool)

(assert (=> bm!33860 m!631513))

(declare-fun m!631515 () Bool)

(assert (=> bm!33860 m!631515))

(assert (=> b!659007 m!631513))

(assert (=> b!659007 m!631513))

(declare-fun m!631517 () Bool)

(assert (=> b!659007 m!631517))

(assert (=> b!659008 m!631513))

(assert (=> b!659008 m!631513))

(declare-fun m!631519 () Bool)

(assert (=> b!659008 m!631519))

(assert (=> b!659009 m!631513))

(assert (=> b!659009 m!631513))

(assert (=> b!659009 m!631517))

(assert (=> b!658813 d!92751))

(declare-fun d!92753 () Bool)

(assert (=> d!92753 (arrayNoDuplicates!0 lt!308160 index!984 Nil!12655)))

(declare-fun lt!308304 () Unit!22922)

(declare-fun choose!39 (array!38763 (_ BitVec 32) (_ BitVec 32)) Unit!22922)

(assert (=> d!92753 (= lt!308304 (choose!39 lt!308160 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92753 (bvslt (size!18943 lt!308160) #b01111111111111111111111111111111)))

(assert (=> d!92753 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308160 #b00000000000000000000000000000000 index!984) lt!308304)))

(declare-fun bs!19570 () Bool)

(assert (= bs!19570 d!92753))

(assert (=> bs!19570 m!631337))

(declare-fun m!631521 () Bool)

(assert (=> bs!19570 m!631521))

(assert (=> b!658813 d!92753))

(declare-fun d!92755 () Bool)

(assert (=> d!92755 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18943 lt!308160)) (not (= (select (arr!18578 lt!308160) index!984) (select (arr!18578 a!2986) j!136))))))

(declare-fun lt!308307 () Unit!22922)

(declare-fun choose!21 (array!38763 (_ BitVec 64) (_ BitVec 32) List!12658) Unit!22922)

(assert (=> d!92755 (= lt!308307 (choose!21 lt!308160 (select (arr!18578 a!2986) j!136) index!984 Nil!12655))))

(assert (=> d!92755 (bvslt (size!18943 lt!308160) #b01111111111111111111111111111111)))

(assert (=> d!92755 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984 Nil!12655) lt!308307)))

(declare-fun bs!19571 () Bool)

(assert (= bs!19571 d!92755))

(assert (=> bs!19571 m!631513))

(assert (=> bs!19571 m!631275))

(declare-fun m!631523 () Bool)

(assert (=> bs!19571 m!631523))

(assert (=> b!658813 d!92755))

(declare-fun d!92757 () Bool)

(declare-fun e!378580 () Bool)

(assert (=> d!92757 e!378580))

(declare-fun res!427427 () Bool)

(assert (=> d!92757 (=> (not res!427427) (not e!378580))))

(assert (=> d!92757 (= res!427427 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18943 a!2986))))))

(declare-fun lt!308310 () Unit!22922)

(declare-fun choose!41 (array!38763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12658) Unit!22922)

(assert (=> d!92757 (= lt!308310 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12655))))

(assert (=> d!92757 (bvslt (size!18943 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92757 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12655) lt!308310)))

(declare-fun b!659013 () Bool)

(assert (=> b!659013 (= e!378580 (arrayNoDuplicates!0 (array!38764 (store (arr!18578 a!2986) i!1108 k0!1786) (size!18943 a!2986)) #b00000000000000000000000000000000 Nil!12655))))

(assert (= (and d!92757 res!427427) b!659013))

(declare-fun m!631525 () Bool)

(assert (=> d!92757 m!631525))

(assert (=> b!659013 m!631277))

(declare-fun m!631527 () Bool)

(assert (=> b!659013 m!631527))

(assert (=> b!658813 d!92757))

(declare-fun d!92759 () Bool)

(declare-fun res!427428 () Bool)

(declare-fun e!378581 () Bool)

(assert (=> d!92759 (=> res!427428 e!378581)))

(assert (=> d!92759 (= res!427428 (= (select (arr!18578 lt!308160) index!984) (select (arr!18578 a!2986) j!136)))))

(assert (=> d!92759 (= (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984) e!378581)))

(declare-fun b!659014 () Bool)

(declare-fun e!378582 () Bool)

(assert (=> b!659014 (= e!378581 e!378582)))

(declare-fun res!427429 () Bool)

(assert (=> b!659014 (=> (not res!427429) (not e!378582))))

(assert (=> b!659014 (= res!427429 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18943 lt!308160)))))

(declare-fun b!659015 () Bool)

(assert (=> b!659015 (= e!378582 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92759 (not res!427428)) b!659014))

(assert (= (and b!659014 res!427429) b!659015))

(assert (=> d!92759 m!631513))

(assert (=> b!659015 m!631275))

(declare-fun m!631529 () Bool)

(assert (=> b!659015 m!631529))

(assert (=> b!658802 d!92759))

(assert (=> b!658801 d!92749))

(declare-fun bm!33861 () Bool)

(declare-fun call!33864 () Bool)

(declare-fun c!76160 () Bool)

(assert (=> bm!33861 (= call!33864 (arrayNoDuplicates!0 lt!308160 (bvadd j!136 #b00000000000000000000000000000001) (ite c!76160 (Cons!12654 (select (arr!18578 lt!308160) j!136) Nil!12655) Nil!12655)))))

(declare-fun b!659016 () Bool)

(declare-fun e!378586 () Bool)

(assert (=> b!659016 (= e!378586 call!33864)))

(declare-fun b!659017 () Bool)

(declare-fun e!378585 () Bool)

(assert (=> b!659017 (= e!378585 e!378586)))

(assert (=> b!659017 (= c!76160 (validKeyInArray!0 (select (arr!18578 lt!308160) j!136)))))

(declare-fun b!659018 () Bool)

(declare-fun e!378583 () Bool)

(assert (=> b!659018 (= e!378583 (contains!3180 Nil!12655 (select (arr!18578 lt!308160) j!136)))))

(declare-fun d!92761 () Bool)

(declare-fun res!427430 () Bool)

(declare-fun e!378584 () Bool)

(assert (=> d!92761 (=> res!427430 e!378584)))

(assert (=> d!92761 (= res!427430 (bvsge j!136 (size!18943 lt!308160)))))

(assert (=> d!92761 (= (arrayNoDuplicates!0 lt!308160 j!136 Nil!12655) e!378584)))

(declare-fun b!659019 () Bool)

(assert (=> b!659019 (= e!378584 e!378585)))

(declare-fun res!427431 () Bool)

(assert (=> b!659019 (=> (not res!427431) (not e!378585))))

(assert (=> b!659019 (= res!427431 (not e!378583))))

(declare-fun res!427432 () Bool)

(assert (=> b!659019 (=> (not res!427432) (not e!378583))))

(assert (=> b!659019 (= res!427432 (validKeyInArray!0 (select (arr!18578 lt!308160) j!136)))))

(declare-fun b!659020 () Bool)

(assert (=> b!659020 (= e!378586 call!33864)))

(assert (= (and d!92761 (not res!427430)) b!659019))

(assert (= (and b!659019 res!427432) b!659018))

(assert (= (and b!659019 res!427431) b!659017))

(assert (= (and b!659017 c!76160) b!659020))

(assert (= (and b!659017 (not c!76160)) b!659016))

(assert (= (or b!659020 b!659016) bm!33861))

(assert (=> bm!33861 m!631495))

(declare-fun m!631531 () Bool)

(assert (=> bm!33861 m!631531))

(assert (=> b!659017 m!631495))

(assert (=> b!659017 m!631495))

(declare-fun m!631533 () Bool)

(assert (=> b!659017 m!631533))

(assert (=> b!659018 m!631495))

(assert (=> b!659018 m!631495))

(declare-fun m!631535 () Bool)

(assert (=> b!659018 m!631535))

(assert (=> b!659019 m!631495))

(assert (=> b!659019 m!631495))

(assert (=> b!659019 m!631533))

(assert (=> b!658801 d!92761))

(declare-fun d!92763 () Bool)

(declare-fun res!427433 () Bool)

(declare-fun e!378587 () Bool)

(assert (=> d!92763 (=> res!427433 e!378587)))

(assert (=> d!92763 (= res!427433 (= (select (arr!18578 lt!308160) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18578 a!2986) j!136)))))

(assert (=> d!92763 (= (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!378587)))

(declare-fun b!659021 () Bool)

(declare-fun e!378588 () Bool)

(assert (=> b!659021 (= e!378587 e!378588)))

(declare-fun res!427434 () Bool)

(assert (=> b!659021 (=> (not res!427434) (not e!378588))))

(assert (=> b!659021 (= res!427434 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18943 lt!308160)))))

(declare-fun b!659022 () Bool)

(assert (=> b!659022 (= e!378588 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92763 (not res!427433)) b!659021))

(assert (= (and b!659021 res!427434) b!659022))

(declare-fun m!631537 () Bool)

(assert (=> d!92763 m!631537))

(assert (=> b!659022 m!631275))

(declare-fun m!631539 () Bool)

(assert (=> b!659022 m!631539))

(assert (=> b!658801 d!92763))

(declare-fun d!92765 () Bool)

(assert (=> d!92765 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18943 lt!308160)) (not (= (select (arr!18578 lt!308160) j!136) (select (arr!18578 a!2986) j!136))))))

(declare-fun lt!308311 () Unit!22922)

(assert (=> d!92765 (= lt!308311 (choose!21 lt!308160 (select (arr!18578 a!2986) j!136) j!136 Nil!12655))))

(assert (=> d!92765 (bvslt (size!18943 lt!308160) #b01111111111111111111111111111111)))

(assert (=> d!92765 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308160 (select (arr!18578 a!2986) j!136) j!136 Nil!12655) lt!308311)))

(declare-fun bs!19572 () Bool)

(assert (= bs!19572 d!92765))

(assert (=> bs!19572 m!631495))

(assert (=> bs!19572 m!631275))

(declare-fun m!631541 () Bool)

(assert (=> bs!19572 m!631541))

(assert (=> b!658801 d!92765))

(declare-fun d!92767 () Bool)

(assert (=> d!92767 (arrayNoDuplicates!0 lt!308160 j!136 Nil!12655)))

(declare-fun lt!308312 () Unit!22922)

(assert (=> d!92767 (= lt!308312 (choose!39 lt!308160 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92767 (bvslt (size!18943 lt!308160) #b01111111111111111111111111111111)))

(assert (=> d!92767 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308160 #b00000000000000000000000000000000 j!136) lt!308312)))

(declare-fun bs!19573 () Bool)

(assert (= bs!19573 d!92767))

(assert (=> bs!19573 m!631307))

(declare-fun m!631543 () Bool)

(assert (=> bs!19573 m!631543))

(assert (=> b!658801 d!92767))

(declare-fun d!92769 () Bool)

(assert (=> d!92769 (arrayContainsKey!0 lt!308160 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308313 () Unit!22922)

(assert (=> d!92769 (= lt!308313 (choose!114 lt!308160 (select (arr!18578 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92769 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92769 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308160 (select (arr!18578 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!308313)))

(declare-fun bs!19574 () Bool)

(assert (= bs!19574 d!92769))

(assert (=> bs!19574 m!631275))

(assert (=> bs!19574 m!631295))

(assert (=> bs!19574 m!631275))

(declare-fun m!631545 () Bool)

(assert (=> bs!19574 m!631545))

(assert (=> b!658801 d!92769))

(assert (=> b!658801 d!92757))

(declare-fun bm!33864 () Bool)

(declare-fun call!33867 () Bool)

(assert (=> bm!33864 (= call!33867 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!92771 () Bool)

(declare-fun res!427439 () Bool)

(declare-fun e!378597 () Bool)

(assert (=> d!92771 (=> res!427439 e!378597)))

(assert (=> d!92771 (= res!427439 (bvsge #b00000000000000000000000000000000 (size!18943 a!2986)))))

(assert (=> d!92771 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!378597)))

(declare-fun b!659031 () Bool)

(declare-fun e!378595 () Bool)

(assert (=> b!659031 (= e!378595 call!33867)))

(declare-fun b!659032 () Bool)

(declare-fun e!378596 () Bool)

(assert (=> b!659032 (= e!378596 e!378595)))

(declare-fun lt!308324 () (_ BitVec 64))

(assert (=> b!659032 (= lt!308324 (select (arr!18578 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!308322 () Unit!22922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38763 (_ BitVec 64) (_ BitVec 32)) Unit!22922)

(assert (=> b!659032 (= lt!308322 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!308324 #b00000000000000000000000000000000))))

(assert (=> b!659032 (arrayContainsKey!0 a!2986 lt!308324 #b00000000000000000000000000000000)))

(declare-fun lt!308323 () Unit!22922)

(assert (=> b!659032 (= lt!308323 lt!308322)))

(declare-fun res!427440 () Bool)

(assert (=> b!659032 (= res!427440 (= (seekEntryOrOpen!0 (select (arr!18578 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!7015 #b00000000000000000000000000000000)))))

(assert (=> b!659032 (=> (not res!427440) (not e!378595))))

(declare-fun b!659033 () Bool)

(assert (=> b!659033 (= e!378597 e!378596)))

(declare-fun c!76163 () Bool)

(assert (=> b!659033 (= c!76163 (validKeyInArray!0 (select (arr!18578 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659034 () Bool)

(assert (=> b!659034 (= e!378596 call!33867)))

(assert (= (and d!92771 (not res!427439)) b!659033))

(assert (= (and b!659033 c!76163) b!659032))

(assert (= (and b!659033 (not c!76163)) b!659034))

(assert (= (and b!659032 res!427440) b!659031))

(assert (= (or b!659031 b!659034) bm!33864))

(declare-fun m!631547 () Bool)

(assert (=> bm!33864 m!631547))

(assert (=> b!659032 m!631485))

(declare-fun m!631549 () Bool)

(assert (=> b!659032 m!631549))

(declare-fun m!631551 () Bool)

(assert (=> b!659032 m!631551))

(assert (=> b!659032 m!631485))

(declare-fun m!631553 () Bool)

(assert (=> b!659032 m!631553))

(assert (=> b!659033 m!631485))

(assert (=> b!659033 m!631485))

(declare-fun m!631555 () Bool)

(assert (=> b!659033 m!631555))

(assert (=> b!658812 d!92771))

(declare-fun b!659096 () Bool)

(declare-fun e!378646 () SeekEntryResult!7015)

(declare-fun lt!308344 () SeekEntryResult!7015)

(assert (=> b!659096 (= e!378646 (Found!7015 (index!30427 lt!308344)))))

(declare-fun b!659097 () Bool)

(declare-fun e!378647 () SeekEntryResult!7015)

(assert (=> b!659097 (= e!378647 (seekKeyOrZeroReturnVacant!0 (x!59221 lt!308344) (index!30427 lt!308344) (index!30427 lt!308344) k0!1786 a!2986 mask!3053))))

(declare-fun b!659098 () Bool)

(assert (=> b!659098 (= e!378647 (MissingZero!7015 (index!30427 lt!308344)))))

(declare-fun b!659099 () Bool)

(declare-fun e!378648 () SeekEntryResult!7015)

(assert (=> b!659099 (= e!378648 Undefined!7015)))

(declare-fun b!659100 () Bool)

(assert (=> b!659100 (= e!378648 e!378646)))

(declare-fun lt!308343 () (_ BitVec 64))

(assert (=> b!659100 (= lt!308343 (select (arr!18578 a!2986) (index!30427 lt!308344)))))

(declare-fun c!76177 () Bool)

(assert (=> b!659100 (= c!76177 (= lt!308343 k0!1786))))

(declare-fun d!92777 () Bool)

(declare-fun lt!308345 () SeekEntryResult!7015)

(assert (=> d!92777 (and (or ((_ is Undefined!7015) lt!308345) (not ((_ is Found!7015) lt!308345)) (and (bvsge (index!30426 lt!308345) #b00000000000000000000000000000000) (bvslt (index!30426 lt!308345) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308345) ((_ is Found!7015) lt!308345) (not ((_ is MissingZero!7015) lt!308345)) (and (bvsge (index!30425 lt!308345) #b00000000000000000000000000000000) (bvslt (index!30425 lt!308345) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308345) ((_ is Found!7015) lt!308345) ((_ is MissingZero!7015) lt!308345) (not ((_ is MissingVacant!7015) lt!308345)) (and (bvsge (index!30428 lt!308345) #b00000000000000000000000000000000) (bvslt (index!30428 lt!308345) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308345) (ite ((_ is Found!7015) lt!308345) (= (select (arr!18578 a!2986) (index!30426 lt!308345)) k0!1786) (ite ((_ is MissingZero!7015) lt!308345) (= (select (arr!18578 a!2986) (index!30425 lt!308345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7015) lt!308345) (= (select (arr!18578 a!2986) (index!30428 lt!308345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92777 (= lt!308345 e!378648)))

(declare-fun c!76178 () Bool)

(assert (=> d!92777 (= c!76178 (and ((_ is Intermediate!7015) lt!308344) (undefined!7827 lt!308344)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38763 (_ BitVec 32)) SeekEntryResult!7015)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92777 (= lt!308344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92777 (validMask!0 mask!3053)))

(assert (=> d!92777 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!308345)))

(declare-fun b!659101 () Bool)

(declare-fun c!76179 () Bool)

(assert (=> b!659101 (= c!76179 (= lt!308343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659101 (= e!378646 e!378647)))

(assert (= (and d!92777 c!76178) b!659099))

(assert (= (and d!92777 (not c!76178)) b!659100))

(assert (= (and b!659100 c!76177) b!659096))

(assert (= (and b!659100 (not c!76177)) b!659101))

(assert (= (and b!659101 c!76179) b!659098))

(assert (= (and b!659101 (not c!76179)) b!659097))

(declare-fun m!631599 () Bool)

(assert (=> b!659097 m!631599))

(declare-fun m!631601 () Bool)

(assert (=> b!659100 m!631601))

(declare-fun m!631605 () Bool)

(assert (=> d!92777 m!631605))

(declare-fun m!631607 () Bool)

(assert (=> d!92777 m!631607))

(declare-fun m!631609 () Bool)

(assert (=> d!92777 m!631609))

(assert (=> d!92777 m!631309))

(declare-fun m!631611 () Bool)

(assert (=> d!92777 m!631611))

(declare-fun m!631613 () Bool)

(assert (=> d!92777 m!631613))

(assert (=> d!92777 m!631605))

(assert (=> b!658811 d!92777))

(declare-fun b!659103 () Bool)

(declare-fun e!378652 () SeekEntryResult!7015)

(assert (=> b!659103 (= e!378652 (MissingVacant!7015 vacantSpotIndex!68))))

(declare-fun b!659104 () Bool)

(declare-fun e!378650 () SeekEntryResult!7015)

(declare-fun e!378651 () SeekEntryResult!7015)

(assert (=> b!659104 (= e!378650 e!378651)))

(declare-fun c!76182 () Bool)

(declare-fun lt!308348 () (_ BitVec 64))

(assert (=> b!659104 (= c!76182 (= lt!308348 lt!308157))))

(declare-fun b!659105 () Bool)

(assert (=> b!659105 (= e!378652 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308171 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!308157 lt!308160 mask!3053))))

(declare-fun b!659106 () Bool)

(declare-fun c!76180 () Bool)

(assert (=> b!659106 (= c!76180 (= lt!308348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659106 (= e!378651 e!378652)))

(declare-fun b!659107 () Bool)

(assert (=> b!659107 (= e!378650 Undefined!7015)))

(declare-fun b!659108 () Bool)

(assert (=> b!659108 (= e!378651 (Found!7015 lt!308171))))

(declare-fun d!92801 () Bool)

(declare-fun lt!308347 () SeekEntryResult!7015)

(assert (=> d!92801 (and (or ((_ is Undefined!7015) lt!308347) (not ((_ is Found!7015) lt!308347)) (and (bvsge (index!30426 lt!308347) #b00000000000000000000000000000000) (bvslt (index!30426 lt!308347) (size!18943 lt!308160)))) (or ((_ is Undefined!7015) lt!308347) ((_ is Found!7015) lt!308347) (not ((_ is MissingVacant!7015) lt!308347)) (not (= (index!30428 lt!308347) vacantSpotIndex!68)) (and (bvsge (index!30428 lt!308347) #b00000000000000000000000000000000) (bvslt (index!30428 lt!308347) (size!18943 lt!308160)))) (or ((_ is Undefined!7015) lt!308347) (ite ((_ is Found!7015) lt!308347) (= (select (arr!18578 lt!308160) (index!30426 lt!308347)) lt!308157) (and ((_ is MissingVacant!7015) lt!308347) (= (index!30428 lt!308347) vacantSpotIndex!68) (= (select (arr!18578 lt!308160) (index!30428 lt!308347)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92801 (= lt!308347 e!378650)))

(declare-fun c!76181 () Bool)

(assert (=> d!92801 (= c!76181 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92801 (= lt!308348 (select (arr!18578 lt!308160) lt!308171))))

(assert (=> d!92801 (validMask!0 mask!3053)))

(assert (=> d!92801 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 lt!308157 lt!308160 mask!3053) lt!308347)))

(assert (= (and d!92801 c!76181) b!659107))

(assert (= (and d!92801 (not c!76181)) b!659104))

(assert (= (and b!659104 c!76182) b!659108))

(assert (= (and b!659104 (not c!76182)) b!659106))

(assert (= (and b!659106 c!76180) b!659103))

(assert (= (and b!659106 (not c!76180)) b!659105))

(declare-fun m!631615 () Bool)

(assert (=> b!659105 m!631615))

(assert (=> b!659105 m!631615))

(declare-fun m!631617 () Bool)

(assert (=> b!659105 m!631617))

(declare-fun m!631619 () Bool)

(assert (=> d!92801 m!631619))

(declare-fun m!631621 () Bool)

(assert (=> d!92801 m!631621))

(declare-fun m!631623 () Bool)

(assert (=> d!92801 m!631623))

(assert (=> d!92801 m!631309))

(assert (=> b!658800 d!92801))

(declare-fun b!659109 () Bool)

(declare-fun e!378655 () SeekEntryResult!7015)

(assert (=> b!659109 (= e!378655 (MissingVacant!7015 vacantSpotIndex!68))))

(declare-fun b!659110 () Bool)

(declare-fun e!378653 () SeekEntryResult!7015)

(declare-fun e!378654 () SeekEntryResult!7015)

(assert (=> b!659110 (= e!378653 e!378654)))

(declare-fun c!76185 () Bool)

(declare-fun lt!308350 () (_ BitVec 64))

(assert (=> b!659110 (= c!76185 (= lt!308350 lt!308157))))

(declare-fun b!659111 () Bool)

(assert (=> b!659111 (= e!378655 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!308157 lt!308160 mask!3053))))

(declare-fun b!659112 () Bool)

(declare-fun c!76183 () Bool)

(assert (=> b!659112 (= c!76183 (= lt!308350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659112 (= e!378654 e!378655)))

(declare-fun b!659113 () Bool)

(assert (=> b!659113 (= e!378653 Undefined!7015)))

(declare-fun b!659114 () Bool)

(assert (=> b!659114 (= e!378654 (Found!7015 index!984))))

(declare-fun d!92803 () Bool)

(declare-fun lt!308349 () SeekEntryResult!7015)

(assert (=> d!92803 (and (or ((_ is Undefined!7015) lt!308349) (not ((_ is Found!7015) lt!308349)) (and (bvsge (index!30426 lt!308349) #b00000000000000000000000000000000) (bvslt (index!30426 lt!308349) (size!18943 lt!308160)))) (or ((_ is Undefined!7015) lt!308349) ((_ is Found!7015) lt!308349) (not ((_ is MissingVacant!7015) lt!308349)) (not (= (index!30428 lt!308349) vacantSpotIndex!68)) (and (bvsge (index!30428 lt!308349) #b00000000000000000000000000000000) (bvslt (index!30428 lt!308349) (size!18943 lt!308160)))) (or ((_ is Undefined!7015) lt!308349) (ite ((_ is Found!7015) lt!308349) (= (select (arr!18578 lt!308160) (index!30426 lt!308349)) lt!308157) (and ((_ is MissingVacant!7015) lt!308349) (= (index!30428 lt!308349) vacantSpotIndex!68) (= (select (arr!18578 lt!308160) (index!30428 lt!308349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92803 (= lt!308349 e!378653)))

(declare-fun c!76184 () Bool)

(assert (=> d!92803 (= c!76184 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92803 (= lt!308350 (select (arr!18578 lt!308160) index!984))))

(assert (=> d!92803 (validMask!0 mask!3053)))

(assert (=> d!92803 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308157 lt!308160 mask!3053) lt!308349)))

(assert (= (and d!92803 c!76184) b!659113))

(assert (= (and d!92803 (not c!76184)) b!659110))

(assert (= (and b!659110 c!76185) b!659114))

(assert (= (and b!659110 (not c!76185)) b!659112))

(assert (= (and b!659112 c!76183) b!659109))

(assert (= (and b!659112 (not c!76183)) b!659111))

(assert (=> b!659111 m!631285))

(assert (=> b!659111 m!631285))

(declare-fun m!631625 () Bool)

(assert (=> b!659111 m!631625))

(declare-fun m!631627 () Bool)

(assert (=> d!92803 m!631627))

(declare-fun m!631629 () Bool)

(assert (=> d!92803 m!631629))

(assert (=> d!92803 m!631513))

(assert (=> d!92803 m!631309))

(assert (=> b!658800 d!92803))

(declare-fun b!659115 () Bool)

(declare-fun e!378658 () SeekEntryResult!7015)

(assert (=> b!659115 (= e!378658 (MissingVacant!7015 vacantSpotIndex!68))))

(declare-fun b!659116 () Bool)

(declare-fun e!378656 () SeekEntryResult!7015)

(declare-fun e!378657 () SeekEntryResult!7015)

(assert (=> b!659116 (= e!378656 e!378657)))

(declare-fun c!76188 () Bool)

(declare-fun lt!308354 () (_ BitVec 64))

(assert (=> b!659116 (= c!76188 (= lt!308354 (select (arr!18578 a!2986) j!136)))))

(declare-fun b!659117 () Bool)

(assert (=> b!659117 (= e!378658 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308171 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659118 () Bool)

(declare-fun c!76186 () Bool)

(assert (=> b!659118 (= c!76186 (= lt!308354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659118 (= e!378657 e!378658)))

(declare-fun b!659119 () Bool)

(assert (=> b!659119 (= e!378656 Undefined!7015)))

(declare-fun b!659120 () Bool)

(assert (=> b!659120 (= e!378657 (Found!7015 lt!308171))))

(declare-fun lt!308353 () SeekEntryResult!7015)

(declare-fun d!92805 () Bool)

(assert (=> d!92805 (and (or ((_ is Undefined!7015) lt!308353) (not ((_ is Found!7015) lt!308353)) (and (bvsge (index!30426 lt!308353) #b00000000000000000000000000000000) (bvslt (index!30426 lt!308353) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308353) ((_ is Found!7015) lt!308353) (not ((_ is MissingVacant!7015) lt!308353)) (not (= (index!30428 lt!308353) vacantSpotIndex!68)) (and (bvsge (index!30428 lt!308353) #b00000000000000000000000000000000) (bvslt (index!30428 lt!308353) (size!18943 a!2986)))) (or ((_ is Undefined!7015) lt!308353) (ite ((_ is Found!7015) lt!308353) (= (select (arr!18578 a!2986) (index!30426 lt!308353)) (select (arr!18578 a!2986) j!136)) (and ((_ is MissingVacant!7015) lt!308353) (= (index!30428 lt!308353) vacantSpotIndex!68) (= (select (arr!18578 a!2986) (index!30428 lt!308353)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92805 (= lt!308353 e!378656)))

(declare-fun c!76187 () Bool)

(assert (=> d!92805 (= c!76187 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92805 (= lt!308354 (select (arr!18578 a!2986) lt!308171))))

(assert (=> d!92805 (validMask!0 mask!3053)))

(assert (=> d!92805 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053) lt!308353)))

(assert (= (and d!92805 c!76187) b!659119))

(assert (= (and d!92805 (not c!76187)) b!659116))

(assert (= (and b!659116 c!76188) b!659120))

(assert (= (and b!659116 (not c!76188)) b!659118))

(assert (= (and b!659118 c!76186) b!659115))

(assert (= (and b!659118 (not c!76186)) b!659117))

(assert (=> b!659117 m!631615))

(assert (=> b!659117 m!631615))

(assert (=> b!659117 m!631275))

(declare-fun m!631633 () Bool)

(assert (=> b!659117 m!631633))

(declare-fun m!631635 () Bool)

(assert (=> d!92805 m!631635))

(declare-fun m!631637 () Bool)

(assert (=> d!92805 m!631637))

(declare-fun m!631639 () Bool)

(assert (=> d!92805 m!631639))

(assert (=> d!92805 m!631309))

(assert (=> b!658800 d!92805))

(declare-fun d!92809 () Bool)

(declare-fun lt!308361 () (_ BitVec 32))

(assert (=> d!92809 (and (bvsge lt!308361 #b00000000000000000000000000000000) (bvslt lt!308361 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92809 (= lt!308361 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92809 (validMask!0 mask!3053)))

(assert (=> d!92809 (= (nextIndex!0 index!984 x!910 mask!3053) lt!308361)))

(declare-fun bs!19580 () Bool)

(assert (= bs!19580 d!92809))

(declare-fun m!631653 () Bool)

(assert (=> bs!19580 m!631653))

(assert (=> bs!19580 m!631309))

(assert (=> b!658800 d!92809))

(declare-fun d!92817 () Bool)

(declare-fun e!378680 () Bool)

(assert (=> d!92817 e!378680))

(declare-fun res!427490 () Bool)

(assert (=> d!92817 (=> (not res!427490) (not e!378680))))

(assert (=> d!92817 (= res!427490 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18943 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18943 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18943 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18943 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18943 a!2986))))))

(declare-fun lt!308371 () Unit!22922)

(declare-fun choose!9 (array!38763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22922)

(assert (=> d!92817 (= lt!308371 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92817 (validMask!0 mask!3053)))

(assert (=> d!92817 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 mask!3053) lt!308371)))

(declare-fun b!659150 () Bool)

(assert (=> b!659150 (= e!378680 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308171 vacantSpotIndex!68 (select (store (arr!18578 a!2986) i!1108 k0!1786) j!136) (array!38764 (store (arr!18578 a!2986) i!1108 k0!1786) (size!18943 a!2986)) mask!3053)))))

(assert (= (and d!92817 res!427490) b!659150))

(declare-fun m!631669 () Bool)

(assert (=> d!92817 m!631669))

(assert (=> d!92817 m!631309))

(assert (=> b!659150 m!631289))

(declare-fun m!631671 () Bool)

(assert (=> b!659150 m!631671))

(assert (=> b!659150 m!631289))

(assert (=> b!659150 m!631275))

(assert (=> b!659150 m!631277))

(assert (=> b!659150 m!631275))

(assert (=> b!659150 m!631281))

(assert (=> b!658800 d!92817))

(declare-fun bm!33874 () Bool)

(declare-fun call!33877 () Bool)

(declare-fun c!76200 () Bool)

(assert (=> bm!33874 (= call!33877 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76200 (Cons!12654 (select (arr!18578 a!2986) #b00000000000000000000000000000000) Nil!12655) Nil!12655)))))

(declare-fun b!659157 () Bool)

(declare-fun e!378687 () Bool)

(assert (=> b!659157 (= e!378687 call!33877)))

(declare-fun b!659158 () Bool)

(declare-fun e!378686 () Bool)

(assert (=> b!659158 (= e!378686 e!378687)))

(assert (=> b!659158 (= c!76200 (validKeyInArray!0 (select (arr!18578 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659159 () Bool)

(declare-fun e!378684 () Bool)

(assert (=> b!659159 (= e!378684 (contains!3180 Nil!12655 (select (arr!18578 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92825 () Bool)

(declare-fun res!427491 () Bool)

(declare-fun e!378685 () Bool)

(assert (=> d!92825 (=> res!427491 e!378685)))

(assert (=> d!92825 (= res!427491 (bvsge #b00000000000000000000000000000000 (size!18943 a!2986)))))

(assert (=> d!92825 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12655) e!378685)))

(declare-fun b!659160 () Bool)

(assert (=> b!659160 (= e!378685 e!378686)))

(declare-fun res!427492 () Bool)

(assert (=> b!659160 (=> (not res!427492) (not e!378686))))

(assert (=> b!659160 (= res!427492 (not e!378684))))

(declare-fun res!427493 () Bool)

(assert (=> b!659160 (=> (not res!427493) (not e!378684))))

(assert (=> b!659160 (= res!427493 (validKeyInArray!0 (select (arr!18578 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659161 () Bool)

(assert (=> b!659161 (= e!378687 call!33877)))

(assert (= (and d!92825 (not res!427491)) b!659160))

(assert (= (and b!659160 res!427493) b!659159))

(assert (= (and b!659160 res!427492) b!659158))

(assert (= (and b!659158 c!76200) b!659161))

(assert (= (and b!659158 (not c!76200)) b!659157))

(assert (= (or b!659161 b!659157) bm!33874))

(assert (=> bm!33874 m!631485))

(declare-fun m!631679 () Bool)

(assert (=> bm!33874 m!631679))

(assert (=> b!659158 m!631485))

(assert (=> b!659158 m!631485))

(assert (=> b!659158 m!631555))

(assert (=> b!659159 m!631485))

(assert (=> b!659159 m!631485))

(declare-fun m!631683 () Bool)

(assert (=> b!659159 m!631683))

(assert (=> b!659160 m!631485))

(assert (=> b!659160 m!631485))

(assert (=> b!659160 m!631555))

(assert (=> b!658809 d!92825))

(declare-fun d!92831 () Bool)

(assert (=> d!92831 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59594 d!92831))

(declare-fun d!92839 () Bool)

(assert (=> d!92839 (= (array_inv!14461 a!2986) (bvsge (size!18943 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59594 d!92839))

(assert (=> b!658818 d!92759))

(check-sat (not b!659019) (not d!92801) (not d!92777) (not b!659013) (not b!659008) (not d!92745) (not b!658968) (not b!659018) (not b!659105) (not bm!33859) (not b!659111) (not d!92767) (not b!659017) (not d!92769) (not d!92755) (not d!92809) (not b!659033) (not d!92803) (not b!659002) (not b!659007) (not bm!33874) (not b!659022) (not b!659117) (not bm!33860) (not b!659097) (not d!92739) (not bm!33861) (not b!659015) (not b!659032) (not b!659150) (not d!92765) (not b!659009) (not b!658983) (not d!92805) (not b!659158) (not b!659003) (not b!659159) (not b!658990) (not b!658988) (not bm!33864) (not d!92753) (not b!659004) (not d!92757) (not d!92817) (not b!659160))
(check-sat)
