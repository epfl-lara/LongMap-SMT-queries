; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56070 () Bool)

(assert start!56070)

(declare-fun b!617948 () Bool)

(declare-datatypes ((Unit!20288 0))(
  ( (Unit!20289) )
))
(declare-fun e!354372 () Unit!20288)

(declare-fun Unit!20290 () Unit!20288)

(assert (=> b!617948 (= e!354372 Unit!20290)))

(declare-fun res!398121 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37540 0))(
  ( (array!37541 (arr!18016 (Array (_ BitVec 32) (_ BitVec 64))) (size!18380 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37540)

(assert (=> b!617948 (= res!398121 (= (select (store (arr!18016 a!2986) i!1108 k0!1786) index!984) (select (arr!18016 a!2986) j!136)))))

(declare-fun e!354359 () Bool)

(assert (=> b!617948 (=> (not res!398121) (not e!354359))))

(assert (=> b!617948 e!354359))

(declare-fun c!70289 () Bool)

(assert (=> b!617948 (= c!70289 (bvslt j!136 index!984))))

(declare-fun lt!284726 () Unit!20288)

(declare-fun e!354364 () Unit!20288)

(assert (=> b!617948 (= lt!284726 e!354364)))

(declare-fun c!70287 () Bool)

(assert (=> b!617948 (= c!70287 (bvslt index!984 j!136))))

(declare-fun lt!284725 () Unit!20288)

(declare-fun e!354367 () Unit!20288)

(assert (=> b!617948 (= lt!284725 e!354367)))

(assert (=> b!617948 false))

(declare-fun b!617949 () Bool)

(declare-fun e!354361 () Bool)

(assert (=> b!617949 (= e!354361 true)))

(assert (=> b!617949 (= (select (store (arr!18016 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!398119 () Bool)

(declare-fun e!354360 () Bool)

(assert (=> start!56070 (=> (not res!398119) (not e!354360))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56070 (= res!398119 (validMask!0 mask!3053))))

(assert (=> start!56070 e!354360))

(assert (=> start!56070 true))

(declare-fun array_inv!13812 (array!37540) Bool)

(assert (=> start!56070 (array_inv!13812 a!2986)))

(declare-fun b!617950 () Bool)

(declare-fun e!354368 () Unit!20288)

(declare-fun Unit!20291 () Unit!20288)

(assert (=> b!617950 (= e!354368 Unit!20291)))

(assert (=> b!617950 false))

(declare-fun b!617951 () Bool)

(declare-fun Unit!20292 () Unit!20288)

(assert (=> b!617951 (= e!354368 Unit!20292)))

(declare-fun b!617952 () Bool)

(declare-fun res!398118 () Bool)

(declare-fun e!354366 () Bool)

(assert (=> b!617952 (=> (not res!398118) (not e!354366))))

(declare-datatypes ((List!12057 0))(
  ( (Nil!12054) (Cons!12053 (h!13098 (_ BitVec 64)) (t!18285 List!12057)) )
))
(declare-fun arrayNoDuplicates!0 (array!37540 (_ BitVec 32) List!12057) Bool)

(assert (=> b!617952 (= res!398118 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12054))))

(declare-fun b!617953 () Bool)

(assert (=> b!617953 false))

(declare-fun lt!284733 () array!37540)

(declare-fun lt!284737 () Unit!20288)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37540 (_ BitVec 64) (_ BitVec 32) List!12057) Unit!20288)

(assert (=> b!617953 (= lt!284737 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284733 (select (arr!18016 a!2986) j!136) index!984 Nil!12054))))

(assert (=> b!617953 (arrayNoDuplicates!0 lt!284733 index!984 Nil!12054)))

(declare-fun lt!284732 () Unit!20288)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37540 (_ BitVec 32) (_ BitVec 32)) Unit!20288)

(assert (=> b!617953 (= lt!284732 (lemmaNoDuplicateFromThenFromBigger!0 lt!284733 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617953 (arrayNoDuplicates!0 lt!284733 #b00000000000000000000000000000000 Nil!12054)))

(declare-fun lt!284720 () Unit!20288)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37540 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12057) Unit!20288)

(assert (=> b!617953 (= lt!284720 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12054))))

(declare-fun arrayContainsKey!0 (array!37540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617953 (arrayContainsKey!0 lt!284733 (select (arr!18016 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284735 () Unit!20288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37540 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20288)

(assert (=> b!617953 (= lt!284735 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284733 (select (arr!18016 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354371 () Bool)

(assert (=> b!617953 e!354371))

(declare-fun res!398115 () Bool)

(assert (=> b!617953 (=> (not res!398115) (not e!354371))))

(assert (=> b!617953 (= res!398115 (arrayContainsKey!0 lt!284733 (select (arr!18016 a!2986) j!136) j!136))))

(declare-fun Unit!20293 () Unit!20288)

(assert (=> b!617953 (= e!354367 Unit!20293)))

(declare-fun b!617954 () Bool)

(declare-fun res!398112 () Bool)

(assert (=> b!617954 (=> (not res!398112) (not e!354366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37540 (_ BitVec 32)) Bool)

(assert (=> b!617954 (= res!398112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617955 () Bool)

(declare-fun res!398114 () Bool)

(assert (=> b!617955 (= res!398114 (bvsge j!136 index!984))))

(declare-fun e!354369 () Bool)

(assert (=> b!617955 (=> res!398114 e!354369)))

(assert (=> b!617955 (= e!354359 e!354369)))

(declare-fun b!617956 () Bool)

(assert (=> b!617956 false))

(declare-fun lt!284724 () Unit!20288)

(assert (=> b!617956 (= lt!284724 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284733 (select (arr!18016 a!2986) j!136) j!136 Nil!12054))))

(assert (=> b!617956 (arrayNoDuplicates!0 lt!284733 j!136 Nil!12054)))

(declare-fun lt!284730 () Unit!20288)

(assert (=> b!617956 (= lt!284730 (lemmaNoDuplicateFromThenFromBigger!0 lt!284733 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617956 (arrayNoDuplicates!0 lt!284733 #b00000000000000000000000000000000 Nil!12054)))

(declare-fun lt!284719 () Unit!20288)

(assert (=> b!617956 (= lt!284719 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12054))))

(assert (=> b!617956 (arrayContainsKey!0 lt!284733 (select (arr!18016 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284727 () Unit!20288)

(assert (=> b!617956 (= lt!284727 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284733 (select (arr!18016 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20294 () Unit!20288)

(assert (=> b!617956 (= e!354364 Unit!20294)))

(declare-fun b!617957 () Bool)

(declare-fun e!354365 () Bool)

(assert (=> b!617957 (= e!354365 (not e!354361))))

(declare-fun res!398113 () Bool)

(assert (=> b!617957 (=> res!398113 e!354361)))

(declare-datatypes ((SeekEntryResult!6456 0))(
  ( (MissingZero!6456 (index!28108 (_ BitVec 32))) (Found!6456 (index!28109 (_ BitVec 32))) (Intermediate!6456 (undefined!7268 Bool) (index!28110 (_ BitVec 32)) (x!56896 (_ BitVec 32))) (Undefined!6456) (MissingVacant!6456 (index!28111 (_ BitVec 32))) )
))
(declare-fun lt!284731 () SeekEntryResult!6456)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617957 (= res!398113 (not (= lt!284731 (MissingVacant!6456 vacantSpotIndex!68))))))

(declare-fun lt!284723 () Unit!20288)

(assert (=> b!617957 (= lt!284723 e!354372)))

(declare-fun c!70288 () Bool)

(assert (=> b!617957 (= c!70288 (= lt!284731 (Found!6456 index!984)))))

(declare-fun lt!284722 () Unit!20288)

(assert (=> b!617957 (= lt!284722 e!354368)))

(declare-fun c!70286 () Bool)

(assert (=> b!617957 (= c!70286 (= lt!284731 Undefined!6456))))

(declare-fun lt!284736 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37540 (_ BitVec 32)) SeekEntryResult!6456)

(assert (=> b!617957 (= lt!284731 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284736 lt!284733 mask!3053))))

(declare-fun e!354362 () Bool)

(assert (=> b!617957 e!354362))

(declare-fun res!398122 () Bool)

(assert (=> b!617957 (=> (not res!398122) (not e!354362))))

(declare-fun lt!284729 () (_ BitVec 32))

(declare-fun lt!284718 () SeekEntryResult!6456)

(assert (=> b!617957 (= res!398122 (= lt!284718 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284729 vacantSpotIndex!68 lt!284736 lt!284733 mask!3053)))))

(assert (=> b!617957 (= lt!284718 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284729 vacantSpotIndex!68 (select (arr!18016 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617957 (= lt!284736 (select (store (arr!18016 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284728 () Unit!20288)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37540 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20288)

(assert (=> b!617957 (= lt!284728 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284729 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617957 (= lt!284729 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617958 () Bool)

(declare-fun res!398126 () Bool)

(assert (=> b!617958 (=> (not res!398126) (not e!354360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617958 (= res!398126 (validKeyInArray!0 (select (arr!18016 a!2986) j!136)))))

(declare-fun b!617959 () Bool)

(declare-fun e!354358 () Bool)

(assert (=> b!617959 (= e!354358 (arrayContainsKey!0 lt!284733 (select (arr!18016 a!2986) j!136) index!984))))

(declare-fun b!617960 () Bool)

(assert (=> b!617960 (= e!354371 (arrayContainsKey!0 lt!284733 (select (arr!18016 a!2986) j!136) index!984))))

(declare-fun b!617961 () Bool)

(declare-fun Unit!20295 () Unit!20288)

(assert (=> b!617961 (= e!354372 Unit!20295)))

(declare-fun b!617962 () Bool)

(declare-fun res!398116 () Bool)

(assert (=> b!617962 (=> (not res!398116) (not e!354366))))

(assert (=> b!617962 (= res!398116 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18016 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617963 () Bool)

(declare-fun e!354370 () Bool)

(assert (=> b!617963 (= e!354366 e!354370)))

(declare-fun res!398110 () Bool)

(assert (=> b!617963 (=> (not res!398110) (not e!354370))))

(assert (=> b!617963 (= res!398110 (= (select (store (arr!18016 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617963 (= lt!284733 (array!37541 (store (arr!18016 a!2986) i!1108 k0!1786) (size!18380 a!2986)))))

(declare-fun b!617964 () Bool)

(declare-fun Unit!20296 () Unit!20288)

(assert (=> b!617964 (= e!354364 Unit!20296)))

(declare-fun b!617965 () Bool)

(assert (=> b!617965 (= e!354370 e!354365)))

(declare-fun res!398111 () Bool)

(assert (=> b!617965 (=> (not res!398111) (not e!354365))))

(declare-fun lt!284721 () SeekEntryResult!6456)

(assert (=> b!617965 (= res!398111 (and (= lt!284721 (Found!6456 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18016 a!2986) index!984) (select (arr!18016 a!2986) j!136))) (not (= (select (arr!18016 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617965 (= lt!284721 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18016 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617966 () Bool)

(declare-fun res!398117 () Bool)

(assert (=> b!617966 (=> (not res!398117) (not e!354360))))

(assert (=> b!617966 (= res!398117 (and (= (size!18380 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18380 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18380 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617967 () Bool)

(assert (=> b!617967 (= e!354360 e!354366)))

(declare-fun res!398124 () Bool)

(assert (=> b!617967 (=> (not res!398124) (not e!354366))))

(declare-fun lt!284734 () SeekEntryResult!6456)

(assert (=> b!617967 (= res!398124 (or (= lt!284734 (MissingZero!6456 i!1108)) (= lt!284734 (MissingVacant!6456 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37540 (_ BitVec 32)) SeekEntryResult!6456)

(assert (=> b!617967 (= lt!284734 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617968 () Bool)

(declare-fun res!398125 () Bool)

(assert (=> b!617968 (= res!398125 (arrayContainsKey!0 lt!284733 (select (arr!18016 a!2986) j!136) j!136))))

(assert (=> b!617968 (=> (not res!398125) (not e!354358))))

(assert (=> b!617968 (= e!354369 e!354358)))

(declare-fun b!617969 () Bool)

(declare-fun Unit!20297 () Unit!20288)

(assert (=> b!617969 (= e!354367 Unit!20297)))

(declare-fun b!617970 () Bool)

(declare-fun res!398120 () Bool)

(assert (=> b!617970 (=> (not res!398120) (not e!354360))))

(assert (=> b!617970 (= res!398120 (validKeyInArray!0 k0!1786))))

(declare-fun b!617971 () Bool)

(declare-fun res!398123 () Bool)

(assert (=> b!617971 (=> (not res!398123) (not e!354360))))

(assert (=> b!617971 (= res!398123 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617972 () Bool)

(assert (=> b!617972 (= e!354362 (= lt!284721 lt!284718))))

(assert (= (and start!56070 res!398119) b!617966))

(assert (= (and b!617966 res!398117) b!617958))

(assert (= (and b!617958 res!398126) b!617970))

(assert (= (and b!617970 res!398120) b!617971))

(assert (= (and b!617971 res!398123) b!617967))

(assert (= (and b!617967 res!398124) b!617954))

(assert (= (and b!617954 res!398112) b!617952))

(assert (= (and b!617952 res!398118) b!617962))

(assert (= (and b!617962 res!398116) b!617963))

(assert (= (and b!617963 res!398110) b!617965))

(assert (= (and b!617965 res!398111) b!617957))

(assert (= (and b!617957 res!398122) b!617972))

(assert (= (and b!617957 c!70286) b!617950))

(assert (= (and b!617957 (not c!70286)) b!617951))

(assert (= (and b!617957 c!70288) b!617948))

(assert (= (and b!617957 (not c!70288)) b!617961))

(assert (= (and b!617948 res!398121) b!617955))

(assert (= (and b!617955 (not res!398114)) b!617968))

(assert (= (and b!617968 res!398125) b!617959))

(assert (= (and b!617948 c!70289) b!617956))

(assert (= (and b!617948 (not c!70289)) b!617964))

(assert (= (and b!617948 c!70287) b!617953))

(assert (= (and b!617948 (not c!70287)) b!617969))

(assert (= (and b!617953 res!398115) b!617960))

(assert (= (and b!617957 (not res!398113)) b!617949))

(declare-fun m!594021 () Bool)

(assert (=> b!617958 m!594021))

(assert (=> b!617958 m!594021))

(declare-fun m!594023 () Bool)

(assert (=> b!617958 m!594023))

(declare-fun m!594025 () Bool)

(assert (=> b!617949 m!594025))

(declare-fun m!594027 () Bool)

(assert (=> b!617949 m!594027))

(declare-fun m!594029 () Bool)

(assert (=> b!617962 m!594029))

(declare-fun m!594031 () Bool)

(assert (=> b!617954 m!594031))

(declare-fun m!594033 () Bool)

(assert (=> b!617970 m!594033))

(assert (=> b!617953 m!594021))

(assert (=> b!617953 m!594021))

(declare-fun m!594035 () Bool)

(assert (=> b!617953 m!594035))

(declare-fun m!594037 () Bool)

(assert (=> b!617953 m!594037))

(assert (=> b!617953 m!594021))

(declare-fun m!594039 () Bool)

(assert (=> b!617953 m!594039))

(declare-fun m!594041 () Bool)

(assert (=> b!617953 m!594041))

(declare-fun m!594043 () Bool)

(assert (=> b!617953 m!594043))

(assert (=> b!617953 m!594021))

(declare-fun m!594045 () Bool)

(assert (=> b!617953 m!594045))

(declare-fun m!594047 () Bool)

(assert (=> b!617953 m!594047))

(assert (=> b!617953 m!594021))

(declare-fun m!594049 () Bool)

(assert (=> b!617953 m!594049))

(declare-fun m!594051 () Bool)

(assert (=> b!617956 m!594051))

(assert (=> b!617956 m!594047))

(assert (=> b!617956 m!594021))

(declare-fun m!594053 () Bool)

(assert (=> b!617956 m!594053))

(assert (=> b!617956 m!594021))

(declare-fun m!594055 () Bool)

(assert (=> b!617956 m!594055))

(declare-fun m!594057 () Bool)

(assert (=> b!617956 m!594057))

(assert (=> b!617956 m!594041))

(assert (=> b!617956 m!594021))

(assert (=> b!617956 m!594021))

(declare-fun m!594059 () Bool)

(assert (=> b!617956 m!594059))

(declare-fun m!594061 () Bool)

(assert (=> b!617971 m!594061))

(assert (=> b!617959 m!594021))

(assert (=> b!617959 m!594021))

(declare-fun m!594063 () Bool)

(assert (=> b!617959 m!594063))

(assert (=> b!617963 m!594025))

(declare-fun m!594065 () Bool)

(assert (=> b!617963 m!594065))

(assert (=> b!617957 m!594021))

(assert (=> b!617957 m!594025))

(declare-fun m!594067 () Bool)

(assert (=> b!617957 m!594067))

(assert (=> b!617957 m!594021))

(declare-fun m!594069 () Bool)

(assert (=> b!617957 m!594069))

(declare-fun m!594071 () Bool)

(assert (=> b!617957 m!594071))

(declare-fun m!594073 () Bool)

(assert (=> b!617957 m!594073))

(declare-fun m!594075 () Bool)

(assert (=> b!617957 m!594075))

(declare-fun m!594077 () Bool)

(assert (=> b!617957 m!594077))

(declare-fun m!594079 () Bool)

(assert (=> b!617967 m!594079))

(declare-fun m!594081 () Bool)

(assert (=> b!617952 m!594081))

(assert (=> b!617948 m!594025))

(assert (=> b!617948 m!594027))

(assert (=> b!617948 m!594021))

(declare-fun m!594083 () Bool)

(assert (=> b!617965 m!594083))

(assert (=> b!617965 m!594021))

(assert (=> b!617965 m!594021))

(declare-fun m!594085 () Bool)

(assert (=> b!617965 m!594085))

(assert (=> b!617968 m!594021))

(assert (=> b!617968 m!594021))

(assert (=> b!617968 m!594049))

(assert (=> b!617960 m!594021))

(assert (=> b!617960 m!594021))

(assert (=> b!617960 m!594063))

(declare-fun m!594087 () Bool)

(assert (=> start!56070 m!594087))

(declare-fun m!594089 () Bool)

(assert (=> start!56070 m!594089))

(check-sat (not b!617953) (not b!617956) (not start!56070) (not b!617971) (not b!617960) (not b!617958) (not b!617957) (not b!617967) (not b!617965) (not b!617952) (not b!617959) (not b!617970) (not b!617954) (not b!617968))
(check-sat)
