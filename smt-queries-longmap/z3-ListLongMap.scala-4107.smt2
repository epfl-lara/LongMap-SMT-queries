; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56124 () Bool)

(assert start!56124)

(declare-fun b!620282 () Bool)

(assert (=> b!620282 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37608 0))(
  ( (array!37609 (arr!18050 (Array (_ BitVec 32) (_ BitVec 64))) (size!18415 (_ BitVec 32))) )
))
(declare-fun lt!286585 () array!37608)

(declare-datatypes ((Unit!20616 0))(
  ( (Unit!20617) )
))
(declare-fun lt!286603 () Unit!20616)

(declare-fun a!2986 () array!37608)

(declare-datatypes ((List!12130 0))(
  ( (Nil!12127) (Cons!12126 (h!13171 (_ BitVec 64)) (t!18349 List!12130)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37608 (_ BitVec 64) (_ BitVec 32) List!12130) Unit!20616)

(assert (=> b!620282 (= lt!286603 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286585 (select (arr!18050 a!2986) j!136) j!136 Nil!12127))))

(declare-fun arrayNoDuplicates!0 (array!37608 (_ BitVec 32) List!12130) Bool)

(assert (=> b!620282 (arrayNoDuplicates!0 lt!286585 j!136 Nil!12127)))

(declare-fun lt!286589 () Unit!20616)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37608 (_ BitVec 32) (_ BitVec 32)) Unit!20616)

