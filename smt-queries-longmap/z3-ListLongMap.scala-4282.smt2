; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59588 () Bool)

(assert start!59588)

(declare-fun b!658579 () Bool)

(declare-fun e!378322 () Bool)

(assert (=> b!658579 (= e!378322 (not true))))

(declare-datatypes ((Unit!22892 0))(
  ( (Unit!22893) )
))
(declare-fun lt!307988 () Unit!22892)

(declare-fun e!378332 () Unit!22892)

(assert (=> b!658579 (= lt!307988 e!378332)))

(declare-fun c!76084 () Bool)

(declare-datatypes ((SeekEntryResult!7012 0))(
  ( (MissingZero!7012 (index!30413 (_ BitVec 32))) (Found!7012 (index!30414 (_ BitVec 32))) (Intermediate!7012 (undefined!7824 Bool) (index!30415 (_ BitVec 32)) (x!59210 (_ BitVec 32))) (Undefined!7012) (MissingVacant!7012 (index!30416 (_ BitVec 32))) )
))
(declare-fun lt!307980 () SeekEntryResult!7012)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658579 (= c!76084 (= lt!307980 (Found!7012 index!984)))))

(declare-fun lt!307981 () Unit!22892)

(declare-fun e!378321 () Unit!22892)

(assert (=> b!658579 (= lt!307981 e!378321)))

(declare-fun c!76085 () Bool)

(assert (=> b!658579 (= c!76085 (= lt!307980 Undefined!7012))))

(declare-fun lt!307990 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38757 0))(
  ( (array!38758 (arr!18575 (Array (_ BitVec 32) (_ BitVec 64))) (size!18940 (_ BitVec 32))) )
))
(declare-fun lt!307989 () array!38757)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38757 (_ BitVec 32)) SeekEntryResult!7012)

(assert (=> b!658579 (= lt!307980 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307990 lt!307989 mask!3053))))

(declare-fun e!378328 () Bool)

(assert (=> b!658579 e!378328))

(declare-fun res!427148 () Bool)

(assert (=> b!658579 (=> (not res!427148) (not e!378328))))

(declare-fun lt!307985 () SeekEntryResult!7012)

(declare-fun lt!307974 () (_ BitVec 32))

