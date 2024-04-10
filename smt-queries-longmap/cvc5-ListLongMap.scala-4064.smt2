; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55612 () Bool)

(assert start!55612)

(declare-fun res!392379 () Bool)

(declare-fun e!349350 () Bool)

(assert (=> start!55612 (=> (not res!392379) (not e!349350))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55612 (= res!392379 (validMask!0 mask!3053))))

(assert (=> start!55612 e!349350))

(assert (=> start!55612 true))

(declare-datatypes ((array!37343 0))(
  ( (array!37344 (arr!17922 (Array (_ BitVec 32) (_ BitVec 64))) (size!18286 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37343)

(declare-fun array_inv!13718 (array!37343) Bool)

(assert (=> start!55612 (array_inv!13718 a!2986)))

(declare-fun b!609925 () Bool)

(declare-fun e!349351 () Bool)

(declare-fun e!349352 () Bool)

(assert (=> b!609925 (= e!349351 e!349352)))

(declare-fun res!392386 () Bool)

(assert (=> b!609925 (=> res!392386 e!349352)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!609925 (= res!392386 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19552 0))(
  ( (Unit!19553) )
))
(declare-fun lt!278917 () Unit!19552)

(declare-fun e!349339 () Unit!19552)

(assert (=> b!609925 (= lt!278917 e!349339)))

(declare-fun c!69145 () Bool)

(assert (=> b!609925 (= c!69145 (bvslt j!136 index!984))))

(declare-fun b!609926 () Bool)

(declare-fun Unit!19554 () Unit!19552)

(assert (=> b!609926 (= e!349339 Unit!19554)))

(declare-fun lt!278916 () Unit!19552)

(declare-fun lt!278923 () array!37343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19552)

(assert (=> b!609926 (= lt!278916 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278923 (select (arr!17922 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609926 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!278920 () Unit!19552)

(declare-datatypes ((List!11963 0))(
  ( (Nil!11960) (Cons!11959 (h!13004 (_ BitVec 64)) (t!18191 List!11963)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11963) Unit!19552)

(assert (=> b!609926 (= lt!278920 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11960))))

(declare-fun arrayNoDuplicates!0 (array!37343 (_ BitVec 32) List!11963) Bool)

(assert (=> b!609926 (arrayNoDuplicates!0 lt!278923 #b00000000000000000000000000000000 Nil!11960)))

(declare-fun lt!278919 () Unit!19552)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37343 (_ BitVec 32) (_ BitVec 32)) Unit!19552)

(assert (=> b!609926 (= lt!278919 (lemmaNoDuplicateFromThenFromBigger!0 lt!278923 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609926 (arrayNoDuplicates!0 lt!278923 j!136 Nil!11960)))

(declare-fun lt!278929 () Unit!19552)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37343 (_ BitVec 64) (_ BitVec 32) List!11963) Unit!19552)

(assert (=> b!609926 (= lt!278929 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278923 (select (arr!17922 a!2986) j!136) j!136 Nil!11960))))

(assert (=> b!609926 false))

(declare-fun b!609927 () Bool)

(declare-fun e!349345 () Bool)

(declare-fun e!349347 () Bool)

(assert (=> b!609927 (= e!349345 e!349347)))

(declare-fun res!392382 () Bool)

(assert (=> b!609927 (=> (not res!392382) (not e!349347))))

(declare-datatypes ((SeekEntryResult!6362 0))(
  ( (MissingZero!6362 (index!27723 (_ BitVec 32))) (Found!6362 (index!27724 (_ BitVec 32))) (Intermediate!6362 (undefined!7174 Bool) (index!27725 (_ BitVec 32)) (x!56527 (_ BitVec 32))) (Undefined!6362) (MissingVacant!6362 (index!27726 (_ BitVec 32))) )
))
(declare-fun lt!278927 () SeekEntryResult!6362)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609927 (= res!392382 (and (= lt!278927 (Found!6362 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17922 a!2986) index!984) (select (arr!17922 a!2986) j!136))) (not (= (select (arr!17922 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37343 (_ BitVec 32)) SeekEntryResult!6362)

(assert (=> b!609927 (= lt!278927 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609928 () Bool)

(declare-fun e!349349 () Bool)

(assert (=> b!609928 (= e!349349 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) index!984))))

(declare-fun b!609929 () Bool)

(declare-fun e!349344 () Bool)

(declare-fun e!349343 () Bool)

(assert (=> b!609929 (= e!349344 e!349343)))

(declare-fun res!392374 () Bool)

(assert (=> b!609929 (=> res!392374 e!349343)))

(declare-fun lt!278922 () (_ BitVec 64))

(declare-fun lt!278924 () (_ BitVec 64))

(assert (=> b!609929 (= res!392374 (or (not (= (select (arr!17922 a!2986) j!136) lt!278924)) (not (= (select (arr!17922 a!2986) j!136) lt!278922)) (bvsge j!136 index!984)))))

(declare-fun b!609930 () Bool)

(declare-fun e!349342 () Bool)

(declare-fun lt!278918 () SeekEntryResult!6362)

(assert (=> b!609930 (= e!349342 (= lt!278927 lt!278918))))

(declare-fun b!609931 () Bool)

(declare-fun Unit!19555 () Unit!19552)

(assert (=> b!609931 (= e!349339 Unit!19555)))

(declare-fun b!609932 () Bool)

(declare-fun e!349346 () Bool)

(assert (=> b!609932 (= e!349347 (not e!349346))))

(declare-fun res!392375 () Bool)

(assert (=> b!609932 (=> res!392375 e!349346)))

(declare-fun lt!278926 () SeekEntryResult!6362)

(assert (=> b!609932 (= res!392375 (not (= lt!278926 (Found!6362 index!984))))))

(declare-fun lt!278928 () Unit!19552)

(declare-fun e!349341 () Unit!19552)

(assert (=> b!609932 (= lt!278928 e!349341)))

(declare-fun c!69146 () Bool)

(assert (=> b!609932 (= c!69146 (= lt!278926 Undefined!6362))))

(assert (=> b!609932 (= lt!278926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278924 lt!278923 mask!3053))))

(assert (=> b!609932 e!349342))

(declare-fun res!392385 () Bool)

(assert (=> b!609932 (=> (not res!392385) (not e!349342))))

(declare-fun lt!278930 () (_ BitVec 32))

(assert (=> b!609932 (= res!392385 (= lt!278918 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 lt!278924 lt!278923 mask!3053)))))

(assert (=> b!609932 (= lt!278918 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609932 (= lt!278924 (select (store (arr!17922 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278931 () Unit!19552)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37343 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19552)

(assert (=> b!609932 (= lt!278931 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609932 (= lt!278930 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609933 () Bool)

(declare-fun res!392376 () Bool)

(assert (=> b!609933 (=> (not res!392376) (not e!349350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609933 (= res!392376 (validKeyInArray!0 k!1786))))

(declare-fun b!609934 () Bool)

(declare-fun res!392384 () Bool)

(declare-fun e!349340 () Bool)

(assert (=> b!609934 (=> (not res!392384) (not e!349340))))

(assert (=> b!609934 (= res!392384 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17922 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609935 () Bool)

(declare-fun res!392383 () Bool)

(assert (=> b!609935 (=> (not res!392383) (not e!349350))))

(assert (=> b!609935 (= res!392383 (validKeyInArray!0 (select (arr!17922 a!2986) j!136)))))

(declare-fun b!609936 () Bool)

(assert (=> b!609936 (= e!349352 (or (bvsgt #b00000000000000000000000000000000 (size!18286 a!2986)) (bvslt (size!18286 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!609936 (arrayNoDuplicates!0 lt!278923 #b00000000000000000000000000000000 Nil!11960)))

(declare-fun lt!278925 () Unit!19552)

(assert (=> b!609936 (= lt!278925 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11960))))

(assert (=> b!609936 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278921 () Unit!19552)

(assert (=> b!609936 (= lt!278921 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278923 (select (arr!17922 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349353 () Bool)

(assert (=> b!609936 e!349353))

(declare-fun res!392373 () Bool)

(assert (=> b!609936 (=> (not res!392373) (not e!349353))))

(assert (=> b!609936 (= res!392373 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) j!136))))

(declare-fun b!609937 () Bool)

(declare-fun Unit!19556 () Unit!19552)

(assert (=> b!609937 (= e!349341 Unit!19556)))

(declare-fun b!609938 () Bool)

(assert (=> b!609938 (= e!349340 e!349345)))

(declare-fun res!392387 () Bool)

(assert (=> b!609938 (=> (not res!392387) (not e!349345))))

(assert (=> b!609938 (= res!392387 (= (select (store (arr!17922 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609938 (= lt!278923 (array!37344 (store (arr!17922 a!2986) i!1108 k!1786) (size!18286 a!2986)))))

(declare-fun b!609939 () Bool)

(assert (=> b!609939 (= e!349350 e!349340)))

(declare-fun res!392380 () Bool)

(assert (=> b!609939 (=> (not res!392380) (not e!349340))))

(declare-fun lt!278932 () SeekEntryResult!6362)

(assert (=> b!609939 (= res!392380 (or (= lt!278932 (MissingZero!6362 i!1108)) (= lt!278932 (MissingVacant!6362 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37343 (_ BitVec 32)) SeekEntryResult!6362)

(assert (=> b!609939 (= lt!278932 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609940 () Bool)

(declare-fun res!392381 () Bool)

(assert (=> b!609940 (=> (not res!392381) (not e!349350))))

(assert (=> b!609940 (= res!392381 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609941 () Bool)

(assert (=> b!609941 (= e!349346 e!349351)))

(declare-fun res!392372 () Bool)

(assert (=> b!609941 (=> res!392372 e!349351)))

(assert (=> b!609941 (= res!392372 (or (not (= (select (arr!17922 a!2986) j!136) lt!278924)) (not (= (select (arr!17922 a!2986) j!136) lt!278922))))))

(assert (=> b!609941 e!349344))

(declare-fun res!392370 () Bool)

(assert (=> b!609941 (=> (not res!392370) (not e!349344))))

(assert (=> b!609941 (= res!392370 (= lt!278922 (select (arr!17922 a!2986) j!136)))))

(assert (=> b!609941 (= lt!278922 (select (store (arr!17922 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609942 () Bool)

(declare-fun Unit!19557 () Unit!19552)

(assert (=> b!609942 (= e!349341 Unit!19557)))

(assert (=> b!609942 false))

(declare-fun b!609943 () Bool)

(assert (=> b!609943 (= e!349343 e!349349)))

(declare-fun res!392378 () Bool)

(assert (=> b!609943 (=> (not res!392378) (not e!349349))))

(assert (=> b!609943 (= res!392378 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) j!136))))

(declare-fun b!609944 () Bool)

(declare-fun res!392371 () Bool)

(assert (=> b!609944 (=> (not res!392371) (not e!349340))))

(assert (=> b!609944 (= res!392371 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11960))))

(declare-fun b!609945 () Bool)

(assert (=> b!609945 (= e!349353 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) index!984))))

(declare-fun b!609946 () Bool)

(declare-fun res!392369 () Bool)

(assert (=> b!609946 (=> (not res!392369) (not e!349350))))

(assert (=> b!609946 (= res!392369 (and (= (size!18286 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18286 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609947 () Bool)

(declare-fun res!392377 () Bool)

(assert (=> b!609947 (=> (not res!392377) (not e!349340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37343 (_ BitVec 32)) Bool)

(assert (=> b!609947 (= res!392377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55612 res!392379) b!609946))

(assert (= (and b!609946 res!392369) b!609935))

(assert (= (and b!609935 res!392383) b!609933))

(assert (= (and b!609933 res!392376) b!609940))

(assert (= (and b!609940 res!392381) b!609939))

(assert (= (and b!609939 res!392380) b!609947))

(assert (= (and b!609947 res!392377) b!609944))

(assert (= (and b!609944 res!392371) b!609934))

(assert (= (and b!609934 res!392384) b!609938))

(assert (= (and b!609938 res!392387) b!609927))

(assert (= (and b!609927 res!392382) b!609932))

(assert (= (and b!609932 res!392385) b!609930))

(assert (= (and b!609932 c!69146) b!609942))

(assert (= (and b!609932 (not c!69146)) b!609937))

(assert (= (and b!609932 (not res!392375)) b!609941))

(assert (= (and b!609941 res!392370) b!609929))

(assert (= (and b!609929 (not res!392374)) b!609943))

(assert (= (and b!609943 res!392378) b!609928))

(assert (= (and b!609941 (not res!392372)) b!609925))

(assert (= (and b!609925 c!69145) b!609926))

(assert (= (and b!609925 (not c!69145)) b!609931))

(assert (= (and b!609925 (not res!392386)) b!609936))

(assert (= (and b!609936 res!392373) b!609945))

(declare-fun m!586403 () Bool)

(assert (=> b!609927 m!586403))

(declare-fun m!586405 () Bool)

(assert (=> b!609927 m!586405))

(assert (=> b!609927 m!586405))

(declare-fun m!586407 () Bool)

(assert (=> b!609927 m!586407))

(declare-fun m!586409 () Bool)

(assert (=> b!609944 m!586409))

(assert (=> b!609928 m!586405))

(assert (=> b!609928 m!586405))

(declare-fun m!586411 () Bool)

(assert (=> b!609928 m!586411))

(declare-fun m!586413 () Bool)

(assert (=> b!609932 m!586413))

(declare-fun m!586415 () Bool)

(assert (=> b!609932 m!586415))

(declare-fun m!586417 () Bool)

(assert (=> b!609932 m!586417))

(declare-fun m!586419 () Bool)

(assert (=> b!609932 m!586419))

(declare-fun m!586421 () Bool)

(assert (=> b!609932 m!586421))

(declare-fun m!586423 () Bool)

(assert (=> b!609932 m!586423))

(assert (=> b!609932 m!586405))

(assert (=> b!609932 m!586405))

(declare-fun m!586425 () Bool)

(assert (=> b!609932 m!586425))

(declare-fun m!586427 () Bool)

(assert (=> b!609940 m!586427))

(assert (=> b!609941 m!586405))

(assert (=> b!609941 m!586419))

(declare-fun m!586429 () Bool)

(assert (=> b!609941 m!586429))

(assert (=> b!609936 m!586405))

(declare-fun m!586431 () Bool)

(assert (=> b!609936 m!586431))

(assert (=> b!609936 m!586405))

(declare-fun m!586433 () Bool)

(assert (=> b!609936 m!586433))

(assert (=> b!609936 m!586405))

(declare-fun m!586435 () Bool)

(assert (=> b!609936 m!586435))

(assert (=> b!609936 m!586405))

(declare-fun m!586437 () Bool)

(assert (=> b!609936 m!586437))

(declare-fun m!586439 () Bool)

(assert (=> b!609936 m!586439))

(assert (=> b!609938 m!586419))

(declare-fun m!586441 () Bool)

(assert (=> b!609938 m!586441))

(declare-fun m!586443 () Bool)

(assert (=> b!609939 m!586443))

(declare-fun m!586445 () Bool)

(assert (=> b!609947 m!586445))

(assert (=> b!609929 m!586405))

(declare-fun m!586447 () Bool)

(assert (=> start!55612 m!586447))

(declare-fun m!586449 () Bool)

(assert (=> start!55612 m!586449))

(declare-fun m!586451 () Bool)

(assert (=> b!609933 m!586451))

(assert (=> b!609926 m!586405))

(assert (=> b!609926 m!586435))

(declare-fun m!586453 () Bool)

(assert (=> b!609926 m!586453))

(assert (=> b!609926 m!586405))

(declare-fun m!586455 () Bool)

(assert (=> b!609926 m!586455))

(assert (=> b!609926 m!586405))

(declare-fun m!586457 () Bool)

(assert (=> b!609926 m!586457))

(assert (=> b!609926 m!586405))

(declare-fun m!586459 () Bool)

(assert (=> b!609926 m!586459))

(declare-fun m!586461 () Bool)

(assert (=> b!609926 m!586461))

(assert (=> b!609926 m!586439))

(declare-fun m!586463 () Bool)

(assert (=> b!609934 m!586463))

(assert (=> b!609935 m!586405))

(assert (=> b!609935 m!586405))

(declare-fun m!586465 () Bool)

(assert (=> b!609935 m!586465))

(assert (=> b!609945 m!586405))

(assert (=> b!609945 m!586405))

(assert (=> b!609945 m!586411))

(assert (=> b!609943 m!586405))

(assert (=> b!609943 m!586405))

(assert (=> b!609943 m!586433))

(push 1)

(assert (not b!609947))

(assert (not b!609933))

(assert (not start!55612))

(assert (not b!609936))

(assert (not b!609944))

(assert (not b!609945))

(assert (not b!609939))

(assert (not b!609940))

(assert (not b!609943))

(assert (not b!609928))

(assert (not b!609932))

(assert (not b!609935))

(assert (not b!609927))

(assert (not b!609926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!610198 () Bool)

(declare-fun e!349525 () SeekEntryResult!6362)

(assert (=> b!610198 (= e!349525 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!88123 () Bool)

(declare-fun lt!279081 () SeekEntryResult!6362)

(assert (=> d!88123 (and (or (is-Undefined!6362 lt!279081) (not (is-Found!6362 lt!279081)) (and (bvsge (index!27724 lt!279081) #b00000000000000000000000000000000) (bvslt (index!27724 lt!279081) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279081) (is-Found!6362 lt!279081) (not (is-MissingVacant!6362 lt!279081)) (not (= (index!27726 lt!279081) vacantSpotIndex!68)) (and (bvsge (index!27726 lt!279081) #b00000000000000000000000000000000) (bvslt (index!27726 lt!279081) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279081) (ite (is-Found!6362 lt!279081) (= (select (arr!17922 a!2986) (index!27724 lt!279081)) (select (arr!17922 a!2986) j!136)) (and (is-MissingVacant!6362 lt!279081) (= (index!27726 lt!279081) vacantSpotIndex!68) (= (select (arr!17922 a!2986) (index!27726 lt!279081)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349526 () SeekEntryResult!6362)

(assert (=> d!88123 (= lt!279081 e!349526)))

(declare-fun c!69190 () Bool)

(assert (=> d!88123 (= c!69190 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279082 () (_ BitVec 64))

(assert (=> d!88123 (= lt!279082 (select (arr!17922 a!2986) index!984))))

(assert (=> d!88123 (validMask!0 mask!3053)))

(assert (=> d!88123 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053) lt!279081)))

(declare-fun b!610199 () Bool)

(declare-fun c!69192 () Bool)

(assert (=> b!610199 (= c!69192 (= lt!279082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349527 () SeekEntryResult!6362)

(assert (=> b!610199 (= e!349527 e!349525)))

(declare-fun b!610200 () Bool)

(assert (=> b!610200 (= e!349526 e!349527)))

(declare-fun c!69191 () Bool)

(assert (=> b!610200 (= c!69191 (= lt!279082 (select (arr!17922 a!2986) j!136)))))

(declare-fun b!610201 () Bool)

(assert (=> b!610201 (= e!349525 (MissingVacant!6362 vacantSpotIndex!68))))

(declare-fun b!610202 () Bool)

(assert (=> b!610202 (= e!349526 Undefined!6362)))

(declare-fun b!610203 () Bool)

(assert (=> b!610203 (= e!349527 (Found!6362 index!984))))

(assert (= (and d!88123 c!69190) b!610202))

(assert (= (and d!88123 (not c!69190)) b!610200))

(assert (= (and b!610200 c!69191) b!610203))

(assert (= (and b!610200 (not c!69191)) b!610199))

(assert (= (and b!610199 c!69192) b!610201))

(assert (= (and b!610199 (not c!69192)) b!610198))

(assert (=> b!610198 m!586413))

(assert (=> b!610198 m!586413))

(assert (=> b!610198 m!586405))

(declare-fun m!586689 () Bool)

(assert (=> b!610198 m!586689))

(declare-fun m!586691 () Bool)

(assert (=> d!88123 m!586691))

(declare-fun m!586693 () Bool)

(assert (=> d!88123 m!586693))

(assert (=> d!88123 m!586403))

(assert (=> d!88123 m!586447))

(assert (=> b!609927 d!88123))

(declare-fun d!88147 () Bool)

(declare-fun res!392558 () Bool)

(declare-fun e!349537 () Bool)

(assert (=> d!88147 (=> res!392558 e!349537)))

(assert (=> d!88147 (= res!392558 (= (select (arr!17922 lt!278923) index!984) (select (arr!17922 a!2986) j!136)))))

(assert (=> d!88147 (= (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) index!984) e!349537)))

(declare-fun b!610214 () Bool)

(declare-fun e!349538 () Bool)

(assert (=> b!610214 (= e!349537 e!349538)))

(declare-fun res!392559 () Bool)

(assert (=> b!610214 (=> (not res!392559) (not e!349538))))

(assert (=> b!610214 (= res!392559 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18286 lt!278923)))))

(declare-fun b!610215 () Bool)

(assert (=> b!610215 (= e!349538 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88147 (not res!392558)) b!610214))

(assert (= (and b!610214 res!392559) b!610215))

(declare-fun m!586703 () Bool)

(assert (=> d!88147 m!586703))

(assert (=> b!610215 m!586405))

(declare-fun m!586705 () Bool)

(assert (=> b!610215 m!586705))

(assert (=> b!609928 d!88147))

(declare-fun b!610278 () Bool)

(declare-fun e!349577 () SeekEntryResult!6362)

(assert (=> b!610278 (= e!349577 Undefined!6362)))

(declare-fun b!610280 () Bool)

(declare-fun e!349576 () SeekEntryResult!6362)

(assert (=> b!610280 (= e!349577 e!349576)))

(declare-fun lt!279108 () (_ BitVec 64))

(declare-fun lt!279110 () SeekEntryResult!6362)

(assert (=> b!610280 (= lt!279108 (select (arr!17922 a!2986) (index!27725 lt!279110)))))

(declare-fun c!69222 () Bool)

(assert (=> b!610280 (= c!69222 (= lt!279108 k!1786))))

(declare-fun b!610281 () Bool)

(declare-fun e!349575 () SeekEntryResult!6362)

(assert (=> b!610281 (= e!349575 (MissingZero!6362 (index!27725 lt!279110)))))

(declare-fun d!88151 () Bool)

(declare-fun lt!279109 () SeekEntryResult!6362)

(assert (=> d!88151 (and (or (is-Undefined!6362 lt!279109) (not (is-Found!6362 lt!279109)) (and (bvsge (index!27724 lt!279109) #b00000000000000000000000000000000) (bvslt (index!27724 lt!279109) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279109) (is-Found!6362 lt!279109) (not (is-MissingZero!6362 lt!279109)) (and (bvsge (index!27723 lt!279109) #b00000000000000000000000000000000) (bvslt (index!27723 lt!279109) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279109) (is-Found!6362 lt!279109) (is-MissingZero!6362 lt!279109) (not (is-MissingVacant!6362 lt!279109)) (and (bvsge (index!27726 lt!279109) #b00000000000000000000000000000000) (bvslt (index!27726 lt!279109) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279109) (ite (is-Found!6362 lt!279109) (= (select (arr!17922 a!2986) (index!27724 lt!279109)) k!1786) (ite (is-MissingZero!6362 lt!279109) (= (select (arr!17922 a!2986) (index!27723 lt!279109)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6362 lt!279109) (= (select (arr!17922 a!2986) (index!27726 lt!279109)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88151 (= lt!279109 e!349577)))

(declare-fun c!69220 () Bool)

(assert (=> d!88151 (= c!69220 (and (is-Intermediate!6362 lt!279110) (undefined!7174 lt!279110)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37343 (_ BitVec 32)) SeekEntryResult!6362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88151 (= lt!279110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88151 (validMask!0 mask!3053)))

(assert (=> d!88151 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!279109)))

(declare-fun b!610279 () Bool)

(assert (=> b!610279 (= e!349575 (seekKeyOrZeroReturnVacant!0 (x!56527 lt!279110) (index!27725 lt!279110) (index!27725 lt!279110) k!1786 a!2986 mask!3053))))

(declare-fun b!610282 () Bool)

(declare-fun c!69221 () Bool)

(assert (=> b!610282 (= c!69221 (= lt!279108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610282 (= e!349576 e!349575)))

(declare-fun b!610283 () Bool)

(assert (=> b!610283 (= e!349576 (Found!6362 (index!27725 lt!279110)))))

(assert (= (and d!88151 c!69220) b!610278))

(assert (= (and d!88151 (not c!69220)) b!610280))

(assert (= (and b!610280 c!69222) b!610283))

(assert (= (and b!610280 (not c!69222)) b!610282))

(assert (= (and b!610282 c!69221) b!610281))

(assert (= (and b!610282 (not c!69221)) b!610279))

(declare-fun m!586737 () Bool)

(assert (=> b!610280 m!586737))

(declare-fun m!586739 () Bool)

(assert (=> d!88151 m!586739))

(declare-fun m!586741 () Bool)

(assert (=> d!88151 m!586741))

(declare-fun m!586743 () Bool)

(assert (=> d!88151 m!586743))

(declare-fun m!586745 () Bool)

(assert (=> d!88151 m!586745))

(assert (=> d!88151 m!586739))

(assert (=> d!88151 m!586447))

(declare-fun m!586747 () Bool)

(assert (=> d!88151 m!586747))

(declare-fun m!586749 () Bool)

(assert (=> b!610279 m!586749))

(assert (=> b!609939 d!88151))

(declare-fun d!88163 () Bool)

(declare-fun res!392572 () Bool)

(declare-fun e!349578 () Bool)

(assert (=> d!88163 (=> res!392572 e!349578)))

(assert (=> d!88163 (= res!392572 (= (select (arr!17922 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88163 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!349578)))

(declare-fun b!610284 () Bool)

(declare-fun e!349579 () Bool)

(assert (=> b!610284 (= e!349578 e!349579)))

(declare-fun res!392573 () Bool)

(assert (=> b!610284 (=> (not res!392573) (not e!349579))))

(assert (=> b!610284 (= res!392573 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18286 a!2986)))))

(declare-fun b!610285 () Bool)

(assert (=> b!610285 (= e!349579 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88163 (not res!392572)) b!610284))

(assert (= (and b!610284 res!392573) b!610285))

(declare-fun m!586751 () Bool)

(assert (=> d!88163 m!586751))

(declare-fun m!586753 () Bool)

(assert (=> b!610285 m!586753))

(assert (=> b!609940 d!88163))

(declare-fun d!88165 () Bool)

(assert (=> d!88165 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55612 d!88165))

(declare-fun d!88177 () Bool)

(assert (=> d!88177 (= (array_inv!13718 a!2986) (bvsge (size!18286 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55612 d!88177))

(declare-fun b!610299 () Bool)

(declare-fun e!349589 () SeekEntryResult!6362)

(assert (=> b!610299 (= e!349589 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278930 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!278924 lt!278923 mask!3053))))

(declare-fun lt!279120 () SeekEntryResult!6362)

(declare-fun d!88179 () Bool)

(assert (=> d!88179 (and (or (is-Undefined!6362 lt!279120) (not (is-Found!6362 lt!279120)) (and (bvsge (index!27724 lt!279120) #b00000000000000000000000000000000) (bvslt (index!27724 lt!279120) (size!18286 lt!278923)))) (or (is-Undefined!6362 lt!279120) (is-Found!6362 lt!279120) (not (is-MissingVacant!6362 lt!279120)) (not (= (index!27726 lt!279120) vacantSpotIndex!68)) (and (bvsge (index!27726 lt!279120) #b00000000000000000000000000000000) (bvslt (index!27726 lt!279120) (size!18286 lt!278923)))) (or (is-Undefined!6362 lt!279120) (ite (is-Found!6362 lt!279120) (= (select (arr!17922 lt!278923) (index!27724 lt!279120)) lt!278924) (and (is-MissingVacant!6362 lt!279120) (= (index!27726 lt!279120) vacantSpotIndex!68) (= (select (arr!17922 lt!278923) (index!27726 lt!279120)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349590 () SeekEntryResult!6362)

(assert (=> d!88179 (= lt!279120 e!349590)))

(declare-fun c!69227 () Bool)

(assert (=> d!88179 (= c!69227 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279121 () (_ BitVec 64))

(assert (=> d!88179 (= lt!279121 (select (arr!17922 lt!278923) lt!278930))))

(assert (=> d!88179 (validMask!0 mask!3053)))

(assert (=> d!88179 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 lt!278924 lt!278923 mask!3053) lt!279120)))

(declare-fun b!610300 () Bool)

(declare-fun c!69229 () Bool)

(assert (=> b!610300 (= c!69229 (= lt!279121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349591 () SeekEntryResult!6362)

(assert (=> b!610300 (= e!349591 e!349589)))

(declare-fun b!610301 () Bool)

(assert (=> b!610301 (= e!349590 e!349591)))

(declare-fun c!69228 () Bool)

(assert (=> b!610301 (= c!69228 (= lt!279121 lt!278924))))

(declare-fun b!610302 () Bool)

(assert (=> b!610302 (= e!349589 (MissingVacant!6362 vacantSpotIndex!68))))

(declare-fun b!610303 () Bool)

(assert (=> b!610303 (= e!349590 Undefined!6362)))

(declare-fun b!610304 () Bool)

(assert (=> b!610304 (= e!349591 (Found!6362 lt!278930))))

(assert (= (and d!88179 c!69227) b!610303))

(assert (= (and d!88179 (not c!69227)) b!610301))

(assert (= (and b!610301 c!69228) b!610304))

(assert (= (and b!610301 (not c!69228)) b!610300))

(assert (= (and b!610300 c!69229) b!610302))

(assert (= (and b!610300 (not c!69229)) b!610299))

(declare-fun m!586777 () Bool)

(assert (=> b!610299 m!586777))

(assert (=> b!610299 m!586777))

(declare-fun m!586779 () Bool)

(assert (=> b!610299 m!586779))

(declare-fun m!586781 () Bool)

(assert (=> d!88179 m!586781))

(declare-fun m!586783 () Bool)

(assert (=> d!88179 m!586783))

(declare-fun m!586785 () Bool)

(assert (=> d!88179 m!586785))

(assert (=> d!88179 m!586447))

(assert (=> b!609932 d!88179))

(declare-fun e!349592 () SeekEntryResult!6362)

(declare-fun b!610305 () Bool)

(assert (=> b!610305 (= e!349592 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278930 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!279122 () SeekEntryResult!6362)

(declare-fun d!88181 () Bool)

(assert (=> d!88181 (and (or (is-Undefined!6362 lt!279122) (not (is-Found!6362 lt!279122)) (and (bvsge (index!27724 lt!279122) #b00000000000000000000000000000000) (bvslt (index!27724 lt!279122) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279122) (is-Found!6362 lt!279122) (not (is-MissingVacant!6362 lt!279122)) (not (= (index!27726 lt!279122) vacantSpotIndex!68)) (and (bvsge (index!27726 lt!279122) #b00000000000000000000000000000000) (bvslt (index!27726 lt!279122) (size!18286 a!2986)))) (or (is-Undefined!6362 lt!279122) (ite (is-Found!6362 lt!279122) (= (select (arr!17922 a!2986) (index!27724 lt!279122)) (select (arr!17922 a!2986) j!136)) (and (is-MissingVacant!6362 lt!279122) (= (index!27726 lt!279122) vacantSpotIndex!68) (= (select (arr!17922 a!2986) (index!27726 lt!279122)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349593 () SeekEntryResult!6362)

(assert (=> d!88181 (= lt!279122 e!349593)))

(declare-fun c!69230 () Bool)

(assert (=> d!88181 (= c!69230 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279123 () (_ BitVec 64))

(assert (=> d!88181 (= lt!279123 (select (arr!17922 a!2986) lt!278930))))

(assert (=> d!88181 (validMask!0 mask!3053)))

(assert (=> d!88181 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053) lt!279122)))

(declare-fun b!610306 () Bool)

(declare-fun c!69232 () Bool)

(assert (=> b!610306 (= c!69232 (= lt!279123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349594 () SeekEntryResult!6362)

(assert (=> b!610306 (= e!349594 e!349592)))

(declare-fun b!610307 () Bool)

(assert (=> b!610307 (= e!349593 e!349594)))

(declare-fun c!69231 () Bool)

(assert (=> b!610307 (= c!69231 (= lt!279123 (select (arr!17922 a!2986) j!136)))))

(declare-fun b!610308 () Bool)

(assert (=> b!610308 (= e!349592 (MissingVacant!6362 vacantSpotIndex!68))))

(declare-fun b!610309 () Bool)

(assert (=> b!610309 (= e!349593 Undefined!6362)))

(declare-fun b!610310 () Bool)

(assert (=> b!610310 (= e!349594 (Found!6362 lt!278930))))

(assert (= (and d!88181 c!69230) b!610309))

(assert (= (and d!88181 (not c!69230)) b!610307))

(assert (= (and b!610307 c!69231) b!610310))

(assert (= (and b!610307 (not c!69231)) b!610306))

(assert (= (and b!610306 c!69232) b!610308))

(assert (= (and b!610306 (not c!69232)) b!610305))

(assert (=> b!610305 m!586777))

(assert (=> b!610305 m!586777))

(assert (=> b!610305 m!586405))

(declare-fun m!586787 () Bool)

(assert (=> b!610305 m!586787))

(declare-fun m!586789 () Bool)

(assert (=> d!88181 m!586789))

(declare-fun m!586791 () Bool)

(assert (=> d!88181 m!586791))

(declare-fun m!586793 () Bool)

(assert (=> d!88181 m!586793))

(assert (=> d!88181 m!586447))

(assert (=> b!609932 d!88181))

(declare-fun d!88183 () Bool)

(declare-fun lt!279126 () (_ BitVec 32))

(assert (=> d!88183 (and (bvsge lt!279126 #b00000000000000000000000000000000) (bvslt lt!279126 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88183 (= lt!279126 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88183 (validMask!0 mask!3053)))

(assert (=> d!88183 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279126)))

(declare-fun bs!18616 () Bool)

(assert (= bs!18616 d!88183))

(declare-fun m!586795 () Bool)

(assert (=> bs!18616 m!586795))

(assert (=> bs!18616 m!586447))

(assert (=> b!609932 d!88183))

(declare-fun d!88185 () Bool)

(declare-fun e!349612 () Bool)

(assert (=> d!88185 e!349612))

(declare-fun res!392586 () Bool)

(assert (=> d!88185 (=> (not res!392586) (not e!349612))))

(assert (=> d!88185 (= res!392586 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18286 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18286 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18286 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986))))))

(declare-fun lt!279138 () Unit!19552)

(declare-fun choose!9 (array!37343 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19552)

(assert (=> d!88185 (= lt!279138 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88185 (validMask!0 mask!3053)))

(assert (=> d!88185 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 mask!3053) lt!279138)))

(declare-fun b!610338 () Bool)

(assert (=> b!610338 (= e!349612 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 (select (arr!17922 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278930 vacantSpotIndex!68 (select (store (arr!17922 a!2986) i!1108 k!1786) j!136) (array!37344 (store (arr!17922 a!2986) i!1108 k!1786) (size!18286 a!2986)) mask!3053)))))

(assert (= (and d!88185 res!392586) b!610338))

(declare-fun m!586817 () Bool)

(assert (=> d!88185 m!586817))

(assert (=> d!88185 m!586447))

(assert (=> b!610338 m!586405))

(assert (=> b!610338 m!586405))

(assert (=> b!610338 m!586425))

(assert (=> b!610338 m!586415))

(assert (=> b!610338 m!586419))

(assert (=> b!610338 m!586415))

(declare-fun m!586819 () Bool)

(assert (=> b!610338 m!586819))

(assert (=> b!609932 d!88185))

(declare-fun b!610339 () Bool)

(declare-fun e!349613 () SeekEntryResult!6362)

(assert (=> b!610339 (= e!349613 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!278924 lt!278923 mask!3053))))

(declare-fun d!88193 () Bool)

(declare-fun lt!279139 () SeekEntryResult!6362)

(assert (=> d!88193 (and (or (is-Undefined!6362 lt!279139) (not (is-Found!6362 lt!279139)) (and (bvsge (index!27724 lt!279139) #b00000000000000000000000000000000) (bvslt (index!27724 lt!279139) (size!18286 lt!278923)))) (or (is-Undefined!6362 lt!279139) (is-Found!6362 lt!279139) (not (is-MissingVacant!6362 lt!279139)) (not (= (index!27726 lt!279139) vacantSpotIndex!68)) (and (bvsge (index!27726 lt!279139) #b00000000000000000000000000000000) (bvslt (index!27726 lt!279139) (size!18286 lt!278923)))) (or (is-Undefined!6362 lt!279139) (ite (is-Found!6362 lt!279139) (= (select (arr!17922 lt!278923) (index!27724 lt!279139)) lt!278924) (and (is-MissingVacant!6362 lt!279139) (= (index!27726 lt!279139) vacantSpotIndex!68) (= (select (arr!17922 lt!278923) (index!27726 lt!279139)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349614 () SeekEntryResult!6362)

(assert (=> d!88193 (= lt!279139 e!349614)))

(declare-fun c!69243 () Bool)

(assert (=> d!88193 (= c!69243 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279140 () (_ BitVec 64))

(assert (=> d!88193 (= lt!279140 (select (arr!17922 lt!278923) index!984))))

(assert (=> d!88193 (validMask!0 mask!3053)))

(assert (=> d!88193 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278924 lt!278923 mask!3053) lt!279139)))

(declare-fun b!610340 () Bool)

(declare-fun c!69245 () Bool)

(assert (=> b!610340 (= c!69245 (= lt!279140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349615 () SeekEntryResult!6362)

(assert (=> b!610340 (= e!349615 e!349613)))

(declare-fun b!610341 () Bool)

(assert (=> b!610341 (= e!349614 e!349615)))

(declare-fun c!69244 () Bool)

(assert (=> b!610341 (= c!69244 (= lt!279140 lt!278924))))

(declare-fun b!610342 () Bool)

(assert (=> b!610342 (= e!349613 (MissingVacant!6362 vacantSpotIndex!68))))

(declare-fun b!610343 () Bool)

(assert (=> b!610343 (= e!349614 Undefined!6362)))

(declare-fun b!610344 () Bool)

(assert (=> b!610344 (= e!349615 (Found!6362 index!984))))

(assert (= (and d!88193 c!69243) b!610343))

(assert (= (and d!88193 (not c!69243)) b!610341))

(assert (= (and b!610341 c!69244) b!610344))

(assert (= (and b!610341 (not c!69244)) b!610340))

(assert (= (and b!610340 c!69245) b!610342))

(assert (= (and b!610340 (not c!69245)) b!610339))

(assert (=> b!610339 m!586413))

(assert (=> b!610339 m!586413))

(declare-fun m!586821 () Bool)

(assert (=> b!610339 m!586821))

(declare-fun m!586823 () Bool)

(assert (=> d!88193 m!586823))

(declare-fun m!586825 () Bool)

(assert (=> d!88193 m!586825))

(assert (=> d!88193 m!586703))

(assert (=> d!88193 m!586447))

(assert (=> b!609932 d!88193))

(declare-fun d!88195 () Bool)

(declare-fun res!392587 () Bool)

(declare-fun e!349616 () Bool)

(assert (=> d!88195 (=> res!392587 e!349616)))

(assert (=> d!88195 (= res!392587 (= (select (arr!17922 lt!278923) j!136) (select (arr!17922 a!2986) j!136)))))

(assert (=> d!88195 (= (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) j!136) e!349616)))

(declare-fun b!610345 () Bool)

(declare-fun e!349617 () Bool)

(assert (=> b!610345 (= e!349616 e!349617)))

(declare-fun res!392588 () Bool)

(assert (=> b!610345 (=> (not res!392588) (not e!349617))))

(assert (=> b!610345 (= res!392588 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18286 lt!278923)))))

(declare-fun b!610346 () Bool)

(assert (=> b!610346 (= e!349617 (arrayContainsKey!0 lt!278923 (select (arr!17922 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88195 (not res!392587)) b!610345))

(assert (= (and b!610345 res!392588) b!610346))

(declare-fun m!586827 () Bool)

(assert (=> d!88195 m!586827))

(assert (=> b!610346 m!586405))

(declare-fun m!586829 () Bool)

(assert (=> b!610346 m!586829))

(assert (=> b!609943 d!88195))

(declare-fun d!88197 () Bool)

(assert (=> d!88197 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!609933 d!88197))

(declare-fun b!610359 () Bool)

(declare-fun e!349629 () Bool)

(declare-fun contains!3038 (List!11963 (_ BitVec 64)) Bool)

(assert (=> b!610359 (= e!349629 (contains!3038 Nil!11960 (select (arr!17922 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610360 () Bool)

(declare-fun e!349630 () Bool)

(declare-fun e!349631 () Bool)

(assert (=> b!610360 (= e!349630 e!349631)))

(declare-fun c!69248 () Bool)

(assert (=> b!610360 (= c!69248 (validKeyInArray!0 (select (arr!17922 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610361 () Bool)

(declare-fun e!349628 () Bool)

(assert (=> b!610361 (= e!349628 e!349630)))

(declare-fun res!392599 () Bool)

(assert (=> b!610361 (=> (not res!392599) (not e!349630))))

(assert (=> b!610361 (= res!392599 (not e!349629))))

(declare-fun res!392598 () Bool)

(assert (=> b!610361 (=> (not res!392598) (not e!349629))))

(assert (=> b!610361 (= res!392598 (validKeyInArray!0 (select (arr!17922 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610362 () Bool)

(declare-fun call!33128 () Bool)

(assert (=> b!610362 (= e!349631 call!33128)))

(declare-fun d!88199 () Bool)

(declare-fun res!392597 () Bool)

(assert (=> d!88199 (=> res!392597 e!349628)))

(assert (=> d!88199 (= res!392597 (bvsge #b00000000000000000000000000000000 (size!18286 a!2986)))))

