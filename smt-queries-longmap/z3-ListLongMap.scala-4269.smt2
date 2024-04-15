; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59342 () Bool)

(assert start!59342)

(declare-fun b!655021 () Bool)

(assert (=> b!655021 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22502 0))(
  ( (Unit!22503) )
))
(declare-fun lt!305333 () Unit!22502)

(declare-datatypes ((array!38673 0))(
  ( (array!38674 (arr!18536 (Array (_ BitVec 32) (_ BitVec 64))) (size!18901 (_ BitVec 32))) )
))
(declare-fun lt!305336 () array!38673)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38673)

(declare-datatypes ((List!12616 0))(
  ( (Nil!12613) (Cons!12612 (h!13657 (_ BitVec 64)) (t!18835 List!12616)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38673 (_ BitVec 64) (_ BitVec 32) List!12616) Unit!22502)

(assert (=> b!655021 (= lt!305333 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305336 (select (arr!18536 a!2986) j!136) index!984 Nil!12613))))

(declare-fun arrayNoDuplicates!0 (array!38673 (_ BitVec 32) List!12616) Bool)

(assert (=> b!655021 (arrayNoDuplicates!0 lt!305336 index!984 Nil!12613)))

(declare-fun lt!305343 () Unit!22502)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38673 (_ BitVec 32) (_ BitVec 32)) Unit!22502)

