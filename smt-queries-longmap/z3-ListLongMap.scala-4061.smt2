; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55578 () Bool)

(assert start!55578)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!348749 () Bool)

(declare-datatypes ((array!37323 0))(
  ( (array!37324 (arr!17912 (Array (_ BitVec 32) (_ BitVec 64))) (size!18277 (_ BitVec 32))) )
))
(declare-fun lt!278237 () array!37323)

(declare-fun b!608969 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37323)

(declare-fun arrayContainsKey!0 (array!37323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608969 (= e!348749 (arrayContainsKey!0 lt!278237 (select (arr!17912 a!2986) j!136) index!984))))

(declare-fun b!608970 () Bool)

(declare-fun res!391663 () Bool)

(declare-fun e!348757 () Bool)

(assert (=> b!608970 (=> (not res!391663) (not e!348757))))

(declare-datatypes ((List!11992 0))(
  ( (Nil!11989) (Cons!11988 (h!13033 (_ BitVec 64)) (t!18211 List!11992)) )
))
(declare-fun arrayNoDuplicates!0 (array!37323 (_ BitVec 32) List!11992) Bool)

(assert (=> b!608970 (= res!391663 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11989))))

(declare-fun b!608971 () Bool)

(declare-datatypes ((Unit!19476 0))(
  ( (Unit!19477) )
))
(declare-fun e!348754 () Unit!19476)

(declare-fun Unit!19478 () Unit!19476)

(assert (=> b!608971 (= e!348754 Unit!19478)))

(assert (=> b!608971 false))

(declare-fun b!608972 () Bool)

(declare-fun e!348744 () Bool)

(declare-fun e!348747 () Bool)

(assert (=> b!608972 (= e!348744 e!348747)))

(declare-fun res!391670 () Bool)

(assert (=> b!608972 (=> res!391670 e!348747)))

(assert (=> b!608972 (= res!391670 (or (bvsge (size!18277 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18277 a!2986))))))

