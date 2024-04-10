; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58752 () Bool)

(assert start!58752)

(declare-fun b!647943 () Bool)

(declare-fun res!419824 () Bool)

(declare-fun e!371574 () Bool)

(assert (=> b!647943 (=> (not res!419824) (not e!371574))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647943 (= res!419824 (validKeyInArray!0 k!1786))))

(declare-fun b!647944 () Bool)

(declare-fun e!371565 () Bool)

(declare-fun e!371568 () Bool)

(assert (=> b!647944 (= e!371565 e!371568)))

(declare-fun res!419830 () Bool)

(assert (=> b!647944 (=> res!419830 e!371568)))

(declare-fun lt!300710 () (_ BitVec 64))

(declare-datatypes ((array!38507 0))(
  ( (array!38508 (arr!18461 (Array (_ BitVec 32) (_ BitVec 64))) (size!18825 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38507)

(declare-fun lt!300717 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!647944 (= res!419830 (or (not (= (select (arr!18461 a!2986) j!136) lt!300717)) (not (= (select (arr!18461 a!2986) j!136) lt!300710))))))

(declare-fun e!371564 () Bool)

(assert (=> b!647944 e!371564))

(declare-fun res!419818 () Bool)

(assert (=> b!647944 (=> (not res!419818) (not e!371564))))

(assert (=> b!647944 (= res!419818 (= lt!300710 (select (arr!18461 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!647944 (= lt!300710 (select (store (arr!18461 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!647945 () Bool)

(declare-datatypes ((Unit!22032 0))(
  ( (Unit!22033) )
))
(declare-fun e!371563 () Unit!22032)

(declare-fun Unit!22034 () Unit!22032)

(assert (=> b!647945 (= e!371563 Unit!22034)))

(declare-fun lt!300716 () Unit!22032)

(declare-fun lt!300713 () array!38507)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22032)

(assert (=> b!647945 (= lt!300716 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300713 (select (arr!18461 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647945 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300711 () Unit!22032)

(declare-datatypes ((List!12502 0))(
  ( (Nil!12499) (Cons!12498 (h!13543 (_ BitVec 64)) (t!18730 List!12502)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12502) Unit!22032)

(assert (=> b!647945 (= lt!300711 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12499))))

(declare-fun arrayNoDuplicates!0 (array!38507 (_ BitVec 32) List!12502) Bool)

(assert (=> b!647945 (arrayNoDuplicates!0 lt!300713 #b00000000000000000000000000000000 Nil!12499)))

(declare-fun lt!300708 () Unit!22032)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38507 (_ BitVec 32) (_ BitVec 32)) Unit!22032)

(assert (=> b!647945 (= lt!300708 (lemmaNoDuplicateFromThenFromBigger!0 lt!300713 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647945 (arrayNoDuplicates!0 lt!300713 j!136 Nil!12499)))

(declare-fun lt!300718 () Unit!22032)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38507 (_ BitVec 64) (_ BitVec 32) List!12502) Unit!22032)

(assert (=> b!647945 (= lt!300718 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300713 (select (arr!18461 a!2986) j!136) j!136 Nil!12499))))

(assert (=> b!647945 false))

(declare-fun b!647946 () Bool)

(declare-fun e!371566 () Bool)

(assert (=> b!647946 (= e!371566 (not e!371565))))

(declare-fun res!419821 () Bool)

(assert (=> b!647946 (=> res!419821 e!371565)))

(declare-datatypes ((SeekEntryResult!6901 0))(
  ( (MissingZero!6901 (index!29948 (_ BitVec 32))) (Found!6901 (index!29949 (_ BitVec 32))) (Intermediate!6901 (undefined!7713 Bool) (index!29950 (_ BitVec 32)) (x!58729 (_ BitVec 32))) (Undefined!6901) (MissingVacant!6901 (index!29951 (_ BitVec 32))) )
))
(declare-fun lt!300709 () SeekEntryResult!6901)

(assert (=> b!647946 (= res!419821 (not (= lt!300709 (Found!6901 index!984))))))

(declare-fun lt!300714 () Unit!22032)

(declare-fun e!371572 () Unit!22032)

(assert (=> b!647946 (= lt!300714 e!371572)))

(declare-fun c!74431 () Bool)

(assert (=> b!647946 (= c!74431 (= lt!300709 Undefined!6901))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38507 (_ BitVec 32)) SeekEntryResult!6901)

(assert (=> b!647946 (= lt!300709 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300717 lt!300713 mask!3053))))

(declare-fun e!371570 () Bool)

(assert (=> b!647946 e!371570))

(declare-fun res!419827 () Bool)

(assert (=> b!647946 (=> (not res!419827) (not e!371570))))

(declare-fun lt!300721 () (_ BitVec 32))

(declare-fun lt!300706 () SeekEntryResult!6901)

(assert (=> b!647946 (= res!419827 (= lt!300706 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 lt!300717 lt!300713 mask!3053)))))

(assert (=> b!647946 (= lt!300706 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 (select (arr!18461 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!647946 (= lt!300717 (select (store (arr!18461 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300715 () Unit!22032)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22032)

(assert (=> b!647946 (= lt!300715 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300721 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647946 (= lt!300721 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!647947 () Bool)

(declare-fun e!371562 () Bool)

(assert (=> b!647947 (= e!371574 e!371562)))

(declare-fun res!419826 () Bool)

(assert (=> b!647947 (=> (not res!419826) (not e!371562))))

(declare-fun lt!300719 () SeekEntryResult!6901)

(assert (=> b!647947 (= res!419826 (or (= lt!300719 (MissingZero!6901 i!1108)) (= lt!300719 (MissingVacant!6901 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38507 (_ BitVec 32)) SeekEntryResult!6901)

(assert (=> b!647947 (= lt!300719 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!647948 () Bool)

(declare-fun e!371577 () Bool)

(declare-fun e!371571 () Bool)

(assert (=> b!647948 (= e!371577 e!371571)))

(declare-fun res!419831 () Bool)

(assert (=> b!647948 (=> (not res!419831) (not e!371571))))

(assert (=> b!647948 (= res!419831 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) j!136))))

(declare-fun b!647949 () Bool)

(declare-fun Unit!22035 () Unit!22032)

(assert (=> b!647949 (= e!371563 Unit!22035)))

(declare-fun b!647950 () Bool)

(declare-fun e!371573 () Bool)

(assert (=> b!647950 (= e!371562 e!371573)))

(declare-fun res!419835 () Bool)

(assert (=> b!647950 (=> (not res!419835) (not e!371573))))

(assert (=> b!647950 (= res!419835 (= (select (store (arr!18461 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647950 (= lt!300713 (array!38508 (store (arr!18461 a!2986) i!1108 k!1786) (size!18825 a!2986)))))

(declare-fun b!647951 () Bool)

(declare-fun res!419834 () Bool)

(assert (=> b!647951 (=> (not res!419834) (not e!371562))))

(assert (=> b!647951 (= res!419834 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18461 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647952 () Bool)

(declare-fun res!419829 () Bool)

(assert (=> b!647952 (=> (not res!419829) (not e!371562))))

(assert (=> b!647952 (= res!419829 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12499))))

(declare-fun b!647953 () Bool)

(declare-fun e!371575 () Bool)

(assert (=> b!647953 (= e!371575 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) index!984))))

(declare-fun b!647954 () Bool)

(declare-fun e!371569 () Bool)

(assert (=> b!647954 (= e!371568 e!371569)))

(declare-fun res!419833 () Bool)

(assert (=> b!647954 (=> res!419833 e!371569)))

(assert (=> b!647954 (= res!419833 (bvsge index!984 j!136))))

(declare-fun lt!300720 () Unit!22032)

(assert (=> b!647954 (= lt!300720 e!371563)))

(declare-fun c!74432 () Bool)

(assert (=> b!647954 (= c!74432 (bvslt j!136 index!984))))

(declare-fun b!647955 () Bool)

(declare-fun Unit!22036 () Unit!22032)

(assert (=> b!647955 (= e!371572 Unit!22036)))

(assert (=> b!647955 false))

(declare-fun b!647956 () Bool)

(declare-fun lt!300712 () SeekEntryResult!6901)

(assert (=> b!647956 (= e!371570 (= lt!300712 lt!300706))))

(declare-fun b!647957 () Bool)

(declare-fun res!419817 () Bool)

(declare-fun e!371576 () Bool)

(assert (=> b!647957 (=> res!419817 e!371576)))

(declare-fun noDuplicate!419 (List!12502) Bool)

(assert (=> b!647957 (= res!419817 (not (noDuplicate!419 Nil!12499)))))

(declare-fun b!647959 () Bool)

(declare-fun res!419820 () Bool)

(assert (=> b!647959 (=> (not res!419820) (not e!371562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38507 (_ BitVec 32)) Bool)

(assert (=> b!647959 (= res!419820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647960 () Bool)

(declare-fun Unit!22037 () Unit!22032)

(assert (=> b!647960 (= e!371572 Unit!22037)))

(declare-fun b!647961 () Bool)

(declare-fun res!419837 () Bool)

(assert (=> b!647961 (=> res!419837 e!371576)))

(declare-fun contains!3157 (List!12502 (_ BitVec 64)) Bool)

(assert (=> b!647961 (= res!419837 (contains!3157 Nil!12499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647962 () Bool)

(assert (=> b!647962 (= e!371573 e!371566)))

(declare-fun res!419832 () Bool)

(assert (=> b!647962 (=> (not res!419832) (not e!371566))))

(assert (=> b!647962 (= res!419832 (and (= lt!300712 (Found!6901 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18461 a!2986) index!984) (select (arr!18461 a!2986) j!136))) (not (= (select (arr!18461 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!647962 (= lt!300712 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18461 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647963 () Bool)

(assert (=> b!647963 (= e!371576 (not (contains!3157 Nil!12499 k!1786)))))

(declare-fun b!647964 () Bool)

(declare-fun res!419819 () Bool)

(assert (=> b!647964 (=> res!419819 e!371576)))

(assert (=> b!647964 (= res!419819 (contains!3157 Nil!12499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647965 () Bool)

(declare-fun res!419822 () Bool)

(assert (=> b!647965 (=> (not res!419822) (not e!371574))))

(assert (=> b!647965 (= res!419822 (and (= (size!18825 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18825 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18825 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647966 () Bool)

(assert (=> b!647966 (= e!371569 e!371576)))

(declare-fun res!419836 () Bool)

(assert (=> b!647966 (=> res!419836 e!371576)))

(assert (=> b!647966 (= res!419836 (or (bvsge (size!18825 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18825 a!2986))))))

(assert (=> b!647966 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300707 () Unit!22032)

(assert (=> b!647966 (= lt!300707 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300713 (select (arr!18461 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!647966 e!371575))

(declare-fun res!419815 () Bool)

(assert (=> b!647966 (=> (not res!419815) (not e!371575))))

(assert (=> b!647966 (= res!419815 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) j!136))))

(declare-fun b!647967 () Bool)

(assert (=> b!647967 (= e!371571 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) index!984))))

(declare-fun b!647968 () Bool)

(assert (=> b!647968 (= e!371564 e!371577)))

(declare-fun res!419825 () Bool)

(assert (=> b!647968 (=> res!419825 e!371577)))

(assert (=> b!647968 (= res!419825 (or (not (= (select (arr!18461 a!2986) j!136) lt!300717)) (not (= (select (arr!18461 a!2986) j!136) lt!300710)) (bvsge j!136 index!984)))))

(declare-fun b!647969 () Bool)

(declare-fun res!419828 () Bool)

(assert (=> b!647969 (=> (not res!419828) (not e!371574))))

(assert (=> b!647969 (= res!419828 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!419823 () Bool)

(assert (=> start!58752 (=> (not res!419823) (not e!371574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58752 (= res!419823 (validMask!0 mask!3053))))

(assert (=> start!58752 e!371574))

(assert (=> start!58752 true))

(declare-fun array_inv!14257 (array!38507) Bool)

(assert (=> start!58752 (array_inv!14257 a!2986)))

(declare-fun b!647958 () Bool)

(declare-fun res!419816 () Bool)

(assert (=> b!647958 (=> (not res!419816) (not e!371574))))

(assert (=> b!647958 (= res!419816 (validKeyInArray!0 (select (arr!18461 a!2986) j!136)))))

(assert (= (and start!58752 res!419823) b!647965))

(assert (= (and b!647965 res!419822) b!647958))

(assert (= (and b!647958 res!419816) b!647943))

(assert (= (and b!647943 res!419824) b!647969))

(assert (= (and b!647969 res!419828) b!647947))

(assert (= (and b!647947 res!419826) b!647959))

(assert (= (and b!647959 res!419820) b!647952))

(assert (= (and b!647952 res!419829) b!647951))

(assert (= (and b!647951 res!419834) b!647950))

(assert (= (and b!647950 res!419835) b!647962))

(assert (= (and b!647962 res!419832) b!647946))

(assert (= (and b!647946 res!419827) b!647956))

(assert (= (and b!647946 c!74431) b!647955))

(assert (= (and b!647946 (not c!74431)) b!647960))

(assert (= (and b!647946 (not res!419821)) b!647944))

(assert (= (and b!647944 res!419818) b!647968))

(assert (= (and b!647968 (not res!419825)) b!647948))

(assert (= (and b!647948 res!419831) b!647967))

(assert (= (and b!647944 (not res!419830)) b!647954))

(assert (= (and b!647954 c!74432) b!647945))

(assert (= (and b!647954 (not c!74432)) b!647949))

(assert (= (and b!647954 (not res!419833)) b!647966))

(assert (= (and b!647966 res!419815) b!647953))

(assert (= (and b!647966 (not res!419836)) b!647957))

(assert (= (and b!647957 (not res!419817)) b!647964))

(assert (= (and b!647964 (not res!419819)) b!647961))

(assert (= (and b!647961 (not res!419837)) b!647963))

(declare-fun m!621317 () Bool)

(assert (=> b!647951 m!621317))

(declare-fun m!621319 () Bool)

(assert (=> b!647950 m!621319))

(declare-fun m!621321 () Bool)

(assert (=> b!647950 m!621321))

(declare-fun m!621323 () Bool)

(assert (=> b!647959 m!621323))

(declare-fun m!621325 () Bool)

(assert (=> start!58752 m!621325))

(declare-fun m!621327 () Bool)

(assert (=> start!58752 m!621327))

(declare-fun m!621329 () Bool)

(assert (=> b!647962 m!621329))

(declare-fun m!621331 () Bool)

(assert (=> b!647962 m!621331))

(assert (=> b!647962 m!621331))

(declare-fun m!621333 () Bool)

(assert (=> b!647962 m!621333))

(assert (=> b!647966 m!621331))

(assert (=> b!647966 m!621331))

(declare-fun m!621335 () Bool)

(assert (=> b!647966 m!621335))

(assert (=> b!647966 m!621331))

(declare-fun m!621337 () Bool)

(assert (=> b!647966 m!621337))

(assert (=> b!647966 m!621331))

(declare-fun m!621339 () Bool)

(assert (=> b!647966 m!621339))

(declare-fun m!621341 () Bool)

(assert (=> b!647947 m!621341))

(declare-fun m!621343 () Bool)

(assert (=> b!647969 m!621343))

(declare-fun m!621345 () Bool)

(assert (=> b!647964 m!621345))

(assert (=> b!647948 m!621331))

(assert (=> b!647948 m!621331))

(assert (=> b!647948 m!621339))

(declare-fun m!621347 () Bool)

(assert (=> b!647946 m!621347))

(declare-fun m!621349 () Bool)

(assert (=> b!647946 m!621349))

(declare-fun m!621351 () Bool)

(assert (=> b!647946 m!621351))

(assert (=> b!647946 m!621331))

(assert (=> b!647946 m!621319))

(declare-fun m!621353 () Bool)

(assert (=> b!647946 m!621353))

(assert (=> b!647946 m!621331))

(declare-fun m!621355 () Bool)

(assert (=> b!647946 m!621355))

(declare-fun m!621357 () Bool)

(assert (=> b!647946 m!621357))

(assert (=> b!647967 m!621331))

(assert (=> b!647967 m!621331))

(declare-fun m!621359 () Bool)

(assert (=> b!647967 m!621359))

(declare-fun m!621361 () Bool)

(assert (=> b!647957 m!621361))

(assert (=> b!647944 m!621331))

(assert (=> b!647944 m!621319))

(declare-fun m!621363 () Bool)

(assert (=> b!647944 m!621363))

(declare-fun m!621365 () Bool)

(assert (=> b!647943 m!621365))

(assert (=> b!647945 m!621331))

(declare-fun m!621367 () Bool)

(assert (=> b!647945 m!621367))

(assert (=> b!647945 m!621331))

(declare-fun m!621369 () Bool)

(assert (=> b!647945 m!621369))

(assert (=> b!647945 m!621331))

(declare-fun m!621371 () Bool)

(assert (=> b!647945 m!621371))

(assert (=> b!647945 m!621331))

(declare-fun m!621373 () Bool)

(assert (=> b!647945 m!621373))

(declare-fun m!621375 () Bool)

(assert (=> b!647945 m!621375))

(declare-fun m!621377 () Bool)

(assert (=> b!647945 m!621377))

(declare-fun m!621379 () Bool)

(assert (=> b!647945 m!621379))

(assert (=> b!647953 m!621331))

(assert (=> b!647953 m!621331))

(assert (=> b!647953 m!621359))

(declare-fun m!621381 () Bool)

(assert (=> b!647952 m!621381))

(declare-fun m!621383 () Bool)

(assert (=> b!647961 m!621383))

(assert (=> b!647968 m!621331))

(assert (=> b!647958 m!621331))

(assert (=> b!647958 m!621331))

(declare-fun m!621385 () Bool)

(assert (=> b!647958 m!621385))

(declare-fun m!621387 () Bool)

(assert (=> b!647963 m!621387))

(push 1)

(assert (not b!647947))

(assert (not b!647957))

(assert (not b!647966))

(assert (not b!647963))

(assert (not b!647948))

(assert (not b!647959))

(assert (not b!647967))

(assert (not b!647961))

(assert (not start!58752))

(assert (not b!647952))

(assert (not b!647964))

(assert (not b!647953))

(assert (not b!647945))

(assert (not b!647946))

(assert (not b!647969))

(assert (not b!647962))

(assert (not b!647958))

(assert (not b!647943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91719 () Bool)

(declare-fun res!419855 () Bool)

(declare-fun e!371610 () Bool)

(assert (=> d!91719 (=> res!419855 e!371610)))

(assert (=> d!91719 (= res!419855 (= (select (arr!18461 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91719 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!371610)))

(declare-fun b!648017 () Bool)

(declare-fun e!371611 () Bool)

(assert (=> b!648017 (= e!371610 e!371611)))

(declare-fun res!419856 () Bool)

(assert (=> b!648017 (=> (not res!419856) (not e!371611))))

(assert (=> b!648017 (= res!419856 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18825 a!2986)))))

(declare-fun b!648018 () Bool)

(assert (=> b!648018 (= e!371611 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91719 (not res!419855)) b!648017))

(assert (= (and b!648017 res!419856) b!648018))

(declare-fun m!621425 () Bool)

(assert (=> d!91719 m!621425))

(declare-fun m!621427 () Bool)

(assert (=> b!648018 m!621427))

(assert (=> b!647969 d!91719))

(declare-fun d!91727 () Bool)

(declare-fun res!419859 () Bool)

(declare-fun e!371614 () Bool)

(assert (=> d!91727 (=> res!419859 e!371614)))

(assert (=> d!91727 (= res!419859 (= (select (arr!18461 lt!300713) j!136) (select (arr!18461 a!2986) j!136)))))

(assert (=> d!91727 (= (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) j!136) e!371614)))

(declare-fun b!648021 () Bool)

(declare-fun e!371615 () Bool)

(assert (=> b!648021 (= e!371614 e!371615)))

(declare-fun res!419860 () Bool)

(assert (=> b!648021 (=> (not res!419860) (not e!371615))))

(assert (=> b!648021 (= res!419860 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18825 lt!300713)))))

(declare-fun b!648022 () Bool)

(assert (=> b!648022 (= e!371615 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91727 (not res!419859)) b!648021))

(assert (= (and b!648021 res!419860) b!648022))

(declare-fun m!621435 () Bool)

(assert (=> d!91727 m!621435))

(assert (=> b!648022 m!621331))

(declare-fun m!621437 () Bool)

(assert (=> b!648022 m!621437))

(assert (=> b!647948 d!91727))

(declare-fun b!648080 () Bool)

(declare-fun e!371666 () Bool)

(declare-fun e!371667 () Bool)

(assert (=> b!648080 (= e!371666 e!371667)))

(declare-fun lt!300759 () (_ BitVec 64))

(assert (=> b!648080 (= lt!300759 (select (arr!18461 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300761 () Unit!22032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38507 (_ BitVec 64) (_ BitVec 32)) Unit!22032)

(assert (=> b!648080 (= lt!300761 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300759 #b00000000000000000000000000000000))))

(assert (=> b!648080 (arrayContainsKey!0 a!2986 lt!300759 #b00000000000000000000000000000000)))

(declare-fun lt!300760 () Unit!22032)

(assert (=> b!648080 (= lt!300760 lt!300761)))

(declare-fun res!419905 () Bool)

(assert (=> b!648080 (= res!419905 (= (seekEntryOrOpen!0 (select (arr!18461 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6901 #b00000000000000000000000000000000)))))

(assert (=> b!648080 (=> (not res!419905) (not e!371667))))

(declare-fun b!648081 () Bool)

(declare-fun call!33712 () Bool)

(assert (=> b!648081 (= e!371666 call!33712)))

(declare-fun b!648082 () Bool)

(assert (=> b!648082 (= e!371667 call!33712)))

(declare-fun b!648083 () Bool)

(declare-fun e!371668 () Bool)

(assert (=> b!648083 (= e!371668 e!371666)))

(declare-fun c!74455 () Bool)

(assert (=> b!648083 (= c!74455 (validKeyInArray!0 (select (arr!18461 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33709 () Bool)

(assert (=> bm!33709 (= call!33712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!91731 () Bool)

(declare-fun res!419904 () Bool)

(assert (=> d!91731 (=> res!419904 e!371668)))

(assert (=> d!91731 (= res!419904 (bvsge #b00000000000000000000000000000000 (size!18825 a!2986)))))

(assert (=> d!91731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371668)))

(assert (= (and d!91731 (not res!419904)) b!648083))

(assert (= (and b!648083 c!74455) b!648080))

(assert (= (and b!648083 (not c!74455)) b!648081))

(assert (= (and b!648080 res!419905) b!648082))

(assert (= (or b!648082 b!648081) bm!33709))

(assert (=> b!648080 m!621425))

(declare-fun m!621499 () Bool)

(assert (=> b!648080 m!621499))

(declare-fun m!621501 () Bool)

(assert (=> b!648080 m!621501))

(assert (=> b!648080 m!621425))

(declare-fun m!621503 () Bool)

(assert (=> b!648080 m!621503))

(assert (=> b!648083 m!621425))

(assert (=> b!648083 m!621425))

(declare-fun m!621505 () Bool)

(assert (=> b!648083 m!621505))

(declare-fun m!621507 () Bool)

(assert (=> bm!33709 m!621507))

(assert (=> b!647959 d!91731))

(declare-fun d!91763 () Bool)

(assert (=> d!91763 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58752 d!91763))

(declare-fun d!91775 () Bool)

(assert (=> d!91775 (= (array_inv!14257 a!2986) (bvsge (size!18825 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58752 d!91775))

(declare-fun b!648126 () Bool)

(declare-fun e!371703 () Bool)

(declare-fun call!33715 () Bool)

(assert (=> b!648126 (= e!371703 call!33715)))

(declare-fun bm!33712 () Bool)

(declare-fun c!74467 () Bool)

(assert (=> bm!33712 (= call!33715 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74467 (Cons!12498 (select (arr!18461 a!2986) #b00000000000000000000000000000000) Nil!12499) Nil!12499)))))

(declare-fun b!648127 () Bool)

(declare-fun e!371701 () Bool)

(assert (=> b!648127 (= e!371701 e!371703)))

(assert (=> b!648127 (= c!74467 (validKeyInArray!0 (select (arr!18461 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648129 () Bool)

(declare-fun e!371700 () Bool)

(assert (=> b!648129 (= e!371700 e!371701)))

(declare-fun res!419928 () Bool)

(assert (=> b!648129 (=> (not res!419928) (not e!371701))))

(declare-fun e!371702 () Bool)

(assert (=> b!648129 (= res!419928 (not e!371702))))

(declare-fun res!419926 () Bool)

(assert (=> b!648129 (=> (not res!419926) (not e!371702))))

(assert (=> b!648129 (= res!419926 (validKeyInArray!0 (select (arr!18461 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!648130 () Bool)

(assert (=> b!648130 (= e!371702 (contains!3157 Nil!12499 (select (arr!18461 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91777 () Bool)

(declare-fun res!419927 () Bool)

(assert (=> d!91777 (=> res!419927 e!371700)))

(assert (=> d!91777 (= res!419927 (bvsge #b00000000000000000000000000000000 (size!18825 a!2986)))))

(assert (=> d!91777 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12499) e!371700)))

(declare-fun b!648128 () Bool)

(assert (=> b!648128 (= e!371703 call!33715)))

(assert (= (and d!91777 (not res!419927)) b!648129))

(assert (= (and b!648129 res!419926) b!648130))

(assert (= (and b!648129 res!419928) b!648127))

(assert (= (and b!648127 c!74467) b!648128))

(assert (= (and b!648127 (not c!74467)) b!648126))

(assert (= (or b!648128 b!648126) bm!33712))

(assert (=> bm!33712 m!621425))

(declare-fun m!621537 () Bool)

(assert (=> bm!33712 m!621537))

(assert (=> b!648127 m!621425))

(assert (=> b!648127 m!621425))

(assert (=> b!648127 m!621505))

(assert (=> b!648129 m!621425))

(assert (=> b!648129 m!621425))

(assert (=> b!648129 m!621505))

(assert (=> b!648130 m!621425))

(assert (=> b!648130 m!621425))

(declare-fun m!621539 () Bool)

(assert (=> b!648130 m!621539))

(assert (=> b!647952 d!91777))

(declare-fun d!91785 () Bool)

(declare-fun lt!300785 () Bool)

(declare-fun content!251 (List!12502) (Set (_ BitVec 64)))

(assert (=> d!91785 (= lt!300785 (member k!1786 (content!251 Nil!12499)))))

(declare-fun e!371711 () Bool)

(assert (=> d!91785 (= lt!300785 e!371711)))

(declare-fun res!419933 () Bool)

(assert (=> d!91785 (=> (not res!419933) (not e!371711))))

(assert (=> d!91785 (= res!419933 (is-Cons!12498 Nil!12499))))

(assert (=> d!91785 (= (contains!3157 Nil!12499 k!1786) lt!300785)))

(declare-fun b!648141 () Bool)

(declare-fun e!371712 () Bool)

(assert (=> b!648141 (= e!371711 e!371712)))

(declare-fun res!419934 () Bool)

(assert (=> b!648141 (=> res!419934 e!371712)))

(assert (=> b!648141 (= res!419934 (= (h!13543 Nil!12499) k!1786))))

(declare-fun b!648142 () Bool)

(assert (=> b!648142 (= e!371712 (contains!3157 (t!18730 Nil!12499) k!1786))))

(assert (= (and d!91785 res!419933) b!648141))

(assert (= (and b!648141 (not res!419934)) b!648142))

(declare-fun m!621547 () Bool)

(assert (=> d!91785 m!621547))

(declare-fun m!621549 () Bool)

(assert (=> d!91785 m!621549))

(declare-fun m!621551 () Bool)

(assert (=> b!648142 m!621551))

(assert (=> b!647963 d!91785))

(declare-fun d!91789 () Bool)

(declare-fun lt!300786 () Bool)

(assert (=> d!91789 (= lt!300786 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!251 Nil!12499)))))

(declare-fun e!371713 () Bool)

(assert (=> d!91789 (= lt!300786 e!371713)))

(declare-fun res!419935 () Bool)

(assert (=> d!91789 (=> (not res!419935) (not e!371713))))

(assert (=> d!91789 (= res!419935 (is-Cons!12498 Nil!12499))))

(assert (=> d!91789 (= (contains!3157 Nil!12499 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300786)))

(declare-fun b!648143 () Bool)

(declare-fun e!371714 () Bool)

(assert (=> b!648143 (= e!371713 e!371714)))

(declare-fun res!419936 () Bool)

(assert (=> b!648143 (=> res!419936 e!371714)))

(assert (=> b!648143 (= res!419936 (= (h!13543 Nil!12499) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648144 () Bool)

(assert (=> b!648144 (= e!371714 (contains!3157 (t!18730 Nil!12499) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91789 res!419935) b!648143))

(assert (= (and b!648143 (not res!419936)) b!648144))

(assert (=> d!91789 m!621547))

(declare-fun m!621553 () Bool)

(assert (=> d!91789 m!621553))

(declare-fun m!621555 () Bool)

(assert (=> b!648144 m!621555))

(assert (=> b!647961 d!91789))

(declare-fun b!648197 () Bool)

(declare-fun e!371746 () SeekEntryResult!6901)

(assert (=> b!648197 (= e!371746 Undefined!6901)))

(declare-fun b!648198 () Bool)

(declare-fun e!371748 () SeekEntryResult!6901)

(assert (=> b!648198 (= e!371748 (Found!6901 index!984))))

(declare-fun b!648199 () Bool)

(declare-fun e!371747 () SeekEntryResult!6901)

(assert (=> b!648199 (= e!371747 (MissingVacant!6901 vacantSpotIndex!68))))

(declare-fun lt!300807 () SeekEntryResult!6901)

(declare-fun d!91791 () Bool)

(assert (=> d!91791 (and (or (is-Undefined!6901 lt!300807) (not (is-Found!6901 lt!300807)) (and (bvsge (index!29949 lt!300807) #b00000000000000000000000000000000) (bvslt (index!29949 lt!300807) (size!18825 a!2986)))) (or (is-Undefined!6901 lt!300807) (is-Found!6901 lt!300807) (not (is-MissingVacant!6901 lt!300807)) (not (= (index!29951 lt!300807) vacantSpotIndex!68)) (and (bvsge (index!29951 lt!300807) #b00000000000000000000000000000000) (bvslt (index!29951 lt!300807) (size!18825 a!2986)))) (or (is-Undefined!6901 lt!300807) (ite (is-Found!6901 lt!300807) (= (select (arr!18461 a!2986) (index!29949 lt!300807)) (select (arr!18461 a!2986) j!136)) (and (is-MissingVacant!6901 lt!300807) (= (index!29951 lt!300807) vacantSpotIndex!68) (= (select (arr!18461 a!2986) (index!29951 lt!300807)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91791 (= lt!300807 e!371746)))

(declare-fun c!74492 () Bool)

(assert (=> d!91791 (= c!74492 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300808 () (_ BitVec 64))

(assert (=> d!91791 (= lt!300808 (select (arr!18461 a!2986) index!984))))

(assert (=> d!91791 (validMask!0 mask!3053)))

(assert (=> d!91791 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18461 a!2986) j!136) a!2986 mask!3053) lt!300807)))

(declare-fun b!648200 () Bool)

(assert (=> b!648200 (= e!371747 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18461 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648201 () Bool)

(declare-fun c!74494 () Bool)

(assert (=> b!648201 (= c!74494 (= lt!300808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648201 (= e!371748 e!371747)))

(declare-fun b!648202 () Bool)

(assert (=> b!648202 (= e!371746 e!371748)))

(declare-fun c!74493 () Bool)

(assert (=> b!648202 (= c!74493 (= lt!300808 (select (arr!18461 a!2986) j!136)))))

(assert (= (and d!91791 c!74492) b!648197))

(assert (= (and d!91791 (not c!74492)) b!648202))

(assert (= (and b!648202 c!74493) b!648198))

(assert (= (and b!648202 (not c!74493)) b!648201))

(assert (= (and b!648201 c!74494) b!648199))

(assert (= (and b!648201 (not c!74494)) b!648200))

(declare-fun m!621599 () Bool)

(assert (=> d!91791 m!621599))

(declare-fun m!621601 () Bool)

(assert (=> d!91791 m!621601))

(assert (=> d!91791 m!621329))

(assert (=> d!91791 m!621325))

(assert (=> b!648200 m!621347))

(assert (=> b!648200 m!621347))

(assert (=> b!648200 m!621331))

(declare-fun m!621603 () Bool)

(assert (=> b!648200 m!621603))

(assert (=> b!647962 d!91791))

(declare-fun d!91809 () Bool)

(declare-fun res!419947 () Bool)

(declare-fun e!371749 () Bool)

(assert (=> d!91809 (=> res!419947 e!371749)))

(assert (=> d!91809 (= res!419947 (= (select (arr!18461 lt!300713) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18461 a!2986) j!136)))))

(assert (=> d!91809 (= (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371749)))

(declare-fun b!648203 () Bool)

(declare-fun e!371750 () Bool)

(assert (=> b!648203 (= e!371749 e!371750)))

(declare-fun res!419948 () Bool)

(assert (=> b!648203 (=> (not res!419948) (not e!371750))))

(assert (=> b!648203 (= res!419948 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18825 lt!300713)))))

(declare-fun b!648204 () Bool)

(assert (=> b!648204 (= e!371750 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91809 (not res!419947)) b!648203))

(assert (= (and b!648203 res!419948) b!648204))

(declare-fun m!621605 () Bool)

(assert (=> d!91809 m!621605))

(assert (=> b!648204 m!621331))

(declare-fun m!621607 () Bool)

(assert (=> b!648204 m!621607))

(assert (=> b!647966 d!91809))

(declare-fun d!91813 () Bool)

(assert (=> d!91813 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300813 () Unit!22032)

(declare-fun choose!114 (array!38507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22032)

(assert (=> d!91813 (= lt!300813 (choose!114 lt!300713 (select (arr!18461 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91813 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91813 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300713 (select (arr!18461 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300813)))

(declare-fun bs!19361 () Bool)

(assert (= bs!19361 d!91813))

(assert (=> bs!19361 m!621331))

(assert (=> bs!19361 m!621335))

(assert (=> bs!19361 m!621331))

(declare-fun m!621609 () Bool)

(assert (=> bs!19361 m!621609))

(assert (=> b!647966 d!91813))

(assert (=> b!647966 d!91727))

(declare-fun d!91815 () Bool)

(declare-fun res!419953 () Bool)

(declare-fun e!371757 () Bool)

(assert (=> d!91815 (=> res!419953 e!371757)))

(assert (=> d!91815 (= res!419953 (= (select (arr!18461 lt!300713) index!984) (select (arr!18461 a!2986) j!136)))))

(assert (=> d!91815 (= (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) index!984) e!371757)))

(declare-fun b!648213 () Bool)

(declare-fun e!371758 () Bool)

(assert (=> b!648213 (= e!371757 e!371758)))

(declare-fun res!419954 () Bool)

(assert (=> b!648213 (=> (not res!419954) (not e!371758))))

(assert (=> b!648213 (= res!419954 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18825 lt!300713)))))

(declare-fun b!648214 () Bool)

(assert (=> b!648214 (= e!371758 (arrayContainsKey!0 lt!300713 (select (arr!18461 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91815 (not res!419953)) b!648213))

(assert (= (and b!648213 res!419954) b!648214))

(declare-fun m!621611 () Bool)

(assert (=> d!91815 m!621611))

(assert (=> b!648214 m!621331))

(declare-fun m!621615 () Bool)

(assert (=> b!648214 m!621615))

(assert (=> b!647953 d!91815))

(declare-fun d!91819 () Bool)

(declare-fun lt!300821 () Bool)

(assert (=> d!91819 (= lt!300821 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!251 Nil!12499)))))

(declare-fun e!371759 () Bool)

(assert (=> d!91819 (= lt!300821 e!371759)))

(declare-fun res!419955 () Bool)

(assert (=> d!91819 (=> (not res!419955) (not e!371759))))

(assert (=> d!91819 (= res!419955 (is-Cons!12498 Nil!12499))))

(assert (=> d!91819 (= (contains!3157 Nil!12499 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300821)))

(declare-fun b!648215 () Bool)

(declare-fun e!371760 () Bool)

(assert (=> b!648215 (= e!371759 e!371760)))

(declare-fun res!419956 () Bool)

(assert (=> b!648215 (=> res!419956 e!371760)))

(assert (=> b!648215 (= res!419956 (= (h!13543 Nil!12499) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648216 () Bool)

(assert (=> b!648216 (= e!371760 (contains!3157 (t!18730 Nil!12499) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91819 res!419955) b!648215))

(assert (= (and b!648215 (not res!419956)) b!648216))

(assert (=> d!91819 m!621547))

