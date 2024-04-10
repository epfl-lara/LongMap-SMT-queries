; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55570 () Bool)

(assert start!55570)

(declare-fun b!608268 () Bool)

(declare-fun e!348355 () Bool)

(assert (=> b!608268 (= e!348355 true)))

(declare-fun lt!277860 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11942 0))(
  ( (Nil!11939) (Cons!11938 (h!12983 (_ BitVec 64)) (t!18170 List!11942)) )
))
(declare-fun contains!3018 (List!11942 (_ BitVec 64)) Bool)

(assert (=> b!608268 (= lt!277860 (contains!3018 Nil!11939 k!1786))))

(declare-fun b!608269 () Bool)

(declare-datatypes ((array!37301 0))(
  ( (array!37302 (arr!17901 (Array (_ BitVec 32) (_ BitVec 64))) (size!18265 (_ BitVec 32))) )
))
(declare-fun lt!277854 () array!37301)

(declare-fun e!348354 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37301)

(declare-fun arrayContainsKey!0 (array!37301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608269 (= e!348354 (arrayContainsKey!0 lt!277854 (select (arr!17901 a!2986) j!136) index!984))))

(declare-fun b!608270 () Bool)

(declare-fun res!390982 () Bool)

(assert (=> b!608270 (=> res!390982 e!348355)))

