; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58118 () Bool)

(assert start!58118)

(declare-fun b!642135 () Bool)

(declare-fun res!416028 () Bool)

(declare-fun e!367717 () Bool)

(assert (=> b!642135 (=> (not res!416028) (not e!367717))))

(declare-datatypes ((array!38388 0))(
  ( (array!38389 (arr!18410 (Array (_ BitVec 32) (_ BitVec 64))) (size!18775 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38388)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38388 (_ BitVec 32)) Bool)

(assert (=> b!642135 (= res!416028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642136 () Bool)

(declare-fun res!416024 () Bool)

(assert (=> b!642136 (=> (not res!416024) (not e!367717))))

(declare-datatypes ((List!12490 0))(
  ( (Nil!12487) (Cons!12486 (h!13531 (_ BitVec 64)) (t!18709 List!12490)) )
))
(declare-fun arrayNoDuplicates!0 (array!38388 (_ BitVec 32) List!12490) Bool)

(assert (=> b!642136 (= res!416024 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12487))))

(declare-fun b!642137 () Bool)

(declare-fun e!367726 () Bool)

(declare-datatypes ((SeekEntryResult!6847 0))(
  ( (MissingZero!6847 (index!29714 (_ BitVec 32))) (Found!6847 (index!29715 (_ BitVec 32))) (Intermediate!6847 (undefined!7659 Bool) (index!29716 (_ BitVec 32)) (x!58488 (_ BitVec 32))) (Undefined!6847) (MissingVacant!6847 (index!29717 (_ BitVec 32))) )
))
(declare-fun lt!297259 () SeekEntryResult!6847)

(declare-fun lt!297257 () SeekEntryResult!6847)

(assert (=> b!642137 (= e!367726 (= lt!297259 lt!297257))))

(declare-fun b!642138 () Bool)

(declare-fun res!416029 () Bool)

(declare-fun e!367727 () Bool)

(assert (=> b!642138 (=> (not res!416029) (not e!367727))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642138 (= res!416029 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642139 () Bool)

(declare-fun res!416022 () Bool)

(assert (=> b!642139 (=> (not res!416022) (not e!367727))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642139 (= res!416022 (validKeyInArray!0 (select (arr!18410 a!2986) j!136)))))

(declare-fun b!642140 () Bool)

(declare-fun e!367722 () Bool)

(declare-fun e!367720 () Bool)

(assert (=> b!642140 (= e!367722 (not e!367720))))

(declare-fun res!416017 () Bool)

(assert (=> b!642140 (=> res!416017 e!367720)))

(declare-fun lt!297251 () SeekEntryResult!6847)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642140 (= res!416017 (not (= lt!297251 (Found!6847 index!984))))))

(declare-datatypes ((Unit!21716 0))(
  ( (Unit!21717) )
))
(declare-fun lt!297256 () Unit!21716)

(declare-fun e!367723 () Unit!21716)

(assert (=> b!642140 (= lt!297256 e!367723)))

(declare-fun c!73428 () Bool)

(assert (=> b!642140 (= c!73428 (= lt!297251 Undefined!6847))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!297263 () array!38388)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!297255 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38388 (_ BitVec 32)) SeekEntryResult!6847)

(assert (=> b!642140 (= lt!297251 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297255 lt!297263 mask!3053))))

(assert (=> b!642140 e!367726))

(declare-fun res!416013 () Bool)

(assert (=> b!642140 (=> (not res!416013) (not e!367726))))

(declare-fun lt!297262 () (_ BitVec 32))

(assert (=> b!642140 (= res!416013 (= lt!297257 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297262 vacantSpotIndex!68 lt!297255 lt!297263 mask!3053)))))

