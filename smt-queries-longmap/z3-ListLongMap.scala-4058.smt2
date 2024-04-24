; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55626 () Bool)

(assert start!55626)

(declare-fun b!608720 () Bool)

(declare-fun e!348628 () Bool)

(declare-datatypes ((SeekEntryResult!6295 0))(
  ( (MissingZero!6295 (index!27455 (_ BitVec 32))) (Found!6295 (index!27456 (_ BitVec 32))) (Intermediate!6295 (undefined!7107 Bool) (index!27457 (_ BitVec 32)) (x!56415 (_ BitVec 32))) (Undefined!6295) (MissingVacant!6295 (index!27458 (_ BitVec 32))) )
))
(declare-fun lt!278108 () SeekEntryResult!6295)

(declare-fun lt!278114 () SeekEntryResult!6295)

(assert (=> b!608720 (= e!348628 (= lt!278108 lt!278114))))

(declare-fun b!608721 () Bool)

(declare-fun e!348622 () Bool)

(declare-fun e!348630 () Bool)

(assert (=> b!608721 (= e!348622 e!348630)))

(declare-fun res!391287 () Bool)

(assert (=> b!608721 (=> res!391287 e!348630)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!608721 (= res!391287 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19423 0))(
  ( (Unit!19424) )
))
(declare-fun lt!278111 () Unit!19423)

(declare-fun e!348616 () Unit!19423)

(assert (=> b!608721 (= lt!278111 e!348616)))

(declare-fun c!69092 () Bool)

(assert (=> b!608721 (= c!69092 (bvslt j!136 index!984))))

(declare-fun b!608722 () Bool)

(declare-fun e!348623 () Bool)

(declare-fun e!348629 () Bool)

(assert (=> b!608722 (= e!348623 e!348629)))

(declare-fun res!391297 () Bool)