(assert (=> b!608270 (= res!390982 (contains!3018 Nil!11939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608271 () Bool)

(declare-fun e!348343 () Bool)

(declare-datatypes ((SeekEntryResult!6341 0))(
  ( (MissingZero!6341 (index!27639 (_ BitVec 32))) (Found!6341 (index!27640 (_ BitVec 32))) (Intermediate!6341 (undefined!7153 Bool) (index!27641 (_ BitVec 32)) (x!56450 (_ BitVec 32))) (Undefined!6341) (MissingVacant!6341 (index!27642 (_ BitVec 32))) )
))
(declare-fun lt!277859 () SeekEntryResult!6341)

(declare-fun lt!277846 () SeekEntryResult!6341)

(assert (=> b!608271 (= e!348343 (= lt!277859 lt!277846))))

(declare-fun b!608272 () Bool)

(declare-fun res!390975 () Bool)

(assert (=> b!608272 (=> res!390975 e!348355)))

(assert (=> b!608272 (= res!390975 (contains!3018 Nil!11939 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608273 () Bool)

(declare-fun e!348344 () Bool)

(declare-fun e!348353 () Bool)

(assert (=> b!608273 (= e!348344 (not e!348353))))

(declare-fun res!390979 () Bool)

(assert (=> b!608273 (=> res!390979 e!348353)))

(declare-fun lt!277847 () SeekEntryResult!6341)

(assert (=> b!608273 (= res!390979 (not (= lt!277847 (Found!6341 index!984))))))

(declare-datatypes ((Unit!19426 0))(
  ( (Unit!19427) )
))
(declare-fun lt!277851 () Unit!19426)

(declare-fun e!348351 () Unit!19426)

(assert (=> b!608273 (= lt!277851 e!348351)))

(declare-fun c!69019 () Bool)

(assert (=> b!608273 (= c!69019 (= lt!277847 Undefined!6341))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!277856 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37301 (_ BitVec 32)) SeekEntryResult!6341)

(assert (=> b!608273 (= lt!277847 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277856 lt!277854 mask!3053))))

(assert (=> b!608273 e!348343))

(declare-fun res!390983 () Bool)

(assert (=> b!608273 (=> (not res!390983) (not e!348343))))

(declare-fun lt!277849 () (_ BitVec 32))

(assert (=> b!608273 (= res!390983 (= lt!277846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277849 vacantSpotIndex!68 lt!277856 lt!277854 mask!3053)))))

(assert (=> b!608273 (= lt!277846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277849 vacantSpotIndex!68 (select (arr!17901 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608273 (= lt!277856 (select (store (arr!17901 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277858 () Unit!19426)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19426)

(assert (=> b!608273 (= lt!277858 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277849 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608273 (= lt!277849 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608274 () Bool)

(declare-fun res!390971 () Bool)

(declare-fun e!348356 () Bool)

(assert (=> b!608274 (=> (not res!390971) (not e!348356))))

(declare-fun arrayNoDuplicates!0 (array!37301 (_ BitVec 32) List!11942) Bool)

(assert (=> b!608274 (= res!390971 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11939))))

(declare-fun b!608275 () Bool)

(declare-fun Unit!19428 () Unit!19426)

(assert (=> b!608275 (= e!348351 Unit!19428)))

(assert (=> b!608275 false))

(declare-fun b!608276 () Bool)

(declare-fun e!348345 () Bool)

(assert (=> b!608276 (= e!348345 e!348344)))

(declare-fun res!390970 () Bool)

(assert (=> b!608276 (=> (not res!390970) (not e!348344))))

(assert (=> b!608276 (= res!390970 (and (= lt!277859 (Found!6341 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17901 a!2986) index!984) (select (arr!17901 a!2986) j!136))) (not (= (select (arr!17901 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608276 (= lt!277859 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17901 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608277 () Bool)

(declare-fun Unit!19429 () Unit!19426)

(assert (=> b!608277 (= e!348351 Unit!19429)))

(declare-fun b!608278 () Bool)

(declare-fun res!390981 () Bool)

(declare-fun e!348357 () Bool)

(assert (=> b!608278 (=> (not res!390981) (not e!348357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608278 (= res!390981 (validKeyInArray!0 (select (arr!17901 a!2986) j!136)))))

(declare-fun b!608279 () Bool)

(declare-fun res!390969 () Bool)

(assert (=> b!608279 (=> (not res!390969) (not e!348356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37301 (_ BitVec 32)) Bool)

(assert (=> b!608279 (= res!390969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608280 () Bool)

(declare-fun res!390976 () Bool)

(assert (=> b!608280 (=> (not res!390976) (not e!348356))))

(assert (=> b!608280 (= res!390976 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17901 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608281 () Bool)

(declare-fun res!390965 () Bool)

(assert (=> b!608281 (=> res!390965 e!348355)))

(declare-fun noDuplicate!324 (List!11942) Bool)

(assert (=> b!608281 (= res!390965 (not (noDuplicate!324 Nil!11939)))))

(declare-fun b!608282 () Bool)

(declare-fun e!348348 () Unit!19426)

(declare-fun Unit!19430 () Unit!19426)

(assert (=> b!608282 (= e!348348 Unit!19430)))

(declare-fun b!608283 () Bool)

(declare-fun e!348352 () Bool)

(declare-fun e!348349 () Bool)

(assert (=> b!608283 (= e!348352 e!348349)))

(declare-fun res!390980 () Bool)

(assert (=> b!608283 (=> res!390980 e!348349)))

(declare-fun lt!277845 () (_ BitVec 64))

(assert (=> b!608283 (= res!390980 (or (not (= (select (arr!17901 a!2986) j!136) lt!277856)) (not (= (select (arr!17901 a!2986) j!136) lt!277845)) (bvsge j!136 index!984)))))

(declare-fun b!608284 () Bool)

(declare-fun res!390977 () Bool)

(assert (=> b!608284 (=> (not res!390977) (not e!348357))))

(assert (=> b!608284 (= res!390977 (and (= (size!18265 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18265 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18265 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608285 () Bool)

(assert (=> b!608285 (= e!348357 e!348356)))

(declare-fun res!390978 () Bool)

(assert (=> b!608285 (=> (not res!390978) (not e!348356))))

(declare-fun lt!277852 () SeekEntryResult!6341)

(assert (=> b!608285 (= res!390978 (or (= lt!277852 (MissingZero!6341 i!1108)) (= lt!277852 (MissingVacant!6341 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37301 (_ BitVec 32)) SeekEntryResult!6341)

(assert (=> b!608285 (= lt!277852 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608286 () Bool)

(declare-fun e!348347 () Bool)

(assert (=> b!608286 (= e!348353 e!348347)))

(declare-fun res!390973 () Bool)

(assert (=> b!608286 (=> res!390973 e!348347)))

(assert (=> b!608286 (= res!390973 (or (not (= (select (arr!17901 a!2986) j!136) lt!277856)) (not (= (select (arr!17901 a!2986) j!136) lt!277845))))))

(assert (=> b!608286 e!348352))

(declare-fun res!390984 () Bool)

(assert (=> b!608286 (=> (not res!390984) (not e!348352))))

(assert (=> b!608286 (= res!390984 (= lt!277845 (select (arr!17901 a!2986) j!136)))))

(assert (=> b!608286 (= lt!277845 (select (store (arr!17901 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608287 () Bool)

(declare-fun Unit!19431 () Unit!19426)

(assert (=> b!608287 (= e!348348 Unit!19431)))

(declare-fun lt!277848 () Unit!19426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37301 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19426)

(assert (=> b!608287 (= lt!277848 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277854 (select (arr!17901 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608287 (arrayContainsKey!0 lt!277854 (select (arr!17901 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277850 () Unit!19426)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37301 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11942) Unit!19426)

(assert (=> b!608287 (= lt!277850 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11939))))

(assert (=> b!608287 (arrayNoDuplicates!0 lt!277854 #b00000000000000000000000000000000 Nil!11939)))

(declare-fun lt!277855 () Unit!19426)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37301 (_ BitVec 32) (_ BitVec 32)) Unit!19426)

(assert (=> b!608287 (= lt!277855 (lemmaNoDuplicateFromThenFromBigger!0 lt!277854 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608287 (arrayNoDuplicates!0 lt!277854 j!136 Nil!11939)))

(declare-fun lt!277861 () Unit!19426)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37301 (_ BitVec 64) (_ BitVec 32) List!11942) Unit!19426)

(assert (=> b!608287 (= lt!277861 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277854 (select (arr!17901 a!2986) j!136) j!136 Nil!11939))))

(assert (=> b!608287 false))

(declare-fun b!608288 () Bool)

(declare-fun res!390968 () Bool)

(assert (=> b!608288 (=> (not res!390968) (not e!348357))))

(assert (=> b!608288 (= res!390968 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608289 () Bool)

(declare-fun e!348342 () Bool)

(assert (=> b!608289 (= e!348347 e!348342)))

(declare-fun res!390974 () Bool)

(assert (=> b!608289 (=> res!390974 e!348342)))

(assert (=> b!608289 (= res!390974 (bvsge index!984 j!136))))

(declare-fun lt!277857 () Unit!19426)

(assert (=> b!608289 (= lt!277857 e!348348)))

(declare-fun c!69020 () Bool)

(assert (=> b!608289 (= c!69020 (bvslt j!136 index!984))))

(declare-fun b!608290 () Bool)

(declare-fun res!390986 () Bool)

(assert (=> b!608290 (=> (not res!390986) (not e!348357))))

(assert (=> b!608290 (= res!390986 (validKeyInArray!0 k!1786))))

(declare-fun b!608291 () Bool)

(assert (=> b!608291 (= e!348356 e!348345)))

(declare-fun res!390964 () Bool)

(assert (=> b!608291 (=> (not res!390964) (not e!348345))))

(assert (=> b!608291 (= res!390964 (= (select (store (arr!17901 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608291 (= lt!277854 (array!37302 (store (arr!17901 a!2986) i!1108 k!1786) (size!18265 a!2986)))))

(declare-fun b!608292 () Bool)

(assert (=> b!608292 (= e!348342 e!348355)))

(declare-fun res!390967 () Bool)

(assert (=> b!608292 (=> res!390967 e!348355)))

(assert (=> b!608292 (= res!390967 (or (bvsge (size!18265 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18265 a!2986))))))

(assert (=> b!608292 (arrayContainsKey!0 lt!277854 (select (arr!17901 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277853 () Unit!19426)

(assert (=> b!608292 (= lt!277853 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277854 (select (arr!17901 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348350 () Bool)

(assert (=> b!608292 e!348350))

(declare-fun res!390966 () Bool)

(assert (=> b!608292 (=> (not res!390966) (not e!348350))))

(assert (=> b!608292 (= res!390966 (arrayContainsKey!0 lt!277854 (select (arr!17901 a!2986) j!136) j!136))))

(declare-fun b!608293 () Bool)

(assert (=> b!608293 (= e!348350 (arrayContainsKey!0 lt!277854 (select (arr!17901 a!2986) j!136) index!984))))

(declare-fun res!390972 () Bool)

(assert (=> start!55570 (=> (not res!390972) (not e!348357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55570 (= res!390972 (validMask!0 mask!3053))))

(assert (=> start!55570 e!348357))

(assert (=> start!55570 true))

(declare-fun array_inv!13697 (array!37301) Bool)

(assert (=> start!55570 (array_inv!13697 a!2986)))

(declare-fun b!608294 () Bool)

(assert (=> b!608294 (= e!348349 e!348354)))

(declare-fun res!390985 () Bool)

(assert (=> b!608294 (=> (not res!390985) (not e!348354))))

(assert (=> b!608294 (= res!390985 (arrayContainsKey!0 lt!277854 (select (arr!17901 a!2986) j!136) j!136))))

(assert (= (and start!55570 res!390972) b!608284))

(assert (= (and b!608284 res!390977) b!608278))

(assert (= (and b!608278 res!390981) b!608290))

(assert (= (and b!608290 res!390986) b!608288))

(assert (= (and b!608288 res!390968) b!608285))

(assert (= (and b!608285 res!390978) b!608279))

(assert (= (and b!608279 res!390969) b!608274))

(assert (= (and b!608274 res!390971) b!608280))

(assert (= (and b!608280 res!390976) b!608291))

(assert (= (and b!608291 res!390964) b!608276))

(assert (= (and b!608276 res!390970) b!608273))

(assert (= (and b!608273 res!390983) b!608271))

(assert (= (and b!608273 c!69019) b!608275))

(assert (= (and b!608273 (not c!69019)) b!608277))

(assert (= (and b!608273 (not res!390979)) b!608286))

(assert (= (and b!608286 res!390984) b!608283))

(assert (= (and b!608283 (not res!390980)) b!608294))

(assert (= (and b!608294 res!390985) b!608269))

(assert (= (and b!608286 (not res!390973)) b!608289))

(assert (= (and b!608289 c!69020) b!608287))

(assert (= (and b!608289 (not c!69020)) b!608282))

(assert (= (and b!608289 (not res!390974)) b!608292))

(assert (= (and b!608292 res!390966) b!608293))

(assert (= (and b!608292 (not res!390967)) b!608281))

(assert (= (and b!608281 (not res!390965)) b!608270))

(assert (= (and b!608270 (not res!390982)) b!608272))

(assert (= (and b!608272 (not res!390975)) b!608268))

(declare-fun m!584915 () Bool)

(assert (=> b!608272 m!584915))

(declare-fun m!584917 () Bool)

(assert (=> b!608293 m!584917))

(assert (=> b!608293 m!584917))

(declare-fun m!584919 () Bool)

(assert (=> b!608293 m!584919))

(declare-fun m!584921 () Bool)

(assert (=> b!608288 m!584921))

(declare-fun m!584923 () Bool)

(assert (=> b!608280 m!584923))

(assert (=> b!608269 m!584917))

(assert (=> b!608269 m!584917))

(assert (=> b!608269 m!584919))

(declare-fun m!584925 () Bool)

(assert (=> b!608291 m!584925))

(declare-fun m!584927 () Bool)

(assert (=> b!608291 m!584927))

(declare-fun m!584929 () Bool)

(assert (=> b!608279 m!584929))

(assert (=> b!608294 m!584917))

(assert (=> b!608294 m!584917))

(declare-fun m!584931 () Bool)

(assert (=> b!608294 m!584931))

(assert (=> b!608287 m!584917))

(declare-fun m!584933 () Bool)

(assert (=> b!608287 m!584933))

(declare-fun m!584935 () Bool)

(assert (=> b!608287 m!584935))

(assert (=> b!608287 m!584917))

(declare-fun m!584937 () Bool)

(assert (=> b!608287 m!584937))

(declare-fun m!584939 () Bool)

(assert (=> b!608287 m!584939))

(assert (=> b!608287 m!584917))

(declare-fun m!584941 () Bool)

(assert (=> b!608287 m!584941))

(assert (=> b!608287 m!584917))

(declare-fun m!584943 () Bool)

(assert (=> b!608287 m!584943))

(declare-fun m!584945 () Bool)

(assert (=> b!608287 m!584945))

(assert (=> b!608283 m!584917))

(assert (=> b!608286 m!584917))

(assert (=> b!608286 m!584925))

(declare-fun m!584947 () Bool)

(assert (=> b!608286 m!584947))

(assert (=> b!608292 m!584917))

(assert (=> b!608292 m!584917))

(declare-fun m!584949 () Bool)

(assert (=> b!608292 m!584949))

(assert (=> b!608292 m!584917))

(declare-fun m!584951 () Bool)

(assert (=> b!608292 m!584951))

(assert (=> b!608292 m!584917))

(assert (=> b!608292 m!584931))

(declare-fun m!584953 () Bool)

(assert (=> b!608268 m!584953))

(declare-fun m!584955 () Bool)

(assert (=> b!608270 m!584955))

(declare-fun m!584957 () Bool)

(assert (=> b!608273 m!584957))

(declare-fun m!584959 () Bool)

(assert (=> b!608273 m!584959))

(assert (=> b!608273 m!584917))

(declare-fun m!584961 () Bool)

(assert (=> b!608273 m!584961))

(assert (=> b!608273 m!584925))

(assert (=> b!608273 m!584917))

(declare-fun m!584963 () Bool)

(assert (=> b!608273 m!584963))

(declare-fun m!584965 () Bool)

(assert (=> b!608273 m!584965))

(declare-fun m!584967 () Bool)

(assert (=> b!608273 m!584967))

(declare-fun m!584969 () Bool)

(assert (=> b!608276 m!584969))

(assert (=> b!608276 m!584917))

(assert (=> b!608276 m!584917))

(declare-fun m!584971 () Bool)

(assert (=> b!608276 m!584971))

(declare-fun m!584973 () Bool)

(assert (=> b!608290 m!584973))

(declare-fun m!584975 () Bool)

(assert (=> b!608281 m!584975))

(declare-fun m!584977 () Bool)

(assert (=> start!55570 m!584977))

(declare-fun m!584979 () Bool)

(assert (=> start!55570 m!584979))

(assert (=> b!608278 m!584917))

(assert (=> b!608278 m!584917))

(declare-fun m!584981 () Bool)

(assert (=> b!608278 m!584981))

(declare-fun m!584983 () Bool)

(assert (=> b!608285 m!584983))

(declare-fun m!584985 () Bool)

(assert (=> b!608274 m!584985))

(push 1)

