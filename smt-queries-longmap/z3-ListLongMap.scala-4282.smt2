; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59602 () Bool)

(assert start!59602)

(declare-fun b!658947 () Bool)

(declare-datatypes ((Unit!22924 0))(
  ( (Unit!22925) )
))
(declare-fun e!378556 () Unit!22924)

(declare-fun Unit!22926 () Unit!22924)

(assert (=> b!658947 (= e!378556 Unit!22926)))

(declare-fun b!658948 () Bool)

(declare-fun e!378561 () Bool)

(declare-fun e!378557 () Bool)

(assert (=> b!658948 (= e!378561 e!378557)))

(declare-fun res!427331 () Bool)

(assert (=> b!658948 (=> (not res!427331) (not e!378557))))

(declare-datatypes ((SeekEntryResult!7017 0))(
  ( (MissingZero!7017 (index!30433 (_ BitVec 32))) (Found!7017 (index!30434 (_ BitVec 32))) (Intermediate!7017 (undefined!7829 Bool) (index!30435 (_ BitVec 32)) (x!59220 (_ BitVec 32))) (Undefined!7017) (MissingVacant!7017 (index!30436 (_ BitVec 32))) )
))
(declare-fun lt!308305 () SeekEntryResult!7017)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38760 0))(
  ( (array!38761 (arr!18577 (Array (_ BitVec 32) (_ BitVec 64))) (size!18941 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38760)

(assert (=> b!658948 (= res!427331 (and (= lt!308305 (Found!7017 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18577 a!2986) index!984) (select (arr!18577 a!2986) j!136))) (not (= (select (arr!18577 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38760 (_ BitVec 32)) SeekEntryResult!7017)

(assert (=> b!658948 (= lt!308305 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18577 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658949 () Bool)

(declare-fun e!378558 () Bool)

(declare-fun e!378555 () Bool)

(assert (=> b!658949 (= e!378558 e!378555)))

(declare-fun res!427333 () Bool)

(assert (=> b!658949 (=> (not res!427333) (not e!378555))))

(declare-fun lt!308297 () SeekEntryResult!7017)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658949 (= res!427333 (or (= lt!308297 (MissingZero!7017 i!1108)) (= lt!308297 (MissingVacant!7017 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38760 (_ BitVec 32)) SeekEntryResult!7017)

(assert (=> b!658949 (= lt!308297 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658950 () Bool)

(declare-fun lt!308306 () array!38760)

(declare-fun res!427335 () Bool)

(declare-fun arrayContainsKey!0 (array!38760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658950 (= res!427335 (arrayContainsKey!0 lt!308306 (select (arr!18577 a!2986) j!136) j!136))))

(declare-fun e!378562 () Bool)

(assert (=> b!658950 (=> (not res!427335) (not e!378562))))

(declare-fun e!378560 () Bool)

(assert (=> b!658950 (= e!378560 e!378562)))

(declare-fun b!658951 () Bool)

(declare-fun Unit!22927 () Unit!22924)

(assert (=> b!658951 (= e!378556 Unit!22927)))

(assert (=> b!658951 false))

(declare-fun b!658952 () Bool)

(declare-fun res!427344 () Bool)

(assert (=> b!658952 (= res!427344 (bvsge j!136 index!984))))

(assert (=> b!658952 (=> res!427344 e!378560)))

(declare-fun e!378564 () Bool)

(assert (=> b!658952 (= e!378564 e!378560)))

(declare-fun b!658953 () Bool)

(declare-fun e!378559 () Bool)

(assert (=> b!658953 (= e!378559 (arrayContainsKey!0 lt!308306 (select (arr!18577 a!2986) j!136) index!984))))

(declare-fun b!658954 () Bool)

(declare-fun res!427345 () Bool)

(assert (=> b!658954 (=> (not res!427345) (not e!378558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658954 (= res!427345 (validKeyInArray!0 k0!1786))))

(declare-fun b!658956 () Bool)

(declare-fun e!378552 () Unit!22924)

(declare-fun Unit!22928 () Unit!22924)

(assert (=> b!658956 (= e!378552 Unit!22928)))

(declare-fun res!427338 () Bool)

(assert (=> b!658956 (= res!427338 (= (select (store (arr!18577 a!2986) i!1108 k0!1786) index!984) (select (arr!18577 a!2986) j!136)))))

(assert (=> b!658956 (=> (not res!427338) (not e!378564))))

(assert (=> b!658956 e!378564))

(declare-fun c!76177 () Bool)

(assert (=> b!658956 (= c!76177 (bvslt j!136 index!984))))

(declare-fun lt!308294 () Unit!22924)

(declare-fun e!378553 () Unit!22924)

(assert (=> b!658956 (= lt!308294 e!378553)))

(declare-fun c!76178 () Bool)

(assert (=> b!658956 (= c!76178 (bvslt index!984 j!136))))

(declare-fun lt!308295 () Unit!22924)

(declare-fun e!378563 () Unit!22924)

(assert (=> b!658956 (= lt!308295 e!378563)))

(assert (=> b!658956 false))

(declare-fun b!658957 () Bool)

(declare-fun res!427343 () Bool)

(assert (=> b!658957 (=> (not res!427343) (not e!378558))))

(assert (=> b!658957 (= res!427343 (validKeyInArray!0 (select (arr!18577 a!2986) j!136)))))

(declare-fun b!658958 () Bool)

(declare-fun Unit!22929 () Unit!22924)

(assert (=> b!658958 (= e!378552 Unit!22929)))

(declare-fun b!658959 () Bool)

(assert (=> b!658959 (= e!378557 (not true))))

(declare-fun lt!308298 () Unit!22924)

(assert (=> b!658959 (= lt!308298 e!378552)))

(declare-fun c!76176 () Bool)

(declare-fun lt!308303 () SeekEntryResult!7017)

(assert (=> b!658959 (= c!76176 (= lt!308303 (Found!7017 index!984)))))

(declare-fun lt!308290 () Unit!22924)

(assert (=> b!658959 (= lt!308290 e!378556)))

(declare-fun c!76175 () Bool)

(assert (=> b!658959 (= c!76175 (= lt!308303 Undefined!7017))))

(declare-fun lt!308296 () (_ BitVec 64))

(assert (=> b!658959 (= lt!308303 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308296 lt!308306 mask!3053))))

(declare-fun e!378551 () Bool)

(assert (=> b!658959 e!378551))

(declare-fun res!427340 () Bool)

(assert (=> b!658959 (=> (not res!427340) (not e!378551))))

(declare-fun lt!308308 () (_ BitVec 32))

(declare-fun lt!308302 () SeekEntryResult!7017)

(assert (=> b!658959 (= res!427340 (= lt!308302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308308 vacantSpotIndex!68 lt!308296 lt!308306 mask!3053)))))

(assert (=> b!658959 (= lt!308302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308308 vacantSpotIndex!68 (select (arr!18577 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658959 (= lt!308296 (select (store (arr!18577 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308300 () Unit!22924)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38760 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22924)

(assert (=> b!658959 (= lt!308300 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308308 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658959 (= lt!308308 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658960 () Bool)

(declare-fun res!427339 () Bool)

(assert (=> b!658960 (=> (not res!427339) (not e!378558))))

(assert (=> b!658960 (= res!427339 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658961 () Bool)

(declare-fun res!427336 () Bool)

(assert (=> b!658961 (=> (not res!427336) (not e!378558))))

(assert (=> b!658961 (= res!427336 (and (= (size!18941 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18941 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18941 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658962 () Bool)

(declare-fun res!427337 () Bool)

(assert (=> b!658962 (=> (not res!427337) (not e!378555))))

(declare-datatypes ((List!12618 0))(
  ( (Nil!12615) (Cons!12614 (h!13659 (_ BitVec 64)) (t!18846 List!12618)) )
))
(declare-fun arrayNoDuplicates!0 (array!38760 (_ BitVec 32) List!12618) Bool)

(assert (=> b!658962 (= res!427337 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12615))))

(declare-fun b!658963 () Bool)

(assert (=> b!658963 false))

(declare-fun lt!308292 () Unit!22924)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38760 (_ BitVec 64) (_ BitVec 32) List!12618) Unit!22924)

(assert (=> b!658963 (= lt!308292 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308306 (select (arr!18577 a!2986) j!136) j!136 Nil!12615))))

(assert (=> b!658963 (arrayNoDuplicates!0 lt!308306 j!136 Nil!12615)))

(declare-fun lt!308291 () Unit!22924)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38760 (_ BitVec 32) (_ BitVec 32)) Unit!22924)

(assert (=> b!658963 (= lt!308291 (lemmaNoDuplicateFromThenFromBigger!0 lt!308306 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658963 (arrayNoDuplicates!0 lt!308306 #b00000000000000000000000000000000 Nil!12615)))

(declare-fun lt!308307 () Unit!22924)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12618) Unit!22924)

(assert (=> b!658963 (= lt!308307 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12615))))

(assert (=> b!658963 (arrayContainsKey!0 lt!308306 (select (arr!18577 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308304 () Unit!22924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22924)

(assert (=> b!658963 (= lt!308304 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308306 (select (arr!18577 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22930 () Unit!22924)

(assert (=> b!658963 (= e!378553 Unit!22930)))

(declare-fun b!658964 () Bool)

(assert (=> b!658964 (= e!378562 (arrayContainsKey!0 lt!308306 (select (arr!18577 a!2986) j!136) index!984))))

(declare-fun b!658965 () Bool)

(declare-fun res!427341 () Bool)

(assert (=> b!658965 (=> (not res!427341) (not e!378555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38760 (_ BitVec 32)) Bool)

(assert (=> b!658965 (= res!427341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658966 () Bool)

(declare-fun Unit!22931 () Unit!22924)

(assert (=> b!658966 (= e!378563 Unit!22931)))

(declare-fun b!658967 () Bool)

(declare-fun res!427332 () Bool)

(assert (=> b!658967 (=> (not res!427332) (not e!378555))))

(assert (=> b!658967 (= res!427332 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18577 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658968 () Bool)

(declare-fun Unit!22932 () Unit!22924)

(assert (=> b!658968 (= e!378553 Unit!22932)))

(declare-fun b!658969 () Bool)

(assert (=> b!658969 false))

(declare-fun lt!308299 () Unit!22924)

(assert (=> b!658969 (= lt!308299 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308306 (select (arr!18577 a!2986) j!136) index!984 Nil!12615))))

(assert (=> b!658969 (arrayNoDuplicates!0 lt!308306 index!984 Nil!12615)))

(declare-fun lt!308289 () Unit!22924)

(assert (=> b!658969 (= lt!308289 (lemmaNoDuplicateFromThenFromBigger!0 lt!308306 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658969 (arrayNoDuplicates!0 lt!308306 #b00000000000000000000000000000000 Nil!12615)))

(declare-fun lt!308301 () Unit!22924)

(assert (=> b!658969 (= lt!308301 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12615))))

(assert (=> b!658969 (arrayContainsKey!0 lt!308306 (select (arr!18577 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308293 () Unit!22924)

(assert (=> b!658969 (= lt!308293 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308306 (select (arr!18577 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658969 e!378559))

(declare-fun res!427334 () Bool)

(assert (=> b!658969 (=> (not res!427334) (not e!378559))))

(assert (=> b!658969 (= res!427334 (arrayContainsKey!0 lt!308306 (select (arr!18577 a!2986) j!136) j!136))))

(declare-fun Unit!22933 () Unit!22924)

(assert (=> b!658969 (= e!378563 Unit!22933)))

(declare-fun b!658970 () Bool)

(assert (=> b!658970 (= e!378551 (= lt!308305 lt!308302))))

(declare-fun res!427342 () Bool)

(assert (=> start!59602 (=> (not res!427342) (not e!378558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59602 (= res!427342 (validMask!0 mask!3053))))

(assert (=> start!59602 e!378558))

(assert (=> start!59602 true))

(declare-fun array_inv!14373 (array!38760) Bool)

(assert (=> start!59602 (array_inv!14373 a!2986)))

(declare-fun b!658955 () Bool)

(assert (=> b!658955 (= e!378555 e!378561)))

(declare-fun res!427346 () Bool)

(assert (=> b!658955 (=> (not res!427346) (not e!378561))))

(assert (=> b!658955 (= res!427346 (= (select (store (arr!18577 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658955 (= lt!308306 (array!38761 (store (arr!18577 a!2986) i!1108 k0!1786) (size!18941 a!2986)))))

(assert (= (and start!59602 res!427342) b!658961))

(assert (= (and b!658961 res!427336) b!658957))

(assert (= (and b!658957 res!427343) b!658954))

(assert (= (and b!658954 res!427345) b!658960))

(assert (= (and b!658960 res!427339) b!658949))

(assert (= (and b!658949 res!427333) b!658965))

(assert (= (and b!658965 res!427341) b!658962))

(assert (= (and b!658962 res!427337) b!658967))

(assert (= (and b!658967 res!427332) b!658955))

(assert (= (and b!658955 res!427346) b!658948))

(assert (= (and b!658948 res!427331) b!658959))

(assert (= (and b!658959 res!427340) b!658970))

(assert (= (and b!658959 c!76175) b!658951))

(assert (= (and b!658959 (not c!76175)) b!658947))

(assert (= (and b!658959 c!76176) b!658956))

(assert (= (and b!658959 (not c!76176)) b!658958))

(assert (= (and b!658956 res!427338) b!658952))

(assert (= (and b!658952 (not res!427344)) b!658950))

(assert (= (and b!658950 res!427335) b!658964))

(assert (= (and b!658956 c!76177) b!658963))

(assert (= (and b!658956 (not c!76177)) b!658968))

(assert (= (and b!658956 c!76178) b!658969))

(assert (= (and b!658956 (not c!76178)) b!658966))

(assert (= (and b!658969 res!427334) b!658953))

(declare-fun m!631917 () Bool)

(assert (=> b!658957 m!631917))

(assert (=> b!658957 m!631917))

(declare-fun m!631919 () Bool)

(assert (=> b!658957 m!631919))

(declare-fun m!631921 () Bool)

(assert (=> b!658956 m!631921))

(declare-fun m!631923 () Bool)

(assert (=> b!658956 m!631923))

(assert (=> b!658956 m!631917))

(declare-fun m!631925 () Bool)

(assert (=> b!658948 m!631925))

(assert (=> b!658948 m!631917))

(assert (=> b!658948 m!631917))

(declare-fun m!631927 () Bool)

(assert (=> b!658948 m!631927))

(assert (=> b!658964 m!631917))

(assert (=> b!658964 m!631917))

(declare-fun m!631929 () Bool)

(assert (=> b!658964 m!631929))

(assert (=> b!658963 m!631917))

(declare-fun m!631931 () Bool)

(assert (=> b!658963 m!631931))

(assert (=> b!658963 m!631917))

(declare-fun m!631933 () Bool)

(assert (=> b!658963 m!631933))

(declare-fun m!631935 () Bool)

(assert (=> b!658963 m!631935))

(assert (=> b!658963 m!631917))

(assert (=> b!658963 m!631917))

(declare-fun m!631937 () Bool)

(assert (=> b!658963 m!631937))

(declare-fun m!631939 () Bool)

(assert (=> b!658963 m!631939))

(declare-fun m!631941 () Bool)

(assert (=> b!658963 m!631941))

(declare-fun m!631943 () Bool)

(assert (=> b!658963 m!631943))

(declare-fun m!631945 () Bool)

(assert (=> b!658967 m!631945))

(declare-fun m!631947 () Bool)

(assert (=> b!658962 m!631947))

(declare-fun m!631949 () Bool)

(assert (=> b!658959 m!631949))

(declare-fun m!631951 () Bool)

(assert (=> b!658959 m!631951))

(declare-fun m!631953 () Bool)

(assert (=> b!658959 m!631953))

(declare-fun m!631955 () Bool)

(assert (=> b!658959 m!631955))

(assert (=> b!658959 m!631917))

(assert (=> b!658959 m!631921))

(assert (=> b!658959 m!631917))

(declare-fun m!631957 () Bool)

(assert (=> b!658959 m!631957))

(declare-fun m!631959 () Bool)

(assert (=> b!658959 m!631959))

(declare-fun m!631961 () Bool)

(assert (=> b!658965 m!631961))

(assert (=> b!658953 m!631917))

(assert (=> b!658953 m!631917))

(assert (=> b!658953 m!631929))

(assert (=> b!658969 m!631917))

(declare-fun m!631963 () Bool)

(assert (=> b!658969 m!631963))

(assert (=> b!658969 m!631917))

(declare-fun m!631965 () Bool)

(assert (=> b!658969 m!631965))

(assert (=> b!658969 m!631917))

(declare-fun m!631967 () Bool)

(assert (=> b!658969 m!631967))

(assert (=> b!658969 m!631941))

(declare-fun m!631969 () Bool)

(assert (=> b!658969 m!631969))

(assert (=> b!658969 m!631917))

(declare-fun m!631971 () Bool)

(assert (=> b!658969 m!631971))

(assert (=> b!658969 m!631917))

(declare-fun m!631973 () Bool)

(assert (=> b!658969 m!631973))

(assert (=> b!658969 m!631939))

(declare-fun m!631975 () Bool)

(assert (=> b!658954 m!631975))

(assert (=> b!658955 m!631921))

(declare-fun m!631977 () Bool)

(assert (=> b!658955 m!631977))

(declare-fun m!631979 () Bool)

(assert (=> b!658949 m!631979))

(assert (=> b!658950 m!631917))

(assert (=> b!658950 m!631917))

(assert (=> b!658950 m!631965))

(declare-fun m!631981 () Bool)

(assert (=> b!658960 m!631981))

(declare-fun m!631983 () Bool)

(assert (=> start!59602 m!631983))

(declare-fun m!631985 () Bool)

(assert (=> start!59602 m!631985))

(check-sat (not b!658950) (not b!658948) (not b!658953) (not b!658957) (not b!658960) (not b!658954) (not b!658963) (not b!658964) (not b!658959) (not b!658969) (not b!658949) (not b!658965) (not start!59602) (not b!658962))
(check-sat)
