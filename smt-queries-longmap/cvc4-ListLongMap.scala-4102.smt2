; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56114 () Bool)

(assert start!56114)

(declare-fun b!619598 () Bool)

(declare-datatypes ((Unit!20508 0))(
  ( (Unit!20509) )
))
(declare-fun e!355362 () Unit!20508)

(declare-fun Unit!20510 () Unit!20508)

(assert (=> b!619598 (= e!355362 Unit!20510)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!399246 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37584 0))(
  ( (array!37585 (arr!18038 (Array (_ BitVec 32) (_ BitVec 64))) (size!18402 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37584)

(assert (=> b!619598 (= res!399246 (= (select (store (arr!18038 a!2986) i!1108 k!1786) index!984) (select (arr!18038 a!2986) j!136)))))

(declare-fun e!355353 () Bool)

(assert (=> b!619598 (=> (not res!399246) (not e!355353))))

(assert (=> b!619598 e!355353))

(declare-fun c!70553 () Bool)

(assert (=> b!619598 (= c!70553 (bvslt j!136 index!984))))

(declare-fun lt!286047 () Unit!20508)

(declare-fun e!355360 () Unit!20508)

(assert (=> b!619598 (= lt!286047 e!355360)))

(declare-fun c!70552 () Bool)

(assert (=> b!619598 (= c!70552 (bvslt index!984 j!136))))

(declare-fun lt!286057 () Unit!20508)

(declare-fun e!355351 () Unit!20508)

(assert (=> b!619598 (= lt!286057 e!355351)))

(assert (=> b!619598 false))

(declare-fun b!619599 () Bool)

(declare-fun res!399245 () Bool)

(declare-fun e!355354 () Bool)

(assert (=> b!619599 (=> (not res!399245) (not e!355354))))

(declare-fun arrayContainsKey!0 (array!37584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619599 (= res!399245 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619600 () Bool)

(declare-fun e!355359 () Bool)

(assert (=> b!619600 (= e!355359 true)))

(assert (=> b!619600 (= (select (store (arr!18038 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619601 () Bool)

(declare-fun e!355357 () Unit!20508)

(declare-fun Unit!20511 () Unit!20508)

(assert (=> b!619601 (= e!355357 Unit!20511)))

(assert (=> b!619601 false))

(declare-fun b!619602 () Bool)

(declare-fun res!399241 () Bool)

(declare-fun e!355358 () Bool)

(assert (=> b!619602 (=> (not res!399241) (not e!355358))))

(declare-datatypes ((List!12079 0))(
  ( (Nil!12076) (Cons!12075 (h!13120 (_ BitVec 64)) (t!18307 List!12079)) )
))
(declare-fun arrayNoDuplicates!0 (array!37584 (_ BitVec 32) List!12079) Bool)

(assert (=> b!619602 (= res!399241 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12076))))

(declare-fun res!399232 () Bool)

(assert (=> start!56114 (=> (not res!399232) (not e!355354))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56114 (= res!399232 (validMask!0 mask!3053))))

(assert (=> start!56114 e!355354))

(assert (=> start!56114 true))

(declare-fun array_inv!13834 (array!37584) Bool)

(assert (=> start!56114 (array_inv!13834 a!2986)))

(declare-fun b!619603 () Bool)

(declare-fun res!399236 () Bool)

(assert (=> b!619603 (=> (not res!399236) (not e!355354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619603 (= res!399236 (validKeyInArray!0 (select (arr!18038 a!2986) j!136)))))

(declare-fun b!619604 () Bool)

(declare-fun e!355348 () Bool)

(assert (=> b!619604 (= e!355358 e!355348)))

(declare-fun res!399248 () Bool)

(assert (=> b!619604 (=> (not res!399248) (not e!355348))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619604 (= res!399248 (= (select (store (arr!18038 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286040 () array!37584)

(assert (=> b!619604 (= lt!286040 (array!37585 (store (arr!18038 a!2986) i!1108 k!1786) (size!18402 a!2986)))))

(declare-fun b!619605 () Bool)

(declare-fun res!399235 () Bool)

(assert (=> b!619605 (= res!399235 (bvsge j!136 index!984))))

(declare-fun e!355355 () Bool)

(assert (=> b!619605 (=> res!399235 e!355355)))

(assert (=> b!619605 (= e!355353 e!355355)))

(declare-fun b!619606 () Bool)

(declare-fun res!399238 () Bool)

(assert (=> b!619606 (=> (not res!399238) (not e!355354))))

(assert (=> b!619606 (= res!399238 (and (= (size!18402 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18402 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18402 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619607 () Bool)

(declare-fun res!399242 () Bool)

(assert (=> b!619607 (=> (not res!399242) (not e!355358))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619607 (= res!399242 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18038 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619608 () Bool)

(declare-fun Unit!20512 () Unit!20508)

(assert (=> b!619608 (= e!355362 Unit!20512)))

(declare-fun b!619609 () Bool)

(assert (=> b!619609 false))

(declare-fun lt!286038 () Unit!20508)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37584 (_ BitVec 64) (_ BitVec 32) List!12079) Unit!20508)

(assert (=> b!619609 (= lt!286038 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286040 (select (arr!18038 a!2986) j!136) j!136 Nil!12076))))

(assert (=> b!619609 (arrayNoDuplicates!0 lt!286040 j!136 Nil!12076)))

(declare-fun lt!286043 () Unit!20508)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37584 (_ BitVec 32) (_ BitVec 32)) Unit!20508)

(assert (=> b!619609 (= lt!286043 (lemmaNoDuplicateFromThenFromBigger!0 lt!286040 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619609 (arrayNoDuplicates!0 lt!286040 #b00000000000000000000000000000000 Nil!12076)))

(declare-fun lt!286056 () Unit!20508)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37584 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12079) Unit!20508)

(assert (=> b!619609 (= lt!286056 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12076))))

(assert (=> b!619609 (arrayContainsKey!0 lt!286040 (select (arr!18038 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286046 () Unit!20508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37584 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20508)

(assert (=> b!619609 (= lt!286046 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286040 (select (arr!18038 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20513 () Unit!20508)

(assert (=> b!619609 (= e!355360 Unit!20513)))

(declare-fun b!619610 () Bool)

(declare-fun Unit!20514 () Unit!20508)

(assert (=> b!619610 (= e!355360 Unit!20514)))

(declare-fun b!619611 () Bool)

(declare-fun e!355361 () Bool)

(assert (=> b!619611 (= e!355348 e!355361)))

(declare-fun res!399234 () Bool)

(assert (=> b!619611 (=> (not res!399234) (not e!355361))))

(declare-datatypes ((SeekEntryResult!6478 0))(
  ( (MissingZero!6478 (index!28196 (_ BitVec 32))) (Found!6478 (index!28197 (_ BitVec 32))) (Intermediate!6478 (undefined!7290 Bool) (index!28198 (_ BitVec 32)) (x!56974 (_ BitVec 32))) (Undefined!6478) (MissingVacant!6478 (index!28199 (_ BitVec 32))) )
))
(declare-fun lt!286052 () SeekEntryResult!6478)

(assert (=> b!619611 (= res!399234 (and (= lt!286052 (Found!6478 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18038 a!2986) index!984) (select (arr!18038 a!2986) j!136))) (not (= (select (arr!18038 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37584 (_ BitVec 32)) SeekEntryResult!6478)

(assert (=> b!619611 (= lt!286052 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18038 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619612 () Bool)

(declare-fun Unit!20515 () Unit!20508)

(assert (=> b!619612 (= e!355357 Unit!20515)))

(declare-fun b!619613 () Bool)

(assert (=> b!619613 (= e!355361 (not e!355359))))

(declare-fun res!399247 () Bool)

(assert (=> b!619613 (=> res!399247 e!355359)))

(declare-fun lt!286041 () SeekEntryResult!6478)

(assert (=> b!619613 (= res!399247 (not (= lt!286041 (MissingVacant!6478 vacantSpotIndex!68))))))

(declare-fun lt!286050 () Unit!20508)

(assert (=> b!619613 (= lt!286050 e!355362)))

(declare-fun c!70551 () Bool)

(assert (=> b!619613 (= c!70551 (= lt!286041 (Found!6478 index!984)))))

(declare-fun lt!286053 () Unit!20508)

(assert (=> b!619613 (= lt!286053 e!355357)))

(declare-fun c!70550 () Bool)

(assert (=> b!619613 (= c!70550 (= lt!286041 Undefined!6478))))

(declare-fun lt!286045 () (_ BitVec 64))

(assert (=> b!619613 (= lt!286041 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286045 lt!286040 mask!3053))))

(declare-fun e!355352 () Bool)

(assert (=> b!619613 e!355352))

(declare-fun res!399244 () Bool)

(assert (=> b!619613 (=> (not res!399244) (not e!355352))))

(declare-fun lt!286049 () SeekEntryResult!6478)

(declare-fun lt!286048 () (_ BitVec 32))

(assert (=> b!619613 (= res!399244 (= lt!286049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286048 vacantSpotIndex!68 lt!286045 lt!286040 mask!3053)))))

(assert (=> b!619613 (= lt!286049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286048 vacantSpotIndex!68 (select (arr!18038 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619613 (= lt!286045 (select (store (arr!18038 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286039 () Unit!20508)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20508)

(assert (=> b!619613 (= lt!286039 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286048 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619613 (= lt!286048 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!399243 () Bool)

(declare-fun b!619614 () Bool)

(assert (=> b!619614 (= res!399243 (arrayContainsKey!0 lt!286040 (select (arr!18038 a!2986) j!136) j!136))))

(declare-fun e!355349 () Bool)

(assert (=> b!619614 (=> (not res!399243) (not e!355349))))

(assert (=> b!619614 (= e!355355 e!355349)))

(declare-fun b!619615 () Bool)

(declare-fun res!399237 () Bool)

(assert (=> b!619615 (=> (not res!399237) (not e!355358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37584 (_ BitVec 32)) Bool)

(assert (=> b!619615 (= res!399237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619616 () Bool)

(assert (=> b!619616 false))

(declare-fun lt!286051 () Unit!20508)

(assert (=> b!619616 (= lt!286051 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286040 (select (arr!18038 a!2986) j!136) index!984 Nil!12076))))

(assert (=> b!619616 (arrayNoDuplicates!0 lt!286040 index!984 Nil!12076)))

(declare-fun lt!286044 () Unit!20508)

(assert (=> b!619616 (= lt!286044 (lemmaNoDuplicateFromThenFromBigger!0 lt!286040 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619616 (arrayNoDuplicates!0 lt!286040 #b00000000000000000000000000000000 Nil!12076)))

(declare-fun lt!286055 () Unit!20508)

(assert (=> b!619616 (= lt!286055 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12076))))

(assert (=> b!619616 (arrayContainsKey!0 lt!286040 (select (arr!18038 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286042 () Unit!20508)

(assert (=> b!619616 (= lt!286042 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286040 (select (arr!18038 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355356 () Bool)

(assert (=> b!619616 e!355356))

(declare-fun res!399240 () Bool)

(assert (=> b!619616 (=> (not res!399240) (not e!355356))))

(assert (=> b!619616 (= res!399240 (arrayContainsKey!0 lt!286040 (select (arr!18038 a!2986) j!136) j!136))))

(declare-fun Unit!20516 () Unit!20508)

(assert (=> b!619616 (= e!355351 Unit!20516)))

(declare-fun b!619617 () Bool)

(declare-fun res!399239 () Bool)

(assert (=> b!619617 (=> (not res!399239) (not e!355354))))

(assert (=> b!619617 (= res!399239 (validKeyInArray!0 k!1786))))

(declare-fun b!619618 () Bool)

(assert (=> b!619618 (= e!355354 e!355358)))

(declare-fun res!399233 () Bool)

(assert (=> b!619618 (=> (not res!399233) (not e!355358))))

(declare-fun lt!286054 () SeekEntryResult!6478)

(assert (=> b!619618 (= res!399233 (or (= lt!286054 (MissingZero!6478 i!1108)) (= lt!286054 (MissingVacant!6478 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37584 (_ BitVec 32)) SeekEntryResult!6478)

(assert (=> b!619618 (= lt!286054 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619619 () Bool)

(declare-fun Unit!20517 () Unit!20508)

(assert (=> b!619619 (= e!355351 Unit!20517)))

(declare-fun b!619620 () Bool)

(assert (=> b!619620 (= e!355352 (= lt!286052 lt!286049))))

(declare-fun b!619621 () Bool)

(assert (=> b!619621 (= e!355356 (arrayContainsKey!0 lt!286040 (select (arr!18038 a!2986) j!136) index!984))))

(declare-fun b!619622 () Bool)

(assert (=> b!619622 (= e!355349 (arrayContainsKey!0 lt!286040 (select (arr!18038 a!2986) j!136) index!984))))

(assert (= (and start!56114 res!399232) b!619606))

(assert (= (and b!619606 res!399238) b!619603))

(assert (= (and b!619603 res!399236) b!619617))

(assert (= (and b!619617 res!399239) b!619599))

(assert (= (and b!619599 res!399245) b!619618))

(assert (= (and b!619618 res!399233) b!619615))

(assert (= (and b!619615 res!399237) b!619602))

(assert (= (and b!619602 res!399241) b!619607))

(assert (= (and b!619607 res!399242) b!619604))

(assert (= (and b!619604 res!399248) b!619611))

(assert (= (and b!619611 res!399234) b!619613))

(assert (= (and b!619613 res!399244) b!619620))

(assert (= (and b!619613 c!70550) b!619601))

(assert (= (and b!619613 (not c!70550)) b!619612))

(assert (= (and b!619613 c!70551) b!619598))

(assert (= (and b!619613 (not c!70551)) b!619608))

(assert (= (and b!619598 res!399246) b!619605))

(assert (= (and b!619605 (not res!399235)) b!619614))

(assert (= (and b!619614 res!399243) b!619622))

(assert (= (and b!619598 c!70553) b!619609))

(assert (= (and b!619598 (not c!70553)) b!619610))

(assert (= (and b!619598 c!70552) b!619616))

(assert (= (and b!619598 (not c!70552)) b!619619))

(assert (= (and b!619616 res!399240) b!619621))

(assert (= (and b!619613 (not res!399247)) b!619600))

(declare-fun m!595561 () Bool)

(assert (=> b!619616 m!595561))

(assert (=> b!619616 m!595561))

(declare-fun m!595563 () Bool)

(assert (=> b!619616 m!595563))

(declare-fun m!595565 () Bool)

(assert (=> b!619616 m!595565))

(assert (=> b!619616 m!595561))

(declare-fun m!595567 () Bool)

(assert (=> b!619616 m!595567))

(declare-fun m!595569 () Bool)

(assert (=> b!619616 m!595569))

(declare-fun m!595571 () Bool)

(assert (=> b!619616 m!595571))

(assert (=> b!619616 m!595561))

(declare-fun m!595573 () Bool)

(assert (=> b!619616 m!595573))

(declare-fun m!595575 () Bool)

(assert (=> b!619616 m!595575))

(assert (=> b!619616 m!595561))

(declare-fun m!595577 () Bool)

(assert (=> b!619616 m!595577))

(declare-fun m!595579 () Bool)

(assert (=> b!619618 m!595579))

(declare-fun m!595581 () Bool)

(assert (=> b!619602 m!595581))

(declare-fun m!595583 () Bool)

(assert (=> b!619613 m!595583))

(declare-fun m!595585 () Bool)

(assert (=> b!619613 m!595585))

(assert (=> b!619613 m!595561))

(assert (=> b!619613 m!595561))

(declare-fun m!595587 () Bool)

(assert (=> b!619613 m!595587))

(declare-fun m!595589 () Bool)

(assert (=> b!619613 m!595589))

(declare-fun m!595591 () Bool)

(assert (=> b!619613 m!595591))

(declare-fun m!595593 () Bool)

(assert (=> b!619613 m!595593))

(declare-fun m!595595 () Bool)

(assert (=> b!619613 m!595595))

(declare-fun m!595597 () Bool)

(assert (=> b!619617 m!595597))

(declare-fun m!595599 () Bool)

(assert (=> b!619615 m!595599))

(assert (=> b!619600 m!595589))

(declare-fun m!595601 () Bool)

(assert (=> b!619600 m!595601))

(declare-fun m!595603 () Bool)

(assert (=> start!56114 m!595603))

(declare-fun m!595605 () Bool)

(assert (=> start!56114 m!595605))

(declare-fun m!595607 () Bool)

(assert (=> b!619599 m!595607))

(assert (=> b!619622 m!595561))

(assert (=> b!619622 m!595561))

(declare-fun m!595609 () Bool)

(assert (=> b!619622 m!595609))

(assert (=> b!619603 m!595561))

(assert (=> b!619603 m!595561))

(declare-fun m!595611 () Bool)

(assert (=> b!619603 m!595611))

(assert (=> b!619604 m!595589))

(declare-fun m!595613 () Bool)

(assert (=> b!619604 m!595613))

(assert (=> b!619614 m!595561))

(assert (=> b!619614 m!595561))

(assert (=> b!619614 m!595577))

(declare-fun m!595615 () Bool)

(assert (=> b!619607 m!595615))

(assert (=> b!619598 m!595589))

(assert (=> b!619598 m!595601))

(assert (=> b!619598 m!595561))

(assert (=> b!619621 m!595561))

(assert (=> b!619621 m!595561))

(assert (=> b!619621 m!595609))

(assert (=> b!619609 m!595561))

(assert (=> b!619609 m!595561))

(declare-fun m!595617 () Bool)

(assert (=> b!619609 m!595617))

(assert (=> b!619609 m!595561))

(declare-fun m!595619 () Bool)

(assert (=> b!619609 m!595619))

(assert (=> b!619609 m!595561))

(declare-fun m!595621 () Bool)

(assert (=> b!619609 m!595621))

(declare-fun m!595623 () Bool)

(assert (=> b!619609 m!595623))

(assert (=> b!619609 m!595569))

(declare-fun m!595625 () Bool)

(assert (=> b!619609 m!595625))

(assert (=> b!619609 m!595571))

(declare-fun m!595627 () Bool)

(assert (=> b!619611 m!595627))

(assert (=> b!619611 m!595561))

(assert (=> b!619611 m!595561))

(declare-fun m!595629 () Bool)

(assert (=> b!619611 m!595629))

(push 1)

