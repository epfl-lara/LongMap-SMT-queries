; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59586 () Bool)

(assert start!59586)

(declare-fun b!658371 () Bool)

(declare-fun res!426948 () Bool)

(declare-fun e!378227 () Bool)

(assert (=> b!658371 (=> (not res!426948) (not e!378227))))

(declare-datatypes ((array!38744 0))(
  ( (array!38745 (arr!18569 (Array (_ BitVec 32) (_ BitVec 64))) (size!18933 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38744)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658371 (= res!426948 (validKeyInArray!0 (select (arr!18569 a!2986) j!136)))))

(declare-fun lt!307809 () array!38744)

(declare-fun b!658372 () Bool)

(declare-fun e!378221 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658372 (= e!378221 (arrayContainsKey!0 lt!307809 (select (arr!18569 a!2986) j!136) index!984))))

(declare-fun b!658373 () Bool)

(declare-fun e!378222 () Bool)

(declare-datatypes ((SeekEntryResult!7009 0))(
  ( (MissingZero!7009 (index!30401 (_ BitVec 32))) (Found!7009 (index!30402 (_ BitVec 32))) (Intermediate!7009 (undefined!7821 Bool) (index!30403 (_ BitVec 32)) (x!59188 (_ BitVec 32))) (Undefined!7009) (MissingVacant!7009 (index!30404 (_ BitVec 32))) )
))
(declare-fun lt!307812 () SeekEntryResult!7009)

(declare-fun lt!307810 () SeekEntryResult!7009)

(assert (=> b!658373 (= e!378222 (= lt!307812 lt!307810))))

(declare-fun b!658374 () Bool)

(declare-fun e!378225 () Bool)

(assert (=> b!658374 (= e!378227 e!378225)))

(declare-fun res!426950 () Bool)

(assert (=> b!658374 (=> (not res!426950) (not e!378225))))

(declare-fun lt!307814 () SeekEntryResult!7009)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658374 (= res!426950 (or (= lt!307814 (MissingZero!7009 i!1108)) (= lt!307814 (MissingVacant!7009 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38744 (_ BitVec 32)) SeekEntryResult!7009)

(assert (=> b!658374 (= lt!307814 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658375 () Bool)

(assert (=> b!658375 false))

(declare-datatypes ((Unit!22844 0))(
  ( (Unit!22845) )
))
(declare-fun lt!307815 () Unit!22844)

(declare-datatypes ((List!12610 0))(
  ( (Nil!12607) (Cons!12606 (h!13651 (_ BitVec 64)) (t!18838 List!12610)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38744 (_ BitVec 64) (_ BitVec 32) List!12610) Unit!22844)

(assert (=> b!658375 (= lt!307815 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307809 (select (arr!18569 a!2986) j!136) index!984 Nil!12607))))

(declare-fun arrayNoDuplicates!0 (array!38744 (_ BitVec 32) List!12610) Bool)

(assert (=> b!658375 (arrayNoDuplicates!0 lt!307809 index!984 Nil!12607)))

(declare-fun lt!307822 () Unit!22844)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38744 (_ BitVec 32) (_ BitVec 32)) Unit!22844)

(assert (=> b!658375 (= lt!307822 (lemmaNoDuplicateFromThenFromBigger!0 lt!307809 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658375 (arrayNoDuplicates!0 lt!307809 #b00000000000000000000000000000000 Nil!12607)))

(declare-fun lt!307826 () Unit!22844)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38744 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12610) Unit!22844)

(assert (=> b!658375 (= lt!307826 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12607))))

(assert (=> b!658375 (arrayContainsKey!0 lt!307809 (select (arr!18569 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307821 () Unit!22844)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38744 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22844)

(assert (=> b!658375 (= lt!307821 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307809 (select (arr!18569 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378224 () Bool)

(assert (=> b!658375 e!378224))

(declare-fun res!426947 () Bool)

(assert (=> b!658375 (=> (not res!426947) (not e!378224))))

(assert (=> b!658375 (= res!426947 (arrayContainsKey!0 lt!307809 (select (arr!18569 a!2986) j!136) j!136))))

(declare-fun e!378228 () Unit!22844)

(declare-fun Unit!22846 () Unit!22844)

(assert (=> b!658375 (= e!378228 Unit!22846)))

(declare-fun b!658376 () Bool)

(declare-fun res!426959 () Bool)

(assert (=> b!658376 (= res!426959 (bvsge j!136 index!984))))

(declare-fun e!378216 () Bool)

(assert (=> b!658376 (=> res!426959 e!378216)))

(declare-fun e!378217 () Bool)

(assert (=> b!658376 (= e!378217 e!378216)))

(declare-fun res!426949 () Bool)

(declare-fun b!658377 () Bool)

(assert (=> b!658377 (= res!426949 (arrayContainsKey!0 lt!307809 (select (arr!18569 a!2986) j!136) j!136))))

(assert (=> b!658377 (=> (not res!426949) (not e!378221))))

(assert (=> b!658377 (= e!378216 e!378221)))

(declare-fun b!658378 () Bool)

(assert (=> b!658378 (= e!378224 (arrayContainsKey!0 lt!307809 (select (arr!18569 a!2986) j!136) index!984))))

(declare-fun b!658379 () Bool)

(declare-fun res!426955 () Bool)

(assert (=> b!658379 (=> (not res!426955) (not e!378227))))

(assert (=> b!658379 (= res!426955 (and (= (size!18933 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18933 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18933 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658380 () Bool)

(declare-fun e!378226 () Unit!22844)

(declare-fun Unit!22847 () Unit!22844)

(assert (=> b!658380 (= e!378226 Unit!22847)))

(declare-fun b!658381 () Bool)

(declare-fun e!378218 () Unit!22844)

(declare-fun Unit!22848 () Unit!22844)

(assert (=> b!658381 (= e!378218 Unit!22848)))

(declare-fun b!658382 () Bool)

(declare-fun res!426953 () Bool)

(assert (=> b!658382 (=> (not res!426953) (not e!378225))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!658382 (= res!426953 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18569 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658383 () Bool)

(declare-fun Unit!22849 () Unit!22844)

(assert (=> b!658383 (= e!378226 Unit!22849)))

(declare-fun res!426960 () Bool)

(assert (=> b!658383 (= res!426960 (= (select (store (arr!18569 a!2986) i!1108 k!1786) index!984) (select (arr!18569 a!2986) j!136)))))

(assert (=> b!658383 (=> (not res!426960) (not e!378217))))

(assert (=> b!658383 e!378217))

(declare-fun c!76081 () Bool)

(assert (=> b!658383 (= c!76081 (bvslt j!136 index!984))))

(declare-fun lt!307819 () Unit!22844)

(declare-fun e!378220 () Unit!22844)

(assert (=> b!658383 (= lt!307819 e!378220)))

(declare-fun c!76082 () Bool)

(assert (=> b!658383 (= c!76082 (bvslt index!984 j!136))))

(declare-fun lt!307818 () Unit!22844)

(assert (=> b!658383 (= lt!307818 e!378228)))

(assert (=> b!658383 false))

(declare-fun b!658384 () Bool)

(declare-fun res!426957 () Bool)

(assert (=> b!658384 (=> (not res!426957) (not e!378227))))

(assert (=> b!658384 (= res!426957 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658385 () Bool)

(declare-fun Unit!22850 () Unit!22844)

(assert (=> b!658385 (= e!378220 Unit!22850)))

(declare-fun b!658386 () Bool)

(assert (=> b!658386 false))

(declare-fun lt!307820 () Unit!22844)

(assert (=> b!658386 (= lt!307820 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307809 (select (arr!18569 a!2986) j!136) j!136 Nil!12607))))

(assert (=> b!658386 (arrayNoDuplicates!0 lt!307809 j!136 Nil!12607)))

(declare-fun lt!307811 () Unit!22844)

(assert (=> b!658386 (= lt!307811 (lemmaNoDuplicateFromThenFromBigger!0 lt!307809 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658386 (arrayNoDuplicates!0 lt!307809 #b00000000000000000000000000000000 Nil!12607)))

(declare-fun lt!307828 () Unit!22844)

(assert (=> b!658386 (= lt!307828 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12607))))

(assert (=> b!658386 (arrayContainsKey!0 lt!307809 (select (arr!18569 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307827 () Unit!22844)

(assert (=> b!658386 (= lt!307827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307809 (select (arr!18569 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22851 () Unit!22844)

(assert (=> b!658386 (= e!378220 Unit!22851)))

(declare-fun b!658387 () Bool)

(declare-fun e!378223 () Bool)

(declare-fun e!378219 () Bool)

(assert (=> b!658387 (= e!378223 e!378219)))

(declare-fun res!426958 () Bool)

(assert (=> b!658387 (=> (not res!426958) (not e!378219))))

(assert (=> b!658387 (= res!426958 (and (= lt!307812 (Found!7009 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18569 a!2986) index!984) (select (arr!18569 a!2986) j!136))) (not (= (select (arr!18569 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38744 (_ BitVec 32)) SeekEntryResult!7009)

(assert (=> b!658387 (= lt!307812 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18569 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658388 () Bool)

(declare-fun Unit!22852 () Unit!22844)

(assert (=> b!658388 (= e!378228 Unit!22852)))

(declare-fun b!658389 () Bool)

(declare-fun Unit!22853 () Unit!22844)

(assert (=> b!658389 (= e!378218 Unit!22853)))

(assert (=> b!658389 false))

(declare-fun b!658390 () Bool)

(declare-fun res!426956 () Bool)

(assert (=> b!658390 (=> (not res!426956) (not e!378225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38744 (_ BitVec 32)) Bool)

(assert (=> b!658390 (= res!426956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658391 () Bool)

(declare-fun res!426952 () Bool)

(assert (=> b!658391 (=> (not res!426952) (not e!378227))))

(assert (=> b!658391 (= res!426952 (validKeyInArray!0 k!1786))))

(declare-fun b!658392 () Bool)

(declare-fun res!426951 () Bool)

(assert (=> b!658392 (=> (not res!426951) (not e!378225))))

(assert (=> b!658392 (= res!426951 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12607))))

(declare-fun res!426961 () Bool)

(assert (=> start!59586 (=> (not res!426961) (not e!378227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59586 (= res!426961 (validMask!0 mask!3053))))

(assert (=> start!59586 e!378227))

(assert (=> start!59586 true))

(declare-fun array_inv!14365 (array!38744) Bool)

(assert (=> start!59586 (array_inv!14365 a!2986)))

(declare-fun b!658393 () Bool)

(assert (=> b!658393 (= e!378219 (not true))))

(declare-fun lt!307816 () Unit!22844)

(assert (=> b!658393 (= lt!307816 e!378226)))

(declare-fun c!76080 () Bool)

(declare-fun lt!307823 () SeekEntryResult!7009)

(assert (=> b!658393 (= c!76080 (= lt!307823 (Found!7009 index!984)))))

(declare-fun lt!307825 () Unit!22844)

(assert (=> b!658393 (= lt!307825 e!378218)))

(declare-fun c!76079 () Bool)

(assert (=> b!658393 (= c!76079 (= lt!307823 Undefined!7009))))

(declare-fun lt!307813 () (_ BitVec 64))

(assert (=> b!658393 (= lt!307823 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307813 lt!307809 mask!3053))))

(assert (=> b!658393 e!378222))

(declare-fun res!426954 () Bool)

(assert (=> b!658393 (=> (not res!426954) (not e!378222))))

(declare-fun lt!307817 () (_ BitVec 32))

(assert (=> b!658393 (= res!426954 (= lt!307810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307817 vacantSpotIndex!68 lt!307813 lt!307809 mask!3053)))))

(assert (=> b!658393 (= lt!307810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307817 vacantSpotIndex!68 (select (arr!18569 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658393 (= lt!307813 (select (store (arr!18569 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307824 () Unit!22844)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38744 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22844)

(assert (=> b!658393 (= lt!307824 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307817 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658393 (= lt!307817 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658394 () Bool)

(assert (=> b!658394 (= e!378225 e!378223)))

(declare-fun res!426962 () Bool)

(assert (=> b!658394 (=> (not res!426962) (not e!378223))))

(assert (=> b!658394 (= res!426962 (= (select (store (arr!18569 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658394 (= lt!307809 (array!38745 (store (arr!18569 a!2986) i!1108 k!1786) (size!18933 a!2986)))))

(assert (= (and start!59586 res!426961) b!658379))

(assert (= (and b!658379 res!426955) b!658371))

(assert (= (and b!658371 res!426948) b!658391))

(assert (= (and b!658391 res!426952) b!658384))

(assert (= (and b!658384 res!426957) b!658374))

(assert (= (and b!658374 res!426950) b!658390))

(assert (= (and b!658390 res!426956) b!658392))

(assert (= (and b!658392 res!426951) b!658382))

(assert (= (and b!658382 res!426953) b!658394))

(assert (= (and b!658394 res!426962) b!658387))

(assert (= (and b!658387 res!426958) b!658393))

(assert (= (and b!658393 res!426954) b!658373))

(assert (= (and b!658393 c!76079) b!658389))

(assert (= (and b!658393 (not c!76079)) b!658381))

(assert (= (and b!658393 c!76080) b!658383))

(assert (= (and b!658393 (not c!76080)) b!658380))

(assert (= (and b!658383 res!426960) b!658376))

(assert (= (and b!658376 (not res!426959)) b!658377))

(assert (= (and b!658377 res!426949) b!658372))

(assert (= (and b!658383 c!76081) b!658386))

(assert (= (and b!658383 (not c!76081)) b!658385))

(assert (= (and b!658383 c!76082) b!658375))

(assert (= (and b!658383 (not c!76082)) b!658388))

(assert (= (and b!658375 res!426947) b!658378))

(declare-fun m!631357 () Bool)

(assert (=> b!658377 m!631357))

(assert (=> b!658377 m!631357))

(declare-fun m!631359 () Bool)

(assert (=> b!658377 m!631359))

(declare-fun m!631361 () Bool)

(assert (=> b!658387 m!631361))

(assert (=> b!658387 m!631357))

(assert (=> b!658387 m!631357))

(declare-fun m!631363 () Bool)

(assert (=> b!658387 m!631363))

(assert (=> b!658371 m!631357))

(assert (=> b!658371 m!631357))

(declare-fun m!631365 () Bool)

(assert (=> b!658371 m!631365))

(declare-fun m!631367 () Bool)

(assert (=> b!658384 m!631367))

(assert (=> b!658386 m!631357))

(declare-fun m!631369 () Bool)

(assert (=> b!658386 m!631369))

(declare-fun m!631371 () Bool)

(assert (=> b!658386 m!631371))

(assert (=> b!658386 m!631357))

(declare-fun m!631373 () Bool)

(assert (=> b!658386 m!631373))

(declare-fun m!631375 () Bool)

(assert (=> b!658386 m!631375))

(assert (=> b!658386 m!631357))

(declare-fun m!631377 () Bool)

(assert (=> b!658386 m!631377))

(assert (=> b!658386 m!631357))

(declare-fun m!631379 () Bool)

(assert (=> b!658386 m!631379))

(declare-fun m!631381 () Bool)

(assert (=> b!658386 m!631381))

(declare-fun m!631383 () Bool)

(assert (=> b!658392 m!631383))

(assert (=> b!658375 m!631373))

(assert (=> b!658375 m!631357))

(declare-fun m!631385 () Bool)

(assert (=> b!658375 m!631385))

(assert (=> b!658375 m!631357))

(declare-fun m!631387 () Bool)

(assert (=> b!658375 m!631387))

(assert (=> b!658375 m!631357))

(assert (=> b!658375 m!631359))

(assert (=> b!658375 m!631357))

(declare-fun m!631389 () Bool)

(assert (=> b!658375 m!631389))

(declare-fun m!631391 () Bool)

(assert (=> b!658375 m!631391))

(assert (=> b!658375 m!631357))

(declare-fun m!631393 () Bool)

(assert (=> b!658375 m!631393))

(assert (=> b!658375 m!631381))

(assert (=> b!658378 m!631357))

(assert (=> b!658378 m!631357))

(declare-fun m!631395 () Bool)

(assert (=> b!658378 m!631395))

(declare-fun m!631397 () Bool)

(assert (=> b!658383 m!631397))

(declare-fun m!631399 () Bool)

(assert (=> b!658383 m!631399))

(assert (=> b!658383 m!631357))

(declare-fun m!631401 () Bool)

(assert (=> start!59586 m!631401))

(declare-fun m!631403 () Bool)

(assert (=> start!59586 m!631403))

(declare-fun m!631405 () Bool)

(assert (=> b!658382 m!631405))

(declare-fun m!631407 () Bool)

(assert (=> b!658374 m!631407))

(declare-fun m!631409 () Bool)

(assert (=> b!658390 m!631409))

(declare-fun m!631411 () Bool)

(assert (=> b!658393 m!631411))

(assert (=> b!658393 m!631357))

(declare-fun m!631413 () Bool)

(assert (=> b!658393 m!631413))

(assert (=> b!658393 m!631397))

(declare-fun m!631415 () Bool)

(assert (=> b!658393 m!631415))

(assert (=> b!658393 m!631357))

(declare-fun m!631417 () Bool)

(assert (=> b!658393 m!631417))

(declare-fun m!631419 () Bool)

(assert (=> b!658393 m!631419))

(declare-fun m!631421 () Bool)

(assert (=> b!658393 m!631421))

(declare-fun m!631423 () Bool)

(assert (=> b!658391 m!631423))

(assert (=> b!658372 m!631357))

(assert (=> b!658372 m!631357))

(assert (=> b!658372 m!631395))

(assert (=> b!658394 m!631397))

(declare-fun m!631425 () Bool)

(assert (=> b!658394 m!631425))

(push 1)

