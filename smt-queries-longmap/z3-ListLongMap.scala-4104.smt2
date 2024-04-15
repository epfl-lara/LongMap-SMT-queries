; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56106 () Bool)

(assert start!56106)

(declare-fun b!619627 () Bool)

(declare-fun e!355356 () Bool)

(assert (=> b!619627 (= e!355356 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37590 0))(
  ( (array!37591 (arr!18041 (Array (_ BitVec 32) (_ BitVec 64))) (size!18406 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37590)

(assert (=> b!619627 (= (select (store (arr!18041 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619628 () Bool)

(declare-fun res!399311 () Bool)

(declare-fun e!355354 () Bool)

(assert (=> b!619628 (=> (not res!399311) (not e!355354))))

(declare-fun arrayContainsKey!0 (array!37590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619628 (= res!399311 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619629 () Bool)

(declare-datatypes ((Unit!20526 0))(
  ( (Unit!20527) )
))
(declare-fun e!355366 () Unit!20526)

(declare-fun Unit!20528 () Unit!20526)

(assert (=> b!619629 (= e!355366 Unit!20528)))

(declare-fun b!619630 () Bool)

(declare-fun res!399307 () Bool)

(assert (=> b!619630 (=> (not res!399307) (not e!355354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619630 (= res!399307 (validKeyInArray!0 k0!1786))))

(declare-fun b!619631 () Bool)

(declare-fun res!399319 () Bool)

(declare-fun e!355362 () Bool)

(assert (=> b!619631 (=> (not res!399319) (not e!355362))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37590 (_ BitVec 32)) Bool)

(assert (=> b!619631 (= res!399319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619632 () Bool)

(assert (=> b!619632 (= e!355354 e!355362)))

(declare-fun res!399314 () Bool)

(assert (=> b!619632 (=> (not res!399314) (not e!355362))))

(declare-datatypes ((SeekEntryResult!6478 0))(
  ( (MissingZero!6478 (index!28196 (_ BitVec 32))) (Found!6478 (index!28197 (_ BitVec 32))) (Intermediate!6478 (undefined!7290 Bool) (index!28198 (_ BitVec 32)) (x!56985 (_ BitVec 32))) (Undefined!6478) (MissingVacant!6478 (index!28199 (_ BitVec 32))) )
))
(declare-fun lt!286050 () SeekEntryResult!6478)

(assert (=> b!619632 (= res!399314 (or (= lt!286050 (MissingZero!6478 i!1108)) (= lt!286050 (MissingVacant!6478 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37590 (_ BitVec 32)) SeekEntryResult!6478)

(assert (=> b!619632 (= lt!286050 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619633 () Bool)

(declare-fun e!355358 () Bool)

(assert (=> b!619633 (= e!355362 e!355358)))

(declare-fun res!399317 () Bool)

(assert (=> b!619633 (=> (not res!399317) (not e!355358))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619633 (= res!399317 (= (select (store (arr!18041 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286052 () array!37590)

(assert (=> b!619633 (= lt!286052 (array!37591 (store (arr!18041 a!2986) i!1108 k0!1786) (size!18406 a!2986)))))

(declare-fun b!619634 () Bool)

(declare-fun res!399310 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!619634 (= res!399310 (bvsge j!136 index!984))))

(declare-fun e!355367 () Bool)

(assert (=> b!619634 (=> res!399310 e!355367)))

(declare-fun e!355361 () Bool)

(assert (=> b!619634 (= e!355361 e!355367)))

(declare-fun b!619636 () Bool)

(declare-fun e!355357 () Bool)

(declare-fun lt!286055 () SeekEntryResult!6478)

(declare-fun lt!286054 () SeekEntryResult!6478)

(assert (=> b!619636 (= e!355357 (= lt!286055 lt!286054))))

(declare-fun b!619637 () Bool)

(assert (=> b!619637 false))

(declare-fun lt!286062 () Unit!20526)

(declare-datatypes ((List!12121 0))(
  ( (Nil!12118) (Cons!12117 (h!13162 (_ BitVec 64)) (t!18340 List!12121)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37590 (_ BitVec 64) (_ BitVec 32) List!12121) Unit!20526)

(assert (=> b!619637 (= lt!286062 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286052 (select (arr!18041 a!2986) j!136) j!136 Nil!12118))))

(declare-fun arrayNoDuplicates!0 (array!37590 (_ BitVec 32) List!12121) Bool)

(assert (=> b!619637 (arrayNoDuplicates!0 lt!286052 j!136 Nil!12118)))

(declare-fun lt!286056 () Unit!20526)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37590 (_ BitVec 32) (_ BitVec 32)) Unit!20526)

(assert (=> b!619637 (= lt!286056 (lemmaNoDuplicateFromThenFromBigger!0 lt!286052 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619637 (arrayNoDuplicates!0 lt!286052 #b00000000000000000000000000000000 Nil!12118)))

(declare-fun lt!286053 () Unit!20526)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12121) Unit!20526)

(assert (=> b!619637 (= lt!286053 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12118))))

(assert (=> b!619637 (arrayContainsKey!0 lt!286052 (select (arr!18041 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286047 () Unit!20526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20526)

(assert (=> b!619637 (= lt!286047 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286052 (select (arr!18041 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355368 () Unit!20526)

(declare-fun Unit!20529 () Unit!20526)

(assert (=> b!619637 (= e!355368 Unit!20529)))

(declare-fun b!619638 () Bool)

(declare-fun e!355355 () Bool)

(assert (=> b!619638 (= e!355355 (arrayContainsKey!0 lt!286052 (select (arr!18041 a!2986) j!136) index!984))))

(declare-fun res!399312 () Bool)

(declare-fun b!619639 () Bool)

(assert (=> b!619639 (= res!399312 (arrayContainsKey!0 lt!286052 (select (arr!18041 a!2986) j!136) j!136))))

(assert (=> b!619639 (=> (not res!399312) (not e!355355))))

(assert (=> b!619639 (= e!355367 e!355355)))

(declare-fun b!619640 () Bool)

(declare-fun res!399316 () Bool)

(assert (=> b!619640 (=> (not res!399316) (not e!355354))))

(assert (=> b!619640 (= res!399316 (validKeyInArray!0 (select (arr!18041 a!2986) j!136)))))

(declare-fun b!619641 () Bool)

(declare-fun e!355363 () Bool)

(assert (=> b!619641 (= e!355363 (arrayContainsKey!0 lt!286052 (select (arr!18041 a!2986) j!136) index!984))))

(declare-fun b!619642 () Bool)

(declare-fun res!399321 () Bool)

(assert (=> b!619642 (=> (not res!399321) (not e!355362))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619642 (= res!399321 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18041 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619643 () Bool)

(declare-fun e!355360 () Bool)

(assert (=> b!619643 (= e!355358 e!355360)))

(declare-fun res!399313 () Bool)

(assert (=> b!619643 (=> (not res!399313) (not e!355360))))

(assert (=> b!619643 (= res!399313 (and (= lt!286055 (Found!6478 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18041 a!2986) index!984) (select (arr!18041 a!2986) j!136))) (not (= (select (arr!18041 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37590 (_ BitVec 32)) SeekEntryResult!6478)

(assert (=> b!619643 (= lt!286055 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18041 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619644 () Bool)

(declare-fun Unit!20530 () Unit!20526)

(assert (=> b!619644 (= e!355366 Unit!20530)))

(declare-fun res!399323 () Bool)

(assert (=> b!619644 (= res!399323 (= (select (store (arr!18041 a!2986) i!1108 k0!1786) index!984) (select (arr!18041 a!2986) j!136)))))

(assert (=> b!619644 (=> (not res!399323) (not e!355361))))

(assert (=> b!619644 e!355361))

(declare-fun c!70527 () Bool)

(assert (=> b!619644 (= c!70527 (bvslt j!136 index!984))))

(declare-fun lt!286046 () Unit!20526)

(assert (=> b!619644 (= lt!286046 e!355368)))

(declare-fun c!70529 () Bool)

(assert (=> b!619644 (= c!70529 (bvslt index!984 j!136))))

(declare-fun lt!286049 () Unit!20526)

(declare-fun e!355365 () Unit!20526)

(assert (=> b!619644 (= lt!286049 e!355365)))

(assert (=> b!619644 false))

(declare-fun b!619645 () Bool)

(declare-fun e!355364 () Unit!20526)

(declare-fun Unit!20531 () Unit!20526)

(assert (=> b!619645 (= e!355364 Unit!20531)))

(assert (=> b!619645 false))

(declare-fun res!399309 () Bool)

(assert (=> start!56106 (=> (not res!399309) (not e!355354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56106 (= res!399309 (validMask!0 mask!3053))))

(assert (=> start!56106 e!355354))

(assert (=> start!56106 true))

(declare-fun array_inv!13924 (array!37590) Bool)

(assert (=> start!56106 (array_inv!13924 a!2986)))

(declare-fun b!619635 () Bool)

(declare-fun Unit!20532 () Unit!20526)

(assert (=> b!619635 (= e!355368 Unit!20532)))

(declare-fun b!619646 () Bool)

(assert (=> b!619646 (= e!355360 (not e!355356))))

(declare-fun res!399308 () Bool)

(assert (=> b!619646 (=> res!399308 e!355356)))

(declare-fun lt!286061 () SeekEntryResult!6478)

(assert (=> b!619646 (= res!399308 (not (= lt!286061 (MissingVacant!6478 vacantSpotIndex!68))))))

(declare-fun lt!286059 () Unit!20526)

(assert (=> b!619646 (= lt!286059 e!355366)))

(declare-fun c!70528 () Bool)

(assert (=> b!619646 (= c!70528 (= lt!286061 (Found!6478 index!984)))))

(declare-fun lt!286063 () Unit!20526)

(assert (=> b!619646 (= lt!286063 e!355364)))

(declare-fun c!70530 () Bool)

(assert (=> b!619646 (= c!70530 (= lt!286061 Undefined!6478))))

(declare-fun lt!286060 () (_ BitVec 64))

(assert (=> b!619646 (= lt!286061 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286060 lt!286052 mask!3053))))

(assert (=> b!619646 e!355357))

(declare-fun res!399318 () Bool)

(assert (=> b!619646 (=> (not res!399318) (not e!355357))))

(declare-fun lt!286045 () (_ BitVec 32))

(assert (=> b!619646 (= res!399318 (= lt!286054 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286045 vacantSpotIndex!68 lt!286060 lt!286052 mask!3053)))))

(assert (=> b!619646 (= lt!286054 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286045 vacantSpotIndex!68 (select (arr!18041 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619646 (= lt!286060 (select (store (arr!18041 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286057 () Unit!20526)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20526)

(assert (=> b!619646 (= lt!286057 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286045 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619646 (= lt!286045 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619647 () Bool)

(declare-fun res!399315 () Bool)

(assert (=> b!619647 (=> (not res!399315) (not e!355354))))

(assert (=> b!619647 (= res!399315 (and (= (size!18406 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18406 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18406 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619648 () Bool)

(declare-fun Unit!20533 () Unit!20526)

(assert (=> b!619648 (= e!355365 Unit!20533)))

(declare-fun b!619649 () Bool)

(assert (=> b!619649 false))

(declare-fun lt!286051 () Unit!20526)

(assert (=> b!619649 (= lt!286051 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286052 (select (arr!18041 a!2986) j!136) index!984 Nil!12118))))

(assert (=> b!619649 (arrayNoDuplicates!0 lt!286052 index!984 Nil!12118)))

(declare-fun lt!286058 () Unit!20526)

(assert (=> b!619649 (= lt!286058 (lemmaNoDuplicateFromThenFromBigger!0 lt!286052 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619649 (arrayNoDuplicates!0 lt!286052 #b00000000000000000000000000000000 Nil!12118)))

(declare-fun lt!286048 () Unit!20526)

(assert (=> b!619649 (= lt!286048 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12118))))

(assert (=> b!619649 (arrayContainsKey!0 lt!286052 (select (arr!18041 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286044 () Unit!20526)

(assert (=> b!619649 (= lt!286044 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286052 (select (arr!18041 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619649 e!355363))

(declare-fun res!399322 () Bool)

(assert (=> b!619649 (=> (not res!399322) (not e!355363))))

(assert (=> b!619649 (= res!399322 (arrayContainsKey!0 lt!286052 (select (arr!18041 a!2986) j!136) j!136))))

(declare-fun Unit!20534 () Unit!20526)

(assert (=> b!619649 (= e!355365 Unit!20534)))

(declare-fun b!619650 () Bool)

(declare-fun Unit!20535 () Unit!20526)

(assert (=> b!619650 (= e!355364 Unit!20535)))

(declare-fun b!619651 () Bool)

(declare-fun res!399320 () Bool)

(assert (=> b!619651 (=> (not res!399320) (not e!355362))))

(assert (=> b!619651 (= res!399320 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12118))))

(assert (= (and start!56106 res!399309) b!619647))

(assert (= (and b!619647 res!399315) b!619640))

(assert (= (and b!619640 res!399316) b!619630))

(assert (= (and b!619630 res!399307) b!619628))

(assert (= (and b!619628 res!399311) b!619632))

(assert (= (and b!619632 res!399314) b!619631))

(assert (= (and b!619631 res!399319) b!619651))

(assert (= (and b!619651 res!399320) b!619642))

(assert (= (and b!619642 res!399321) b!619633))

(assert (= (and b!619633 res!399317) b!619643))

(assert (= (and b!619643 res!399313) b!619646))

(assert (= (and b!619646 res!399318) b!619636))

(assert (= (and b!619646 c!70530) b!619645))

(assert (= (and b!619646 (not c!70530)) b!619650))

(assert (= (and b!619646 c!70528) b!619644))

(assert (= (and b!619646 (not c!70528)) b!619629))

(assert (= (and b!619644 res!399323) b!619634))

(assert (= (and b!619634 (not res!399310)) b!619639))

(assert (= (and b!619639 res!399312) b!619638))

(assert (= (and b!619644 c!70527) b!619637))

(assert (= (and b!619644 (not c!70527)) b!619635))

(assert (= (and b!619644 c!70529) b!619649))

(assert (= (and b!619644 (not c!70529)) b!619648))

(assert (= (and b!619649 res!399322) b!619641))

(assert (= (and b!619646 (not res!399308)) b!619627))

(declare-fun m!595069 () Bool)

(assert (=> b!619639 m!595069))

(assert (=> b!619639 m!595069))

(declare-fun m!595071 () Bool)

(assert (=> b!619639 m!595071))

(declare-fun m!595073 () Bool)

(assert (=> b!619631 m!595073))

(assert (=> b!619640 m!595069))

(assert (=> b!619640 m!595069))

(declare-fun m!595075 () Bool)

(assert (=> b!619640 m!595075))

(declare-fun m!595077 () Bool)

(assert (=> b!619642 m!595077))

(declare-fun m!595079 () Bool)

(assert (=> b!619633 m!595079))

(declare-fun m!595081 () Bool)

(assert (=> b!619633 m!595081))

(assert (=> b!619641 m!595069))

(assert (=> b!619641 m!595069))

(declare-fun m!595083 () Bool)

(assert (=> b!619641 m!595083))

(assert (=> b!619649 m!595069))

(declare-fun m!595085 () Bool)

(assert (=> b!619649 m!595085))

(assert (=> b!619649 m!595069))

(declare-fun m!595087 () Bool)

(assert (=> b!619649 m!595087))

(assert (=> b!619649 m!595069))

(declare-fun m!595089 () Bool)

(assert (=> b!619649 m!595089))

(declare-fun m!595091 () Bool)

(assert (=> b!619649 m!595091))

(declare-fun m!595093 () Bool)

(assert (=> b!619649 m!595093))

(declare-fun m!595095 () Bool)

(assert (=> b!619649 m!595095))

(assert (=> b!619649 m!595069))

(assert (=> b!619649 m!595071))

(assert (=> b!619649 m!595069))

(declare-fun m!595097 () Bool)

(assert (=> b!619649 m!595097))

(declare-fun m!595099 () Bool)

(assert (=> b!619628 m!595099))

(declare-fun m!595101 () Bool)

(assert (=> b!619646 m!595101))

(declare-fun m!595103 () Bool)

(assert (=> b!619646 m!595103))

(declare-fun m!595105 () Bool)

(assert (=> b!619646 m!595105))

(assert (=> b!619646 m!595069))

(assert (=> b!619646 m!595079))

(declare-fun m!595107 () Bool)

(assert (=> b!619646 m!595107))

(assert (=> b!619646 m!595069))

(declare-fun m!595109 () Bool)

(assert (=> b!619646 m!595109))

(declare-fun m!595111 () Bool)

(assert (=> b!619646 m!595111))

(assert (=> b!619637 m!595069))

(assert (=> b!619637 m!595069))

(declare-fun m!595113 () Bool)

(assert (=> b!619637 m!595113))

(assert (=> b!619637 m!595093))

(declare-fun m!595115 () Bool)

(assert (=> b!619637 m!595115))

(assert (=> b!619637 m!595069))

(declare-fun m!595117 () Bool)

(assert (=> b!619637 m!595117))

(declare-fun m!595119 () Bool)

(assert (=> b!619637 m!595119))

(assert (=> b!619637 m!595069))

(declare-fun m!595121 () Bool)

(assert (=> b!619637 m!595121))

(assert (=> b!619637 m!595095))

(assert (=> b!619638 m!595069))

(assert (=> b!619638 m!595069))

(assert (=> b!619638 m!595083))

(declare-fun m!595123 () Bool)

(assert (=> b!619643 m!595123))

(assert (=> b!619643 m!595069))

(assert (=> b!619643 m!595069))

(declare-fun m!595125 () Bool)

(assert (=> b!619643 m!595125))

(assert (=> b!619627 m!595079))

(declare-fun m!595127 () Bool)

(assert (=> b!619627 m!595127))

(declare-fun m!595129 () Bool)

(assert (=> b!619630 m!595129))

(declare-fun m!595131 () Bool)

(assert (=> b!619651 m!595131))

(assert (=> b!619644 m!595079))

(assert (=> b!619644 m!595127))

(assert (=> b!619644 m!595069))

(declare-fun m!595133 () Bool)

(assert (=> b!619632 m!595133))

(declare-fun m!595135 () Bool)

(assert (=> start!56106 m!595135))

(declare-fun m!595137 () Bool)

(assert (=> start!56106 m!595137))

(check-sat (not b!619649) (not b!619638) (not b!619637) (not b!619630) (not b!619632) (not b!619628) (not b!619640) (not start!56106) (not b!619639) (not b!619651) (not b!619643) (not b!619641) (not b!619631) (not b!619646))
(check-sat)
