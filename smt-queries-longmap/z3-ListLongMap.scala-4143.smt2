; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56436 () Bool)

(assert start!56436)

(declare-fun res!403729 () Bool)

(declare-fun e!358449 () Bool)

(assert (=> start!56436 (=> (not res!403729) (not e!358449))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56436 (= res!403729 (validMask!0 mask!3053))))

(assert (=> start!56436 e!358449))

(assert (=> start!56436 true))

(declare-datatypes ((array!37830 0))(
  ( (array!37831 (arr!18158 (Array (_ BitVec 32) (_ BitVec 64))) (size!18523 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37830)

(declare-fun array_inv!14041 (array!37830) Bool)

(assert (=> start!56436 (array_inv!14041 a!2986)))

(declare-fun b!625573 () Bool)

(declare-fun res!403724 () Bool)

(assert (=> b!625573 (=> (not res!403724) (not e!358449))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625573 (= res!403724 (validKeyInArray!0 (select (arr!18158 a!2986) j!136)))))

(declare-fun b!625574 () Bool)

(declare-fun res!403726 () Bool)

(assert (=> b!625574 (=> (not res!403726) (not e!358449))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625574 (= res!403726 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625575 () Bool)

(declare-fun res!403722 () Bool)

(assert (=> b!625575 (=> (not res!403722) (not e!358449))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625575 (= res!403722 (and (= (size!18523 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18523 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18523 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625576 () Bool)

(declare-fun e!358448 () Bool)

(assert (=> b!625576 (= e!358449 e!358448)))

(declare-fun res!403725 () Bool)

(assert (=> b!625576 (=> (not res!403725) (not e!358448))))

(declare-datatypes ((SeekEntryResult!6595 0))(
  ( (MissingZero!6595 (index!28664 (_ BitVec 32))) (Found!6595 (index!28665 (_ BitVec 32))) (Intermediate!6595 (undefined!7407 Bool) (index!28666 (_ BitVec 32)) (x!57420 (_ BitVec 32))) (Undefined!6595) (MissingVacant!6595 (index!28667 (_ BitVec 32))) )
))
(declare-fun lt!289680 () SeekEntryResult!6595)

(assert (=> b!625576 (= res!403725 (or (= lt!289680 (MissingZero!6595 i!1108)) (= lt!289680 (MissingVacant!6595 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37830 (_ BitVec 32)) SeekEntryResult!6595)

(assert (=> b!625576 (= lt!289680 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625577 () Bool)

(declare-fun e!358446 () Bool)

(assert (=> b!625577 (= e!358448 e!358446)))

(declare-fun res!403727 () Bool)

(assert (=> b!625577 (=> (not res!403727) (not e!358446))))

(declare-fun lt!289681 () SeekEntryResult!6595)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625577 (= res!403727 (and (= lt!289681 (Found!6595 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18158 a!2986) index!984) (select (arr!18158 a!2986) j!136)) (= index!984 j!136)))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37830 (_ BitVec 32)) SeekEntryResult!6595)

(assert (=> b!625577 (= lt!289681 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18158 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625578 () Bool)

(declare-fun res!403728 () Bool)

(assert (=> b!625578 (=> (not res!403728) (not e!358448))))

(assert (=> b!625578 (= res!403728 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18158 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18158 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625579 () Bool)

(declare-fun res!403730 () Bool)

(assert (=> b!625579 (=> (not res!403730) (not e!358449))))

(assert (=> b!625579 (= res!403730 (validKeyInArray!0 k0!1786))))

(declare-fun b!625580 () Bool)

(assert (=> b!625580 (= e!358446 (not (= lt!289681 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18158 a!2986) i!1108 k0!1786) j!136) (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986)) mask!3053))))))

(declare-fun b!625581 () Bool)

(declare-fun res!403723 () Bool)

(assert (=> b!625581 (=> (not res!403723) (not e!358448))))

(declare-datatypes ((List!12238 0))(
  ( (Nil!12235) (Cons!12234 (h!13279 (_ BitVec 64)) (t!18457 List!12238)) )
))
(declare-fun arrayNoDuplicates!0 (array!37830 (_ BitVec 32) List!12238) Bool)

(assert (=> b!625581 (= res!403723 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12235))))

(declare-fun b!625582 () Bool)

(declare-fun res!403721 () Bool)

(assert (=> b!625582 (=> (not res!403721) (not e!358448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37830 (_ BitVec 32)) Bool)

(assert (=> b!625582 (= res!403721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56436 res!403729) b!625575))

(assert (= (and b!625575 res!403722) b!625573))

(assert (= (and b!625573 res!403724) b!625579))

(assert (= (and b!625579 res!403730) b!625574))

(assert (= (and b!625574 res!403726) b!625576))

(assert (= (and b!625576 res!403725) b!625582))

(assert (= (and b!625582 res!403721) b!625581))

(assert (= (and b!625581 res!403723) b!625578))

(assert (= (and b!625578 res!403728) b!625577))

(assert (= (and b!625577 res!403727) b!625580))

(declare-fun m!600625 () Bool)

(assert (=> b!625582 m!600625))

(declare-fun m!600627 () Bool)

(assert (=> b!625578 m!600627))

(declare-fun m!600629 () Bool)

(assert (=> b!625578 m!600629))

(declare-fun m!600631 () Bool)

(assert (=> b!625578 m!600631))

(declare-fun m!600633 () Bool)

(assert (=> b!625579 m!600633))

(declare-fun m!600635 () Bool)

(assert (=> b!625577 m!600635))

(declare-fun m!600637 () Bool)

(assert (=> b!625577 m!600637))

(assert (=> b!625577 m!600637))

(declare-fun m!600639 () Bool)

(assert (=> b!625577 m!600639))

(declare-fun m!600641 () Bool)

(assert (=> start!56436 m!600641))

(declare-fun m!600643 () Bool)

(assert (=> start!56436 m!600643))

(declare-fun m!600645 () Bool)

(assert (=> b!625574 m!600645))

(assert (=> b!625573 m!600637))

(assert (=> b!625573 m!600637))

(declare-fun m!600647 () Bool)

(assert (=> b!625573 m!600647))

(assert (=> b!625580 m!600629))

(declare-fun m!600649 () Bool)

(assert (=> b!625580 m!600649))

(assert (=> b!625580 m!600649))

(declare-fun m!600651 () Bool)

(assert (=> b!625580 m!600651))

(declare-fun m!600653 () Bool)

(assert (=> b!625581 m!600653))

(declare-fun m!600655 () Bool)

(assert (=> b!625576 m!600655))

(check-sat (not b!625574) (not b!625577) (not b!625579) (not b!625582) (not b!625580) (not b!625576) (not b!625581) (not start!56436) (not b!625573))
(check-sat)
(get-model)

(declare-fun d!88621 () Bool)

(assert (=> d!88621 (= (validKeyInArray!0 (select (arr!18158 a!2986) j!136)) (and (not (= (select (arr!18158 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18158 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625573 d!88621))

(declare-fun d!88623 () Bool)

(assert (=> d!88623 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56436 d!88623))

(declare-fun d!88625 () Bool)

(assert (=> d!88625 (= (array_inv!14041 a!2986) (bvsge (size!18523 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56436 d!88625))

(declare-fun b!625655 () Bool)

(declare-fun c!71301 () Bool)

(declare-fun lt!289699 () (_ BitVec 64))

(assert (=> b!625655 (= c!71301 (= lt!289699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358482 () SeekEntryResult!6595)

(declare-fun e!358480 () SeekEntryResult!6595)

(assert (=> b!625655 (= e!358482 e!358480)))

(declare-fun b!625656 () Bool)

(assert (=> b!625656 (= e!358480 (MissingVacant!6595 vacantSpotIndex!68))))

(declare-fun b!625657 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!625657 (= e!358480 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (store (arr!18158 a!2986) i!1108 k0!1786) j!136) (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986)) mask!3053))))

(declare-fun b!625658 () Bool)

(declare-fun e!358481 () SeekEntryResult!6595)

(assert (=> b!625658 (= e!358481 e!358482)))

(declare-fun c!71300 () Bool)

(assert (=> b!625658 (= c!71300 (= lt!289699 (select (store (arr!18158 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun d!88627 () Bool)

(declare-fun lt!289698 () SeekEntryResult!6595)

(get-info :version)

(assert (=> d!88627 (and (or ((_ is Undefined!6595) lt!289698) (not ((_ is Found!6595) lt!289698)) (and (bvsge (index!28665 lt!289698) #b00000000000000000000000000000000) (bvslt (index!28665 lt!289698) (size!18523 (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986)))))) (or ((_ is Undefined!6595) lt!289698) ((_ is Found!6595) lt!289698) (not ((_ is MissingVacant!6595) lt!289698)) (not (= (index!28667 lt!289698) vacantSpotIndex!68)) (and (bvsge (index!28667 lt!289698) #b00000000000000000000000000000000) (bvslt (index!28667 lt!289698) (size!18523 (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986)))))) (or ((_ is Undefined!6595) lt!289698) (ite ((_ is Found!6595) lt!289698) (= (select (arr!18158 (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986))) (index!28665 lt!289698)) (select (store (arr!18158 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6595) lt!289698) (= (index!28667 lt!289698) vacantSpotIndex!68) (= (select (arr!18158 (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986))) (index!28667 lt!289698)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88627 (= lt!289698 e!358481)))

(declare-fun c!71299 () Bool)

(assert (=> d!88627 (= c!71299 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88627 (= lt!289699 (select (arr!18158 (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986))) index!984))))

(assert (=> d!88627 (validMask!0 mask!3053)))

(assert (=> d!88627 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18158 a!2986) i!1108 k0!1786) j!136) (array!37831 (store (arr!18158 a!2986) i!1108 k0!1786) (size!18523 a!2986)) mask!3053) lt!289698)))

(declare-fun b!625659 () Bool)

(assert (=> b!625659 (= e!358482 (Found!6595 index!984))))

(declare-fun b!625660 () Bool)

(assert (=> b!625660 (= e!358481 Undefined!6595)))

(assert (= (and d!88627 c!71299) b!625660))

(assert (= (and d!88627 (not c!71299)) b!625658))

(assert (= (and b!625658 c!71300) b!625659))

(assert (= (and b!625658 (not c!71300)) b!625655))

(assert (= (and b!625655 c!71301) b!625656))

(assert (= (and b!625655 (not c!71301)) b!625657))

(declare-fun m!600721 () Bool)

(assert (=> b!625657 m!600721))

(assert (=> b!625657 m!600721))

(assert (=> b!625657 m!600649))

(declare-fun m!600723 () Bool)

(assert (=> b!625657 m!600723))

(declare-fun m!600725 () Bool)

(assert (=> d!88627 m!600725))

(declare-fun m!600727 () Bool)

(assert (=> d!88627 m!600727))

(declare-fun m!600729 () Bool)

(assert (=> d!88627 m!600729))

(assert (=> d!88627 m!600641))

(assert (=> b!625580 d!88627))

(declare-fun d!88629 () Bool)

(assert (=> d!88629 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625579 d!88629))

(declare-fun d!88631 () Bool)

(declare-fun res!403795 () Bool)

(declare-fun e!358487 () Bool)

(assert (=> d!88631 (=> res!403795 e!358487)))

(assert (=> d!88631 (= res!403795 (= (select (arr!18158 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88631 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358487)))

(declare-fun b!625665 () Bool)

(declare-fun e!358488 () Bool)

(assert (=> b!625665 (= e!358487 e!358488)))

(declare-fun res!403796 () Bool)

(assert (=> b!625665 (=> (not res!403796) (not e!358488))))

(assert (=> b!625665 (= res!403796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18523 a!2986)))))

(declare-fun b!625666 () Bool)

(assert (=> b!625666 (= e!358488 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88631 (not res!403795)) b!625665))

(assert (= (and b!625665 res!403796) b!625666))

(declare-fun m!600731 () Bool)

(assert (=> d!88631 m!600731))

(declare-fun m!600733 () Bool)

(assert (=> b!625666 m!600733))

(assert (=> b!625574 d!88631))

(declare-fun b!625677 () Bool)

(declare-fun e!358497 () Bool)

(declare-fun contains!3062 (List!12238 (_ BitVec 64)) Bool)

(assert (=> b!625677 (= e!358497 (contains!3062 Nil!12235 (select (arr!18158 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!625678 () Bool)

(declare-fun e!358499 () Bool)

(declare-fun call!33196 () Bool)

(assert (=> b!625678 (= e!358499 call!33196)))

(declare-fun b!625679 () Bool)

(declare-fun e!358498 () Bool)

(assert (=> b!625679 (= e!358498 e!358499)))

(declare-fun c!71304 () Bool)

(assert (=> b!625679 (= c!71304 (validKeyInArray!0 (select (arr!18158 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88633 () Bool)

(declare-fun res!403805 () Bool)

(declare-fun e!358500 () Bool)

(assert (=> d!88633 (=> res!403805 e!358500)))

(assert (=> d!88633 (= res!403805 (bvsge #b00000000000000000000000000000000 (size!18523 a!2986)))))

(assert (=> d!88633 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12235) e!358500)))

(declare-fun b!625680 () Bool)

(assert (=> b!625680 (= e!358500 e!358498)))

(declare-fun res!403803 () Bool)

(assert (=> b!625680 (=> (not res!403803) (not e!358498))))

(assert (=> b!625680 (= res!403803 (not e!358497))))

(declare-fun res!403804 () Bool)

(assert (=> b!625680 (=> (not res!403804) (not e!358497))))

(assert (=> b!625680 (= res!403804 (validKeyInArray!0 (select (arr!18158 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!625681 () Bool)

(assert (=> b!625681 (= e!358499 call!33196)))

(declare-fun bm!33193 () Bool)

(assert (=> bm!33193 (= call!33196 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71304 (Cons!12234 (select (arr!18158 a!2986) #b00000000000000000000000000000000) Nil!12235) Nil!12235)))))

(assert (= (and d!88633 (not res!403805)) b!625680))

(assert (= (and b!625680 res!403804) b!625677))

(assert (= (and b!625680 res!403803) b!625679))

(assert (= (and b!625679 c!71304) b!625681))

(assert (= (and b!625679 (not c!71304)) b!625678))

(assert (= (or b!625681 b!625678) bm!33193))

(assert (=> b!625677 m!600731))

(assert (=> b!625677 m!600731))

(declare-fun m!600735 () Bool)

(assert (=> b!625677 m!600735))

(assert (=> b!625679 m!600731))

(assert (=> b!625679 m!600731))

(declare-fun m!600737 () Bool)

(assert (=> b!625679 m!600737))

(assert (=> b!625680 m!600731))

(assert (=> b!625680 m!600731))

(assert (=> b!625680 m!600737))

(assert (=> bm!33193 m!600731))

(declare-fun m!600739 () Bool)

(assert (=> bm!33193 m!600739))

(assert (=> b!625581 d!88633))

(declare-fun b!625721 () Bool)

(declare-fun c!71322 () Bool)

(declare-fun lt!289713 () (_ BitVec 64))

(assert (=> b!625721 (= c!71322 (= lt!289713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358526 () SeekEntryResult!6595)

(declare-fun e!358525 () SeekEntryResult!6595)

(assert (=> b!625721 (= e!358526 e!358525)))

(declare-fun b!625722 () Bool)

(declare-fun lt!289712 () SeekEntryResult!6595)

(assert (=> b!625722 (= e!358526 (Found!6595 (index!28666 lt!289712)))))

(declare-fun b!625723 () Bool)

(assert (=> b!625723 (= e!358525 (seekKeyOrZeroReturnVacant!0 (x!57420 lt!289712) (index!28666 lt!289712) (index!28666 lt!289712) k0!1786 a!2986 mask!3053))))

(declare-fun b!625724 () Bool)

(declare-fun e!358527 () SeekEntryResult!6595)

(assert (=> b!625724 (= e!358527 Undefined!6595)))

(declare-fun b!625725 () Bool)

(assert (=> b!625725 (= e!358527 e!358526)))

(assert (=> b!625725 (= lt!289713 (select (arr!18158 a!2986) (index!28666 lt!289712)))))

(declare-fun c!71321 () Bool)

(assert (=> b!625725 (= c!71321 (= lt!289713 k0!1786))))

(declare-fun b!625726 () Bool)

(assert (=> b!625726 (= e!358525 (MissingZero!6595 (index!28666 lt!289712)))))

(declare-fun d!88637 () Bool)

(declare-fun lt!289714 () SeekEntryResult!6595)

(assert (=> d!88637 (and (or ((_ is Undefined!6595) lt!289714) (not ((_ is Found!6595) lt!289714)) (and (bvsge (index!28665 lt!289714) #b00000000000000000000000000000000) (bvslt (index!28665 lt!289714) (size!18523 a!2986)))) (or ((_ is Undefined!6595) lt!289714) ((_ is Found!6595) lt!289714) (not ((_ is MissingZero!6595) lt!289714)) (and (bvsge (index!28664 lt!289714) #b00000000000000000000000000000000) (bvslt (index!28664 lt!289714) (size!18523 a!2986)))) (or ((_ is Undefined!6595) lt!289714) ((_ is Found!6595) lt!289714) ((_ is MissingZero!6595) lt!289714) (not ((_ is MissingVacant!6595) lt!289714)) (and (bvsge (index!28667 lt!289714) #b00000000000000000000000000000000) (bvslt (index!28667 lt!289714) (size!18523 a!2986)))) (or ((_ is Undefined!6595) lt!289714) (ite ((_ is Found!6595) lt!289714) (= (select (arr!18158 a!2986) (index!28665 lt!289714)) k0!1786) (ite ((_ is MissingZero!6595) lt!289714) (= (select (arr!18158 a!2986) (index!28664 lt!289714)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6595) lt!289714) (= (select (arr!18158 a!2986) (index!28667 lt!289714)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88637 (= lt!289714 e!358527)))

(declare-fun c!71320 () Bool)

(assert (=> d!88637 (= c!71320 (and ((_ is Intermediate!6595) lt!289712) (undefined!7407 lt!289712)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37830 (_ BitVec 32)) SeekEntryResult!6595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88637 (= lt!289712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88637 (validMask!0 mask!3053)))

(assert (=> d!88637 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289714)))

(assert (= (and d!88637 c!71320) b!625724))

(assert (= (and d!88637 (not c!71320)) b!625725))

(assert (= (and b!625725 c!71321) b!625722))

(assert (= (and b!625725 (not c!71321)) b!625721))

(assert (= (and b!625721 c!71322) b!625726))

(assert (= (and b!625721 (not c!71322)) b!625723))

(declare-fun m!600749 () Bool)

(assert (=> b!625723 m!600749))

(declare-fun m!600751 () Bool)

(assert (=> b!625725 m!600751))

(declare-fun m!600753 () Bool)

(assert (=> d!88637 m!600753))

(declare-fun m!600755 () Bool)

(assert (=> d!88637 m!600755))

(assert (=> d!88637 m!600753))

(declare-fun m!600757 () Bool)

(assert (=> d!88637 m!600757))

(assert (=> d!88637 m!600641))

(declare-fun m!600759 () Bool)

(assert (=> d!88637 m!600759))

(declare-fun m!600761 () Bool)

(assert (=> d!88637 m!600761))

(assert (=> b!625576 d!88637))

(declare-fun b!625727 () Bool)

(declare-fun c!71325 () Bool)

(declare-fun lt!289716 () (_ BitVec 64))

(assert (=> b!625727 (= c!71325 (= lt!289716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358530 () SeekEntryResult!6595)

(declare-fun e!358528 () SeekEntryResult!6595)

(assert (=> b!625727 (= e!358530 e!358528)))

(declare-fun b!625728 () Bool)

(assert (=> b!625728 (= e!358528 (MissingVacant!6595 vacantSpotIndex!68))))

(declare-fun b!625729 () Bool)

(assert (=> b!625729 (= e!358528 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18158 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625730 () Bool)

(declare-fun e!358529 () SeekEntryResult!6595)

(assert (=> b!625730 (= e!358529 e!358530)))

(declare-fun c!71324 () Bool)

(assert (=> b!625730 (= c!71324 (= lt!289716 (select (arr!18158 a!2986) j!136)))))

(declare-fun d!88647 () Bool)

(declare-fun lt!289715 () SeekEntryResult!6595)

(assert (=> d!88647 (and (or ((_ is Undefined!6595) lt!289715) (not ((_ is Found!6595) lt!289715)) (and (bvsge (index!28665 lt!289715) #b00000000000000000000000000000000) (bvslt (index!28665 lt!289715) (size!18523 a!2986)))) (or ((_ is Undefined!6595) lt!289715) ((_ is Found!6595) lt!289715) (not ((_ is MissingVacant!6595) lt!289715)) (not (= (index!28667 lt!289715) vacantSpotIndex!68)) (and (bvsge (index!28667 lt!289715) #b00000000000000000000000000000000) (bvslt (index!28667 lt!289715) (size!18523 a!2986)))) (or ((_ is Undefined!6595) lt!289715) (ite ((_ is Found!6595) lt!289715) (= (select (arr!18158 a!2986) (index!28665 lt!289715)) (select (arr!18158 a!2986) j!136)) (and ((_ is MissingVacant!6595) lt!289715) (= (index!28667 lt!289715) vacantSpotIndex!68) (= (select (arr!18158 a!2986) (index!28667 lt!289715)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88647 (= lt!289715 e!358529)))

(declare-fun c!71323 () Bool)

(assert (=> d!88647 (= c!71323 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88647 (= lt!289716 (select (arr!18158 a!2986) index!984))))

(assert (=> d!88647 (validMask!0 mask!3053)))

(assert (=> d!88647 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18158 a!2986) j!136) a!2986 mask!3053) lt!289715)))

(declare-fun b!625731 () Bool)

(assert (=> b!625731 (= e!358530 (Found!6595 index!984))))

(declare-fun b!625732 () Bool)

(assert (=> b!625732 (= e!358529 Undefined!6595)))

(assert (= (and d!88647 c!71323) b!625732))

(assert (= (and d!88647 (not c!71323)) b!625730))

(assert (= (and b!625730 c!71324) b!625731))

(assert (= (and b!625730 (not c!71324)) b!625727))

(assert (= (and b!625727 c!71325) b!625728))

(assert (= (and b!625727 (not c!71325)) b!625729))

(assert (=> b!625729 m!600721))

(assert (=> b!625729 m!600721))

(assert (=> b!625729 m!600637))

(declare-fun m!600763 () Bool)

(assert (=> b!625729 m!600763))

(declare-fun m!600765 () Bool)

(assert (=> d!88647 m!600765))

(declare-fun m!600767 () Bool)

(assert (=> d!88647 m!600767))

(assert (=> d!88647 m!600635))

(assert (=> d!88647 m!600641))

(assert (=> b!625577 d!88647))

(declare-fun bm!33199 () Bool)

(declare-fun call!33202 () Bool)

(assert (=> bm!33199 (= call!33202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!625771 () Bool)

(declare-fun e!358555 () Bool)

(declare-fun e!358556 () Bool)

(assert (=> b!625771 (= e!358555 e!358556)))

(declare-fun c!71342 () Bool)

(assert (=> b!625771 (= c!71342 (validKeyInArray!0 (select (arr!18158 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!625772 () Bool)

(assert (=> b!625772 (= e!358556 call!33202)))

(declare-fun b!625773 () Bool)

(declare-fun e!358557 () Bool)

(assert (=> b!625773 (= e!358556 e!358557)))

(declare-fun lt!289742 () (_ BitVec 64))

(assert (=> b!625773 (= lt!289742 (select (arr!18158 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21070 0))(
  ( (Unit!21071) )
))
(declare-fun lt!289743 () Unit!21070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37830 (_ BitVec 64) (_ BitVec 32)) Unit!21070)

(assert (=> b!625773 (= lt!289743 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289742 #b00000000000000000000000000000000))))

(assert (=> b!625773 (arrayContainsKey!0 a!2986 lt!289742 #b00000000000000000000000000000000)))

(declare-fun lt!289741 () Unit!21070)

(assert (=> b!625773 (= lt!289741 lt!289743)))

(declare-fun res!403823 () Bool)

(assert (=> b!625773 (= res!403823 (= (seekEntryOrOpen!0 (select (arr!18158 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6595 #b00000000000000000000000000000000)))))

(assert (=> b!625773 (=> (not res!403823) (not e!358557))))

(declare-fun b!625774 () Bool)

(assert (=> b!625774 (= e!358557 call!33202)))

(declare-fun d!88649 () Bool)

(declare-fun res!403824 () Bool)

(assert (=> d!88649 (=> res!403824 e!358555)))

(assert (=> d!88649 (= res!403824 (bvsge #b00000000000000000000000000000000 (size!18523 a!2986)))))

(assert (=> d!88649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358555)))

(assert (= (and d!88649 (not res!403824)) b!625771))

(assert (= (and b!625771 c!71342) b!625773))

(assert (= (and b!625771 (not c!71342)) b!625772))

(assert (= (and b!625773 res!403823) b!625774))

(assert (= (or b!625774 b!625772) bm!33199))

(declare-fun m!600797 () Bool)

(assert (=> bm!33199 m!600797))

(assert (=> b!625771 m!600731))

(assert (=> b!625771 m!600731))

(assert (=> b!625771 m!600737))

(assert (=> b!625773 m!600731))

(declare-fun m!600799 () Bool)

(assert (=> b!625773 m!600799))

(declare-fun m!600801 () Bool)

(assert (=> b!625773 m!600801))

(assert (=> b!625773 m!600731))

(declare-fun m!600803 () Bool)

(assert (=> b!625773 m!600803))

(assert (=> b!625582 d!88649))

(check-sat (not b!625666) (not d!88637) (not d!88627) (not b!625729) (not b!625771) (not b!625677) (not b!625657) (not bm!33193) (not b!625723) (not b!625679) (not bm!33199) (not b!625680) (not b!625773) (not d!88647))
(check-sat)
