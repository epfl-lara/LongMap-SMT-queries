; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59610 () Bool)

(assert start!59610)

(declare-fun b!659235 () Bool)

(declare-fun res!427533 () Bool)

(declare-fun e!378720 () Bool)

(assert (=> b!659235 (=> (not res!427533) (not e!378720))))

(declare-datatypes ((array!38768 0))(
  ( (array!38769 (arr!18581 (Array (_ BitVec 32) (_ BitVec 64))) (size!18945 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38768)

(declare-datatypes ((List!12622 0))(
  ( (Nil!12619) (Cons!12618 (h!13663 (_ BitVec 64)) (t!18850 List!12622)) )
))
(declare-fun arrayNoDuplicates!0 (array!38768 (_ BitVec 32) List!12622) Bool)

(assert (=> b!659235 (= res!427533 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12619))))

(declare-fun b!659236 () Bool)

(assert (=> b!659236 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22964 0))(
  ( (Unit!22965) )
))
(declare-fun lt!308546 () Unit!22964)

(declare-fun lt!308536 () array!38768)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38768 (_ BitVec 64) (_ BitVec 32) List!12622) Unit!22964)

(assert (=> b!659236 (= lt!308546 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308536 (select (arr!18581 a!2986) j!136) index!984 Nil!12619))))

(assert (=> b!659236 (arrayNoDuplicates!0 lt!308536 index!984 Nil!12619)))

(declare-fun lt!308533 () Unit!22964)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38768 (_ BitVec 32) (_ BitVec 32)) Unit!22964)

