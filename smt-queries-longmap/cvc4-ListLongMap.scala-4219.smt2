; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57912 () Bool)

(assert start!57912)

(declare-fun b!640373 () Bool)

(declare-datatypes ((Unit!21650 0))(
  ( (Unit!21651) )
))
(declare-fun e!366575 () Unit!21650)

(declare-fun Unit!21652 () Unit!21650)

(assert (=> b!640373 (= e!366575 Unit!21652)))

(declare-fun res!414655 () Bool)

(declare-fun e!366568 () Bool)

(assert (=> start!57912 (=> (not res!414655) (not e!366568))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57912 (= res!414655 (validMask!0 mask!3053))))

(assert (=> start!57912 e!366568))

(assert (=> start!57912 true))

(declare-datatypes ((array!38339 0))(
  ( (array!38340 (arr!18389 (Array (_ BitVec 32) (_ BitVec 64))) (size!18753 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38339)

(declare-fun array_inv!14185 (array!38339) Bool)

(assert (=> start!57912 (array_inv!14185 a!2986)))

(declare-fun b!640374 () Bool)

(declare-fun e!366573 () Bool)

(declare-datatypes ((SeekEntryResult!6829 0))(
  ( (MissingZero!6829 (index!29636 (_ BitVec 32))) (Found!6829 (index!29637 (_ BitVec 32))) (Intermediate!6829 (undefined!7641 Bool) (index!29638 (_ BitVec 32)) (x!58393 (_ BitVec 32))) (Undefined!6829) (MissingVacant!6829 (index!29639 (_ BitVec 32))) )
))
(declare-fun lt!296348 () SeekEntryResult!6829)

(declare-fun lt!296355 () SeekEntryResult!6829)

(assert (=> b!640374 (= e!366573 (= lt!296348 lt!296355))))

(declare-fun b!640375 () Bool)

(declare-fun e!366566 () Bool)

(declare-fun e!366576 () Bool)

(assert (=> b!640375 (= e!366566 e!366576)))

(declare-fun res!414659 () Bool)

(assert (=> b!640375 (=> res!414659 e!366576)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296356 () (_ BitVec 64))

(declare-fun lt!296349 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640375 (= res!414659 (or (not (= (select (arr!18389 a!2986) j!136) lt!296356)) (not (= (select (arr!18389 a!2986) j!136) lt!296349)) (bvsge j!136 index!984)))))

(declare-fun e!366571 () Bool)

(assert (=> b!640375 e!366571))

(declare-fun res!414658 () Bool)

(assert (=> b!640375 (=> (not res!414658) (not e!366571))))

(assert (=> b!640375 (= res!414658 (= lt!296349 (select (arr!18389 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640375 (= lt!296349 (select (store (arr!18389 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640376 () Bool)

(declare-fun res!414646 () Bool)

(declare-fun e!366569 () Bool)

(assert (=> b!640376 (=> (not res!414646) (not e!366569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38339 (_ BitVec 32)) Bool)

(assert (=> b!640376 (= res!414646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640377 () Bool)

(declare-fun e!366570 () Bool)

(assert (=> b!640377 (= e!366569 e!366570)))

(declare-fun res!414651 () Bool)

(assert (=> b!640377 (=> (not res!414651) (not e!366570))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!640377 (= res!414651 (= (select (store (arr!18389 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!296359 () array!38339)

(assert (=> b!640377 (= lt!296359 (array!38340 (store (arr!18389 a!2986) i!1108 k!1786) (size!18753 a!2986)))))

(declare-fun b!640378 () Bool)

(assert (=> b!640378 (= e!366568 e!366569)))

(declare-fun res!414652 () Bool)

(assert (=> b!640378 (=> (not res!414652) (not e!366569))))

(declare-fun lt!296358 () SeekEntryResult!6829)

(assert (=> b!640378 (= res!414652 (or (= lt!296358 (MissingZero!6829 i!1108)) (= lt!296358 (MissingVacant!6829 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38339 (_ BitVec 32)) SeekEntryResult!6829)

(assert (=> b!640378 (= lt!296358 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640379 () Bool)

(declare-fun e!366567 () Bool)

(assert (=> b!640379 (= e!366570 e!366567)))

(declare-fun res!414657 () Bool)

(assert (=> b!640379 (=> (not res!414657) (not e!366567))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640379 (= res!414657 (and (= lt!296348 (Found!6829 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18389 a!2986) index!984) (select (arr!18389 a!2986) j!136))) (not (= (select (arr!18389 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38339 (_ BitVec 32)) SeekEntryResult!6829)

(assert (=> b!640379 (= lt!296348 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18389 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640380 () Bool)

(declare-fun res!414650 () Bool)

(assert (=> b!640380 (=> (not res!414650) (not e!366568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640380 (= res!414650 (validKeyInArray!0 (select (arr!18389 a!2986) j!136)))))

(declare-fun b!640381 () Bool)

(declare-fun e!366565 () Bool)

(declare-fun arrayContainsKey!0 (array!38339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640381 (= e!366565 (arrayContainsKey!0 lt!296359 (select (arr!18389 a!2986) j!136) index!984))))

(declare-fun b!640382 () Bool)

(declare-fun res!414643 () Bool)

(assert (=> b!640382 (=> (not res!414643) (not e!366568))))

(assert (=> b!640382 (= res!414643 (and (= (size!18753 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18753 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18753 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640383 () Bool)

(assert (=> b!640383 (= e!366576 true)))

(declare-datatypes ((List!12430 0))(
  ( (Nil!12427) (Cons!12426 (h!13471 (_ BitVec 64)) (t!18658 List!12430)) )
))
(declare-fun arrayNoDuplicates!0 (array!38339 (_ BitVec 32) List!12430) Bool)

(assert (=> b!640383 (arrayNoDuplicates!0 lt!296359 j!136 Nil!12427)))

(declare-fun lt!296357 () Unit!21650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38339 (_ BitVec 32) (_ BitVec 32)) Unit!21650)

(assert (=> b!640383 (= lt!296357 (lemmaNoDuplicateFromThenFromBigger!0 lt!296359 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640383 (arrayNoDuplicates!0 lt!296359 #b00000000000000000000000000000000 Nil!12427)))

(declare-fun lt!296352 () Unit!21650)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12430) Unit!21650)

(assert (=> b!640383 (= lt!296352 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12427))))

(assert (=> b!640383 (arrayContainsKey!0 lt!296359 (select (arr!18389 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296350 () Unit!21650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21650)

(assert (=> b!640383 (= lt!296350 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296359 (select (arr!18389 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640384 () Bool)

(declare-fun res!414648 () Bool)

(assert (=> b!640384 (=> (not res!414648) (not e!366568))))

(assert (=> b!640384 (= res!414648 (validKeyInArray!0 k!1786))))

(declare-fun b!640385 () Bool)

(declare-fun res!414649 () Bool)

(assert (=> b!640385 (=> (not res!414649) (not e!366569))))

(assert (=> b!640385 (= res!414649 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18389 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640386 () Bool)

(assert (=> b!640386 (= e!366567 (not e!366566))))

(declare-fun res!414645 () Bool)

(assert (=> b!640386 (=> res!414645 e!366566)))

(declare-fun lt!296353 () SeekEntryResult!6829)

(assert (=> b!640386 (= res!414645 (not (= lt!296353 (Found!6829 index!984))))))

(declare-fun lt!296347 () Unit!21650)

(assert (=> b!640386 (= lt!296347 e!366575)))

(declare-fun c!73232 () Bool)

(assert (=> b!640386 (= c!73232 (= lt!296353 Undefined!6829))))

(assert (=> b!640386 (= lt!296353 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296356 lt!296359 mask!3053))))

(assert (=> b!640386 e!366573))

(declare-fun res!414653 () Bool)

(assert (=> b!640386 (=> (not res!414653) (not e!366573))))

(declare-fun lt!296354 () (_ BitVec 32))

(assert (=> b!640386 (= res!414653 (= lt!296355 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296354 vacantSpotIndex!68 lt!296356 lt!296359 mask!3053)))))

(assert (=> b!640386 (= lt!296355 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296354 vacantSpotIndex!68 (select (arr!18389 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640386 (= lt!296356 (select (store (arr!18389 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296351 () Unit!21650)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21650)

(assert (=> b!640386 (= lt!296351 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296354 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640386 (= lt!296354 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640387 () Bool)

(declare-fun e!366572 () Bool)

(assert (=> b!640387 (= e!366571 e!366572)))

(declare-fun res!414654 () Bool)

(assert (=> b!640387 (=> res!414654 e!366572)))

(assert (=> b!640387 (= res!414654 (or (not (= (select (arr!18389 a!2986) j!136) lt!296356)) (not (= (select (arr!18389 a!2986) j!136) lt!296349)) (bvsge j!136 index!984)))))

(declare-fun b!640388 () Bool)

(assert (=> b!640388 (= e!366572 e!366565)))

(declare-fun res!414656 () Bool)

(assert (=> b!640388 (=> (not res!414656) (not e!366565))))

(assert (=> b!640388 (= res!414656 (arrayContainsKey!0 lt!296359 (select (arr!18389 a!2986) j!136) j!136))))

(declare-fun b!640389 () Bool)

(declare-fun res!414647 () Bool)

(assert (=> b!640389 (=> (not res!414647) (not e!366568))))

(assert (=> b!640389 (= res!414647 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640390 () Bool)

(declare-fun Unit!21653 () Unit!21650)

(assert (=> b!640390 (= e!366575 Unit!21653)))

(assert (=> b!640390 false))

(declare-fun b!640391 () Bool)

(declare-fun res!414644 () Bool)

(assert (=> b!640391 (=> (not res!414644) (not e!366569))))

(assert (=> b!640391 (= res!414644 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12427))))

(assert (= (and start!57912 res!414655) b!640382))

(assert (= (and b!640382 res!414643) b!640380))

(assert (= (and b!640380 res!414650) b!640384))

(assert (= (and b!640384 res!414648) b!640389))

(assert (= (and b!640389 res!414647) b!640378))

(assert (= (and b!640378 res!414652) b!640376))

(assert (= (and b!640376 res!414646) b!640391))

(assert (= (and b!640391 res!414644) b!640385))

(assert (= (and b!640385 res!414649) b!640377))

(assert (= (and b!640377 res!414651) b!640379))

(assert (= (and b!640379 res!414657) b!640386))

(assert (= (and b!640386 res!414653) b!640374))

(assert (= (and b!640386 c!73232) b!640390))

(assert (= (and b!640386 (not c!73232)) b!640373))

(assert (= (and b!640386 (not res!414645)) b!640375))

(assert (= (and b!640375 res!414658) b!640387))

(assert (= (and b!640387 (not res!414654)) b!640388))

(assert (= (and b!640388 res!414656) b!640381))

(assert (= (and b!640375 (not res!414659)) b!640383))

(declare-fun m!614203 () Bool)

(assert (=> b!640388 m!614203))

(assert (=> b!640388 m!614203))

(declare-fun m!614205 () Bool)

(assert (=> b!640388 m!614205))

(declare-fun m!614207 () Bool)

(assert (=> b!640378 m!614207))

(declare-fun m!614209 () Bool)

(assert (=> start!57912 m!614209))

(declare-fun m!614211 () Bool)

(assert (=> start!57912 m!614211))

(declare-fun m!614213 () Bool)

(assert (=> b!640384 m!614213))

(declare-fun m!614215 () Bool)

(assert (=> b!640389 m!614215))

(assert (=> b!640383 m!614203))

(declare-fun m!614217 () Bool)

(assert (=> b!640383 m!614217))

(declare-fun m!614219 () Bool)

(assert (=> b!640383 m!614219))

(assert (=> b!640383 m!614203))

(declare-fun m!614221 () Bool)

(assert (=> b!640383 m!614221))

(declare-fun m!614223 () Bool)

(assert (=> b!640383 m!614223))

(assert (=> b!640383 m!614203))

(declare-fun m!614225 () Bool)

(assert (=> b!640383 m!614225))

(declare-fun m!614227 () Bool)

(assert (=> b!640383 m!614227))

(assert (=> b!640381 m!614203))

(assert (=> b!640381 m!614203))

(declare-fun m!614229 () Bool)

(assert (=> b!640381 m!614229))

(declare-fun m!614231 () Bool)

(assert (=> b!640385 m!614231))

(assert (=> b!640387 m!614203))

(declare-fun m!614233 () Bool)

(assert (=> b!640386 m!614233))

(assert (=> b!640386 m!614203))

(assert (=> b!640386 m!614203))

(declare-fun m!614235 () Bool)

(assert (=> b!640386 m!614235))

(declare-fun m!614237 () Bool)

(assert (=> b!640386 m!614237))

(declare-fun m!614239 () Bool)

(assert (=> b!640386 m!614239))

(declare-fun m!614241 () Bool)

(assert (=> b!640386 m!614241))

(declare-fun m!614243 () Bool)

(assert (=> b!640386 m!614243))

(declare-fun m!614245 () Bool)

(assert (=> b!640386 m!614245))

(declare-fun m!614247 () Bool)

(assert (=> b!640391 m!614247))

(declare-fun m!614249 () Bool)

(assert (=> b!640376 m!614249))

(assert (=> b!640377 m!614245))

(declare-fun m!614251 () Bool)

(assert (=> b!640377 m!614251))

(declare-fun m!614253 () Bool)

(assert (=> b!640379 m!614253))

(assert (=> b!640379 m!614203))

(assert (=> b!640379 m!614203))

(declare-fun m!614255 () Bool)

(assert (=> b!640379 m!614255))

(assert (=> b!640380 m!614203))

(assert (=> b!640380 m!614203))

(declare-fun m!614257 () Bool)

(assert (=> b!640380 m!614257))

(assert (=> b!640375 m!614203))

(assert (=> b!640375 m!614245))

(declare-fun m!614259 () Bool)

(assert (=> b!640375 m!614259))

(push 1)

