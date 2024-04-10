; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55922 () Bool)

(assert start!55922)

(declare-fun b!612400 () Bool)

(declare-fun e!351013 () Bool)

(assert (=> b!612400 (= e!351013 true)))

(declare-datatypes ((array!37392 0))(
  ( (array!37393 (arr!17942 (Array (_ BitVec 32) (_ BitVec 64))) (size!18306 (_ BitVec 32))) )
))
(declare-fun lt!280402 () array!37392)

(declare-datatypes ((List!11983 0))(
  ( (Nil!11980) (Cons!11979 (h!13024 (_ BitVec 64)) (t!18211 List!11983)) )
))
(declare-fun arrayNoDuplicates!0 (array!37392 (_ BitVec 32) List!11983) Bool)

(assert (=> b!612400 (arrayNoDuplicates!0 lt!280402 #b00000000000000000000000000000000 Nil!11980)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun a!2986 () array!37392)

(declare-datatypes ((Unit!19672 0))(
  ( (Unit!19673) )
))
(declare-fun lt!280393 () Unit!19672)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11983) Unit!19672)

(assert (=> b!612400 (= lt!280393 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11980))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612400 (arrayContainsKey!0 lt!280402 (select (arr!17942 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280401 () Unit!19672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19672)

(assert (=> b!612400 (= lt!280401 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280402 (select (arr!17942 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351011 () Bool)

(assert (=> b!612400 e!351011))

(declare-fun res!393986 () Bool)

(assert (=> b!612400 (=> (not res!393986) (not e!351011))))

(assert (=> b!612400 (= res!393986 (arrayContainsKey!0 lt!280402 (select (arr!17942 a!2986) j!136) j!136))))

(declare-fun b!612401 () Bool)

(assert (=> b!612401 (= e!351011 (arrayContainsKey!0 lt!280402 (select (arr!17942 a!2986) j!136) index!984))))

(declare-fun b!612403 () Bool)

(declare-fun res!393989 () Bool)

(declare-fun e!351016 () Bool)

(assert (=> b!612403 (=> (not res!393989) (not e!351016))))

(assert (=> b!612403 (= res!393989 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11980))))

(declare-fun b!612404 () Bool)

(declare-fun e!351014 () Bool)

(assert (=> b!612404 (= e!351014 e!351016)))

(declare-fun res!393990 () Bool)

(assert (=> b!612404 (=> (not res!393990) (not e!351016))))

(declare-datatypes ((SeekEntryResult!6382 0))(
  ( (MissingZero!6382 (index!27812 (_ BitVec 32))) (Found!6382 (index!27813 (_ BitVec 32))) (Intermediate!6382 (undefined!7194 Bool) (index!27814 (_ BitVec 32)) (x!56622 (_ BitVec 32))) (Undefined!6382) (MissingVacant!6382 (index!27815 (_ BitVec 32))) )
))
(declare-fun lt!280396 () SeekEntryResult!6382)

(assert (=> b!612404 (= res!393990 (or (= lt!280396 (MissingZero!6382 i!1108)) (= lt!280396 (MissingVacant!6382 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37392 (_ BitVec 32)) SeekEntryResult!6382)

(assert (=> b!612404 (= lt!280396 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!612405 () Bool)

(declare-fun e!351018 () Bool)

(declare-fun e!351022 () Bool)

(assert (=> b!612405 (= e!351018 (not e!351022))))

(declare-fun res!393976 () Bool)

(assert (=> b!612405 (=> res!393976 e!351022)))

(declare-fun lt!280399 () SeekEntryResult!6382)

(assert (=> b!612405 (= res!393976 (not (= lt!280399 (Found!6382 index!984))))))

(declare-fun lt!280395 () Unit!19672)

(declare-fun e!351015 () Unit!19672)

(assert (=> b!612405 (= lt!280395 e!351015)))

(declare-fun c!69581 () Bool)

(assert (=> b!612405 (= c!69581 (= lt!280399 Undefined!6382))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280391 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37392 (_ BitVec 32)) SeekEntryResult!6382)

(assert (=> b!612405 (= lt!280399 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280391 lt!280402 mask!3053))))

(declare-fun e!351019 () Bool)

(assert (=> b!612405 e!351019))

(declare-fun res!393992 () Bool)

(assert (=> b!612405 (=> (not res!393992) (not e!351019))))

(declare-fun lt!280397 () SeekEntryResult!6382)

(declare-fun lt!280389 () (_ BitVec 32))

(assert (=> b!612405 (= res!393992 (= lt!280397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280389 vacantSpotIndex!68 lt!280391 lt!280402 mask!3053)))))

(assert (=> b!612405 (= lt!280397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280389 vacantSpotIndex!68 (select (arr!17942 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612405 (= lt!280391 (select (store (arr!17942 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280404 () Unit!19672)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37392 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19672)

(assert (=> b!612405 (= lt!280404 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280389 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612405 (= lt!280389 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612406 () Bool)

(declare-fun e!351010 () Bool)

(assert (=> b!612406 (= e!351016 e!351010)))

(declare-fun res!393979 () Bool)

(assert (=> b!612406 (=> (not res!393979) (not e!351010))))

(assert (=> b!612406 (= res!393979 (= (select (store (arr!17942 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612406 (= lt!280402 (array!37393 (store (arr!17942 a!2986) i!1108 k!1786) (size!18306 a!2986)))))

(declare-fun b!612407 () Bool)

(declare-fun Unit!19674 () Unit!19672)

(assert (=> b!612407 (= e!351015 Unit!19674)))

(assert (=> b!612407 false))

(declare-fun b!612408 () Bool)

(assert (=> b!612408 (= e!351010 e!351018)))

(declare-fun res!393991 () Bool)

(assert (=> b!612408 (=> (not res!393991) (not e!351018))))

(declare-fun lt!280394 () SeekEntryResult!6382)

(assert (=> b!612408 (= res!393991 (and (= lt!280394 (Found!6382 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17942 a!2986) index!984) (select (arr!17942 a!2986) j!136))) (not (= (select (arr!17942 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612408 (= lt!280394 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17942 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612409 () Bool)

(declare-fun res!393983 () Bool)

(assert (=> b!612409 (=> (not res!393983) (not e!351014))))

(assert (=> b!612409 (= res!393983 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612410 () Bool)

(declare-fun e!351023 () Bool)

(assert (=> b!612410 (= e!351023 (arrayContainsKey!0 lt!280402 (select (arr!17942 a!2986) j!136) index!984))))

(declare-fun b!612411 () Bool)

(declare-fun Unit!19675 () Unit!19672)

(assert (=> b!612411 (= e!351015 Unit!19675)))

(declare-fun b!612412 () Bool)

(declare-fun e!351012 () Bool)

(declare-fun e!351020 () Bool)

(assert (=> b!612412 (= e!351012 e!351020)))

(declare-fun res!393981 () Bool)

(assert (=> b!612412 (=> res!393981 e!351020)))

(declare-fun lt!280398 () (_ BitVec 64))

(assert (=> b!612412 (= res!393981 (or (not (= (select (arr!17942 a!2986) j!136) lt!280391)) (not (= (select (arr!17942 a!2986) j!136) lt!280398)) (bvsge j!136 index!984)))))

(declare-fun b!612413 () Bool)

(declare-fun e!351021 () Bool)

(assert (=> b!612413 (= e!351021 e!351013)))

(declare-fun res!393984 () Bool)

(assert (=> b!612413 (=> res!393984 e!351013)))

(assert (=> b!612413 (= res!393984 (bvsge index!984 j!136))))

(declare-fun lt!280400 () Unit!19672)

(declare-fun e!351024 () Unit!19672)

(assert (=> b!612413 (= lt!280400 e!351024)))

(declare-fun c!69580 () Bool)

(assert (=> b!612413 (= c!69580 (bvslt j!136 index!984))))

(declare-fun b!612414 () Bool)

(declare-fun res!393988 () Bool)

(assert (=> b!612414 (=> (not res!393988) (not e!351014))))

(assert (=> b!612414 (= res!393988 (and (= (size!18306 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18306 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18306 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612402 () Bool)

(assert (=> b!612402 (= e!351022 e!351021)))

(declare-fun res!393974 () Bool)

(assert (=> b!612402 (=> res!393974 e!351021)))

(assert (=> b!612402 (= res!393974 (or (not (= (select (arr!17942 a!2986) j!136) lt!280391)) (not (= (select (arr!17942 a!2986) j!136) lt!280398))))))

(assert (=> b!612402 e!351012))

(declare-fun res!393978 () Bool)

(assert (=> b!612402 (=> (not res!393978) (not e!351012))))

(assert (=> b!612402 (= res!393978 (= lt!280398 (select (arr!17942 a!2986) j!136)))))

(assert (=> b!612402 (= lt!280398 (select (store (arr!17942 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!393985 () Bool)

(assert (=> start!55922 (=> (not res!393985) (not e!351014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55922 (= res!393985 (validMask!0 mask!3053))))

(assert (=> start!55922 e!351014))

(assert (=> start!55922 true))

(declare-fun array_inv!13738 (array!37392) Bool)

(assert (=> start!55922 (array_inv!13738 a!2986)))

(declare-fun b!612415 () Bool)

(declare-fun res!393975 () Bool)

(assert (=> b!612415 (=> (not res!393975) (not e!351016))))

(assert (=> b!612415 (= res!393975 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17942 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612416 () Bool)

(declare-fun res!393980 () Bool)

(assert (=> b!612416 (=> (not res!393980) (not e!351014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612416 (= res!393980 (validKeyInArray!0 k!1786))))

(declare-fun b!612417 () Bool)

(declare-fun res!393987 () Bool)

(assert (=> b!612417 (=> (not res!393987) (not e!351016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37392 (_ BitVec 32)) Bool)

(assert (=> b!612417 (= res!393987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612418 () Bool)

(declare-fun Unit!19676 () Unit!19672)

(assert (=> b!612418 (= e!351024 Unit!19676)))

(declare-fun lt!280405 () Unit!19672)

(assert (=> b!612418 (= lt!280405 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280402 (select (arr!17942 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612418 (arrayContainsKey!0 lt!280402 (select (arr!17942 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280390 () Unit!19672)

(assert (=> b!612418 (= lt!280390 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11980))))

(assert (=> b!612418 (arrayNoDuplicates!0 lt!280402 #b00000000000000000000000000000000 Nil!11980)))

(declare-fun lt!280392 () Unit!19672)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37392 (_ BitVec 32) (_ BitVec 32)) Unit!19672)

(assert (=> b!612418 (= lt!280392 (lemmaNoDuplicateFromThenFromBigger!0 lt!280402 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612418 (arrayNoDuplicates!0 lt!280402 j!136 Nil!11980)))

(declare-fun lt!280403 () Unit!19672)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37392 (_ BitVec 64) (_ BitVec 32) List!11983) Unit!19672)

(assert (=> b!612418 (= lt!280403 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280402 (select (arr!17942 a!2986) j!136) j!136 Nil!11980))))

(assert (=> b!612418 false))

(declare-fun b!612419 () Bool)

(declare-fun res!393977 () Bool)

(assert (=> b!612419 (=> (not res!393977) (not e!351014))))

(assert (=> b!612419 (= res!393977 (validKeyInArray!0 (select (arr!17942 a!2986) j!136)))))

(declare-fun b!612420 () Bool)

(declare-fun Unit!19677 () Unit!19672)

(assert (=> b!612420 (= e!351024 Unit!19677)))

(declare-fun b!612421 () Bool)

(assert (=> b!612421 (= e!351020 e!351023)))

(declare-fun res!393982 () Bool)

(assert (=> b!612421 (=> (not res!393982) (not e!351023))))

(assert (=> b!612421 (= res!393982 (arrayContainsKey!0 lt!280402 (select (arr!17942 a!2986) j!136) j!136))))

(declare-fun b!612422 () Bool)

(assert (=> b!612422 (= e!351019 (= lt!280394 lt!280397))))

(assert (= (and start!55922 res!393985) b!612414))

(assert (= (and b!612414 res!393988) b!612419))

(assert (= (and b!612419 res!393977) b!612416))

(assert (= (and b!612416 res!393980) b!612409))

(assert (= (and b!612409 res!393983) b!612404))

(assert (= (and b!612404 res!393990) b!612417))

(assert (= (and b!612417 res!393987) b!612403))

(assert (= (and b!612403 res!393989) b!612415))

(assert (= (and b!612415 res!393975) b!612406))

(assert (= (and b!612406 res!393979) b!612408))

(assert (= (and b!612408 res!393991) b!612405))

(assert (= (and b!612405 res!393992) b!612422))

(assert (= (and b!612405 c!69581) b!612407))

(assert (= (and b!612405 (not c!69581)) b!612411))

(assert (= (and b!612405 (not res!393976)) b!612402))

(assert (= (and b!612402 res!393978) b!612412))

(assert (= (and b!612412 (not res!393981)) b!612421))

(assert (= (and b!612421 res!393982) b!612410))

(assert (= (and b!612402 (not res!393974)) b!612413))

(assert (= (and b!612413 c!69580) b!612418))

(assert (= (and b!612413 (not c!69580)) b!612420))

(assert (= (and b!612413 (not res!393984)) b!612400))

(assert (= (and b!612400 res!393986) b!612401))

(declare-fun m!588751 () Bool)

(assert (=> b!612400 m!588751))

(assert (=> b!612400 m!588751))

(declare-fun m!588753 () Bool)

(assert (=> b!612400 m!588753))

(declare-fun m!588755 () Bool)

(assert (=> b!612400 m!588755))

(assert (=> b!612400 m!588751))

(declare-fun m!588757 () Bool)

(assert (=> b!612400 m!588757))

(assert (=> b!612400 m!588751))

(declare-fun m!588759 () Bool)

(assert (=> b!612400 m!588759))

(declare-fun m!588761 () Bool)

(assert (=> b!612400 m!588761))

(assert (=> b!612418 m!588751))

(declare-fun m!588763 () Bool)

(assert (=> b!612418 m!588763))

(assert (=> b!612418 m!588751))

(declare-fun m!588765 () Bool)

(assert (=> b!612418 m!588765))

(declare-fun m!588767 () Bool)

(assert (=> b!612418 m!588767))

(assert (=> b!612418 m!588755))

(assert (=> b!612418 m!588761))

(assert (=> b!612418 m!588751))

(declare-fun m!588769 () Bool)

(assert (=> b!612418 m!588769))

(assert (=> b!612418 m!588751))

(declare-fun m!588771 () Bool)

(assert (=> b!612418 m!588771))

(assert (=> b!612412 m!588751))

(declare-fun m!588773 () Bool)

(assert (=> b!612409 m!588773))

(assert (=> b!612410 m!588751))

(assert (=> b!612410 m!588751))

(declare-fun m!588775 () Bool)

(assert (=> b!612410 m!588775))

(declare-fun m!588777 () Bool)

(assert (=> b!612417 m!588777))

(declare-fun m!588779 () Bool)

(assert (=> start!55922 m!588779))

(declare-fun m!588781 () Bool)

(assert (=> start!55922 m!588781))

(assert (=> b!612402 m!588751))

(declare-fun m!588783 () Bool)

(assert (=> b!612402 m!588783))

(declare-fun m!588785 () Bool)

(assert (=> b!612402 m!588785))

(assert (=> b!612421 m!588751))

(assert (=> b!612421 m!588751))

(assert (=> b!612421 m!588759))

(declare-fun m!588787 () Bool)

(assert (=> b!612405 m!588787))

(assert (=> b!612405 m!588751))

(declare-fun m!588789 () Bool)

(assert (=> b!612405 m!588789))

(assert (=> b!612405 m!588783))

(declare-fun m!588791 () Bool)

(assert (=> b!612405 m!588791))

(assert (=> b!612405 m!588751))

(declare-fun m!588793 () Bool)

(assert (=> b!612405 m!588793))

(declare-fun m!588795 () Bool)

(assert (=> b!612405 m!588795))

(declare-fun m!588797 () Bool)

(assert (=> b!612405 m!588797))

(assert (=> b!612406 m!588783))

(declare-fun m!588799 () Bool)

(assert (=> b!612406 m!588799))

(assert (=> b!612419 m!588751))

(assert (=> b!612419 m!588751))

(declare-fun m!588801 () Bool)

(assert (=> b!612419 m!588801))

(declare-fun m!588803 () Bool)

(assert (=> b!612403 m!588803))

(assert (=> b!612401 m!588751))

(assert (=> b!612401 m!588751))

(assert (=> b!612401 m!588775))

(declare-fun m!588805 () Bool)

(assert (=> b!612408 m!588805))

(assert (=> b!612408 m!588751))

(assert (=> b!612408 m!588751))

(declare-fun m!588807 () Bool)

(assert (=> b!612408 m!588807))

(declare-fun m!588809 () Bool)

(assert (=> b!612415 m!588809))

(declare-fun m!588811 () Bool)

(assert (=> b!612416 m!588811))

(declare-fun m!588813 () Bool)

(assert (=> b!612404 m!588813))

(push 1)