(assert (=> b!655021 (= lt!305343 (lemmaNoDuplicateFromThenFromBigger!0 lt!305336 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655021 (arrayNoDuplicates!0 lt!305336 #b00000000000000000000000000000000 Nil!12613)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!305335 () Unit!22502)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38673 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12616) Unit!22502)

(assert (=> b!655021 (= lt!305335 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12613))))

(declare-fun arrayContainsKey!0 (array!38673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655021 (arrayContainsKey!0 lt!305336 (select (arr!18536 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305342 () Unit!22502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38673 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22502)

(assert (=> b!655021 (= lt!305342 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305336 (select (arr!18536 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376160 () Bool)

(assert (=> b!655021 e!376160))

(declare-fun res!424970 () Bool)

(assert (=> b!655021 (=> (not res!424970) (not e!376160))))

(assert (=> b!655021 (= res!424970 (arrayContainsKey!0 lt!305336 (select (arr!18536 a!2986) j!136) j!136))))

(declare-fun e!376147 () Unit!22502)

(declare-fun Unit!22504 () Unit!22502)

(assert (=> b!655021 (= e!376147 Unit!22504)))

(declare-fun b!655022 () Bool)

(declare-fun res!424963 () Bool)

(declare-fun e!376148 () Bool)

(assert (=> b!655022 (=> (not res!424963) (not e!376148))))

(assert (=> b!655022 (= res!424963 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655023 () Bool)

(declare-fun e!376149 () Bool)

(declare-datatypes ((SeekEntryResult!6973 0))(
  ( (MissingZero!6973 (index!30251 (_ BitVec 32))) (Found!6973 (index!30252 (_ BitVec 32))) (Intermediate!6973 (undefined!7785 Bool) (index!30253 (_ BitVec 32)) (x!59049 (_ BitVec 32))) (Undefined!6973) (MissingVacant!6973 (index!30254 (_ BitVec 32))) )
))
(declare-fun lt!305334 () SeekEntryResult!6973)

(declare-fun lt!305344 () SeekEntryResult!6973)

(assert (=> b!655023 (= e!376149 (= lt!305334 lt!305344))))

(declare-fun b!655024 () Bool)

(declare-fun res!424966 () Bool)

(assert (=> b!655024 (=> (not res!424966) (not e!376148))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!655024 (= res!424966 (and (= (size!18901 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18901 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18901 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655025 () Bool)

(declare-fun res!424958 () Bool)

(declare-fun e!376155 () Bool)

(assert (=> b!655025 (=> (not res!424958) (not e!376155))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655025 (= res!424958 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18536 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655026 () Bool)

(declare-fun res!424959 () Bool)

(assert (=> b!655026 (=> (not res!424959) (not e!376155))))

(assert (=> b!655026 (= res!424959 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12613))))

(declare-fun b!655027 () Bool)

(declare-fun res!424967 () Bool)

(assert (=> b!655027 (=> (not res!424967) (not e!376148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655027 (= res!424967 (validKeyInArray!0 (select (arr!18536 a!2986) j!136)))))

(declare-fun res!424972 () Bool)

(assert (=> start!59342 (=> (not res!424972) (not e!376148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59342 (= res!424972 (validMask!0 mask!3053))))

(assert (=> start!59342 e!376148))

(assert (=> start!59342 true))

(declare-fun array_inv!14419 (array!38673) Bool)

(assert (=> start!59342 (array_inv!14419 a!2986)))

(declare-fun b!655028 () Bool)

(declare-fun e!376159 () Bool)

(assert (=> b!655028 (= e!376159 (not true))))

(declare-fun lt!305328 () Unit!22502)

(declare-fun e!376154 () Unit!22502)

(assert (=> b!655028 (= lt!305328 e!376154)))

(declare-fun c!75401 () Bool)

(declare-fun lt!305340 () SeekEntryResult!6973)

(assert (=> b!655028 (= c!75401 (= lt!305340 (Found!6973 index!984)))))

(declare-fun lt!305345 () Unit!22502)

(declare-fun e!376153 () Unit!22502)

(assert (=> b!655028 (= lt!305345 e!376153)))

(declare-fun c!75402 () Bool)

(assert (=> b!655028 (= c!75402 (= lt!305340 Undefined!6973))))

(declare-fun lt!305337 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38673 (_ BitVec 32)) SeekEntryResult!6973)

(assert (=> b!655028 (= lt!305340 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305337 lt!305336 mask!3053))))

(assert (=> b!655028 e!376149))

(declare-fun res!424957 () Bool)

(assert (=> b!655028 (=> (not res!424957) (not e!376149))))

(declare-fun lt!305329 () (_ BitVec 32))

(assert (=> b!655028 (= res!424957 (= lt!305344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305329 vacantSpotIndex!68 lt!305337 lt!305336 mask!3053)))))

(assert (=> b!655028 (= lt!305344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305329 vacantSpotIndex!68 (select (arr!18536 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655028 (= lt!305337 (select (store (arr!18536 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305341 () Unit!22502)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22502)

(assert (=> b!655028 (= lt!305341 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305329 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655028 (= lt!305329 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655029 () Bool)

(assert (=> b!655029 false))

(declare-fun lt!305346 () Unit!22502)

(assert (=> b!655029 (= lt!305346 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305336 (select (arr!18536 a!2986) j!136) j!136 Nil!12613))))

(assert (=> b!655029 (arrayNoDuplicates!0 lt!305336 j!136 Nil!12613)))

(declare-fun lt!305338 () Unit!22502)

(assert (=> b!655029 (= lt!305338 (lemmaNoDuplicateFromThenFromBigger!0 lt!305336 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655029 (arrayNoDuplicates!0 lt!305336 #b00000000000000000000000000000000 Nil!12613)))

(declare-fun lt!305332 () Unit!22502)

(assert (=> b!655029 (= lt!305332 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12613))))

(assert (=> b!655029 (arrayContainsKey!0 lt!305336 (select (arr!18536 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305339 () Unit!22502)

(assert (=> b!655029 (= lt!305339 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305336 (select (arr!18536 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376152 () Unit!22502)

(declare-fun Unit!22505 () Unit!22502)

(assert (=> b!655029 (= e!376152 Unit!22505)))

(declare-fun b!655030 () Bool)

(declare-fun res!424961 () Bool)

(assert (=> b!655030 (=> (not res!424961) (not e!376155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38673 (_ BitVec 32)) Bool)

(assert (=> b!655030 (= res!424961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655031 () Bool)

(declare-fun res!424964 () Bool)

(assert (=> b!655031 (=> (not res!424964) (not e!376148))))

(assert (=> b!655031 (= res!424964 (validKeyInArray!0 k0!1786))))

(declare-fun b!655032 () Bool)

(declare-fun res!424971 () Bool)

(assert (=> b!655032 (= res!424971 (bvsge j!136 index!984))))

(declare-fun e!376157 () Bool)

(assert (=> b!655032 (=> res!424971 e!376157)))

(declare-fun e!376156 () Bool)

(assert (=> b!655032 (= e!376156 e!376157)))

(declare-fun b!655033 () Bool)

(assert (=> b!655033 (= e!376160 (arrayContainsKey!0 lt!305336 (select (arr!18536 a!2986) j!136) index!984))))

(declare-fun res!424965 () Bool)

(declare-fun b!655034 () Bool)

(assert (=> b!655034 (= res!424965 (arrayContainsKey!0 lt!305336 (select (arr!18536 a!2986) j!136) j!136))))

(declare-fun e!376151 () Bool)

(assert (=> b!655034 (=> (not res!424965) (not e!376151))))

(assert (=> b!655034 (= e!376157 e!376151)))

(declare-fun b!655035 () Bool)

(declare-fun Unit!22506 () Unit!22502)

(assert (=> b!655035 (= e!376153 Unit!22506)))

(declare-fun b!655036 () Bool)

(assert (=> b!655036 (= e!376151 (arrayContainsKey!0 lt!305336 (select (arr!18536 a!2986) j!136) index!984))))

(declare-fun b!655037 () Bool)

(declare-fun e!376158 () Bool)

(assert (=> b!655037 (= e!376155 e!376158)))

(declare-fun res!424960 () Bool)

(assert (=> b!655037 (=> (not res!424960) (not e!376158))))

(assert (=> b!655037 (= res!424960 (= (select (store (arr!18536 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655037 (= lt!305336 (array!38674 (store (arr!18536 a!2986) i!1108 k0!1786) (size!18901 a!2986)))))

(declare-fun b!655038 () Bool)

(declare-fun Unit!22507 () Unit!22502)

(assert (=> b!655038 (= e!376154 Unit!22507)))

(declare-fun b!655039 () Bool)

(declare-fun Unit!22508 () Unit!22502)

(assert (=> b!655039 (= e!376147 Unit!22508)))

(declare-fun b!655040 () Bool)

(declare-fun Unit!22509 () Unit!22502)

(assert (=> b!655040 (= e!376154 Unit!22509)))

(declare-fun res!424969 () Bool)

(assert (=> b!655040 (= res!424969 (= (select (store (arr!18536 a!2986) i!1108 k0!1786) index!984) (select (arr!18536 a!2986) j!136)))))

(assert (=> b!655040 (=> (not res!424969) (not e!376156))))

(assert (=> b!655040 e!376156))

(declare-fun c!75400 () Bool)

(assert (=> b!655040 (= c!75400 (bvslt j!136 index!984))))

(declare-fun lt!305327 () Unit!22502)

(assert (=> b!655040 (= lt!305327 e!376152)))

(declare-fun c!75399 () Bool)

(assert (=> b!655040 (= c!75399 (bvslt index!984 j!136))))

(declare-fun lt!305330 () Unit!22502)

(assert (=> b!655040 (= lt!305330 e!376147)))

(assert (=> b!655040 false))

(declare-fun b!655041 () Bool)

(assert (=> b!655041 (= e!376158 e!376159)))

(declare-fun res!424962 () Bool)

(assert (=> b!655041 (=> (not res!424962) (not e!376159))))

(assert (=> b!655041 (= res!424962 (and (= lt!305334 (Found!6973 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18536 a!2986) index!984) (select (arr!18536 a!2986) j!136))) (not (= (select (arr!18536 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655041 (= lt!305334 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18536 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655042 () Bool)

(assert (=> b!655042 (= e!376148 e!376155)))

(declare-fun res!424968 () Bool)

(assert (=> b!655042 (=> (not res!424968) (not e!376155))))

(declare-fun lt!305331 () SeekEntryResult!6973)

(assert (=> b!655042 (= res!424968 (or (= lt!305331 (MissingZero!6973 i!1108)) (= lt!305331 (MissingVacant!6973 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38673 (_ BitVec 32)) SeekEntryResult!6973)

(assert (=> b!655042 (= lt!305331 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655043 () Bool)

(declare-fun Unit!22510 () Unit!22502)

(assert (=> b!655043 (= e!376152 Unit!22510)))

(declare-fun b!655044 () Bool)

(declare-fun Unit!22511 () Unit!22502)

(assert (=> b!655044 (= e!376153 Unit!22511)))

(assert (=> b!655044 false))

(assert (= (and start!59342 res!424972) b!655024))

(assert (= (and b!655024 res!424966) b!655027))

(assert (= (and b!655027 res!424967) b!655031))

(assert (= (and b!655031 res!424964) b!655022))

(assert (= (and b!655022 res!424963) b!655042))

(assert (= (and b!655042 res!424968) b!655030))

(assert (= (and b!655030 res!424961) b!655026))

(assert (= (and b!655026 res!424959) b!655025))

(assert (= (and b!655025 res!424958) b!655037))

(assert (= (and b!655037 res!424960) b!655041))

(assert (= (and b!655041 res!424962) b!655028))

(assert (= (and b!655028 res!424957) b!655023))

(assert (= (and b!655028 c!75402) b!655044))

(assert (= (and b!655028 (not c!75402)) b!655035))

(assert (= (and b!655028 c!75401) b!655040))

(assert (= (and b!655028 (not c!75401)) b!655038))

(assert (= (and b!655040 res!424969) b!655032))

(assert (= (and b!655032 (not res!424971)) b!655034))

(assert (= (and b!655034 res!424965) b!655036))

(assert (= (and b!655040 c!75400) b!655029))

(assert (= (and b!655040 (not c!75400)) b!655043))

(assert (= (and b!655040 c!75399) b!655021))

(assert (= (and b!655040 (not c!75399)) b!655039))

(assert (= (and b!655021 res!424970) b!655033))

(declare-fun m!627615 () Bool)

(assert (=> b!655028 m!627615))

(declare-fun m!627617 () Bool)

(assert (=> b!655028 m!627617))

(declare-fun m!627619 () Bool)

(assert (=> b!655028 m!627619))

(declare-fun m!627621 () Bool)

(assert (=> b!655028 m!627621))

(declare-fun m!627623 () Bool)

(assert (=> b!655028 m!627623))

(assert (=> b!655028 m!627621))

(declare-fun m!627625 () Bool)

(assert (=> b!655028 m!627625))

(declare-fun m!627627 () Bool)

(assert (=> b!655028 m!627627))

(declare-fun m!627629 () Bool)

(assert (=> b!655028 m!627629))

(assert (=> b!655036 m!627621))

(assert (=> b!655036 m!627621))

(declare-fun m!627631 () Bool)

(assert (=> b!655036 m!627631))

(assert (=> b!655037 m!627623))

(declare-fun m!627633 () Bool)

(assert (=> b!655037 m!627633))

(declare-fun m!627635 () Bool)

(assert (=> b!655030 m!627635))

(assert (=> b!655029 m!627621))

(declare-fun m!627637 () Bool)

(assert (=> b!655029 m!627637))

(declare-fun m!627639 () Bool)

(assert (=> b!655029 m!627639))

(assert (=> b!655029 m!627621))

(declare-fun m!627641 () Bool)

(assert (=> b!655029 m!627641))

(declare-fun m!627643 () Bool)

(assert (=> b!655029 m!627643))

(assert (=> b!655029 m!627621))

(assert (=> b!655029 m!627621))

(declare-fun m!627645 () Bool)

(assert (=> b!655029 m!627645))

(declare-fun m!627647 () Bool)

(assert (=> b!655029 m!627647))

(declare-fun m!627649 () Bool)

(assert (=> b!655029 m!627649))

(declare-fun m!627651 () Bool)

(assert (=> b!655041 m!627651))

(assert (=> b!655041 m!627621))

(assert (=> b!655041 m!627621))

(declare-fun m!627653 () Bool)

(assert (=> b!655041 m!627653))

(declare-fun m!627655 () Bool)

(assert (=> b!655026 m!627655))

(declare-fun m!627657 () Bool)

(assert (=> b!655042 m!627657))

(assert (=> b!655027 m!627621))

(assert (=> b!655027 m!627621))

(declare-fun m!627659 () Bool)

(assert (=> b!655027 m!627659))

(declare-fun m!627661 () Bool)

(assert (=> b!655025 m!627661))

(assert (=> b!655033 m!627621))

(assert (=> b!655033 m!627621))

(assert (=> b!655033 m!627631))

(assert (=> b!655040 m!627623))

(declare-fun m!627663 () Bool)

(assert (=> b!655040 m!627663))

(assert (=> b!655040 m!627621))

(declare-fun m!627665 () Bool)

(assert (=> b!655031 m!627665))

(declare-fun m!627667 () Bool)

(assert (=> start!59342 m!627667))

(declare-fun m!627669 () Bool)

(assert (=> start!59342 m!627669))

(assert (=> b!655034 m!627621))

(assert (=> b!655034 m!627621))

(declare-fun m!627671 () Bool)

(assert (=> b!655034 m!627671))

(assert (=> b!655021 m!627621))

(assert (=> b!655021 m!627671))

(declare-fun m!627673 () Bool)

(assert (=> b!655021 m!627673))

(assert (=> b!655021 m!627621))

(assert (=> b!655021 m!627639))

(assert (=> b!655021 m!627621))

(declare-fun m!627675 () Bool)

(assert (=> b!655021 m!627675))

(assert (=> b!655021 m!627621))

(declare-fun m!627677 () Bool)

(assert (=> b!655021 m!627677))

(assert (=> b!655021 m!627621))

(declare-fun m!627679 () Bool)

(assert (=> b!655021 m!627679))

(declare-fun m!627681 () Bool)

(assert (=> b!655021 m!627681))

(assert (=> b!655021 m!627649))

(declare-fun m!627683 () Bool)

(assert (=> b!655022 m!627683))

(check-sat (not start!59342) (not b!655033) (not b!655026) (not b!655030) (not b!655041) (not b!655027) (not b!655022) (not b!655042) (not b!655036) (not b!655034) (not b!655021) (not b!655031) (not b!655028) (not b!655029))
(check-sat)
