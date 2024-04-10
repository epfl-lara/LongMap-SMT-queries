; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56028 () Bool)

(assert start!56028)

(declare-fun b!616373 () Bool)

(declare-datatypes ((Unit!20078 0))(
  ( (Unit!20079) )
))
(declare-fun e!353421 () Unit!20078)

(declare-fun Unit!20080 () Unit!20078)

(assert (=> b!616373 (= e!353421 Unit!20080)))

(declare-fun b!616374 () Bool)

(assert (=> b!616374 false))

(declare-datatypes ((array!37498 0))(
  ( (array!37499 (arr!17995 (Array (_ BitVec 32) (_ BitVec 64))) (size!18359 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37498)

(declare-fun lt!283471 () array!37498)

(declare-fun lt!283475 () Unit!20078)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((List!12036 0))(
  ( (Nil!12033) (Cons!12032 (h!13077 (_ BitVec 64)) (t!18264 List!12036)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37498 (_ BitVec 64) (_ BitVec 32) List!12036) Unit!20078)

(assert (=> b!616374 (= lt!283475 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283471 (select (arr!17995 a!2986) j!136) j!136 Nil!12033))))

(declare-fun arrayNoDuplicates!0 (array!37498 (_ BitVec 32) List!12036) Bool)

(assert (=> b!616374 (arrayNoDuplicates!0 lt!283471 j!136 Nil!12033)))

(declare-fun lt!283473 () Unit!20078)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37498 (_ BitVec 32) (_ BitVec 32)) Unit!20078)

(assert (=> b!616374 (= lt!283473 (lemmaNoDuplicateFromThenFromBigger!0 lt!283471 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616374 (arrayNoDuplicates!0 lt!283471 #b00000000000000000000000000000000 Nil!12033)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!283470 () Unit!20078)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37498 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12036) Unit!20078)

(assert (=> b!616374 (= lt!283470 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12033))))

(declare-fun arrayContainsKey!0 (array!37498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616374 (arrayContainsKey!0 lt!283471 (select (arr!17995 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283463 () Unit!20078)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37498 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20078)

(assert (=> b!616374 (= lt!283463 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283471 (select (arr!17995 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353418 () Unit!20078)

(declare-fun Unit!20081 () Unit!20078)

(assert (=> b!616374 (= e!353418 Unit!20081)))

(declare-fun b!616376 () Bool)

(declare-fun e!353423 () Bool)

(assert (=> b!616376 (= e!353423 (arrayContainsKey!0 lt!283471 (select (arr!17995 a!2986) j!136) index!984))))

(declare-fun b!616377 () Bool)

(declare-fun res!397045 () Bool)

(declare-fun e!353426 () Bool)

(assert (=> b!616377 (=> (not res!397045) (not e!353426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616377 (= res!397045 (validKeyInArray!0 k0!1786))))

(declare-fun b!616378 () Bool)

(declare-fun res!397051 () Bool)

(assert (=> b!616378 (= res!397051 (bvsge j!136 index!984))))

(declare-fun e!353416 () Bool)

(assert (=> b!616378 (=> res!397051 e!353416)))

(declare-fun e!353413 () Bool)

(assert (=> b!616378 (= e!353413 e!353416)))

(declare-fun b!616379 () Bool)

(declare-fun res!397039 () Bool)

(assert (=> b!616379 (=> (not res!397039) (not e!353426))))

(assert (=> b!616379 (= res!397039 (validKeyInArray!0 (select (arr!17995 a!2986) j!136)))))

(declare-fun b!616380 () Bool)

(declare-fun res!397053 () Bool)

(declare-fun e!353419 () Bool)

(assert (=> b!616380 (=> (not res!397053) (not e!353419))))

(assert (=> b!616380 (= res!397053 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12033))))

(declare-fun b!616381 () Bool)

(declare-fun e!353422 () Unit!20078)

(declare-fun Unit!20082 () Unit!20078)

(assert (=> b!616381 (= e!353422 Unit!20082)))

(assert (=> b!616381 false))

(declare-fun b!616382 () Bool)

(declare-fun e!353425 () Bool)

(declare-datatypes ((SeekEntryResult!6435 0))(
  ( (MissingZero!6435 (index!28024 (_ BitVec 32))) (Found!6435 (index!28025 (_ BitVec 32))) (Intermediate!6435 (undefined!7247 Bool) (index!28026 (_ BitVec 32)) (x!56819 (_ BitVec 32))) (Undefined!6435) (MissingVacant!6435 (index!28027 (_ BitVec 32))) )
))
(declare-fun lt!283467 () SeekEntryResult!6435)

(declare-fun lt!283458 () SeekEntryResult!6435)

(assert (=> b!616382 (= e!353425 (= lt!283467 lt!283458))))

(declare-fun b!616383 () Bool)

(declare-fun e!353415 () Unit!20078)

(declare-fun Unit!20083 () Unit!20078)

(assert (=> b!616383 (= e!353415 Unit!20083)))

(declare-fun b!616384 () Bool)

(declare-fun e!353424 () Bool)

(declare-fun e!353417 () Bool)

(assert (=> b!616384 (= e!353424 (not e!353417))))

(declare-fun res!397043 () Bool)

(assert (=> b!616384 (=> res!397043 e!353417)))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!616384 (= res!397043 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!283476 () Unit!20078)

(assert (=> b!616384 (= lt!283476 e!353421)))

(declare-fun c!70037 () Bool)

(declare-fun lt!283461 () SeekEntryResult!6435)

(assert (=> b!616384 (= c!70037 (= lt!283461 (Found!6435 index!984)))))

(declare-fun lt!283468 () Unit!20078)

(assert (=> b!616384 (= lt!283468 e!353422)))

(declare-fun c!70034 () Bool)

(assert (=> b!616384 (= c!70034 (= lt!283461 Undefined!6435))))

(declare-fun lt!283460 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37498 (_ BitVec 32)) SeekEntryResult!6435)

(assert (=> b!616384 (= lt!283461 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283460 lt!283471 mask!3053))))

(assert (=> b!616384 e!353425))

(declare-fun res!397044 () Bool)

(assert (=> b!616384 (=> (not res!397044) (not e!353425))))

(declare-fun lt!283462 () (_ BitVec 32))

(assert (=> b!616384 (= res!397044 (= lt!283458 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283462 vacantSpotIndex!68 lt!283460 lt!283471 mask!3053)))))

(assert (=> b!616384 (= lt!283458 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283462 vacantSpotIndex!68 (select (arr!17995 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616384 (= lt!283460 (select (store (arr!17995 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283472 () Unit!20078)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20078)

(assert (=> b!616384 (= lt!283472 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283462 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616384 (= lt!283462 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616385 () Bool)

(declare-fun res!397049 () Bool)

(assert (=> b!616385 (=> (not res!397049) (not e!353426))))

(assert (=> b!616385 (= res!397049 (and (= (size!18359 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18359 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18359 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!397052 () Bool)

(assert (=> start!56028 (=> (not res!397052) (not e!353426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56028 (= res!397052 (validMask!0 mask!3053))))

(assert (=> start!56028 e!353426))

(assert (=> start!56028 true))

(declare-fun array_inv!13791 (array!37498) Bool)

(assert (=> start!56028 (array_inv!13791 a!2986)))

(declare-fun b!616375 () Bool)

(declare-fun Unit!20084 () Unit!20078)

(assert (=> b!616375 (= e!353421 Unit!20084)))

(declare-fun res!397040 () Bool)

(assert (=> b!616375 (= res!397040 (= (select (store (arr!17995 a!2986) i!1108 k0!1786) index!984) (select (arr!17995 a!2986) j!136)))))

(assert (=> b!616375 (=> (not res!397040) (not e!353413))))

(assert (=> b!616375 e!353413))

(declare-fun c!70035 () Bool)

(assert (=> b!616375 (= c!70035 (bvslt j!136 index!984))))

(declare-fun lt!283459 () Unit!20078)

(assert (=> b!616375 (= lt!283459 e!353418)))

(declare-fun c!70036 () Bool)

(assert (=> b!616375 (= c!70036 (bvslt index!984 j!136))))

(declare-fun lt!283469 () Unit!20078)

(assert (=> b!616375 (= lt!283469 e!353415)))

(assert (=> b!616375 false))

(declare-fun b!616386 () Bool)

(declare-fun Unit!20085 () Unit!20078)

(assert (=> b!616386 (= e!353418 Unit!20085)))

(declare-fun b!616387 () Bool)

(declare-fun res!397055 () Bool)

(assert (=> b!616387 (=> (not res!397055) (not e!353426))))

(assert (=> b!616387 (= res!397055 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616388 () Bool)

(assert (=> b!616388 false))

(declare-fun lt!283464 () Unit!20078)

(assert (=> b!616388 (= lt!283464 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283471 (select (arr!17995 a!2986) j!136) index!984 Nil!12033))))

(assert (=> b!616388 (arrayNoDuplicates!0 lt!283471 index!984 Nil!12033)))

(declare-fun lt!283466 () Unit!20078)

(assert (=> b!616388 (= lt!283466 (lemmaNoDuplicateFromThenFromBigger!0 lt!283471 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616388 (arrayNoDuplicates!0 lt!283471 #b00000000000000000000000000000000 Nil!12033)))

(declare-fun lt!283477 () Unit!20078)

(assert (=> b!616388 (= lt!283477 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12033))))

(assert (=> b!616388 (arrayContainsKey!0 lt!283471 (select (arr!17995 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283465 () Unit!20078)

(assert (=> b!616388 (= lt!283465 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283471 (select (arr!17995 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616388 e!353423))

(declare-fun res!397050 () Bool)

(assert (=> b!616388 (=> (not res!397050) (not e!353423))))

(assert (=> b!616388 (= res!397050 (arrayContainsKey!0 lt!283471 (select (arr!17995 a!2986) j!136) j!136))))

(declare-fun Unit!20086 () Unit!20078)

(assert (=> b!616388 (= e!353415 Unit!20086)))

(declare-fun b!616389 () Bool)

(assert (=> b!616389 (= e!353426 e!353419)))

(declare-fun res!397048 () Bool)

(assert (=> b!616389 (=> (not res!397048) (not e!353419))))

(declare-fun lt!283474 () SeekEntryResult!6435)

(assert (=> b!616389 (= res!397048 (or (= lt!283474 (MissingZero!6435 i!1108)) (= lt!283474 (MissingVacant!6435 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37498 (_ BitVec 32)) SeekEntryResult!6435)

(assert (=> b!616389 (= lt!283474 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616390 () Bool)

(declare-fun res!397042 () Bool)

(assert (=> b!616390 (=> (not res!397042) (not e!353419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37498 (_ BitVec 32)) Bool)

(assert (=> b!616390 (= res!397042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!397041 () Bool)

(declare-fun b!616391 () Bool)

(assert (=> b!616391 (= res!397041 (arrayContainsKey!0 lt!283471 (select (arr!17995 a!2986) j!136) j!136))))

(declare-fun e!353414 () Bool)

(assert (=> b!616391 (=> (not res!397041) (not e!353414))))

(assert (=> b!616391 (= e!353416 e!353414)))

(declare-fun b!616392 () Bool)

(declare-fun res!397047 () Bool)

(assert (=> b!616392 (=> (not res!397047) (not e!353419))))

(assert (=> b!616392 (= res!397047 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17995 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616393 () Bool)

(assert (=> b!616393 (= e!353417 (validKeyInArray!0 lt!283460))))

(declare-fun b!616394 () Bool)

(declare-fun e!353420 () Bool)

(assert (=> b!616394 (= e!353419 e!353420)))

(declare-fun res!397054 () Bool)

(assert (=> b!616394 (=> (not res!397054) (not e!353420))))

(assert (=> b!616394 (= res!397054 (= (select (store (arr!17995 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616394 (= lt!283471 (array!37499 (store (arr!17995 a!2986) i!1108 k0!1786) (size!18359 a!2986)))))

(declare-fun b!616395 () Bool)

(assert (=> b!616395 (= e!353420 e!353424)))

(declare-fun res!397046 () Bool)

(assert (=> b!616395 (=> (not res!397046) (not e!353424))))

(assert (=> b!616395 (= res!397046 (and (= lt!283467 (Found!6435 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17995 a!2986) index!984) (select (arr!17995 a!2986) j!136))) (not (= (select (arr!17995 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616395 (= lt!283467 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17995 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616396 () Bool)

(assert (=> b!616396 (= e!353414 (arrayContainsKey!0 lt!283471 (select (arr!17995 a!2986) j!136) index!984))))

(declare-fun b!616397 () Bool)

(declare-fun Unit!20087 () Unit!20078)

(assert (=> b!616397 (= e!353422 Unit!20087)))

(assert (= (and start!56028 res!397052) b!616385))

(assert (= (and b!616385 res!397049) b!616379))

(assert (= (and b!616379 res!397039) b!616377))

(assert (= (and b!616377 res!397045) b!616387))

(assert (= (and b!616387 res!397055) b!616389))

(assert (= (and b!616389 res!397048) b!616390))

(assert (= (and b!616390 res!397042) b!616380))

(assert (= (and b!616380 res!397053) b!616392))

(assert (= (and b!616392 res!397047) b!616394))

(assert (= (and b!616394 res!397054) b!616395))

(assert (= (and b!616395 res!397046) b!616384))

(assert (= (and b!616384 res!397044) b!616382))

(assert (= (and b!616384 c!70034) b!616381))

(assert (= (and b!616384 (not c!70034)) b!616397))

(assert (= (and b!616384 c!70037) b!616375))

(assert (= (and b!616384 (not c!70037)) b!616373))

(assert (= (and b!616375 res!397040) b!616378))

(assert (= (and b!616378 (not res!397051)) b!616391))

(assert (= (and b!616391 res!397041) b!616396))

(assert (= (and b!616375 c!70035) b!616374))

(assert (= (and b!616375 (not c!70035)) b!616386))

(assert (= (and b!616375 c!70036) b!616388))

(assert (= (and b!616375 (not c!70036)) b!616383))

(assert (= (and b!616388 res!397050) b!616376))

(assert (= (and b!616384 (not res!397043)) b!616393))

(declare-fun m!592547 () Bool)

(assert (=> b!616391 m!592547))

(assert (=> b!616391 m!592547))

(declare-fun m!592549 () Bool)

(assert (=> b!616391 m!592549))

(assert (=> b!616376 m!592547))

(assert (=> b!616376 m!592547))

(declare-fun m!592551 () Bool)

(assert (=> b!616376 m!592551))

(declare-fun m!592553 () Bool)

(assert (=> start!56028 m!592553))

(declare-fun m!592555 () Bool)

(assert (=> start!56028 m!592555))

(declare-fun m!592557 () Bool)

(assert (=> b!616387 m!592557))

(declare-fun m!592559 () Bool)

(assert (=> b!616392 m!592559))

(declare-fun m!592561 () Bool)

(assert (=> b!616380 m!592561))

(assert (=> b!616379 m!592547))

(assert (=> b!616379 m!592547))

(declare-fun m!592563 () Bool)

(assert (=> b!616379 m!592563))

(declare-fun m!592565 () Bool)

(assert (=> b!616384 m!592565))

(assert (=> b!616384 m!592547))

(declare-fun m!592567 () Bool)

(assert (=> b!616384 m!592567))

(assert (=> b!616384 m!592547))

(declare-fun m!592569 () Bool)

(assert (=> b!616384 m!592569))

(declare-fun m!592571 () Bool)

(assert (=> b!616384 m!592571))

(declare-fun m!592573 () Bool)

(assert (=> b!616384 m!592573))

(declare-fun m!592575 () Bool)

(assert (=> b!616384 m!592575))

(declare-fun m!592577 () Bool)

(assert (=> b!616384 m!592577))

(declare-fun m!592579 () Bool)

(assert (=> b!616374 m!592579))

(assert (=> b!616374 m!592547))

(declare-fun m!592581 () Bool)

(assert (=> b!616374 m!592581))

(declare-fun m!592583 () Bool)

(assert (=> b!616374 m!592583))

(assert (=> b!616374 m!592547))

(declare-fun m!592585 () Bool)

(assert (=> b!616374 m!592585))

(assert (=> b!616374 m!592547))

(declare-fun m!592587 () Bool)

(assert (=> b!616374 m!592587))

(assert (=> b!616374 m!592547))

(declare-fun m!592589 () Bool)

(assert (=> b!616374 m!592589))

(declare-fun m!592591 () Bool)

(assert (=> b!616374 m!592591))

(assert (=> b!616375 m!592571))

(declare-fun m!592593 () Bool)

(assert (=> b!616375 m!592593))

(assert (=> b!616375 m!592547))

(declare-fun m!592595 () Bool)

(assert (=> b!616377 m!592595))

(assert (=> b!616396 m!592547))

(assert (=> b!616396 m!592547))

(assert (=> b!616396 m!592551))

(declare-fun m!592597 () Bool)

(assert (=> b!616393 m!592597))

(assert (=> b!616394 m!592571))

(declare-fun m!592599 () Bool)

(assert (=> b!616394 m!592599))

(declare-fun m!592601 () Bool)

(assert (=> b!616390 m!592601))

(declare-fun m!592603 () Bool)

(assert (=> b!616389 m!592603))

(declare-fun m!592605 () Bool)

(assert (=> b!616395 m!592605))

(assert (=> b!616395 m!592547))

(assert (=> b!616395 m!592547))

(declare-fun m!592607 () Bool)

(assert (=> b!616395 m!592607))

(assert (=> b!616388 m!592547))

(declare-fun m!592609 () Bool)

(assert (=> b!616388 m!592609))

(assert (=> b!616388 m!592547))

(assert (=> b!616388 m!592549))

(assert (=> b!616388 m!592547))

(declare-fun m!592611 () Bool)

(assert (=> b!616388 m!592611))

(assert (=> b!616388 m!592547))

(assert (=> b!616388 m!592591))

(assert (=> b!616388 m!592547))

(declare-fun m!592613 () Bool)

(assert (=> b!616388 m!592613))

(declare-fun m!592615 () Bool)

(assert (=> b!616388 m!592615))

(assert (=> b!616388 m!592583))

(declare-fun m!592617 () Bool)

(assert (=> b!616388 m!592617))

(check-sat (not b!616387) (not b!616390) (not b!616391) (not b!616384) (not b!616374) (not b!616393) (not b!616376) (not start!56028) (not b!616396) (not b!616380) (not b!616395) (not b!616388) (not b!616379) (not b!616377) (not b!616389))
(check-sat)
