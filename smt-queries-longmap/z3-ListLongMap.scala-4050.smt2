; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55392 () Bool)

(assert start!55392)

(declare-fun res!389347 () Bool)

(declare-fun e!346940 () Bool)

(assert (=> start!55392 (=> (not res!389347) (not e!346940))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55392 (= res!389347 (validMask!0 mask!3053))))

(assert (=> start!55392 e!346940))

(assert (=> start!55392 true))

(declare-datatypes ((array!37248 0))(
  ( (array!37249 (arr!17875 (Array (_ BitVec 32) (_ BitVec 64))) (size!18239 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37248)

(declare-fun array_inv!13734 (array!37248) Bool)

(assert (=> start!55392 (array_inv!13734 a!2986)))

(declare-fun b!606080 () Bool)

(declare-fun e!346953 () Bool)

(declare-fun e!346939 () Bool)

(assert (=> b!606080 (= e!346953 e!346939)))

(declare-fun res!389356 () Bool)

(assert (=> b!606080 (=> res!389356 e!346939)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!606080 (= res!389356 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19279 0))(
  ( (Unit!19280) )
))
(declare-fun lt!276594 () Unit!19279)

(declare-fun e!346944 () Unit!19279)

(assert (=> b!606080 (= lt!276594 e!346944)))

(declare-fun c!68738 () Bool)

(assert (=> b!606080 (= c!68738 (bvslt j!136 index!984))))

(declare-fun b!606081 () Bool)

(declare-fun res!389362 () Bool)

(declare-fun e!346952 () Bool)

(assert (=> b!606081 (=> (not res!389362) (not e!346952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37248 (_ BitVec 32)) Bool)

(assert (=> b!606081 (= res!389362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606082 () Bool)

(declare-fun e!346948 () Unit!19279)

(declare-fun Unit!19281 () Unit!19279)

(assert (=> b!606082 (= e!346948 Unit!19281)))

(assert (=> b!606082 false))

(declare-fun e!346947 () Bool)

(declare-fun lt!276593 () array!37248)

(declare-fun b!606083 () Bool)

(declare-fun arrayContainsKey!0 (array!37248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606083 (= e!346947 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) index!984))))

(declare-fun b!606084 () Bool)

(declare-fun res!389353 () Bool)

(assert (=> b!606084 (=> (not res!389353) (not e!346940))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!606084 (= res!389353 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!606085 () Bool)

(declare-fun e!346946 () Bool)

(assert (=> b!606085 (= e!346946 e!346947)))

(declare-fun res!389350 () Bool)

(assert (=> b!606085 (=> (not res!389350) (not e!346947))))

(assert (=> b!606085 (= res!389350 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136))))

(declare-fun b!606086 () Bool)

(declare-fun e!346950 () Bool)

(assert (=> b!606086 (= e!346950 e!346953)))

(declare-fun res!389352 () Bool)

(assert (=> b!606086 (=> res!389352 e!346953)))

(declare-fun lt!276591 () (_ BitVec 64))

(declare-fun lt!276595 () (_ BitVec 64))

(assert (=> b!606086 (= res!389352 (or (not (= (select (arr!17875 a!2986) j!136) lt!276591)) (not (= (select (arr!17875 a!2986) j!136) lt!276595))))))

(declare-fun e!346951 () Bool)

(assert (=> b!606086 e!346951))

(declare-fun res!389354 () Bool)

(assert (=> b!606086 (=> (not res!389354) (not e!346951))))

(assert (=> b!606086 (= res!389354 (= lt!276595 (select (arr!17875 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!606086 (= lt!276595 (select (store (arr!17875 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!606087 () Bool)

(declare-fun e!346938 () Bool)

(assert (=> b!606087 (= e!346939 e!346938)))

(declare-fun res!389358 () Bool)

(assert (=> b!606087 (=> res!389358 e!346938)))

(assert (=> b!606087 (= res!389358 (or (bvsgt #b00000000000000000000000000000000 (size!18239 a!2986)) (bvsge (size!18239 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!606087 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276586 () Unit!19279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19279)

(assert (=> b!606087 (= lt!276586 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!346949 () Bool)

(assert (=> b!606087 e!346949))

(declare-fun res!389349 () Bool)

(assert (=> b!606087 (=> (not res!389349) (not e!346949))))

(assert (=> b!606087 (= res!389349 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136))))

(declare-fun b!606088 () Bool)

(declare-fun res!389360 () Bool)

(assert (=> b!606088 (=> (not res!389360) (not e!346952))))

(declare-datatypes ((List!11823 0))(
  ( (Nil!11820) (Cons!11819 (h!12867 (_ BitVec 64)) (t!18043 List!11823)) )
))
(declare-fun arrayNoDuplicates!0 (array!37248 (_ BitVec 32) List!11823) Bool)

(assert (=> b!606088 (= res!389360 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11820))))

(declare-fun b!606089 () Bool)

(declare-fun res!389359 () Bool)

(assert (=> b!606089 (=> (not res!389359) (not e!346952))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!606089 (= res!389359 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17875 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606090 () Bool)

(declare-fun Unit!19282 () Unit!19279)

(assert (=> b!606090 (= e!346948 Unit!19282)))

(declare-fun b!606091 () Bool)

(declare-fun e!346943 () Bool)

(declare-datatypes ((SeekEntryResult!6271 0))(
  ( (MissingZero!6271 (index!27353 (_ BitVec 32))) (Found!6271 (index!27354 (_ BitVec 32))) (Intermediate!6271 (undefined!7083 Bool) (index!27355 (_ BitVec 32)) (x!56309 (_ BitVec 32))) (Undefined!6271) (MissingVacant!6271 (index!27356 (_ BitVec 32))) )
))
(declare-fun lt!276599 () SeekEntryResult!6271)

(declare-fun lt!276601 () SeekEntryResult!6271)

(assert (=> b!606091 (= e!346943 (= lt!276599 lt!276601))))

(declare-fun b!606092 () Bool)

(declare-fun Unit!19283 () Unit!19279)

(assert (=> b!606092 (= e!346944 Unit!19283)))

(declare-fun lt!276600 () Unit!19279)

(assert (=> b!606092 (= lt!276600 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276593 (select (arr!17875 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606092 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276597 () Unit!19279)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11823) Unit!19279)

(assert (=> b!606092 (= lt!276597 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11820))))

(assert (=> b!606092 (arrayNoDuplicates!0 lt!276593 #b00000000000000000000000000000000 Nil!11820)))

(declare-fun lt!276589 () Unit!19279)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37248 (_ BitVec 32) (_ BitVec 32)) Unit!19279)

(assert (=> b!606092 (= lt!276589 (lemmaNoDuplicateFromThenFromBigger!0 lt!276593 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606092 (arrayNoDuplicates!0 lt!276593 j!136 Nil!11820)))

(declare-fun lt!276596 () Unit!19279)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37248 (_ BitVec 64) (_ BitVec 32) List!11823) Unit!19279)

(assert (=> b!606092 (= lt!276596 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136 Nil!11820))))

(assert (=> b!606092 false))

(declare-fun b!606093 () Bool)

(declare-fun res!389348 () Bool)

(assert (=> b!606093 (=> (not res!389348) (not e!346940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606093 (= res!389348 (validKeyInArray!0 k0!1786))))

(declare-fun b!606094 () Bool)

(declare-fun noDuplicate!307 (List!11823) Bool)

(assert (=> b!606094 (= e!346938 (noDuplicate!307 Nil!11820))))

(declare-fun b!606095 () Bool)

(declare-fun e!346945 () Bool)

(assert (=> b!606095 (= e!346945 (not e!346950))))

(declare-fun res!389346 () Bool)

(assert (=> b!606095 (=> res!389346 e!346950)))

(declare-fun lt!276590 () SeekEntryResult!6271)

(assert (=> b!606095 (= res!389346 (not (= lt!276590 (Found!6271 index!984))))))

(declare-fun lt!276598 () Unit!19279)

(assert (=> b!606095 (= lt!276598 e!346948)))

(declare-fun c!68737 () Bool)

(assert (=> b!606095 (= c!68737 (= lt!276590 Undefined!6271))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37248 (_ BitVec 32)) SeekEntryResult!6271)

(assert (=> b!606095 (= lt!276590 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276591 lt!276593 mask!3053))))

(assert (=> b!606095 e!346943))

(declare-fun res!389357 () Bool)

(assert (=> b!606095 (=> (not res!389357) (not e!346943))))

(declare-fun lt!276592 () (_ BitVec 32))

(assert (=> b!606095 (= res!389357 (= lt!276601 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 lt!276591 lt!276593 mask!3053)))))

(assert (=> b!606095 (= lt!276601 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!606095 (= lt!276591 (select (store (arr!17875 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276588 () Unit!19279)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19279)

(assert (=> b!606095 (= lt!276588 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606095 (= lt!276592 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!606096 () Bool)

(assert (=> b!606096 (= e!346940 e!346952)))

(declare-fun res!389345 () Bool)

(assert (=> b!606096 (=> (not res!389345) (not e!346952))))

(declare-fun lt!276587 () SeekEntryResult!6271)

(assert (=> b!606096 (= res!389345 (or (= lt!276587 (MissingZero!6271 i!1108)) (= lt!276587 (MissingVacant!6271 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37248 (_ BitVec 32)) SeekEntryResult!6271)

(assert (=> b!606096 (= lt!276587 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!606097 () Bool)

(declare-fun res!389351 () Bool)

(assert (=> b!606097 (=> (not res!389351) (not e!346940))))

(assert (=> b!606097 (= res!389351 (and (= (size!18239 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18239 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18239 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606098 () Bool)

(assert (=> b!606098 (= e!346949 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) index!984))))

(declare-fun b!606099 () Bool)

(declare-fun e!346942 () Bool)

(assert (=> b!606099 (= e!346952 e!346942)))

(declare-fun res!389344 () Bool)

(assert (=> b!606099 (=> (not res!389344) (not e!346942))))

(assert (=> b!606099 (= res!389344 (= (select (store (arr!17875 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606099 (= lt!276593 (array!37249 (store (arr!17875 a!2986) i!1108 k0!1786) (size!18239 a!2986)))))

(declare-fun b!606100 () Bool)

(assert (=> b!606100 (= e!346951 e!346946)))

(declare-fun res!389355 () Bool)

(assert (=> b!606100 (=> res!389355 e!346946)))

(assert (=> b!606100 (= res!389355 (or (not (= (select (arr!17875 a!2986) j!136) lt!276591)) (not (= (select (arr!17875 a!2986) j!136) lt!276595)) (bvsge j!136 index!984)))))

(declare-fun b!606101 () Bool)

(assert (=> b!606101 (= e!346942 e!346945)))

(declare-fun res!389361 () Bool)

(assert (=> b!606101 (=> (not res!389361) (not e!346945))))

(assert (=> b!606101 (= res!389361 (and (= lt!276599 (Found!6271 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17875 a!2986) index!984) (select (arr!17875 a!2986) j!136))) (not (= (select (arr!17875 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606101 (= lt!276599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606102 () Bool)

(declare-fun res!389343 () Bool)

(assert (=> b!606102 (=> (not res!389343) (not e!346940))))

(assert (=> b!606102 (= res!389343 (validKeyInArray!0 (select (arr!17875 a!2986) j!136)))))

(declare-fun b!606103 () Bool)

(declare-fun Unit!19284 () Unit!19279)

(assert (=> b!606103 (= e!346944 Unit!19284)))

(assert (= (and start!55392 res!389347) b!606097))

(assert (= (and b!606097 res!389351) b!606102))

(assert (= (and b!606102 res!389343) b!606093))

(assert (= (and b!606093 res!389348) b!606084))

(assert (= (and b!606084 res!389353) b!606096))

(assert (= (and b!606096 res!389345) b!606081))

(assert (= (and b!606081 res!389362) b!606088))

(assert (= (and b!606088 res!389360) b!606089))

(assert (= (and b!606089 res!389359) b!606099))

(assert (= (and b!606099 res!389344) b!606101))

(assert (= (and b!606101 res!389361) b!606095))

(assert (= (and b!606095 res!389357) b!606091))

(assert (= (and b!606095 c!68737) b!606082))

(assert (= (and b!606095 (not c!68737)) b!606090))

(assert (= (and b!606095 (not res!389346)) b!606086))

(assert (= (and b!606086 res!389354) b!606100))

(assert (= (and b!606100 (not res!389355)) b!606085))

(assert (= (and b!606085 res!389350) b!606083))

(assert (= (and b!606086 (not res!389352)) b!606080))

(assert (= (and b!606080 c!68738) b!606092))

(assert (= (and b!606080 (not c!68738)) b!606103))

(assert (= (and b!606080 (not res!389356)) b!606087))

(assert (= (and b!606087 res!389349) b!606098))

(assert (= (and b!606087 (not res!389358)) b!606094))

(declare-fun m!583169 () Bool)

(assert (=> b!606096 m!583169))

(declare-fun m!583171 () Bool)

(assert (=> b!606084 m!583171))

(declare-fun m!583173 () Bool)

(assert (=> start!55392 m!583173))

(declare-fun m!583175 () Bool)

(assert (=> start!55392 m!583175))

(declare-fun m!583177 () Bool)

(assert (=> b!606102 m!583177))

(assert (=> b!606102 m!583177))

(declare-fun m!583179 () Bool)

(assert (=> b!606102 m!583179))

(assert (=> b!606098 m!583177))

(assert (=> b!606098 m!583177))

(declare-fun m!583181 () Bool)

(assert (=> b!606098 m!583181))

(declare-fun m!583183 () Bool)

(assert (=> b!606093 m!583183))

(assert (=> b!606085 m!583177))

(assert (=> b!606085 m!583177))

(declare-fun m!583185 () Bool)

(assert (=> b!606085 m!583185))

(declare-fun m!583187 () Bool)

(assert (=> b!606095 m!583187))

(declare-fun m!583189 () Bool)

(assert (=> b!606095 m!583189))

(assert (=> b!606095 m!583177))

(declare-fun m!583191 () Bool)

(assert (=> b!606095 m!583191))

(declare-fun m!583193 () Bool)

(assert (=> b!606095 m!583193))

(assert (=> b!606095 m!583177))

(declare-fun m!583195 () Bool)

(assert (=> b!606095 m!583195))

(declare-fun m!583197 () Bool)

(assert (=> b!606095 m!583197))

(declare-fun m!583199 () Bool)

(assert (=> b!606095 m!583199))

(declare-fun m!583201 () Bool)

(assert (=> b!606101 m!583201))

(assert (=> b!606101 m!583177))

(assert (=> b!606101 m!583177))

(declare-fun m!583203 () Bool)

(assert (=> b!606101 m!583203))

(assert (=> b!606087 m!583177))

(assert (=> b!606087 m!583177))

(declare-fun m!583205 () Bool)

(assert (=> b!606087 m!583205))

(assert (=> b!606087 m!583177))

(declare-fun m!583207 () Bool)

(assert (=> b!606087 m!583207))

(assert (=> b!606087 m!583177))

(assert (=> b!606087 m!583185))

(declare-fun m!583209 () Bool)

(assert (=> b!606081 m!583209))

(assert (=> b!606092 m!583177))

(assert (=> b!606092 m!583177))

(declare-fun m!583211 () Bool)

(assert (=> b!606092 m!583211))

(declare-fun m!583213 () Bool)

(assert (=> b!606092 m!583213))

(declare-fun m!583215 () Bool)

(assert (=> b!606092 m!583215))

(assert (=> b!606092 m!583177))

(declare-fun m!583217 () Bool)

(assert (=> b!606092 m!583217))

(assert (=> b!606092 m!583177))

(declare-fun m!583219 () Bool)

(assert (=> b!606092 m!583219))

(declare-fun m!583221 () Bool)

(assert (=> b!606092 m!583221))

(declare-fun m!583223 () Bool)

(assert (=> b!606092 m!583223))

(declare-fun m!583225 () Bool)

(assert (=> b!606089 m!583225))

(declare-fun m!583227 () Bool)

(assert (=> b!606088 m!583227))

(assert (=> b!606100 m!583177))

(assert (=> b!606099 m!583191))

(declare-fun m!583229 () Bool)

(assert (=> b!606099 m!583229))

(declare-fun m!583231 () Bool)

(assert (=> b!606094 m!583231))

(assert (=> b!606083 m!583177))

(assert (=> b!606083 m!583177))

(assert (=> b!606083 m!583181))

(assert (=> b!606086 m!583177))

(assert (=> b!606086 m!583191))

(declare-fun m!583233 () Bool)

(assert (=> b!606086 m!583233))

(check-sat (not b!606098) (not start!55392) (not b!606101) (not b!606083) (not b!606092) (not b!606095) (not b!606088) (not b!606084) (not b!606096) (not b!606085) (not b!606094) (not b!606081) (not b!606087) (not b!606093) (not b!606102))
(check-sat)
(get-model)

(declare-fun d!87855 () Bool)

(declare-fun res!389487 () Bool)

(declare-fun e!347054 () Bool)

(assert (=> d!87855 (=> res!389487 e!347054)))

(assert (=> d!87855 (= res!389487 (= (select (arr!17875 lt!276593) index!984) (select (arr!17875 a!2986) j!136)))))

(assert (=> d!87855 (= (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) index!984) e!347054)))

(declare-fun b!606252 () Bool)

(declare-fun e!347055 () Bool)

(assert (=> b!606252 (= e!347054 e!347055)))

(declare-fun res!389488 () Bool)

(assert (=> b!606252 (=> (not res!389488) (not e!347055))))

(assert (=> b!606252 (= res!389488 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18239 lt!276593)))))

(declare-fun b!606253 () Bool)

(assert (=> b!606253 (= e!347055 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87855 (not res!389487)) b!606252))

(assert (= (and b!606252 res!389488) b!606253))

(declare-fun m!583367 () Bool)

(assert (=> d!87855 m!583367))

(assert (=> b!606253 m!583177))

(declare-fun m!583369 () Bool)

(assert (=> b!606253 m!583369))

(assert (=> b!606098 d!87855))

(declare-fun b!606264 () Bool)

(declare-fun e!347067 () Bool)

(declare-fun contains!2973 (List!11823 (_ BitVec 64)) Bool)

(assert (=> b!606264 (= e!347067 (contains!2973 Nil!11820 (select (arr!17875 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606265 () Bool)

(declare-fun e!347065 () Bool)

(declare-fun call!33069 () Bool)

(assert (=> b!606265 (= e!347065 call!33069)))

(declare-fun bm!33066 () Bool)

(declare-fun c!68753 () Bool)

(assert (=> bm!33066 (= call!33069 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68753 (Cons!11819 (select (arr!17875 a!2986) #b00000000000000000000000000000000) Nil!11820) Nil!11820)))))

(declare-fun b!606266 () Bool)

(declare-fun e!347064 () Bool)

(declare-fun e!347066 () Bool)

(assert (=> b!606266 (= e!347064 e!347066)))

(declare-fun res!389497 () Bool)

(assert (=> b!606266 (=> (not res!389497) (not e!347066))))

(assert (=> b!606266 (= res!389497 (not e!347067))))

(declare-fun res!389496 () Bool)

(assert (=> b!606266 (=> (not res!389496) (not e!347067))))

(assert (=> b!606266 (= res!389496 (validKeyInArray!0 (select (arr!17875 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87857 () Bool)

(declare-fun res!389495 () Bool)

(assert (=> d!87857 (=> res!389495 e!347064)))

(assert (=> d!87857 (= res!389495 (bvsge #b00000000000000000000000000000000 (size!18239 a!2986)))))

(assert (=> d!87857 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11820) e!347064)))

(declare-fun b!606267 () Bool)

(assert (=> b!606267 (= e!347066 e!347065)))

(assert (=> b!606267 (= c!68753 (validKeyInArray!0 (select (arr!17875 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606268 () Bool)

(assert (=> b!606268 (= e!347065 call!33069)))

(assert (= (and d!87857 (not res!389495)) b!606266))

(assert (= (and b!606266 res!389496) b!606264))

(assert (= (and b!606266 res!389497) b!606267))

(assert (= (and b!606267 c!68753) b!606265))

(assert (= (and b!606267 (not c!68753)) b!606268))

(assert (= (or b!606265 b!606268) bm!33066))

(declare-fun m!583371 () Bool)

(assert (=> b!606264 m!583371))

(assert (=> b!606264 m!583371))

(declare-fun m!583373 () Bool)

(assert (=> b!606264 m!583373))

(assert (=> bm!33066 m!583371))

(declare-fun m!583375 () Bool)

(assert (=> bm!33066 m!583375))

(assert (=> b!606266 m!583371))

(assert (=> b!606266 m!583371))

(declare-fun m!583377 () Bool)

(assert (=> b!606266 m!583377))

(assert (=> b!606267 m!583371))

(assert (=> b!606267 m!583371))

(assert (=> b!606267 m!583377))

(assert (=> b!606088 d!87857))

(declare-fun d!87859 () Bool)

(declare-fun res!389498 () Bool)

(declare-fun e!347068 () Bool)

(assert (=> d!87859 (=> res!389498 e!347068)))

(assert (=> d!87859 (= res!389498 (= (select (arr!17875 lt!276593) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17875 a!2986) j!136)))))

(assert (=> d!87859 (= (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!347068)))

(declare-fun b!606269 () Bool)

(declare-fun e!347069 () Bool)

(assert (=> b!606269 (= e!347068 e!347069)))

(declare-fun res!389499 () Bool)

(assert (=> b!606269 (=> (not res!389499) (not e!347069))))

(assert (=> b!606269 (= res!389499 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18239 lt!276593)))))

(declare-fun b!606270 () Bool)

(assert (=> b!606270 (= e!347069 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87859 (not res!389498)) b!606269))

(assert (= (and b!606269 res!389499) b!606270))

(declare-fun m!583379 () Bool)

(assert (=> d!87859 m!583379))

(assert (=> b!606270 m!583177))

(declare-fun m!583381 () Bool)

(assert (=> b!606270 m!583381))

(assert (=> b!606087 d!87859))

(declare-fun d!87861 () Bool)

(assert (=> d!87861 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276700 () Unit!19279)

(declare-fun choose!114 (array!37248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19279)

(assert (=> d!87861 (= lt!276700 (choose!114 lt!276593 (select (arr!17875 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87861 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87861 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276700)))

(declare-fun bs!18557 () Bool)

(assert (= bs!18557 d!87861))

(assert (=> bs!18557 m!583177))

(assert (=> bs!18557 m!583205))

(assert (=> bs!18557 m!583177))

(declare-fun m!583383 () Bool)

(assert (=> bs!18557 m!583383))

(assert (=> b!606087 d!87861))

(declare-fun d!87863 () Bool)

(declare-fun res!389500 () Bool)

(declare-fun e!347070 () Bool)

(assert (=> d!87863 (=> res!389500 e!347070)))

(assert (=> d!87863 (= res!389500 (= (select (arr!17875 lt!276593) j!136) (select (arr!17875 a!2986) j!136)))))

(assert (=> d!87863 (= (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136) e!347070)))

(declare-fun b!606271 () Bool)

(declare-fun e!347071 () Bool)

(assert (=> b!606271 (= e!347070 e!347071)))

(declare-fun res!389501 () Bool)

(assert (=> b!606271 (=> (not res!389501) (not e!347071))))

(assert (=> b!606271 (= res!389501 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18239 lt!276593)))))

(declare-fun b!606272 () Bool)

(assert (=> b!606272 (= e!347071 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87863 (not res!389500)) b!606271))

(assert (= (and b!606271 res!389501) b!606272))

(declare-fun m!583385 () Bool)

(assert (=> d!87863 m!583385))

(assert (=> b!606272 m!583177))

(declare-fun m!583387 () Bool)

(assert (=> b!606272 m!583387))

(assert (=> b!606087 d!87863))

(declare-fun b!606285 () Bool)

(declare-fun e!347080 () SeekEntryResult!6271)

(assert (=> b!606285 (= e!347080 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!606286 () Bool)

(declare-fun e!347078 () SeekEntryResult!6271)

(assert (=> b!606286 (= e!347078 (Found!6271 index!984))))

(declare-fun b!606287 () Bool)

(declare-fun e!347079 () SeekEntryResult!6271)

(assert (=> b!606287 (= e!347079 Undefined!6271)))

(declare-fun b!606288 () Bool)

(declare-fun c!68762 () Bool)

(declare-fun lt!276706 () (_ BitVec 64))

(assert (=> b!606288 (= c!68762 (= lt!276706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606288 (= e!347078 e!347080)))

(declare-fun b!606289 () Bool)

(assert (=> b!606289 (= e!347079 e!347078)))

(declare-fun c!68760 () Bool)

(assert (=> b!606289 (= c!68760 (= lt!276706 (select (arr!17875 a!2986) j!136)))))

(declare-fun b!606290 () Bool)

(assert (=> b!606290 (= e!347080 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!276705 () SeekEntryResult!6271)

(declare-fun d!87865 () Bool)

(get-info :version)

(assert (=> d!87865 (and (or ((_ is Undefined!6271) lt!276705) (not ((_ is Found!6271) lt!276705)) (and (bvsge (index!27354 lt!276705) #b00000000000000000000000000000000) (bvslt (index!27354 lt!276705) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276705) ((_ is Found!6271) lt!276705) (not ((_ is MissingVacant!6271) lt!276705)) (not (= (index!27356 lt!276705) vacantSpotIndex!68)) (and (bvsge (index!27356 lt!276705) #b00000000000000000000000000000000) (bvslt (index!27356 lt!276705) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276705) (ite ((_ is Found!6271) lt!276705) (= (select (arr!17875 a!2986) (index!27354 lt!276705)) (select (arr!17875 a!2986) j!136)) (and ((_ is MissingVacant!6271) lt!276705) (= (index!27356 lt!276705) vacantSpotIndex!68) (= (select (arr!17875 a!2986) (index!27356 lt!276705)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87865 (= lt!276705 e!347079)))

(declare-fun c!68761 () Bool)

(assert (=> d!87865 (= c!68761 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87865 (= lt!276706 (select (arr!17875 a!2986) index!984))))

(assert (=> d!87865 (validMask!0 mask!3053)))

(assert (=> d!87865 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053) lt!276705)))

(assert (= (and d!87865 c!68761) b!606287))

(assert (= (and d!87865 (not c!68761)) b!606289))

(assert (= (and b!606289 c!68760) b!606286))

(assert (= (and b!606289 (not c!68760)) b!606288))

(assert (= (and b!606288 c!68762) b!606285))

(assert (= (and b!606288 (not c!68762)) b!606290))

(declare-fun m!583389 () Bool)

(assert (=> b!606290 m!583389))

(assert (=> b!606290 m!583389))

(assert (=> b!606290 m!583177))

(declare-fun m!583391 () Bool)

(assert (=> b!606290 m!583391))

(declare-fun m!583393 () Bool)

(assert (=> d!87865 m!583393))

(declare-fun m!583395 () Bool)

(assert (=> d!87865 m!583395))

(assert (=> d!87865 m!583201))

(assert (=> d!87865 m!583173))

(assert (=> b!606101 d!87865))

(declare-fun d!87867 () Bool)

(assert (=> d!87867 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606093 d!87867))

(declare-fun d!87869 () Bool)

(assert (=> d!87869 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55392 d!87869))

(declare-fun d!87875 () Bool)

(assert (=> d!87875 (= (array_inv!13734 a!2986) (bvsge (size!18239 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55392 d!87875))

(assert (=> b!606083 d!87855))

(declare-fun d!87877 () Bool)

(assert (=> d!87877 (= (validKeyInArray!0 (select (arr!17875 a!2986) j!136)) (and (not (= (select (arr!17875 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17875 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606102 d!87877))

(declare-fun b!606331 () Bool)

(declare-fun e!347110 () Bool)

(declare-fun e!347111 () Bool)

(assert (=> b!606331 (= e!347110 e!347111)))

(declare-fun c!68774 () Bool)

(assert (=> b!606331 (= c!68774 (validKeyInArray!0 (select (arr!17875 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606332 () Bool)

(declare-fun call!33072 () Bool)

(assert (=> b!606332 (= e!347111 call!33072)))

(declare-fun bm!33069 () Bool)

(assert (=> bm!33069 (= call!33072 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!606333 () Bool)

(declare-fun e!347112 () Bool)

(assert (=> b!606333 (= e!347112 call!33072)))

(declare-fun b!606334 () Bool)

(assert (=> b!606334 (= e!347111 e!347112)))

(declare-fun lt!276723 () (_ BitVec 64))

(assert (=> b!606334 (= lt!276723 (select (arr!17875 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276722 () Unit!19279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37248 (_ BitVec 64) (_ BitVec 32)) Unit!19279)

(assert (=> b!606334 (= lt!276722 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276723 #b00000000000000000000000000000000))))

(assert (=> b!606334 (arrayContainsKey!0 a!2986 lt!276723 #b00000000000000000000000000000000)))

(declare-fun lt!276724 () Unit!19279)

(assert (=> b!606334 (= lt!276724 lt!276722)))

(declare-fun res!389521 () Bool)

(assert (=> b!606334 (= res!389521 (= (seekEntryOrOpen!0 (select (arr!17875 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6271 #b00000000000000000000000000000000)))))

(assert (=> b!606334 (=> (not res!389521) (not e!347112))))

(declare-fun d!87879 () Bool)

(declare-fun res!389520 () Bool)

(assert (=> d!87879 (=> res!389520 e!347110)))

(assert (=> d!87879 (= res!389520 (bvsge #b00000000000000000000000000000000 (size!18239 a!2986)))))

(assert (=> d!87879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347110)))

(assert (= (and d!87879 (not res!389520)) b!606331))

(assert (= (and b!606331 c!68774) b!606334))

(assert (= (and b!606331 (not c!68774)) b!606332))

(assert (= (and b!606334 res!389521) b!606333))

(assert (= (or b!606333 b!606332) bm!33069))

(assert (=> b!606331 m!583371))

(assert (=> b!606331 m!583371))

(assert (=> b!606331 m!583377))

(declare-fun m!583419 () Bool)

(assert (=> bm!33069 m!583419))

(assert (=> b!606334 m!583371))

(declare-fun m!583421 () Bool)

(assert (=> b!606334 m!583421))

(declare-fun m!583423 () Bool)

(assert (=> b!606334 m!583423))

(assert (=> b!606334 m!583371))

(declare-fun m!583425 () Bool)

(assert (=> b!606334 m!583425))

(assert (=> b!606081 d!87879))

(declare-fun d!87891 () Bool)

(assert (=> d!87891 (arrayNoDuplicates!0 lt!276593 j!136 Nil!11820)))

(declare-fun lt!276727 () Unit!19279)

(declare-fun choose!39 (array!37248 (_ BitVec 32) (_ BitVec 32)) Unit!19279)

(assert (=> d!87891 (= lt!276727 (choose!39 lt!276593 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87891 (bvslt (size!18239 lt!276593) #b01111111111111111111111111111111)))

(assert (=> d!87891 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276593 #b00000000000000000000000000000000 j!136) lt!276727)))

(declare-fun bs!18559 () Bool)

(assert (= bs!18559 d!87891))

(assert (=> bs!18559 m!583215))

(declare-fun m!583437 () Bool)

(assert (=> bs!18559 m!583437))

(assert (=> b!606092 d!87891))

(declare-fun d!87897 () Bool)

(assert (=> d!87897 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276728 () Unit!19279)

(assert (=> d!87897 (= lt!276728 (choose!114 lt!276593 (select (arr!17875 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87897 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87897 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276593 (select (arr!17875 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276728)))

(declare-fun bs!18560 () Bool)

(assert (= bs!18560 d!87897))

(assert (=> bs!18560 m!583177))

(assert (=> bs!18560 m!583219))

(assert (=> bs!18560 m!583177))

(declare-fun m!583441 () Bool)

(assert (=> bs!18560 m!583441))

(assert (=> b!606092 d!87897))

(declare-fun b!606353 () Bool)

(declare-fun e!347130 () Bool)

(assert (=> b!606353 (= e!347130 (contains!2973 Nil!11820 (select (arr!17875 lt!276593) j!136)))))

(declare-fun b!606354 () Bool)

(declare-fun e!347128 () Bool)

(declare-fun call!33073 () Bool)

(assert (=> b!606354 (= e!347128 call!33073)))

(declare-fun c!68779 () Bool)

(declare-fun bm!33070 () Bool)

(assert (=> bm!33070 (= call!33073 (arrayNoDuplicates!0 lt!276593 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68779 (Cons!11819 (select (arr!17875 lt!276593) j!136) Nil!11820) Nil!11820)))))

(declare-fun b!606355 () Bool)

(declare-fun e!347127 () Bool)

(declare-fun e!347129 () Bool)

(assert (=> b!606355 (= e!347127 e!347129)))

(declare-fun res!389534 () Bool)

(assert (=> b!606355 (=> (not res!389534) (not e!347129))))

(assert (=> b!606355 (= res!389534 (not e!347130))))

(declare-fun res!389533 () Bool)

(assert (=> b!606355 (=> (not res!389533) (not e!347130))))

(assert (=> b!606355 (= res!389533 (validKeyInArray!0 (select (arr!17875 lt!276593) j!136)))))

(declare-fun d!87901 () Bool)

(declare-fun res!389532 () Bool)

(assert (=> d!87901 (=> res!389532 e!347127)))

(assert (=> d!87901 (= res!389532 (bvsge j!136 (size!18239 lt!276593)))))

(assert (=> d!87901 (= (arrayNoDuplicates!0 lt!276593 j!136 Nil!11820) e!347127)))

(declare-fun b!606356 () Bool)

(assert (=> b!606356 (= e!347129 e!347128)))

(assert (=> b!606356 (= c!68779 (validKeyInArray!0 (select (arr!17875 lt!276593) j!136)))))

(declare-fun b!606357 () Bool)

(assert (=> b!606357 (= e!347128 call!33073)))

(assert (= (and d!87901 (not res!389532)) b!606355))

(assert (= (and b!606355 res!389533) b!606353))

(assert (= (and b!606355 res!389534) b!606356))

(assert (= (and b!606356 c!68779) b!606354))

(assert (= (and b!606356 (not c!68779)) b!606357))

(assert (= (or b!606354 b!606357) bm!33070))

(assert (=> b!606353 m!583385))

(assert (=> b!606353 m!583385))

(declare-fun m!583443 () Bool)

(assert (=> b!606353 m!583443))

(assert (=> bm!33070 m!583385))

(declare-fun m!583445 () Bool)

(assert (=> bm!33070 m!583445))

(assert (=> b!606355 m!583385))

(assert (=> b!606355 m!583385))

(declare-fun m!583447 () Bool)

(assert (=> b!606355 m!583447))

(assert (=> b!606356 m!583385))

(assert (=> b!606356 m!583385))

(assert (=> b!606356 m!583447))

(assert (=> b!606092 d!87901))

(declare-fun d!87903 () Bool)

(assert (=> d!87903 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18239 lt!276593)) (not (= (select (arr!17875 lt!276593) j!136) (select (arr!17875 a!2986) j!136))))))

(declare-fun lt!276737 () Unit!19279)

(declare-fun choose!21 (array!37248 (_ BitVec 64) (_ BitVec 32) List!11823) Unit!19279)

(assert (=> d!87903 (= lt!276737 (choose!21 lt!276593 (select (arr!17875 a!2986) j!136) j!136 Nil!11820))))

(assert (=> d!87903 (bvslt (size!18239 lt!276593) #b01111111111111111111111111111111)))

(assert (=> d!87903 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276593 (select (arr!17875 a!2986) j!136) j!136 Nil!11820) lt!276737)))

(declare-fun bs!18561 () Bool)

(assert (= bs!18561 d!87903))

(assert (=> bs!18561 m!583385))

(assert (=> bs!18561 m!583177))

(declare-fun m!583457 () Bool)

(assert (=> bs!18561 m!583457))

(assert (=> b!606092 d!87903))

(declare-fun d!87907 () Bool)

(declare-fun e!347156 () Bool)

(assert (=> d!87907 e!347156))

(declare-fun res!389551 () Bool)

(assert (=> d!87907 (=> (not res!389551) (not e!347156))))

(assert (=> d!87907 (= res!389551 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18239 a!2986))))))

(declare-fun lt!276743 () Unit!19279)

(declare-fun choose!41 (array!37248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11823) Unit!19279)

(assert (=> d!87907 (= lt!276743 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11820))))

(assert (=> d!87907 (bvslt (size!18239 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87907 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11820) lt!276743)))

(declare-fun b!606389 () Bool)

(assert (=> b!606389 (= e!347156 (arrayNoDuplicates!0 (array!37249 (store (arr!17875 a!2986) i!1108 k0!1786) (size!18239 a!2986)) #b00000000000000000000000000000000 Nil!11820))))

(assert (= (and d!87907 res!389551) b!606389))

(declare-fun m!583473 () Bool)

(assert (=> d!87907 m!583473))

(assert (=> b!606389 m!583191))

(declare-fun m!583475 () Bool)

(assert (=> b!606389 m!583475))

(assert (=> b!606092 d!87907))

(declare-fun d!87915 () Bool)

(declare-fun res!389552 () Bool)

(declare-fun e!347157 () Bool)

(assert (=> d!87915 (=> res!389552 e!347157)))

(assert (=> d!87915 (= res!389552 (= (select (arr!17875 lt!276593) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17875 a!2986) j!136)))))

(assert (=> d!87915 (= (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347157)))

(declare-fun b!606393 () Bool)

(declare-fun e!347158 () Bool)

(assert (=> b!606393 (= e!347157 e!347158)))

(declare-fun res!389553 () Bool)

(assert (=> b!606393 (=> (not res!389553) (not e!347158))))

(assert (=> b!606393 (= res!389553 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18239 lt!276593)))))

(declare-fun b!606394 () Bool)

(assert (=> b!606394 (= e!347158 (arrayContainsKey!0 lt!276593 (select (arr!17875 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87915 (not res!389552)) b!606393))

(assert (= (and b!606393 res!389553) b!606394))

(declare-fun m!583481 () Bool)

(assert (=> d!87915 m!583481))

(assert (=> b!606394 m!583177))

(declare-fun m!583485 () Bool)

(assert (=> b!606394 m!583485))

(assert (=> b!606092 d!87915))

(declare-fun b!606395 () Bool)

(declare-fun e!347162 () Bool)

(assert (=> b!606395 (= e!347162 (contains!2973 Nil!11820 (select (arr!17875 lt!276593) #b00000000000000000000000000000000)))))

(declare-fun b!606396 () Bool)

(declare-fun e!347160 () Bool)

(declare-fun call!33078 () Bool)

(assert (=> b!606396 (= e!347160 call!33078)))

(declare-fun bm!33075 () Bool)

(declare-fun c!68789 () Bool)

(assert (=> bm!33075 (= call!33078 (arrayNoDuplicates!0 lt!276593 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68789 (Cons!11819 (select (arr!17875 lt!276593) #b00000000000000000000000000000000) Nil!11820) Nil!11820)))))

(declare-fun b!606397 () Bool)

(declare-fun e!347159 () Bool)

(declare-fun e!347161 () Bool)

(assert (=> b!606397 (= e!347159 e!347161)))

(declare-fun res!389556 () Bool)

(assert (=> b!606397 (=> (not res!389556) (not e!347161))))

(assert (=> b!606397 (= res!389556 (not e!347162))))

(declare-fun res!389555 () Bool)

(assert (=> b!606397 (=> (not res!389555) (not e!347162))))

(assert (=> b!606397 (= res!389555 (validKeyInArray!0 (select (arr!17875 lt!276593) #b00000000000000000000000000000000)))))

(declare-fun d!87919 () Bool)

(declare-fun res!389554 () Bool)

(assert (=> d!87919 (=> res!389554 e!347159)))

(assert (=> d!87919 (= res!389554 (bvsge #b00000000000000000000000000000000 (size!18239 lt!276593)))))

(assert (=> d!87919 (= (arrayNoDuplicates!0 lt!276593 #b00000000000000000000000000000000 Nil!11820) e!347159)))

(declare-fun b!606398 () Bool)

(assert (=> b!606398 (= e!347161 e!347160)))

(assert (=> b!606398 (= c!68789 (validKeyInArray!0 (select (arr!17875 lt!276593) #b00000000000000000000000000000000)))))

(declare-fun b!606399 () Bool)

(assert (=> b!606399 (= e!347160 call!33078)))

(assert (= (and d!87919 (not res!389554)) b!606397))

(assert (= (and b!606397 res!389555) b!606395))

(assert (= (and b!606397 res!389556) b!606398))

(assert (= (and b!606398 c!68789) b!606396))

(assert (= (and b!606398 (not c!68789)) b!606399))

(assert (= (or b!606396 b!606399) bm!33075))

(declare-fun m!583487 () Bool)

(assert (=> b!606395 m!583487))

(assert (=> b!606395 m!583487))

(declare-fun m!583489 () Bool)

(assert (=> b!606395 m!583489))

(assert (=> bm!33075 m!583487))

(declare-fun m!583491 () Bool)

(assert (=> bm!33075 m!583491))

(assert (=> b!606397 m!583487))

(assert (=> b!606397 m!583487))

(declare-fun m!583493 () Bool)

(assert (=> b!606397 m!583493))

(assert (=> b!606398 m!583487))

(assert (=> b!606398 m!583487))

(assert (=> b!606398 m!583493))

(assert (=> b!606092 d!87919))

(assert (=> b!606085 d!87863))

(declare-fun b!606479 () Bool)

(declare-fun lt!276784 () SeekEntryResult!6271)

(declare-fun e!347216 () SeekEntryResult!6271)

(assert (=> b!606479 (= e!347216 (seekKeyOrZeroReturnVacant!0 (x!56309 lt!276784) (index!27355 lt!276784) (index!27355 lt!276784) k0!1786 a!2986 mask!3053))))

(declare-fun b!606481 () Bool)

(assert (=> b!606481 (= e!347216 (MissingZero!6271 (index!27355 lt!276784)))))

(declare-fun b!606482 () Bool)

(declare-fun e!347214 () SeekEntryResult!6271)

(assert (=> b!606482 (= e!347214 Undefined!6271)))

(declare-fun b!606483 () Bool)

(declare-fun e!347215 () SeekEntryResult!6271)

(assert (=> b!606483 (= e!347214 e!347215)))

(declare-fun lt!276782 () (_ BitVec 64))

(assert (=> b!606483 (= lt!276782 (select (arr!17875 a!2986) (index!27355 lt!276784)))))

(declare-fun c!68820 () Bool)

(assert (=> b!606483 (= c!68820 (= lt!276782 k0!1786))))

(declare-fun b!606484 () Bool)

(declare-fun c!68819 () Bool)

(assert (=> b!606484 (= c!68819 (= lt!276782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606484 (= e!347215 e!347216)))

(declare-fun b!606480 () Bool)

(assert (=> b!606480 (= e!347215 (Found!6271 (index!27355 lt!276784)))))

(declare-fun d!87921 () Bool)

(declare-fun lt!276783 () SeekEntryResult!6271)

(assert (=> d!87921 (and (or ((_ is Undefined!6271) lt!276783) (not ((_ is Found!6271) lt!276783)) (and (bvsge (index!27354 lt!276783) #b00000000000000000000000000000000) (bvslt (index!27354 lt!276783) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276783) ((_ is Found!6271) lt!276783) (not ((_ is MissingZero!6271) lt!276783)) (and (bvsge (index!27353 lt!276783) #b00000000000000000000000000000000) (bvslt (index!27353 lt!276783) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276783) ((_ is Found!6271) lt!276783) ((_ is MissingZero!6271) lt!276783) (not ((_ is MissingVacant!6271) lt!276783)) (and (bvsge (index!27356 lt!276783) #b00000000000000000000000000000000) (bvslt (index!27356 lt!276783) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276783) (ite ((_ is Found!6271) lt!276783) (= (select (arr!17875 a!2986) (index!27354 lt!276783)) k0!1786) (ite ((_ is MissingZero!6271) lt!276783) (= (select (arr!17875 a!2986) (index!27353 lt!276783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6271) lt!276783) (= (select (arr!17875 a!2986) (index!27356 lt!276783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87921 (= lt!276783 e!347214)))

(declare-fun c!68818 () Bool)

(assert (=> d!87921 (= c!68818 (and ((_ is Intermediate!6271) lt!276784) (undefined!7083 lt!276784)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37248 (_ BitVec 32)) SeekEntryResult!6271)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87921 (= lt!276784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87921 (validMask!0 mask!3053)))

(assert (=> d!87921 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276783)))

(assert (= (and d!87921 c!68818) b!606482))

(assert (= (and d!87921 (not c!68818)) b!606483))

(assert (= (and b!606483 c!68820) b!606480))

(assert (= (and b!606483 (not c!68820)) b!606484))

(assert (= (and b!606484 c!68819) b!606481))

(assert (= (and b!606484 (not c!68819)) b!606479))

(declare-fun m!583575 () Bool)

(assert (=> b!606479 m!583575))

(declare-fun m!583577 () Bool)

(assert (=> b!606483 m!583577))

(declare-fun m!583579 () Bool)

(assert (=> d!87921 m!583579))

(declare-fun m!583581 () Bool)

(assert (=> d!87921 m!583581))

(declare-fun m!583583 () Bool)

(assert (=> d!87921 m!583583))

(declare-fun m!583585 () Bool)

(assert (=> d!87921 m!583585))

(assert (=> d!87921 m!583173))

(declare-fun m!583587 () Bool)

(assert (=> d!87921 m!583587))

(assert (=> d!87921 m!583583))

(assert (=> b!606096 d!87921))

(declare-fun d!87953 () Bool)

(declare-fun res!389584 () Bool)

(declare-fun e!347221 () Bool)

(assert (=> d!87953 (=> res!389584 e!347221)))

(assert (=> d!87953 (= res!389584 ((_ is Nil!11820) Nil!11820))))

(assert (=> d!87953 (= (noDuplicate!307 Nil!11820) e!347221)))

(declare-fun b!606489 () Bool)

(declare-fun e!347222 () Bool)

(assert (=> b!606489 (= e!347221 e!347222)))

(declare-fun res!389585 () Bool)

(assert (=> b!606489 (=> (not res!389585) (not e!347222))))

(assert (=> b!606489 (= res!389585 (not (contains!2973 (t!18043 Nil!11820) (h!12867 Nil!11820))))))

(declare-fun b!606490 () Bool)

(assert (=> b!606490 (= e!347222 (noDuplicate!307 (t!18043 Nil!11820)))))

(assert (= (and d!87953 (not res!389584)) b!606489))

(assert (= (and b!606489 res!389585) b!606490))

(declare-fun m!583589 () Bool)

(assert (=> b!606489 m!583589))

(declare-fun m!583591 () Bool)

(assert (=> b!606490 m!583591))

(assert (=> b!606094 d!87953))

(declare-fun d!87955 () Bool)

(declare-fun res!389586 () Bool)

(declare-fun e!347223 () Bool)

(assert (=> d!87955 (=> res!389586 e!347223)))

(assert (=> d!87955 (= res!389586 (= (select (arr!17875 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87955 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!347223)))

(declare-fun b!606491 () Bool)

(declare-fun e!347224 () Bool)

(assert (=> b!606491 (= e!347223 e!347224)))

(declare-fun res!389587 () Bool)

(assert (=> b!606491 (=> (not res!389587) (not e!347224))))

(assert (=> b!606491 (= res!389587 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18239 a!2986)))))

(declare-fun b!606492 () Bool)

(assert (=> b!606492 (= e!347224 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87955 (not res!389586)) b!606491))

(assert (= (and b!606491 res!389587) b!606492))

(assert (=> d!87955 m!583371))

(declare-fun m!583593 () Bool)

(assert (=> b!606492 m!583593))

(assert (=> b!606084 d!87955))

(declare-fun b!606493 () Bool)

(declare-fun e!347227 () SeekEntryResult!6271)

(assert (=> b!606493 (= e!347227 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!606494 () Bool)

(declare-fun e!347225 () SeekEntryResult!6271)

(assert (=> b!606494 (= e!347225 (Found!6271 lt!276592))))

(declare-fun b!606495 () Bool)

(declare-fun e!347226 () SeekEntryResult!6271)

(assert (=> b!606495 (= e!347226 Undefined!6271)))

(declare-fun b!606496 () Bool)

(declare-fun c!68823 () Bool)

(declare-fun lt!276788 () (_ BitVec 64))

(assert (=> b!606496 (= c!68823 (= lt!276788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606496 (= e!347225 e!347227)))

(declare-fun b!606497 () Bool)

(assert (=> b!606497 (= e!347226 e!347225)))

(declare-fun c!68821 () Bool)

(assert (=> b!606497 (= c!68821 (= lt!276788 lt!276591))))

(declare-fun b!606498 () Bool)

(assert (=> b!606498 (= e!347227 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276592 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!276591 lt!276593 mask!3053))))

(declare-fun lt!276787 () SeekEntryResult!6271)

(declare-fun d!87957 () Bool)

(assert (=> d!87957 (and (or ((_ is Undefined!6271) lt!276787) (not ((_ is Found!6271) lt!276787)) (and (bvsge (index!27354 lt!276787) #b00000000000000000000000000000000) (bvslt (index!27354 lt!276787) (size!18239 lt!276593)))) (or ((_ is Undefined!6271) lt!276787) ((_ is Found!6271) lt!276787) (not ((_ is MissingVacant!6271) lt!276787)) (not (= (index!27356 lt!276787) vacantSpotIndex!68)) (and (bvsge (index!27356 lt!276787) #b00000000000000000000000000000000) (bvslt (index!27356 lt!276787) (size!18239 lt!276593)))) (or ((_ is Undefined!6271) lt!276787) (ite ((_ is Found!6271) lt!276787) (= (select (arr!17875 lt!276593) (index!27354 lt!276787)) lt!276591) (and ((_ is MissingVacant!6271) lt!276787) (= (index!27356 lt!276787) vacantSpotIndex!68) (= (select (arr!17875 lt!276593) (index!27356 lt!276787)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87957 (= lt!276787 e!347226)))

(declare-fun c!68822 () Bool)

(assert (=> d!87957 (= c!68822 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87957 (= lt!276788 (select (arr!17875 lt!276593) lt!276592))))

(assert (=> d!87957 (validMask!0 mask!3053)))

(assert (=> d!87957 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 lt!276591 lt!276593 mask!3053) lt!276787)))

(assert (= (and d!87957 c!68822) b!606495))

(assert (= (and d!87957 (not c!68822)) b!606497))

(assert (= (and b!606497 c!68821) b!606494))

(assert (= (and b!606497 (not c!68821)) b!606496))

(assert (= (and b!606496 c!68823) b!606493))

(assert (= (and b!606496 (not c!68823)) b!606498))

(declare-fun m!583595 () Bool)

(assert (=> b!606498 m!583595))

(assert (=> b!606498 m!583595))

(declare-fun m!583597 () Bool)

(assert (=> b!606498 m!583597))

(declare-fun m!583599 () Bool)

(assert (=> d!87957 m!583599))

(declare-fun m!583601 () Bool)

(assert (=> d!87957 m!583601))

(declare-fun m!583603 () Bool)

(assert (=> d!87957 m!583603))

(assert (=> d!87957 m!583173))

(assert (=> b!606095 d!87957))

(declare-fun b!606501 () Bool)

(declare-fun e!347232 () SeekEntryResult!6271)

(assert (=> b!606501 (= e!347232 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!606502 () Bool)

(declare-fun e!347230 () SeekEntryResult!6271)

(assert (=> b!606502 (= e!347230 (Found!6271 index!984))))

(declare-fun b!606503 () Bool)

(declare-fun e!347231 () SeekEntryResult!6271)

(assert (=> b!606503 (= e!347231 Undefined!6271)))

(declare-fun b!606504 () Bool)

(declare-fun c!68826 () Bool)

(declare-fun lt!276790 () (_ BitVec 64))

(assert (=> b!606504 (= c!68826 (= lt!276790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606504 (= e!347230 e!347232)))

(declare-fun b!606505 () Bool)

(assert (=> b!606505 (= e!347231 e!347230)))

(declare-fun c!68824 () Bool)

(assert (=> b!606505 (= c!68824 (= lt!276790 lt!276591))))

(declare-fun b!606506 () Bool)

(assert (=> b!606506 (= e!347232 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!276591 lt!276593 mask!3053))))

(declare-fun d!87959 () Bool)

(declare-fun lt!276789 () SeekEntryResult!6271)

(assert (=> d!87959 (and (or ((_ is Undefined!6271) lt!276789) (not ((_ is Found!6271) lt!276789)) (and (bvsge (index!27354 lt!276789) #b00000000000000000000000000000000) (bvslt (index!27354 lt!276789) (size!18239 lt!276593)))) (or ((_ is Undefined!6271) lt!276789) ((_ is Found!6271) lt!276789) (not ((_ is MissingVacant!6271) lt!276789)) (not (= (index!27356 lt!276789) vacantSpotIndex!68)) (and (bvsge (index!27356 lt!276789) #b00000000000000000000000000000000) (bvslt (index!27356 lt!276789) (size!18239 lt!276593)))) (or ((_ is Undefined!6271) lt!276789) (ite ((_ is Found!6271) lt!276789) (= (select (arr!17875 lt!276593) (index!27354 lt!276789)) lt!276591) (and ((_ is MissingVacant!6271) lt!276789) (= (index!27356 lt!276789) vacantSpotIndex!68) (= (select (arr!17875 lt!276593) (index!27356 lt!276789)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87959 (= lt!276789 e!347231)))

(declare-fun c!68825 () Bool)

(assert (=> d!87959 (= c!68825 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87959 (= lt!276790 (select (arr!17875 lt!276593) index!984))))

(assert (=> d!87959 (validMask!0 mask!3053)))

(assert (=> d!87959 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276591 lt!276593 mask!3053) lt!276789)))

(assert (= (and d!87959 c!68825) b!606503))

(assert (= (and d!87959 (not c!68825)) b!606505))

(assert (= (and b!606505 c!68824) b!606502))

(assert (= (and b!606505 (not c!68824)) b!606504))

(assert (= (and b!606504 c!68826) b!606501))

(assert (= (and b!606504 (not c!68826)) b!606506))

(assert (=> b!606506 m!583389))

(assert (=> b!606506 m!583389))

(declare-fun m!583605 () Bool)

(assert (=> b!606506 m!583605))

(declare-fun m!583607 () Bool)

(assert (=> d!87959 m!583607))

(declare-fun m!583609 () Bool)

(assert (=> d!87959 m!583609))

(assert (=> d!87959 m!583367))

(assert (=> d!87959 m!583173))

(assert (=> b!606095 d!87959))

(declare-fun d!87961 () Bool)

(declare-fun e!347244 () Bool)

(assert (=> d!87961 e!347244))

(declare-fun res!389598 () Bool)

(assert (=> d!87961 (=> (not res!389598) (not e!347244))))

(assert (=> d!87961 (= res!389598 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18239 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18239 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18239 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18239 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18239 a!2986))))))

(declare-fun lt!276809 () Unit!19279)

(declare-fun choose!9 (array!37248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19279)

(assert (=> d!87961 (= lt!276809 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87961 (validMask!0 mask!3053)))

(assert (=> d!87961 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 mask!3053) lt!276809)))

(declare-fun b!606521 () Bool)

(assert (=> b!606521 (= e!347244 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 (select (store (arr!17875 a!2986) i!1108 k0!1786) j!136) (array!37249 (store (arr!17875 a!2986) i!1108 k0!1786) (size!18239 a!2986)) mask!3053)))))

(assert (= (and d!87961 res!389598) b!606521))

(declare-fun m!583639 () Bool)

(assert (=> d!87961 m!583639))

(assert (=> d!87961 m!583173))

(assert (=> b!606521 m!583177))

(assert (=> b!606521 m!583195))

(assert (=> b!606521 m!583189))

(declare-fun m!583641 () Bool)

(assert (=> b!606521 m!583641))

(assert (=> b!606521 m!583177))

(assert (=> b!606521 m!583191))

(assert (=> b!606521 m!583189))

(assert (=> b!606095 d!87961))

(declare-fun d!87979 () Bool)

(declare-fun lt!276815 () (_ BitVec 32))

(assert (=> d!87979 (and (bvsge lt!276815 #b00000000000000000000000000000000) (bvslt lt!276815 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87979 (= lt!276815 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!87979 (validMask!0 mask!3053)))

(assert (=> d!87979 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!276815)))

(declare-fun bs!18571 () Bool)

(assert (= bs!18571 d!87979))

(declare-fun m!583649 () Bool)

(assert (=> bs!18571 m!583649))

(assert (=> bs!18571 m!583173))

(assert (=> b!606095 d!87979))

(declare-fun b!606532 () Bool)

(declare-fun e!347256 () SeekEntryResult!6271)

(assert (=> b!606532 (= e!347256 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!606533 () Bool)

(declare-fun e!347254 () SeekEntryResult!6271)

(assert (=> b!606533 (= e!347254 (Found!6271 lt!276592))))

(declare-fun b!606534 () Bool)

(declare-fun e!347255 () SeekEntryResult!6271)

(assert (=> b!606534 (= e!347255 Undefined!6271)))

(declare-fun b!606535 () Bool)

(declare-fun c!68833 () Bool)

(declare-fun lt!276817 () (_ BitVec 64))

(assert (=> b!606535 (= c!68833 (= lt!276817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606535 (= e!347254 e!347256)))

(declare-fun b!606536 () Bool)

(assert (=> b!606536 (= e!347255 e!347254)))

(declare-fun c!68831 () Bool)

(assert (=> b!606536 (= c!68831 (= lt!276817 (select (arr!17875 a!2986) j!136)))))

(declare-fun b!606537 () Bool)

(assert (=> b!606537 (= e!347256 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276592 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!87989 () Bool)

(declare-fun lt!276816 () SeekEntryResult!6271)

(assert (=> d!87989 (and (or ((_ is Undefined!6271) lt!276816) (not ((_ is Found!6271) lt!276816)) (and (bvsge (index!27354 lt!276816) #b00000000000000000000000000000000) (bvslt (index!27354 lt!276816) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276816) ((_ is Found!6271) lt!276816) (not ((_ is MissingVacant!6271) lt!276816)) (not (= (index!27356 lt!276816) vacantSpotIndex!68)) (and (bvsge (index!27356 lt!276816) #b00000000000000000000000000000000) (bvslt (index!27356 lt!276816) (size!18239 a!2986)))) (or ((_ is Undefined!6271) lt!276816) (ite ((_ is Found!6271) lt!276816) (= (select (arr!17875 a!2986) (index!27354 lt!276816)) (select (arr!17875 a!2986) j!136)) (and ((_ is MissingVacant!6271) lt!276816) (= (index!27356 lt!276816) vacantSpotIndex!68) (= (select (arr!17875 a!2986) (index!27356 lt!276816)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87989 (= lt!276816 e!347255)))

(declare-fun c!68832 () Bool)

(assert (=> d!87989 (= c!68832 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87989 (= lt!276817 (select (arr!17875 a!2986) lt!276592))))

(assert (=> d!87989 (validMask!0 mask!3053)))

(assert (=> d!87989 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276592 vacantSpotIndex!68 (select (arr!17875 a!2986) j!136) a!2986 mask!3053) lt!276816)))

(assert (= (and d!87989 c!68832) b!606534))

(assert (= (and d!87989 (not c!68832)) b!606536))

(assert (= (and b!606536 c!68831) b!606533))

(assert (= (and b!606536 (not c!68831)) b!606535))

(assert (= (and b!606535 c!68833) b!606532))

(assert (= (and b!606535 (not c!68833)) b!606537))

(assert (=> b!606537 m!583595))

(assert (=> b!606537 m!583595))

(assert (=> b!606537 m!583177))

(declare-fun m!583659 () Bool)

(assert (=> b!606537 m!583659))

(declare-fun m!583661 () Bool)

(assert (=> d!87989 m!583661))

(declare-fun m!583663 () Bool)

(assert (=> d!87989 m!583663))

(declare-fun m!583665 () Bool)

(assert (=> d!87989 m!583665))

(assert (=> d!87989 m!583173))

(assert (=> b!606095 d!87989))

(check-sat (not b!606389) (not d!87979) (not b!606253) (not d!87903) (not b!606521) (not d!87861) (not b!606267) (not d!87961) (not b!606398) (not d!87897) (not bm!33066) (not b!606270) (not b!606353) (not d!87989) (not b!606479) (not b!606266) (not d!87891) (not bm!33075) (not b!606264) (not b!606506) (not d!87907) (not b!606272) (not bm!33069) (not b!606489) (not d!87959) (not b!606490) (not b!606492) (not b!606394) (not b!606355) (not b!606356) (not b!606334) (not b!606331) (not b!606290) (not d!87921) (not bm!33070) (not b!606537) (not d!87865) (not b!606498) (not b!606397) (not d!87957) (not b!606395))
(check-sat)
