; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56024 () Bool)

(assert start!56024)

(declare-fun b!616224 () Bool)

(declare-fun res!396939 () Bool)

(declare-fun e!353330 () Bool)

(assert (=> b!616224 (=> (not res!396939) (not e!353330))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37494 0))(
  ( (array!37495 (arr!17993 (Array (_ BitVec 32) (_ BitVec 64))) (size!18357 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37494)

(assert (=> b!616224 (= res!396939 (and (= (size!18357 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18357 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18357 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616225 () Bool)

(declare-datatypes ((Unit!20058 0))(
  ( (Unit!20059) )
))
(declare-fun e!353326 () Unit!20058)

(declare-fun Unit!20060 () Unit!20058)

(assert (=> b!616225 (= e!353326 Unit!20060)))

(declare-fun b!616226 () Bool)

(assert (=> b!616226 false))

(declare-fun lt!283347 () array!37494)

(declare-fun lt!283356 () Unit!20058)

(declare-datatypes ((List!12034 0))(
  ( (Nil!12031) (Cons!12030 (h!13075 (_ BitVec 64)) (t!18262 List!12034)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37494 (_ BitVec 64) (_ BitVec 32) List!12034) Unit!20058)

(assert (=> b!616226 (= lt!283356 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283347 (select (arr!17993 a!2986) j!136) j!136 Nil!12031))))

(declare-fun arrayNoDuplicates!0 (array!37494 (_ BitVec 32) List!12034) Bool)

(assert (=> b!616226 (arrayNoDuplicates!0 lt!283347 j!136 Nil!12031)))

(declare-fun lt!283352 () Unit!20058)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37494 (_ BitVec 32) (_ BitVec 32)) Unit!20058)

(assert (=> b!616226 (= lt!283352 (lemmaNoDuplicateFromThenFromBigger!0 lt!283347 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616226 (arrayNoDuplicates!0 lt!283347 #b00000000000000000000000000000000 Nil!12031)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!283339 () Unit!20058)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12034) Unit!20058)

(assert (=> b!616226 (= lt!283339 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12031))))

(declare-fun arrayContainsKey!0 (array!37494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616226 (arrayContainsKey!0 lt!283347 (select (arr!17993 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283343 () Unit!20058)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20058)

(assert (=> b!616226 (= lt!283343 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283347 (select (arr!17993 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353334 () Unit!20058)

(declare-fun Unit!20061 () Unit!20058)

(assert (=> b!616226 (= e!353334 Unit!20061)))

(declare-fun b!616227 () Bool)

(assert (=> b!616227 false))

(declare-fun lt!283344 () Unit!20058)

(assert (=> b!616227 (= lt!283344 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283347 (select (arr!17993 a!2986) j!136) index!984 Nil!12031))))

(assert (=> b!616227 (arrayNoDuplicates!0 lt!283347 index!984 Nil!12031)))

(declare-fun lt!283357 () Unit!20058)

(assert (=> b!616227 (= lt!283357 (lemmaNoDuplicateFromThenFromBigger!0 lt!283347 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616227 (arrayNoDuplicates!0 lt!283347 #b00000000000000000000000000000000 Nil!12031)))

(declare-fun lt!283340 () Unit!20058)

(assert (=> b!616227 (= lt!283340 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12031))))

(assert (=> b!616227 (arrayContainsKey!0 lt!283347 (select (arr!17993 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283346 () Unit!20058)

(assert (=> b!616227 (= lt!283346 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283347 (select (arr!17993 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353333 () Bool)

(assert (=> b!616227 e!353333))

(declare-fun res!396941 () Bool)

(assert (=> b!616227 (=> (not res!396941) (not e!353333))))

(assert (=> b!616227 (= res!396941 (arrayContainsKey!0 lt!283347 (select (arr!17993 a!2986) j!136) j!136))))

(declare-fun Unit!20062 () Unit!20058)

(assert (=> b!616227 (= e!353326 Unit!20062)))

(declare-fun b!616228 () Bool)

(declare-fun res!396940 () Bool)

(declare-fun e!353329 () Bool)

(assert (=> b!616228 (=> (not res!396940) (not e!353329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37494 (_ BitVec 32)) Bool)

(assert (=> b!616228 (= res!396940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616229 () Bool)

(declare-fun e!353336 () Unit!20058)

(declare-fun Unit!20063 () Unit!20058)

(assert (=> b!616229 (= e!353336 Unit!20063)))

(declare-fun b!616230 () Bool)

(declare-fun res!396953 () Bool)

(assert (=> b!616230 (=> (not res!396953) (not e!353329))))

(assert (=> b!616230 (= res!396953 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12031))))

(declare-fun b!616232 () Bool)

(declare-fun res!396945 () Bool)

(assert (=> b!616232 (=> (not res!396945) (not e!353330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616232 (= res!396945 (validKeyInArray!0 (select (arr!17993 a!2986) j!136)))))

(declare-fun b!616233 () Bool)

(declare-fun res!396950 () Bool)

(assert (=> b!616233 (=> (not res!396950) (not e!353330))))

(assert (=> b!616233 (= res!396950 (validKeyInArray!0 k!1786))))

(declare-fun b!616234 () Bool)

(declare-fun res!396942 () Bool)

(assert (=> b!616234 (=> (not res!396942) (not e!353330))))

(assert (=> b!616234 (= res!396942 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616235 () Bool)

(declare-fun e!353325 () Bool)

(assert (=> b!616235 (= e!353325 (not true))))

(declare-fun lt!283354 () Unit!20058)

(assert (=> b!616235 (= lt!283354 e!353336)))

(declare-fun c!70013 () Bool)

(declare-datatypes ((SeekEntryResult!6433 0))(
  ( (MissingZero!6433 (index!28016 (_ BitVec 32))) (Found!6433 (index!28017 (_ BitVec 32))) (Intermediate!6433 (undefined!7245 Bool) (index!28018 (_ BitVec 32)) (x!56809 (_ BitVec 32))) (Undefined!6433) (MissingVacant!6433 (index!28019 (_ BitVec 32))) )
))
(declare-fun lt!283353 () SeekEntryResult!6433)

(assert (=> b!616235 (= c!70013 (= lt!283353 (Found!6433 index!984)))))

(declare-fun lt!283351 () Unit!20058)

(declare-fun e!353332 () Unit!20058)

(assert (=> b!616235 (= lt!283351 e!353332)))

(declare-fun c!70011 () Bool)

(assert (=> b!616235 (= c!70011 (= lt!283353 Undefined!6433))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!283350 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37494 (_ BitVec 32)) SeekEntryResult!6433)

(assert (=> b!616235 (= lt!283353 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283350 lt!283347 mask!3053))))

(declare-fun e!353324 () Bool)

(assert (=> b!616235 e!353324))

(declare-fun res!396948 () Bool)

(assert (=> b!616235 (=> (not res!396948) (not e!353324))))

(declare-fun lt!283355 () SeekEntryResult!6433)

(declare-fun lt!283341 () (_ BitVec 32))

(assert (=> b!616235 (= res!396948 (= lt!283355 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283341 vacantSpotIndex!68 lt!283350 lt!283347 mask!3053)))))

(assert (=> b!616235 (= lt!283355 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283341 vacantSpotIndex!68 (select (arr!17993 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616235 (= lt!283350 (select (store (arr!17993 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283345 () Unit!20058)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20058)

(assert (=> b!616235 (= lt!283345 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283341 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616235 (= lt!283341 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616236 () Bool)

(declare-fun Unit!20064 () Unit!20058)

(assert (=> b!616236 (= e!353332 Unit!20064)))

(assert (=> b!616236 false))

(declare-fun b!616237 () Bool)

(declare-fun e!353331 () Bool)

(assert (=> b!616237 (= e!353331 (arrayContainsKey!0 lt!283347 (select (arr!17993 a!2986) j!136) index!984))))

(declare-fun b!616238 () Bool)

(declare-fun lt!283338 () SeekEntryResult!6433)

(assert (=> b!616238 (= e!353324 (= lt!283338 lt!283355))))

(declare-fun b!616239 () Bool)

(declare-fun Unit!20065 () Unit!20058)

(assert (=> b!616239 (= e!353332 Unit!20065)))

(declare-fun b!616240 () Bool)

(declare-fun e!353337 () Bool)

(assert (=> b!616240 (= e!353337 e!353325)))

(declare-fun res!396944 () Bool)

(assert (=> b!616240 (=> (not res!396944) (not e!353325))))

(assert (=> b!616240 (= res!396944 (and (= lt!283338 (Found!6433 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17993 a!2986) index!984) (select (arr!17993 a!2986) j!136))) (not (= (select (arr!17993 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616240 (= lt!283338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17993 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616241 () Bool)

(declare-fun Unit!20066 () Unit!20058)

(assert (=> b!616241 (= e!353336 Unit!20066)))

(declare-fun res!396949 () Bool)

(assert (=> b!616241 (= res!396949 (= (select (store (arr!17993 a!2986) i!1108 k!1786) index!984) (select (arr!17993 a!2986) j!136)))))

(declare-fun e!353328 () Bool)

(assert (=> b!616241 (=> (not res!396949) (not e!353328))))

(assert (=> b!616241 e!353328))

(declare-fun c!70010 () Bool)

(assert (=> b!616241 (= c!70010 (bvslt j!136 index!984))))

(declare-fun lt!283348 () Unit!20058)

(assert (=> b!616241 (= lt!283348 e!353334)))

(declare-fun c!70012 () Bool)

(assert (=> b!616241 (= c!70012 (bvslt index!984 j!136))))

(declare-fun lt!283349 () Unit!20058)

(assert (=> b!616241 (= lt!283349 e!353326)))

(assert (=> b!616241 false))

(declare-fun b!616242 () Bool)

(assert (=> b!616242 (= e!353330 e!353329)))

(declare-fun res!396938 () Bool)

(assert (=> b!616242 (=> (not res!396938) (not e!353329))))

(declare-fun lt!283342 () SeekEntryResult!6433)

(assert (=> b!616242 (= res!396938 (or (= lt!283342 (MissingZero!6433 i!1108)) (= lt!283342 (MissingVacant!6433 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37494 (_ BitVec 32)) SeekEntryResult!6433)

(assert (=> b!616242 (= lt!283342 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616243 () Bool)

(assert (=> b!616243 (= e!353333 (arrayContainsKey!0 lt!283347 (select (arr!17993 a!2986) j!136) index!984))))

(declare-fun b!616244 () Bool)

(declare-fun Unit!20067 () Unit!20058)

(assert (=> b!616244 (= e!353334 Unit!20067)))

(declare-fun b!616245 () Bool)

(declare-fun res!396946 () Bool)

(assert (=> b!616245 (=> (not res!396946) (not e!353329))))

(assert (=> b!616245 (= res!396946 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17993 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616231 () Bool)

(declare-fun res!396947 () Bool)

(assert (=> b!616231 (= res!396947 (arrayContainsKey!0 lt!283347 (select (arr!17993 a!2986) j!136) j!136))))

(assert (=> b!616231 (=> (not res!396947) (not e!353331))))

(declare-fun e!353327 () Bool)

(assert (=> b!616231 (= e!353327 e!353331)))

(declare-fun res!396952 () Bool)

(assert (=> start!56024 (=> (not res!396952) (not e!353330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56024 (= res!396952 (validMask!0 mask!3053))))

(assert (=> start!56024 e!353330))

(assert (=> start!56024 true))

(declare-fun array_inv!13789 (array!37494) Bool)

(assert (=> start!56024 (array_inv!13789 a!2986)))

(declare-fun b!616246 () Bool)

(declare-fun res!396943 () Bool)

(assert (=> b!616246 (= res!396943 (bvsge j!136 index!984))))

(assert (=> b!616246 (=> res!396943 e!353327)))

(assert (=> b!616246 (= e!353328 e!353327)))

(declare-fun b!616247 () Bool)

(assert (=> b!616247 (= e!353329 e!353337)))

(declare-fun res!396951 () Bool)

(assert (=> b!616247 (=> (not res!396951) (not e!353337))))

(assert (=> b!616247 (= res!396951 (= (select (store (arr!17993 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616247 (= lt!283347 (array!37495 (store (arr!17993 a!2986) i!1108 k!1786) (size!18357 a!2986)))))

(assert (= (and start!56024 res!396952) b!616224))

(assert (= (and b!616224 res!396939) b!616232))

(assert (= (and b!616232 res!396945) b!616233))

(assert (= (and b!616233 res!396950) b!616234))

(assert (= (and b!616234 res!396942) b!616242))

(assert (= (and b!616242 res!396938) b!616228))

(assert (= (and b!616228 res!396940) b!616230))

(assert (= (and b!616230 res!396953) b!616245))

(assert (= (and b!616245 res!396946) b!616247))

(assert (= (and b!616247 res!396951) b!616240))

(assert (= (and b!616240 res!396944) b!616235))

(assert (= (and b!616235 res!396948) b!616238))

(assert (= (and b!616235 c!70011) b!616236))

(assert (= (and b!616235 (not c!70011)) b!616239))

(assert (= (and b!616235 c!70013) b!616241))

(assert (= (and b!616235 (not c!70013)) b!616229))

(assert (= (and b!616241 res!396949) b!616246))

(assert (= (and b!616246 (not res!396943)) b!616231))

(assert (= (and b!616231 res!396947) b!616237))

(assert (= (and b!616241 c!70010) b!616226))

(assert (= (and b!616241 (not c!70010)) b!616244))

(assert (= (and b!616241 c!70012) b!616227))

(assert (= (and b!616241 (not c!70012)) b!616225))

(assert (= (and b!616227 res!396941) b!616243))

(declare-fun m!592405 () Bool)

(assert (=> b!616242 m!592405))

(declare-fun m!592407 () Bool)

(assert (=> b!616241 m!592407))

(declare-fun m!592409 () Bool)

(assert (=> b!616241 m!592409))

(declare-fun m!592411 () Bool)

(assert (=> b!616241 m!592411))

(assert (=> b!616237 m!592411))

(assert (=> b!616237 m!592411))

(declare-fun m!592413 () Bool)

(assert (=> b!616237 m!592413))

(assert (=> b!616247 m!592407))

(declare-fun m!592415 () Bool)

(assert (=> b!616247 m!592415))

(assert (=> b!616226 m!592411))

(declare-fun m!592417 () Bool)

(assert (=> b!616226 m!592417))

(declare-fun m!592419 () Bool)

(assert (=> b!616226 m!592419))

(assert (=> b!616226 m!592411))

(assert (=> b!616226 m!592411))

(declare-fun m!592421 () Bool)

(assert (=> b!616226 m!592421))

(declare-fun m!592423 () Bool)

(assert (=> b!616226 m!592423))

(declare-fun m!592425 () Bool)

(assert (=> b!616226 m!592425))

(assert (=> b!616226 m!592411))

(declare-fun m!592427 () Bool)

(assert (=> b!616226 m!592427))

(declare-fun m!592429 () Bool)

(assert (=> b!616226 m!592429))

(declare-fun m!592431 () Bool)

(assert (=> b!616235 m!592431))

(declare-fun m!592433 () Bool)

(assert (=> b!616235 m!592433))

(assert (=> b!616235 m!592411))

(assert (=> b!616235 m!592407))

(declare-fun m!592435 () Bool)

(assert (=> b!616235 m!592435))

(declare-fun m!592437 () Bool)

(assert (=> b!616235 m!592437))

(declare-fun m!592439 () Bool)

(assert (=> b!616235 m!592439))

(assert (=> b!616235 m!592411))

(declare-fun m!592441 () Bool)

(assert (=> b!616235 m!592441))

(declare-fun m!592443 () Bool)

(assert (=> b!616230 m!592443))

(assert (=> b!616232 m!592411))

(assert (=> b!616232 m!592411))

(declare-fun m!592445 () Bool)

(assert (=> b!616232 m!592445))

(declare-fun m!592447 () Bool)

(assert (=> b!616228 m!592447))

(assert (=> b!616227 m!592411))

(declare-fun m!592449 () Bool)

(assert (=> b!616227 m!592449))

(assert (=> b!616227 m!592411))

(assert (=> b!616227 m!592411))

(declare-fun m!592451 () Bool)

(assert (=> b!616227 m!592451))

(assert (=> b!616227 m!592423))

(assert (=> b!616227 m!592411))

(declare-fun m!592453 () Bool)

(assert (=> b!616227 m!592453))

(assert (=> b!616227 m!592411))

(declare-fun m!592455 () Bool)

(assert (=> b!616227 m!592455))

(declare-fun m!592457 () Bool)

(assert (=> b!616227 m!592457))

(declare-fun m!592459 () Bool)

(assert (=> b!616227 m!592459))

(assert (=> b!616227 m!592429))

(assert (=> b!616243 m!592411))

(assert (=> b!616243 m!592411))

(assert (=> b!616243 m!592413))

(declare-fun m!592461 () Bool)

(assert (=> b!616233 m!592461))

(assert (=> b!616231 m!592411))

(assert (=> b!616231 m!592411))

(assert (=> b!616231 m!592449))

(declare-fun m!592463 () Bool)

(assert (=> b!616245 m!592463))

(declare-fun m!592465 () Bool)

(assert (=> start!56024 m!592465))

(declare-fun m!592467 () Bool)

(assert (=> start!56024 m!592467))

(declare-fun m!592469 () Bool)

(assert (=> b!616240 m!592469))

(assert (=> b!616240 m!592411))

(assert (=> b!616240 m!592411))

(declare-fun m!592471 () Bool)

(assert (=> b!616240 m!592471))

(declare-fun m!592473 () Bool)

(assert (=> b!616234 m!592473))

(push 1)

