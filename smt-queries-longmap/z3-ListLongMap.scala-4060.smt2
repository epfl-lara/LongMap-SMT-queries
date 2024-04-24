; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55638 () Bool)

(assert start!55638)

(declare-fun b!609207 () Bool)

(declare-fun res!391698 () Bool)

(declare-fun e!348917 () Bool)

(assert (=> b!609207 (=> (not res!391698) (not e!348917))))

(declare-datatypes ((array!37314 0))(
  ( (array!37315 (arr!17905 (Array (_ BitVec 32) (_ BitVec 64))) (size!18269 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37314)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37314 (_ BitVec 32)) Bool)

(assert (=> b!609207 (= res!391698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609208 () Bool)

(declare-fun res!391708 () Bool)

(declare-fun e!348912 () Bool)

(assert (=> b!609208 (=> res!391708 e!348912)))

(declare-datatypes ((List!11853 0))(
  ( (Nil!11850) (Cons!11849 (h!12897 (_ BitVec 64)) (t!18073 List!11853)) )
))
(declare-fun contains!3003 (List!11853 (_ BitVec 64)) Bool)

(assert (=> b!609208 (= res!391708 (contains!3003 Nil!11850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609209 () Bool)

(declare-fun e!348911 () Bool)

(declare-datatypes ((SeekEntryResult!6301 0))(
  ( (MissingZero!6301 (index!27479 (_ BitVec 32))) (Found!6301 (index!27480 (_ BitVec 32))) (Intermediate!6301 (undefined!7113 Bool) (index!27481 (_ BitVec 32)) (x!56437 (_ BitVec 32))) (Undefined!6301) (MissingVacant!6301 (index!27482 (_ BitVec 32))) )
))
(declare-fun lt!278421 () SeekEntryResult!6301)

(declare-fun lt!278422 () SeekEntryResult!6301)

(assert (=> b!609209 (= e!348911 (= lt!278421 lt!278422))))

(declare-fun b!609210 () Bool)

(declare-fun res!391706 () Bool)

(assert (=> b!609210 (=> (not res!391706) (not e!348917))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609210 (= res!391706 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17905 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609211 () Bool)

(declare-fun res!391701 () Bool)

(declare-fun e!348914 () Bool)

(assert (=> b!609211 (=> (not res!391701) (not e!348914))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609211 (= res!391701 (validKeyInArray!0 k0!1786))))

(declare-fun b!609212 () Bool)

(declare-fun res!391710 () Bool)

(assert (=> b!609212 (=> res!391710 e!348912)))

(assert (=> b!609212 (= res!391710 (contains!3003 Nil!11850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609213 () Bool)

(declare-fun e!348904 () Bool)

(declare-fun e!348918 () Bool)

(assert (=> b!609213 (= e!348904 (not e!348918))))

(declare-fun res!391693 () Bool)

(assert (=> b!609213 (=> res!391693 e!348918)))

(declare-fun lt!278420 () SeekEntryResult!6301)

(assert (=> b!609213 (= res!391693 (not (= lt!278420 (Found!6301 index!984))))))

(declare-datatypes ((Unit!19459 0))(
  ( (Unit!19460) )
))
(declare-fun lt!278419 () Unit!19459)

(declare-fun e!348908 () Unit!19459)

(assert (=> b!609213 (= lt!278419 e!348908)))

(declare-fun c!69127 () Bool)

(assert (=> b!609213 (= c!69127 (= lt!278420 Undefined!6301))))

(declare-fun lt!278413 () (_ BitVec 64))

(declare-fun lt!278417 () array!37314)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37314 (_ BitVec 32)) SeekEntryResult!6301)

(assert (=> b!609213 (= lt!278420 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278413 lt!278417 mask!3053))))

(assert (=> b!609213 e!348911))

(declare-fun res!391692 () Bool)

(assert (=> b!609213 (=> (not res!391692) (not e!348911))))

(declare-fun lt!278406 () (_ BitVec 32))

(assert (=> b!609213 (= res!391692 (= lt!278422 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278406 vacantSpotIndex!68 lt!278413 lt!278417 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!609213 (= lt!278422 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278406 vacantSpotIndex!68 (select (arr!17905 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609213 (= lt!278413 (select (store (arr!17905 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278408 () Unit!19459)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19459)

(assert (=> b!609213 (= lt!278408 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278406 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609213 (= lt!278406 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!609214 () Bool)

(declare-fun e!348903 () Bool)

(declare-fun e!348913 () Bool)

(assert (=> b!609214 (= e!348903 e!348913)))

(declare-fun res!391697 () Bool)

(assert (=> b!609214 (=> res!391697 e!348913)))

(declare-fun lt!278418 () (_ BitVec 64))

(assert (=> b!609214 (= res!391697 (or (not (= (select (arr!17905 a!2986) j!136) lt!278413)) (not (= (select (arr!17905 a!2986) j!136) lt!278418)) (bvsge j!136 index!984)))))

(declare-fun e!348909 () Bool)

(declare-fun b!609215 () Bool)

(declare-fun arrayContainsKey!0 (array!37314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609215 (= e!348909 (arrayContainsKey!0 lt!278417 (select (arr!17905 a!2986) j!136) index!984))))

(declare-fun b!609216 () Bool)

(declare-fun e!348907 () Bool)

(assert (=> b!609216 (= e!348918 e!348907)))

(declare-fun res!391703 () Bool)

(assert (=> b!609216 (=> res!391703 e!348907)))

(assert (=> b!609216 (= res!391703 (or (not (= (select (arr!17905 a!2986) j!136) lt!278413)) (not (= (select (arr!17905 a!2986) j!136) lt!278418))))))

(assert (=> b!609216 e!348903))

(declare-fun res!391705 () Bool)

(assert (=> b!609216 (=> (not res!391705) (not e!348903))))

(assert (=> b!609216 (= res!391705 (= lt!278418 (select (arr!17905 a!2986) j!136)))))

(assert (=> b!609216 (= lt!278418 (select (store (arr!17905 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609217 () Bool)

(declare-fun e!348905 () Bool)

(assert (=> b!609217 (= e!348905 e!348912)))

(declare-fun res!391709 () Bool)

(assert (=> b!609217 (=> res!391709 e!348912)))

(assert (=> b!609217 (= res!391709 (or (bvsge (size!18269 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18269 a!2986))))))

(assert (=> b!609217 (arrayContainsKey!0 lt!278417 (select (arr!17905 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278416 () Unit!19459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19459)

(assert (=> b!609217 (= lt!278416 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278417 (select (arr!17905 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609217 e!348909))

(declare-fun res!391704 () Bool)

(assert (=> b!609217 (=> (not res!391704) (not e!348909))))

(assert (=> b!609217 (= res!391704 (arrayContainsKey!0 lt!278417 (select (arr!17905 a!2986) j!136) j!136))))

(declare-fun b!609206 () Bool)

(declare-fun e!348915 () Unit!19459)

(declare-fun Unit!19461 () Unit!19459)

(assert (=> b!609206 (= e!348915 Unit!19461)))

(declare-fun res!391690 () Bool)

(assert (=> start!55638 (=> (not res!391690) (not e!348914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55638 (= res!391690 (validMask!0 mask!3053))))

(assert (=> start!55638 e!348914))

(assert (=> start!55638 true))

(declare-fun array_inv!13764 (array!37314) Bool)

(assert (=> start!55638 (array_inv!13764 a!2986)))

(declare-fun b!609218 () Bool)

(declare-fun Unit!19462 () Unit!19459)

(assert (=> b!609218 (= e!348915 Unit!19462)))

(declare-fun lt!278409 () Unit!19459)

(assert (=> b!609218 (= lt!278409 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278417 (select (arr!17905 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609218 (arrayContainsKey!0 lt!278417 (select (arr!17905 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278411 () Unit!19459)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11853) Unit!19459)

(assert (=> b!609218 (= lt!278411 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11850))))

(declare-fun arrayNoDuplicates!0 (array!37314 (_ BitVec 32) List!11853) Bool)

(assert (=> b!609218 (arrayNoDuplicates!0 lt!278417 #b00000000000000000000000000000000 Nil!11850)))

(declare-fun lt!278415 () Unit!19459)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37314 (_ BitVec 32) (_ BitVec 32)) Unit!19459)

(assert (=> b!609218 (= lt!278415 (lemmaNoDuplicateFromThenFromBigger!0 lt!278417 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609218 (arrayNoDuplicates!0 lt!278417 j!136 Nil!11850)))

(declare-fun lt!278407 () Unit!19459)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37314 (_ BitVec 64) (_ BitVec 32) List!11853) Unit!19459)

(assert (=> b!609218 (= lt!278407 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278417 (select (arr!17905 a!2986) j!136) j!136 Nil!11850))))

(assert (=> b!609218 false))

(declare-fun b!609219 () Bool)

(declare-fun e!348916 () Bool)

(assert (=> b!609219 (= e!348916 (arrayContainsKey!0 lt!278417 (select (arr!17905 a!2986) j!136) index!984))))

(declare-fun b!609220 () Bool)

(assert (=> b!609220 (= e!348907 e!348905)))

(declare-fun res!391695 () Bool)

(assert (=> b!609220 (=> res!391695 e!348905)))

(assert (=> b!609220 (= res!391695 (bvsge index!984 j!136))))

(declare-fun lt!278410 () Unit!19459)

(assert (=> b!609220 (= lt!278410 e!348915)))

(declare-fun c!69128 () Bool)

(assert (=> b!609220 (= c!69128 (bvslt j!136 index!984))))

(declare-fun b!609221 () Bool)

(assert (=> b!609221 (= e!348912 true)))

(declare-fun lt!278414 () Bool)

(assert (=> b!609221 (= lt!278414 (contains!3003 Nil!11850 k0!1786))))

(declare-fun b!609222 () Bool)

(declare-fun e!348910 () Bool)

(assert (=> b!609222 (= e!348910 e!348904)))

(declare-fun res!391711 () Bool)

(assert (=> b!609222 (=> (not res!391711) (not e!348904))))

(assert (=> b!609222 (= res!391711 (and (= lt!278421 (Found!6301 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17905 a!2986) index!984) (select (arr!17905 a!2986) j!136))) (not (= (select (arr!17905 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609222 (= lt!278421 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17905 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609223 () Bool)

(declare-fun res!391689 () Bool)

(assert (=> b!609223 (=> res!391689 e!348912)))

(declare-fun noDuplicate!337 (List!11853) Bool)

(assert (=> b!609223 (= res!391689 (not (noDuplicate!337 Nil!11850)))))

(declare-fun b!609224 () Bool)

(declare-fun Unit!19463 () Unit!19459)

(assert (=> b!609224 (= e!348908 Unit!19463)))

(assert (=> b!609224 false))

(declare-fun b!609225 () Bool)

(assert (=> b!609225 (= e!348913 e!348916)))

(declare-fun res!391696 () Bool)

(assert (=> b!609225 (=> (not res!391696) (not e!348916))))

(assert (=> b!609225 (= res!391696 (arrayContainsKey!0 lt!278417 (select (arr!17905 a!2986) j!136) j!136))))

(declare-fun b!609226 () Bool)

(declare-fun res!391694 () Bool)

(assert (=> b!609226 (=> (not res!391694) (not e!348914))))

(assert (=> b!609226 (= res!391694 (validKeyInArray!0 (select (arr!17905 a!2986) j!136)))))

(declare-fun b!609227 () Bool)

(declare-fun res!391702 () Bool)

(assert (=> b!609227 (=> (not res!391702) (not e!348917))))

(assert (=> b!609227 (= res!391702 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11850))))

(declare-fun b!609228 () Bool)

(declare-fun Unit!19464 () Unit!19459)

(assert (=> b!609228 (= e!348908 Unit!19464)))

(declare-fun b!609229 () Bool)

(assert (=> b!609229 (= e!348914 e!348917)))

(declare-fun res!391700 () Bool)

(assert (=> b!609229 (=> (not res!391700) (not e!348917))))

(declare-fun lt!278412 () SeekEntryResult!6301)

(assert (=> b!609229 (= res!391700 (or (= lt!278412 (MissingZero!6301 i!1108)) (= lt!278412 (MissingVacant!6301 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37314 (_ BitVec 32)) SeekEntryResult!6301)

(assert (=> b!609229 (= lt!278412 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609230 () Bool)

(declare-fun res!391699 () Bool)

(assert (=> b!609230 (=> (not res!391699) (not e!348914))))

(assert (=> b!609230 (= res!391699 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609231 () Bool)

(declare-fun res!391707 () Bool)

(assert (=> b!609231 (=> (not res!391707) (not e!348914))))

(assert (=> b!609231 (= res!391707 (and (= (size!18269 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18269 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18269 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609232 () Bool)

(assert (=> b!609232 (= e!348917 e!348910)))

(declare-fun res!391691 () Bool)

(assert (=> b!609232 (=> (not res!391691) (not e!348910))))

(assert (=> b!609232 (= res!391691 (= (select (store (arr!17905 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609232 (= lt!278417 (array!37315 (store (arr!17905 a!2986) i!1108 k0!1786) (size!18269 a!2986)))))

(assert (= (and start!55638 res!391690) b!609231))

(assert (= (and b!609231 res!391707) b!609226))

(assert (= (and b!609226 res!391694) b!609211))

(assert (= (and b!609211 res!391701) b!609230))

(assert (= (and b!609230 res!391699) b!609229))

(assert (= (and b!609229 res!391700) b!609207))

(assert (= (and b!609207 res!391698) b!609227))

(assert (= (and b!609227 res!391702) b!609210))

(assert (= (and b!609210 res!391706) b!609232))

(assert (= (and b!609232 res!391691) b!609222))

(assert (= (and b!609222 res!391711) b!609213))

(assert (= (and b!609213 res!391692) b!609209))

(assert (= (and b!609213 c!69127) b!609224))

(assert (= (and b!609213 (not c!69127)) b!609228))

(assert (= (and b!609213 (not res!391693)) b!609216))

(assert (= (and b!609216 res!391705) b!609214))

(assert (= (and b!609214 (not res!391697)) b!609225))

(assert (= (and b!609225 res!391696) b!609219))

(assert (= (and b!609216 (not res!391703)) b!609220))

(assert (= (and b!609220 c!69128) b!609218))

(assert (= (and b!609220 (not c!69128)) b!609206))

(assert (= (and b!609220 (not res!391695)) b!609217))

(assert (= (and b!609217 res!391704) b!609215))

(assert (= (and b!609217 (not res!391709)) b!609223))

(assert (= (and b!609223 (not res!391689)) b!609208))

(assert (= (and b!609208 (not res!391708)) b!609212))

(assert (= (and b!609212 (not res!391710)) b!609221))

(declare-fun m!586031 () Bool)

(assert (=> b!609221 m!586031))

(declare-fun m!586033 () Bool)

(assert (=> b!609227 m!586033))

(declare-fun m!586035 () Bool)

(assert (=> b!609207 m!586035))

(declare-fun m!586037 () Bool)

(assert (=> b!609208 m!586037))

(declare-fun m!586039 () Bool)

(assert (=> start!55638 m!586039))

(declare-fun m!586041 () Bool)

(assert (=> start!55638 m!586041))

(declare-fun m!586043 () Bool)

(assert (=> b!609229 m!586043))

(declare-fun m!586045 () Bool)

(assert (=> b!609211 m!586045))

(declare-fun m!586047 () Bool)

(assert (=> b!609215 m!586047))

(assert (=> b!609215 m!586047))

(declare-fun m!586049 () Bool)

(assert (=> b!609215 m!586049))

(declare-fun m!586051 () Bool)

(assert (=> b!609210 m!586051))

(declare-fun m!586053 () Bool)

(assert (=> b!609213 m!586053))

(declare-fun m!586055 () Bool)

(assert (=> b!609213 m!586055))

(assert (=> b!609213 m!586047))

(declare-fun m!586057 () Bool)

(assert (=> b!609213 m!586057))

(declare-fun m!586059 () Bool)

(assert (=> b!609213 m!586059))

(declare-fun m!586061 () Bool)

(assert (=> b!609213 m!586061))

(assert (=> b!609213 m!586047))

(declare-fun m!586063 () Bool)

(assert (=> b!609213 m!586063))

(declare-fun m!586065 () Bool)

(assert (=> b!609213 m!586065))

(assert (=> b!609225 m!586047))

(assert (=> b!609225 m!586047))

(declare-fun m!586067 () Bool)

(assert (=> b!609225 m!586067))

(declare-fun m!586069 () Bool)

(assert (=> b!609222 m!586069))

(assert (=> b!609222 m!586047))

(assert (=> b!609222 m!586047))

(declare-fun m!586071 () Bool)

(assert (=> b!609222 m!586071))

(assert (=> b!609226 m!586047))

(assert (=> b!609226 m!586047))

(declare-fun m!586073 () Bool)

(assert (=> b!609226 m!586073))

(assert (=> b!609219 m!586047))

(assert (=> b!609219 m!586047))

(assert (=> b!609219 m!586049))

(assert (=> b!609232 m!586057))

(declare-fun m!586075 () Bool)

(assert (=> b!609232 m!586075))

(declare-fun m!586077 () Bool)

(assert (=> b!609223 m!586077))

(assert (=> b!609214 m!586047))

(assert (=> b!609216 m!586047))

(assert (=> b!609216 m!586057))

(declare-fun m!586079 () Bool)

(assert (=> b!609216 m!586079))

(assert (=> b!609217 m!586047))

(assert (=> b!609217 m!586047))

(declare-fun m!586081 () Bool)

(assert (=> b!609217 m!586081))

(assert (=> b!609217 m!586047))

(declare-fun m!586083 () Bool)

(assert (=> b!609217 m!586083))

(assert (=> b!609217 m!586047))

(assert (=> b!609217 m!586067))

(declare-fun m!586085 () Bool)

(assert (=> b!609230 m!586085))

(declare-fun m!586087 () Bool)

(assert (=> b!609212 m!586087))

(assert (=> b!609218 m!586047))

(declare-fun m!586089 () Bool)

(assert (=> b!609218 m!586089))

(declare-fun m!586091 () Bool)

(assert (=> b!609218 m!586091))

(assert (=> b!609218 m!586047))

(declare-fun m!586093 () Bool)

(assert (=> b!609218 m!586093))

(assert (=> b!609218 m!586047))

(declare-fun m!586095 () Bool)

(assert (=> b!609218 m!586095))

(declare-fun m!586097 () Bool)

(assert (=> b!609218 m!586097))

(assert (=> b!609218 m!586047))

(declare-fun m!586099 () Bool)

(assert (=> b!609218 m!586099))

(declare-fun m!586101 () Bool)

(assert (=> b!609218 m!586101))

(check-sat (not b!609208) (not b!609222) (not start!55638) (not b!609211) (not b!609213) (not b!609215) (not b!609219) (not b!609221) (not b!609229) (not b!609225) (not b!609223) (not b!609207) (not b!609227) (not b!609217) (not b!609212) (not b!609218) (not b!609226) (not b!609230))
(check-sat)