(assert (=> b!659236 (= lt!308533 (lemmaNoDuplicateFromThenFromBigger!0 lt!308536 #b00000000000000000000000000000000 index!984))))

(assert (=> b!659236 (arrayNoDuplicates!0 lt!308536 #b00000000000000000000000000000000 Nil!12619)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!308530 () Unit!22964)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38768 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12622) Unit!22964)

(assert (=> b!659236 (= lt!308530 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12619))))

(declare-fun arrayContainsKey!0 (array!38768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!659236 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308539 () Unit!22964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38768 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22964)

(assert (=> b!659236 (= lt!308539 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308536 (select (arr!18581 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378719 () Bool)

(assert (=> b!659236 e!378719))

(declare-fun res!427530 () Bool)

(assert (=> b!659236 (=> (not res!427530) (not e!378719))))

(assert (=> b!659236 (= res!427530 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) j!136))))

(declare-fun e!378722 () Unit!22964)

(declare-fun Unit!22966 () Unit!22964)

(assert (=> b!659236 (= e!378722 Unit!22966)))

(declare-datatypes ((SeekEntryResult!7021 0))(
  ( (MissingZero!7021 (index!30449 (_ BitVec 32))) (Found!7021 (index!30450 (_ BitVec 32))) (Intermediate!7021 (undefined!7833 Bool) (index!30451 (_ BitVec 32)) (x!59232 (_ BitVec 32))) (Undefined!7021) (MissingVacant!7021 (index!30452 (_ BitVec 32))) )
))
(declare-fun lt!308542 () SeekEntryResult!7021)

(declare-fun b!659238 () Bool)

(declare-fun lt!308535 () SeekEntryResult!7021)

(declare-fun e!378729 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!659238 (= e!378729 (not (or (= lt!308542 (MissingVacant!7021 vacantSpotIndex!68)) (= lt!308535 lt!308542))))))

(declare-fun lt!308538 () Unit!22964)

(declare-fun e!378726 () Unit!22964)

(assert (=> b!659238 (= lt!308538 e!378726)))

(declare-fun c!76223 () Bool)

(assert (=> b!659238 (= c!76223 (= lt!308542 (Found!7021 index!984)))))

(declare-fun lt!308547 () Unit!22964)

(declare-fun e!378731 () Unit!22964)

(assert (=> b!659238 (= lt!308547 e!378731)))

(declare-fun c!76226 () Bool)

(assert (=> b!659238 (= c!76226 (= lt!308542 Undefined!7021))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!308544 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38768 (_ BitVec 32)) SeekEntryResult!7021)

(assert (=> b!659238 (= lt!308542 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308544 lt!308536 mask!3053))))

(declare-fun e!378724 () Bool)

(assert (=> b!659238 e!378724))

(declare-fun res!427537 () Bool)

(assert (=> b!659238 (=> (not res!427537) (not e!378724))))

(declare-fun lt!308532 () (_ BitVec 32))

(declare-fun lt!308548 () SeekEntryResult!7021)

(assert (=> b!659238 (= res!427537 (= lt!308548 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 lt!308544 lt!308536 mask!3053)))))

(assert (=> b!659238 (= lt!308548 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!659238 (= lt!308544 (select (store (arr!18581 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!308541 () Unit!22964)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38768 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22964)

(assert (=> b!659238 (= lt!308541 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!659238 (= lt!308532 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!659239 () Bool)

(assert (=> b!659239 false))

(declare-fun lt!308543 () Unit!22964)

(assert (=> b!659239 (= lt!308543 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308536 (select (arr!18581 a!2986) j!136) j!136 Nil!12619))))

(assert (=> b!659239 (arrayNoDuplicates!0 lt!308536 j!136 Nil!12619)))

(declare-fun lt!308529 () Unit!22964)

(assert (=> b!659239 (= lt!308529 (lemmaNoDuplicateFromThenFromBigger!0 lt!308536 #b00000000000000000000000000000000 j!136))))

(assert (=> b!659239 (arrayNoDuplicates!0 lt!308536 #b00000000000000000000000000000000 Nil!12619)))

(declare-fun lt!308534 () Unit!22964)

(assert (=> b!659239 (= lt!308534 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12619))))

(assert (=> b!659239 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308537 () Unit!22964)

(assert (=> b!659239 (= lt!308537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308536 (select (arr!18581 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378728 () Unit!22964)

(declare-fun Unit!22967 () Unit!22964)

(assert (=> b!659239 (= e!378728 Unit!22967)))

(declare-fun b!659240 () Bool)

(assert (=> b!659240 (= e!378724 (= lt!308535 lt!308548))))

(declare-fun b!659241 () Bool)

(declare-fun e!378725 () Bool)

(assert (=> b!659241 (= e!378720 e!378725)))

(declare-fun res!427529 () Bool)

(assert (=> b!659241 (=> (not res!427529) (not e!378725))))

(assert (=> b!659241 (= res!427529 (= (select (store (arr!18581 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659241 (= lt!308536 (array!38769 (store (arr!18581 a!2986) i!1108 k!1786) (size!18945 a!2986)))))

(declare-fun b!659242 () Bool)

(declare-fun res!427532 () Bool)

(assert (=> b!659242 (= res!427532 (bvsge j!136 index!984))))

(declare-fun e!378727 () Bool)

(assert (=> b!659242 (=> res!427532 e!378727)))

(declare-fun e!378723 () Bool)

(assert (=> b!659242 (= e!378723 e!378727)))

(declare-fun b!659243 () Bool)

(declare-fun res!427538 () Bool)

(declare-fun e!378730 () Bool)

(assert (=> b!659243 (=> (not res!427538) (not e!378730))))

(assert (=> b!659243 (= res!427538 (and (= (size!18945 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18945 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18945 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!659244 () Bool)

(declare-fun e!378721 () Bool)

(assert (=> b!659244 (= e!378721 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) index!984))))

(declare-fun b!659245 () Bool)

(declare-fun res!427523 () Bool)

(assert (=> b!659245 (= res!427523 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) j!136))))

(assert (=> b!659245 (=> (not res!427523) (not e!378721))))

(assert (=> b!659245 (= e!378727 e!378721)))

(declare-fun b!659246 () Bool)

(declare-fun res!427534 () Bool)

(assert (=> b!659246 (=> (not res!427534) (not e!378720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38768 (_ BitVec 32)) Bool)

(assert (=> b!659246 (= res!427534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!659247 () Bool)

(declare-fun Unit!22968 () Unit!22964)

(assert (=> b!659247 (= e!378726 Unit!22968)))

(declare-fun res!427536 () Bool)

(assert (=> b!659247 (= res!427536 (= (select (store (arr!18581 a!2986) i!1108 k!1786) index!984) (select (arr!18581 a!2986) j!136)))))

(assert (=> b!659247 (=> (not res!427536) (not e!378723))))

(assert (=> b!659247 e!378723))

(declare-fun c!76224 () Bool)

(assert (=> b!659247 (= c!76224 (bvslt j!136 index!984))))

(declare-fun lt!308540 () Unit!22964)

(assert (=> b!659247 (= lt!308540 e!378728)))

(declare-fun c!76225 () Bool)

(assert (=> b!659247 (= c!76225 (bvslt index!984 j!136))))

(declare-fun lt!308531 () Unit!22964)

(assert (=> b!659247 (= lt!308531 e!378722)))

(assert (=> b!659247 false))

(declare-fun b!659248 () Bool)

(declare-fun Unit!22969 () Unit!22964)

(assert (=> b!659248 (= e!378731 Unit!22969)))

(assert (=> b!659248 false))

(declare-fun b!659249 () Bool)

(assert (=> b!659249 (= e!378725 e!378729)))

(declare-fun res!427528 () Bool)

(assert (=> b!659249 (=> (not res!427528) (not e!378729))))

(assert (=> b!659249 (= res!427528 (and (= lt!308535 (Found!7021 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18581 a!2986) index!984) (select (arr!18581 a!2986) j!136))) (not (= (select (arr!18581 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!659249 (= lt!308535 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659250 () Bool)

(declare-fun Unit!22970 () Unit!22964)

(assert (=> b!659250 (= e!378726 Unit!22970)))

(declare-fun res!427524 () Bool)

(assert (=> start!59610 (=> (not res!427524) (not e!378730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59610 (= res!427524 (validMask!0 mask!3053))))

(assert (=> start!59610 e!378730))

(assert (=> start!59610 true))

(declare-fun array_inv!14377 (array!38768) Bool)

(assert (=> start!59610 (array_inv!14377 a!2986)))

(declare-fun b!659237 () Bool)

(declare-fun res!427535 () Bool)

(assert (=> b!659237 (=> (not res!427535) (not e!378730))))

(assert (=> b!659237 (= res!427535 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!659251 () Bool)

(assert (=> b!659251 (= e!378730 e!378720)))

(declare-fun res!427525 () Bool)

(assert (=> b!659251 (=> (not res!427525) (not e!378720))))

(declare-fun lt!308545 () SeekEntryResult!7021)

(assert (=> b!659251 (= res!427525 (or (= lt!308545 (MissingZero!7021 i!1108)) (= lt!308545 (MissingVacant!7021 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38768 (_ BitVec 32)) SeekEntryResult!7021)

(assert (=> b!659251 (= lt!308545 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!659252 () Bool)

(declare-fun res!427527 () Bool)

(assert (=> b!659252 (=> (not res!427527) (not e!378730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!659252 (= res!427527 (validKeyInArray!0 k!1786))))

(declare-fun b!659253 () Bool)

(declare-fun Unit!22971 () Unit!22964)

(assert (=> b!659253 (= e!378731 Unit!22971)))

(declare-fun b!659254 () Bool)

(declare-fun Unit!22972 () Unit!22964)

(assert (=> b!659254 (= e!378728 Unit!22972)))

(declare-fun b!659255 () Bool)

(declare-fun res!427531 () Bool)

(assert (=> b!659255 (=> (not res!427531) (not e!378720))))

(assert (=> b!659255 (= res!427531 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18581 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659256 () Bool)

(declare-fun Unit!22973 () Unit!22964)

(assert (=> b!659256 (= e!378722 Unit!22973)))

(declare-fun b!659257 () Bool)

(assert (=> b!659257 (= e!378719 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) index!984))))

(declare-fun b!659258 () Bool)

(declare-fun res!427526 () Bool)

(assert (=> b!659258 (=> (not res!427526) (not e!378730))))

(assert (=> b!659258 (= res!427526 (validKeyInArray!0 (select (arr!18581 a!2986) j!136)))))

(assert (= (and start!59610 res!427524) b!659243))

(assert (= (and b!659243 res!427538) b!659258))

(assert (= (and b!659258 res!427526) b!659252))

(assert (= (and b!659252 res!427527) b!659237))

(assert (= (and b!659237 res!427535) b!659251))

(assert (= (and b!659251 res!427525) b!659246))

(assert (= (and b!659246 res!427534) b!659235))

(assert (= (and b!659235 res!427533) b!659255))

(assert (= (and b!659255 res!427531) b!659241))

(assert (= (and b!659241 res!427529) b!659249))

(assert (= (and b!659249 res!427528) b!659238))

(assert (= (and b!659238 res!427537) b!659240))

(assert (= (and b!659238 c!76226) b!659248))

(assert (= (and b!659238 (not c!76226)) b!659253))

(assert (= (and b!659238 c!76223) b!659247))

(assert (= (and b!659238 (not c!76223)) b!659250))

(assert (= (and b!659247 res!427536) b!659242))

(assert (= (and b!659242 (not res!427532)) b!659245))

(assert (= (and b!659245 res!427523) b!659244))

(assert (= (and b!659247 c!76224) b!659239))

(assert (= (and b!659247 (not c!76224)) b!659254))

(assert (= (and b!659247 c!76225) b!659236))

(assert (= (and b!659247 (not c!76225)) b!659256))

(assert (= (and b!659236 res!427530) b!659257))

(declare-fun m!632197 () Bool)

(assert (=> b!659252 m!632197))

(declare-fun m!632199 () Bool)

(assert (=> start!59610 m!632199))

(declare-fun m!632201 () Bool)

(assert (=> start!59610 m!632201))

(declare-fun m!632203 () Bool)

(assert (=> b!659245 m!632203))

(assert (=> b!659245 m!632203))

(declare-fun m!632205 () Bool)

(assert (=> b!659245 m!632205))

(assert (=> b!659236 m!632203))

(declare-fun m!632207 () Bool)

(assert (=> b!659236 m!632207))

(assert (=> b!659236 m!632203))

(declare-fun m!632209 () Bool)

(assert (=> b!659236 m!632209))

(declare-fun m!632211 () Bool)

(assert (=> b!659236 m!632211))

(declare-fun m!632213 () Bool)

(assert (=> b!659236 m!632213))

(assert (=> b!659236 m!632203))

(assert (=> b!659236 m!632205))

(assert (=> b!659236 m!632203))

(declare-fun m!632215 () Bool)

(assert (=> b!659236 m!632215))

(declare-fun m!632217 () Bool)

(assert (=> b!659236 m!632217))

(declare-fun m!632219 () Bool)

(assert (=> b!659236 m!632219))

(assert (=> b!659236 m!632203))

(declare-fun m!632221 () Bool)

(assert (=> b!659235 m!632221))

(assert (=> b!659257 m!632203))

(assert (=> b!659257 m!632203))

(declare-fun m!632223 () Bool)

(assert (=> b!659257 m!632223))

(assert (=> b!659244 m!632203))

(assert (=> b!659244 m!632203))

(assert (=> b!659244 m!632223))

(declare-fun m!632225 () Bool)

(assert (=> b!659249 m!632225))

(assert (=> b!659249 m!632203))

(assert (=> b!659249 m!632203))

(declare-fun m!632227 () Bool)

(assert (=> b!659249 m!632227))

(declare-fun m!632229 () Bool)

(assert (=> b!659246 m!632229))

(declare-fun m!632231 () Bool)

(assert (=> b!659255 m!632231))

(declare-fun m!632233 () Bool)

(assert (=> b!659241 m!632233))

(declare-fun m!632235 () Bool)

(assert (=> b!659241 m!632235))

(declare-fun m!632237 () Bool)

(assert (=> b!659251 m!632237))

(assert (=> b!659258 m!632203))

(assert (=> b!659258 m!632203))

(declare-fun m!632239 () Bool)

(assert (=> b!659258 m!632239))

(declare-fun m!632241 () Bool)

(assert (=> b!659238 m!632241))

(declare-fun m!632243 () Bool)

(assert (=> b!659238 m!632243))

(assert (=> b!659238 m!632203))

(assert (=> b!659238 m!632233))

(assert (=> b!659238 m!632203))

(declare-fun m!632245 () Bool)

(assert (=> b!659238 m!632245))

(declare-fun m!632247 () Bool)

(assert (=> b!659238 m!632247))

(declare-fun m!632249 () Bool)

(assert (=> b!659238 m!632249))

(declare-fun m!632251 () Bool)

(assert (=> b!659238 m!632251))

(assert (=> b!659239 m!632203))

(declare-fun m!632253 () Bool)

(assert (=> b!659239 m!632253))

(assert (=> b!659239 m!632203))

(declare-fun m!632255 () Bool)

(assert (=> b!659239 m!632255))

(declare-fun m!632257 () Bool)

(assert (=> b!659239 m!632257))

(assert (=> b!659239 m!632203))

(declare-fun m!632259 () Bool)

(assert (=> b!659239 m!632259))

(assert (=> b!659239 m!632217))

(assert (=> b!659239 m!632203))

(declare-fun m!632261 () Bool)

(assert (=> b!659239 m!632261))

(assert (=> b!659239 m!632211))

(declare-fun m!632263 () Bool)

(assert (=> b!659237 m!632263))

(assert (=> b!659247 m!632233))

(declare-fun m!632265 () Bool)

(assert (=> b!659247 m!632265))

(assert (=> b!659247 m!632203))

(push 1)

(assert (not b!659239))

(assert (not b!659257))

(assert (not b!659251))

(assert (not b!659245))

(assert (not b!659235))

(assert (not b!659236))

(assert (not b!659246))

(assert (not start!59610))

(assert (not b!659252))

(assert (not b!659244))

(assert (not b!659238))

(assert (not b!659249))

(assert (not b!659258))

(assert (not b!659237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92971 () Bool)

(assert (=> d!92971 (arrayNoDuplicates!0 lt!308536 j!136 Nil!12619)))

(declare-fun lt!308566 () Unit!22964)

(declare-fun choose!39 (array!38768 (_ BitVec 32) (_ BitVec 32)) Unit!22964)

(assert (=> d!92971 (= lt!308566 (choose!39 lt!308536 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92971 (bvslt (size!18945 lt!308536) #b01111111111111111111111111111111)))

(assert (=> d!92971 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308536 #b00000000000000000000000000000000 j!136) lt!308566)))

(declare-fun bs!19604 () Bool)

(assert (= bs!19604 d!92971))

(assert (=> bs!19604 m!632255))

(declare-fun m!632303 () Bool)

(assert (=> bs!19604 m!632303))

(assert (=> b!659239 d!92971))

(declare-fun d!92973 () Bool)

(declare-fun res!427566 () Bool)

(declare-fun e!378764 () Bool)

(assert (=> d!92973 (=> res!427566 e!378764)))

(assert (=> d!92973 (= res!427566 (= (select (arr!18581 lt!308536) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18581 a!2986) j!136)))))

(assert (=> d!92973 (= (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!378764)))

(declare-fun b!659294 () Bool)

(declare-fun e!378765 () Bool)

(assert (=> b!659294 (= e!378764 e!378765)))

(declare-fun res!427567 () Bool)

(assert (=> b!659294 (=> (not res!427567) (not e!378765))))

(assert (=> b!659294 (= res!427567 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18945 lt!308536)))))

(declare-fun b!659295 () Bool)

(assert (=> b!659295 (= e!378765 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92973 (not res!427566)) b!659294))

(assert (= (and b!659294 res!427567) b!659295))

(declare-fun m!632305 () Bool)

(assert (=> d!92973 m!632305))

(assert (=> b!659295 m!632203))

(declare-fun m!632307 () Bool)

(assert (=> b!659295 m!632307))

(assert (=> b!659239 d!92973))

(declare-fun b!659318 () Bool)

(declare-fun e!378781 () Bool)

(declare-fun call!33894 () Bool)

(assert (=> b!659318 (= e!378781 call!33894)))

(declare-fun b!659319 () Bool)

(assert (=> b!659319 (= e!378781 call!33894)))

(declare-fun b!659320 () Bool)

(declare-fun e!378780 () Bool)

(declare-fun contains!3198 (List!12622 (_ BitVec 64)) Bool)

(assert (=> b!659320 (= e!378780 (contains!3198 Nil!12619 (select (arr!18581 lt!308536) #b00000000000000000000000000000000)))))

(declare-fun b!659321 () Bool)

(declare-fun e!378783 () Bool)

(declare-fun e!378782 () Bool)

(assert (=> b!659321 (= e!378783 e!378782)))

(declare-fun res!427575 () Bool)

(assert (=> b!659321 (=> (not res!427575) (not e!378782))))

(assert (=> b!659321 (= res!427575 (not e!378780))))

(declare-fun res!427576 () Bool)

(assert (=> b!659321 (=> (not res!427576) (not e!378780))))

(assert (=> b!659321 (= res!427576 (validKeyInArray!0 (select (arr!18581 lt!308536) #b00000000000000000000000000000000)))))

(declare-fun b!659322 () Bool)

(assert (=> b!659322 (= e!378782 e!378781)))

(declare-fun c!76239 () Bool)

(assert (=> b!659322 (= c!76239 (validKeyInArray!0 (select (arr!18581 lt!308536) #b00000000000000000000000000000000)))))

(declare-fun bm!33891 () Bool)

(assert (=> bm!33891 (= call!33894 (arrayNoDuplicates!0 lt!308536 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76239 (Cons!12618 (select (arr!18581 lt!308536) #b00000000000000000000000000000000) Nil!12619) Nil!12619)))))

(declare-fun d!92975 () Bool)

(declare-fun res!427574 () Bool)

(assert (=> d!92975 (=> res!427574 e!378783)))

(assert (=> d!92975 (= res!427574 (bvsge #b00000000000000000000000000000000 (size!18945 lt!308536)))))

(assert (=> d!92975 (= (arrayNoDuplicates!0 lt!308536 #b00000000000000000000000000000000 Nil!12619) e!378783)))

(assert (= (and d!92975 (not res!427574)) b!659321))

(assert (= (and b!659321 res!427576) b!659320))

(assert (= (and b!659321 res!427575) b!659322))

(assert (= (and b!659322 c!76239) b!659318))

(assert (= (and b!659322 (not c!76239)) b!659319))

(assert (= (or b!659318 b!659319) bm!33891))

(declare-fun m!632309 () Bool)

(assert (=> b!659320 m!632309))

(assert (=> b!659320 m!632309))

(declare-fun m!632311 () Bool)

(assert (=> b!659320 m!632311))

(assert (=> b!659321 m!632309))

(assert (=> b!659321 m!632309))

(declare-fun m!632313 () Bool)

(assert (=> b!659321 m!632313))

(assert (=> b!659322 m!632309))

(assert (=> b!659322 m!632309))

(assert (=> b!659322 m!632313))

(assert (=> bm!33891 m!632309))

(declare-fun m!632315 () Bool)

(assert (=> bm!33891 m!632315))

(assert (=> b!659239 d!92975))

(declare-fun b!659323 () Bool)

(declare-fun e!378785 () Bool)

(declare-fun call!33895 () Bool)

(assert (=> b!659323 (= e!378785 call!33895)))

(declare-fun b!659324 () Bool)

(assert (=> b!659324 (= e!378785 call!33895)))

(declare-fun b!659325 () Bool)

(declare-fun e!378784 () Bool)

(assert (=> b!659325 (= e!378784 (contains!3198 Nil!12619 (select (arr!18581 lt!308536) j!136)))))

(declare-fun b!659326 () Bool)

(declare-fun e!378787 () Bool)

(declare-fun e!378786 () Bool)

(assert (=> b!659326 (= e!378787 e!378786)))

(declare-fun res!427578 () Bool)

(assert (=> b!659326 (=> (not res!427578) (not e!378786))))

(assert (=> b!659326 (= res!427578 (not e!378784))))

(declare-fun res!427579 () Bool)

(assert (=> b!659326 (=> (not res!427579) (not e!378784))))

(assert (=> b!659326 (= res!427579 (validKeyInArray!0 (select (arr!18581 lt!308536) j!136)))))

(declare-fun b!659327 () Bool)

(assert (=> b!659327 (= e!378786 e!378785)))

(declare-fun c!76240 () Bool)

(assert (=> b!659327 (= c!76240 (validKeyInArray!0 (select (arr!18581 lt!308536) j!136)))))

(declare-fun bm!33892 () Bool)

(assert (=> bm!33892 (= call!33895 (arrayNoDuplicates!0 lt!308536 (bvadd j!136 #b00000000000000000000000000000001) (ite c!76240 (Cons!12618 (select (arr!18581 lt!308536) j!136) Nil!12619) Nil!12619)))))

(declare-fun d!92979 () Bool)

(declare-fun res!427577 () Bool)

(assert (=> d!92979 (=> res!427577 e!378787)))

(assert (=> d!92979 (= res!427577 (bvsge j!136 (size!18945 lt!308536)))))

(assert (=> d!92979 (= (arrayNoDuplicates!0 lt!308536 j!136 Nil!12619) e!378787)))

(assert (= (and d!92979 (not res!427577)) b!659326))

(assert (= (and b!659326 res!427579) b!659325))

(assert (= (and b!659326 res!427578) b!659327))

(assert (= (and b!659327 c!76240) b!659323))

(assert (= (and b!659327 (not c!76240)) b!659324))

(assert (= (or b!659323 b!659324) bm!33892))

(declare-fun m!632317 () Bool)

(assert (=> b!659325 m!632317))

(assert (=> b!659325 m!632317))

(declare-fun m!632319 () Bool)

(assert (=> b!659325 m!632319))

(assert (=> b!659326 m!632317))

(assert (=> b!659326 m!632317))

(declare-fun m!632321 () Bool)

(assert (=> b!659326 m!632321))

(assert (=> b!659327 m!632317))

(assert (=> b!659327 m!632317))

(assert (=> b!659327 m!632321))

(assert (=> bm!33892 m!632317))

(declare-fun m!632323 () Bool)

(assert (=> bm!33892 m!632323))

(assert (=> b!659239 d!92979))

(declare-fun d!92981 () Bool)

(assert (=> d!92981 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18945 lt!308536)) (not (= (select (arr!18581 lt!308536) j!136) (select (arr!18581 a!2986) j!136))))))

(declare-fun lt!308583 () Unit!22964)

(declare-fun choose!21 (array!38768 (_ BitVec 64) (_ BitVec 32) List!12622) Unit!22964)

(assert (=> d!92981 (= lt!308583 (choose!21 lt!308536 (select (arr!18581 a!2986) j!136) j!136 Nil!12619))))

(assert (=> d!92981 (bvslt (size!18945 lt!308536) #b01111111111111111111111111111111)))

(assert (=> d!92981 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308536 (select (arr!18581 a!2986) j!136) j!136 Nil!12619) lt!308583)))

(declare-fun bs!19605 () Bool)

(assert (= bs!19605 d!92981))

(assert (=> bs!19605 m!632317))

(assert (=> bs!19605 m!632203))

(declare-fun m!632341 () Bool)

(assert (=> bs!19605 m!632341))

(assert (=> b!659239 d!92981))

(declare-fun d!92987 () Bool)

(assert (=> d!92987 (arrayContainsKey!0 lt!308536 (select (arr!18581 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308586 () Unit!22964)

(declare-fun choose!114 (array!38768 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22964)

(assert (=> d!92987 (= lt!308586 (choose!114 lt!308536 (select (arr!18581 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92987 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92987 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308536 (select (arr!18581 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!308586)))

(declare-fun bs!19606 () Bool)

(assert (= bs!19606 d!92987))

(assert (=> bs!19606 m!632203))

(assert (=> bs!19606 m!632261))

(assert (=> bs!19606 m!632203))

(declare-fun m!632343 () Bool)

(assert (=> bs!19606 m!632343))

(assert (=> b!659239 d!92987))

(declare-fun d!92989 () Bool)

(declare-fun e!378809 () Bool)

(assert (=> d!92989 e!378809))

(declare-fun res!427592 () Bool)

(assert (=> d!92989 (=> (not res!427592) (not e!378809))))

(assert (=> d!92989 (= res!427592 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18945 a!2986))))))

(declare-fun lt!308592 () Unit!22964)

(declare-fun choose!41 (array!38768 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12622) Unit!22964)

(assert (=> d!92989 (= lt!308592 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12619))))

(assert (=> d!92989 (bvslt (size!18945 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92989 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12619) lt!308592)))

(declare-fun b!659358 () Bool)

(assert (=> b!659358 (= e!378809 (arrayNoDuplicates!0 (array!38769 (store (arr!18581 a!2986) i!1108 k!1786) (size!18945 a!2986)) #b00000000000000000000000000000000 Nil!12619))))

(assert (= (and d!92989 res!427592) b!659358))

(declare-fun m!632357 () Bool)

(assert (=> d!92989 m!632357))

(assert (=> b!659358 m!632233))

(declare-fun m!632359 () Bool)

(assert (=> b!659358 m!632359))

(assert (=> b!659239 d!92989))

(declare-fun b!659396 () Bool)

(declare-fun e!378833 () SeekEntryResult!7021)

(assert (=> b!659396 (= e!378833 Undefined!7021)))

(declare-fun b!659397 () Bool)

(declare-fun e!378832 () SeekEntryResult!7021)

(assert (=> b!659397 (= e!378833 e!378832)))

(declare-fun c!76267 () Bool)

(declare-fun lt!308606 () (_ BitVec 64))

(assert (=> b!659397 (= c!76267 (= lt!308606 lt!308544))))

(declare-fun b!659398 () Bool)

(declare-fun e!378834 () SeekEntryResult!7021)

(assert (=> b!659398 (= e!378834 (MissingVacant!7021 vacantSpotIndex!68))))

(declare-fun b!659399 () Bool)

(declare-fun c!76266 () Bool)

(assert (=> b!659399 (= c!76266 (= lt!308606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659399 (= e!378832 e!378834)))

(declare-fun lt!308607 () SeekEntryResult!7021)

(declare-fun d!92993 () Bool)

(assert (=> d!92993 (and (or (is-Undefined!7021 lt!308607) (not (is-Found!7021 lt!308607)) (and (bvsge (index!30450 lt!308607) #b00000000000000000000000000000000) (bvslt (index!30450 lt!308607) (size!18945 lt!308536)))) (or (is-Undefined!7021 lt!308607) (is-Found!7021 lt!308607) (not (is-MissingVacant!7021 lt!308607)) (not (= (index!30452 lt!308607) vacantSpotIndex!68)) (and (bvsge (index!30452 lt!308607) #b00000000000000000000000000000000) (bvslt (index!30452 lt!308607) (size!18945 lt!308536)))) (or (is-Undefined!7021 lt!308607) (ite (is-Found!7021 lt!308607) (= (select (arr!18581 lt!308536) (index!30450 lt!308607)) lt!308544) (and (is-MissingVacant!7021 lt!308607) (= (index!30452 lt!308607) vacantSpotIndex!68) (= (select (arr!18581 lt!308536) (index!30452 lt!308607)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92993 (= lt!308607 e!378833)))

(declare-fun c!76265 () Bool)

(assert (=> d!92993 (= c!76265 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92993 (= lt!308606 (select (arr!18581 lt!308536) lt!308532))))

(assert (=> d!92993 (validMask!0 mask!3053)))

(assert (=> d!92993 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 lt!308544 lt!308536 mask!3053) lt!308607)))

(declare-fun b!659400 () Bool)

(assert (=> b!659400 (= e!378832 (Found!7021 lt!308532))))

(declare-fun b!659401 () Bool)

(assert (=> b!659401 (= e!378834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308532 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!308544 lt!308536 mask!3053))))

(assert (= (and d!92993 c!76265) b!659396))

(assert (= (and d!92993 (not c!76265)) b!659397))

(assert (= (and b!659397 c!76267) b!659400))

(assert (= (and b!659397 (not c!76267)) b!659399))

(assert (= (and b!659399 c!76266) b!659398))

(assert (= (and b!659399 (not c!76266)) b!659401))

(declare-fun m!632379 () Bool)

(assert (=> d!92993 m!632379))

(declare-fun m!632381 () Bool)

(assert (=> d!92993 m!632381))

(declare-fun m!632383 () Bool)

(assert (=> d!92993 m!632383))

(assert (=> d!92993 m!632199))

(declare-fun m!632385 () Bool)

(assert (=> b!659401 m!632385))

(assert (=> b!659401 m!632385))

(declare-fun m!632387 () Bool)

(assert (=> b!659401 m!632387))

(assert (=> b!659238 d!92993))

(declare-fun d!93003 () Bool)

(declare-fun e!378872 () Bool)

(assert (=> d!93003 e!378872))

(declare-fun res!427619 () Bool)

(assert (=> d!93003 (=> (not res!427619) (not e!378872))))

(assert (=> d!93003 (= res!427619 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18945 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18945 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18945 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18945 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18945 a!2986))))))

(declare-fun lt!308630 () Unit!22964)

(declare-fun choose!9 (array!38768 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22964)

(assert (=> d!93003 (= lt!308630 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 mask!3053))))

(assert (=> d!93003 (validMask!0 mask!3053)))

(assert (=> d!93003 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 mask!3053) lt!308630)))

(declare-fun b!659457 () Bool)

(assert (=> b!659457 (= e!378872 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 (select (store (arr!18581 a!2986) i!1108 k!1786) j!136) (array!38769 (store (arr!18581 a!2986) i!1108 k!1786) (size!18945 a!2986)) mask!3053)))))

(assert (= (and d!93003 res!427619) b!659457))

(declare-fun m!632441 () Bool)

(assert (=> d!93003 m!632441))

(assert (=> d!93003 m!632199))

(assert (=> b!659457 m!632203))

(assert (=> b!659457 m!632245))

(assert (=> b!659457 m!632203))

(assert (=> b!659457 m!632241))

(assert (=> b!659457 m!632233))

(assert (=> b!659457 m!632241))

(declare-fun m!632445 () Bool)

(assert (=> b!659457 m!632445))

(assert (=> b!659238 d!93003))

(declare-fun b!659463 () Bool)

(declare-fun e!378878 () SeekEntryResult!7021)

(assert (=> b!659463 (= e!378878 Undefined!7021)))

(declare-fun b!659464 () Bool)

(declare-fun e!378877 () SeekEntryResult!7021)

(assert (=> b!659464 (= e!378878 e!378877)))

(declare-fun c!76289 () Bool)

(declare-fun lt!308631 () (_ BitVec 64))

(assert (=> b!659464 (= c!76289 (= lt!308631 lt!308544))))

(declare-fun b!659465 () Bool)

(declare-fun e!378879 () SeekEntryResult!7021)

(assert (=> b!659465 (= e!378879 (MissingVacant!7021 vacantSpotIndex!68))))

(declare-fun b!659466 () Bool)

(declare-fun c!76288 () Bool)

(assert (=> b!659466 (= c!76288 (= lt!308631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659466 (= e!378877 e!378879)))

(declare-fun d!93027 () Bool)

(declare-fun lt!308632 () SeekEntryResult!7021)

(assert (=> d!93027 (and (or (is-Undefined!7021 lt!308632) (not (is-Found!7021 lt!308632)) (and (bvsge (index!30450 lt!308632) #b00000000000000000000000000000000) (bvslt (index!30450 lt!308632) (size!18945 lt!308536)))) (or (is-Undefined!7021 lt!308632) (is-Found!7021 lt!308632) (not (is-MissingVacant!7021 lt!308632)) (not (= (index!30452 lt!308632) vacantSpotIndex!68)) (and (bvsge (index!30452 lt!308632) #b00000000000000000000000000000000) (bvslt (index!30452 lt!308632) (size!18945 lt!308536)))) (or (is-Undefined!7021 lt!308632) (ite (is-Found!7021 lt!308632) (= (select (arr!18581 lt!308536) (index!30450 lt!308632)) lt!308544) (and (is-MissingVacant!7021 lt!308632) (= (index!30452 lt!308632) vacantSpotIndex!68) (= (select (arr!18581 lt!308536) (index!30452 lt!308632)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!93027 (= lt!308632 e!378878)))

(declare-fun c!76287 () Bool)

(assert (=> d!93027 (= c!76287 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!93027 (= lt!308631 (select (arr!18581 lt!308536) index!984))))

(assert (=> d!93027 (validMask!0 mask!3053)))

(assert (=> d!93027 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308544 lt!308536 mask!3053) lt!308632)))

(declare-fun b!659467 () Bool)

(assert (=> b!659467 (= e!378877 (Found!7021 index!984))))

(declare-fun b!659468 () Bool)

(assert (=> b!659468 (= e!378879 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!308544 lt!308536 mask!3053))))

(assert (= (and d!93027 c!76287) b!659463))

(assert (= (and d!93027 (not c!76287)) b!659464))

(assert (= (and b!659464 c!76289) b!659467))

(assert (= (and b!659464 (not c!76289)) b!659466))

(assert (= (and b!659466 c!76288) b!659465))

(assert (= (and b!659466 (not c!76288)) b!659468))

(declare-fun m!632453 () Bool)

(assert (=> d!93027 m!632453))

(declare-fun m!632455 () Bool)

(assert (=> d!93027 m!632455))

(declare-fun m!632457 () Bool)

(assert (=> d!93027 m!632457))

(assert (=> d!93027 m!632199))

(assert (=> b!659468 m!632249))

(assert (=> b!659468 m!632249))

(declare-fun m!632459 () Bool)

(assert (=> b!659468 m!632459))

(assert (=> b!659238 d!93027))

(declare-fun b!659469 () Bool)

(declare-fun e!378881 () SeekEntryResult!7021)

(assert (=> b!659469 (= e!378881 Undefined!7021)))

(declare-fun b!659470 () Bool)

(declare-fun e!378880 () SeekEntryResult!7021)

(assert (=> b!659470 (= e!378881 e!378880)))

(declare-fun lt!308635 () (_ BitVec 64))

(declare-fun c!76292 () Bool)

(assert (=> b!659470 (= c!76292 (= lt!308635 (select (arr!18581 a!2986) j!136)))))

(declare-fun b!659471 () Bool)

(declare-fun e!378882 () SeekEntryResult!7021)

(assert (=> b!659471 (= e!378882 (MissingVacant!7021 vacantSpotIndex!68))))

(declare-fun b!659472 () Bool)

(declare-fun c!76291 () Bool)

(assert (=> b!659472 (= c!76291 (= lt!308635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659472 (= e!378880 e!378882)))

(declare-fun lt!308636 () SeekEntryResult!7021)

(declare-fun d!93033 () Bool)

(assert (=> d!93033 (and (or (is-Undefined!7021 lt!308636) (not (is-Found!7021 lt!308636)) (and (bvsge (index!30450 lt!308636) #b00000000000000000000000000000000) (bvslt (index!30450 lt!308636) (size!18945 a!2986)))) (or (is-Undefined!7021 lt!308636) (is-Found!7021 lt!308636) (not (is-MissingVacant!7021 lt!308636)) (not (= (index!30452 lt!308636) vacantSpotIndex!68)) (and (bvsge (index!30452 lt!308636) #b00000000000000000000000000000000) (bvslt (index!30452 lt!308636) (size!18945 a!2986)))) (or (is-Undefined!7021 lt!308636) (ite (is-Found!7021 lt!308636) (= (select (arr!18581 a!2986) (index!30450 lt!308636)) (select (arr!18581 a!2986) j!136)) (and (is-MissingVacant!7021 lt!308636) (= (index!30452 lt!308636) vacantSpotIndex!68) (= (select (arr!18581 a!2986) (index!30452 lt!308636)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!93033 (= lt!308636 e!378881)))

(declare-fun c!76290 () Bool)

(assert (=> d!93033 (= c!76290 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!93033 (= lt!308635 (select (arr!18581 a!2986) lt!308532))))

(assert (=> d!93033 (validMask!0 mask!3053)))

(assert (=> d!93033 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308532 vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053) lt!308636)))

(declare-fun b!659473 () Bool)

(assert (=> b!659473 (= e!378880 (Found!7021 lt!308532))))

(declare-fun b!659474 () Bool)

(assert (=> b!659474 (= e!378882 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308532 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!93033 c!76290) b!659469))

(assert (= (and d!93033 (not c!76290)) b!659470))

(assert (= (and b!659470 c!76292) b!659473))

(assert (= (and b!659470 (not c!76292)) b!659472))

(assert (= (and b!659472 c!76291) b!659471))

(assert (= (and b!659472 (not c!76291)) b!659474))

(declare-fun m!632465 () Bool)

(assert (=> d!93033 m!632465))

(declare-fun m!632467 () Bool)

(assert (=> d!93033 m!632467))

(declare-fun m!632469 () Bool)

(assert (=> d!93033 m!632469))

(assert (=> d!93033 m!632199))

(assert (=> b!659474 m!632385))

(assert (=> b!659474 m!632385))

(assert (=> b!659474 m!632203))

(declare-fun m!632477 () Bool)

(assert (=> b!659474 m!632477))

(assert (=> b!659238 d!93033))

(declare-fun d!93039 () Bool)

(declare-fun lt!308642 () (_ BitVec 32))

(assert (=> d!93039 (and (bvsge lt!308642 #b00000000000000000000000000000000) (bvslt lt!308642 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!93039 (= lt!308642 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!93039 (validMask!0 mask!3053)))

(assert (=> d!93039 (= (nextIndex!0 index!984 x!910 mask!3053) lt!308642)))

(declare-fun bs!19613 () Bool)

(assert (= bs!19613 d!93039))

(declare-fun m!632487 () Bool)

(assert (=> bs!19613 m!632487))

(assert (=> bs!19613 m!632199))

(assert (=> b!659238 d!93039))

(declare-fun b!659485 () Bool)

(declare-fun e!378892 () SeekEntryResult!7021)

(assert (=> b!659485 (= e!378892 Undefined!7021)))

(declare-fun b!659486 () Bool)

(declare-fun e!378891 () SeekEntryResult!7021)

(assert (=> b!659486 (= e!378892 e!378891)))

(declare-fun c!76297 () Bool)

(declare-fun lt!308643 () (_ BitVec 64))

(assert (=> b!659486 (= c!76297 (= lt!308643 (select (arr!18581 a!2986) j!136)))))

(declare-fun b!659487 () Bool)

(declare-fun e!378893 () SeekEntryResult!7021)

(assert (=> b!659487 (= e!378893 (MissingVacant!7021 vacantSpotIndex!68))))

(declare-fun b!659488 () Bool)

(declare-fun c!76296 () Bool)

(assert (=> b!659488 (= c!76296 (= lt!308643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659488 (= e!378891 e!378893)))

(declare-fun lt!308644 () SeekEntryResult!7021)

(declare-fun d!93049 () Bool)

(assert (=> d!93049 (and (or (is-Undefined!7021 lt!308644) (not (is-Found!7021 lt!308644)) (and (bvsge (index!30450 lt!308644) #b00000000000000000000000000000000) (bvslt (index!30450 lt!308644) (size!18945 a!2986)))) (or (is-Undefined!7021 lt!308644) (is-Found!7021 lt!308644) (not (is-MissingVacant!7021 lt!308644)) (not (= (index!30452 lt!308644) vacantSpotIndex!68)) (and (bvsge (index!30452 lt!308644) #b00000000000000000000000000000000) (bvslt (index!30452 lt!308644) (size!18945 a!2986)))) (or (is-Undefined!7021 lt!308644) (ite (is-Found!7021 lt!308644) (= (select (arr!18581 a!2986) (index!30450 lt!308644)) (select (arr!18581 a!2986) j!136)) (and (is-MissingVacant!7021 lt!308644) (= (index!30452 lt!308644) vacantSpotIndex!68) (= (select (arr!18581 a!2986) (index!30452 lt!308644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!93049 (= lt!308644 e!378892)))

(declare-fun c!76295 () Bool)

(assert (=> d!93049 (= c!76295 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!93049 (= lt!308643 (select (arr!18581 a!2986) index!984))))

(assert (=> d!93049 (validMask!0 mask!3053)))

(assert (=> d!93049 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053) lt!308644)))

(declare-fun b!659489 () Bool)

(assert (=> b!659489 (= e!378891 (Found!7021 index!984))))

(declare-fun b!659490 () Bool)

(assert (=> b!659490 (= e!378893 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18581 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!93049 c!76295) b!659485))

(assert (= (and d!93049 (not c!76295)) b!659486))

(assert (= (and b!659486 c!76297) b!659489))

(assert (= (and b!659486 (not c!76297)) b!659488))

(assert (= (and b!659488 c!76296) b!659487))

(assert (= (and b!659488 (not c!76296)) b!659490))

(declare-fun m!632489 () Bool)

(assert (=> d!93049 m!632489))

(declare-fun m!632491 () Bool)

(assert (=> d!93049 m!632491))

(assert (=> d!93049 m!632225))

(assert (=> d!93049 m!632199))

(assert (=> b!659490 m!632249))

(assert (=> b!659490 m!632249))

(assert (=> b!659490 m!632203))

(declare-fun m!632493 () Bool)

(assert (=> b!659490 m!632493))

(assert (=> b!659249 d!93049))

(declare-fun d!93051 () Bool)

(assert (=> d!93051 (= (validKeyInArray!0 (select (arr!18581 a!2986) j!136)) (and (not (= (select (arr!18581 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18581 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!659258 d!93051))

(declare-fun d!93053 () Bool)

(declare-fun res!427631 () Bool)

(declare-fun e!378896 () Bool)

(assert (=> d!93053 (=> res!427631 e!378896)))

(assert (=> d!93053 (= res!427631 (= (select (arr!18581 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!93053 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!378896)))

(declare-fun b!659493 () Bool)

(declare-fun e!378897 () Bool)

(assert (=> b!659493 (= e!378896 e!378897)))

(declare-fun res!427632 () Bool)

(assert (=> b!659493 (=> (not res!427632) (not e!378897))))

(assert (=> b!659493 (= res!427632 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18945 a!2986)))))

(declare-fun b!659494 () Bool)

(assert (=> b!659494 (= e!378897 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93053 (not res!427631)) b!659493))

(assert (= (and b!659493 res!427632) b!659494))

(declare-fun m!632495 () Bool)

(assert (=> d!93053 m!632495))

(declare-fun m!632497 () Bool)

(assert (=> b!659494 m!632497))

(assert (=> b!659237 d!93053))

(declare-fun d!93055 () Bool)

(assert (=> d!93055 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

