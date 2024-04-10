; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57914 () Bool)

(assert start!57914)

(declare-fun b!640430 () Bool)

(declare-datatypes ((Unit!21654 0))(
  ( (Unit!21655) )
))
(declare-fun e!366611 () Unit!21654)

(declare-fun Unit!21656 () Unit!21654)

(assert (=> b!640430 (= e!366611 Unit!21656)))

(declare-fun b!640431 () Bool)

(declare-fun res!414706 () Bool)

(declare-fun e!366610 () Bool)

(assert (=> b!640431 (=> (not res!414706) (not e!366610))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38341 0))(
  ( (array!38342 (arr!18390 (Array (_ BitVec 32) (_ BitVec 64))) (size!18754 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38341)

(assert (=> b!640431 (= res!414706 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18390 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640432 () Bool)

(declare-fun e!366601 () Bool)

(assert (=> b!640432 (= e!366601 true)))

(declare-fun lt!296391 () array!38341)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((List!12431 0))(
  ( (Nil!12428) (Cons!12427 (h!13472 (_ BitVec 64)) (t!18659 List!12431)) )
))
(declare-fun arrayNoDuplicates!0 (array!38341 (_ BitVec 32) List!12431) Bool)

(assert (=> b!640432 (arrayNoDuplicates!0 lt!296391 j!136 Nil!12428)))

(declare-fun lt!296387 () Unit!21654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38341 (_ BitVec 32) (_ BitVec 32)) Unit!21654)

(assert (=> b!640432 (= lt!296387 (lemmaNoDuplicateFromThenFromBigger!0 lt!296391 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640432 (arrayNoDuplicates!0 lt!296391 #b00000000000000000000000000000000 Nil!12428)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!296390 () Unit!21654)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12431) Unit!21654)

(assert (=> b!640432 (= lt!296390 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12428))))

(declare-fun arrayContainsKey!0 (array!38341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640432 (arrayContainsKey!0 lt!296391 (select (arr!18390 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296398 () Unit!21654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21654)

(assert (=> b!640432 (= lt!296398 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296391 (select (arr!18390 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640433 () Bool)

(declare-fun res!414709 () Bool)

(declare-fun e!366602 () Bool)

(assert (=> b!640433 (=> (not res!414709) (not e!366602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640433 (= res!414709 (validKeyInArray!0 k!1786))))

(declare-fun b!640434 () Bool)

(declare-fun e!366612 () Bool)

(declare-fun e!366608 () Bool)

(assert (=> b!640434 (= e!366612 e!366608)))

(declare-fun res!414702 () Bool)

(assert (=> b!640434 (=> res!414702 e!366608)))

(declare-fun lt!296397 () (_ BitVec 64))

(declare-fun lt!296389 () (_ BitVec 64))

(assert (=> b!640434 (= res!414702 (or (not (= (select (arr!18390 a!2986) j!136) lt!296389)) (not (= (select (arr!18390 a!2986) j!136) lt!296397)) (bvsge j!136 index!984)))))

(declare-fun b!640435 () Bool)

(declare-fun e!366607 () Bool)

(declare-fun e!366603 () Bool)

(assert (=> b!640435 (= e!366607 (not e!366603))))

(declare-fun res!414694 () Bool)

(assert (=> b!640435 (=> res!414694 e!366603)))

(declare-datatypes ((SeekEntryResult!6830 0))(
  ( (MissingZero!6830 (index!29640 (_ BitVec 32))) (Found!6830 (index!29641 (_ BitVec 32))) (Intermediate!6830 (undefined!7642 Bool) (index!29642 (_ BitVec 32)) (x!58402 (_ BitVec 32))) (Undefined!6830) (MissingVacant!6830 (index!29643 (_ BitVec 32))) )
))
(declare-fun lt!296392 () SeekEntryResult!6830)

(assert (=> b!640435 (= res!414694 (not (= lt!296392 (Found!6830 index!984))))))

(declare-fun lt!296388 () Unit!21654)

(assert (=> b!640435 (= lt!296388 e!366611)))

(declare-fun c!73235 () Bool)

(assert (=> b!640435 (= c!73235 (= lt!296392 Undefined!6830))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38341 (_ BitVec 32)) SeekEntryResult!6830)

(assert (=> b!640435 (= lt!296392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296389 lt!296391 mask!3053))))

(declare-fun e!366609 () Bool)

(assert (=> b!640435 e!366609))

(declare-fun res!414700 () Bool)

(assert (=> b!640435 (=> (not res!414700) (not e!366609))))

(declare-fun lt!296393 () SeekEntryResult!6830)

(declare-fun lt!296394 () (_ BitVec 32))

(assert (=> b!640435 (= res!414700 (= lt!296393 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296394 vacantSpotIndex!68 lt!296389 lt!296391 mask!3053)))))

(assert (=> b!640435 (= lt!296393 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296394 vacantSpotIndex!68 (select (arr!18390 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640435 (= lt!296389 (select (store (arr!18390 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296386 () Unit!21654)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21654)

(assert (=> b!640435 (= lt!296386 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296394 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640435 (= lt!296394 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640436 () Bool)

(declare-fun lt!296395 () SeekEntryResult!6830)

(assert (=> b!640436 (= e!366609 (= lt!296395 lt!296393))))

(declare-fun b!640437 () Bool)

(assert (=> b!640437 (= e!366603 e!366601)))

(declare-fun res!414699 () Bool)

(assert (=> b!640437 (=> res!414699 e!366601)))

(assert (=> b!640437 (= res!414699 (or (not (= (select (arr!18390 a!2986) j!136) lt!296389)) (not (= (select (arr!18390 a!2986) j!136) lt!296397)) (bvsge j!136 index!984)))))

(assert (=> b!640437 e!366612))

(declare-fun res!414704 () Bool)

(assert (=> b!640437 (=> (not res!414704) (not e!366612))))

(assert (=> b!640437 (= res!414704 (= lt!296397 (select (arr!18390 a!2986) j!136)))))

(assert (=> b!640437 (= lt!296397 (select (store (arr!18390 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!414695 () Bool)

(assert (=> start!57914 (=> (not res!414695) (not e!366602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57914 (= res!414695 (validMask!0 mask!3053))))

(assert (=> start!57914 e!366602))

(assert (=> start!57914 true))

(declare-fun array_inv!14186 (array!38341) Bool)

(assert (=> start!57914 (array_inv!14186 a!2986)))

(declare-fun b!640438 () Bool)

(assert (=> b!640438 (= e!366602 e!366610)))

(declare-fun res!414697 () Bool)

(assert (=> b!640438 (=> (not res!414697) (not e!366610))))

(declare-fun lt!296396 () SeekEntryResult!6830)

(assert (=> b!640438 (= res!414697 (or (= lt!296396 (MissingZero!6830 i!1108)) (= lt!296396 (MissingVacant!6830 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38341 (_ BitVec 32)) SeekEntryResult!6830)

(assert (=> b!640438 (= lt!296396 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640439 () Bool)

(declare-fun res!414705 () Bool)

(assert (=> b!640439 (=> (not res!414705) (not e!366602))))

(assert (=> b!640439 (= res!414705 (validKeyInArray!0 (select (arr!18390 a!2986) j!136)))))

(declare-fun b!640440 () Bool)

(declare-fun res!414696 () Bool)

(assert (=> b!640440 (=> (not res!414696) (not e!366610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38341 (_ BitVec 32)) Bool)

(assert (=> b!640440 (= res!414696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640441 () Bool)

(declare-fun e!366605 () Bool)

(assert (=> b!640441 (= e!366605 e!366607)))

(declare-fun res!414701 () Bool)

(assert (=> b!640441 (=> (not res!414701) (not e!366607))))

(assert (=> b!640441 (= res!414701 (and (= lt!296395 (Found!6830 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18390 a!2986) index!984) (select (arr!18390 a!2986) j!136))) (not (= (select (arr!18390 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640441 (= lt!296395 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18390 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640442 () Bool)

(declare-fun e!366604 () Bool)

(assert (=> b!640442 (= e!366604 (arrayContainsKey!0 lt!296391 (select (arr!18390 a!2986) j!136) index!984))))

(declare-fun b!640443 () Bool)

(declare-fun res!414708 () Bool)

(assert (=> b!640443 (=> (not res!414708) (not e!366610))))

(assert (=> b!640443 (= res!414708 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12428))))

(declare-fun b!640444 () Bool)

(declare-fun res!414707 () Bool)

(assert (=> b!640444 (=> (not res!414707) (not e!366602))))

(assert (=> b!640444 (= res!414707 (and (= (size!18754 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18754 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18754 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640445 () Bool)

(assert (=> b!640445 (= e!366610 e!366605)))

(declare-fun res!414710 () Bool)

(assert (=> b!640445 (=> (not res!414710) (not e!366605))))

(assert (=> b!640445 (= res!414710 (= (select (store (arr!18390 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640445 (= lt!296391 (array!38342 (store (arr!18390 a!2986) i!1108 k!1786) (size!18754 a!2986)))))

(declare-fun b!640446 () Bool)

(declare-fun Unit!21657 () Unit!21654)

(assert (=> b!640446 (= e!366611 Unit!21657)))

(assert (=> b!640446 false))

(declare-fun b!640447 () Bool)

(declare-fun res!414703 () Bool)

(assert (=> b!640447 (=> (not res!414703) (not e!366602))))

(assert (=> b!640447 (= res!414703 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640448 () Bool)

(assert (=> b!640448 (= e!366608 e!366604)))

(declare-fun res!414698 () Bool)

(assert (=> b!640448 (=> (not res!414698) (not e!366604))))

(assert (=> b!640448 (= res!414698 (arrayContainsKey!0 lt!296391 (select (arr!18390 a!2986) j!136) j!136))))

(assert (= (and start!57914 res!414695) b!640444))

(assert (= (and b!640444 res!414707) b!640439))

(assert (= (and b!640439 res!414705) b!640433))

(assert (= (and b!640433 res!414709) b!640447))

(assert (= (and b!640447 res!414703) b!640438))

(assert (= (and b!640438 res!414697) b!640440))

(assert (= (and b!640440 res!414696) b!640443))

(assert (= (and b!640443 res!414708) b!640431))

(assert (= (and b!640431 res!414706) b!640445))

(assert (= (and b!640445 res!414710) b!640441))

(assert (= (and b!640441 res!414701) b!640435))

(assert (= (and b!640435 res!414700) b!640436))

(assert (= (and b!640435 c!73235) b!640446))

(assert (= (and b!640435 (not c!73235)) b!640430))

(assert (= (and b!640435 (not res!414694)) b!640437))

(assert (= (and b!640437 res!414704) b!640434))

(assert (= (and b!640434 (not res!414702)) b!640448))

(assert (= (and b!640448 res!414698) b!640442))

(assert (= (and b!640437 (not res!414699)) b!640432))

(declare-fun m!614261 () Bool)

(assert (=> b!640435 m!614261))

(declare-fun m!614263 () Bool)

(assert (=> b!640435 m!614263))

(declare-fun m!614265 () Bool)

(assert (=> b!640435 m!614265))

(declare-fun m!614267 () Bool)

(assert (=> b!640435 m!614267))

(declare-fun m!614269 () Bool)

(assert (=> b!640435 m!614269))

(declare-fun m!614271 () Bool)

(assert (=> b!640435 m!614271))

(assert (=> b!640435 m!614265))

(declare-fun m!614273 () Bool)

(assert (=> b!640435 m!614273))

(declare-fun m!614275 () Bool)

(assert (=> b!640435 m!614275))

(declare-fun m!614277 () Bool)

(assert (=> b!640433 m!614277))

(declare-fun m!614279 () Bool)

(assert (=> b!640443 m!614279))

(declare-fun m!614281 () Bool)

(assert (=> b!640438 m!614281))

(declare-fun m!614283 () Bool)

(assert (=> start!57914 m!614283))

(declare-fun m!614285 () Bool)

(assert (=> start!57914 m!614285))

(assert (=> b!640442 m!614265))

(assert (=> b!640442 m!614265))

(declare-fun m!614287 () Bool)

(assert (=> b!640442 m!614287))

(assert (=> b!640432 m!614265))

(declare-fun m!614289 () Bool)

(assert (=> b!640432 m!614289))

(declare-fun m!614291 () Bool)

(assert (=> b!640432 m!614291))

(declare-fun m!614293 () Bool)

(assert (=> b!640432 m!614293))

(assert (=> b!640432 m!614265))

(declare-fun m!614295 () Bool)

(assert (=> b!640432 m!614295))

(assert (=> b!640432 m!614265))

(declare-fun m!614297 () Bool)

(assert (=> b!640432 m!614297))

(declare-fun m!614299 () Bool)

(assert (=> b!640432 m!614299))

(assert (=> b!640439 m!614265))

(assert (=> b!640439 m!614265))

(declare-fun m!614301 () Bool)

(assert (=> b!640439 m!614301))

(declare-fun m!614303 () Bool)

(assert (=> b!640447 m!614303))

(declare-fun m!614305 () Bool)

(assert (=> b!640440 m!614305))

(assert (=> b!640448 m!614265))

(assert (=> b!640448 m!614265))

(declare-fun m!614307 () Bool)

(assert (=> b!640448 m!614307))

(assert (=> b!640434 m!614265))

(assert (=> b!640445 m!614267))

(declare-fun m!614309 () Bool)

(assert (=> b!640445 m!614309))

(assert (=> b!640437 m!614265))

(assert (=> b!640437 m!614267))

(declare-fun m!614311 () Bool)

(assert (=> b!640437 m!614311))

(declare-fun m!614313 () Bool)

(assert (=> b!640431 m!614313))

(declare-fun m!614315 () Bool)

(assert (=> b!640441 m!614315))

(assert (=> b!640441 m!614265))

(assert (=> b!640441 m!614265))

(declare-fun m!614317 () Bool)

(assert (=> b!640441 m!614317))

(push 1)