(assert (=> b!642140 (= lt!297257 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297262 vacantSpotIndex!68 (select (arr!18410 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642140 (= lt!297255 (select (store (arr!18410 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297254 () Unit!21716)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38388 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21716)

(assert (=> b!642140 (= lt!297254 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297262 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642140 (= lt!297262 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642141 () Bool)

(declare-fun Unit!21718 () Unit!21716)

(assert (=> b!642141 (= e!367723 Unit!21718)))

(declare-fun b!642143 () Bool)

(declare-fun e!367719 () Bool)

(assert (=> b!642143 (= e!367720 e!367719)))

(declare-fun res!416016 () Bool)

(assert (=> b!642143 (=> res!416016 e!367719)))

(declare-fun lt!297252 () (_ BitVec 64))

(assert (=> b!642143 (= res!416016 (or (not (= (select (arr!18410 a!2986) j!136) lt!297255)) (not (= (select (arr!18410 a!2986) j!136) lt!297252)) (bvsge j!136 index!984)))))

(declare-fun e!367725 () Bool)

(assert (=> b!642143 e!367725))

(declare-fun res!416020 () Bool)

(assert (=> b!642143 (=> (not res!416020) (not e!367725))))

(assert (=> b!642143 (= res!416020 (= lt!297252 (select (arr!18410 a!2986) j!136)))))

(assert (=> b!642143 (= lt!297252 (select (store (arr!18410 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642144 () Bool)

(declare-fun e!367724 () Bool)

(assert (=> b!642144 (= e!367717 e!367724)))

(declare-fun res!416018 () Bool)

(assert (=> b!642144 (=> (not res!416018) (not e!367724))))

(assert (=> b!642144 (= res!416018 (= (select (store (arr!18410 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642144 (= lt!297263 (array!38389 (store (arr!18410 a!2986) i!1108 k0!1786) (size!18775 a!2986)))))

(declare-fun b!642145 () Bool)

(declare-fun e!367716 () Bool)

(assert (=> b!642145 (= e!367725 e!367716)))

(declare-fun res!416014 () Bool)

(assert (=> b!642145 (=> res!416014 e!367716)))

(assert (=> b!642145 (= res!416014 (or (not (= (select (arr!18410 a!2986) j!136) lt!297255)) (not (= (select (arr!18410 a!2986) j!136) lt!297252)) (bvsge j!136 index!984)))))

(declare-fun b!642146 () Bool)

(assert (=> b!642146 (= e!367727 e!367717)))

(declare-fun res!416015 () Bool)

(assert (=> b!642146 (=> (not res!416015) (not e!367717))))

(declare-fun lt!297260 () SeekEntryResult!6847)

(assert (=> b!642146 (= res!416015 (or (= lt!297260 (MissingZero!6847 i!1108)) (= lt!297260 (MissingVacant!6847 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38388 (_ BitVec 32)) SeekEntryResult!6847)

(assert (=> b!642146 (= lt!297260 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642147 () Bool)

(declare-fun res!416027 () Bool)

(assert (=> b!642147 (=> (not res!416027) (not e!367717))))

(assert (=> b!642147 (= res!416027 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18410 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!367721 () Bool)

(declare-fun b!642148 () Bool)

(assert (=> b!642148 (= e!367721 (arrayContainsKey!0 lt!297263 (select (arr!18410 a!2986) j!136) index!984))))

(declare-fun b!642149 () Bool)

(assert (=> b!642149 (= e!367719 false)))

(assert (=> b!642149 (not (= lt!297255 (select (arr!18410 a!2986) j!136)))))

(declare-fun lt!297261 () Unit!21716)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38388 (_ BitVec 64) (_ BitVec 32) List!12490) Unit!21716)

(assert (=> b!642149 (= lt!297261 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297263 (select (arr!18410 a!2986) j!136) j!136 Nil!12487))))

(assert (=> b!642149 (arrayNoDuplicates!0 lt!297263 j!136 Nil!12487)))

(declare-fun lt!297258 () Unit!21716)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38388 (_ BitVec 32) (_ BitVec 32)) Unit!21716)

(assert (=> b!642149 (= lt!297258 (lemmaNoDuplicateFromThenFromBigger!0 lt!297263 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642149 (arrayNoDuplicates!0 lt!297263 #b00000000000000000000000000000000 Nil!12487)))

(declare-fun lt!297264 () Unit!21716)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12490) Unit!21716)

(assert (=> b!642149 (= lt!297264 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12487))))

(assert (=> b!642149 (arrayContainsKey!0 lt!297263 (select (arr!18410 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297253 () Unit!21716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21716)

(assert (=> b!642149 (= lt!297253 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297263 (select (arr!18410 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!416023 () Bool)

(assert (=> start!58118 (=> (not res!416023) (not e!367727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58118 (= res!416023 (validMask!0 mask!3053))))

(assert (=> start!58118 e!367727))

(assert (=> start!58118 true))

(declare-fun array_inv!14293 (array!38388) Bool)

(assert (=> start!58118 (array_inv!14293 a!2986)))

(declare-fun b!642142 () Bool)

(assert (=> b!642142 (= e!367724 e!367722)))

(declare-fun res!416025 () Bool)

(assert (=> b!642142 (=> (not res!416025) (not e!367722))))

(assert (=> b!642142 (= res!416025 (and (= lt!297259 (Found!6847 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18410 a!2986) index!984) (select (arr!18410 a!2986) j!136))) (not (= (select (arr!18410 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642142 (= lt!297259 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18410 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642150 () Bool)

(declare-fun res!416026 () Bool)

(assert (=> b!642150 (=> (not res!416026) (not e!367727))))

(assert (=> b!642150 (= res!416026 (and (= (size!18775 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18775 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18775 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642151 () Bool)

(assert (=> b!642151 (= e!367716 e!367721)))

(declare-fun res!416021 () Bool)

(assert (=> b!642151 (=> (not res!416021) (not e!367721))))

(assert (=> b!642151 (= res!416021 (arrayContainsKey!0 lt!297263 (select (arr!18410 a!2986) j!136) j!136))))

(declare-fun b!642152 () Bool)

(declare-fun res!416019 () Bool)

(assert (=> b!642152 (=> (not res!416019) (not e!367727))))

(assert (=> b!642152 (= res!416019 (validKeyInArray!0 k0!1786))))

(declare-fun b!642153 () Bool)

(declare-fun Unit!21719 () Unit!21716)

(assert (=> b!642153 (= e!367723 Unit!21719)))

(assert (=> b!642153 false))

(assert (= (and start!58118 res!416023) b!642150))

(assert (= (and b!642150 res!416026) b!642139))

(assert (= (and b!642139 res!416022) b!642152))

(assert (= (and b!642152 res!416019) b!642138))

(assert (= (and b!642138 res!416029) b!642146))

(assert (= (and b!642146 res!416015) b!642135))

(assert (= (and b!642135 res!416028) b!642136))

(assert (= (and b!642136 res!416024) b!642147))

(assert (= (and b!642147 res!416027) b!642144))

(assert (= (and b!642144 res!416018) b!642142))

(assert (= (and b!642142 res!416025) b!642140))

(assert (= (and b!642140 res!416013) b!642137))

(assert (= (and b!642140 c!73428) b!642153))

(assert (= (and b!642140 (not c!73428)) b!642141))

(assert (= (and b!642140 (not res!416017)) b!642143))

(assert (= (and b!642143 res!416020) b!642145))

(assert (= (and b!642145 (not res!416014)) b!642151))

(assert (= (and b!642151 res!416021) b!642148))

(assert (= (and b!642143 (not res!416016)) b!642149))

(declare-fun m!615423 () Bool)

(assert (=> b!642135 m!615423))

(declare-fun m!615425 () Bool)

(assert (=> b!642143 m!615425))

(declare-fun m!615427 () Bool)

(assert (=> b!642143 m!615427))

(declare-fun m!615429 () Bool)

(assert (=> b!642143 m!615429))

(assert (=> b!642139 m!615425))

(assert (=> b!642139 m!615425))

(declare-fun m!615431 () Bool)

(assert (=> b!642139 m!615431))

(assert (=> b!642151 m!615425))

(assert (=> b!642151 m!615425))

(declare-fun m!615433 () Bool)

(assert (=> b!642151 m!615433))

(declare-fun m!615435 () Bool)

(assert (=> b!642152 m!615435))

(assert (=> b!642144 m!615427))

(declare-fun m!615437 () Bool)

(assert (=> b!642144 m!615437))

(declare-fun m!615439 () Bool)

(assert (=> b!642138 m!615439))

(declare-fun m!615441 () Bool)

(assert (=> b!642146 m!615441))

(declare-fun m!615443 () Bool)

(assert (=> b!642136 m!615443))

(assert (=> b!642148 m!615425))

(assert (=> b!642148 m!615425))

(declare-fun m!615445 () Bool)

(assert (=> b!642148 m!615445))

(declare-fun m!615447 () Bool)

(assert (=> b!642142 m!615447))

(assert (=> b!642142 m!615425))

(assert (=> b!642142 m!615425))

(declare-fun m!615449 () Bool)

(assert (=> b!642142 m!615449))

(declare-fun m!615451 () Bool)

(assert (=> b!642140 m!615451))

(declare-fun m!615453 () Bool)

(assert (=> b!642140 m!615453))

(assert (=> b!642140 m!615425))

(declare-fun m!615455 () Bool)

(assert (=> b!642140 m!615455))

(assert (=> b!642140 m!615427))

(assert (=> b!642140 m!615425))

(declare-fun m!615457 () Bool)

(assert (=> b!642140 m!615457))

(declare-fun m!615459 () Bool)

(assert (=> b!642140 m!615459))

(declare-fun m!615461 () Bool)

(assert (=> b!642140 m!615461))

(assert (=> b!642145 m!615425))

(declare-fun m!615463 () Bool)

(assert (=> b!642147 m!615463))

(declare-fun m!615465 () Bool)

(assert (=> start!58118 m!615465))

(declare-fun m!615467 () Bool)

(assert (=> start!58118 m!615467))

(assert (=> b!642149 m!615425))

(declare-fun m!615469 () Bool)

(assert (=> b!642149 m!615469))

(assert (=> b!642149 m!615425))

(declare-fun m!615471 () Bool)

(assert (=> b!642149 m!615471))

(assert (=> b!642149 m!615425))

(declare-fun m!615473 () Bool)

(assert (=> b!642149 m!615473))

(declare-fun m!615475 () Bool)

(assert (=> b!642149 m!615475))

(declare-fun m!615477 () Bool)

(assert (=> b!642149 m!615477))

(declare-fun m!615479 () Bool)

(assert (=> b!642149 m!615479))

(assert (=> b!642149 m!615425))

(declare-fun m!615481 () Bool)

(assert (=> b!642149 m!615481))

(check-sat (not b!642152) (not b!642142) (not b!642149) (not start!58118) (not b!642148) (not b!642146) (not b!642136) (not b!642151) (not b!642139) (not b!642140) (not b!642138) (not b!642135))
(check-sat)
