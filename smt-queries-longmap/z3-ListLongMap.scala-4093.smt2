; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56058 () Bool)

(assert start!56058)

(declare-fun b!617498 () Bool)

(declare-fun e!354089 () Bool)

(declare-fun e!354093 () Bool)

(assert (=> b!617498 (= e!354089 e!354093)))

(declare-fun res!397813 () Bool)

(assert (=> b!617498 (=> (not res!397813) (not e!354093))))

(declare-datatypes ((SeekEntryResult!6450 0))(
  ( (MissingZero!6450 (index!28084 (_ BitVec 32))) (Found!6450 (index!28085 (_ BitVec 32))) (Intermediate!6450 (undefined!7262 Bool) (index!28086 (_ BitVec 32)) (x!56874 (_ BitVec 32))) (Undefined!6450) (MissingVacant!6450 (index!28087 (_ BitVec 32))) )
))
(declare-fun lt!284376 () SeekEntryResult!6450)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!617498 (= res!397813 (or (= lt!284376 (MissingZero!6450 i!1108)) (= lt!284376 (MissingVacant!6450 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37528 0))(
  ( (array!37529 (arr!18010 (Array (_ BitVec 32) (_ BitVec 64))) (size!18374 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37528)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37528 (_ BitVec 32)) SeekEntryResult!6450)

(assert (=> b!617498 (= lt!284376 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617499 () Bool)

(declare-datatypes ((Unit!20228 0))(
  ( (Unit!20229) )
))
(declare-fun e!354100 () Unit!20228)

(declare-fun Unit!20230 () Unit!20228)

(assert (=> b!617499 (= e!354100 Unit!20230)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!617500 () Bool)

(declare-fun lt!284368 () array!37528)

(declare-fun res!397805 () Bool)

(declare-fun arrayContainsKey!0 (array!37528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617500 (= res!397805 (arrayContainsKey!0 lt!284368 (select (arr!18010 a!2986) j!136) j!136))))

(declare-fun e!354092 () Bool)

(assert (=> b!617500 (=> (not res!397805) (not e!354092))))

(declare-fun e!354094 () Bool)

(assert (=> b!617500 (= e!354094 e!354092)))

(declare-fun b!617501 () Bool)

(declare-fun res!397808 () Bool)

(assert (=> b!617501 (=> (not res!397808) (not e!354089))))

(assert (=> b!617501 (= res!397808 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617502 () Bool)

(assert (=> b!617502 false))

(declare-fun lt!284374 () Unit!20228)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12051 0))(
  ( (Nil!12048) (Cons!12047 (h!13092 (_ BitVec 64)) (t!18279 List!12051)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37528 (_ BitVec 64) (_ BitVec 32) List!12051) Unit!20228)

(assert (=> b!617502 (= lt!284374 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284368 (select (arr!18010 a!2986) j!136) index!984 Nil!12048))))

(declare-fun arrayNoDuplicates!0 (array!37528 (_ BitVec 32) List!12051) Bool)

(assert (=> b!617502 (arrayNoDuplicates!0 lt!284368 index!984 Nil!12048)))

(declare-fun lt!284372 () Unit!20228)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37528 (_ BitVec 32) (_ BitVec 32)) Unit!20228)

(assert (=> b!617502 (= lt!284372 (lemmaNoDuplicateFromThenFromBigger!0 lt!284368 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617502 (arrayNoDuplicates!0 lt!284368 #b00000000000000000000000000000000 Nil!12048)))

(declare-fun lt!284377 () Unit!20228)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12051) Unit!20228)

(assert (=> b!617502 (= lt!284377 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12048))))

(assert (=> b!617502 (arrayContainsKey!0 lt!284368 (select (arr!18010 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284369 () Unit!20228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20228)

(assert (=> b!617502 (= lt!284369 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284368 (select (arr!18010 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354101 () Bool)

(assert (=> b!617502 e!354101))

(declare-fun res!397809 () Bool)

(assert (=> b!617502 (=> (not res!397809) (not e!354101))))

(assert (=> b!617502 (= res!397809 (arrayContainsKey!0 lt!284368 (select (arr!18010 a!2986) j!136) j!136))))

(declare-fun e!354096 () Unit!20228)

(declare-fun Unit!20231 () Unit!20228)

(assert (=> b!617502 (= e!354096 Unit!20231)))

(declare-fun b!617503 () Bool)

(declare-fun e!354090 () Unit!20228)

(declare-fun Unit!20232 () Unit!20228)

(assert (=> b!617503 (= e!354090 Unit!20232)))

(declare-fun res!397816 () Bool)

(assert (=> b!617503 (= res!397816 (= (select (store (arr!18010 a!2986) i!1108 k0!1786) index!984) (select (arr!18010 a!2986) j!136)))))

(declare-fun e!354098 () Bool)

(assert (=> b!617503 (=> (not res!397816) (not e!354098))))

(assert (=> b!617503 e!354098))

(declare-fun c!70214 () Bool)

(assert (=> b!617503 (= c!70214 (bvslt j!136 index!984))))

(declare-fun lt!284358 () Unit!20228)

(declare-fun e!354088 () Unit!20228)

(assert (=> b!617503 (= lt!284358 e!354088)))

(declare-fun c!70215 () Bool)

(assert (=> b!617503 (= c!70215 (bvslt index!984 j!136))))

(declare-fun lt!284360 () Unit!20228)

(assert (=> b!617503 (= lt!284360 e!354096)))

(assert (=> b!617503 false))

(declare-fun b!617504 () Bool)

(declare-fun e!354091 () Bool)

(declare-fun e!354097 () Bool)

(assert (=> b!617504 (= e!354091 (not e!354097))))

(declare-fun res!397806 () Bool)

(assert (=> b!617504 (=> res!397806 e!354097)))

(declare-fun lt!284361 () SeekEntryResult!6450)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617504 (= res!397806 (not (= lt!284361 (MissingVacant!6450 vacantSpotIndex!68))))))

(declare-fun lt!284362 () Unit!20228)

(assert (=> b!617504 (= lt!284362 e!354090)))

(declare-fun c!70217 () Bool)

(assert (=> b!617504 (= c!70217 (= lt!284361 (Found!6450 index!984)))))

(declare-fun lt!284375 () Unit!20228)

(assert (=> b!617504 (= lt!284375 e!354100)))

(declare-fun c!70216 () Bool)

(assert (=> b!617504 (= c!70216 (= lt!284361 Undefined!6450))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!284364 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37528 (_ BitVec 32)) SeekEntryResult!6450)

(assert (=> b!617504 (= lt!284361 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284364 lt!284368 mask!3053))))

(declare-fun e!354099 () Bool)

(assert (=> b!617504 e!354099))

(declare-fun res!397815 () Bool)

(assert (=> b!617504 (=> (not res!397815) (not e!354099))))

(declare-fun lt!284373 () SeekEntryResult!6450)

(declare-fun lt!284366 () (_ BitVec 32))

(assert (=> b!617504 (= res!397815 (= lt!284373 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284366 vacantSpotIndex!68 lt!284364 lt!284368 mask!3053)))))

(assert (=> b!617504 (= lt!284373 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284366 vacantSpotIndex!68 (select (arr!18010 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617504 (= lt!284364 (select (store (arr!18010 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284359 () Unit!20228)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37528 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20228)

(assert (=> b!617504 (= lt!284359 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284366 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617504 (= lt!284366 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617505 () Bool)

(declare-fun res!397810 () Bool)

(assert (=> b!617505 (=> (not res!397810) (not e!354093))))

(assert (=> b!617505 (= res!397810 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18010 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617506 () Bool)

(declare-fun lt!284367 () SeekEntryResult!6450)

(assert (=> b!617506 (= e!354099 (= lt!284367 lt!284373))))

(declare-fun b!617507 () Bool)

(declare-fun res!397812 () Bool)

(assert (=> b!617507 (=> (not res!397812) (not e!354089))))

(assert (=> b!617507 (= res!397812 (and (= (size!18374 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18374 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18374 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617508 () Bool)

(declare-fun res!397820 () Bool)

(assert (=> b!617508 (=> (not res!397820) (not e!354089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617508 (= res!397820 (validKeyInArray!0 k0!1786))))

(declare-fun b!617509 () Bool)

(declare-fun res!397818 () Bool)

(assert (=> b!617509 (=> (not res!397818) (not e!354093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37528 (_ BitVec 32)) Bool)

(assert (=> b!617509 (= res!397818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617510 () Bool)

(declare-fun res!397804 () Bool)

(assert (=> b!617510 (= res!397804 (bvsge j!136 index!984))))

(assert (=> b!617510 (=> res!397804 e!354094)))

(assert (=> b!617510 (= e!354098 e!354094)))

(declare-fun b!617511 () Bool)

(declare-fun res!397817 () Bool)

(assert (=> b!617511 (=> (not res!397817) (not e!354093))))

(assert (=> b!617511 (= res!397817 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12048))))

(declare-fun b!617512 () Bool)

(assert (=> b!617512 (= e!354092 (arrayContainsKey!0 lt!284368 (select (arr!18010 a!2986) j!136) index!984))))

(declare-fun b!617513 () Bool)

(declare-fun Unit!20233 () Unit!20228)

(assert (=> b!617513 (= e!354090 Unit!20233)))

(declare-fun b!617514 () Bool)

(declare-fun e!354102 () Bool)

(assert (=> b!617514 (= e!354102 e!354091)))

(declare-fun res!397807 () Bool)

(assert (=> b!617514 (=> (not res!397807) (not e!354091))))

(assert (=> b!617514 (= res!397807 (and (= lt!284367 (Found!6450 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18010 a!2986) index!984) (select (arr!18010 a!2986) j!136))) (not (= (select (arr!18010 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617514 (= lt!284367 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18010 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617515 () Bool)

(assert (=> b!617515 (= e!354093 e!354102)))

(declare-fun res!397811 () Bool)

(assert (=> b!617515 (=> (not res!397811) (not e!354102))))

(assert (=> b!617515 (= res!397811 (= (select (store (arr!18010 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617515 (= lt!284368 (array!37529 (store (arr!18010 a!2986) i!1108 k0!1786) (size!18374 a!2986)))))

(declare-fun b!617516 () Bool)

(declare-fun Unit!20234 () Unit!20228)

(assert (=> b!617516 (= e!354100 Unit!20234)))

(assert (=> b!617516 false))

(declare-fun b!617517 () Bool)

(declare-fun Unit!20235 () Unit!20228)

(assert (=> b!617517 (= e!354096 Unit!20235)))

(declare-fun b!617518 () Bool)

(declare-fun res!397819 () Bool)

(assert (=> b!617518 (=> (not res!397819) (not e!354089))))

(assert (=> b!617518 (= res!397819 (validKeyInArray!0 (select (arr!18010 a!2986) j!136)))))

(declare-fun b!617519 () Bool)

(assert (=> b!617519 (= e!354097 true)))

(assert (=> b!617519 (= (select (store (arr!18010 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!397814 () Bool)

(assert (=> start!56058 (=> (not res!397814) (not e!354089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56058 (= res!397814 (validMask!0 mask!3053))))

(assert (=> start!56058 e!354089))

(assert (=> start!56058 true))

(declare-fun array_inv!13806 (array!37528) Bool)

(assert (=> start!56058 (array_inv!13806 a!2986)))

(declare-fun b!617520 () Bool)

(assert (=> b!617520 false))

(declare-fun lt!284365 () Unit!20228)

(assert (=> b!617520 (= lt!284365 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284368 (select (arr!18010 a!2986) j!136) j!136 Nil!12048))))

(assert (=> b!617520 (arrayNoDuplicates!0 lt!284368 j!136 Nil!12048)))

(declare-fun lt!284370 () Unit!20228)

(assert (=> b!617520 (= lt!284370 (lemmaNoDuplicateFromThenFromBigger!0 lt!284368 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617520 (arrayNoDuplicates!0 lt!284368 #b00000000000000000000000000000000 Nil!12048)))

(declare-fun lt!284363 () Unit!20228)

(assert (=> b!617520 (= lt!284363 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12048))))

(assert (=> b!617520 (arrayContainsKey!0 lt!284368 (select (arr!18010 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284371 () Unit!20228)

(assert (=> b!617520 (= lt!284371 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284368 (select (arr!18010 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20236 () Unit!20228)

(assert (=> b!617520 (= e!354088 Unit!20236)))

(declare-fun b!617521 () Bool)

(assert (=> b!617521 (= e!354101 (arrayContainsKey!0 lt!284368 (select (arr!18010 a!2986) j!136) index!984))))

(declare-fun b!617522 () Bool)

(declare-fun Unit!20237 () Unit!20228)

(assert (=> b!617522 (= e!354088 Unit!20237)))

(assert (= (and start!56058 res!397814) b!617507))

(assert (= (and b!617507 res!397812) b!617518))

(assert (= (and b!617518 res!397819) b!617508))

(assert (= (and b!617508 res!397820) b!617501))

(assert (= (and b!617501 res!397808) b!617498))

(assert (= (and b!617498 res!397813) b!617509))

(assert (= (and b!617509 res!397818) b!617511))

(assert (= (and b!617511 res!397817) b!617505))

(assert (= (and b!617505 res!397810) b!617515))

(assert (= (and b!617515 res!397811) b!617514))

(assert (= (and b!617514 res!397807) b!617504))

(assert (= (and b!617504 res!397815) b!617506))

(assert (= (and b!617504 c!70216) b!617516))

(assert (= (and b!617504 (not c!70216)) b!617499))

(assert (= (and b!617504 c!70217) b!617503))

(assert (= (and b!617504 (not c!70217)) b!617513))

(assert (= (and b!617503 res!397816) b!617510))

(assert (= (and b!617510 (not res!397804)) b!617500))

(assert (= (and b!617500 res!397805) b!617512))

(assert (= (and b!617503 c!70214) b!617520))

(assert (= (and b!617503 (not c!70214)) b!617522))

(assert (= (and b!617503 c!70215) b!617502))

(assert (= (and b!617503 (not c!70215)) b!617517))

(assert (= (and b!617502 res!397809) b!617521))

(assert (= (and b!617504 (not res!397806)) b!617519))

(declare-fun m!593601 () Bool)

(assert (=> b!617519 m!593601))

(declare-fun m!593603 () Bool)

(assert (=> b!617519 m!593603))

(assert (=> b!617515 m!593601))

(declare-fun m!593605 () Bool)

(assert (=> b!617515 m!593605))

(declare-fun m!593607 () Bool)

(assert (=> b!617518 m!593607))

(assert (=> b!617518 m!593607))

(declare-fun m!593609 () Bool)

(assert (=> b!617518 m!593609))

(assert (=> b!617500 m!593607))

(assert (=> b!617500 m!593607))

(declare-fun m!593611 () Bool)

(assert (=> b!617500 m!593611))

(assert (=> b!617503 m!593601))

(assert (=> b!617503 m!593603))

(assert (=> b!617503 m!593607))

(declare-fun m!593613 () Bool)

(assert (=> b!617511 m!593613))

(assert (=> b!617521 m!593607))

(assert (=> b!617521 m!593607))

(declare-fun m!593615 () Bool)

(assert (=> b!617521 m!593615))

(assert (=> b!617512 m!593607))

(assert (=> b!617512 m!593607))

(assert (=> b!617512 m!593615))

(declare-fun m!593617 () Bool)

(assert (=> b!617498 m!593617))

(declare-fun m!593619 () Bool)

(assert (=> b!617508 m!593619))

(assert (=> b!617502 m!593607))

(declare-fun m!593621 () Bool)

(assert (=> b!617502 m!593621))

(assert (=> b!617502 m!593607))

(declare-fun m!593623 () Bool)

(assert (=> b!617502 m!593623))

(assert (=> b!617502 m!593607))

(declare-fun m!593625 () Bool)

(assert (=> b!617502 m!593625))

(assert (=> b!617502 m!593607))

(assert (=> b!617502 m!593611))

(declare-fun m!593627 () Bool)

(assert (=> b!617502 m!593627))

(declare-fun m!593629 () Bool)

(assert (=> b!617502 m!593629))

(assert (=> b!617502 m!593607))

(declare-fun m!593631 () Bool)

(assert (=> b!617502 m!593631))

(declare-fun m!593633 () Bool)

(assert (=> b!617502 m!593633))

(declare-fun m!593635 () Bool)

(assert (=> b!617505 m!593635))

(assert (=> b!617520 m!593607))

(declare-fun m!593637 () Bool)

(assert (=> b!617520 m!593637))

(assert (=> b!617520 m!593607))

(declare-fun m!593639 () Bool)

(assert (=> b!617520 m!593639))

(assert (=> b!617520 m!593607))

(declare-fun m!593641 () Bool)

(assert (=> b!617520 m!593641))

(assert (=> b!617520 m!593607))

(declare-fun m!593643 () Bool)

(assert (=> b!617520 m!593643))

(declare-fun m!593645 () Bool)

(assert (=> b!617520 m!593645))

(assert (=> b!617520 m!593629))

(assert (=> b!617520 m!593633))

(declare-fun m!593647 () Bool)

(assert (=> b!617514 m!593647))

(assert (=> b!617514 m!593607))

(assert (=> b!617514 m!593607))

(declare-fun m!593649 () Bool)

(assert (=> b!617514 m!593649))

(declare-fun m!593651 () Bool)

(assert (=> b!617501 m!593651))

(declare-fun m!593653 () Bool)

(assert (=> b!617509 m!593653))

(declare-fun m!593655 () Bool)

(assert (=> start!56058 m!593655))

(declare-fun m!593657 () Bool)

(assert (=> start!56058 m!593657))

(declare-fun m!593659 () Bool)

(assert (=> b!617504 m!593659))

(assert (=> b!617504 m!593607))

(assert (=> b!617504 m!593601))

(declare-fun m!593661 () Bool)

(assert (=> b!617504 m!593661))

(declare-fun m!593663 () Bool)

(assert (=> b!617504 m!593663))

(declare-fun m!593665 () Bool)

(assert (=> b!617504 m!593665))

(declare-fun m!593667 () Bool)

(assert (=> b!617504 m!593667))

(assert (=> b!617504 m!593607))

(declare-fun m!593669 () Bool)

(assert (=> b!617504 m!593669))

(check-sat (not b!617511) (not b!617520) (not b!617502) (not b!617512) (not b!617514) (not b!617498) (not b!617509) (not b!617508) (not start!56058) (not b!617518) (not b!617501) (not b!617500) (not b!617504) (not b!617521))
(check-sat)
