; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57920 () Bool)

(assert start!57920)

(declare-fun res!415022 () Bool)

(declare-fun e!366744 () Bool)

(assert (=> start!57920 (=> (not res!415022) (not e!366744))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57920 (= res!415022 (validMask!0 mask!3053))))

(assert (=> start!57920 e!366744))

(assert (=> start!57920 true))

(declare-datatypes ((array!38358 0))(
  ( (array!38359 (arr!18398 (Array (_ BitVec 32) (_ BitVec 64))) (size!18763 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38358)

(declare-fun array_inv!14281 (array!38358) Bool)

(assert (=> start!57920 (array_inv!14281 a!2986)))

(declare-fun b!640649 () Bool)

(declare-fun res!415023 () Bool)

(assert (=> b!640649 (=> (not res!415023) (not e!366744))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640649 (= res!415023 (and (= (size!18763 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18763 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640650 () Bool)

(declare-fun e!366749 () Bool)

(declare-fun e!366747 () Bool)

(assert (=> b!640650 (= e!366749 e!366747)))

(declare-fun res!415026 () Bool)

(assert (=> b!640650 (=> res!415026 e!366747)))

(declare-fun lt!296489 () (_ BitVec 64))

(declare-fun lt!296493 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640650 (= res!415026 (or (not (= (select (arr!18398 a!2986) j!136) lt!296489)) (not (= (select (arr!18398 a!2986) j!136) lt!296493)) (bvsge j!136 index!984)))))

(declare-fun e!366740 () Bool)

(assert (=> b!640650 e!366740))

(declare-fun res!415030 () Bool)

(assert (=> b!640650 (=> (not res!415030) (not e!366740))))

(assert (=> b!640650 (= res!415030 (= lt!296493 (select (arr!18398 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640650 (= lt!296493 (select (store (arr!18398 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640651 () Bool)

(declare-fun e!366741 () Bool)

(assert (=> b!640651 (= e!366741 (not e!366749))))

(declare-fun res!415031 () Bool)

(assert (=> b!640651 (=> res!415031 e!366749)))

(declare-datatypes ((SeekEntryResult!6835 0))(
  ( (MissingZero!6835 (index!29660 (_ BitVec 32))) (Found!6835 (index!29661 (_ BitVec 32))) (Intermediate!6835 (undefined!7647 Bool) (index!29662 (_ BitVec 32)) (x!58426 (_ BitVec 32))) (Undefined!6835) (MissingVacant!6835 (index!29663 (_ BitVec 32))) )
))
(declare-fun lt!296490 () SeekEntryResult!6835)

(assert (=> b!640651 (= res!415031 (not (= lt!296490 (Found!6835 index!984))))))

(declare-datatypes ((Unit!21668 0))(
  ( (Unit!21669) )
))
(declare-fun lt!296482 () Unit!21668)

(declare-fun e!366739 () Unit!21668)

(assert (=> b!640651 (= lt!296482 e!366739)))

(declare-fun c!73182 () Bool)

(assert (=> b!640651 (= c!73182 (= lt!296490 Undefined!6835))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!296481 () array!38358)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38358 (_ BitVec 32)) SeekEntryResult!6835)

(assert (=> b!640651 (= lt!296490 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296489 lt!296481 mask!3053))))

(declare-fun e!366746 () Bool)

(assert (=> b!640651 e!366746))

(declare-fun res!415033 () Bool)

(assert (=> b!640651 (=> (not res!415033) (not e!366746))))

(declare-fun lt!296484 () (_ BitVec 32))

(declare-fun lt!296488 () SeekEntryResult!6835)

(assert (=> b!640651 (= res!415033 (= lt!296488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 lt!296489 lt!296481 mask!3053)))))

(assert (=> b!640651 (= lt!296488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640651 (= lt!296489 (select (store (arr!18398 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296483 () Unit!21668)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38358 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21668)

(assert (=> b!640651 (= lt!296483 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640651 (= lt!296484 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640652 () Bool)

(declare-fun res!415025 () Bool)

(assert (=> b!640652 (=> (not res!415025) (not e!366744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640652 (= res!415025 (validKeyInArray!0 (select (arr!18398 a!2986) j!136)))))

(declare-fun b!640653 () Bool)

(declare-fun res!415021 () Bool)

(declare-fun e!366742 () Bool)

(assert (=> b!640653 (=> (not res!415021) (not e!366742))))

(declare-datatypes ((List!12478 0))(
  ( (Nil!12475) (Cons!12474 (h!13519 (_ BitVec 64)) (t!18697 List!12478)) )
))
(declare-fun arrayNoDuplicates!0 (array!38358 (_ BitVec 32) List!12478) Bool)

(assert (=> b!640653 (= res!415021 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12475))))

(declare-fun b!640654 () Bool)

(declare-fun e!366748 () Bool)

(declare-fun e!366738 () Bool)

(assert (=> b!640654 (= e!366748 e!366738)))

(declare-fun res!415027 () Bool)

(assert (=> b!640654 (=> (not res!415027) (not e!366738))))

(declare-fun arrayContainsKey!0 (array!38358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640654 (= res!415027 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) j!136))))

(declare-fun b!640655 () Bool)

(declare-fun Unit!21670 () Unit!21668)

(assert (=> b!640655 (= e!366739 Unit!21670)))

(assert (=> b!640655 false))

(declare-fun b!640656 () Bool)

(declare-fun Unit!21671 () Unit!21668)

(assert (=> b!640656 (= e!366739 Unit!21671)))

(declare-fun b!640657 () Bool)

(declare-fun lt!296486 () SeekEntryResult!6835)

(assert (=> b!640657 (= e!366746 (= lt!296486 lt!296488))))

(declare-fun b!640658 () Bool)

(declare-fun e!366737 () Bool)

(assert (=> b!640658 (= e!366747 e!366737)))

(declare-fun res!415034 () Bool)

(assert (=> b!640658 (=> res!415034 e!366737)))

(assert (=> b!640658 (= res!415034 (or (bvsge (size!18763 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18763 a!2986))))))

(assert (=> b!640658 (arrayNoDuplicates!0 lt!296481 j!136 Nil!12475)))

(declare-fun lt!296492 () Unit!21668)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38358 (_ BitVec 32) (_ BitVec 32)) Unit!21668)

(assert (=> b!640658 (= lt!296492 (lemmaNoDuplicateFromThenFromBigger!0 lt!296481 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640658 (arrayNoDuplicates!0 lt!296481 #b00000000000000000000000000000000 Nil!12475)))

(declare-fun lt!296485 () Unit!21668)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12478) Unit!21668)

(assert (=> b!640658 (= lt!296485 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12475))))

(assert (=> b!640658 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296487 () Unit!21668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21668)

(assert (=> b!640658 (= lt!296487 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296481 (select (arr!18398 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640659 () Bool)

(assert (=> b!640659 (= e!366740 e!366748)))

(declare-fun res!415024 () Bool)

(assert (=> b!640659 (=> res!415024 e!366748)))

(assert (=> b!640659 (= res!415024 (or (not (= (select (arr!18398 a!2986) j!136) lt!296489)) (not (= (select (arr!18398 a!2986) j!136) lt!296493)) (bvsge j!136 index!984)))))

(declare-fun b!640660 () Bool)

(declare-fun res!415028 () Bool)

(assert (=> b!640660 (=> (not res!415028) (not e!366744))))

(assert (=> b!640660 (= res!415028 (validKeyInArray!0 k0!1786))))

(declare-fun b!640661 () Bool)

(declare-fun e!366743 () Bool)

(assert (=> b!640661 (= e!366743 e!366741)))

(declare-fun res!415032 () Bool)

(assert (=> b!640661 (=> (not res!415032) (not e!366741))))

(assert (=> b!640661 (= res!415032 (and (= lt!296486 (Found!6835 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18398 a!2986) index!984) (select (arr!18398 a!2986) j!136))) (not (= (select (arr!18398 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640661 (= lt!296486 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640662 () Bool)

(assert (=> b!640662 (= e!366738 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) index!984))))

(declare-fun b!640663 () Bool)

(declare-fun noDuplicate!404 (List!12478) Bool)

(assert (=> b!640663 (= e!366737 (noDuplicate!404 Nil!12475))))

(declare-fun b!640664 () Bool)

(assert (=> b!640664 (= e!366742 e!366743)))

(declare-fun res!415020 () Bool)

(assert (=> b!640664 (=> (not res!415020) (not e!366743))))

(assert (=> b!640664 (= res!415020 (= (select (store (arr!18398 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640664 (= lt!296481 (array!38359 (store (arr!18398 a!2986) i!1108 k0!1786) (size!18763 a!2986)))))

(declare-fun b!640665 () Bool)

(assert (=> b!640665 (= e!366744 e!366742)))

(declare-fun res!415035 () Bool)

(assert (=> b!640665 (=> (not res!415035) (not e!366742))))

(declare-fun lt!296491 () SeekEntryResult!6835)

(assert (=> b!640665 (= res!415035 (or (= lt!296491 (MissingZero!6835 i!1108)) (= lt!296491 (MissingVacant!6835 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38358 (_ BitVec 32)) SeekEntryResult!6835)

(assert (=> b!640665 (= lt!296491 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640666 () Bool)

(declare-fun res!415029 () Bool)

(assert (=> b!640666 (=> (not res!415029) (not e!366744))))

(assert (=> b!640666 (= res!415029 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640667 () Bool)

(declare-fun res!415019 () Bool)

(assert (=> b!640667 (=> (not res!415019) (not e!366742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38358 (_ BitVec 32)) Bool)

(assert (=> b!640667 (= res!415019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640668 () Bool)

(declare-fun res!415036 () Bool)

(assert (=> b!640668 (=> (not res!415036) (not e!366742))))

(assert (=> b!640668 (= res!415036 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18398 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57920 res!415022) b!640649))

(assert (= (and b!640649 res!415023) b!640652))

(assert (= (and b!640652 res!415025) b!640660))

(assert (= (and b!640660 res!415028) b!640666))

(assert (= (and b!640666 res!415029) b!640665))

(assert (= (and b!640665 res!415035) b!640667))

(assert (= (and b!640667 res!415019) b!640653))

(assert (= (and b!640653 res!415021) b!640668))

(assert (= (and b!640668 res!415036) b!640664))

(assert (= (and b!640664 res!415020) b!640661))

(assert (= (and b!640661 res!415032) b!640651))

(assert (= (and b!640651 res!415033) b!640657))

(assert (= (and b!640651 c!73182) b!640655))

(assert (= (and b!640651 (not c!73182)) b!640656))

(assert (= (and b!640651 (not res!415031)) b!640650))

(assert (= (and b!640650 res!415030) b!640659))

(assert (= (and b!640659 (not res!415024)) b!640654))

(assert (= (and b!640654 res!415027) b!640662))

(assert (= (and b!640650 (not res!415026)) b!640658))

(assert (= (and b!640658 (not res!415034)) b!640663))

(declare-fun m!614001 () Bool)

(assert (=> b!640658 m!614001))

(declare-fun m!614003 () Bool)

(assert (=> b!640658 m!614003))

(declare-fun m!614005 () Bool)

(assert (=> b!640658 m!614005))

(assert (=> b!640658 m!614001))

(declare-fun m!614007 () Bool)

(assert (=> b!640658 m!614007))

(declare-fun m!614009 () Bool)

(assert (=> b!640658 m!614009))

(assert (=> b!640658 m!614001))

(declare-fun m!614011 () Bool)

(assert (=> b!640658 m!614011))

(declare-fun m!614013 () Bool)

(assert (=> b!640658 m!614013))

(declare-fun m!614015 () Bool)

(assert (=> b!640667 m!614015))

(declare-fun m!614017 () Bool)

(assert (=> b!640668 m!614017))

(declare-fun m!614019 () Bool)

(assert (=> b!640666 m!614019))

(declare-fun m!614021 () Bool)

(assert (=> b!640664 m!614021))

(declare-fun m!614023 () Bool)

(assert (=> b!640664 m!614023))

(declare-fun m!614025 () Bool)

(assert (=> b!640660 m!614025))

(declare-fun m!614027 () Bool)

(assert (=> b!640651 m!614027))

(declare-fun m!614029 () Bool)

(assert (=> b!640651 m!614029))

(assert (=> b!640651 m!614001))

(assert (=> b!640651 m!614021))

(declare-fun m!614031 () Bool)

(assert (=> b!640651 m!614031))

(declare-fun m!614033 () Bool)

(assert (=> b!640651 m!614033))

(declare-fun m!614035 () Bool)

(assert (=> b!640651 m!614035))

(assert (=> b!640651 m!614001))

(declare-fun m!614037 () Bool)

(assert (=> b!640651 m!614037))

(assert (=> b!640662 m!614001))

(assert (=> b!640662 m!614001))

(declare-fun m!614039 () Bool)

(assert (=> b!640662 m!614039))

(declare-fun m!614041 () Bool)

(assert (=> b!640665 m!614041))

(declare-fun m!614043 () Bool)

(assert (=> b!640663 m!614043))

(assert (=> b!640650 m!614001))

(assert (=> b!640650 m!614021))

(declare-fun m!614045 () Bool)

(assert (=> b!640650 m!614045))

(declare-fun m!614047 () Bool)

(assert (=> b!640653 m!614047))

(declare-fun m!614049 () Bool)

(assert (=> b!640661 m!614049))

(assert (=> b!640661 m!614001))

(assert (=> b!640661 m!614001))

(declare-fun m!614051 () Bool)

(assert (=> b!640661 m!614051))

(assert (=> b!640659 m!614001))

(assert (=> b!640652 m!614001))

(assert (=> b!640652 m!614001))

(declare-fun m!614053 () Bool)

(assert (=> b!640652 m!614053))

(declare-fun m!614055 () Bool)

(assert (=> start!57920 m!614055))

(declare-fun m!614057 () Bool)

(assert (=> start!57920 m!614057))

(assert (=> b!640654 m!614001))

(assert (=> b!640654 m!614001))

(declare-fun m!614059 () Bool)

(assert (=> b!640654 m!614059))

(check-sat (not b!640653) (not b!640660) (not b!640658) (not start!57920) (not b!640651) (not b!640663) (not b!640662) (not b!640665) (not b!640666) (not b!640661) (not b!640667) (not b!640652) (not b!640654))
(check-sat)
(get-model)

(declare-fun d!90269 () Bool)

(assert (=> d!90269 (= (validKeyInArray!0 (select (arr!18398 a!2986) j!136)) (and (not (= (select (arr!18398 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18398 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!640652 d!90269))

(declare-fun d!90271 () Bool)

(declare-fun res!415149 () Bool)

(declare-fun e!366832 () Bool)

(assert (=> d!90271 (=> res!415149 e!366832)))

(get-info :version)

(assert (=> d!90271 (= res!415149 ((_ is Nil!12475) Nil!12475))))

(assert (=> d!90271 (= (noDuplicate!404 Nil!12475) e!366832)))

(declare-fun b!640793 () Bool)

(declare-fun e!366833 () Bool)

(assert (=> b!640793 (= e!366832 e!366833)))

(declare-fun res!415150 () Bool)

(assert (=> b!640793 (=> (not res!415150) (not e!366833))))

(declare-fun contains!3111 (List!12478 (_ BitVec 64)) Bool)

(assert (=> b!640793 (= res!415150 (not (contains!3111 (t!18697 Nil!12475) (h!13519 Nil!12475))))))

(declare-fun b!640794 () Bool)

(assert (=> b!640794 (= e!366833 (noDuplicate!404 (t!18697 Nil!12475)))))

(assert (= (and d!90271 (not res!415149)) b!640793))

(assert (= (and b!640793 res!415150) b!640794))

(declare-fun m!614181 () Bool)

(assert (=> b!640793 m!614181))

(declare-fun m!614183 () Bool)

(assert (=> b!640794 m!614183))

(assert (=> b!640663 d!90271))

(declare-fun bm!33484 () Bool)

(declare-fun call!33487 () Bool)

(declare-fun c!73191 () Bool)

(assert (=> bm!33484 (= call!33487 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73191 (Cons!12474 (select (arr!18398 a!2986) #b00000000000000000000000000000000) Nil!12475) Nil!12475)))))

(declare-fun b!640805 () Bool)

(declare-fun e!366843 () Bool)

(assert (=> b!640805 (= e!366843 call!33487)))

(declare-fun b!640806 () Bool)

(declare-fun e!366845 () Bool)

(assert (=> b!640806 (= e!366845 (contains!3111 Nil!12475 (select (arr!18398 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!640807 () Bool)

(declare-fun e!366844 () Bool)

(assert (=> b!640807 (= e!366844 e!366843)))

(assert (=> b!640807 (= c!73191 (validKeyInArray!0 (select (arr!18398 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!640808 () Bool)

(assert (=> b!640808 (= e!366843 call!33487)))

(declare-fun b!640809 () Bool)

(declare-fun e!366842 () Bool)

(assert (=> b!640809 (= e!366842 e!366844)))

(declare-fun res!415158 () Bool)

(assert (=> b!640809 (=> (not res!415158) (not e!366844))))

(assert (=> b!640809 (= res!415158 (not e!366845))))

(declare-fun res!415159 () Bool)

(assert (=> b!640809 (=> (not res!415159) (not e!366845))))

(assert (=> b!640809 (= res!415159 (validKeyInArray!0 (select (arr!18398 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90273 () Bool)

(declare-fun res!415157 () Bool)

(assert (=> d!90273 (=> res!415157 e!366842)))

(assert (=> d!90273 (= res!415157 (bvsge #b00000000000000000000000000000000 (size!18763 a!2986)))))

(assert (=> d!90273 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12475) e!366842)))

(assert (= (and d!90273 (not res!415157)) b!640809))

(assert (= (and b!640809 res!415159) b!640806))

(assert (= (and b!640809 res!415158) b!640807))

(assert (= (and b!640807 c!73191) b!640808))

(assert (= (and b!640807 (not c!73191)) b!640805))

(assert (= (or b!640808 b!640805) bm!33484))

(declare-fun m!614185 () Bool)

(assert (=> bm!33484 m!614185))

(declare-fun m!614187 () Bool)

(assert (=> bm!33484 m!614187))

(assert (=> b!640806 m!614185))

(assert (=> b!640806 m!614185))

(declare-fun m!614189 () Bool)

(assert (=> b!640806 m!614189))

(assert (=> b!640807 m!614185))

(assert (=> b!640807 m!614185))

(declare-fun m!614191 () Bool)

(assert (=> b!640807 m!614191))

(assert (=> b!640809 m!614185))

(assert (=> b!640809 m!614185))

(assert (=> b!640809 m!614191))

(assert (=> b!640653 d!90273))

(declare-fun d!90275 () Bool)

(declare-fun res!415164 () Bool)

(declare-fun e!366850 () Bool)

(assert (=> d!90275 (=> res!415164 e!366850)))

(assert (=> d!90275 (= res!415164 (= (select (arr!18398 lt!296481) j!136) (select (arr!18398 a!2986) j!136)))))

(assert (=> d!90275 (= (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) j!136) e!366850)))

(declare-fun b!640814 () Bool)

(declare-fun e!366851 () Bool)

(assert (=> b!640814 (= e!366850 e!366851)))

(declare-fun res!415165 () Bool)

(assert (=> b!640814 (=> (not res!415165) (not e!366851))))

(assert (=> b!640814 (= res!415165 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18763 lt!296481)))))

(declare-fun b!640815 () Bool)

(assert (=> b!640815 (= e!366851 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90275 (not res!415164)) b!640814))

(assert (= (and b!640814 res!415165) b!640815))

(declare-fun m!614193 () Bool)

(assert (=> d!90275 m!614193))

(assert (=> b!640815 m!614001))

(declare-fun m!614195 () Bool)

(assert (=> b!640815 m!614195))

(assert (=> b!640654 d!90275))

(declare-fun d!90277 () Bool)

(assert (=> d!90277 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!640660 d!90277))

(declare-fun lt!296576 () SeekEntryResult!6835)

(declare-fun d!90279 () Bool)

(assert (=> d!90279 (and (or ((_ is Undefined!6835) lt!296576) (not ((_ is Found!6835) lt!296576)) (and (bvsge (index!29661 lt!296576) #b00000000000000000000000000000000) (bvslt (index!29661 lt!296576) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296576) ((_ is Found!6835) lt!296576) (not ((_ is MissingVacant!6835) lt!296576)) (not (= (index!29663 lt!296576) vacantSpotIndex!68)) (and (bvsge (index!29663 lt!296576) #b00000000000000000000000000000000) (bvslt (index!29663 lt!296576) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296576) (ite ((_ is Found!6835) lt!296576) (= (select (arr!18398 a!2986) (index!29661 lt!296576)) (select (arr!18398 a!2986) j!136)) (and ((_ is MissingVacant!6835) lt!296576) (= (index!29663 lt!296576) vacantSpotIndex!68) (= (select (arr!18398 a!2986) (index!29663 lt!296576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!366867 () SeekEntryResult!6835)

(assert (=> d!90279 (= lt!296576 e!366867)))

(declare-fun c!73200 () Bool)

(assert (=> d!90279 (= c!73200 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!296577 () (_ BitVec 64))

(assert (=> d!90279 (= lt!296577 (select (arr!18398 a!2986) index!984))))

(assert (=> d!90279 (validMask!0 mask!3053)))

(assert (=> d!90279 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053) lt!296576)))

(declare-fun b!640836 () Bool)

(declare-fun e!366868 () SeekEntryResult!6835)

(assert (=> b!640836 (= e!366867 e!366868)))

(declare-fun c!73198 () Bool)

(assert (=> b!640836 (= c!73198 (= lt!296577 (select (arr!18398 a!2986) j!136)))))

(declare-fun b!640837 () Bool)

(declare-fun c!73199 () Bool)

(assert (=> b!640837 (= c!73199 (= lt!296577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366866 () SeekEntryResult!6835)

(assert (=> b!640837 (= e!366868 e!366866)))

(declare-fun b!640838 () Bool)

(assert (=> b!640838 (= e!366867 Undefined!6835)))

(declare-fun b!640839 () Bool)

(assert (=> b!640839 (= e!366866 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!640840 () Bool)

(assert (=> b!640840 (= e!366866 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640841 () Bool)

(assert (=> b!640841 (= e!366868 (Found!6835 index!984))))

(assert (= (and d!90279 c!73200) b!640838))

(assert (= (and d!90279 (not c!73200)) b!640836))

(assert (= (and b!640836 c!73198) b!640841))

(assert (= (and b!640836 (not c!73198)) b!640837))

(assert (= (and b!640837 c!73199) b!640839))

(assert (= (and b!640837 (not c!73199)) b!640840))

(declare-fun m!614205 () Bool)

(assert (=> d!90279 m!614205))

(declare-fun m!614207 () Bool)

(assert (=> d!90279 m!614207))

(assert (=> d!90279 m!614049))

(assert (=> d!90279 m!614055))

(assert (=> b!640840 m!614035))

(assert (=> b!640840 m!614035))

(assert (=> b!640840 m!614001))

(declare-fun m!614209 () Bool)

(assert (=> b!640840 m!614209))

(assert (=> b!640661 d!90279))

(declare-fun lt!296578 () SeekEntryResult!6835)

(declare-fun d!90287 () Bool)

(assert (=> d!90287 (and (or ((_ is Undefined!6835) lt!296578) (not ((_ is Found!6835) lt!296578)) (and (bvsge (index!29661 lt!296578) #b00000000000000000000000000000000) (bvslt (index!29661 lt!296578) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296578) ((_ is Found!6835) lt!296578) (not ((_ is MissingVacant!6835) lt!296578)) (not (= (index!29663 lt!296578) vacantSpotIndex!68)) (and (bvsge (index!29663 lt!296578) #b00000000000000000000000000000000) (bvslt (index!29663 lt!296578) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296578) (ite ((_ is Found!6835) lt!296578) (= (select (arr!18398 a!2986) (index!29661 lt!296578)) (select (arr!18398 a!2986) j!136)) (and ((_ is MissingVacant!6835) lt!296578) (= (index!29663 lt!296578) vacantSpotIndex!68) (= (select (arr!18398 a!2986) (index!29663 lt!296578)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!366870 () SeekEntryResult!6835)

(assert (=> d!90287 (= lt!296578 e!366870)))

(declare-fun c!73203 () Bool)

(assert (=> d!90287 (= c!73203 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!296579 () (_ BitVec 64))

(assert (=> d!90287 (= lt!296579 (select (arr!18398 a!2986) lt!296484))))

(assert (=> d!90287 (validMask!0 mask!3053)))

(assert (=> d!90287 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053) lt!296578)))

(declare-fun b!640842 () Bool)

(declare-fun e!366871 () SeekEntryResult!6835)

(assert (=> b!640842 (= e!366870 e!366871)))

(declare-fun c!73201 () Bool)

(assert (=> b!640842 (= c!73201 (= lt!296579 (select (arr!18398 a!2986) j!136)))))

(declare-fun b!640843 () Bool)

(declare-fun c!73202 () Bool)

(assert (=> b!640843 (= c!73202 (= lt!296579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366869 () SeekEntryResult!6835)

(assert (=> b!640843 (= e!366871 e!366869)))

(declare-fun b!640844 () Bool)

(assert (=> b!640844 (= e!366870 Undefined!6835)))

(declare-fun b!640845 () Bool)

(assert (=> b!640845 (= e!366869 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!640846 () Bool)

(assert (=> b!640846 (= e!366869 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296484 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640847 () Bool)

(assert (=> b!640847 (= e!366871 (Found!6835 lt!296484))))

(assert (= (and d!90287 c!73203) b!640844))

(assert (= (and d!90287 (not c!73203)) b!640842))

(assert (= (and b!640842 c!73201) b!640847))

(assert (= (and b!640842 (not c!73201)) b!640843))

(assert (= (and b!640843 c!73202) b!640845))

(assert (= (and b!640843 (not c!73202)) b!640846))

(declare-fun m!614211 () Bool)

(assert (=> d!90287 m!614211))

(declare-fun m!614213 () Bool)

(assert (=> d!90287 m!614213))

(declare-fun m!614215 () Bool)

(assert (=> d!90287 m!614215))

(assert (=> d!90287 m!614055))

(declare-fun m!614217 () Bool)

(assert (=> b!640846 m!614217))

(assert (=> b!640846 m!614217))

(assert (=> b!640846 m!614001))

(declare-fun m!614219 () Bool)

(assert (=> b!640846 m!614219))

(assert (=> b!640651 d!90287))

(declare-fun d!90289 () Bool)

(declare-fun lt!296582 () (_ BitVec 32))

(assert (=> d!90289 (and (bvsge lt!296582 #b00000000000000000000000000000000) (bvslt lt!296582 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90289 (= lt!296582 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90289 (validMask!0 mask!3053)))

(assert (=> d!90289 (= (nextIndex!0 index!984 x!910 mask!3053) lt!296582)))

(declare-fun bs!19164 () Bool)

(assert (= bs!19164 d!90289))

(declare-fun m!614221 () Bool)

(assert (=> bs!19164 m!614221))

(assert (=> bs!19164 m!614055))

(assert (=> b!640651 d!90289))

(declare-fun d!90291 () Bool)

(declare-fun e!366909 () Bool)

(assert (=> d!90291 e!366909))

(declare-fun res!415197 () Bool)

(assert (=> d!90291 (=> (not res!415197) (not e!366909))))

(assert (=> d!90291 (= res!415197 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18763 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18763 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18763 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986))))))

(declare-fun lt!296600 () Unit!21668)

(declare-fun choose!9 (array!38358 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21668)

(assert (=> d!90291 (= lt!296600 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90291 (validMask!0 mask!3053)))

(assert (=> d!90291 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 mask!3053) lt!296600)))

(declare-fun b!640899 () Bool)

(assert (=> b!640899 (= e!366909 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 (select (store (arr!18398 a!2986) i!1108 k0!1786) j!136) (array!38359 (store (arr!18398 a!2986) i!1108 k0!1786) (size!18763 a!2986)) mask!3053)))))

(assert (= (and d!90291 res!415197) b!640899))

(declare-fun m!614253 () Bool)

(assert (=> d!90291 m!614253))

(assert (=> d!90291 m!614055))

(assert (=> b!640899 m!614029))

(assert (=> b!640899 m!614021))

(assert (=> b!640899 m!614029))

(declare-fun m!614255 () Bool)

(assert (=> b!640899 m!614255))

(assert (=> b!640899 m!614001))

(assert (=> b!640899 m!614037))

(assert (=> b!640899 m!614001))

(assert (=> b!640651 d!90291))

(declare-fun lt!296601 () SeekEntryResult!6835)

(declare-fun d!90307 () Bool)

(assert (=> d!90307 (and (or ((_ is Undefined!6835) lt!296601) (not ((_ is Found!6835) lt!296601)) (and (bvsge (index!29661 lt!296601) #b00000000000000000000000000000000) (bvslt (index!29661 lt!296601) (size!18763 lt!296481)))) (or ((_ is Undefined!6835) lt!296601) ((_ is Found!6835) lt!296601) (not ((_ is MissingVacant!6835) lt!296601)) (not (= (index!29663 lt!296601) vacantSpotIndex!68)) (and (bvsge (index!29663 lt!296601) #b00000000000000000000000000000000) (bvslt (index!29663 lt!296601) (size!18763 lt!296481)))) (or ((_ is Undefined!6835) lt!296601) (ite ((_ is Found!6835) lt!296601) (= (select (arr!18398 lt!296481) (index!29661 lt!296601)) lt!296489) (and ((_ is MissingVacant!6835) lt!296601) (= (index!29663 lt!296601) vacantSpotIndex!68) (= (select (arr!18398 lt!296481) (index!29663 lt!296601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!366911 () SeekEntryResult!6835)

(assert (=> d!90307 (= lt!296601 e!366911)))

(declare-fun c!73220 () Bool)

(assert (=> d!90307 (= c!73220 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!296602 () (_ BitVec 64))

(assert (=> d!90307 (= lt!296602 (select (arr!18398 lt!296481) index!984))))

(assert (=> d!90307 (validMask!0 mask!3053)))

(assert (=> d!90307 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296489 lt!296481 mask!3053) lt!296601)))

(declare-fun b!640900 () Bool)

(declare-fun e!366912 () SeekEntryResult!6835)

(assert (=> b!640900 (= e!366911 e!366912)))

(declare-fun c!73218 () Bool)

(assert (=> b!640900 (= c!73218 (= lt!296602 lt!296489))))

(declare-fun b!640901 () Bool)

(declare-fun c!73219 () Bool)

(assert (=> b!640901 (= c!73219 (= lt!296602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366910 () SeekEntryResult!6835)

(assert (=> b!640901 (= e!366912 e!366910)))

(declare-fun b!640902 () Bool)

(assert (=> b!640902 (= e!366911 Undefined!6835)))

(declare-fun b!640903 () Bool)

(assert (=> b!640903 (= e!366910 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!640904 () Bool)

(assert (=> b!640904 (= e!366910 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!296489 lt!296481 mask!3053))))

(declare-fun b!640905 () Bool)

(assert (=> b!640905 (= e!366912 (Found!6835 index!984))))

(assert (= (and d!90307 c!73220) b!640902))

(assert (= (and d!90307 (not c!73220)) b!640900))

(assert (= (and b!640900 c!73218) b!640905))

(assert (= (and b!640900 (not c!73218)) b!640901))

(assert (= (and b!640901 c!73219) b!640903))

(assert (= (and b!640901 (not c!73219)) b!640904))

(declare-fun m!614257 () Bool)

(assert (=> d!90307 m!614257))

(declare-fun m!614259 () Bool)

(assert (=> d!90307 m!614259))

(declare-fun m!614261 () Bool)

(assert (=> d!90307 m!614261))

(assert (=> d!90307 m!614055))

(assert (=> b!640904 m!614035))

(assert (=> b!640904 m!614035))

(declare-fun m!614263 () Bool)

(assert (=> b!640904 m!614263))

(assert (=> b!640651 d!90307))

(declare-fun d!90309 () Bool)

(declare-fun lt!296605 () SeekEntryResult!6835)

(assert (=> d!90309 (and (or ((_ is Undefined!6835) lt!296605) (not ((_ is Found!6835) lt!296605)) (and (bvsge (index!29661 lt!296605) #b00000000000000000000000000000000) (bvslt (index!29661 lt!296605) (size!18763 lt!296481)))) (or ((_ is Undefined!6835) lt!296605) ((_ is Found!6835) lt!296605) (not ((_ is MissingVacant!6835) lt!296605)) (not (= (index!29663 lt!296605) vacantSpotIndex!68)) (and (bvsge (index!29663 lt!296605) #b00000000000000000000000000000000) (bvslt (index!29663 lt!296605) (size!18763 lt!296481)))) (or ((_ is Undefined!6835) lt!296605) (ite ((_ is Found!6835) lt!296605) (= (select (arr!18398 lt!296481) (index!29661 lt!296605)) lt!296489) (and ((_ is MissingVacant!6835) lt!296605) (= (index!29663 lt!296605) vacantSpotIndex!68) (= (select (arr!18398 lt!296481) (index!29663 lt!296605)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!366916 () SeekEntryResult!6835)

(assert (=> d!90309 (= lt!296605 e!366916)))

(declare-fun c!73223 () Bool)

(assert (=> d!90309 (= c!73223 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!296606 () (_ BitVec 64))

(assert (=> d!90309 (= lt!296606 (select (arr!18398 lt!296481) lt!296484))))

(assert (=> d!90309 (validMask!0 mask!3053)))

(assert (=> d!90309 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296484 vacantSpotIndex!68 lt!296489 lt!296481 mask!3053) lt!296605)))

(declare-fun b!640908 () Bool)

(declare-fun e!366917 () SeekEntryResult!6835)

(assert (=> b!640908 (= e!366916 e!366917)))

(declare-fun c!73221 () Bool)

(assert (=> b!640908 (= c!73221 (= lt!296606 lt!296489))))

(declare-fun b!640909 () Bool)

(declare-fun c!73222 () Bool)

(assert (=> b!640909 (= c!73222 (= lt!296606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366915 () SeekEntryResult!6835)

(assert (=> b!640909 (= e!366917 e!366915)))

(declare-fun b!640910 () Bool)

(assert (=> b!640910 (= e!366916 Undefined!6835)))

(declare-fun b!640911 () Bool)

(assert (=> b!640911 (= e!366915 (MissingVacant!6835 vacantSpotIndex!68))))

(declare-fun b!640912 () Bool)

(assert (=> b!640912 (= e!366915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296484 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296489 lt!296481 mask!3053))))

(declare-fun b!640913 () Bool)

(assert (=> b!640913 (= e!366917 (Found!6835 lt!296484))))

(assert (= (and d!90309 c!73223) b!640910))

(assert (= (and d!90309 (not c!73223)) b!640908))

(assert (= (and b!640908 c!73221) b!640913))

(assert (= (and b!640908 (not c!73221)) b!640909))

(assert (= (and b!640909 c!73222) b!640911))

(assert (= (and b!640909 (not c!73222)) b!640912))

(declare-fun m!614265 () Bool)

(assert (=> d!90309 m!614265))

(declare-fun m!614267 () Bool)

(assert (=> d!90309 m!614267))

(declare-fun m!614269 () Bool)

(assert (=> d!90309 m!614269))

(assert (=> d!90309 m!614055))

(assert (=> b!640912 m!614217))

(assert (=> b!640912 m!614217))

(declare-fun m!614271 () Bool)

(assert (=> b!640912 m!614271))

(assert (=> b!640651 d!90309))

(declare-fun d!90311 () Bool)

(declare-fun res!415202 () Bool)

(declare-fun e!366921 () Bool)

(assert (=> d!90311 (=> res!415202 e!366921)))

(assert (=> d!90311 (= res!415202 (= (select (arr!18398 lt!296481) index!984) (select (arr!18398 a!2986) j!136)))))

(assert (=> d!90311 (= (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) index!984) e!366921)))

(declare-fun b!640918 () Bool)

(declare-fun e!366922 () Bool)

(assert (=> b!640918 (= e!366921 e!366922)))

(declare-fun res!415203 () Bool)

(assert (=> b!640918 (=> (not res!415203) (not e!366922))))

(assert (=> b!640918 (= res!415203 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18763 lt!296481)))))

(declare-fun b!640919 () Bool)

(assert (=> b!640919 (= e!366922 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90311 (not res!415202)) b!640918))

(assert (= (and b!640918 res!415203) b!640919))

(assert (=> d!90311 m!614261))

(assert (=> b!640919 m!614001))

(declare-fun m!614287 () Bool)

(assert (=> b!640919 m!614287))

(assert (=> b!640662 d!90311))

(declare-fun d!90315 () Bool)

(assert (=> d!90315 (arrayNoDuplicates!0 lt!296481 j!136 Nil!12475)))

(declare-fun lt!296613 () Unit!21668)

(declare-fun choose!39 (array!38358 (_ BitVec 32) (_ BitVec 32)) Unit!21668)

(assert (=> d!90315 (= lt!296613 (choose!39 lt!296481 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90315 (bvslt (size!18763 lt!296481) #b01111111111111111111111111111111)))

(assert (=> d!90315 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296481 #b00000000000000000000000000000000 j!136) lt!296613)))

(declare-fun bs!19165 () Bool)

(assert (= bs!19165 d!90315))

(assert (=> bs!19165 m!614005))

(declare-fun m!614297 () Bool)

(assert (=> bs!19165 m!614297))

(assert (=> b!640658 d!90315))

(declare-fun d!90321 () Bool)

(assert (=> d!90321 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296619 () Unit!21668)

(declare-fun choose!114 (array!38358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21668)

(assert (=> d!90321 (= lt!296619 (choose!114 lt!296481 (select (arr!18398 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90321 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90321 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296481 (select (arr!18398 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296619)))

(declare-fun bs!19167 () Bool)

(assert (= bs!19167 d!90321))

(assert (=> bs!19167 m!614001))

(assert (=> bs!19167 m!614007))

(assert (=> bs!19167 m!614001))

(declare-fun m!614301 () Bool)

(assert (=> bs!19167 m!614301))

(assert (=> b!640658 d!90321))

(declare-fun bm!33492 () Bool)

(declare-fun call!33495 () Bool)

(declare-fun c!73226 () Bool)

(assert (=> bm!33492 (= call!33495 (arrayNoDuplicates!0 lt!296481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73226 (Cons!12474 (select (arr!18398 lt!296481) #b00000000000000000000000000000000) Nil!12475) Nil!12475)))))

(declare-fun b!640926 () Bool)

(declare-fun e!366929 () Bool)

(assert (=> b!640926 (= e!366929 call!33495)))

(declare-fun b!640927 () Bool)

(declare-fun e!366931 () Bool)

(assert (=> b!640927 (= e!366931 (contains!3111 Nil!12475 (select (arr!18398 lt!296481) #b00000000000000000000000000000000)))))

(declare-fun b!640928 () Bool)

(declare-fun e!366930 () Bool)

(assert (=> b!640928 (= e!366930 e!366929)))

(assert (=> b!640928 (= c!73226 (validKeyInArray!0 (select (arr!18398 lt!296481) #b00000000000000000000000000000000)))))

(declare-fun b!640929 () Bool)

(assert (=> b!640929 (= e!366929 call!33495)))

(declare-fun b!640930 () Bool)

(declare-fun e!366928 () Bool)

(assert (=> b!640930 (= e!366928 e!366930)))

(declare-fun res!415209 () Bool)

(assert (=> b!640930 (=> (not res!415209) (not e!366930))))

(assert (=> b!640930 (= res!415209 (not e!366931))))

(declare-fun res!415210 () Bool)

(assert (=> b!640930 (=> (not res!415210) (not e!366931))))

(assert (=> b!640930 (= res!415210 (validKeyInArray!0 (select (arr!18398 lt!296481) #b00000000000000000000000000000000)))))

(declare-fun d!90325 () Bool)

(declare-fun res!415208 () Bool)

(assert (=> d!90325 (=> res!415208 e!366928)))

(assert (=> d!90325 (= res!415208 (bvsge #b00000000000000000000000000000000 (size!18763 lt!296481)))))

(assert (=> d!90325 (= (arrayNoDuplicates!0 lt!296481 #b00000000000000000000000000000000 Nil!12475) e!366928)))

(assert (= (and d!90325 (not res!415208)) b!640930))

(assert (= (and b!640930 res!415210) b!640927))

(assert (= (and b!640930 res!415209) b!640928))

(assert (= (and b!640928 c!73226) b!640929))

(assert (= (and b!640928 (not c!73226)) b!640926))

(assert (= (or b!640929 b!640926) bm!33492))

(declare-fun m!614303 () Bool)

(assert (=> bm!33492 m!614303))

(declare-fun m!614305 () Bool)

(assert (=> bm!33492 m!614305))

(assert (=> b!640927 m!614303))

(assert (=> b!640927 m!614303))

(declare-fun m!614307 () Bool)

(assert (=> b!640927 m!614307))

(assert (=> b!640928 m!614303))

(assert (=> b!640928 m!614303))

(declare-fun m!614309 () Bool)

(assert (=> b!640928 m!614309))

(assert (=> b!640930 m!614303))

(assert (=> b!640930 m!614303))

(assert (=> b!640930 m!614309))

(assert (=> b!640658 d!90325))

(declare-fun d!90327 () Bool)

(declare-fun e!366934 () Bool)

(assert (=> d!90327 e!366934))

(declare-fun res!415213 () Bool)

(assert (=> d!90327 (=> (not res!415213) (not e!366934))))

(assert (=> d!90327 (= res!415213 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986))))))

(declare-fun lt!296625 () Unit!21668)

(declare-fun choose!41 (array!38358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12478) Unit!21668)

(assert (=> d!90327 (= lt!296625 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12475))))

(assert (=> d!90327 (bvslt (size!18763 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90327 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12475) lt!296625)))

(declare-fun b!640933 () Bool)

(assert (=> b!640933 (= e!366934 (arrayNoDuplicates!0 (array!38359 (store (arr!18398 a!2986) i!1108 k0!1786) (size!18763 a!2986)) #b00000000000000000000000000000000 Nil!12475))))

(assert (= (and d!90327 res!415213) b!640933))

(declare-fun m!614313 () Bool)

(assert (=> d!90327 m!614313))

(assert (=> b!640933 m!614021))

(declare-fun m!614315 () Bool)

(assert (=> b!640933 m!614315))

(assert (=> b!640658 d!90327))

(declare-fun c!73227 () Bool)

(declare-fun bm!33493 () Bool)

(declare-fun call!33496 () Bool)

(assert (=> bm!33493 (= call!33496 (arrayNoDuplicates!0 lt!296481 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73227 (Cons!12474 (select (arr!18398 lt!296481) j!136) Nil!12475) Nil!12475)))))

(declare-fun b!640934 () Bool)

(declare-fun e!366936 () Bool)

(assert (=> b!640934 (= e!366936 call!33496)))

(declare-fun b!640935 () Bool)

(declare-fun e!366938 () Bool)

(assert (=> b!640935 (= e!366938 (contains!3111 Nil!12475 (select (arr!18398 lt!296481) j!136)))))

(declare-fun b!640936 () Bool)

(declare-fun e!366937 () Bool)

(assert (=> b!640936 (= e!366937 e!366936)))

(assert (=> b!640936 (= c!73227 (validKeyInArray!0 (select (arr!18398 lt!296481) j!136)))))

(declare-fun b!640937 () Bool)

(assert (=> b!640937 (= e!366936 call!33496)))

(declare-fun b!640938 () Bool)

(declare-fun e!366935 () Bool)

(assert (=> b!640938 (= e!366935 e!366937)))

(declare-fun res!415215 () Bool)

(assert (=> b!640938 (=> (not res!415215) (not e!366937))))

(assert (=> b!640938 (= res!415215 (not e!366938))))

(declare-fun res!415216 () Bool)

(assert (=> b!640938 (=> (not res!415216) (not e!366938))))

(assert (=> b!640938 (= res!415216 (validKeyInArray!0 (select (arr!18398 lt!296481) j!136)))))

(declare-fun d!90331 () Bool)

(declare-fun res!415214 () Bool)

(assert (=> d!90331 (=> res!415214 e!366935)))

(assert (=> d!90331 (= res!415214 (bvsge j!136 (size!18763 lt!296481)))))

(assert (=> d!90331 (= (arrayNoDuplicates!0 lt!296481 j!136 Nil!12475) e!366935)))

(assert (= (and d!90331 (not res!415214)) b!640938))

(assert (= (and b!640938 res!415216) b!640935))

(assert (= (and b!640938 res!415215) b!640936))

(assert (= (and b!640936 c!73227) b!640937))

(assert (= (and b!640936 (not c!73227)) b!640934))

(assert (= (or b!640937 b!640934) bm!33493))

(assert (=> bm!33493 m!614193))

(declare-fun m!614317 () Bool)

(assert (=> bm!33493 m!614317))

(assert (=> b!640935 m!614193))

(assert (=> b!640935 m!614193))

(declare-fun m!614319 () Bool)

(assert (=> b!640935 m!614319))

(assert (=> b!640936 m!614193))

(assert (=> b!640936 m!614193))

(declare-fun m!614321 () Bool)

(assert (=> b!640936 m!614321))

(assert (=> b!640938 m!614193))

(assert (=> b!640938 m!614193))

(assert (=> b!640938 m!614321))

(assert (=> b!640658 d!90331))

(declare-fun d!90333 () Bool)

(declare-fun res!415217 () Bool)

(declare-fun e!366945 () Bool)

(assert (=> d!90333 (=> res!415217 e!366945)))

(assert (=> d!90333 (= res!415217 (= (select (arr!18398 lt!296481) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18398 a!2986) j!136)))))

(assert (=> d!90333 (= (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!366945)))

(declare-fun b!640951 () Bool)

(declare-fun e!366946 () Bool)

(assert (=> b!640951 (= e!366945 e!366946)))

(declare-fun res!415218 () Bool)

(assert (=> b!640951 (=> (not res!415218) (not e!366946))))

(assert (=> b!640951 (= res!415218 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18763 lt!296481)))))

(declare-fun b!640952 () Bool)

(assert (=> b!640952 (= e!366946 (arrayContainsKey!0 lt!296481 (select (arr!18398 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90333 (not res!415217)) b!640951))

(assert (= (and b!640951 res!415218) b!640952))

(declare-fun m!614323 () Bool)

(assert (=> d!90333 m!614323))

(assert (=> b!640952 m!614001))

(declare-fun m!614325 () Bool)

(assert (=> b!640952 m!614325))

(assert (=> b!640658 d!90333))

(declare-fun b!641012 () Bool)

(declare-fun e!366984 () SeekEntryResult!6835)

(declare-fun lt!296660 () SeekEntryResult!6835)

(assert (=> b!641012 (= e!366984 (Found!6835 (index!29662 lt!296660)))))

(declare-fun b!641013 () Bool)

(declare-fun e!366982 () SeekEntryResult!6835)

(assert (=> b!641013 (= e!366982 (MissingZero!6835 (index!29662 lt!296660)))))

(declare-fun b!641014 () Bool)

(assert (=> b!641014 (= e!366982 (seekKeyOrZeroReturnVacant!0 (x!58426 lt!296660) (index!29662 lt!296660) (index!29662 lt!296660) k0!1786 a!2986 mask!3053))))

(declare-fun b!641015 () Bool)

(declare-fun e!366983 () SeekEntryResult!6835)

(assert (=> b!641015 (= e!366983 Undefined!6835)))

(declare-fun d!90335 () Bool)

(declare-fun lt!296659 () SeekEntryResult!6835)

(assert (=> d!90335 (and (or ((_ is Undefined!6835) lt!296659) (not ((_ is Found!6835) lt!296659)) (and (bvsge (index!29661 lt!296659) #b00000000000000000000000000000000) (bvslt (index!29661 lt!296659) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296659) ((_ is Found!6835) lt!296659) (not ((_ is MissingZero!6835) lt!296659)) (and (bvsge (index!29660 lt!296659) #b00000000000000000000000000000000) (bvslt (index!29660 lt!296659) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296659) ((_ is Found!6835) lt!296659) ((_ is MissingZero!6835) lt!296659) (not ((_ is MissingVacant!6835) lt!296659)) (and (bvsge (index!29663 lt!296659) #b00000000000000000000000000000000) (bvslt (index!29663 lt!296659) (size!18763 a!2986)))) (or ((_ is Undefined!6835) lt!296659) (ite ((_ is Found!6835) lt!296659) (= (select (arr!18398 a!2986) (index!29661 lt!296659)) k0!1786) (ite ((_ is MissingZero!6835) lt!296659) (= (select (arr!18398 a!2986) (index!29660 lt!296659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6835) lt!296659) (= (select (arr!18398 a!2986) (index!29663 lt!296659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90335 (= lt!296659 e!366983)))

(declare-fun c!73259 () Bool)

(assert (=> d!90335 (= c!73259 (and ((_ is Intermediate!6835) lt!296660) (undefined!7647 lt!296660)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38358 (_ BitVec 32)) SeekEntryResult!6835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90335 (= lt!296660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90335 (validMask!0 mask!3053)))

(assert (=> d!90335 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!296659)))

(declare-fun b!641016 () Bool)

(assert (=> b!641016 (= e!366983 e!366984)))

(declare-fun lt!296658 () (_ BitVec 64))

(assert (=> b!641016 (= lt!296658 (select (arr!18398 a!2986) (index!29662 lt!296660)))))

(declare-fun c!73258 () Bool)

(assert (=> b!641016 (= c!73258 (= lt!296658 k0!1786))))

(declare-fun b!641017 () Bool)

(declare-fun c!73260 () Bool)

(assert (=> b!641017 (= c!73260 (= lt!296658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641017 (= e!366984 e!366982)))

(assert (= (and d!90335 c!73259) b!641015))

(assert (= (and d!90335 (not c!73259)) b!641016))

(assert (= (and b!641016 c!73258) b!641012))

(assert (= (and b!641016 (not c!73258)) b!641017))

(assert (= (and b!641017 c!73260) b!641013))

(assert (= (and b!641017 (not c!73260)) b!641014))

(declare-fun m!614371 () Bool)

(assert (=> b!641014 m!614371))

(declare-fun m!614373 () Bool)

(assert (=> d!90335 m!614373))

(declare-fun m!614375 () Bool)

(assert (=> d!90335 m!614375))

(assert (=> d!90335 m!614055))

(declare-fun m!614377 () Bool)

(assert (=> d!90335 m!614377))

(assert (=> d!90335 m!614373))

(declare-fun m!614379 () Bool)

(assert (=> d!90335 m!614379))

(declare-fun m!614381 () Bool)

(assert (=> d!90335 m!614381))

(declare-fun m!614383 () Bool)

(assert (=> b!641016 m!614383))

(assert (=> b!640665 d!90335))

(declare-fun d!90353 () Bool)

(assert (=> d!90353 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57920 d!90353))

(declare-fun d!90367 () Bool)

(assert (=> d!90367 (= (array_inv!14281 a!2986) (bvsge (size!18763 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57920 d!90367))

(declare-fun d!90371 () Bool)

(declare-fun res!415240 () Bool)

(declare-fun e!367000 () Bool)

(assert (=> d!90371 (=> res!415240 e!367000)))

(assert (=> d!90371 (= res!415240 (= (select (arr!18398 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90371 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!367000)))

(declare-fun b!641038 () Bool)

(declare-fun e!367001 () Bool)

(assert (=> b!641038 (= e!367000 e!367001)))

(declare-fun res!415241 () Bool)

(assert (=> b!641038 (=> (not res!415241) (not e!367001))))

(assert (=> b!641038 (= res!415241 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18763 a!2986)))))

(declare-fun b!641039 () Bool)

(assert (=> b!641039 (= e!367001 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90371 (not res!415240)) b!641038))

(assert (= (and b!641038 res!415241) b!641039))

(assert (=> d!90371 m!614185))

(declare-fun m!614401 () Bool)

(assert (=> b!641039 m!614401))

(assert (=> b!640666 d!90371))

(declare-fun bm!33503 () Bool)

(declare-fun call!33506 () Bool)

(assert (=> bm!33503 (= call!33506 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!641067 () Bool)

(declare-fun e!367024 () Bool)

(assert (=> b!641067 (= e!367024 call!33506)))

(declare-fun b!641068 () Bool)

(declare-fun e!367026 () Bool)

(assert (=> b!641068 (= e!367024 e!367026)))

(declare-fun lt!296680 () (_ BitVec 64))

(assert (=> b!641068 (= lt!296680 (select (arr!18398 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296682 () Unit!21668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38358 (_ BitVec 64) (_ BitVec 32)) Unit!21668)

(assert (=> b!641068 (= lt!296682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296680 #b00000000000000000000000000000000))))

(assert (=> b!641068 (arrayContainsKey!0 a!2986 lt!296680 #b00000000000000000000000000000000)))

(declare-fun lt!296681 () Unit!21668)

(assert (=> b!641068 (= lt!296681 lt!296682)))

(declare-fun res!415260 () Bool)

(assert (=> b!641068 (= res!415260 (= (seekEntryOrOpen!0 (select (arr!18398 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6835 #b00000000000000000000000000000000)))))

(assert (=> b!641068 (=> (not res!415260) (not e!367026))))

(declare-fun b!641069 () Bool)

(assert (=> b!641069 (= e!367026 call!33506)))

(declare-fun d!90373 () Bool)

(declare-fun res!415261 () Bool)

(declare-fun e!367025 () Bool)

(assert (=> d!90373 (=> res!415261 e!367025)))

(assert (=> d!90373 (= res!415261 (bvsge #b00000000000000000000000000000000 (size!18763 a!2986)))))

(assert (=> d!90373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367025)))

(declare-fun b!641066 () Bool)

(assert (=> b!641066 (= e!367025 e!367024)))

(declare-fun c!73270 () Bool)

(assert (=> b!641066 (= c!73270 (validKeyInArray!0 (select (arr!18398 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90373 (not res!415261)) b!641066))

(assert (= (and b!641066 c!73270) b!641068))

(assert (= (and b!641066 (not c!73270)) b!641067))

(assert (= (and b!641068 res!415260) b!641069))

(assert (= (or b!641069 b!641067) bm!33503))

(declare-fun m!614423 () Bool)

(assert (=> bm!33503 m!614423))

(assert (=> b!641068 m!614185))

(declare-fun m!614425 () Bool)

(assert (=> b!641068 m!614425))

(declare-fun m!614427 () Bool)

(assert (=> b!641068 m!614427))

(assert (=> b!641068 m!614185))

(declare-fun m!614429 () Bool)

(assert (=> b!641068 m!614429))

(assert (=> b!641066 m!614185))

(assert (=> b!641066 m!614185))

(assert (=> b!641066 m!614191))

(assert (=> b!640667 d!90373))

(check-sat (not b!640930) (not d!90327) (not d!90279) (not b!640952) (not d!90291) (not b!640846) (not b!640840) (not b!640809) (not b!640936) (not bm!33503) (not b!640912) (not b!640807) (not d!90307) (not b!640793) (not b!640938) (not b!640806) (not b!640815) (not d!90289) (not b!640794) (not b!640927) (not b!640935) (not b!640928) (not bm!33492) (not d!90321) (not bm!33484) (not b!640904) (not b!640919) (not b!640899) (not bm!33493) (not b!641039) (not d!90335) (not b!641068) (not b!640933) (not d!90287) (not d!90315) (not b!641066) (not b!641014) (not d!90309))
(check-sat)
