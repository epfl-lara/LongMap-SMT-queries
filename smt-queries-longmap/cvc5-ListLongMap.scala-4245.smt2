; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58856 () Bool)

(assert start!58856)

(declare-fun b!648648 () Bool)

(declare-fun e!372036 () Bool)

(declare-fun e!372045 () Bool)

(assert (=> b!648648 (= e!372036 e!372045)))

(declare-fun res!420272 () Bool)

(assert (=> b!648648 (=> res!420272 e!372045)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!648648 (= res!420272 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22056 0))(
  ( (Unit!22057) )
))
(declare-fun lt!301082 () Unit!22056)

(declare-fun e!372035 () Unit!22056)

(assert (=> b!648648 (= lt!301082 e!372035)))

(declare-fun c!74561 () Bool)

(assert (=> b!648648 (= c!74561 (bvslt j!136 index!984))))

(declare-fun b!648649 () Bool)

(declare-fun res!420276 () Bool)

(declare-fun e!372031 () Bool)

(assert (=> b!648649 (=> res!420276 e!372031)))

(declare-datatypes ((List!12506 0))(
  ( (Nil!12503) (Cons!12502 (h!13547 (_ BitVec 64)) (t!18734 List!12506)) )
))
(declare-fun noDuplicate!423 (List!12506) Bool)

(assert (=> b!648649 (= res!420276 (not (noDuplicate!423 Nil!12503)))))

(declare-fun b!648650 () Bool)

(declare-fun e!372032 () Unit!22056)

(declare-fun Unit!22058 () Unit!22056)

(assert (=> b!648650 (= e!372032 Unit!22058)))

(assert (=> b!648650 false))

(declare-fun b!648651 () Bool)

(declare-fun e!372037 () Bool)

(declare-datatypes ((SeekEntryResult!6905 0))(
  ( (MissingZero!6905 (index!29967 (_ BitVec 32))) (Found!6905 (index!29968 (_ BitVec 32))) (Intermediate!6905 (undefined!7717 Bool) (index!29969 (_ BitVec 32)) (x!58758 (_ BitVec 32))) (Undefined!6905) (MissingVacant!6905 (index!29970 (_ BitVec 32))) )
))
(declare-fun lt!301084 () SeekEntryResult!6905)

(declare-fun lt!301071 () SeekEntryResult!6905)

(assert (=> b!648651 (= e!372037 (= lt!301084 lt!301071))))

(declare-fun b!648652 () Bool)

(declare-fun e!372042 () Bool)

(declare-fun e!372040 () Bool)

(assert (=> b!648652 (= e!372042 e!372040)))

(declare-fun res!420274 () Bool)

(assert (=> b!648652 (=> res!420274 e!372040)))

(declare-fun lt!301079 () (_ BitVec 64))

(declare-fun lt!301073 () (_ BitVec 64))

