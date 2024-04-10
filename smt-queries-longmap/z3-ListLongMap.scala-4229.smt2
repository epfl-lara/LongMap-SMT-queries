; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58228 () Bool)

(assert start!58228)

(declare-fun b!643199 () Bool)

(declare-fun e!368418 () Bool)

(declare-fun e!368415 () Bool)

(assert (=> b!643199 (= e!368418 e!368415)))

(declare-fun res!416646 () Bool)

(assert (=> b!643199 (=> (not res!416646) (not e!368415))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6858 0))(
  ( (MissingZero!6858 (index!29761 (_ BitVec 32))) (Found!6858 (index!29762 (_ BitVec 32))) (Intermediate!6858 (undefined!7670 Bool) (index!29763 (_ BitVec 32)) (x!58529 (_ BitVec 32))) (Undefined!6858) (MissingVacant!6858 (index!29764 (_ BitVec 32))) )
))
(declare-fun lt!297960 () SeekEntryResult!6858)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38406 0))(
  ( (array!38407 (arr!18418 (Array (_ BitVec 32) (_ BitVec 64))) (size!18782 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38406)

(assert (=> b!643199 (= res!416646 (and (= lt!297960 (Found!6858 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18418 a!2986) index!984) (select (arr!18418 a!2986) j!136))) (not (= (select (arr!18418 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38406 (_ BitVec 32)) SeekEntryResult!6858)

(assert (=> b!643199 (= lt!297960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643200 () Bool)

(declare-fun res!416638 () Bool)

(declare-fun e!368411 () Bool)

(assert (=> b!643200 (=> (not res!416638) (not e!368411))))

(assert (=> b!643200 (= res!416638 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18418 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643201 () Bool)

(declare-fun e!368417 () Bool)

(declare-fun e!368408 () Bool)

(assert (=> b!643201 (= e!368417 e!368408)))

(declare-fun res!416654 () Bool)

(assert (=> b!643201 (=> res!416654 e!368408)))

(declare-fun lt!297969 () (_ BitVec 64))

(declare-fun lt!297973 () (_ BitVec 64))

(assert (=> b!643201 (= res!416654 (or (not (= (select (arr!18418 a!2986) j!136) lt!297973)) (not (= (select (arr!18418 a!2986) j!136) lt!297969)) (bvsge j!136 index!984)))))

(declare-fun b!643202 () Bool)

(declare-fun res!416641 () Bool)

(assert (=> b!643202 (=> (not res!416641) (not e!368411))))

(declare-datatypes ((List!12459 0))(
  ( (Nil!12456) (Cons!12455 (h!13500 (_ BitVec 64)) (t!18687 List!12459)) )
))
(declare-fun arrayNoDuplicates!0 (array!38406 (_ BitVec 32) List!12459) Bool)

(assert (=> b!643202 (= res!416641 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12456))))

(declare-fun e!368421 () Bool)

(declare-fun lt!297961 () array!38406)

(declare-fun b!643203 () Bool)

(declare-fun arrayContainsKey!0 (array!38406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643203 (= e!368421 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) index!984))))

(declare-fun b!643204 () Bool)

(declare-fun res!416648 () Bool)

(declare-fun e!368414 () Bool)

(assert (=> b!643204 (=> (not res!416648) (not e!368414))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!643204 (= res!416648 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643205 () Bool)

(declare-fun res!416652 () Bool)

(assert (=> b!643205 (=> (not res!416652) (not e!368414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643205 (= res!416652 (validKeyInArray!0 k0!1786))))

(declare-fun b!643206 () Bool)

(declare-datatypes ((Unit!21774 0))(
  ( (Unit!21775) )
))
(declare-fun e!368416 () Unit!21774)

(declare-fun Unit!21776 () Unit!21774)

(assert (=> b!643206 (= e!368416 Unit!21776)))

(declare-fun b!643208 () Bool)

(declare-fun e!368420 () Bool)

(declare-fun e!368410 () Bool)

(assert (=> b!643208 (= e!368420 e!368410)))

(declare-fun res!416644 () Bool)

(assert (=> b!643208 (=> res!416644 e!368410)))

(assert (=> b!643208 (= res!416644 (or (not (= (select (arr!18418 a!2986) j!136) lt!297973)) (not (= (select (arr!18418 a!2986) j!136) lt!297969))))))

(assert (=> b!643208 e!368417))

(declare-fun res!416637 () Bool)

(assert (=> b!643208 (=> (not res!416637) (not e!368417))))

(assert (=> b!643208 (= res!416637 (= lt!297969 (select (arr!18418 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643208 (= lt!297969 (select (store (arr!18418 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643209 () Bool)

(declare-fun Unit!21777 () Unit!21774)

(assert (=> b!643209 (= e!368416 Unit!21777)))

(assert (=> b!643209 false))

(declare-fun b!643210 () Bool)

(assert (=> b!643210 (= e!368411 e!368418)))

(declare-fun res!416649 () Bool)

(assert (=> b!643210 (=> (not res!416649) (not e!368418))))

(assert (=> b!643210 (= res!416649 (= (select (store (arr!18418 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643210 (= lt!297961 (array!38407 (store (arr!18418 a!2986) i!1108 k0!1786) (size!18782 a!2986)))))

(declare-fun b!643211 () Bool)

(declare-fun e!368413 () Unit!21774)

(declare-fun Unit!21778 () Unit!21774)

(assert (=> b!643211 (= e!368413 Unit!21778)))

(declare-fun lt!297964 () Unit!21774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38406 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21774)

(assert (=> b!643211 (= lt!297964 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297961 (select (arr!18418 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643211 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297966 () Unit!21774)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38406 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12459) Unit!21774)

(assert (=> b!643211 (= lt!297966 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12456))))

(assert (=> b!643211 (arrayNoDuplicates!0 lt!297961 #b00000000000000000000000000000000 Nil!12456)))

(declare-fun lt!297971 () Unit!21774)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38406 (_ BitVec 32) (_ BitVec 32)) Unit!21774)

(assert (=> b!643211 (= lt!297971 (lemmaNoDuplicateFromThenFromBigger!0 lt!297961 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643211 (arrayNoDuplicates!0 lt!297961 j!136 Nil!12456)))

(declare-fun lt!297963 () Unit!21774)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38406 (_ BitVec 64) (_ BitVec 32) List!12459) Unit!21774)

(assert (=> b!643211 (= lt!297963 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297961 (select (arr!18418 a!2986) j!136) j!136 Nil!12456))))

(assert (=> b!643211 false))

(declare-fun b!643212 () Bool)

(assert (=> b!643212 (= e!368415 (not e!368420))))

(declare-fun res!416643 () Bool)

(assert (=> b!643212 (=> res!416643 e!368420)))

(declare-fun lt!297968 () SeekEntryResult!6858)

(assert (=> b!643212 (= res!416643 (not (= lt!297968 (Found!6858 index!984))))))

(declare-fun lt!297970 () Unit!21774)

(assert (=> b!643212 (= lt!297970 e!368416)))

(declare-fun c!73649 () Bool)

(assert (=> b!643212 (= c!73649 (= lt!297968 Undefined!6858))))

(assert (=> b!643212 (= lt!297968 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297973 lt!297961 mask!3053))))

(declare-fun e!368409 () Bool)

(assert (=> b!643212 e!368409))

(declare-fun res!416647 () Bool)

(assert (=> b!643212 (=> (not res!416647) (not e!368409))))

(declare-fun lt!297959 () SeekEntryResult!6858)

(declare-fun lt!297962 () (_ BitVec 32))

(assert (=> b!643212 (= res!416647 (= lt!297959 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 lt!297973 lt!297961 mask!3053)))))

(assert (=> b!643212 (= lt!297959 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643212 (= lt!297973 (select (store (arr!18418 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297967 () Unit!21774)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38406 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21774)

(assert (=> b!643212 (= lt!297967 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643212 (= lt!297962 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643213 () Bool)

(declare-fun Unit!21779 () Unit!21774)

(assert (=> b!643213 (= e!368413 Unit!21779)))

(declare-fun b!643214 () Bool)

(assert (=> b!643214 (= e!368409 (= lt!297960 lt!297959))))

(declare-fun b!643215 () Bool)

(declare-fun res!416640 () Bool)

(assert (=> b!643215 (=> (not res!416640) (not e!368411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38406 (_ BitVec 32)) Bool)

(assert (=> b!643215 (= res!416640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643216 () Bool)

(declare-fun res!416642 () Bool)

(assert (=> b!643216 (=> (not res!416642) (not e!368414))))

(assert (=> b!643216 (= res!416642 (and (= (size!18782 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18782 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18782 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643217 () Bool)

(assert (=> b!643217 (= e!368408 e!368421)))

(declare-fun res!416645 () Bool)

(assert (=> b!643217 (=> (not res!416645) (not e!368421))))

(assert (=> b!643217 (= res!416645 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) j!136))))

(declare-fun b!643218 () Bool)

(declare-fun e!368419 () Bool)

(assert (=> b!643218 (= e!368419 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) index!984))))

(assert (=> b!643218 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) j!136)))

(declare-fun b!643219 () Bool)

(assert (=> b!643219 (= e!368410 e!368419)))

(declare-fun res!416639 () Bool)

(assert (=> b!643219 (=> res!416639 e!368419)))

(assert (=> b!643219 (= res!416639 (bvsge index!984 j!136))))

(declare-fun lt!297965 () Unit!21774)

(assert (=> b!643219 (= lt!297965 e!368413)))

(declare-fun c!73648 () Bool)

(assert (=> b!643219 (= c!73648 (bvslt j!136 index!984))))

(declare-fun b!643220 () Bool)

(assert (=> b!643220 (= e!368414 e!368411)))

(declare-fun res!416650 () Bool)

(assert (=> b!643220 (=> (not res!416650) (not e!368411))))

(declare-fun lt!297972 () SeekEntryResult!6858)

(assert (=> b!643220 (= res!416650 (or (= lt!297972 (MissingZero!6858 i!1108)) (= lt!297972 (MissingVacant!6858 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38406 (_ BitVec 32)) SeekEntryResult!6858)

(assert (=> b!643220 (= lt!297972 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643207 () Bool)

(declare-fun res!416651 () Bool)

(assert (=> b!643207 (=> (not res!416651) (not e!368414))))

(assert (=> b!643207 (= res!416651 (validKeyInArray!0 (select (arr!18418 a!2986) j!136)))))

(declare-fun res!416653 () Bool)

(assert (=> start!58228 (=> (not res!416653) (not e!368414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58228 (= res!416653 (validMask!0 mask!3053))))

(assert (=> start!58228 e!368414))

(assert (=> start!58228 true))

(declare-fun array_inv!14214 (array!38406) Bool)

(assert (=> start!58228 (array_inv!14214 a!2986)))

(assert (= (and start!58228 res!416653) b!643216))

(assert (= (and b!643216 res!416642) b!643207))

(assert (= (and b!643207 res!416651) b!643205))

(assert (= (and b!643205 res!416652) b!643204))

(assert (= (and b!643204 res!416648) b!643220))

(assert (= (and b!643220 res!416650) b!643215))

(assert (= (and b!643215 res!416640) b!643202))

(assert (= (and b!643202 res!416641) b!643200))

(assert (= (and b!643200 res!416638) b!643210))

(assert (= (and b!643210 res!416649) b!643199))

(assert (= (and b!643199 res!416646) b!643212))

(assert (= (and b!643212 res!416647) b!643214))

(assert (= (and b!643212 c!73649) b!643209))

(assert (= (and b!643212 (not c!73649)) b!643206))

(assert (= (and b!643212 (not res!416643)) b!643208))

(assert (= (and b!643208 res!416637) b!643201))

(assert (= (and b!643201 (not res!416654)) b!643217))

(assert (= (and b!643217 res!416645) b!643203))

(assert (= (and b!643208 (not res!416644)) b!643219))

(assert (= (and b!643219 c!73648) b!643211))

(assert (= (and b!643219 (not c!73648)) b!643213))

(assert (= (and b!643219 (not res!416639)) b!643218))

(declare-fun m!616937 () Bool)

(assert (=> b!643201 m!616937))

(declare-fun m!616939 () Bool)

(assert (=> start!58228 m!616939))

(declare-fun m!616941 () Bool)

(assert (=> start!58228 m!616941))

(assert (=> b!643218 m!616937))

(assert (=> b!643218 m!616937))

(declare-fun m!616943 () Bool)

(assert (=> b!643218 m!616943))

(assert (=> b!643218 m!616937))

(declare-fun m!616945 () Bool)

(assert (=> b!643218 m!616945))

(assert (=> b!643208 m!616937))

(declare-fun m!616947 () Bool)

(assert (=> b!643208 m!616947))

(declare-fun m!616949 () Bool)

(assert (=> b!643208 m!616949))

(declare-fun m!616951 () Bool)

(assert (=> b!643200 m!616951))

(declare-fun m!616953 () Bool)

(assert (=> b!643220 m!616953))

(declare-fun m!616955 () Bool)

(assert (=> b!643212 m!616955))

(declare-fun m!616957 () Bool)

(assert (=> b!643212 m!616957))

(declare-fun m!616959 () Bool)

(assert (=> b!643212 m!616959))

(assert (=> b!643212 m!616937))

(assert (=> b!643212 m!616937))

(declare-fun m!616961 () Bool)

(assert (=> b!643212 m!616961))

(assert (=> b!643212 m!616947))

(declare-fun m!616963 () Bool)

(assert (=> b!643212 m!616963))

(declare-fun m!616965 () Bool)

(assert (=> b!643212 m!616965))

(declare-fun m!616967 () Bool)

(assert (=> b!643202 m!616967))

(declare-fun m!616969 () Bool)

(assert (=> b!643211 m!616969))

(assert (=> b!643211 m!616937))

(declare-fun m!616971 () Bool)

(assert (=> b!643211 m!616971))

(assert (=> b!643211 m!616937))

(declare-fun m!616973 () Bool)

(assert (=> b!643211 m!616973))

(declare-fun m!616975 () Bool)

(assert (=> b!643211 m!616975))

(assert (=> b!643211 m!616937))

(declare-fun m!616977 () Bool)

(assert (=> b!643211 m!616977))

(declare-fun m!616979 () Bool)

(assert (=> b!643211 m!616979))

(assert (=> b!643211 m!616937))

(declare-fun m!616981 () Bool)

(assert (=> b!643211 m!616981))

(declare-fun m!616983 () Bool)

(assert (=> b!643204 m!616983))

(assert (=> b!643203 m!616937))

(assert (=> b!643203 m!616937))

(assert (=> b!643203 m!616943))

(declare-fun m!616985 () Bool)

(assert (=> b!643205 m!616985))

(assert (=> b!643210 m!616947))

(declare-fun m!616987 () Bool)

(assert (=> b!643210 m!616987))

(declare-fun m!616989 () Bool)

(assert (=> b!643215 m!616989))

(assert (=> b!643217 m!616937))

(assert (=> b!643217 m!616937))

(assert (=> b!643217 m!616945))

(assert (=> b!643207 m!616937))

(assert (=> b!643207 m!616937))

(declare-fun m!616991 () Bool)

(assert (=> b!643207 m!616991))

(declare-fun m!616993 () Bool)

(assert (=> b!643199 m!616993))

(assert (=> b!643199 m!616937))

(assert (=> b!643199 m!616937))

(declare-fun m!616995 () Bool)

(assert (=> b!643199 m!616995))

(check-sat (not b!643220) (not b!643212) (not b!643203) (not start!58228) (not b!643205) (not b!643211) (not b!643204) (not b!643217) (not b!643215) (not b!643218) (not b!643202) (not b!643207) (not b!643199))
(check-sat)
(get-model)

(declare-fun d!90923 () Bool)

(declare-fun lt!298024 () SeekEntryResult!6858)

(get-info :version)

(assert (=> d!90923 (and (or ((_ is Undefined!6858) lt!298024) (not ((_ is Found!6858) lt!298024)) (and (bvsge (index!29762 lt!298024) #b00000000000000000000000000000000) (bvslt (index!29762 lt!298024) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298024) ((_ is Found!6858) lt!298024) (not ((_ is MissingVacant!6858) lt!298024)) (not (= (index!29764 lt!298024) vacantSpotIndex!68)) (and (bvsge (index!29764 lt!298024) #b00000000000000000000000000000000) (bvslt (index!29764 lt!298024) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298024) (ite ((_ is Found!6858) lt!298024) (= (select (arr!18418 a!2986) (index!29762 lt!298024)) (select (arr!18418 a!2986) j!136)) (and ((_ is MissingVacant!6858) lt!298024) (= (index!29764 lt!298024) vacantSpotIndex!68) (= (select (arr!18418 a!2986) (index!29764 lt!298024)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368470 () SeekEntryResult!6858)

(assert (=> d!90923 (= lt!298024 e!368470)))

(declare-fun c!73664 () Bool)

(assert (=> d!90923 (= c!73664 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298023 () (_ BitVec 64))

(assert (=> d!90923 (= lt!298023 (select (arr!18418 a!2986) index!984))))

(assert (=> d!90923 (validMask!0 mask!3053)))

(assert (=> d!90923 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053) lt!298024)))

(declare-fun b!643299 () Bool)

(assert (=> b!643299 (= e!368470 Undefined!6858)))

(declare-fun b!643300 () Bool)

(declare-fun e!368472 () SeekEntryResult!6858)

(assert (=> b!643300 (= e!368472 (Found!6858 index!984))))

(declare-fun b!643301 () Bool)

(declare-fun c!73662 () Bool)

(assert (=> b!643301 (= c!73662 (= lt!298023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368471 () SeekEntryResult!6858)

(assert (=> b!643301 (= e!368472 e!368471)))

(declare-fun b!643302 () Bool)

(assert (=> b!643302 (= e!368471 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643303 () Bool)

(assert (=> b!643303 (= e!368470 e!368472)))

(declare-fun c!73663 () Bool)

(assert (=> b!643303 (= c!73663 (= lt!298023 (select (arr!18418 a!2986) j!136)))))

(declare-fun b!643304 () Bool)

(assert (=> b!643304 (= e!368471 (MissingVacant!6858 vacantSpotIndex!68))))

(assert (= (and d!90923 c!73664) b!643299))

(assert (= (and d!90923 (not c!73664)) b!643303))

(assert (= (and b!643303 c!73663) b!643300))

(assert (= (and b!643303 (not c!73663)) b!643301))

(assert (= (and b!643301 c!73662) b!643304))

(assert (= (and b!643301 (not c!73662)) b!643302))

(declare-fun m!617057 () Bool)

(assert (=> d!90923 m!617057))

(declare-fun m!617059 () Bool)

(assert (=> d!90923 m!617059))

(assert (=> d!90923 m!616993))

(assert (=> d!90923 m!616939))

(assert (=> b!643302 m!616957))

(assert (=> b!643302 m!616957))

(assert (=> b!643302 m!616937))

(declare-fun m!617061 () Bool)

(assert (=> b!643302 m!617061))

(assert (=> b!643199 d!90923))

(declare-fun d!90925 () Bool)

(assert (=> d!90925 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58228 d!90925))

(declare-fun d!90927 () Bool)

(assert (=> d!90927 (= (array_inv!14214 a!2986) (bvsge (size!18782 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58228 d!90927))

(declare-fun b!643317 () Bool)

(declare-fun e!368481 () SeekEntryResult!6858)

(declare-fun lt!298032 () SeekEntryResult!6858)

(assert (=> b!643317 (= e!368481 (MissingZero!6858 (index!29763 lt!298032)))))

(declare-fun b!643318 () Bool)

(declare-fun e!368480 () SeekEntryResult!6858)

(assert (=> b!643318 (= e!368480 (Found!6858 (index!29763 lt!298032)))))

(declare-fun b!643319 () Bool)

(assert (=> b!643319 (= e!368481 (seekKeyOrZeroReturnVacant!0 (x!58529 lt!298032) (index!29763 lt!298032) (index!29763 lt!298032) k0!1786 a!2986 mask!3053))))

(declare-fun b!643320 () Bool)

(declare-fun e!368479 () SeekEntryResult!6858)

(assert (=> b!643320 (= e!368479 Undefined!6858)))

(declare-fun d!90929 () Bool)

(declare-fun lt!298033 () SeekEntryResult!6858)

(assert (=> d!90929 (and (or ((_ is Undefined!6858) lt!298033) (not ((_ is Found!6858) lt!298033)) (and (bvsge (index!29762 lt!298033) #b00000000000000000000000000000000) (bvslt (index!29762 lt!298033) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298033) ((_ is Found!6858) lt!298033) (not ((_ is MissingZero!6858) lt!298033)) (and (bvsge (index!29761 lt!298033) #b00000000000000000000000000000000) (bvslt (index!29761 lt!298033) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298033) ((_ is Found!6858) lt!298033) ((_ is MissingZero!6858) lt!298033) (not ((_ is MissingVacant!6858) lt!298033)) (and (bvsge (index!29764 lt!298033) #b00000000000000000000000000000000) (bvslt (index!29764 lt!298033) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298033) (ite ((_ is Found!6858) lt!298033) (= (select (arr!18418 a!2986) (index!29762 lt!298033)) k0!1786) (ite ((_ is MissingZero!6858) lt!298033) (= (select (arr!18418 a!2986) (index!29761 lt!298033)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6858) lt!298033) (= (select (arr!18418 a!2986) (index!29764 lt!298033)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90929 (= lt!298033 e!368479)))

(declare-fun c!73672 () Bool)

(assert (=> d!90929 (= c!73672 (and ((_ is Intermediate!6858) lt!298032) (undefined!7670 lt!298032)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38406 (_ BitVec 32)) SeekEntryResult!6858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90929 (= lt!298032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90929 (validMask!0 mask!3053)))

(assert (=> d!90929 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!298033)))

(declare-fun b!643321 () Bool)

(assert (=> b!643321 (= e!368479 e!368480)))

(declare-fun lt!298031 () (_ BitVec 64))

(assert (=> b!643321 (= lt!298031 (select (arr!18418 a!2986) (index!29763 lt!298032)))))

(declare-fun c!73673 () Bool)

(assert (=> b!643321 (= c!73673 (= lt!298031 k0!1786))))

(declare-fun b!643322 () Bool)

(declare-fun c!73671 () Bool)

(assert (=> b!643322 (= c!73671 (= lt!298031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643322 (= e!368480 e!368481)))

(assert (= (and d!90929 c!73672) b!643320))

(assert (= (and d!90929 (not c!73672)) b!643321))

(assert (= (and b!643321 c!73673) b!643318))

(assert (= (and b!643321 (not c!73673)) b!643322))

(assert (= (and b!643322 c!73671) b!643317))

(assert (= (and b!643322 (not c!73671)) b!643319))

(declare-fun m!617063 () Bool)

(assert (=> b!643319 m!617063))

(declare-fun m!617065 () Bool)

(assert (=> d!90929 m!617065))

(declare-fun m!617067 () Bool)

(assert (=> d!90929 m!617067))

(assert (=> d!90929 m!617065))

(assert (=> d!90929 m!616939))

(declare-fun m!617069 () Bool)

(assert (=> d!90929 m!617069))

(declare-fun m!617071 () Bool)

(assert (=> d!90929 m!617071))

(declare-fun m!617073 () Bool)

(assert (=> d!90929 m!617073))

(declare-fun m!617075 () Bool)

(assert (=> b!643321 m!617075))

(assert (=> b!643220 d!90929))

(declare-fun bm!33584 () Bool)

(declare-fun call!33587 () Bool)

(declare-fun c!73676 () Bool)

(assert (=> bm!33584 (= call!33587 (arrayNoDuplicates!0 lt!297961 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73676 (Cons!12455 (select (arr!18418 lt!297961) #b00000000000000000000000000000000) Nil!12456) Nil!12456)))))

(declare-fun b!643339 () Bool)

(declare-fun e!368498 () Bool)

(declare-fun e!368499 () Bool)

(assert (=> b!643339 (= e!368498 e!368499)))

(assert (=> b!643339 (= c!73676 (validKeyInArray!0 (select (arr!18418 lt!297961) #b00000000000000000000000000000000)))))

(declare-fun b!643340 () Bool)

(declare-fun e!368496 () Bool)

(assert (=> b!643340 (= e!368496 e!368498)))

(declare-fun res!416721 () Bool)

(assert (=> b!643340 (=> (not res!416721) (not e!368498))))

(declare-fun e!368497 () Bool)

(assert (=> b!643340 (= res!416721 (not e!368497))))

(declare-fun res!416722 () Bool)

(assert (=> b!643340 (=> (not res!416722) (not e!368497))))

(assert (=> b!643340 (= res!416722 (validKeyInArray!0 (select (arr!18418 lt!297961) #b00000000000000000000000000000000)))))

(declare-fun b!643341 () Bool)

(assert (=> b!643341 (= e!368499 call!33587)))

(declare-fun b!643342 () Bool)

(declare-fun contains!3141 (List!12459 (_ BitVec 64)) Bool)

(assert (=> b!643342 (= e!368497 (contains!3141 Nil!12456 (select (arr!18418 lt!297961) #b00000000000000000000000000000000)))))

(declare-fun b!643343 () Bool)

(assert (=> b!643343 (= e!368499 call!33587)))

(declare-fun d!90931 () Bool)

(declare-fun res!416723 () Bool)

(assert (=> d!90931 (=> res!416723 e!368496)))

(assert (=> d!90931 (= res!416723 (bvsge #b00000000000000000000000000000000 (size!18782 lt!297961)))))

(assert (=> d!90931 (= (arrayNoDuplicates!0 lt!297961 #b00000000000000000000000000000000 Nil!12456) e!368496)))

(assert (= (and d!90931 (not res!416723)) b!643340))

(assert (= (and b!643340 res!416722) b!643342))

(assert (= (and b!643340 res!416721) b!643339))

(assert (= (and b!643339 c!73676) b!643341))

(assert (= (and b!643339 (not c!73676)) b!643343))

(assert (= (or b!643341 b!643343) bm!33584))

(declare-fun m!617081 () Bool)

(assert (=> bm!33584 m!617081))

(declare-fun m!617083 () Bool)

(assert (=> bm!33584 m!617083))

(assert (=> b!643339 m!617081))

(assert (=> b!643339 m!617081))

(declare-fun m!617085 () Bool)

(assert (=> b!643339 m!617085))

(assert (=> b!643340 m!617081))

(assert (=> b!643340 m!617081))

(assert (=> b!643340 m!617085))

(assert (=> b!643342 m!617081))

(assert (=> b!643342 m!617081))

(declare-fun m!617087 () Bool)

(assert (=> b!643342 m!617087))

(assert (=> b!643211 d!90931))

(declare-fun call!33588 () Bool)

(declare-fun bm!33585 () Bool)

(declare-fun c!73677 () Bool)

(assert (=> bm!33585 (= call!33588 (arrayNoDuplicates!0 lt!297961 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73677 (Cons!12455 (select (arr!18418 lt!297961) j!136) Nil!12456) Nil!12456)))))

(declare-fun b!643344 () Bool)

(declare-fun e!368502 () Bool)

(declare-fun e!368503 () Bool)

(assert (=> b!643344 (= e!368502 e!368503)))

(assert (=> b!643344 (= c!73677 (validKeyInArray!0 (select (arr!18418 lt!297961) j!136)))))

(declare-fun b!643345 () Bool)

(declare-fun e!368500 () Bool)

(assert (=> b!643345 (= e!368500 e!368502)))

(declare-fun res!416724 () Bool)

(assert (=> b!643345 (=> (not res!416724) (not e!368502))))

(declare-fun e!368501 () Bool)

(assert (=> b!643345 (= res!416724 (not e!368501))))

(declare-fun res!416725 () Bool)

(assert (=> b!643345 (=> (not res!416725) (not e!368501))))

(assert (=> b!643345 (= res!416725 (validKeyInArray!0 (select (arr!18418 lt!297961) j!136)))))

(declare-fun b!643346 () Bool)

(assert (=> b!643346 (= e!368503 call!33588)))

(declare-fun b!643347 () Bool)

(assert (=> b!643347 (= e!368501 (contains!3141 Nil!12456 (select (arr!18418 lt!297961) j!136)))))

(declare-fun b!643348 () Bool)

(assert (=> b!643348 (= e!368503 call!33588)))

(declare-fun d!90941 () Bool)

(declare-fun res!416726 () Bool)

(assert (=> d!90941 (=> res!416726 e!368500)))

(assert (=> d!90941 (= res!416726 (bvsge j!136 (size!18782 lt!297961)))))

(assert (=> d!90941 (= (arrayNoDuplicates!0 lt!297961 j!136 Nil!12456) e!368500)))

(assert (= (and d!90941 (not res!416726)) b!643345))

(assert (= (and b!643345 res!416725) b!643347))

(assert (= (and b!643345 res!416724) b!643344))

(assert (= (and b!643344 c!73677) b!643346))

(assert (= (and b!643344 (not c!73677)) b!643348))

(assert (= (or b!643346 b!643348) bm!33585))

(declare-fun m!617089 () Bool)

(assert (=> bm!33585 m!617089))

(declare-fun m!617091 () Bool)

(assert (=> bm!33585 m!617091))

(assert (=> b!643344 m!617089))

(assert (=> b!643344 m!617089))

(declare-fun m!617093 () Bool)

(assert (=> b!643344 m!617093))

(assert (=> b!643345 m!617089))

(assert (=> b!643345 m!617089))

(assert (=> b!643345 m!617093))

(assert (=> b!643347 m!617089))

(assert (=> b!643347 m!617089))

(declare-fun m!617095 () Bool)

(assert (=> b!643347 m!617095))

(assert (=> b!643211 d!90941))

(declare-fun d!90943 () Bool)

(assert (=> d!90943 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18782 lt!297961)) (not (= (select (arr!18418 lt!297961) j!136) (select (arr!18418 a!2986) j!136))))))

(declare-fun lt!298036 () Unit!21774)

(declare-fun choose!21 (array!38406 (_ BitVec 64) (_ BitVec 32) List!12459) Unit!21774)

(assert (=> d!90943 (= lt!298036 (choose!21 lt!297961 (select (arr!18418 a!2986) j!136) j!136 Nil!12456))))

(assert (=> d!90943 (bvslt (size!18782 lt!297961) #b01111111111111111111111111111111)))

(assert (=> d!90943 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297961 (select (arr!18418 a!2986) j!136) j!136 Nil!12456) lt!298036)))

(declare-fun bs!19243 () Bool)

(assert (= bs!19243 d!90943))

(assert (=> bs!19243 m!617089))

(assert (=> bs!19243 m!616937))

(declare-fun m!617097 () Bool)

(assert (=> bs!19243 m!617097))

(assert (=> b!643211 d!90943))

(declare-fun d!90945 () Bool)

(declare-fun e!368514 () Bool)

(assert (=> d!90945 e!368514))

(declare-fun res!416735 () Bool)

(assert (=> d!90945 (=> (not res!416735) (not e!368514))))

(assert (=> d!90945 (= res!416735 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18782 a!2986))))))

(declare-fun lt!298039 () Unit!21774)

(declare-fun choose!41 (array!38406 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12459) Unit!21774)

(assert (=> d!90945 (= lt!298039 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12456))))

(assert (=> d!90945 (bvslt (size!18782 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90945 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12456) lt!298039)))

(declare-fun b!643361 () Bool)

(assert (=> b!643361 (= e!368514 (arrayNoDuplicates!0 (array!38407 (store (arr!18418 a!2986) i!1108 k0!1786) (size!18782 a!2986)) #b00000000000000000000000000000000 Nil!12456))))

(assert (= (and d!90945 res!416735) b!643361))

(declare-fun m!617099 () Bool)

(assert (=> d!90945 m!617099))

(assert (=> b!643361 m!616947))

(declare-fun m!617101 () Bool)

(assert (=> b!643361 m!617101))

(assert (=> b!643211 d!90945))

(declare-fun d!90947 () Bool)

(declare-fun res!416743 () Bool)

(declare-fun e!368523 () Bool)

(assert (=> d!90947 (=> res!416743 e!368523)))

(assert (=> d!90947 (= res!416743 (= (select (arr!18418 lt!297961) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18418 a!2986) j!136)))))

(assert (=> d!90947 (= (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368523)))

(declare-fun b!643371 () Bool)

(declare-fun e!368524 () Bool)

(assert (=> b!643371 (= e!368523 e!368524)))

(declare-fun res!416744 () Bool)

(assert (=> b!643371 (=> (not res!416744) (not e!368524))))

(assert (=> b!643371 (= res!416744 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18782 lt!297961)))))

(declare-fun b!643372 () Bool)

(assert (=> b!643372 (= e!368524 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90947 (not res!416743)) b!643371))

(assert (= (and b!643371 res!416744) b!643372))

(declare-fun m!617111 () Bool)

(assert (=> d!90947 m!617111))

(assert (=> b!643372 m!616937))

(declare-fun m!617113 () Bool)

(assert (=> b!643372 m!617113))

(assert (=> b!643211 d!90947))

(declare-fun d!90951 () Bool)

(assert (=> d!90951 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298048 () Unit!21774)

(declare-fun choose!114 (array!38406 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21774)

(assert (=> d!90951 (= lt!298048 (choose!114 lt!297961 (select (arr!18418 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90951 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90951 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297961 (select (arr!18418 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298048)))

(declare-fun bs!19244 () Bool)

(assert (= bs!19244 d!90951))

(assert (=> bs!19244 m!616937))

(assert (=> bs!19244 m!616973))

(assert (=> bs!19244 m!616937))

(declare-fun m!617115 () Bool)

(assert (=> bs!19244 m!617115))

(assert (=> b!643211 d!90951))

(declare-fun d!90953 () Bool)

(assert (=> d!90953 (arrayNoDuplicates!0 lt!297961 j!136 Nil!12456)))

(declare-fun lt!298051 () Unit!21774)

(declare-fun choose!39 (array!38406 (_ BitVec 32) (_ BitVec 32)) Unit!21774)

(assert (=> d!90953 (= lt!298051 (choose!39 lt!297961 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90953 (bvslt (size!18782 lt!297961) #b01111111111111111111111111111111)))

(assert (=> d!90953 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297961 #b00000000000000000000000000000000 j!136) lt!298051)))

(declare-fun bs!19245 () Bool)

(assert (= bs!19245 d!90953))

(assert (=> bs!19245 m!616979))

(declare-fun m!617125 () Bool)

(assert (=> bs!19245 m!617125))

(assert (=> b!643211 d!90953))

(declare-fun d!90961 () Bool)

(declare-fun res!416753 () Bool)

(declare-fun e!368539 () Bool)

(assert (=> d!90961 (=> res!416753 e!368539)))

(assert (=> d!90961 (= res!416753 (= (select (arr!18418 lt!297961) index!984) (select (arr!18418 a!2986) j!136)))))

(assert (=> d!90961 (= (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) index!984) e!368539)))

(declare-fun b!643393 () Bool)

(declare-fun e!368540 () Bool)

(assert (=> b!643393 (= e!368539 e!368540)))

(declare-fun res!416754 () Bool)

(assert (=> b!643393 (=> (not res!416754) (not e!368540))))

(assert (=> b!643393 (= res!416754 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18782 lt!297961)))))

(declare-fun b!643394 () Bool)

(assert (=> b!643394 (= e!368540 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90961 (not res!416753)) b!643393))

(assert (= (and b!643393 res!416754) b!643394))

(declare-fun m!617127 () Bool)

(assert (=> d!90961 m!617127))

(assert (=> b!643394 m!616937))

(declare-fun m!617129 () Bool)

(assert (=> b!643394 m!617129))

(assert (=> b!643218 d!90961))

(declare-fun d!90963 () Bool)

(declare-fun res!416755 () Bool)

(declare-fun e!368541 () Bool)

(assert (=> d!90963 (=> res!416755 e!368541)))

(assert (=> d!90963 (= res!416755 (= (select (arr!18418 lt!297961) j!136) (select (arr!18418 a!2986) j!136)))))

(assert (=> d!90963 (= (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) j!136) e!368541)))

(declare-fun b!643395 () Bool)

(declare-fun e!368542 () Bool)

(assert (=> b!643395 (= e!368541 e!368542)))

(declare-fun res!416756 () Bool)

(assert (=> b!643395 (=> (not res!416756) (not e!368542))))

(assert (=> b!643395 (= res!416756 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18782 lt!297961)))))

(declare-fun b!643396 () Bool)

(assert (=> b!643396 (= e!368542 (arrayContainsKey!0 lt!297961 (select (arr!18418 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90963 (not res!416755)) b!643395))

(assert (= (and b!643395 res!416756) b!643396))

(assert (=> d!90963 m!617089))

(assert (=> b!643396 m!616937))

(declare-fun m!617131 () Bool)

(assert (=> b!643396 m!617131))

(assert (=> b!643218 d!90963))

(declare-fun d!90965 () Bool)

(assert (=> d!90965 (= (validKeyInArray!0 (select (arr!18418 a!2986) j!136)) (and (not (= (select (arr!18418 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18418 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643207 d!90965))

(assert (=> b!643217 d!90963))

(declare-fun bm!33591 () Bool)

(declare-fun call!33594 () Bool)

(assert (=> bm!33591 (= call!33594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!643411 () Bool)

(declare-fun e!368553 () Bool)

(declare-fun e!368554 () Bool)

(assert (=> b!643411 (= e!368553 e!368554)))

(declare-fun c!73692 () Bool)

(assert (=> b!643411 (= c!73692 (validKeyInArray!0 (select (arr!18418 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643412 () Bool)

(declare-fun e!368552 () Bool)

(assert (=> b!643412 (= e!368552 call!33594)))

(declare-fun d!90969 () Bool)

(declare-fun res!416762 () Bool)

(assert (=> d!90969 (=> res!416762 e!368553)))

(assert (=> d!90969 (= res!416762 (bvsge #b00000000000000000000000000000000 (size!18782 a!2986)))))

(assert (=> d!90969 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368553)))

(declare-fun b!643413 () Bool)

(assert (=> b!643413 (= e!368554 e!368552)))

(declare-fun lt!298061 () (_ BitVec 64))

(assert (=> b!643413 (= lt!298061 (select (arr!18418 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!298062 () Unit!21774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38406 (_ BitVec 64) (_ BitVec 32)) Unit!21774)

(assert (=> b!643413 (= lt!298062 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!298061 #b00000000000000000000000000000000))))

(assert (=> b!643413 (arrayContainsKey!0 a!2986 lt!298061 #b00000000000000000000000000000000)))

(declare-fun lt!298063 () Unit!21774)

(assert (=> b!643413 (= lt!298063 lt!298062)))

(declare-fun res!416761 () Bool)

(assert (=> b!643413 (= res!416761 (= (seekEntryOrOpen!0 (select (arr!18418 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6858 #b00000000000000000000000000000000)))))

(assert (=> b!643413 (=> (not res!416761) (not e!368552))))

(declare-fun b!643414 () Bool)

(assert (=> b!643414 (= e!368554 call!33594)))

(assert (= (and d!90969 (not res!416762)) b!643411))

(assert (= (and b!643411 c!73692) b!643413))

(assert (= (and b!643411 (not c!73692)) b!643414))

(assert (= (and b!643413 res!416761) b!643412))

(assert (= (or b!643412 b!643414) bm!33591))

(declare-fun m!617147 () Bool)

(assert (=> bm!33591 m!617147))

(declare-fun m!617149 () Bool)

(assert (=> b!643411 m!617149))

(assert (=> b!643411 m!617149))

(declare-fun m!617151 () Bool)

(assert (=> b!643411 m!617151))

(assert (=> b!643413 m!617149))

(declare-fun m!617153 () Bool)

(assert (=> b!643413 m!617153))

(declare-fun m!617155 () Bool)

(assert (=> b!643413 m!617155))

(assert (=> b!643413 m!617149))

(declare-fun m!617157 () Bool)

(assert (=> b!643413 m!617157))

(assert (=> b!643215 d!90969))

(declare-fun d!90971 () Bool)

(declare-fun res!416763 () Bool)

(declare-fun e!368555 () Bool)

(assert (=> d!90971 (=> res!416763 e!368555)))

(assert (=> d!90971 (= res!416763 (= (select (arr!18418 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90971 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!368555)))

(declare-fun b!643415 () Bool)

(declare-fun e!368556 () Bool)

(assert (=> b!643415 (= e!368555 e!368556)))

(declare-fun res!416764 () Bool)

(assert (=> b!643415 (=> (not res!416764) (not e!368556))))

(assert (=> b!643415 (= res!416764 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18782 a!2986)))))

(declare-fun b!643416 () Bool)

(assert (=> b!643416 (= e!368556 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90971 (not res!416763)) b!643415))

(assert (= (and b!643415 res!416764) b!643416))

(assert (=> d!90971 m!617149))

(declare-fun m!617159 () Bool)

(assert (=> b!643416 m!617159))

(assert (=> b!643204 d!90971))

(declare-fun d!90973 () Bool)

(assert (=> d!90973 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643205 d!90973))

(declare-fun bm!33592 () Bool)

(declare-fun call!33595 () Bool)

(declare-fun c!73693 () Bool)

(assert (=> bm!33592 (= call!33595 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73693 (Cons!12455 (select (arr!18418 a!2986) #b00000000000000000000000000000000) Nil!12456) Nil!12456)))))

(declare-fun b!643417 () Bool)

(declare-fun e!368559 () Bool)

(declare-fun e!368560 () Bool)

(assert (=> b!643417 (= e!368559 e!368560)))

(assert (=> b!643417 (= c!73693 (validKeyInArray!0 (select (arr!18418 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643418 () Bool)

(declare-fun e!368557 () Bool)

(assert (=> b!643418 (= e!368557 e!368559)))

(declare-fun res!416765 () Bool)

(assert (=> b!643418 (=> (not res!416765) (not e!368559))))

(declare-fun e!368558 () Bool)

(assert (=> b!643418 (= res!416765 (not e!368558))))

(declare-fun res!416766 () Bool)

(assert (=> b!643418 (=> (not res!416766) (not e!368558))))

(assert (=> b!643418 (= res!416766 (validKeyInArray!0 (select (arr!18418 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643419 () Bool)

(assert (=> b!643419 (= e!368560 call!33595)))

(declare-fun b!643420 () Bool)

(assert (=> b!643420 (= e!368558 (contains!3141 Nil!12456 (select (arr!18418 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643421 () Bool)

(assert (=> b!643421 (= e!368560 call!33595)))

(declare-fun d!90975 () Bool)

(declare-fun res!416767 () Bool)

(assert (=> d!90975 (=> res!416767 e!368557)))

(assert (=> d!90975 (= res!416767 (bvsge #b00000000000000000000000000000000 (size!18782 a!2986)))))

(assert (=> d!90975 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12456) e!368557)))

(assert (= (and d!90975 (not res!416767)) b!643418))

(assert (= (and b!643418 res!416766) b!643420))

(assert (= (and b!643418 res!416765) b!643417))

(assert (= (and b!643417 c!73693) b!643419))

(assert (= (and b!643417 (not c!73693)) b!643421))

(assert (= (or b!643419 b!643421) bm!33592))

(assert (=> bm!33592 m!617149))

(declare-fun m!617161 () Bool)

(assert (=> bm!33592 m!617161))

(assert (=> b!643417 m!617149))

(assert (=> b!643417 m!617149))

(assert (=> b!643417 m!617151))

(assert (=> b!643418 m!617149))

(assert (=> b!643418 m!617149))

(assert (=> b!643418 m!617151))

(assert (=> b!643420 m!617149))

(assert (=> b!643420 m!617149))

(declare-fun m!617163 () Bool)

(assert (=> b!643420 m!617163))

(assert (=> b!643202 d!90975))

(declare-fun lt!298065 () SeekEntryResult!6858)

(declare-fun d!90977 () Bool)

(assert (=> d!90977 (and (or ((_ is Undefined!6858) lt!298065) (not ((_ is Found!6858) lt!298065)) (and (bvsge (index!29762 lt!298065) #b00000000000000000000000000000000) (bvslt (index!29762 lt!298065) (size!18782 lt!297961)))) (or ((_ is Undefined!6858) lt!298065) ((_ is Found!6858) lt!298065) (not ((_ is MissingVacant!6858) lt!298065)) (not (= (index!29764 lt!298065) vacantSpotIndex!68)) (and (bvsge (index!29764 lt!298065) #b00000000000000000000000000000000) (bvslt (index!29764 lt!298065) (size!18782 lt!297961)))) (or ((_ is Undefined!6858) lt!298065) (ite ((_ is Found!6858) lt!298065) (= (select (arr!18418 lt!297961) (index!29762 lt!298065)) lt!297973) (and ((_ is MissingVacant!6858) lt!298065) (= (index!29764 lt!298065) vacantSpotIndex!68) (= (select (arr!18418 lt!297961) (index!29764 lt!298065)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368561 () SeekEntryResult!6858)

(assert (=> d!90977 (= lt!298065 e!368561)))

(declare-fun c!73696 () Bool)

(assert (=> d!90977 (= c!73696 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298064 () (_ BitVec 64))

(assert (=> d!90977 (= lt!298064 (select (arr!18418 lt!297961) index!984))))

(assert (=> d!90977 (validMask!0 mask!3053)))

(assert (=> d!90977 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297973 lt!297961 mask!3053) lt!298065)))

(declare-fun b!643422 () Bool)

(assert (=> b!643422 (= e!368561 Undefined!6858)))

(declare-fun b!643423 () Bool)

(declare-fun e!368563 () SeekEntryResult!6858)

(assert (=> b!643423 (= e!368563 (Found!6858 index!984))))

(declare-fun b!643424 () Bool)

(declare-fun c!73694 () Bool)

(assert (=> b!643424 (= c!73694 (= lt!298064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368562 () SeekEntryResult!6858)

(assert (=> b!643424 (= e!368563 e!368562)))

(declare-fun b!643425 () Bool)

(assert (=> b!643425 (= e!368562 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297973 lt!297961 mask!3053))))

(declare-fun b!643426 () Bool)

(assert (=> b!643426 (= e!368561 e!368563)))

(declare-fun c!73695 () Bool)

(assert (=> b!643426 (= c!73695 (= lt!298064 lt!297973))))

(declare-fun b!643427 () Bool)

(assert (=> b!643427 (= e!368562 (MissingVacant!6858 vacantSpotIndex!68))))

(assert (= (and d!90977 c!73696) b!643422))

(assert (= (and d!90977 (not c!73696)) b!643426))

(assert (= (and b!643426 c!73695) b!643423))

(assert (= (and b!643426 (not c!73695)) b!643424))

(assert (= (and b!643424 c!73694) b!643427))

(assert (= (and b!643424 (not c!73694)) b!643425))

(declare-fun m!617165 () Bool)

(assert (=> d!90977 m!617165))

(declare-fun m!617167 () Bool)

(assert (=> d!90977 m!617167))

(assert (=> d!90977 m!617127))

(assert (=> d!90977 m!616939))

(assert (=> b!643425 m!616957))

(assert (=> b!643425 m!616957))

(declare-fun m!617169 () Bool)

(assert (=> b!643425 m!617169))

(assert (=> b!643212 d!90977))

(declare-fun d!90979 () Bool)

(declare-fun lt!298071 () SeekEntryResult!6858)

(assert (=> d!90979 (and (or ((_ is Undefined!6858) lt!298071) (not ((_ is Found!6858) lt!298071)) (and (bvsge (index!29762 lt!298071) #b00000000000000000000000000000000) (bvslt (index!29762 lt!298071) (size!18782 lt!297961)))) (or ((_ is Undefined!6858) lt!298071) ((_ is Found!6858) lt!298071) (not ((_ is MissingVacant!6858) lt!298071)) (not (= (index!29764 lt!298071) vacantSpotIndex!68)) (and (bvsge (index!29764 lt!298071) #b00000000000000000000000000000000) (bvslt (index!29764 lt!298071) (size!18782 lt!297961)))) (or ((_ is Undefined!6858) lt!298071) (ite ((_ is Found!6858) lt!298071) (= (select (arr!18418 lt!297961) (index!29762 lt!298071)) lt!297973) (and ((_ is MissingVacant!6858) lt!298071) (= (index!29764 lt!298071) vacantSpotIndex!68) (= (select (arr!18418 lt!297961) (index!29764 lt!298071)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368570 () SeekEntryResult!6858)

(assert (=> d!90979 (= lt!298071 e!368570)))

(declare-fun c!73705 () Bool)

(assert (=> d!90979 (= c!73705 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298070 () (_ BitVec 64))

(assert (=> d!90979 (= lt!298070 (select (arr!18418 lt!297961) lt!297962))))

(assert (=> d!90979 (validMask!0 mask!3053)))

(assert (=> d!90979 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 lt!297973 lt!297961 mask!3053) lt!298071)))

(declare-fun b!643440 () Bool)

(assert (=> b!643440 (= e!368570 Undefined!6858)))

(declare-fun b!643441 () Bool)

(declare-fun e!368572 () SeekEntryResult!6858)

(assert (=> b!643441 (= e!368572 (Found!6858 lt!297962))))

(declare-fun b!643442 () Bool)

(declare-fun c!73703 () Bool)

(assert (=> b!643442 (= c!73703 (= lt!298070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368571 () SeekEntryResult!6858)

(assert (=> b!643442 (= e!368572 e!368571)))

(declare-fun b!643443 () Bool)

(assert (=> b!643443 (= e!368571 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297962 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297973 lt!297961 mask!3053))))

(declare-fun b!643444 () Bool)

(assert (=> b!643444 (= e!368570 e!368572)))

(declare-fun c!73704 () Bool)

(assert (=> b!643444 (= c!73704 (= lt!298070 lt!297973))))

(declare-fun b!643445 () Bool)

(assert (=> b!643445 (= e!368571 (MissingVacant!6858 vacantSpotIndex!68))))

(assert (= (and d!90979 c!73705) b!643440))

(assert (= (and d!90979 (not c!73705)) b!643444))

(assert (= (and b!643444 c!73704) b!643441))

(assert (= (and b!643444 (not c!73704)) b!643442))

(assert (= (and b!643442 c!73703) b!643445))

(assert (= (and b!643442 (not c!73703)) b!643443))

(declare-fun m!617171 () Bool)

(assert (=> d!90979 m!617171))

(declare-fun m!617173 () Bool)

(assert (=> d!90979 m!617173))

(declare-fun m!617175 () Bool)

(assert (=> d!90979 m!617175))

(assert (=> d!90979 m!616939))

(declare-fun m!617177 () Bool)

(assert (=> b!643443 m!617177))

(assert (=> b!643443 m!617177))

(declare-fun m!617179 () Bool)

(assert (=> b!643443 m!617179))

(assert (=> b!643212 d!90979))

(declare-fun d!90981 () Bool)

(declare-fun e!368593 () Bool)

(assert (=> d!90981 e!368593))

(declare-fun res!416775 () Bool)

(assert (=> d!90981 (=> (not res!416775) (not e!368593))))

(assert (=> d!90981 (= res!416775 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18782 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18782 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18782 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18782 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18782 a!2986))))))

(declare-fun lt!298088 () Unit!21774)

(declare-fun choose!9 (array!38406 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21774)

(assert (=> d!90981 (= lt!298088 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90981 (validMask!0 mask!3053)))

(assert (=> d!90981 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 mask!3053) lt!298088)))

(declare-fun b!643479 () Bool)

(assert (=> b!643479 (= e!368593 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 (select (store (arr!18418 a!2986) i!1108 k0!1786) j!136) (array!38407 (store (arr!18418 a!2986) i!1108 k0!1786) (size!18782 a!2986)) mask!3053)))))

(assert (= (and d!90981 res!416775) b!643479))

(declare-fun m!617215 () Bool)

(assert (=> d!90981 m!617215))

(assert (=> d!90981 m!616939))

(assert (=> b!643479 m!616959))

(declare-fun m!617219 () Bool)

(assert (=> b!643479 m!617219))

(assert (=> b!643479 m!616937))

(assert (=> b!643479 m!616947))

(assert (=> b!643479 m!616937))

(assert (=> b!643479 m!616961))

(assert (=> b!643479 m!616959))

(assert (=> b!643212 d!90981))

(declare-fun d!90993 () Bool)

(declare-fun lt!298094 () (_ BitVec 32))

(assert (=> d!90993 (and (bvsge lt!298094 #b00000000000000000000000000000000) (bvslt lt!298094 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90993 (= lt!298094 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90993 (validMask!0 mask!3053)))

(assert (=> d!90993 (= (nextIndex!0 index!984 x!910 mask!3053) lt!298094)))

(declare-fun bs!19247 () Bool)

(assert (= bs!19247 d!90993))

(declare-fun m!617223 () Bool)

(assert (=> bs!19247 m!617223))

(assert (=> bs!19247 m!616939))

(assert (=> b!643212 d!90993))

(declare-fun d!90995 () Bool)

(declare-fun lt!298098 () SeekEntryResult!6858)

(assert (=> d!90995 (and (or ((_ is Undefined!6858) lt!298098) (not ((_ is Found!6858) lt!298098)) (and (bvsge (index!29762 lt!298098) #b00000000000000000000000000000000) (bvslt (index!29762 lt!298098) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298098) ((_ is Found!6858) lt!298098) (not ((_ is MissingVacant!6858) lt!298098)) (not (= (index!29764 lt!298098) vacantSpotIndex!68)) (and (bvsge (index!29764 lt!298098) #b00000000000000000000000000000000) (bvslt (index!29764 lt!298098) (size!18782 a!2986)))) (or ((_ is Undefined!6858) lt!298098) (ite ((_ is Found!6858) lt!298098) (= (select (arr!18418 a!2986) (index!29762 lt!298098)) (select (arr!18418 a!2986) j!136)) (and ((_ is MissingVacant!6858) lt!298098) (= (index!29764 lt!298098) vacantSpotIndex!68) (= (select (arr!18418 a!2986) (index!29764 lt!298098)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368596 () SeekEntryResult!6858)

(assert (=> d!90995 (= lt!298098 e!368596)))

(declare-fun c!73721 () Bool)

(assert (=> d!90995 (= c!73721 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298097 () (_ BitVec 64))

(assert (=> d!90995 (= lt!298097 (select (arr!18418 a!2986) lt!297962))))

(assert (=> d!90995 (validMask!0 mask!3053)))

(assert (=> d!90995 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297962 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053) lt!298098)))

(declare-fun b!643480 () Bool)

(assert (=> b!643480 (= e!368596 Undefined!6858)))

(declare-fun b!643481 () Bool)

(declare-fun e!368598 () SeekEntryResult!6858)

(assert (=> b!643481 (= e!368598 (Found!6858 lt!297962))))

(declare-fun b!643482 () Bool)

(declare-fun c!73719 () Bool)

(assert (=> b!643482 (= c!73719 (= lt!298097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368597 () SeekEntryResult!6858)

(assert (=> b!643482 (= e!368598 e!368597)))

(declare-fun b!643483 () Bool)

(assert (=> b!643483 (= e!368597 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297962 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643484 () Bool)

(assert (=> b!643484 (= e!368596 e!368598)))

(declare-fun c!73720 () Bool)

(assert (=> b!643484 (= c!73720 (= lt!298097 (select (arr!18418 a!2986) j!136)))))

(declare-fun b!643485 () Bool)

(assert (=> b!643485 (= e!368597 (MissingVacant!6858 vacantSpotIndex!68))))

(assert (= (and d!90995 c!73721) b!643480))

(assert (= (and d!90995 (not c!73721)) b!643484))

(assert (= (and b!643484 c!73720) b!643481))

(assert (= (and b!643484 (not c!73720)) b!643482))

(assert (= (and b!643482 c!73719) b!643485))

(assert (= (and b!643482 (not c!73719)) b!643483))

(declare-fun m!617227 () Bool)

(assert (=> d!90995 m!617227))

(declare-fun m!617229 () Bool)

(assert (=> d!90995 m!617229))

(declare-fun m!617231 () Bool)

(assert (=> d!90995 m!617231))

(assert (=> d!90995 m!616939))

(assert (=> b!643483 m!617177))

(assert (=> b!643483 m!617177))

(assert (=> b!643483 m!616937))

(declare-fun m!617235 () Bool)

(assert (=> b!643483 m!617235))

(assert (=> b!643212 d!90995))

(assert (=> b!643203 d!90961))

(check-sat (not d!90993) (not bm!33592) (not bm!33584) (not b!643372) (not b!643443) (not b!643416) (not b!643479) (not b!643339) (not b!643425) (not b!643345) (not b!643394) (not d!90923) (not d!90981) (not b!643340) (not d!90929) (not b!643396) (not d!90995) (not b!643347) (not b!643413) (not d!90945) (not d!90943) (not b!643344) (not bm!33585) (not b!643361) (not b!643319) (not bm!33591) (not b!643483) (not b!643302) (not b!643417) (not d!90953) (not b!643418) (not b!643420) (not d!90977) (not b!643411) (not d!90951) (not b!643342) (not d!90979))
(check-sat)
