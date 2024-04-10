; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57724 () Bool)

(assert start!57724)

(declare-fun b!638651 () Bool)

(declare-datatypes ((Unit!21574 0))(
  ( (Unit!21575) )
))
(declare-fun e!365460 () Unit!21574)

(declare-fun Unit!21576 () Unit!21574)

(assert (=> b!638651 (= e!365460 Unit!21576)))

(assert (=> b!638651 false))

(declare-fun b!638652 () Bool)

(declare-fun Unit!21577 () Unit!21574)

(assert (=> b!638652 (= e!365460 Unit!21577)))

(declare-fun b!638653 () Bool)

(declare-fun res!413462 () Bool)

(declare-fun e!365454 () Bool)

(assert (=> b!638653 (=> (not res!413462) (not e!365454))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38295 0))(
  ( (array!38296 (arr!18370 (Array (_ BitVec 32) (_ BitVec 64))) (size!18734 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38295)

(assert (=> b!638653 (= res!413462 (and (= (size!18734 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18734 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18734 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638654 () Bool)

(declare-fun res!413453 () Bool)

(declare-fun e!365458 () Bool)

(assert (=> b!638654 (=> (not res!413453) (not e!365458))))

(declare-datatypes ((List!12411 0))(
  ( (Nil!12408) (Cons!12407 (h!13452 (_ BitVec 64)) (t!18639 List!12411)) )
))
(declare-fun arrayNoDuplicates!0 (array!38295 (_ BitVec 32) List!12411) Bool)

(assert (=> b!638654 (= res!413453 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12408))))

(declare-fun b!638655 () Bool)

(assert (=> b!638655 (= e!365454 e!365458)))

(declare-fun res!413465 () Bool)

(assert (=> b!638655 (=> (not res!413465) (not e!365458))))

(declare-datatypes ((SeekEntryResult!6810 0))(
  ( (MissingZero!6810 (index!29554 (_ BitVec 32))) (Found!6810 (index!29555 (_ BitVec 32))) (Intermediate!6810 (undefined!7622 Bool) (index!29556 (_ BitVec 32)) (x!58308 (_ BitVec 32))) (Undefined!6810) (MissingVacant!6810 (index!29557 (_ BitVec 32))) )
))
(declare-fun lt!295394 () SeekEntryResult!6810)

(assert (=> b!638655 (= res!413465 (or (= lt!295394 (MissingZero!6810 i!1108)) (= lt!295394 (MissingVacant!6810 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38295 (_ BitVec 32)) SeekEntryResult!6810)

(assert (=> b!638655 (= lt!295394 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638656 () Bool)

(declare-fun e!365459 () Bool)

(declare-fun lt!295389 () array!38295)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638656 (= e!365459 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) index!984))))

(declare-fun b!638657 () Bool)

(declare-fun e!365457 () Bool)

(declare-fun e!365452 () Bool)

(assert (=> b!638657 (= e!365457 e!365452)))

(declare-fun res!413463 () Bool)

(assert (=> b!638657 (=> res!413463 e!365452)))

(declare-fun lt!295386 () (_ BitVec 64))

(declare-fun lt!295390 () (_ BitVec 64))

(assert (=> b!638657 (= res!413463 (or (not (= (select (arr!18370 a!2986) j!136) lt!295386)) (not (= (select (arr!18370 a!2986) j!136) lt!295390)) (bvsge j!136 index!984)))))

(declare-fun e!365451 () Bool)

(assert (=> b!638657 e!365451))

(declare-fun res!413451 () Bool)

(assert (=> b!638657 (=> (not res!413451) (not e!365451))))

(assert (=> b!638657 (= res!413451 (= lt!295390 (select (arr!18370 a!2986) j!136)))))

(assert (=> b!638657 (= lt!295390 (select (store (arr!18370 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638658 () Bool)

(declare-fun e!365449 () Bool)

(assert (=> b!638658 (= e!365449 e!365459)))

(declare-fun res!413455 () Bool)

(assert (=> b!638658 (=> (not res!413455) (not e!365459))))

(assert (=> b!638658 (= res!413455 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) j!136))))

(declare-fun b!638659 () Bool)

(declare-fun res!413460 () Bool)

(assert (=> b!638659 (=> (not res!413460) (not e!365454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638659 (= res!413460 (validKeyInArray!0 k0!1786))))

(declare-fun b!638661 () Bool)

(assert (=> b!638661 (= e!365452 (bvslt (size!18734 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!638661 (arrayNoDuplicates!0 lt!295389 #b00000000000000000000000000000000 Nil!12408)))

(declare-fun lt!295391 () Unit!21574)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12411) Unit!21574)

(assert (=> b!638661 (= lt!295391 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12408))))

(assert (=> b!638661 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295395 () Unit!21574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21574)

(assert (=> b!638661 (= lt!295395 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295389 (select (arr!18370 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638662 () Bool)

(declare-fun res!413454 () Bool)

(assert (=> b!638662 (=> (not res!413454) (not e!365458))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638662 (= res!413454 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18370 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638663 () Bool)

(declare-fun res!413459 () Bool)

(assert (=> b!638663 (=> (not res!413459) (not e!365454))))

(assert (=> b!638663 (= res!413459 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638664 () Bool)

(declare-fun e!365453 () Bool)

(assert (=> b!638664 (= e!365458 e!365453)))

(declare-fun res!413450 () Bool)

(assert (=> b!638664 (=> (not res!413450) (not e!365453))))

(assert (=> b!638664 (= res!413450 (= (select (store (arr!18370 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638664 (= lt!295389 (array!38296 (store (arr!18370 a!2986) i!1108 k0!1786) (size!18734 a!2986)))))

(declare-fun b!638665 () Bool)

(declare-fun res!413449 () Bool)

(assert (=> b!638665 (=> (not res!413449) (not e!365454))))

(assert (=> b!638665 (= res!413449 (validKeyInArray!0 (select (arr!18370 a!2986) j!136)))))

(declare-fun b!638666 () Bool)

(assert (=> b!638666 (= e!365451 e!365449)))

(declare-fun res!413464 () Bool)

(assert (=> b!638666 (=> res!413464 e!365449)))

(assert (=> b!638666 (= res!413464 (or (not (= (select (arr!18370 a!2986) j!136) lt!295386)) (not (= (select (arr!18370 a!2986) j!136) lt!295390)) (bvsge j!136 index!984)))))

(declare-fun b!638667 () Bool)

(declare-fun e!365455 () Bool)

(assert (=> b!638667 (= e!365453 e!365455)))

(declare-fun res!413458 () Bool)

(assert (=> b!638667 (=> (not res!413458) (not e!365455))))

(declare-fun lt!295393 () SeekEntryResult!6810)

(assert (=> b!638667 (= res!413458 (and (= lt!295393 (Found!6810 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18370 a!2986) index!984) (select (arr!18370 a!2986) j!136))) (not (= (select (arr!18370 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38295 (_ BitVec 32)) SeekEntryResult!6810)

(assert (=> b!638667 (= lt!295393 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638668 () Bool)

(declare-fun e!365450 () Bool)

(declare-fun lt!295392 () SeekEntryResult!6810)

(assert (=> b!638668 (= e!365450 (= lt!295393 lt!295392))))

(declare-fun b!638669 () Bool)

(assert (=> b!638669 (= e!365455 (not e!365457))))

(declare-fun res!413456 () Bool)

(assert (=> b!638669 (=> res!413456 e!365457)))

(declare-fun lt!295387 () SeekEntryResult!6810)

(assert (=> b!638669 (= res!413456 (not (= lt!295387 (Found!6810 index!984))))))

(declare-fun lt!295385 () Unit!21574)

(assert (=> b!638669 (= lt!295385 e!365460)))

(declare-fun c!72968 () Bool)

(assert (=> b!638669 (= c!72968 (= lt!295387 Undefined!6810))))

(assert (=> b!638669 (= lt!295387 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295386 lt!295389 mask!3053))))

(assert (=> b!638669 e!365450))

(declare-fun res!413457 () Bool)

(assert (=> b!638669 (=> (not res!413457) (not e!365450))))

(declare-fun lt!295396 () (_ BitVec 32))

(assert (=> b!638669 (= res!413457 (= lt!295392 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 lt!295386 lt!295389 mask!3053)))))

(assert (=> b!638669 (= lt!295392 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638669 (= lt!295386 (select (store (arr!18370 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295388 () Unit!21574)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38295 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21574)

(assert (=> b!638669 (= lt!295388 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638669 (= lt!295396 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!413461 () Bool)

(assert (=> start!57724 (=> (not res!413461) (not e!365454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57724 (= res!413461 (validMask!0 mask!3053))))

(assert (=> start!57724 e!365454))

(assert (=> start!57724 true))

(declare-fun array_inv!14166 (array!38295) Bool)

(assert (=> start!57724 (array_inv!14166 a!2986)))

(declare-fun b!638660 () Bool)

(declare-fun res!413452 () Bool)

(assert (=> b!638660 (=> (not res!413452) (not e!365458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38295 (_ BitVec 32)) Bool)

(assert (=> b!638660 (= res!413452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57724 res!413461) b!638653))

(assert (= (and b!638653 res!413462) b!638665))

(assert (= (and b!638665 res!413449) b!638659))

(assert (= (and b!638659 res!413460) b!638663))

(assert (= (and b!638663 res!413459) b!638655))

(assert (= (and b!638655 res!413465) b!638660))

(assert (= (and b!638660 res!413452) b!638654))

(assert (= (and b!638654 res!413453) b!638662))

(assert (= (and b!638662 res!413454) b!638664))

(assert (= (and b!638664 res!413450) b!638667))

(assert (= (and b!638667 res!413458) b!638669))

(assert (= (and b!638669 res!413457) b!638668))

(assert (= (and b!638669 c!72968) b!638651))

(assert (= (and b!638669 (not c!72968)) b!638652))

(assert (= (and b!638669 (not res!413456)) b!638657))

(assert (= (and b!638657 res!413451) b!638666))

(assert (= (and b!638666 (not res!413464)) b!638658))

(assert (= (and b!638658 res!413455) b!638656))

(assert (= (and b!638657 (not res!413463)) b!638661))

(declare-fun m!612569 () Bool)

(assert (=> b!638655 m!612569))

(declare-fun m!612571 () Bool)

(assert (=> b!638664 m!612571))

(declare-fun m!612573 () Bool)

(assert (=> b!638664 m!612573))

(declare-fun m!612575 () Bool)

(assert (=> b!638658 m!612575))

(assert (=> b!638658 m!612575))

(declare-fun m!612577 () Bool)

(assert (=> b!638658 m!612577))

(assert (=> b!638657 m!612575))

(assert (=> b!638657 m!612571))

(declare-fun m!612579 () Bool)

(assert (=> b!638657 m!612579))

(declare-fun m!612581 () Bool)

(assert (=> b!638659 m!612581))

(declare-fun m!612583 () Bool)

(assert (=> b!638669 m!612583))

(declare-fun m!612585 () Bool)

(assert (=> b!638669 m!612585))

(assert (=> b!638669 m!612575))

(declare-fun m!612587 () Bool)

(assert (=> b!638669 m!612587))

(assert (=> b!638669 m!612575))

(declare-fun m!612589 () Bool)

(assert (=> b!638669 m!612589))

(declare-fun m!612591 () Bool)

(assert (=> b!638669 m!612591))

(declare-fun m!612593 () Bool)

(assert (=> b!638669 m!612593))

(assert (=> b!638669 m!612571))

(declare-fun m!612595 () Bool)

(assert (=> b!638661 m!612595))

(assert (=> b!638661 m!612575))

(assert (=> b!638661 m!612575))

(declare-fun m!612597 () Bool)

(assert (=> b!638661 m!612597))

(assert (=> b!638661 m!612575))

(declare-fun m!612599 () Bool)

(assert (=> b!638661 m!612599))

(declare-fun m!612601 () Bool)

(assert (=> b!638661 m!612601))

(assert (=> b!638666 m!612575))

(declare-fun m!612603 () Bool)

(assert (=> b!638662 m!612603))

(declare-fun m!612605 () Bool)

(assert (=> start!57724 m!612605))

(declare-fun m!612607 () Bool)

(assert (=> start!57724 m!612607))

(assert (=> b!638656 m!612575))

(assert (=> b!638656 m!612575))

(declare-fun m!612609 () Bool)

(assert (=> b!638656 m!612609))

(assert (=> b!638665 m!612575))

(assert (=> b!638665 m!612575))

(declare-fun m!612611 () Bool)

(assert (=> b!638665 m!612611))

(declare-fun m!612613 () Bool)

(assert (=> b!638654 m!612613))

(declare-fun m!612615 () Bool)

(assert (=> b!638660 m!612615))

(declare-fun m!612617 () Bool)

(assert (=> b!638663 m!612617))

(declare-fun m!612619 () Bool)

(assert (=> b!638667 m!612619))

(assert (=> b!638667 m!612575))

(assert (=> b!638667 m!612575))

(declare-fun m!612621 () Bool)

(assert (=> b!638667 m!612621))

(check-sat (not start!57724) (not b!638659) (not b!638656) (not b!638658) (not b!638667) (not b!638661) (not b!638655) (not b!638669) (not b!638660) (not b!638654) (not b!638665) (not b!638663))
(check-sat)
(get-model)

(declare-fun bm!33467 () Bool)

(declare-fun call!33470 () Bool)

(assert (=> bm!33467 (= call!33470 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90213 () Bool)

(declare-fun res!413521 () Bool)

(declare-fun e!365505 () Bool)

(assert (=> d!90213 (=> res!413521 e!365505)))

(assert (=> d!90213 (= res!413521 (bvsge #b00000000000000000000000000000000 (size!18734 a!2986)))))

(assert (=> d!90213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!365505)))

(declare-fun b!638735 () Bool)

(declare-fun e!365503 () Bool)

(assert (=> b!638735 (= e!365505 e!365503)))

(declare-fun c!72974 () Bool)

(assert (=> b!638735 (= c!72974 (validKeyInArray!0 (select (arr!18370 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!638736 () Bool)

(declare-fun e!365504 () Bool)

(assert (=> b!638736 (= e!365503 e!365504)))

(declare-fun lt!295439 () (_ BitVec 64))

(assert (=> b!638736 (= lt!295439 (select (arr!18370 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!295441 () Unit!21574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38295 (_ BitVec 64) (_ BitVec 32)) Unit!21574)

(assert (=> b!638736 (= lt!295441 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!295439 #b00000000000000000000000000000000))))

(assert (=> b!638736 (arrayContainsKey!0 a!2986 lt!295439 #b00000000000000000000000000000000)))

(declare-fun lt!295440 () Unit!21574)

(assert (=> b!638736 (= lt!295440 lt!295441)))

(declare-fun res!413522 () Bool)

(assert (=> b!638736 (= res!413522 (= (seekEntryOrOpen!0 (select (arr!18370 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6810 #b00000000000000000000000000000000)))))

(assert (=> b!638736 (=> (not res!413522) (not e!365504))))

(declare-fun b!638737 () Bool)

(assert (=> b!638737 (= e!365503 call!33470)))

(declare-fun b!638738 () Bool)

(assert (=> b!638738 (= e!365504 call!33470)))

(assert (= (and d!90213 (not res!413521)) b!638735))

(assert (= (and b!638735 c!72974) b!638736))

(assert (= (and b!638735 (not c!72974)) b!638737))

(assert (= (and b!638736 res!413522) b!638738))

(assert (= (or b!638738 b!638737) bm!33467))

(declare-fun m!612677 () Bool)

(assert (=> bm!33467 m!612677))

(declare-fun m!612679 () Bool)

(assert (=> b!638735 m!612679))

(assert (=> b!638735 m!612679))

(declare-fun m!612681 () Bool)

(assert (=> b!638735 m!612681))

(assert (=> b!638736 m!612679))

(declare-fun m!612683 () Bool)

(assert (=> b!638736 m!612683))

(declare-fun m!612685 () Bool)

(assert (=> b!638736 m!612685))

(assert (=> b!638736 m!612679))

(declare-fun m!612687 () Bool)

(assert (=> b!638736 m!612687))

(assert (=> b!638660 d!90213))

(declare-fun bm!33470 () Bool)

(declare-fun call!33473 () Bool)

(declare-fun c!72977 () Bool)

(assert (=> bm!33470 (= call!33473 (arrayNoDuplicates!0 lt!295389 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72977 (Cons!12407 (select (arr!18370 lt!295389) #b00000000000000000000000000000000) Nil!12408) Nil!12408)))))

(declare-fun b!638749 () Bool)

(declare-fun e!365515 () Bool)

(assert (=> b!638749 (= e!365515 call!33473)))

(declare-fun b!638750 () Bool)

(declare-fun e!365517 () Bool)

(declare-fun contains!3121 (List!12411 (_ BitVec 64)) Bool)

(assert (=> b!638750 (= e!365517 (contains!3121 Nil!12408 (select (arr!18370 lt!295389) #b00000000000000000000000000000000)))))

(declare-fun d!90215 () Bool)

(declare-fun res!413530 () Bool)

(declare-fun e!365516 () Bool)

(assert (=> d!90215 (=> res!413530 e!365516)))

(assert (=> d!90215 (= res!413530 (bvsge #b00000000000000000000000000000000 (size!18734 lt!295389)))))

(assert (=> d!90215 (= (arrayNoDuplicates!0 lt!295389 #b00000000000000000000000000000000 Nil!12408) e!365516)))

(declare-fun b!638751 () Bool)

(declare-fun e!365514 () Bool)

(assert (=> b!638751 (= e!365514 e!365515)))

(assert (=> b!638751 (= c!72977 (validKeyInArray!0 (select (arr!18370 lt!295389) #b00000000000000000000000000000000)))))

(declare-fun b!638752 () Bool)

(assert (=> b!638752 (= e!365515 call!33473)))

(declare-fun b!638753 () Bool)

(assert (=> b!638753 (= e!365516 e!365514)))

(declare-fun res!413531 () Bool)

(assert (=> b!638753 (=> (not res!413531) (not e!365514))))

(assert (=> b!638753 (= res!413531 (not e!365517))))

(declare-fun res!413529 () Bool)

(assert (=> b!638753 (=> (not res!413529) (not e!365517))))

(assert (=> b!638753 (= res!413529 (validKeyInArray!0 (select (arr!18370 lt!295389) #b00000000000000000000000000000000)))))

(assert (= (and d!90215 (not res!413530)) b!638753))

(assert (= (and b!638753 res!413529) b!638750))

(assert (= (and b!638753 res!413531) b!638751))

(assert (= (and b!638751 c!72977) b!638749))

(assert (= (and b!638751 (not c!72977)) b!638752))

(assert (= (or b!638749 b!638752) bm!33470))

(declare-fun m!612689 () Bool)

(assert (=> bm!33470 m!612689))

(declare-fun m!612691 () Bool)

(assert (=> bm!33470 m!612691))

(assert (=> b!638750 m!612689))

(assert (=> b!638750 m!612689))

(declare-fun m!612693 () Bool)

(assert (=> b!638750 m!612693))

(assert (=> b!638751 m!612689))

(assert (=> b!638751 m!612689))

(declare-fun m!612695 () Bool)

(assert (=> b!638751 m!612695))

(assert (=> b!638753 m!612689))

(assert (=> b!638753 m!612689))

(assert (=> b!638753 m!612695))

(assert (=> b!638661 d!90215))

(declare-fun d!90217 () Bool)

(declare-fun e!365520 () Bool)

(assert (=> d!90217 e!365520))

(declare-fun res!413534 () Bool)

(assert (=> d!90217 (=> (not res!413534) (not e!365520))))

(assert (=> d!90217 (= res!413534 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18734 a!2986))))))

(declare-fun lt!295444 () Unit!21574)

(declare-fun choose!41 (array!38295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12411) Unit!21574)

(assert (=> d!90217 (= lt!295444 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12408))))

(assert (=> d!90217 (bvslt (size!18734 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90217 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12408) lt!295444)))

(declare-fun b!638756 () Bool)

(assert (=> b!638756 (= e!365520 (arrayNoDuplicates!0 (array!38296 (store (arr!18370 a!2986) i!1108 k0!1786) (size!18734 a!2986)) #b00000000000000000000000000000000 Nil!12408))))

(assert (= (and d!90217 res!413534) b!638756))

(declare-fun m!612697 () Bool)

(assert (=> d!90217 m!612697))

(assert (=> b!638756 m!612571))

(declare-fun m!612699 () Bool)

(assert (=> b!638756 m!612699))

(assert (=> b!638661 d!90217))

(declare-fun d!90219 () Bool)

(declare-fun res!413539 () Bool)

(declare-fun e!365525 () Bool)

(assert (=> d!90219 (=> res!413539 e!365525)))

(assert (=> d!90219 (= res!413539 (= (select (arr!18370 lt!295389) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18370 a!2986) j!136)))))

(assert (=> d!90219 (= (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!365525)))

(declare-fun b!638761 () Bool)

(declare-fun e!365526 () Bool)

(assert (=> b!638761 (= e!365525 e!365526)))

(declare-fun res!413540 () Bool)

(assert (=> b!638761 (=> (not res!413540) (not e!365526))))

(assert (=> b!638761 (= res!413540 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18734 lt!295389)))))

(declare-fun b!638762 () Bool)

(assert (=> b!638762 (= e!365526 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90219 (not res!413539)) b!638761))

(assert (= (and b!638761 res!413540) b!638762))

(declare-fun m!612701 () Bool)

(assert (=> d!90219 m!612701))

(assert (=> b!638762 m!612575))

(declare-fun m!612703 () Bool)

(assert (=> b!638762 m!612703))

(assert (=> b!638661 d!90219))

(declare-fun d!90221 () Bool)

(assert (=> d!90221 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295447 () Unit!21574)

(declare-fun choose!114 (array!38295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21574)

(assert (=> d!90221 (= lt!295447 (choose!114 lt!295389 (select (arr!18370 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90221 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90221 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295389 (select (arr!18370 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!295447)))

(declare-fun bs!19150 () Bool)

(assert (= bs!19150 d!90221))

(assert (=> bs!19150 m!612575))

(assert (=> bs!19150 m!612599))

(assert (=> bs!19150 m!612575))

(declare-fun m!612705 () Bool)

(assert (=> bs!19150 m!612705))

(assert (=> b!638661 d!90221))

(declare-fun d!90223 () Bool)

(declare-fun res!413541 () Bool)

(declare-fun e!365527 () Bool)

(assert (=> d!90223 (=> res!413541 e!365527)))

(assert (=> d!90223 (= res!413541 (= (select (arr!18370 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90223 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!365527)))

(declare-fun b!638763 () Bool)

(declare-fun e!365528 () Bool)

(assert (=> b!638763 (= e!365527 e!365528)))

(declare-fun res!413542 () Bool)

(assert (=> b!638763 (=> (not res!413542) (not e!365528))))

(assert (=> b!638763 (= res!413542 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18734 a!2986)))))

(declare-fun b!638764 () Bool)

(assert (=> b!638764 (= e!365528 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90223 (not res!413541)) b!638763))

(assert (= (and b!638763 res!413542) b!638764))

(assert (=> d!90223 m!612679))

(declare-fun m!612707 () Bool)

(assert (=> b!638764 m!612707))

(assert (=> b!638663 d!90223))

(declare-fun d!90225 () Bool)

(declare-fun lt!295456 () SeekEntryResult!6810)

(get-info :version)

(assert (=> d!90225 (and (or ((_ is Undefined!6810) lt!295456) (not ((_ is Found!6810) lt!295456)) (and (bvsge (index!29555 lt!295456) #b00000000000000000000000000000000) (bvslt (index!29555 lt!295456) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295456) ((_ is Found!6810) lt!295456) (not ((_ is MissingZero!6810) lt!295456)) (and (bvsge (index!29554 lt!295456) #b00000000000000000000000000000000) (bvslt (index!29554 lt!295456) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295456) ((_ is Found!6810) lt!295456) ((_ is MissingZero!6810) lt!295456) (not ((_ is MissingVacant!6810) lt!295456)) (and (bvsge (index!29557 lt!295456) #b00000000000000000000000000000000) (bvslt (index!29557 lt!295456) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295456) (ite ((_ is Found!6810) lt!295456) (= (select (arr!18370 a!2986) (index!29555 lt!295456)) k0!1786) (ite ((_ is MissingZero!6810) lt!295456) (= (select (arr!18370 a!2986) (index!29554 lt!295456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6810) lt!295456) (= (select (arr!18370 a!2986) (index!29557 lt!295456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!365536 () SeekEntryResult!6810)

(assert (=> d!90225 (= lt!295456 e!365536)))

(declare-fun c!72985 () Bool)

(declare-fun lt!295454 () SeekEntryResult!6810)

(assert (=> d!90225 (= c!72985 (and ((_ is Intermediate!6810) lt!295454) (undefined!7622 lt!295454)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38295 (_ BitVec 32)) SeekEntryResult!6810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90225 (= lt!295454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90225 (validMask!0 mask!3053)))

(assert (=> d!90225 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!295456)))

(declare-fun b!638777 () Bool)

(declare-fun e!365535 () SeekEntryResult!6810)

(assert (=> b!638777 (= e!365535 (MissingZero!6810 (index!29556 lt!295454)))))

(declare-fun b!638778 () Bool)

(assert (=> b!638778 (= e!365536 Undefined!6810)))

(declare-fun b!638779 () Bool)

(assert (=> b!638779 (= e!365535 (seekKeyOrZeroReturnVacant!0 (x!58308 lt!295454) (index!29556 lt!295454) (index!29556 lt!295454) k0!1786 a!2986 mask!3053))))

(declare-fun b!638780 () Bool)

(declare-fun e!365537 () SeekEntryResult!6810)

(assert (=> b!638780 (= e!365536 e!365537)))

(declare-fun lt!295455 () (_ BitVec 64))

(assert (=> b!638780 (= lt!295455 (select (arr!18370 a!2986) (index!29556 lt!295454)))))

(declare-fun c!72986 () Bool)

(assert (=> b!638780 (= c!72986 (= lt!295455 k0!1786))))

(declare-fun b!638781 () Bool)

(assert (=> b!638781 (= e!365537 (Found!6810 (index!29556 lt!295454)))))

(declare-fun b!638782 () Bool)

(declare-fun c!72984 () Bool)

(assert (=> b!638782 (= c!72984 (= lt!295455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638782 (= e!365537 e!365535)))

(assert (= (and d!90225 c!72985) b!638778))

(assert (= (and d!90225 (not c!72985)) b!638780))

(assert (= (and b!638780 c!72986) b!638781))

(assert (= (and b!638780 (not c!72986)) b!638782))

(assert (= (and b!638782 c!72984) b!638777))

(assert (= (and b!638782 (not c!72984)) b!638779))

(declare-fun m!612709 () Bool)

(assert (=> d!90225 m!612709))

(assert (=> d!90225 m!612605))

(declare-fun m!612711 () Bool)

(assert (=> d!90225 m!612711))

(declare-fun m!612713 () Bool)

(assert (=> d!90225 m!612713))

(declare-fun m!612715 () Bool)

(assert (=> d!90225 m!612715))

(assert (=> d!90225 m!612711))

(declare-fun m!612717 () Bool)

(assert (=> d!90225 m!612717))

(declare-fun m!612719 () Bool)

(assert (=> b!638779 m!612719))

(declare-fun m!612721 () Bool)

(assert (=> b!638780 m!612721))

(assert (=> b!638655 d!90225))

(declare-fun bm!33471 () Bool)

(declare-fun call!33474 () Bool)

(declare-fun c!72987 () Bool)

(assert (=> bm!33471 (= call!33474 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72987 (Cons!12407 (select (arr!18370 a!2986) #b00000000000000000000000000000000) Nil!12408) Nil!12408)))))

(declare-fun b!638783 () Bool)

(declare-fun e!365539 () Bool)

(assert (=> b!638783 (= e!365539 call!33474)))

(declare-fun b!638784 () Bool)

(declare-fun e!365541 () Bool)

(assert (=> b!638784 (= e!365541 (contains!3121 Nil!12408 (select (arr!18370 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90227 () Bool)

(declare-fun res!413544 () Bool)

(declare-fun e!365540 () Bool)

(assert (=> d!90227 (=> res!413544 e!365540)))

(assert (=> d!90227 (= res!413544 (bvsge #b00000000000000000000000000000000 (size!18734 a!2986)))))

(assert (=> d!90227 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12408) e!365540)))

(declare-fun b!638785 () Bool)

(declare-fun e!365538 () Bool)

(assert (=> b!638785 (= e!365538 e!365539)))

(assert (=> b!638785 (= c!72987 (validKeyInArray!0 (select (arr!18370 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!638786 () Bool)

(assert (=> b!638786 (= e!365539 call!33474)))

(declare-fun b!638787 () Bool)

(assert (=> b!638787 (= e!365540 e!365538)))

(declare-fun res!413545 () Bool)

(assert (=> b!638787 (=> (not res!413545) (not e!365538))))

(assert (=> b!638787 (= res!413545 (not e!365541))))

(declare-fun res!413543 () Bool)

(assert (=> b!638787 (=> (not res!413543) (not e!365541))))

(assert (=> b!638787 (= res!413543 (validKeyInArray!0 (select (arr!18370 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90227 (not res!413544)) b!638787))

(assert (= (and b!638787 res!413543) b!638784))

(assert (= (and b!638787 res!413545) b!638785))

(assert (= (and b!638785 c!72987) b!638783))

(assert (= (and b!638785 (not c!72987)) b!638786))

(assert (= (or b!638783 b!638786) bm!33471))

(assert (=> bm!33471 m!612679))

(declare-fun m!612723 () Bool)

(assert (=> bm!33471 m!612723))

(assert (=> b!638784 m!612679))

(assert (=> b!638784 m!612679))

(declare-fun m!612725 () Bool)

(assert (=> b!638784 m!612725))

(assert (=> b!638785 m!612679))

(assert (=> b!638785 m!612679))

(assert (=> b!638785 m!612681))

(assert (=> b!638787 m!612679))

(assert (=> b!638787 m!612679))

(assert (=> b!638787 m!612681))

(assert (=> b!638654 d!90227))

(declare-fun d!90233 () Bool)

(assert (=> d!90233 (= (validKeyInArray!0 (select (arr!18370 a!2986) j!136)) (and (not (= (select (arr!18370 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18370 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638665 d!90233))

(declare-fun d!90237 () Bool)

(declare-fun res!413546 () Bool)

(declare-fun e!365542 () Bool)

(assert (=> d!90237 (=> res!413546 e!365542)))

(assert (=> d!90237 (= res!413546 (= (select (arr!18370 lt!295389) index!984) (select (arr!18370 a!2986) j!136)))))

(assert (=> d!90237 (= (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) index!984) e!365542)))

(declare-fun b!638788 () Bool)

(declare-fun e!365543 () Bool)

(assert (=> b!638788 (= e!365542 e!365543)))

(declare-fun res!413547 () Bool)

(assert (=> b!638788 (=> (not res!413547) (not e!365543))))

(assert (=> b!638788 (= res!413547 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18734 lt!295389)))))

(declare-fun b!638789 () Bool)

(assert (=> b!638789 (= e!365543 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90237 (not res!413546)) b!638788))

(assert (= (and b!638788 res!413547) b!638789))

(declare-fun m!612727 () Bool)

(assert (=> d!90237 m!612727))

(assert (=> b!638789 m!612575))

(declare-fun m!612729 () Bool)

(assert (=> b!638789 m!612729))

(assert (=> b!638656 d!90237))

(declare-fun b!638841 () Bool)

(declare-fun e!365577 () SeekEntryResult!6810)

(assert (=> b!638841 (= e!365577 (MissingVacant!6810 vacantSpotIndex!68))))

(declare-fun b!638842 () Bool)

(declare-fun e!365578 () SeekEntryResult!6810)

(declare-fun e!365579 () SeekEntryResult!6810)

(assert (=> b!638842 (= e!365578 e!365579)))

(declare-fun c!73008 () Bool)

(declare-fun lt!295467 () (_ BitVec 64))

(assert (=> b!638842 (= c!73008 (= lt!295467 (select (arr!18370 a!2986) j!136)))))

(declare-fun lt!295468 () SeekEntryResult!6810)

(declare-fun d!90239 () Bool)

(assert (=> d!90239 (and (or ((_ is Undefined!6810) lt!295468) (not ((_ is Found!6810) lt!295468)) (and (bvsge (index!29555 lt!295468) #b00000000000000000000000000000000) (bvslt (index!29555 lt!295468) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295468) ((_ is Found!6810) lt!295468) (not ((_ is MissingVacant!6810) lt!295468)) (not (= (index!29557 lt!295468) vacantSpotIndex!68)) (and (bvsge (index!29557 lt!295468) #b00000000000000000000000000000000) (bvslt (index!29557 lt!295468) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295468) (ite ((_ is Found!6810) lt!295468) (= (select (arr!18370 a!2986) (index!29555 lt!295468)) (select (arr!18370 a!2986) j!136)) (and ((_ is MissingVacant!6810) lt!295468) (= (index!29557 lt!295468) vacantSpotIndex!68) (= (select (arr!18370 a!2986) (index!29557 lt!295468)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90239 (= lt!295468 e!365578)))

(declare-fun c!73006 () Bool)

(assert (=> d!90239 (= c!73006 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90239 (= lt!295467 (select (arr!18370 a!2986) index!984))))

(assert (=> d!90239 (validMask!0 mask!3053)))

(assert (=> d!90239 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053) lt!295468)))

(declare-fun b!638843 () Bool)

(assert (=> b!638843 (= e!365578 Undefined!6810)))

(declare-fun b!638844 () Bool)

(declare-fun c!73007 () Bool)

(assert (=> b!638844 (= c!73007 (= lt!295467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638844 (= e!365579 e!365577)))

(declare-fun b!638845 () Bool)

(assert (=> b!638845 (= e!365579 (Found!6810 index!984))))

(declare-fun b!638846 () Bool)

(assert (=> b!638846 (= e!365577 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90239 c!73006) b!638843))

(assert (= (and d!90239 (not c!73006)) b!638842))

(assert (= (and b!638842 c!73008) b!638845))

(assert (= (and b!638842 (not c!73008)) b!638844))

(assert (= (and b!638844 c!73007) b!638841))

(assert (= (and b!638844 (not c!73007)) b!638846))

(declare-fun m!612749 () Bool)

(assert (=> d!90239 m!612749))

(declare-fun m!612751 () Bool)

(assert (=> d!90239 m!612751))

(assert (=> d!90239 m!612619))

(assert (=> d!90239 m!612605))

(assert (=> b!638846 m!612583))

(assert (=> b!638846 m!612583))

(assert (=> b!638846 m!612575))

(declare-fun m!612753 () Bool)

(assert (=> b!638846 m!612753))

(assert (=> b!638667 d!90239))

(declare-fun d!90249 () Bool)

(assert (=> d!90249 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57724 d!90249))

(declare-fun d!90255 () Bool)

(assert (=> d!90255 (= (array_inv!14166 a!2986) (bvsge (size!18734 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57724 d!90255))

(declare-fun d!90261 () Bool)

(assert (=> d!90261 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638659 d!90261))

(declare-fun d!90263 () Bool)

(declare-fun res!413580 () Bool)

(declare-fun e!365609 () Bool)

(assert (=> d!90263 (=> res!413580 e!365609)))

(assert (=> d!90263 (= res!413580 (= (select (arr!18370 lt!295389) j!136) (select (arr!18370 a!2986) j!136)))))

(assert (=> d!90263 (= (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) j!136) e!365609)))

(declare-fun b!638888 () Bool)

(declare-fun e!365610 () Bool)

(assert (=> b!638888 (= e!365609 e!365610)))

(declare-fun res!413581 () Bool)

(assert (=> b!638888 (=> (not res!413581) (not e!365610))))

(assert (=> b!638888 (= res!413581 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18734 lt!295389)))))

(declare-fun b!638889 () Bool)

(assert (=> b!638889 (= e!365610 (arrayContainsKey!0 lt!295389 (select (arr!18370 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90263 (not res!413580)) b!638888))

(assert (= (and b!638888 res!413581) b!638889))

(declare-fun m!612775 () Bool)

(assert (=> d!90263 m!612775))

(assert (=> b!638889 m!612575))

(declare-fun m!612777 () Bool)

(assert (=> b!638889 m!612777))

(assert (=> b!638658 d!90263))

(declare-fun b!638890 () Bool)

(declare-fun e!365611 () SeekEntryResult!6810)

(assert (=> b!638890 (= e!365611 (MissingVacant!6810 vacantSpotIndex!68))))

(declare-fun b!638891 () Bool)

(declare-fun e!365612 () SeekEntryResult!6810)

(declare-fun e!365613 () SeekEntryResult!6810)

(assert (=> b!638891 (= e!365612 e!365613)))

(declare-fun c!73023 () Bool)

(declare-fun lt!295475 () (_ BitVec 64))

(assert (=> b!638891 (= c!73023 (= lt!295475 lt!295386))))

(declare-fun d!90265 () Bool)

(declare-fun lt!295476 () SeekEntryResult!6810)

(assert (=> d!90265 (and (or ((_ is Undefined!6810) lt!295476) (not ((_ is Found!6810) lt!295476)) (and (bvsge (index!29555 lt!295476) #b00000000000000000000000000000000) (bvslt (index!29555 lt!295476) (size!18734 lt!295389)))) (or ((_ is Undefined!6810) lt!295476) ((_ is Found!6810) lt!295476) (not ((_ is MissingVacant!6810) lt!295476)) (not (= (index!29557 lt!295476) vacantSpotIndex!68)) (and (bvsge (index!29557 lt!295476) #b00000000000000000000000000000000) (bvslt (index!29557 lt!295476) (size!18734 lt!295389)))) (or ((_ is Undefined!6810) lt!295476) (ite ((_ is Found!6810) lt!295476) (= (select (arr!18370 lt!295389) (index!29555 lt!295476)) lt!295386) (and ((_ is MissingVacant!6810) lt!295476) (= (index!29557 lt!295476) vacantSpotIndex!68) (= (select (arr!18370 lt!295389) (index!29557 lt!295476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90265 (= lt!295476 e!365612)))

(declare-fun c!73021 () Bool)

(assert (=> d!90265 (= c!73021 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90265 (= lt!295475 (select (arr!18370 lt!295389) index!984))))

(assert (=> d!90265 (validMask!0 mask!3053)))

(assert (=> d!90265 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295386 lt!295389 mask!3053) lt!295476)))

(declare-fun b!638892 () Bool)

(assert (=> b!638892 (= e!365612 Undefined!6810)))

(declare-fun b!638893 () Bool)

(declare-fun c!73022 () Bool)

(assert (=> b!638893 (= c!73022 (= lt!295475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638893 (= e!365613 e!365611)))

(declare-fun b!638894 () Bool)

(assert (=> b!638894 (= e!365613 (Found!6810 index!984))))

(declare-fun b!638895 () Bool)

(assert (=> b!638895 (= e!365611 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!295386 lt!295389 mask!3053))))

(assert (= (and d!90265 c!73021) b!638892))

(assert (= (and d!90265 (not c!73021)) b!638891))

(assert (= (and b!638891 c!73023) b!638894))

(assert (= (and b!638891 (not c!73023)) b!638893))

(assert (= (and b!638893 c!73022) b!638890))

(assert (= (and b!638893 (not c!73022)) b!638895))

(declare-fun m!612779 () Bool)

(assert (=> d!90265 m!612779))

(declare-fun m!612781 () Bool)

(assert (=> d!90265 m!612781))

(assert (=> d!90265 m!612727))

(assert (=> d!90265 m!612605))

(assert (=> b!638895 m!612583))

(assert (=> b!638895 m!612583))

(declare-fun m!612783 () Bool)

(assert (=> b!638895 m!612783))

(assert (=> b!638669 d!90265))

(declare-fun d!90267 () Bool)

(declare-fun lt!295489 () (_ BitVec 32))

(assert (=> d!90267 (and (bvsge lt!295489 #b00000000000000000000000000000000) (bvslt lt!295489 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90267 (= lt!295489 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90267 (validMask!0 mask!3053)))

(assert (=> d!90267 (= (nextIndex!0 index!984 x!910 mask!3053) lt!295489)))

(declare-fun bs!19152 () Bool)

(assert (= bs!19152 d!90267))

(declare-fun m!612805 () Bool)

(assert (=> bs!19152 m!612805))

(assert (=> bs!19152 m!612605))

(assert (=> b!638669 d!90267))

(declare-fun d!90277 () Bool)

(declare-fun e!365637 () Bool)

(assert (=> d!90277 e!365637))

(declare-fun res!413598 () Bool)

(assert (=> d!90277 (=> (not res!413598) (not e!365637))))

(assert (=> d!90277 (= res!413598 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18734 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18734 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18734 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18734 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18734 a!2986))))))

(declare-fun lt!295497 () Unit!21574)

(declare-fun choose!9 (array!38295 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21574)

(assert (=> d!90277 (= lt!295497 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90277 (validMask!0 mask!3053)))

(assert (=> d!90277 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 mask!3053) lt!295497)))

(declare-fun b!638926 () Bool)

(assert (=> b!638926 (= e!365637 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 (select (store (arr!18370 a!2986) i!1108 k0!1786) j!136) (array!38296 (store (arr!18370 a!2986) i!1108 k0!1786) (size!18734 a!2986)) mask!3053)))))

(assert (= (and d!90277 res!413598) b!638926))

(declare-fun m!612829 () Bool)

(assert (=> d!90277 m!612829))

(assert (=> d!90277 m!612605))

(assert (=> b!638926 m!612585))

(assert (=> b!638926 m!612575))

(assert (=> b!638926 m!612575))

(assert (=> b!638926 m!612589))

(assert (=> b!638926 m!612585))

(declare-fun m!612831 () Bool)

(assert (=> b!638926 m!612831))

(assert (=> b!638926 m!612571))

(assert (=> b!638669 d!90277))

(declare-fun b!638928 () Bool)

(declare-fun e!365639 () SeekEntryResult!6810)

(assert (=> b!638928 (= e!365639 (MissingVacant!6810 vacantSpotIndex!68))))

(declare-fun b!638929 () Bool)

(declare-fun e!365640 () SeekEntryResult!6810)

(declare-fun e!365641 () SeekEntryResult!6810)

(assert (=> b!638929 (= e!365640 e!365641)))

(declare-fun lt!295499 () (_ BitVec 64))

(declare-fun c!73033 () Bool)

(assert (=> b!638929 (= c!73033 (= lt!295499 (select (arr!18370 a!2986) j!136)))))

(declare-fun lt!295500 () SeekEntryResult!6810)

(declare-fun d!90289 () Bool)

(assert (=> d!90289 (and (or ((_ is Undefined!6810) lt!295500) (not ((_ is Found!6810) lt!295500)) (and (bvsge (index!29555 lt!295500) #b00000000000000000000000000000000) (bvslt (index!29555 lt!295500) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295500) ((_ is Found!6810) lt!295500) (not ((_ is MissingVacant!6810) lt!295500)) (not (= (index!29557 lt!295500) vacantSpotIndex!68)) (and (bvsge (index!29557 lt!295500) #b00000000000000000000000000000000) (bvslt (index!29557 lt!295500) (size!18734 a!2986)))) (or ((_ is Undefined!6810) lt!295500) (ite ((_ is Found!6810) lt!295500) (= (select (arr!18370 a!2986) (index!29555 lt!295500)) (select (arr!18370 a!2986) j!136)) (and ((_ is MissingVacant!6810) lt!295500) (= (index!29557 lt!295500) vacantSpotIndex!68) (= (select (arr!18370 a!2986) (index!29557 lt!295500)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90289 (= lt!295500 e!365640)))

(declare-fun c!73031 () Bool)

(assert (=> d!90289 (= c!73031 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90289 (= lt!295499 (select (arr!18370 a!2986) lt!295396))))

(assert (=> d!90289 (validMask!0 mask!3053)))

(assert (=> d!90289 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053) lt!295500)))

(declare-fun b!638930 () Bool)

(assert (=> b!638930 (= e!365640 Undefined!6810)))

(declare-fun b!638931 () Bool)

(declare-fun c!73032 () Bool)

(assert (=> b!638931 (= c!73032 (= lt!295499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638931 (= e!365641 e!365639)))

(declare-fun b!638932 () Bool)

(assert (=> b!638932 (= e!365641 (Found!6810 lt!295396))))

(declare-fun b!638933 () Bool)

(assert (=> b!638933 (= e!365639 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295396 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18370 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90289 c!73031) b!638930))

(assert (= (and d!90289 (not c!73031)) b!638929))

(assert (= (and b!638929 c!73033) b!638932))

(assert (= (and b!638929 (not c!73033)) b!638931))

(assert (= (and b!638931 c!73032) b!638928))

(assert (= (and b!638931 (not c!73032)) b!638933))

(declare-fun m!612837 () Bool)

(assert (=> d!90289 m!612837))

(declare-fun m!612839 () Bool)

(assert (=> d!90289 m!612839))

(declare-fun m!612841 () Bool)

(assert (=> d!90289 m!612841))

(assert (=> d!90289 m!612605))

(declare-fun m!612843 () Bool)

(assert (=> b!638933 m!612843))

(assert (=> b!638933 m!612843))

(assert (=> b!638933 m!612575))

(declare-fun m!612845 () Bool)

(assert (=> b!638933 m!612845))

(assert (=> b!638669 d!90289))

(declare-fun b!638940 () Bool)

(declare-fun e!365645 () SeekEntryResult!6810)

(assert (=> b!638940 (= e!365645 (MissingVacant!6810 vacantSpotIndex!68))))

(declare-fun b!638941 () Bool)

(declare-fun e!365646 () SeekEntryResult!6810)

(declare-fun e!365647 () SeekEntryResult!6810)

(assert (=> b!638941 (= e!365646 e!365647)))

(declare-fun c!73039 () Bool)

(declare-fun lt!295503 () (_ BitVec 64))

(assert (=> b!638941 (= c!73039 (= lt!295503 lt!295386))))

(declare-fun lt!295504 () SeekEntryResult!6810)

(declare-fun d!90293 () Bool)

(assert (=> d!90293 (and (or ((_ is Undefined!6810) lt!295504) (not ((_ is Found!6810) lt!295504)) (and (bvsge (index!29555 lt!295504) #b00000000000000000000000000000000) (bvslt (index!29555 lt!295504) (size!18734 lt!295389)))) (or ((_ is Undefined!6810) lt!295504) ((_ is Found!6810) lt!295504) (not ((_ is MissingVacant!6810) lt!295504)) (not (= (index!29557 lt!295504) vacantSpotIndex!68)) (and (bvsge (index!29557 lt!295504) #b00000000000000000000000000000000) (bvslt (index!29557 lt!295504) (size!18734 lt!295389)))) (or ((_ is Undefined!6810) lt!295504) (ite ((_ is Found!6810) lt!295504) (= (select (arr!18370 lt!295389) (index!29555 lt!295504)) lt!295386) (and ((_ is MissingVacant!6810) lt!295504) (= (index!29557 lt!295504) vacantSpotIndex!68) (= (select (arr!18370 lt!295389) (index!29557 lt!295504)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90293 (= lt!295504 e!365646)))

(declare-fun c!73037 () Bool)

(assert (=> d!90293 (= c!73037 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90293 (= lt!295503 (select (arr!18370 lt!295389) lt!295396))))

(assert (=> d!90293 (validMask!0 mask!3053)))

(assert (=> d!90293 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295396 vacantSpotIndex!68 lt!295386 lt!295389 mask!3053) lt!295504)))

(declare-fun b!638942 () Bool)

(assert (=> b!638942 (= e!365646 Undefined!6810)))

(declare-fun b!638943 () Bool)

(declare-fun c!73038 () Bool)

(assert (=> b!638943 (= c!73038 (= lt!295503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638943 (= e!365647 e!365645)))

(declare-fun b!638944 () Bool)

(assert (=> b!638944 (= e!365647 (Found!6810 lt!295396))))

(declare-fun b!638945 () Bool)

(assert (=> b!638945 (= e!365645 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295396 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!295386 lt!295389 mask!3053))))

(assert (= (and d!90293 c!73037) b!638942))

(assert (= (and d!90293 (not c!73037)) b!638941))

(assert (= (and b!638941 c!73039) b!638944))

(assert (= (and b!638941 (not c!73039)) b!638943))

(assert (= (and b!638943 c!73038) b!638940))

(assert (= (and b!638943 (not c!73038)) b!638945))

(declare-fun m!612855 () Bool)

(assert (=> d!90293 m!612855))

(declare-fun m!612857 () Bool)

(assert (=> d!90293 m!612857))

(declare-fun m!612859 () Bool)

(assert (=> d!90293 m!612859))

(assert (=> d!90293 m!612605))

(assert (=> b!638945 m!612843))

(assert (=> b!638945 m!612843))

(declare-fun m!612861 () Bool)

(assert (=> b!638945 m!612861))

(assert (=> b!638669 d!90293))

(check-sat (not b!638753) (not bm!33471) (not bm!33467) (not b!638785) (not b!638735) (not d!90289) (not b!638895) (not d!90217) (not b!638945) (not b!638751) (not d!90221) (not d!90293) (not b!638779) (not b!638926) (not b!638789) (not b!638846) (not b!638784) (not b!638933) (not b!638889) (not bm!33470) (not d!90225) (not d!90265) (not b!638764) (not d!90267) (not b!638750) (not b!638756) (not b!638762) (not b!638787) (not d!90239) (not d!90277) (not b!638736))
(check-sat)