(declare-datatypes ((array!38518 0))(
  ( (array!38519 (arr!18465 (Array (_ BitVec 32) (_ BitVec 64))) (size!18829 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38518)

(assert (=> b!648652 (= res!420274 (or (not (= (select (arr!18465 a!2986) j!136) lt!301079)) (not (= (select (arr!18465 a!2986) j!136) lt!301073)) (bvsge j!136 index!984)))))

(declare-fun lt!301075 () array!38518)

(declare-fun b!648653 () Bool)

(declare-fun e!372033 () Bool)

(declare-fun arrayContainsKey!0 (array!38518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648653 (= e!372033 (arrayContainsKey!0 lt!301075 (select (arr!18465 a!2986) j!136) index!984))))

(declare-fun res!420279 () Bool)

(declare-fun e!372044 () Bool)

(assert (=> start!58856 (=> (not res!420279) (not e!372044))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58856 (= res!420279 (validMask!0 mask!3053))))

(assert (=> start!58856 e!372044))

(assert (=> start!58856 true))

(declare-fun array_inv!14261 (array!38518) Bool)

(assert (=> start!58856 (array_inv!14261 a!2986)))

(declare-fun b!648654 () Bool)

(assert (=> b!648654 (= e!372031 true)))

(declare-fun lt!301081 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun contains!3161 (List!12506 (_ BitVec 64)) Bool)

(assert (=> b!648654 (= lt!301081 (contains!3161 Nil!12503 k!1786))))

(declare-fun b!648655 () Bool)

(declare-fun res!420264 () Bool)

(declare-fun e!372043 () Bool)

(assert (=> b!648655 (=> (not res!420264) (not e!372043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38518 (_ BitVec 32)) Bool)

(assert (=> b!648655 (= res!420264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648656 () Bool)

(assert (=> b!648656 (= e!372044 e!372043)))

(declare-fun res!420270 () Bool)

(assert (=> b!648656 (=> (not res!420270) (not e!372043))))

(declare-fun lt!301087 () SeekEntryResult!6905)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648656 (= res!420270 (or (= lt!301087 (MissingZero!6905 i!1108)) (= lt!301087 (MissingVacant!6905 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38518 (_ BitVec 32)) SeekEntryResult!6905)

(assert (=> b!648656 (= lt!301087 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!648657 () Bool)

(declare-fun e!372038 () Bool)

(declare-fun e!372030 () Bool)

(assert (=> b!648657 (= e!372038 (not e!372030))))

(declare-fun res!420269 () Bool)

(assert (=> b!648657 (=> res!420269 e!372030)))

(declare-fun lt!301074 () SeekEntryResult!6905)

(assert (=> b!648657 (= res!420269 (not (= lt!301074 (Found!6905 index!984))))))

(declare-fun lt!301078 () Unit!22056)

(assert (=> b!648657 (= lt!301078 e!372032)))

(declare-fun c!74560 () Bool)

(assert (=> b!648657 (= c!74560 (= lt!301074 Undefined!6905))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38518 (_ BitVec 32)) SeekEntryResult!6905)

(assert (=> b!648657 (= lt!301074 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301079 lt!301075 mask!3053))))

(assert (=> b!648657 e!372037))

(declare-fun res!420282 () Bool)

(assert (=> b!648657 (=> (not res!420282) (not e!372037))))

(declare-fun lt!301077 () (_ BitVec 32))

(assert (=> b!648657 (= res!420282 (= lt!301071 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301077 vacantSpotIndex!68 lt!301079 lt!301075 mask!3053)))))

(assert (=> b!648657 (= lt!301071 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301077 vacantSpotIndex!68 (select (arr!18465 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648657 (= lt!301079 (select (store (arr!18465 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301080 () Unit!22056)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22056)

(assert (=> b!648657 (= lt!301080 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301077 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648657 (= lt!301077 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648658 () Bool)

(assert (=> b!648658 (= e!372030 e!372036)))

(declare-fun res!420278 () Bool)

(assert (=> b!648658 (=> res!420278 e!372036)))

(assert (=> b!648658 (= res!420278 (or (not (= (select (arr!18465 a!2986) j!136) lt!301079)) (not (= (select (arr!18465 a!2986) j!136) lt!301073))))))

(assert (=> b!648658 e!372042))

(declare-fun res!420273 () Bool)

(assert (=> b!648658 (=> (not res!420273) (not e!372042))))

(assert (=> b!648658 (= res!420273 (= lt!301073 (select (arr!18465 a!2986) j!136)))))

(assert (=> b!648658 (= lt!301073 (select (store (arr!18465 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!648659 () Bool)

(declare-fun res!420277 () Bool)

(assert (=> b!648659 (=> (not res!420277) (not e!372044))))

(assert (=> b!648659 (= res!420277 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648660 () Bool)

(declare-fun res!420263 () Bool)

(assert (=> b!648660 (=> (not res!420263) (not e!372043))))

(assert (=> b!648660 (= res!420263 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18465 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648661 () Bool)

(declare-fun Unit!22059 () Unit!22056)

(assert (=> b!648661 (= e!372035 Unit!22059)))

(declare-fun e!372041 () Bool)

(declare-fun b!648662 () Bool)

(assert (=> b!648662 (= e!372041 (arrayContainsKey!0 lt!301075 (select (arr!18465 a!2986) j!136) index!984))))

(declare-fun b!648663 () Bool)

(declare-fun res!420284 () Bool)

(assert (=> b!648663 (=> res!420284 e!372031)))

(assert (=> b!648663 (= res!420284 (contains!3161 Nil!12503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648664 () Bool)

(declare-fun res!420280 () Bool)

(assert (=> b!648664 (=> (not res!420280) (not e!372044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648664 (= res!420280 (validKeyInArray!0 k!1786))))

(declare-fun b!648665 () Bool)

(declare-fun e!372039 () Bool)

(assert (=> b!648665 (= e!372043 e!372039)))

(declare-fun res!420281 () Bool)

(assert (=> b!648665 (=> (not res!420281) (not e!372039))))

(assert (=> b!648665 (= res!420281 (= (select (store (arr!18465 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648665 (= lt!301075 (array!38519 (store (arr!18465 a!2986) i!1108 k!1786) (size!18829 a!2986)))))

(declare-fun b!648666 () Bool)

(declare-fun res!420262 () Bool)

(assert (=> b!648666 (=> res!420262 e!372031)))

(assert (=> b!648666 (= res!420262 (contains!3161 Nil!12503 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648667 () Bool)

(assert (=> b!648667 (= e!372039 e!372038)))

(declare-fun res!420271 () Bool)

(assert (=> b!648667 (=> (not res!420271) (not e!372038))))

(assert (=> b!648667 (= res!420271 (and (= lt!301084 (Found!6905 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18465 a!2986) index!984) (select (arr!18465 a!2986) j!136))) (not (= (select (arr!18465 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648667 (= lt!301084 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18465 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648668 () Bool)

(declare-fun res!420265 () Bool)

(assert (=> b!648668 (=> (not res!420265) (not e!372044))))

(assert (=> b!648668 (= res!420265 (validKeyInArray!0 (select (arr!18465 a!2986) j!136)))))

(declare-fun b!648669 () Bool)

(declare-fun Unit!22060 () Unit!22056)

(assert (=> b!648669 (= e!372035 Unit!22060)))

(declare-fun lt!301086 () Unit!22056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22056)

(assert (=> b!648669 (= lt!301086 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301075 (select (arr!18465 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648669 (arrayContainsKey!0 lt!301075 (select (arr!18465 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301083 () Unit!22056)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12506) Unit!22056)

(assert (=> b!648669 (= lt!301083 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12503))))

(declare-fun arrayNoDuplicates!0 (array!38518 (_ BitVec 32) List!12506) Bool)

(assert (=> b!648669 (arrayNoDuplicates!0 lt!301075 #b00000000000000000000000000000000 Nil!12503)))

(declare-fun lt!301076 () Unit!22056)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38518 (_ BitVec 32) (_ BitVec 32)) Unit!22056)

(assert (=> b!648669 (= lt!301076 (lemmaNoDuplicateFromThenFromBigger!0 lt!301075 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648669 (arrayNoDuplicates!0 lt!301075 j!136 Nil!12503)))

(declare-fun lt!301085 () Unit!22056)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38518 (_ BitVec 64) (_ BitVec 32) List!12506) Unit!22056)

(assert (=> b!648669 (= lt!301085 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301075 (select (arr!18465 a!2986) j!136) j!136 Nil!12503))))

(assert (=> b!648669 false))

(declare-fun b!648670 () Bool)

(assert (=> b!648670 (= e!372045 e!372031)))

(declare-fun res!420268 () Bool)

(assert (=> b!648670 (=> res!420268 e!372031)))

(assert (=> b!648670 (= res!420268 (or (bvsge (size!18829 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18829 a!2986))))))

(assert (=> b!648670 (arrayContainsKey!0 lt!301075 (select (arr!18465 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301072 () Unit!22056)

(assert (=> b!648670 (= lt!301072 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301075 (select (arr!18465 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648670 e!372033))

(declare-fun res!420275 () Bool)

(assert (=> b!648670 (=> (not res!420275) (not e!372033))))

(assert (=> b!648670 (= res!420275 (arrayContainsKey!0 lt!301075 (select (arr!18465 a!2986) j!136) j!136))))

(declare-fun b!648671 () Bool)

(declare-fun Unit!22061 () Unit!22056)

(assert (=> b!648671 (= e!372032 Unit!22061)))

(declare-fun b!648672 () Bool)

(declare-fun res!420267 () Bool)

(assert (=> b!648672 (=> (not res!420267) (not e!372043))))

(assert (=> b!648672 (= res!420267 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12503))))

(declare-fun b!648673 () Bool)

(assert (=> b!648673 (= e!372040 e!372041)))

(declare-fun res!420283 () Bool)

(assert (=> b!648673 (=> (not res!420283) (not e!372041))))

(assert (=> b!648673 (= res!420283 (arrayContainsKey!0 lt!301075 (select (arr!18465 a!2986) j!136) j!136))))

(declare-fun b!648674 () Bool)

(declare-fun res!420266 () Bool)

(assert (=> b!648674 (=> (not res!420266) (not e!372044))))

(assert (=> b!648674 (= res!420266 (and (= (size!18829 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18829 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18829 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58856 res!420279) b!648674))

(assert (= (and b!648674 res!420266) b!648668))

(assert (= (and b!648668 res!420265) b!648664))

(assert (= (and b!648664 res!420280) b!648659))

(assert (= (and b!648659 res!420277) b!648656))

(assert (= (and b!648656 res!420270) b!648655))

(assert (= (and b!648655 res!420264) b!648672))

(assert (= (and b!648672 res!420267) b!648660))

(assert (= (and b!648660 res!420263) b!648665))

(assert (= (and b!648665 res!420281) b!648667))

(assert (= (and b!648667 res!420271) b!648657))

(assert (= (and b!648657 res!420282) b!648651))

(assert (= (and b!648657 c!74560) b!648650))

(assert (= (and b!648657 (not c!74560)) b!648671))

(assert (= (and b!648657 (not res!420269)) b!648658))

(assert (= (and b!648658 res!420273) b!648652))

(assert (= (and b!648652 (not res!420274)) b!648673))

(assert (= (and b!648673 res!420283) b!648662))

(assert (= (and b!648658 (not res!420278)) b!648648))

(assert (= (and b!648648 c!74561) b!648669))

(assert (= (and b!648648 (not c!74561)) b!648661))

(assert (= (and b!648648 (not res!420272)) b!648670))

(assert (= (and b!648670 res!420275) b!648653))

(assert (= (and b!648670 (not res!420268)) b!648649))

(assert (= (and b!648649 (not res!420276)) b!648663))

(assert (= (and b!648663 (not res!420284)) b!648666))

(assert (= (and b!648666 (not res!420262)) b!648654))

(declare-fun m!621989 () Bool)

(assert (=> b!648666 m!621989))

(declare-fun m!621991 () Bool)

(assert (=> b!648652 m!621991))

(declare-fun m!621993 () Bool)

(assert (=> b!648655 m!621993))

(assert (=> b!648668 m!621991))

(assert (=> b!648668 m!621991))

(declare-fun m!621995 () Bool)

(assert (=> b!648668 m!621995))

(assert (=> b!648670 m!621991))

(assert (=> b!648670 m!621991))

(declare-fun m!621997 () Bool)

(assert (=> b!648670 m!621997))

(assert (=> b!648670 m!621991))

(declare-fun m!621999 () Bool)

(assert (=> b!648670 m!621999))

(assert (=> b!648670 m!621991))

(declare-fun m!622001 () Bool)

(assert (=> b!648670 m!622001))

(declare-fun m!622003 () Bool)

(assert (=> b!648654 m!622003))

(declare-fun m!622005 () Bool)

(assert (=> b!648656 m!622005))

(declare-fun m!622007 () Bool)

(assert (=> b!648665 m!622007))

(declare-fun m!622009 () Bool)

(assert (=> b!648665 m!622009))

(assert (=> b!648669 m!621991))

(declare-fun m!622011 () Bool)

(assert (=> b!648669 m!622011))

(assert (=> b!648669 m!621991))

(assert (=> b!648669 m!621991))

(declare-fun m!622013 () Bool)

(assert (=> b!648669 m!622013))

(declare-fun m!622015 () Bool)

(assert (=> b!648669 m!622015))

(declare-fun m!622017 () Bool)

(assert (=> b!648669 m!622017))

(assert (=> b!648669 m!621991))

(declare-fun m!622019 () Bool)

(assert (=> b!648669 m!622019))

(declare-fun m!622021 () Bool)

(assert (=> b!648669 m!622021))

(declare-fun m!622023 () Bool)

(assert (=> b!648669 m!622023))

(declare-fun m!622025 () Bool)

(assert (=> b!648663 m!622025))

(declare-fun m!622027 () Bool)

(assert (=> b!648657 m!622027))

(declare-fun m!622029 () Bool)

(assert (=> b!648657 m!622029))

(assert (=> b!648657 m!621991))

(assert (=> b!648657 m!622007))

(assert (=> b!648657 m!621991))

(declare-fun m!622031 () Bool)

(assert (=> b!648657 m!622031))

(declare-fun m!622033 () Bool)

(assert (=> b!648657 m!622033))

(declare-fun m!622035 () Bool)

(assert (=> b!648657 m!622035))

(declare-fun m!622037 () Bool)

(assert (=> b!648657 m!622037))

(declare-fun m!622039 () Bool)

(assert (=> b!648660 m!622039))

(assert (=> b!648673 m!621991))

(assert (=> b!648673 m!621991))

(assert (=> b!648673 m!622001))

(declare-fun m!622041 () Bool)

(assert (=> b!648664 m!622041))

(declare-fun m!622043 () Bool)

(assert (=> b!648672 m!622043))

(declare-fun m!622045 () Bool)

(assert (=> start!58856 m!622045))

(declare-fun m!622047 () Bool)

(assert (=> start!58856 m!622047))

(declare-fun m!622049 () Bool)

(assert (=> b!648667 m!622049))

(assert (=> b!648667 m!621991))

(assert (=> b!648667 m!621991))

(declare-fun m!622051 () Bool)

(assert (=> b!648667 m!622051))

(assert (=> b!648658 m!621991))

(assert (=> b!648658 m!622007))

(declare-fun m!622053 () Bool)

(assert (=> b!648658 m!622053))

(assert (=> b!648653 m!621991))

(assert (=> b!648653 m!621991))

(declare-fun m!622055 () Bool)

(assert (=> b!648653 m!622055))

(declare-fun m!622057 () Bool)

(assert (=> b!648649 m!622057))

(assert (=> b!648662 m!621991))

(assert (=> b!648662 m!621991))

(assert (=> b!648662 m!622055))

(declare-fun m!622059 () Bool)

(assert (=> b!648659 m!622059))

(push 1)