(assert (=> b!620282 (= lt!286589 (lemmaNoDuplicateFromThenFromBigger!0 lt!286585 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620282 (arrayNoDuplicates!0 lt!286585 #b00000000000000000000000000000000 Nil!12127)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!286594 () Unit!20616)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12130) Unit!20616)

(assert (=> b!620282 (= lt!286594 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12127))))

(declare-fun arrayContainsKey!0 (array!37608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620282 (arrayContainsKey!0 lt!286585 (select (arr!18050 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286590 () Unit!20616)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20616)

(assert (=> b!620282 (= lt!286590 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286585 (select (arr!18050 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355752 () Unit!20616)

(declare-fun Unit!20618 () Unit!20616)

(assert (=> b!620282 (= e!355752 Unit!20618)))

(declare-fun b!620283 () Bool)

(declare-fun e!355741 () Bool)

(declare-fun e!355744 () Bool)

(assert (=> b!620283 (= e!355741 e!355744)))

(declare-fun res!399746 () Bool)

(assert (=> b!620283 (=> (not res!399746) (not e!355744))))

(declare-datatypes ((SeekEntryResult!6487 0))(
  ( (MissingZero!6487 (index!28232 (_ BitVec 32))) (Found!6487 (index!28233 (_ BitVec 32))) (Intermediate!6487 (undefined!7299 Bool) (index!28234 (_ BitVec 32)) (x!57018 (_ BitVec 32))) (Undefined!6487) (MissingVacant!6487 (index!28235 (_ BitVec 32))) )
))
(declare-fun lt!286601 () SeekEntryResult!6487)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620283 (= res!399746 (and (= lt!286601 (Found!6487 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18050 a!2986) index!984) (select (arr!18050 a!2986) j!136))) (not (= (select (arr!18050 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37608 (_ BitVec 32)) SeekEntryResult!6487)

(assert (=> b!620283 (= lt!286601 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18050 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620284 () Bool)

(declare-fun e!355742 () Unit!20616)

(declare-fun Unit!20619 () Unit!20616)

(assert (=> b!620284 (= e!355742 Unit!20619)))

(declare-fun b!620285 () Bool)

(declare-fun e!355748 () Bool)

(assert (=> b!620285 (= e!355748 e!355741)))

(declare-fun res!399752 () Bool)

(assert (=> b!620285 (=> (not res!399752) (not e!355741))))

(assert (=> b!620285 (= res!399752 (= (select (store (arr!18050 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620285 (= lt!286585 (array!37609 (store (arr!18050 a!2986) i!1108 k0!1786) (size!18415 a!2986)))))

(declare-fun b!620286 () Bool)

(declare-fun res!399758 () Bool)

(assert (=> b!620286 (= res!399758 (arrayContainsKey!0 lt!286585 (select (arr!18050 a!2986) j!136) j!136))))

(declare-fun e!355747 () Bool)

(assert (=> b!620286 (=> (not res!399758) (not e!355747))))

(declare-fun e!355745 () Bool)

(assert (=> b!620286 (= e!355745 e!355747)))

(declare-fun b!620287 () Bool)

(declare-fun res!399749 () Bool)

(assert (=> b!620287 (=> (not res!399749) (not e!355748))))

(assert (=> b!620287 (= res!399749 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18050 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620288 () Bool)

(declare-fun res!399753 () Bool)

(declare-fun e!355751 () Bool)

(assert (=> b!620288 (=> (not res!399753) (not e!355751))))

(assert (=> b!620288 (= res!399753 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620289 () Bool)

(declare-fun res!399757 () Bool)

(assert (=> b!620289 (=> (not res!399757) (not e!355748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37608 (_ BitVec 32)) Bool)

(assert (=> b!620289 (= res!399757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620290 () Bool)

(assert (=> b!620290 (= e!355751 e!355748)))

(declare-fun res!399747 () Bool)

(assert (=> b!620290 (=> (not res!399747) (not e!355748))))

(declare-fun lt!286596 () SeekEntryResult!6487)

(assert (=> b!620290 (= res!399747 (or (= lt!286596 (MissingZero!6487 i!1108)) (= lt!286596 (MissingVacant!6487 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37608 (_ BitVec 32)) SeekEntryResult!6487)

(assert (=> b!620290 (= lt!286596 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620291 () Bool)

(assert (=> b!620291 (= e!355744 (not true))))

(declare-fun lt!286602 () Unit!20616)

(declare-fun e!355749 () Unit!20616)

(assert (=> b!620291 (= lt!286602 e!355749)))

(declare-fun c!70635 () Bool)

(declare-fun lt!286584 () SeekEntryResult!6487)

(assert (=> b!620291 (= c!70635 (= lt!286584 (Found!6487 index!984)))))

(declare-fun lt!286593 () Unit!20616)

(declare-fun e!355746 () Unit!20616)

(assert (=> b!620291 (= lt!286593 e!355746)))

(declare-fun c!70637 () Bool)

(assert (=> b!620291 (= c!70637 (= lt!286584 Undefined!6487))))

(declare-fun lt!286591 () (_ BitVec 64))

(assert (=> b!620291 (= lt!286584 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286591 lt!286585 mask!3053))))

(declare-fun e!355739 () Bool)

(assert (=> b!620291 e!355739))

(declare-fun res!399748 () Bool)

(assert (=> b!620291 (=> (not res!399748) (not e!355739))))

(declare-fun lt!286598 () SeekEntryResult!6487)

(declare-fun lt!286595 () (_ BitVec 32))

(assert (=> b!620291 (= res!399748 (= lt!286598 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286595 vacantSpotIndex!68 lt!286591 lt!286585 mask!3053)))))

(assert (=> b!620291 (= lt!286598 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286595 vacantSpotIndex!68 (select (arr!18050 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620291 (= lt!286591 (select (store (arr!18050 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286592 () Unit!20616)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37608 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20616)

(assert (=> b!620291 (= lt!286592 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286595 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620291 (= lt!286595 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620292 () Bool)

(declare-fun e!355750 () Bool)

(assert (=> b!620292 (= e!355750 (arrayContainsKey!0 lt!286585 (select (arr!18050 a!2986) j!136) index!984))))

(declare-fun b!620293 () Bool)

(declare-fun res!399755 () Bool)

(assert (=> b!620293 (=> (not res!399755) (not e!355751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620293 (= res!399755 (validKeyInArray!0 (select (arr!18050 a!2986) j!136)))))

(declare-fun b!620294 () Bool)

(assert (=> b!620294 (= e!355739 (= lt!286601 lt!286598))))

(declare-fun b!620295 () Bool)

(declare-fun Unit!20620 () Unit!20616)

(assert (=> b!620295 (= e!355749 Unit!20620)))

(declare-fun res!399756 () Bool)

(assert (=> b!620295 (= res!399756 (= (select (store (arr!18050 a!2986) i!1108 k0!1786) index!984) (select (arr!18050 a!2986) j!136)))))

(declare-fun e!355740 () Bool)

(assert (=> b!620295 (=> (not res!399756) (not e!355740))))

(assert (=> b!620295 e!355740))

(declare-fun c!70636 () Bool)

(assert (=> b!620295 (= c!70636 (bvslt j!136 index!984))))

(declare-fun lt!286586 () Unit!20616)

(assert (=> b!620295 (= lt!286586 e!355752)))

(declare-fun c!70638 () Bool)

(assert (=> b!620295 (= c!70638 (bvslt index!984 j!136))))

(declare-fun lt!286587 () Unit!20616)

(assert (=> b!620295 (= lt!286587 e!355742)))

(assert (=> b!620295 false))

(declare-fun b!620296 () Bool)

(declare-fun res!399754 () Bool)

(assert (=> b!620296 (= res!399754 (bvsge j!136 index!984))))

(assert (=> b!620296 (=> res!399754 e!355745)))

(assert (=> b!620296 (= e!355740 e!355745)))

(declare-fun b!620297 () Bool)

(assert (=> b!620297 false))

(declare-fun lt!286600 () Unit!20616)

(assert (=> b!620297 (= lt!286600 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286585 (select (arr!18050 a!2986) j!136) index!984 Nil!12127))))

(assert (=> b!620297 (arrayNoDuplicates!0 lt!286585 index!984 Nil!12127)))

(declare-fun lt!286588 () Unit!20616)

(assert (=> b!620297 (= lt!286588 (lemmaNoDuplicateFromThenFromBigger!0 lt!286585 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620297 (arrayNoDuplicates!0 lt!286585 #b00000000000000000000000000000000 Nil!12127)))

(declare-fun lt!286597 () Unit!20616)

(assert (=> b!620297 (= lt!286597 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12127))))

(assert (=> b!620297 (arrayContainsKey!0 lt!286585 (select (arr!18050 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286599 () Unit!20616)

(assert (=> b!620297 (= lt!286599 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286585 (select (arr!18050 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620297 e!355750))

(declare-fun res!399759 () Bool)

(assert (=> b!620297 (=> (not res!399759) (not e!355750))))

(assert (=> b!620297 (= res!399759 (arrayContainsKey!0 lt!286585 (select (arr!18050 a!2986) j!136) j!136))))

(declare-fun Unit!20621 () Unit!20616)

(assert (=> b!620297 (= e!355742 Unit!20621)))

(declare-fun b!620298 () Bool)

(declare-fun Unit!20622 () Unit!20616)

(assert (=> b!620298 (= e!355746 Unit!20622)))

(assert (=> b!620298 false))

(declare-fun b!620299 () Bool)

(assert (=> b!620299 (= e!355747 (arrayContainsKey!0 lt!286585 (select (arr!18050 a!2986) j!136) index!984))))

(declare-fun b!620300 () Bool)

(declare-fun res!399750 () Bool)

(assert (=> b!620300 (=> (not res!399750) (not e!355751))))

(assert (=> b!620300 (= res!399750 (and (= (size!18415 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18415 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18415 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620301 () Bool)

(declare-fun Unit!20623 () Unit!20616)

(assert (=> b!620301 (= e!355746 Unit!20623)))

(declare-fun b!620302 () Bool)

(declare-fun Unit!20624 () Unit!20616)

(assert (=> b!620302 (= e!355749 Unit!20624)))

(declare-fun b!620303 () Bool)

(declare-fun res!399760 () Bool)

(assert (=> b!620303 (=> (not res!399760) (not e!355748))))

(assert (=> b!620303 (= res!399760 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12127))))

(declare-fun res!399761 () Bool)

(assert (=> start!56124 (=> (not res!399761) (not e!355751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56124 (= res!399761 (validMask!0 mask!3053))))

(assert (=> start!56124 e!355751))

(assert (=> start!56124 true))

(declare-fun array_inv!13933 (array!37608) Bool)

(assert (=> start!56124 (array_inv!13933 a!2986)))

(declare-fun b!620304 () Bool)

(declare-fun res!399751 () Bool)

(assert (=> b!620304 (=> (not res!399751) (not e!355751))))

(assert (=> b!620304 (= res!399751 (validKeyInArray!0 k0!1786))))

(declare-fun b!620305 () Bool)

(declare-fun Unit!20625 () Unit!20616)

(assert (=> b!620305 (= e!355752 Unit!20625)))

(assert (= (and start!56124 res!399761) b!620300))

(assert (= (and b!620300 res!399750) b!620293))

(assert (= (and b!620293 res!399755) b!620304))

(assert (= (and b!620304 res!399751) b!620288))

(assert (= (and b!620288 res!399753) b!620290))

(assert (= (and b!620290 res!399747) b!620289))

(assert (= (and b!620289 res!399757) b!620303))

(assert (= (and b!620303 res!399760) b!620287))

(assert (= (and b!620287 res!399749) b!620285))

(assert (= (and b!620285 res!399752) b!620283))

(assert (= (and b!620283 res!399746) b!620291))

(assert (= (and b!620291 res!399748) b!620294))

(assert (= (and b!620291 c!70637) b!620298))

(assert (= (and b!620291 (not c!70637)) b!620301))

(assert (= (and b!620291 c!70635) b!620295))

(assert (= (and b!620291 (not c!70635)) b!620302))

(assert (= (and b!620295 res!399756) b!620296))

(assert (= (and b!620296 (not res!399754)) b!620286))

(assert (= (and b!620286 res!399758) b!620299))

(assert (= (and b!620295 c!70636) b!620282))

(assert (= (and b!620295 (not c!70636)) b!620305))

(assert (= (and b!620295 c!70638) b!620297))

(assert (= (and b!620295 (not c!70638)) b!620284))

(assert (= (and b!620297 res!399759) b!620292))

(declare-fun m!595699 () Bool)

(assert (=> b!620288 m!595699))

(declare-fun m!595701 () Bool)

(assert (=> start!56124 m!595701))

(declare-fun m!595703 () Bool)

(assert (=> start!56124 m!595703))

(declare-fun m!595705 () Bool)

(assert (=> b!620283 m!595705))

(declare-fun m!595707 () Bool)

(assert (=> b!620283 m!595707))

(assert (=> b!620283 m!595707))

(declare-fun m!595709 () Bool)

(assert (=> b!620283 m!595709))

(assert (=> b!620292 m!595707))

(assert (=> b!620292 m!595707))

(declare-fun m!595711 () Bool)

(assert (=> b!620292 m!595711))

(declare-fun m!595713 () Bool)

(assert (=> b!620290 m!595713))

(declare-fun m!595715 () Bool)

(assert (=> b!620291 m!595715))

(declare-fun m!595717 () Bool)

(assert (=> b!620291 m!595717))

(assert (=> b!620291 m!595707))

(assert (=> b!620291 m!595707))

(declare-fun m!595719 () Bool)

(assert (=> b!620291 m!595719))

(declare-fun m!595721 () Bool)

(assert (=> b!620291 m!595721))

(declare-fun m!595723 () Bool)

(assert (=> b!620291 m!595723))

(declare-fun m!595725 () Bool)

(assert (=> b!620291 m!595725))

(declare-fun m!595727 () Bool)

(assert (=> b!620291 m!595727))

(assert (=> b!620282 m!595707))

(declare-fun m!595729 () Bool)

(assert (=> b!620282 m!595729))

(assert (=> b!620282 m!595707))

(declare-fun m!595731 () Bool)

(assert (=> b!620282 m!595731))

(assert (=> b!620282 m!595707))

(declare-fun m!595733 () Bool)

(assert (=> b!620282 m!595733))

(assert (=> b!620282 m!595707))

(declare-fun m!595735 () Bool)

(assert (=> b!620282 m!595735))

(declare-fun m!595737 () Bool)

(assert (=> b!620282 m!595737))

(declare-fun m!595739 () Bool)

(assert (=> b!620282 m!595739))

(declare-fun m!595741 () Bool)

(assert (=> b!620282 m!595741))

(declare-fun m!595743 () Bool)

(assert (=> b!620289 m!595743))

(assert (=> b!620286 m!595707))

(assert (=> b!620286 m!595707))

(declare-fun m!595745 () Bool)

(assert (=> b!620286 m!595745))

(assert (=> b!620297 m!595707))

(assert (=> b!620297 m!595745))

(assert (=> b!620297 m!595707))

(declare-fun m!595747 () Bool)

(assert (=> b!620297 m!595747))

(declare-fun m!595749 () Bool)

(assert (=> b!620297 m!595749))

(assert (=> b!620297 m!595707))

(assert (=> b!620297 m!595707))

(declare-fun m!595751 () Bool)

(assert (=> b!620297 m!595751))

(declare-fun m!595753 () Bool)

(assert (=> b!620297 m!595753))

(assert (=> b!620297 m!595707))

(declare-fun m!595755 () Bool)

(assert (=> b!620297 m!595755))

(assert (=> b!620297 m!595741))

(assert (=> b!620297 m!595737))

(assert (=> b!620295 m!595721))

(declare-fun m!595757 () Bool)

(assert (=> b!620295 m!595757))

(assert (=> b!620295 m!595707))

(declare-fun m!595759 () Bool)

(assert (=> b!620303 m!595759))

(declare-fun m!595761 () Bool)

(assert (=> b!620287 m!595761))

(assert (=> b!620299 m!595707))

(assert (=> b!620299 m!595707))

(assert (=> b!620299 m!595711))

(assert (=> b!620293 m!595707))

(assert (=> b!620293 m!595707))

(declare-fun m!595763 () Bool)

(assert (=> b!620293 m!595763))

(declare-fun m!595765 () Bool)

(assert (=> b!620304 m!595765))

(assert (=> b!620285 m!595721))

(declare-fun m!595767 () Bool)

(assert (=> b!620285 m!595767))

(check-sat (not b!620288) (not b!620297) (not b!620282) (not b!620292) (not b!620293) (not b!620291) (not b!620303) (not b!620283) (not b!620286) (not b!620299) (not b!620289) (not b!620290) (not start!56124) (not b!620304))
(check-sat)