(assert (=> b!608722 (=> (not res!391297) (not e!348629))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37302 0))(
  ( (array!37303 (arr!17899 (Array (_ BitVec 32) (_ BitVec 64))) (size!18263 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37302)

(assert (=> b!608722 (= res!391297 (= (select (store (arr!17899 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!278100 () array!37302)

(assert (=> b!608722 (= lt!278100 (array!37303 (store (arr!17899 a!2986) i!1108 k0!1786) (size!18263 a!2986)))))

(declare-fun b!608723 () Bool)

(declare-fun res!391296 () Bool)

(declare-fun e!348617 () Bool)

(assert (=> b!608723 (=> (not res!391296) (not e!348617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608723 (= res!391296 (validKeyInArray!0 k0!1786))))

(declare-fun b!608724 () Bool)

(declare-fun e!348619 () Unit!19423)

(declare-fun Unit!19425 () Unit!19423)

(assert (=> b!608724 (= e!348619 Unit!19425)))

(assert (=> b!608724 false))

(declare-fun b!608725 () Bool)

(declare-fun e!348621 () Bool)

(declare-fun e!348624 () Bool)

(assert (=> b!608725 (= e!348621 e!348624)))

(declare-fun res!391275 () Bool)

(assert (=> b!608725 (=> res!391275 e!348624)))

(declare-fun lt!278104 () (_ BitVec 64))

(declare-fun lt!278106 () (_ BitVec 64))

(assert (=> b!608725 (= res!391275 (or (not (= (select (arr!17899 a!2986) j!136) lt!278106)) (not (= (select (arr!17899 a!2986) j!136) lt!278104)) (bvsge j!136 index!984)))))

(declare-fun b!608726 () Bool)

(declare-fun e!348615 () Bool)

(declare-fun arrayContainsKey!0 (array!37302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608726 (= e!348615 (arrayContainsKey!0 lt!278100 (select (arr!17899 a!2986) j!136) index!984))))

(declare-fun b!608727 () Bool)

(declare-fun res!391292 () Bool)

(declare-fun e!348626 () Bool)

(assert (=> b!608727 (=> res!391292 e!348626)))

(declare-datatypes ((List!11847 0))(
  ( (Nil!11844) (Cons!11843 (h!12891 (_ BitVec 64)) (t!18067 List!11847)) )
))
(declare-fun noDuplicate!331 (List!11847) Bool)

(assert (=> b!608727 (= res!391292 (not (noDuplicate!331 Nil!11844)))))

(declare-fun b!608728 () Bool)

(declare-fun res!391288 () Bool)

(assert (=> b!608728 (=> (not res!391288) (not e!348617))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!608728 (= res!391288 (and (= (size!18263 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18263 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18263 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608729 () Bool)

(declare-fun res!391276 () Bool)

(assert (=> b!608729 (=> (not res!391276) (not e!348617))))

(assert (=> b!608729 (= res!391276 (validKeyInArray!0 (select (arr!17899 a!2986) j!136)))))

(declare-fun b!608730 () Bool)

(declare-fun Unit!19426 () Unit!19423)

(assert (=> b!608730 (= e!348616 Unit!19426)))

(declare-fun lt!278113 () Unit!19423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19423)

(assert (=> b!608730 (= lt!278113 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278100 (select (arr!17899 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608730 (arrayContainsKey!0 lt!278100 (select (arr!17899 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278107 () Unit!19423)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11847) Unit!19423)

(assert (=> b!608730 (= lt!278107 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11844))))

(declare-fun arrayNoDuplicates!0 (array!37302 (_ BitVec 32) List!11847) Bool)

(assert (=> b!608730 (arrayNoDuplicates!0 lt!278100 #b00000000000000000000000000000000 Nil!11844)))

(declare-fun lt!278101 () Unit!19423)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37302 (_ BitVec 32) (_ BitVec 32)) Unit!19423)

(assert (=> b!608730 (= lt!278101 (lemmaNoDuplicateFromThenFromBigger!0 lt!278100 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608730 (arrayNoDuplicates!0 lt!278100 j!136 Nil!11844)))

(declare-fun lt!278103 () Unit!19423)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37302 (_ BitVec 64) (_ BitVec 32) List!11847) Unit!19423)

(assert (=> b!608730 (= lt!278103 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278100 (select (arr!17899 a!2986) j!136) j!136 Nil!11844))))

(assert (=> b!608730 false))

(declare-fun res!391277 () Bool)

(assert (=> start!55626 (=> (not res!391277) (not e!348617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55626 (= res!391277 (validMask!0 mask!3053))))

(assert (=> start!55626 e!348617))

(assert (=> start!55626 true))

(declare-fun array_inv!13758 (array!37302) Bool)

(assert (=> start!55626 (array_inv!13758 a!2986)))

(declare-fun b!608731 () Bool)

(assert (=> b!608731 (= e!348617 e!348623)))

(declare-fun res!391285 () Bool)

(assert (=> b!608731 (=> (not res!391285) (not e!348623))))

(declare-fun lt!278110 () SeekEntryResult!6295)

(assert (=> b!608731 (= res!391285 (or (= lt!278110 (MissingZero!6295 i!1108)) (= lt!278110 (MissingVacant!6295 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37302 (_ BitVec 32)) SeekEntryResult!6295)

(assert (=> b!608731 (= lt!278110 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608732 () Bool)

(declare-fun Unit!19427 () Unit!19423)

(assert (=> b!608732 (= e!348616 Unit!19427)))

(declare-fun b!608733 () Bool)

(declare-fun res!391283 () Bool)

(assert (=> b!608733 (=> (not res!391283) (not e!348623))))

(assert (=> b!608733 (= res!391283 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11844))))

(declare-fun b!608734 () Bool)

(declare-fun res!391295 () Bool)

(assert (=> b!608734 (=> res!391295 e!348626)))

(declare-fun contains!2997 (List!11847 (_ BitVec 64)) Bool)

(assert (=> b!608734 (= res!391295 (contains!2997 Nil!11844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608735 () Bool)

(declare-fun e!348625 () Bool)

(assert (=> b!608735 (= e!348625 e!348622)))

(declare-fun res!391290 () Bool)

(assert (=> b!608735 (=> res!391290 e!348622)))

(assert (=> b!608735 (= res!391290 (or (not (= (select (arr!17899 a!2986) j!136) lt!278106)) (not (= (select (arr!17899 a!2986) j!136) lt!278104))))))

(assert (=> b!608735 e!348621))

(declare-fun res!391293 () Bool)

(assert (=> b!608735 (=> (not res!391293) (not e!348621))))

(assert (=> b!608735 (= res!391293 (= lt!278104 (select (arr!17899 a!2986) j!136)))))

(assert (=> b!608735 (= lt!278104 (select (store (arr!17899 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608736 () Bool)

(declare-fun res!391280 () Bool)

(assert (=> b!608736 (=> (not res!391280) (not e!348623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37302 (_ BitVec 32)) Bool)

(assert (=> b!608736 (= res!391280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608737 () Bool)

(assert (=> b!608737 (= e!348626 true)))

(declare-fun lt!278102 () Bool)

(assert (=> b!608737 (= lt!278102 (contains!2997 Nil!11844 k0!1786))))

(declare-fun b!608738 () Bool)

(declare-fun res!391281 () Bool)

(assert (=> b!608738 (=> (not res!391281) (not e!348617))))

(assert (=> b!608738 (= res!391281 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608739 () Bool)

(declare-fun e!348627 () Bool)

(assert (=> b!608739 (= e!348629 e!348627)))

(declare-fun res!391291 () Bool)

(assert (=> b!608739 (=> (not res!391291) (not e!348627))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608739 (= res!391291 (and (= lt!278108 (Found!6295 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17899 a!2986) index!984) (select (arr!17899 a!2986) j!136))) (not (= (select (arr!17899 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37302 (_ BitVec 32)) SeekEntryResult!6295)

(assert (=> b!608739 (= lt!278108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17899 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608740 () Bool)

(assert (=> b!608740 (= e!348627 (not e!348625))))

(declare-fun res!391294 () Bool)

(assert (=> b!608740 (=> res!391294 e!348625)))

(declare-fun lt!278109 () SeekEntryResult!6295)

(assert (=> b!608740 (= res!391294 (not (= lt!278109 (Found!6295 index!984))))))

(declare-fun lt!278116 () Unit!19423)

(assert (=> b!608740 (= lt!278116 e!348619)))

(declare-fun c!69091 () Bool)

(assert (=> b!608740 (= c!69091 (= lt!278109 Undefined!6295))))

(assert (=> b!608740 (= lt!278109 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278106 lt!278100 mask!3053))))

(assert (=> b!608740 e!348628))

(declare-fun res!391279 () Bool)

(assert (=> b!608740 (=> (not res!391279) (not e!348628))))

(declare-fun lt!278115 () (_ BitVec 32))

(assert (=> b!608740 (= res!391279 (= lt!278114 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278115 vacantSpotIndex!68 lt!278106 lt!278100 mask!3053)))))

(assert (=> b!608740 (= lt!278114 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278115 vacantSpotIndex!68 (select (arr!17899 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608740 (= lt!278106 (select (store (arr!17899 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278112 () Unit!19423)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37302 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19423)

(assert (=> b!608740 (= lt!278112 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278115 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608740 (= lt!278115 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!608741 () Bool)

(declare-fun res!391282 () Bool)

(assert (=> b!608741 (=> (not res!391282) (not e!348623))))

(assert (=> b!608741 (= res!391282 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17899 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608742 () Bool)

(assert (=> b!608742 (= e!348630 e!348626)))

(declare-fun res!391284 () Bool)

(assert (=> b!608742 (=> res!391284 e!348626)))

(assert (=> b!608742 (= res!391284 (or (bvsge (size!18263 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18263 a!2986))))))

(assert (=> b!608742 (arrayContainsKey!0 lt!278100 (select (arr!17899 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278105 () Unit!19423)

(assert (=> b!608742 (= lt!278105 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278100 (select (arr!17899 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348618 () Bool)

(assert (=> b!608742 e!348618))

(declare-fun res!391278 () Bool)

(assert (=> b!608742 (=> (not res!391278) (not e!348618))))

(assert (=> b!608742 (= res!391278 (arrayContainsKey!0 lt!278100 (select (arr!17899 a!2986) j!136) j!136))))

(declare-fun b!608743 () Bool)

(assert (=> b!608743 (= e!348618 (arrayContainsKey!0 lt!278100 (select (arr!17899 a!2986) j!136) index!984))))

(declare-fun b!608744 () Bool)

(assert (=> b!608744 (= e!348624 e!348615)))

(declare-fun res!391286 () Bool)

(assert (=> b!608744 (=> (not res!391286) (not e!348615))))

(assert (=> b!608744 (= res!391286 (arrayContainsKey!0 lt!278100 (select (arr!17899 a!2986) j!136) j!136))))

(declare-fun b!608745 () Bool)

(declare-fun res!391289 () Bool)

(assert (=> b!608745 (=> res!391289 e!348626)))

(assert (=> b!608745 (= res!391289 (contains!2997 Nil!11844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608746 () Bool)

(declare-fun Unit!19428 () Unit!19423)

(assert (=> b!608746 (= e!348619 Unit!19428)))

(assert (= (and start!55626 res!391277) b!608728))

(assert (= (and b!608728 res!391288) b!608729))

(assert (= (and b!608729 res!391276) b!608723))

(assert (= (and b!608723 res!391296) b!608738))

(assert (= (and b!608738 res!391281) b!608731))

(assert (= (and b!608731 res!391285) b!608736))

(assert (= (and b!608736 res!391280) b!608733))

(assert (= (and b!608733 res!391283) b!608741))

(assert (= (and b!608741 res!391282) b!608722))

(assert (= (and b!608722 res!391297) b!608739))

(assert (= (and b!608739 res!391291) b!608740))

(assert (= (and b!608740 res!391279) b!608720))

(assert (= (and b!608740 c!69091) b!608724))

(assert (= (and b!608740 (not c!69091)) b!608746))

(assert (= (and b!608740 (not res!391294)) b!608735))

(assert (= (and b!608735 res!391293) b!608725))

(assert (= (and b!608725 (not res!391275)) b!608744))

(assert (= (and b!608744 res!391286) b!608726))

(assert (= (and b!608735 (not res!391290)) b!608721))

(assert (= (and b!608721 c!69092) b!608730))

(assert (= (and b!608721 (not c!69092)) b!608732))

(assert (= (and b!608721 (not res!391287)) b!608742))

(assert (= (and b!608742 res!391278) b!608743))

(assert (= (and b!608742 (not res!391284)) b!608727))

(assert (= (and b!608727 (not res!391292)) b!608734))

(assert (= (and b!608734 (not res!391295)) b!608745))

(assert (= (and b!608745 (not res!391289)) b!608737))

(declare-fun m!585599 () Bool)

(assert (=> b!608739 m!585599))

(declare-fun m!585601 () Bool)

(assert (=> b!608739 m!585601))

(assert (=> b!608739 m!585601))

(declare-fun m!585603 () Bool)

(assert (=> b!608739 m!585603))

(declare-fun m!585605 () Bool)

(assert (=> b!608731 m!585605))

(assert (=> b!608743 m!585601))

(assert (=> b!608743 m!585601))

(declare-fun m!585607 () Bool)

(assert (=> b!608743 m!585607))

(declare-fun m!585609 () Bool)

(assert (=> b!608733 m!585609))

(assert (=> b!608729 m!585601))

(assert (=> b!608729 m!585601))

(declare-fun m!585611 () Bool)

(assert (=> b!608729 m!585611))

(assert (=> b!608744 m!585601))

(assert (=> b!608744 m!585601))

(declare-fun m!585613 () Bool)

(assert (=> b!608744 m!585613))

(declare-fun m!585615 () Bool)

(assert (=> b!608737 m!585615))

(declare-fun m!585617 () Bool)

(assert (=> b!608736 m!585617))

(declare-fun m!585619 () Bool)

(assert (=> b!608722 m!585619))

(declare-fun m!585621 () Bool)

(assert (=> b!608722 m!585621))

(declare-fun m!585623 () Bool)

(assert (=> b!608723 m!585623))

(assert (=> b!608742 m!585601))

(assert (=> b!608742 m!585601))

(declare-fun m!585625 () Bool)

(assert (=> b!608742 m!585625))

(assert (=> b!608742 m!585601))

(declare-fun m!585627 () Bool)

(assert (=> b!608742 m!585627))

(assert (=> b!608742 m!585601))

(assert (=> b!608742 m!585613))

(declare-fun m!585629 () Bool)

(assert (=> b!608727 m!585629))

(assert (=> b!608725 m!585601))

(declare-fun m!585631 () Bool)

(assert (=> b!608741 m!585631))

(assert (=> b!608730 m!585601))

(declare-fun m!585633 () Bool)

(assert (=> b!608730 m!585633))

(assert (=> b!608730 m!585601))

(assert (=> b!608730 m!585601))

(declare-fun m!585635 () Bool)

(assert (=> b!608730 m!585635))

(assert (=> b!608730 m!585601))

(declare-fun m!585637 () Bool)

(assert (=> b!608730 m!585637))

(declare-fun m!585639 () Bool)

(assert (=> b!608730 m!585639))

(declare-fun m!585641 () Bool)

(assert (=> b!608730 m!585641))

(declare-fun m!585643 () Bool)

(assert (=> b!608730 m!585643))

(declare-fun m!585645 () Bool)

(assert (=> b!608730 m!585645))

(declare-fun m!585647 () Bool)

(assert (=> start!55626 m!585647))

(declare-fun m!585649 () Bool)

(assert (=> start!55626 m!585649))

(declare-fun m!585651 () Bool)

(assert (=> b!608734 m!585651))

(assert (=> b!608735 m!585601))

(assert (=> b!608735 m!585619))

(declare-fun m!585653 () Bool)

(assert (=> b!608735 m!585653))

(declare-fun m!585655 () Bool)

(assert (=> b!608745 m!585655))

(declare-fun m!585657 () Bool)

(assert (=> b!608738 m!585657))

(assert (=> b!608726 m!585601))

(assert (=> b!608726 m!585601))

(assert (=> b!608726 m!585607))

(declare-fun m!585659 () Bool)

(assert (=> b!608740 m!585659))

(declare-fun m!585661 () Bool)

(assert (=> b!608740 m!585661))

(assert (=> b!608740 m!585601))

(declare-fun m!585663 () Bool)

(assert (=> b!608740 m!585663))

(assert (=> b!608740 m!585619))

(declare-fun m!585665 () Bool)

(assert (=> b!608740 m!585665))

(declare-fun m!585667 () Bool)

(assert (=> b!608740 m!585667))

(assert (=> b!608740 m!585601))

(declare-fun m!585669 () Bool)

(assert (=> b!608740 m!585669))

(check-sat (not b!608726) (not b!608740) (not b!608742) (not b!608730) (not b!608727) (not b!608734) (not b!608744) (not b!608731) (not b!608743) (not b!608723) (not b!608739) (not b!608745) (not b!608736) (not b!608738) (not b!608733) (not b!608729) (not start!55626) (not b!608737))
(check-sat)