(assert (=> b!658579 (= res!427148 (= lt!307985 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307974 vacantSpotIndex!68 lt!307990 lt!307989 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38757)

(assert (=> b!658579 (= lt!307985 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307974 vacantSpotIndex!68 (select (arr!18575 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!658579 (= lt!307990 (select (store (arr!18575 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307984 () Unit!22892)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22892)

(assert (=> b!658579 (= lt!307984 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307974 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658579 (= lt!307974 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658580 () Bool)

(declare-fun res!427152 () Bool)

(declare-fun arrayContainsKey!0 (array!38757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658580 (= res!427152 (arrayContainsKey!0 lt!307989 (select (arr!18575 a!2986) j!136) j!136))))

(declare-fun e!378320 () Bool)

(assert (=> b!658580 (=> (not res!427152) (not e!378320))))

(declare-fun e!378331 () Bool)

(assert (=> b!658580 (= e!378331 e!378320)))

(declare-fun b!658581 () Bool)

(declare-fun res!427154 () Bool)

(declare-fun e!378329 () Bool)

(assert (=> b!658581 (=> (not res!427154) (not e!378329))))

(assert (=> b!658581 (= res!427154 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658582 () Bool)

(declare-fun res!427150 () Bool)

(assert (=> b!658582 (= res!427150 (bvsge j!136 index!984))))

(assert (=> b!658582 (=> res!427150 e!378331)))

(declare-fun e!378326 () Bool)

(assert (=> b!658582 (= e!378326 e!378331)))

(declare-fun b!658583 () Bool)

(declare-fun res!427149 () Bool)

(assert (=> b!658583 (=> (not res!427149) (not e!378329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658583 (= res!427149 (validKeyInArray!0 k0!1786))))

(declare-fun b!658584 () Bool)

(declare-fun res!427151 () Bool)

(assert (=> b!658584 (=> (not res!427151) (not e!378329))))

(assert (=> b!658584 (= res!427151 (and (= (size!18940 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18940 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18940 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658585 () Bool)

(assert (=> b!658585 false))

(declare-fun lt!307976 () Unit!22892)

(declare-datatypes ((List!12655 0))(
  ( (Nil!12652) (Cons!12651 (h!13696 (_ BitVec 64)) (t!18874 List!12655)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38757 (_ BitVec 64) (_ BitVec 32) List!12655) Unit!22892)

(assert (=> b!658585 (= lt!307976 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307989 (select (arr!18575 a!2986) j!136) index!984 Nil!12652))))

(declare-fun arrayNoDuplicates!0 (array!38757 (_ BitVec 32) List!12655) Bool)

(assert (=> b!658585 (arrayNoDuplicates!0 lt!307989 index!984 Nil!12652)))

(declare-fun lt!307987 () Unit!22892)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38757 (_ BitVec 32) (_ BitVec 32)) Unit!22892)

(assert (=> b!658585 (= lt!307987 (lemmaNoDuplicateFromThenFromBigger!0 lt!307989 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658585 (arrayNoDuplicates!0 lt!307989 #b00000000000000000000000000000000 Nil!12652)))

(declare-fun lt!307986 () Unit!22892)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38757 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12655) Unit!22892)

(assert (=> b!658585 (= lt!307986 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12652))))

(assert (=> b!658585 (arrayContainsKey!0 lt!307989 (select (arr!18575 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307991 () Unit!22892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38757 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22892)

(assert (=> b!658585 (= lt!307991 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307989 (select (arr!18575 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378323 () Bool)

(assert (=> b!658585 e!378323))

(declare-fun res!427147 () Bool)

(assert (=> b!658585 (=> (not res!427147) (not e!378323))))

(assert (=> b!658585 (= res!427147 (arrayContainsKey!0 lt!307989 (select (arr!18575 a!2986) j!136) j!136))))

(declare-fun e!378325 () Unit!22892)

(declare-fun Unit!22894 () Unit!22892)

(assert (=> b!658585 (= e!378325 Unit!22894)))

(declare-fun b!658586 () Bool)

(declare-fun e!378324 () Bool)

(assert (=> b!658586 (= e!378329 e!378324)))

(declare-fun res!427162 () Bool)

(assert (=> b!658586 (=> (not res!427162) (not e!378324))))

(declare-fun lt!307979 () SeekEntryResult!7012)

(assert (=> b!658586 (= res!427162 (or (= lt!307979 (MissingZero!7012 i!1108)) (= lt!307979 (MissingVacant!7012 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38757 (_ BitVec 32)) SeekEntryResult!7012)

(assert (=> b!658586 (= lt!307979 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658587 () Bool)

(declare-fun e!378327 () Unit!22892)

(declare-fun Unit!22895 () Unit!22892)

(assert (=> b!658587 (= e!378327 Unit!22895)))

(declare-fun b!658588 () Bool)

(declare-fun res!427159 () Bool)

(assert (=> b!658588 (=> (not res!427159) (not e!378329))))

(assert (=> b!658588 (= res!427159 (validKeyInArray!0 (select (arr!18575 a!2986) j!136)))))

(declare-fun b!658589 () Bool)

(declare-fun lt!307973 () SeekEntryResult!7012)

(assert (=> b!658589 (= e!378328 (= lt!307973 lt!307985))))

(declare-fun b!658591 () Bool)

(declare-fun res!427156 () Bool)

(assert (=> b!658591 (=> (not res!427156) (not e!378324))))

(assert (=> b!658591 (= res!427156 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12652))))

(declare-fun b!658592 () Bool)

(declare-fun res!427153 () Bool)

(assert (=> b!658592 (=> (not res!427153) (not e!378324))))

(assert (=> b!658592 (= res!427153 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18575 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658593 () Bool)

(assert (=> b!658593 (= e!378320 (arrayContainsKey!0 lt!307989 (select (arr!18575 a!2986) j!136) index!984))))

(declare-fun b!658594 () Bool)

(declare-fun Unit!22896 () Unit!22892)

(assert (=> b!658594 (= e!378321 Unit!22896)))

(assert (=> b!658594 false))

(declare-fun b!658595 () Bool)

(declare-fun e!378319 () Bool)

(assert (=> b!658595 (= e!378324 e!378319)))

(declare-fun res!427160 () Bool)

(assert (=> b!658595 (=> (not res!427160) (not e!378319))))

(assert (=> b!658595 (= res!427160 (= (select (store (arr!18575 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658595 (= lt!307989 (array!38758 (store (arr!18575 a!2986) i!1108 k0!1786) (size!18940 a!2986)))))

(declare-fun b!658596 () Bool)

(declare-fun Unit!22897 () Unit!22892)

(assert (=> b!658596 (= e!378325 Unit!22897)))

(declare-fun b!658597 () Bool)

(declare-fun Unit!22898 () Unit!22892)

(assert (=> b!658597 (= e!378332 Unit!22898)))

(declare-fun b!658590 () Bool)

(assert (=> b!658590 (= e!378319 e!378322)))

(declare-fun res!427157 () Bool)

(assert (=> b!658590 (=> (not res!427157) (not e!378322))))

(assert (=> b!658590 (= res!427157 (and (= lt!307973 (Found!7012 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18575 a!2986) index!984) (select (arr!18575 a!2986) j!136))) (not (= (select (arr!18575 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658590 (= lt!307973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18575 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!427158 () Bool)

(assert (=> start!59588 (=> (not res!427158) (not e!378329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59588 (= res!427158 (validMask!0 mask!3053))))

(assert (=> start!59588 e!378329))

(assert (=> start!59588 true))

(declare-fun array_inv!14458 (array!38757) Bool)

(assert (=> start!59588 (array_inv!14458 a!2986)))

(declare-fun b!658598 () Bool)

(declare-fun Unit!22899 () Unit!22892)

(assert (=> b!658598 (= e!378332 Unit!22899)))

(declare-fun res!427161 () Bool)

(assert (=> b!658598 (= res!427161 (= (select (store (arr!18575 a!2986) i!1108 k0!1786) index!984) (select (arr!18575 a!2986) j!136)))))

(assert (=> b!658598 (=> (not res!427161) (not e!378326))))

(assert (=> b!658598 e!378326))

(declare-fun c!76086 () Bool)

(assert (=> b!658598 (= c!76086 (bvslt j!136 index!984))))

(declare-fun lt!307978 () Unit!22892)

(assert (=> b!658598 (= lt!307978 e!378327)))

(declare-fun c!76083 () Bool)

(assert (=> b!658598 (= c!76083 (bvslt index!984 j!136))))

(declare-fun lt!307977 () Unit!22892)

(assert (=> b!658598 (= lt!307977 e!378325)))

(assert (=> b!658598 false))

(declare-fun b!658599 () Bool)

(assert (=> b!658599 false))

(declare-fun lt!307982 () Unit!22892)

(assert (=> b!658599 (= lt!307982 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307989 (select (arr!18575 a!2986) j!136) j!136 Nil!12652))))

(assert (=> b!658599 (arrayNoDuplicates!0 lt!307989 j!136 Nil!12652)))

(declare-fun lt!307992 () Unit!22892)

(assert (=> b!658599 (= lt!307992 (lemmaNoDuplicateFromThenFromBigger!0 lt!307989 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658599 (arrayNoDuplicates!0 lt!307989 #b00000000000000000000000000000000 Nil!12652)))

(declare-fun lt!307975 () Unit!22892)

(assert (=> b!658599 (= lt!307975 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12652))))

(assert (=> b!658599 (arrayContainsKey!0 lt!307989 (select (arr!18575 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307983 () Unit!22892)

(assert (=> b!658599 (= lt!307983 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307989 (select (arr!18575 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22900 () Unit!22892)

(assert (=> b!658599 (= e!378327 Unit!22900)))

(declare-fun b!658600 () Bool)

(assert (=> b!658600 (= e!378323 (arrayContainsKey!0 lt!307989 (select (arr!18575 a!2986) j!136) index!984))))

(declare-fun b!658601 () Bool)

(declare-fun res!427155 () Bool)

(assert (=> b!658601 (=> (not res!427155) (not e!378324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38757 (_ BitVec 32)) Bool)

(assert (=> b!658601 (= res!427155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658602 () Bool)

(declare-fun Unit!22901 () Unit!22892)

(assert (=> b!658602 (= e!378321 Unit!22901)))

(assert (= (and start!59588 res!427158) b!658584))

(assert (= (and b!658584 res!427151) b!658588))

(assert (= (and b!658588 res!427159) b!658583))

(assert (= (and b!658583 res!427149) b!658581))

(assert (= (and b!658581 res!427154) b!658586))

(assert (= (and b!658586 res!427162) b!658601))

(assert (= (and b!658601 res!427155) b!658591))

(assert (= (and b!658591 res!427156) b!658592))

(assert (= (and b!658592 res!427153) b!658595))

(assert (= (and b!658595 res!427160) b!658590))

(assert (= (and b!658590 res!427157) b!658579))

(assert (= (and b!658579 res!427148) b!658589))

(assert (= (and b!658579 c!76085) b!658594))

(assert (= (and b!658579 (not c!76085)) b!658602))

(assert (= (and b!658579 c!76084) b!658598))

(assert (= (and b!658579 (not c!76084)) b!658597))

(assert (= (and b!658598 res!427161) b!658582))

(assert (= (and b!658582 (not res!427150)) b!658580))

(assert (= (and b!658580 res!427152) b!658593))

(assert (= (and b!658598 c!76086) b!658599))

(assert (= (and b!658598 (not c!76086)) b!658587))

(assert (= (and b!658598 c!76083) b!658585))

(assert (= (and b!658598 (not c!76083)) b!658596))

(assert (= (and b!658585 res!427147) b!658600))

(declare-fun m!631065 () Bool)

(assert (=> b!658598 m!631065))

(declare-fun m!631067 () Bool)

(assert (=> b!658598 m!631067))

(declare-fun m!631069 () Bool)

(assert (=> b!658598 m!631069))

(declare-fun m!631071 () Bool)

(assert (=> b!658590 m!631071))

(assert (=> b!658590 m!631069))

(assert (=> b!658590 m!631069))

(declare-fun m!631073 () Bool)

(assert (=> b!658590 m!631073))

(declare-fun m!631075 () Bool)

(assert (=> b!658591 m!631075))

(declare-fun m!631077 () Bool)

(assert (=> b!658585 m!631077))

(assert (=> b!658585 m!631069))

(declare-fun m!631079 () Bool)

(assert (=> b!658585 m!631079))

(declare-fun m!631081 () Bool)

(assert (=> b!658585 m!631081))

(declare-fun m!631083 () Bool)

(assert (=> b!658585 m!631083))

(assert (=> b!658585 m!631069))

(declare-fun m!631085 () Bool)

(assert (=> b!658585 m!631085))

(assert (=> b!658585 m!631069))

(declare-fun m!631087 () Bool)

(assert (=> b!658585 m!631087))

(assert (=> b!658585 m!631069))

(declare-fun m!631089 () Bool)

(assert (=> b!658585 m!631089))

(assert (=> b!658585 m!631069))

(declare-fun m!631091 () Bool)

(assert (=> b!658585 m!631091))

(assert (=> b!658600 m!631069))

(assert (=> b!658600 m!631069))

(declare-fun m!631093 () Bool)

(assert (=> b!658600 m!631093))

(assert (=> b!658593 m!631069))

(assert (=> b!658593 m!631069))

(assert (=> b!658593 m!631093))

(assert (=> b!658595 m!631065))

(declare-fun m!631095 () Bool)

(assert (=> b!658595 m!631095))

(declare-fun m!631097 () Bool)

(assert (=> start!59588 m!631097))

(declare-fun m!631099 () Bool)

(assert (=> start!59588 m!631099))

(declare-fun m!631101 () Bool)

(assert (=> b!658586 m!631101))

(declare-fun m!631103 () Bool)

(assert (=> b!658601 m!631103))

(assert (=> b!658580 m!631069))

(assert (=> b!658580 m!631069))

(assert (=> b!658580 m!631087))

(declare-fun m!631105 () Bool)

(assert (=> b!658581 m!631105))

(assert (=> b!658579 m!631069))

(declare-fun m!631107 () Bool)

(assert (=> b!658579 m!631107))

(declare-fun m!631109 () Bool)

(assert (=> b!658579 m!631109))

(declare-fun m!631111 () Bool)

(assert (=> b!658579 m!631111))

(assert (=> b!658579 m!631069))

(assert (=> b!658579 m!631065))

(declare-fun m!631113 () Bool)

(assert (=> b!658579 m!631113))

(declare-fun m!631115 () Bool)

(assert (=> b!658579 m!631115))

(declare-fun m!631117 () Bool)

(assert (=> b!658579 m!631117))

(assert (=> b!658588 m!631069))

(assert (=> b!658588 m!631069))

(declare-fun m!631119 () Bool)

(assert (=> b!658588 m!631119))

(assert (=> b!658599 m!631069))

(declare-fun m!631121 () Bool)

(assert (=> b!658599 m!631121))

(assert (=> b!658599 m!631069))

(declare-fun m!631123 () Bool)

(assert (=> b!658599 m!631123))

(assert (=> b!658599 m!631069))

(declare-fun m!631125 () Bool)

(assert (=> b!658599 m!631125))

(assert (=> b!658599 m!631069))

(declare-fun m!631127 () Bool)

(assert (=> b!658599 m!631127))

(assert (=> b!658599 m!631081))

(declare-fun m!631129 () Bool)

(assert (=> b!658599 m!631129))

(assert (=> b!658599 m!631083))

(declare-fun m!631131 () Bool)

(assert (=> b!658583 m!631131))

(declare-fun m!631133 () Bool)

(assert (=> b!658592 m!631133))

(check-sat (not b!658580) (not b!658599) (not b!658600) (not b!658581) (not b!658588) (not b!658593) (not b!658579) (not b!658586) (not b!658590) (not b!658585) (not start!59588) (not b!658591) (not b!658601) (not b!658583))
(check-sat)
