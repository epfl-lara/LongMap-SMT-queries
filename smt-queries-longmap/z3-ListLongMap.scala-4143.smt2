; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56502 () Bool)

(assert start!56502)

(declare-fun res!403960 () Bool)

(declare-fun e!358751 () Bool)

(assert (=> start!56502 (=> (not res!403960) (not e!358751))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56502 (= res!403960 (validMask!0 mask!3053))))

(assert (=> start!56502 e!358751))

(assert (=> start!56502 true))

(declare-datatypes ((array!37827 0))(
  ( (array!37828 (arr!18154 (Array (_ BitVec 32) (_ BitVec 64))) (size!18518 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37827)

(declare-fun array_inv!14013 (array!37827) Bool)

(assert (=> start!56502 (array_inv!14013 a!2986)))

(declare-fun b!626053 () Bool)

(declare-fun res!403962 () Bool)

(assert (=> b!626053 (=> (not res!403962) (not e!358751))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626053 (= res!403962 (validKeyInArray!0 k0!1786))))

(declare-fun b!626054 () Bool)

(declare-fun e!358752 () Bool)

(assert (=> b!626054 (= e!358751 e!358752)))

(declare-fun res!403961 () Bool)

(assert (=> b!626054 (=> (not res!403961) (not e!358752))))

(declare-datatypes ((SeekEntryResult!6550 0))(
  ( (MissingZero!6550 (index!28484 (_ BitVec 32))) (Found!6550 (index!28485 (_ BitVec 32))) (Intermediate!6550 (undefined!7362 Bool) (index!28486 (_ BitVec 32)) (x!57383 (_ BitVec 32))) (Undefined!6550) (MissingVacant!6550 (index!28487 (_ BitVec 32))) )
))
(declare-fun lt!290017 () SeekEntryResult!6550)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626054 (= res!403961 (or (= lt!290017 (MissingZero!6550 i!1108)) (= lt!290017 (MissingVacant!6550 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37827 (_ BitVec 32)) SeekEntryResult!6550)

(assert (=> b!626054 (= lt!290017 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626055 () Bool)

(declare-fun res!403957 () Bool)

(assert (=> b!626055 (=> (not res!403957) (not e!358752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37827 (_ BitVec 32)) Bool)

(assert (=> b!626055 (= res!403957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626056 () Bool)

(declare-fun res!403959 () Bool)

(assert (=> b!626056 (=> (not res!403959) (not e!358751))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626056 (= res!403959 (validKeyInArray!0 (select (arr!18154 a!2986) j!136)))))

(declare-fun b!626057 () Bool)

(declare-fun res!403954 () Bool)

(assert (=> b!626057 (=> (not res!403954) (not e!358752))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626057 (= res!403954 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18154 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18154 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626058 () Bool)

(declare-fun res!403955 () Bool)

(assert (=> b!626058 (=> (not res!403955) (not e!358751))))

(assert (=> b!626058 (= res!403955 (and (= (size!18518 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18518 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18518 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626059 () Bool)

(declare-fun lt!290016 () SeekEntryResult!6550)

(declare-fun e!358750 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37827 (_ BitVec 32)) SeekEntryResult!6550)

(assert (=> b!626059 (= e!358750 (not (= lt!290016 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18154 a!2986) i!1108 k0!1786) j!136) (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986)) mask!3053))))))

(declare-fun b!626060 () Bool)

(declare-fun res!403958 () Bool)

(assert (=> b!626060 (=> (not res!403958) (not e!358751))))

(declare-fun arrayContainsKey!0 (array!37827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626060 (= res!403958 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626061 () Bool)

(assert (=> b!626061 (= e!358752 e!358750)))

(declare-fun res!403963 () Bool)

(assert (=> b!626061 (=> (not res!403963) (not e!358750))))

(assert (=> b!626061 (= res!403963 (and (= lt!290016 (Found!6550 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18154 a!2986) index!984) (select (arr!18154 a!2986) j!136)) (= index!984 j!136)))))

(assert (=> b!626061 (= lt!290016 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18154 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626062 () Bool)

(declare-fun res!403956 () Bool)

(assert (=> b!626062 (=> (not res!403956) (not e!358752))))

(declare-datatypes ((List!12102 0))(
  ( (Nil!12099) (Cons!12098 (h!13146 (_ BitVec 64)) (t!18322 List!12102)) )
))
(declare-fun arrayNoDuplicates!0 (array!37827 (_ BitVec 32) List!12102) Bool)

(assert (=> b!626062 (= res!403956 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12099))))

(assert (= (and start!56502 res!403960) b!626058))

(assert (= (and b!626058 res!403955) b!626056))

(assert (= (and b!626056 res!403959) b!626053))

(assert (= (and b!626053 res!403962) b!626060))

(assert (= (and b!626060 res!403958) b!626054))

(assert (= (and b!626054 res!403961) b!626055))

(assert (= (and b!626055 res!403957) b!626062))

(assert (= (and b!626062 res!403956) b!626057))

(assert (= (and b!626057 res!403954) b!626061))

(assert (= (and b!626061 res!403963) b!626059))

(declare-fun m!601879 () Bool)

(assert (=> b!626062 m!601879))

(declare-fun m!601881 () Bool)

(assert (=> b!626059 m!601881))

(declare-fun m!601883 () Bool)

(assert (=> b!626059 m!601883))

(assert (=> b!626059 m!601883))

(declare-fun m!601885 () Bool)

(assert (=> b!626059 m!601885))

(declare-fun m!601887 () Bool)

(assert (=> b!626054 m!601887))

(declare-fun m!601889 () Bool)

(assert (=> b!626056 m!601889))

(assert (=> b!626056 m!601889))

(declare-fun m!601891 () Bool)

(assert (=> b!626056 m!601891))

(declare-fun m!601893 () Bool)

(assert (=> b!626053 m!601893))

(declare-fun m!601895 () Bool)

(assert (=> b!626060 m!601895))

(declare-fun m!601897 () Bool)

(assert (=> start!56502 m!601897))

(declare-fun m!601899 () Bool)

(assert (=> start!56502 m!601899))

(declare-fun m!601901 () Bool)

(assert (=> b!626055 m!601901))

(declare-fun m!601903 () Bool)

(assert (=> b!626061 m!601903))

(assert (=> b!626061 m!601889))

(assert (=> b!626061 m!601889))

(declare-fun m!601905 () Bool)

(assert (=> b!626061 m!601905))

(declare-fun m!601907 () Bool)

(assert (=> b!626057 m!601907))

(assert (=> b!626057 m!601881))

(declare-fun m!601909 () Bool)

(assert (=> b!626057 m!601909))

(check-sat (not b!626056) (not start!56502) (not b!626059) (not b!626054) (not b!626055) (not b!626061) (not b!626060) (not b!626053) (not b!626062))
(check-sat)
(get-model)

(declare-fun b!626131 () Bool)

(declare-fun e!358783 () Bool)

(declare-fun call!33225 () Bool)

(assert (=> b!626131 (= e!358783 call!33225)))

(declare-fun b!626132 () Bool)

(declare-fun e!358785 () Bool)

(assert (=> b!626132 (= e!358785 call!33225)))

(declare-fun b!626133 () Bool)

(declare-fun e!358784 () Bool)

(assert (=> b!626133 (= e!358784 e!358783)))

(declare-fun c!71420 () Bool)

(assert (=> b!626133 (= c!71420 (validKeyInArray!0 (select (arr!18154 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626134 () Bool)

(assert (=> b!626134 (= e!358783 e!358785)))

(declare-fun lt!290038 () (_ BitVec 64))

(assert (=> b!626134 (= lt!290038 (select (arr!18154 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21069 0))(
  ( (Unit!21070) )
))
(declare-fun lt!290036 () Unit!21069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37827 (_ BitVec 64) (_ BitVec 32)) Unit!21069)

(assert (=> b!626134 (= lt!290036 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290038 #b00000000000000000000000000000000))))

(assert (=> b!626134 (arrayContainsKey!0 a!2986 lt!290038 #b00000000000000000000000000000000)))

(declare-fun lt!290037 () Unit!21069)

(assert (=> b!626134 (= lt!290037 lt!290036)))

(declare-fun res!404029 () Bool)

(assert (=> b!626134 (= res!404029 (= (seekEntryOrOpen!0 (select (arr!18154 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6550 #b00000000000000000000000000000000)))))

(assert (=> b!626134 (=> (not res!404029) (not e!358785))))

(declare-fun d!88947 () Bool)

(declare-fun res!404028 () Bool)

(assert (=> d!88947 (=> res!404028 e!358784)))

(assert (=> d!88947 (= res!404028 (bvsge #b00000000000000000000000000000000 (size!18518 a!2986)))))

(assert (=> d!88947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358784)))

(declare-fun bm!33222 () Bool)

(assert (=> bm!33222 (= call!33225 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88947 (not res!404028)) b!626133))

(assert (= (and b!626133 c!71420) b!626134))

(assert (= (and b!626133 (not c!71420)) b!626131))

(assert (= (and b!626134 res!404029) b!626132))

(assert (= (or b!626132 b!626131) bm!33222))

(declare-fun m!601975 () Bool)

(assert (=> b!626133 m!601975))

(assert (=> b!626133 m!601975))

(declare-fun m!601977 () Bool)

(assert (=> b!626133 m!601977))

(assert (=> b!626134 m!601975))

(declare-fun m!601979 () Bool)

(assert (=> b!626134 m!601979))

(declare-fun m!601981 () Bool)

(assert (=> b!626134 m!601981))

(assert (=> b!626134 m!601975))

(declare-fun m!601983 () Bool)

(assert (=> b!626134 m!601983))

(declare-fun m!601985 () Bool)

(assert (=> bm!33222 m!601985))

(assert (=> b!626055 d!88947))

(declare-fun d!88949 () Bool)

(declare-fun lt!290044 () SeekEntryResult!6550)

(get-info :version)

(assert (=> d!88949 (and (or ((_ is Undefined!6550) lt!290044) (not ((_ is Found!6550) lt!290044)) (and (bvsge (index!28485 lt!290044) #b00000000000000000000000000000000) (bvslt (index!28485 lt!290044) (size!18518 a!2986)))) (or ((_ is Undefined!6550) lt!290044) ((_ is Found!6550) lt!290044) (not ((_ is MissingVacant!6550) lt!290044)) (not (= (index!28487 lt!290044) vacantSpotIndex!68)) (and (bvsge (index!28487 lt!290044) #b00000000000000000000000000000000) (bvslt (index!28487 lt!290044) (size!18518 a!2986)))) (or ((_ is Undefined!6550) lt!290044) (ite ((_ is Found!6550) lt!290044) (= (select (arr!18154 a!2986) (index!28485 lt!290044)) (select (arr!18154 a!2986) j!136)) (and ((_ is MissingVacant!6550) lt!290044) (= (index!28487 lt!290044) vacantSpotIndex!68) (= (select (arr!18154 a!2986) (index!28487 lt!290044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!358792 () SeekEntryResult!6550)

(assert (=> d!88949 (= lt!290044 e!358792)))

(declare-fun c!71427 () Bool)

(assert (=> d!88949 (= c!71427 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290043 () (_ BitVec 64))

(assert (=> d!88949 (= lt!290043 (select (arr!18154 a!2986) index!984))))

(assert (=> d!88949 (validMask!0 mask!3053)))

(assert (=> d!88949 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18154 a!2986) j!136) a!2986 mask!3053) lt!290044)))

(declare-fun b!626147 () Bool)

(declare-fun e!358794 () SeekEntryResult!6550)

(assert (=> b!626147 (= e!358792 e!358794)))

(declare-fun c!71428 () Bool)

(assert (=> b!626147 (= c!71428 (= lt!290043 (select (arr!18154 a!2986) j!136)))))

(declare-fun b!626148 () Bool)

(assert (=> b!626148 (= e!358792 Undefined!6550)))

(declare-fun b!626149 () Bool)

(declare-fun c!71429 () Bool)

(assert (=> b!626149 (= c!71429 (= lt!290043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358793 () SeekEntryResult!6550)

(assert (=> b!626149 (= e!358794 e!358793)))

(declare-fun b!626150 () Bool)

(assert (=> b!626150 (= e!358793 (MissingVacant!6550 vacantSpotIndex!68))))

(declare-fun b!626151 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626151 (= e!358793 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18154 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626152 () Bool)

(assert (=> b!626152 (= e!358794 (Found!6550 index!984))))

(assert (= (and d!88949 c!71427) b!626148))

(assert (= (and d!88949 (not c!71427)) b!626147))

(assert (= (and b!626147 c!71428) b!626152))

(assert (= (and b!626147 (not c!71428)) b!626149))

(assert (= (and b!626149 c!71429) b!626150))

(assert (= (and b!626149 (not c!71429)) b!626151))

(declare-fun m!601987 () Bool)

(assert (=> d!88949 m!601987))

(declare-fun m!601989 () Bool)

(assert (=> d!88949 m!601989))

(assert (=> d!88949 m!601903))

(assert (=> d!88949 m!601897))

(declare-fun m!601991 () Bool)

(assert (=> b!626151 m!601991))

(assert (=> b!626151 m!601991))

(assert (=> b!626151 m!601889))

(declare-fun m!601993 () Bool)

(assert (=> b!626151 m!601993))

(assert (=> b!626061 d!88949))

(declare-fun d!88951 () Bool)

(assert (=> d!88951 (= (validKeyInArray!0 (select (arr!18154 a!2986) j!136)) (and (not (= (select (arr!18154 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18154 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626056 d!88951))

(declare-fun d!88953 () Bool)

(declare-fun res!404038 () Bool)

(declare-fun e!358803 () Bool)

(assert (=> d!88953 (=> res!404038 e!358803)))

(assert (=> d!88953 (= res!404038 (bvsge #b00000000000000000000000000000000 (size!18518 a!2986)))))

(assert (=> d!88953 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12099) e!358803)))

(declare-fun b!626163 () Bool)

(declare-fun e!358806 () Bool)

(declare-fun call!33228 () Bool)

(assert (=> b!626163 (= e!358806 call!33228)))

(declare-fun b!626164 () Bool)

(assert (=> b!626164 (= e!358806 call!33228)))

(declare-fun b!626165 () Bool)

(declare-fun e!358804 () Bool)

(declare-fun contains!3051 (List!12102 (_ BitVec 64)) Bool)

(assert (=> b!626165 (= e!358804 (contains!3051 Nil!12099 (select (arr!18154 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626166 () Bool)

(declare-fun e!358805 () Bool)

(assert (=> b!626166 (= e!358803 e!358805)))

(declare-fun res!404036 () Bool)

(assert (=> b!626166 (=> (not res!404036) (not e!358805))))

(assert (=> b!626166 (= res!404036 (not e!358804))))

(declare-fun res!404037 () Bool)

(assert (=> b!626166 (=> (not res!404037) (not e!358804))))

(assert (=> b!626166 (= res!404037 (validKeyInArray!0 (select (arr!18154 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626167 () Bool)

(assert (=> b!626167 (= e!358805 e!358806)))

(declare-fun c!71432 () Bool)

(assert (=> b!626167 (= c!71432 (validKeyInArray!0 (select (arr!18154 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33225 () Bool)

(assert (=> bm!33225 (= call!33228 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71432 (Cons!12098 (select (arr!18154 a!2986) #b00000000000000000000000000000000) Nil!12099) Nil!12099)))))

(assert (= (and d!88953 (not res!404038)) b!626166))

(assert (= (and b!626166 res!404037) b!626165))

(assert (= (and b!626166 res!404036) b!626167))

(assert (= (and b!626167 c!71432) b!626164))

(assert (= (and b!626167 (not c!71432)) b!626163))

(assert (= (or b!626164 b!626163) bm!33225))

(assert (=> b!626165 m!601975))

(assert (=> b!626165 m!601975))

(declare-fun m!601995 () Bool)

(assert (=> b!626165 m!601995))

(assert (=> b!626166 m!601975))

(assert (=> b!626166 m!601975))

(assert (=> b!626166 m!601977))

(assert (=> b!626167 m!601975))

(assert (=> b!626167 m!601975))

(assert (=> b!626167 m!601977))

(assert (=> bm!33225 m!601975))

(declare-fun m!601997 () Bool)

(assert (=> bm!33225 m!601997))

(assert (=> b!626062 d!88953))

(declare-fun d!88955 () Bool)

(assert (=> d!88955 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56502 d!88955))

(declare-fun d!88963 () Bool)

(assert (=> d!88963 (= (array_inv!14013 a!2986) (bvsge (size!18518 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56502 d!88963))

(declare-fun d!88965 () Bool)

(assert (=> d!88965 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626053 d!88965))

(declare-fun d!88967 () Bool)

(declare-fun lt!290050 () SeekEntryResult!6550)

(assert (=> d!88967 (and (or ((_ is Undefined!6550) lt!290050) (not ((_ is Found!6550) lt!290050)) (and (bvsge (index!28485 lt!290050) #b00000000000000000000000000000000) (bvslt (index!28485 lt!290050) (size!18518 (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986)))))) (or ((_ is Undefined!6550) lt!290050) ((_ is Found!6550) lt!290050) (not ((_ is MissingVacant!6550) lt!290050)) (not (= (index!28487 lt!290050) vacantSpotIndex!68)) (and (bvsge (index!28487 lt!290050) #b00000000000000000000000000000000) (bvslt (index!28487 lt!290050) (size!18518 (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986)))))) (or ((_ is Undefined!6550) lt!290050) (ite ((_ is Found!6550) lt!290050) (= (select (arr!18154 (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986))) (index!28485 lt!290050)) (select (store (arr!18154 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6550) lt!290050) (= (index!28487 lt!290050) vacantSpotIndex!68) (= (select (arr!18154 (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986))) (index!28487 lt!290050)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!358825 () SeekEntryResult!6550)

(assert (=> d!88967 (= lt!290050 e!358825)))

(declare-fun c!71442 () Bool)

(assert (=> d!88967 (= c!71442 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290049 () (_ BitVec 64))

(assert (=> d!88967 (= lt!290049 (select (arr!18154 (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986))) index!984))))

(assert (=> d!88967 (validMask!0 mask!3053)))

(assert (=> d!88967 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18154 a!2986) i!1108 k0!1786) j!136) (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986)) mask!3053) lt!290050)))

(declare-fun b!626195 () Bool)

(declare-fun e!358827 () SeekEntryResult!6550)

(assert (=> b!626195 (= e!358825 e!358827)))

(declare-fun c!71443 () Bool)

(assert (=> b!626195 (= c!71443 (= lt!290049 (select (store (arr!18154 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!626196 () Bool)

(assert (=> b!626196 (= e!358825 Undefined!6550)))

(declare-fun b!626197 () Bool)

(declare-fun c!71444 () Bool)

(assert (=> b!626197 (= c!71444 (= lt!290049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358826 () SeekEntryResult!6550)

(assert (=> b!626197 (= e!358827 e!358826)))

(declare-fun b!626198 () Bool)

(assert (=> b!626198 (= e!358826 (MissingVacant!6550 vacantSpotIndex!68))))

(declare-fun b!626199 () Bool)

(assert (=> b!626199 (= e!358826 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (store (arr!18154 a!2986) i!1108 k0!1786) j!136) (array!37828 (store (arr!18154 a!2986) i!1108 k0!1786) (size!18518 a!2986)) mask!3053))))

(declare-fun b!626200 () Bool)

(assert (=> b!626200 (= e!358827 (Found!6550 index!984))))

(assert (= (and d!88967 c!71442) b!626196))

(assert (= (and d!88967 (not c!71442)) b!626195))

(assert (= (and b!626195 c!71443) b!626200))

(assert (= (and b!626195 (not c!71443)) b!626197))

(assert (= (and b!626197 c!71444) b!626198))

(assert (= (and b!626197 (not c!71444)) b!626199))

(declare-fun m!602007 () Bool)

(assert (=> d!88967 m!602007))

(declare-fun m!602009 () Bool)

(assert (=> d!88967 m!602009))

(declare-fun m!602011 () Bool)

(assert (=> d!88967 m!602011))

(assert (=> d!88967 m!601897))

(assert (=> b!626199 m!601991))

(assert (=> b!626199 m!601991))

(assert (=> b!626199 m!601883))

(declare-fun m!602013 () Bool)

(assert (=> b!626199 m!602013))

(assert (=> b!626059 d!88967))

(declare-fun b!626279 () Bool)

(declare-fun c!71480 () Bool)

(declare-fun lt!290088 () (_ BitVec 64))

(assert (=> b!626279 (= c!71480 (= lt!290088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358873 () SeekEntryResult!6550)

(declare-fun e!358875 () SeekEntryResult!6550)

(assert (=> b!626279 (= e!358873 e!358875)))

(declare-fun b!626280 () Bool)

(declare-fun lt!290089 () SeekEntryResult!6550)

(assert (=> b!626280 (= e!358873 (Found!6550 (index!28486 lt!290089)))))

(declare-fun d!88969 () Bool)

(declare-fun lt!290090 () SeekEntryResult!6550)

(assert (=> d!88969 (and (or ((_ is Undefined!6550) lt!290090) (not ((_ is Found!6550) lt!290090)) (and (bvsge (index!28485 lt!290090) #b00000000000000000000000000000000) (bvslt (index!28485 lt!290090) (size!18518 a!2986)))) (or ((_ is Undefined!6550) lt!290090) ((_ is Found!6550) lt!290090) (not ((_ is MissingZero!6550) lt!290090)) (and (bvsge (index!28484 lt!290090) #b00000000000000000000000000000000) (bvslt (index!28484 lt!290090) (size!18518 a!2986)))) (or ((_ is Undefined!6550) lt!290090) ((_ is Found!6550) lt!290090) ((_ is MissingZero!6550) lt!290090) (not ((_ is MissingVacant!6550) lt!290090)) (and (bvsge (index!28487 lt!290090) #b00000000000000000000000000000000) (bvslt (index!28487 lt!290090) (size!18518 a!2986)))) (or ((_ is Undefined!6550) lt!290090) (ite ((_ is Found!6550) lt!290090) (= (select (arr!18154 a!2986) (index!28485 lt!290090)) k0!1786) (ite ((_ is MissingZero!6550) lt!290090) (= (select (arr!18154 a!2986) (index!28484 lt!290090)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6550) lt!290090) (= (select (arr!18154 a!2986) (index!28487 lt!290090)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!358874 () SeekEntryResult!6550)

(assert (=> d!88969 (= lt!290090 e!358874)))

(declare-fun c!71479 () Bool)

(assert (=> d!88969 (= c!71479 (and ((_ is Intermediate!6550) lt!290089) (undefined!7362 lt!290089)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37827 (_ BitVec 32)) SeekEntryResult!6550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88969 (= lt!290089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88969 (validMask!0 mask!3053)))

(assert (=> d!88969 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290090)))

(declare-fun b!626281 () Bool)

(assert (=> b!626281 (= e!358875 (seekKeyOrZeroReturnVacant!0 (x!57383 lt!290089) (index!28486 lt!290089) (index!28486 lt!290089) k0!1786 a!2986 mask!3053))))

(declare-fun b!626282 () Bool)

(assert (=> b!626282 (= e!358875 (MissingZero!6550 (index!28486 lt!290089)))))

(declare-fun b!626283 () Bool)

(assert (=> b!626283 (= e!358874 Undefined!6550)))

(declare-fun b!626284 () Bool)

(assert (=> b!626284 (= e!358874 e!358873)))

(assert (=> b!626284 (= lt!290088 (select (arr!18154 a!2986) (index!28486 lt!290089)))))

(declare-fun c!71478 () Bool)

(assert (=> b!626284 (= c!71478 (= lt!290088 k0!1786))))

(assert (= (and d!88969 c!71479) b!626283))

(assert (= (and d!88969 (not c!71479)) b!626284))

(assert (= (and b!626284 c!71478) b!626280))

(assert (= (and b!626284 (not c!71478)) b!626279))

(assert (= (and b!626279 c!71480) b!626282))

(assert (= (and b!626279 (not c!71480)) b!626281))

(declare-fun m!602073 () Bool)

(assert (=> d!88969 m!602073))

(declare-fun m!602075 () Bool)

(assert (=> d!88969 m!602075))

(assert (=> d!88969 m!601897))

(assert (=> d!88969 m!602075))

(declare-fun m!602077 () Bool)

(assert (=> d!88969 m!602077))

(declare-fun m!602079 () Bool)

(assert (=> d!88969 m!602079))

(declare-fun m!602081 () Bool)

(assert (=> d!88969 m!602081))

(declare-fun m!602083 () Bool)

(assert (=> b!626281 m!602083))

(declare-fun m!602085 () Bool)

(assert (=> b!626284 m!602085))

(assert (=> b!626054 d!88969))

(declare-fun d!88985 () Bool)

(declare-fun res!404070 () Bool)

(declare-fun e!358888 () Bool)

(assert (=> d!88985 (=> res!404070 e!358888)))

(assert (=> d!88985 (= res!404070 (= (select (arr!18154 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88985 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358888)))

(declare-fun b!626299 () Bool)

(declare-fun e!358889 () Bool)

(assert (=> b!626299 (= e!358888 e!358889)))

(declare-fun res!404071 () Bool)

(assert (=> b!626299 (=> (not res!404071) (not e!358889))))

(assert (=> b!626299 (= res!404071 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18518 a!2986)))))

(declare-fun b!626300 () Bool)

(assert (=> b!626300 (= e!358889 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88985 (not res!404070)) b!626299))

(assert (= (and b!626299 res!404071) b!626300))

(assert (=> d!88985 m!601975))

(declare-fun m!602087 () Bool)

(assert (=> b!626300 m!602087))

(assert (=> b!626060 d!88985))

(check-sat (not d!88949) (not b!626151) (not b!626133) (not b!626134) (not b!626281) (not d!88969) (not bm!33225) (not b!626300) (not b!626199) (not b!626165) (not d!88967) (not bm!33222) (not b!626166) (not b!626167))
(check-sat)