(assert (=> b!608972 (arrayContainsKey!0 lt!278237 (select (arr!17912 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278238 () Unit!19476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19476)

(assert (=> b!608972 (= lt!278238 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278237 (select (arr!17912 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608972 e!348749))

(declare-fun res!391679 () Bool)

(assert (=> b!608972 (=> (not res!391679) (not e!348749))))

(assert (=> b!608972 (= res!391679 (arrayContainsKey!0 lt!278237 (select (arr!17912 a!2986) j!136) j!136))))

(declare-fun b!608973 () Bool)

(declare-fun res!391683 () Bool)

(assert (=> b!608973 (=> (not res!391683) (not e!348757))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608973 (= res!391683 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17912 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608974 () Bool)

(declare-fun res!391672 () Bool)

(declare-fun e!348752 () Bool)

(assert (=> b!608974 (=> (not res!391672) (not e!348752))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608974 (= res!391672 (and (= (size!18277 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18277 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18277 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608975 () Bool)

(declare-fun res!391668 () Bool)

(assert (=> b!608975 (=> (not res!391668) (not e!348752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608975 (= res!391668 (validKeyInArray!0 (select (arr!17912 a!2986) j!136)))))

(declare-fun b!608976 () Bool)

(declare-fun res!391681 () Bool)

(assert (=> b!608976 (=> (not res!391681) (not e!348757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37323 (_ BitVec 32)) Bool)

(assert (=> b!608976 (= res!391681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608977 () Bool)

(declare-fun res!391677 () Bool)

(assert (=> b!608977 (=> (not res!391677) (not e!348752))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!608977 (= res!391677 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608978 () Bool)

(assert (=> b!608978 (= e!348752 e!348757)))

(declare-fun res!391675 () Bool)

(assert (=> b!608978 (=> (not res!391675) (not e!348757))))

(declare-datatypes ((SeekEntryResult!6349 0))(
  ( (MissingZero!6349 (index!27671 (_ BitVec 32))) (Found!6349 (index!27672 (_ BitVec 32))) (Intermediate!6349 (undefined!7161 Bool) (index!27673 (_ BitVec 32)) (x!56485 (_ BitVec 32))) (Undefined!6349) (MissingVacant!6349 (index!27674 (_ BitVec 32))) )
))
(declare-fun lt!278226 () SeekEntryResult!6349)

(assert (=> b!608978 (= res!391675 (or (= lt!278226 (MissingZero!6349 i!1108)) (= lt!278226 (MissingVacant!6349 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37323 (_ BitVec 32)) SeekEntryResult!6349)

(assert (=> b!608978 (= lt!278226 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608979 () Bool)

(declare-fun res!391685 () Bool)

(assert (=> b!608979 (=> res!391685 e!348747)))

(declare-fun contains!3014 (List!11992 (_ BitVec 64)) Bool)

(assert (=> b!608979 (= res!391685 (contains!3014 Nil!11989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608980 () Bool)

(declare-fun e!348750 () Bool)

(declare-fun e!348746 () Bool)

(assert (=> b!608980 (= e!348750 (not e!348746))))

(declare-fun res!391667 () Bool)

(assert (=> b!608980 (=> res!391667 e!348746)))

(declare-fun lt!278230 () SeekEntryResult!6349)

(assert (=> b!608980 (= res!391667 (not (= lt!278230 (Found!6349 index!984))))))

(declare-fun lt!278239 () Unit!19476)

(assert (=> b!608980 (= lt!278239 e!348754)))

(declare-fun c!69021 () Bool)

(assert (=> b!608980 (= c!69021 (= lt!278230 Undefined!6349))))

(declare-fun lt!278235 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37323 (_ BitVec 32)) SeekEntryResult!6349)

(assert (=> b!608980 (= lt!278230 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278235 lt!278237 mask!3053))))

(declare-fun e!348755 () Bool)

(assert (=> b!608980 e!348755))

(declare-fun res!391664 () Bool)

(assert (=> b!608980 (=> (not res!391664) (not e!348755))))

(declare-fun lt!278223 () (_ BitVec 32))

(declare-fun lt!278232 () SeekEntryResult!6349)

(assert (=> b!608980 (= res!391664 (= lt!278232 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278223 vacantSpotIndex!68 lt!278235 lt!278237 mask!3053)))))

(assert (=> b!608980 (= lt!278232 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278223 vacantSpotIndex!68 (select (arr!17912 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608980 (= lt!278235 (select (store (arr!17912 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278233 () Unit!19476)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19476)

(assert (=> b!608980 (= lt!278233 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278223 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608980 (= lt!278223 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608981 () Bool)

(declare-fun e!348758 () Unit!19476)

(declare-fun Unit!19479 () Unit!19476)

(assert (=> b!608981 (= e!348758 Unit!19479)))

(declare-fun lt!278227 () Unit!19476)

(assert (=> b!608981 (= lt!278227 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278237 (select (arr!17912 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608981 (arrayContainsKey!0 lt!278237 (select (arr!17912 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278231 () Unit!19476)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11992) Unit!19476)

(assert (=> b!608981 (= lt!278231 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11989))))

(assert (=> b!608981 (arrayNoDuplicates!0 lt!278237 #b00000000000000000000000000000000 Nil!11989)))

(declare-fun lt!278234 () Unit!19476)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37323 (_ BitVec 32) (_ BitVec 32)) Unit!19476)

(assert (=> b!608981 (= lt!278234 (lemmaNoDuplicateFromThenFromBigger!0 lt!278237 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608981 (arrayNoDuplicates!0 lt!278237 j!136 Nil!11989)))

(declare-fun lt!278225 () Unit!19476)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37323 (_ BitVec 64) (_ BitVec 32) List!11992) Unit!19476)

(assert (=> b!608981 (= lt!278225 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278237 (select (arr!17912 a!2986) j!136) j!136 Nil!11989))))

(assert (=> b!608981 false))

(declare-fun b!608982 () Bool)

(declare-fun e!348751 () Bool)

(assert (=> b!608982 (= e!348757 e!348751)))

(declare-fun res!391678 () Bool)

(assert (=> b!608982 (=> (not res!391678) (not e!348751))))

(assert (=> b!608982 (= res!391678 (= (select (store (arr!17912 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608982 (= lt!278237 (array!37324 (store (arr!17912 a!2986) i!1108 k0!1786) (size!18277 a!2986)))))

(declare-fun b!608983 () Bool)

(declare-fun e!348745 () Bool)

(declare-fun e!348756 () Bool)

(assert (=> b!608983 (= e!348745 e!348756)))

(declare-fun res!391674 () Bool)

(assert (=> b!608983 (=> res!391674 e!348756)))

(declare-fun lt!278236 () (_ BitVec 64))

(assert (=> b!608983 (= res!391674 (or (not (= (select (arr!17912 a!2986) j!136) lt!278235)) (not (= (select (arr!17912 a!2986) j!136) lt!278236)) (bvsge j!136 index!984)))))

(declare-fun b!608984 () Bool)

(assert (=> b!608984 (= e!348751 e!348750)))

(declare-fun res!391684 () Bool)

(assert (=> b!608984 (=> (not res!391684) (not e!348750))))

(declare-fun lt!278224 () SeekEntryResult!6349)

(assert (=> b!608984 (= res!391684 (and (= lt!278224 (Found!6349 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17912 a!2986) index!984) (select (arr!17912 a!2986) j!136))) (not (= (select (arr!17912 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608984 (= lt!278224 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17912 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608985 () Bool)

(declare-fun res!391676 () Bool)

(assert (=> b!608985 (=> (not res!391676) (not e!348752))))

(assert (=> b!608985 (= res!391676 (validKeyInArray!0 k0!1786))))

(declare-fun res!391680 () Bool)

(assert (=> start!55578 (=> (not res!391680) (not e!348752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55578 (= res!391680 (validMask!0 mask!3053))))

(assert (=> start!55578 e!348752))

(assert (=> start!55578 true))

(declare-fun array_inv!13795 (array!37323) Bool)

(assert (=> start!55578 (array_inv!13795 a!2986)))

(declare-fun e!348748 () Bool)

(declare-fun b!608986 () Bool)

(assert (=> b!608986 (= e!348748 (arrayContainsKey!0 lt!278237 (select (arr!17912 a!2986) j!136) index!984))))

(declare-fun b!608987 () Bool)

(assert (=> b!608987 (= e!348755 (= lt!278224 lt!278232))))

(declare-fun b!608988 () Bool)

(assert (=> b!608988 (= e!348756 e!348748)))

(declare-fun res!391682 () Bool)

(assert (=> b!608988 (=> (not res!391682) (not e!348748))))

(assert (=> b!608988 (= res!391682 (arrayContainsKey!0 lt!278237 (select (arr!17912 a!2986) j!136) j!136))))

(declare-fun b!608989 () Bool)

(declare-fun Unit!19480 () Unit!19476)

(assert (=> b!608989 (= e!348754 Unit!19480)))

(declare-fun b!608990 () Bool)

(declare-fun Unit!19481 () Unit!19476)

(assert (=> b!608990 (= e!348758 Unit!19481)))

(declare-fun b!608991 () Bool)

(assert (=> b!608991 (= e!348747 true)))

(declare-fun lt!278228 () Bool)

(assert (=> b!608991 (= lt!278228 (contains!3014 Nil!11989 k0!1786))))

(declare-fun b!608992 () Bool)

(declare-fun res!391671 () Bool)

(assert (=> b!608992 (=> res!391671 e!348747)))

(declare-fun noDuplicate!341 (List!11992) Bool)

(assert (=> b!608992 (= res!391671 (not (noDuplicate!341 Nil!11989)))))

(declare-fun b!608993 () Bool)

(declare-fun e!348753 () Bool)

(assert (=> b!608993 (= e!348753 e!348744)))

(declare-fun res!391665 () Bool)

(assert (=> b!608993 (=> res!391665 e!348744)))

(assert (=> b!608993 (= res!391665 (bvsge index!984 j!136))))

(declare-fun lt!278229 () Unit!19476)

(assert (=> b!608993 (= lt!278229 e!348758)))

(declare-fun c!69020 () Bool)

(assert (=> b!608993 (= c!69020 (bvslt j!136 index!984))))

(declare-fun b!608994 () Bool)

(assert (=> b!608994 (= e!348746 e!348753)))

(declare-fun res!391669 () Bool)

(assert (=> b!608994 (=> res!391669 e!348753)))

(assert (=> b!608994 (= res!391669 (or (not (= (select (arr!17912 a!2986) j!136) lt!278235)) (not (= (select (arr!17912 a!2986) j!136) lt!278236))))))

(assert (=> b!608994 e!348745))

(declare-fun res!391673 () Bool)

(assert (=> b!608994 (=> (not res!391673) (not e!348745))))

(assert (=> b!608994 (= res!391673 (= lt!278236 (select (arr!17912 a!2986) j!136)))))

(assert (=> b!608994 (= lt!278236 (select (store (arr!17912 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608995 () Bool)

(declare-fun res!391666 () Bool)

(assert (=> b!608995 (=> res!391666 e!348747)))

(assert (=> b!608995 (= res!391666 (contains!3014 Nil!11989 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!55578 res!391680) b!608974))

(assert (= (and b!608974 res!391672) b!608975))

(assert (= (and b!608975 res!391668) b!608985))

(assert (= (and b!608985 res!391676) b!608977))

(assert (= (and b!608977 res!391677) b!608978))

(assert (= (and b!608978 res!391675) b!608976))

(assert (= (and b!608976 res!391681) b!608970))

(assert (= (and b!608970 res!391663) b!608973))

(assert (= (and b!608973 res!391683) b!608982))

(assert (= (and b!608982 res!391678) b!608984))

(assert (= (and b!608984 res!391684) b!608980))

(assert (= (and b!608980 res!391664) b!608987))

(assert (= (and b!608980 c!69021) b!608971))

(assert (= (and b!608980 (not c!69021)) b!608989))

(assert (= (and b!608980 (not res!391667)) b!608994))

(assert (= (and b!608994 res!391673) b!608983))

(assert (= (and b!608983 (not res!391674)) b!608988))

(assert (= (and b!608988 res!391682) b!608986))

(assert (= (and b!608994 (not res!391669)) b!608993))

(assert (= (and b!608993 c!69020) b!608981))

(assert (= (and b!608993 (not c!69020)) b!608990))

(assert (= (and b!608993 (not res!391665)) b!608972))

(assert (= (and b!608972 res!391679) b!608969))

(assert (= (and b!608972 (not res!391670)) b!608992))

(assert (= (and b!608992 (not res!391671)) b!608979))

(assert (= (and b!608979 (not res!391685)) b!608995))

(assert (= (and b!608995 (not res!391666)) b!608991))

(declare-fun m!585007 () Bool)

(assert (=> b!608992 m!585007))

(declare-fun m!585009 () Bool)

(assert (=> b!608969 m!585009))

(assert (=> b!608969 m!585009))

(declare-fun m!585011 () Bool)

(assert (=> b!608969 m!585011))

(assert (=> b!608988 m!585009))

(assert (=> b!608988 m!585009))

(declare-fun m!585013 () Bool)

(assert (=> b!608988 m!585013))

(assert (=> b!608986 m!585009))

(assert (=> b!608986 m!585009))

(assert (=> b!608986 m!585011))

(declare-fun m!585015 () Bool)

(assert (=> b!608970 m!585015))

(declare-fun m!585017 () Bool)

(assert (=> b!608978 m!585017))

(assert (=> b!608994 m!585009))

(declare-fun m!585019 () Bool)

(assert (=> b!608994 m!585019))

(declare-fun m!585021 () Bool)

(assert (=> b!608994 m!585021))

(assert (=> b!608982 m!585019))

(declare-fun m!585023 () Bool)

(assert (=> b!608982 m!585023))

(declare-fun m!585025 () Bool)

(assert (=> b!608976 m!585025))

(assert (=> b!608983 m!585009))

(declare-fun m!585027 () Bool)

(assert (=> b!608984 m!585027))

(assert (=> b!608984 m!585009))

(assert (=> b!608984 m!585009))

(declare-fun m!585029 () Bool)

(assert (=> b!608984 m!585029))

(declare-fun m!585031 () Bool)

(assert (=> b!608991 m!585031))

(assert (=> b!608972 m!585009))

(assert (=> b!608972 m!585009))

(declare-fun m!585033 () Bool)

(assert (=> b!608972 m!585033))

(assert (=> b!608972 m!585009))

(declare-fun m!585035 () Bool)

(assert (=> b!608972 m!585035))

(assert (=> b!608972 m!585009))

(assert (=> b!608972 m!585013))

(declare-fun m!585037 () Bool)

(assert (=> b!608973 m!585037))

(declare-fun m!585039 () Bool)

(assert (=> b!608979 m!585039))

(assert (=> b!608975 m!585009))

(assert (=> b!608975 m!585009))

(declare-fun m!585041 () Bool)

(assert (=> b!608975 m!585041))

(assert (=> b!608981 m!585009))

(declare-fun m!585043 () Bool)

(assert (=> b!608981 m!585043))

(assert (=> b!608981 m!585009))

(declare-fun m!585045 () Bool)

(assert (=> b!608981 m!585045))

(declare-fun m!585047 () Bool)

(assert (=> b!608981 m!585047))

(assert (=> b!608981 m!585009))

(declare-fun m!585049 () Bool)

(assert (=> b!608981 m!585049))

(assert (=> b!608981 m!585009))

(declare-fun m!585051 () Bool)

(assert (=> b!608981 m!585051))

(declare-fun m!585053 () Bool)

(assert (=> b!608981 m!585053))

(declare-fun m!585055 () Bool)

(assert (=> b!608981 m!585055))

(declare-fun m!585057 () Bool)

(assert (=> b!608985 m!585057))

(declare-fun m!585059 () Bool)

(assert (=> b!608995 m!585059))

(declare-fun m!585061 () Bool)

(assert (=> b!608977 m!585061))

(declare-fun m!585063 () Bool)

(assert (=> b!608980 m!585063))

(declare-fun m!585065 () Bool)

(assert (=> b!608980 m!585065))

(assert (=> b!608980 m!585009))

(assert (=> b!608980 m!585019))

(declare-fun m!585067 () Bool)

(assert (=> b!608980 m!585067))

(declare-fun m!585069 () Bool)

(assert (=> b!608980 m!585069))

(declare-fun m!585071 () Bool)

(assert (=> b!608980 m!585071))

(assert (=> b!608980 m!585009))

(declare-fun m!585073 () Bool)

(assert (=> b!608980 m!585073))

(declare-fun m!585075 () Bool)

(assert (=> start!55578 m!585075))

(declare-fun m!585077 () Bool)

(assert (=> start!55578 m!585077))

(check-sat (not b!608972) (not b!608979) (not b!608986) (not b!608981) (not b!608969) (not b!608984) (not b!608976) (not b!608977) (not b!608970) (not b!608995) (not b!608978) (not b!608992) (not b!608985) (not start!55578) (not b!608991) (not b!608988) (not b!608975) (not b!608980))
(check-sat)
