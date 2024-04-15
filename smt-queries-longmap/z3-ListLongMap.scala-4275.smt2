; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59546 () Bool)

(assert start!59546)

(declare-fun b!657033 () Bool)

(declare-fun e!377406 () Bool)

(declare-fun e!377407 () Bool)

(assert (=> b!657033 (= e!377406 e!377407)))

(declare-fun res!426110 () Bool)

(assert (=> b!657033 (=> (not res!426110) (not e!377407))))

(declare-datatypes ((SeekEntryResult!6991 0))(
  ( (MissingZero!6991 (index!30329 (_ BitVec 32))) (Found!6991 (index!30330 (_ BitVec 32))) (Intermediate!6991 (undefined!7803 Bool) (index!30331 (_ BitVec 32)) (x!59133 (_ BitVec 32))) (Undefined!6991) (MissingVacant!6991 (index!30332 (_ BitVec 32))) )
))
(declare-fun lt!306721 () SeekEntryResult!6991)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!657033 (= res!426110 (or (= lt!306721 (MissingZero!6991 i!1108)) (= lt!306721 (MissingVacant!6991 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38715 0))(
  ( (array!38716 (arr!18554 (Array (_ BitVec 32) (_ BitVec 64))) (size!18919 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38715)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38715 (_ BitVec 32)) SeekEntryResult!6991)

(assert (=> b!657033 (= lt!306721 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657034 () Bool)

(declare-fun res!426111 () Bool)

(assert (=> b!657034 (=> (not res!426111) (not e!377407))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657034 (= res!426111 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18554 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657035 () Bool)

(declare-fun res!426116 () Bool)

(assert (=> b!657035 (=> (not res!426116) (not e!377406))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!657035 (= res!426116 (and (= (size!18919 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18919 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18919 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657036 () Bool)

(declare-fun res!426115 () Bool)

(assert (=> b!657036 (=> (not res!426115) (not e!377407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38715 (_ BitVec 32)) Bool)

(assert (=> b!657036 (= res!426115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657037 () Bool)

(declare-datatypes ((Unit!22682 0))(
  ( (Unit!22683) )
))
(declare-fun e!377412 () Unit!22682)

(declare-fun Unit!22684 () Unit!22682)

(assert (=> b!657037 (= e!377412 Unit!22684)))

(declare-fun res!426121 () Bool)

(assert (=> start!59546 (=> (not res!426121) (not e!377406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59546 (= res!426121 (validMask!0 mask!3053))))

(assert (=> start!59546 e!377406))

(assert (=> start!59546 true))

(declare-fun array_inv!14437 (array!38715) Bool)

(assert (=> start!59546 (array_inv!14437 a!2986)))

(declare-fun b!657038 () Bool)

(declare-fun e!377414 () Bool)

(assert (=> b!657038 (= e!377414 true)))

(assert (=> b!657038 (= (select (store (arr!18554 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657039 () Bool)

(declare-fun e!377413 () Unit!22682)

(declare-fun Unit!22685 () Unit!22682)

(assert (=> b!657039 (= e!377413 Unit!22685)))

(declare-fun b!657040 () Bool)

(declare-fun e!377411 () Bool)

(assert (=> b!657040 (= e!377411 (not e!377414))))

(declare-fun res!426113 () Bool)

(assert (=> b!657040 (=> res!426113 e!377414)))

(declare-fun lt!306723 () SeekEntryResult!6991)

(assert (=> b!657040 (= res!426113 (not (= lt!306723 (MissingVacant!6991 vacantSpotIndex!68))))))

(declare-fun lt!306722 () Unit!22682)

(assert (=> b!657040 (= lt!306722 e!377412)))

(declare-fun c!75831 () Bool)

(assert (=> b!657040 (= c!75831 (= lt!306723 (Found!6991 index!984)))))

(declare-fun lt!306713 () Unit!22682)

(assert (=> b!657040 (= lt!306713 e!377413)))

(declare-fun c!75832 () Bool)

(assert (=> b!657040 (= c!75832 (= lt!306723 Undefined!6991))))

(declare-fun lt!306719 () (_ BitVec 64))

(declare-fun lt!306720 () array!38715)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38715 (_ BitVec 32)) SeekEntryResult!6991)

(assert (=> b!657040 (= lt!306723 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306719 lt!306720 mask!3053))))

(declare-fun e!377408 () Bool)

(assert (=> b!657040 e!377408))

(declare-fun res!426120 () Bool)

(assert (=> b!657040 (=> (not res!426120) (not e!377408))))

(declare-fun lt!306732 () SeekEntryResult!6991)

(declare-fun lt!306724 () (_ BitVec 32))

(assert (=> b!657040 (= res!426120 (= lt!306732 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306724 vacantSpotIndex!68 lt!306719 lt!306720 mask!3053)))))

(assert (=> b!657040 (= lt!306732 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306724 vacantSpotIndex!68 (select (arr!18554 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657040 (= lt!306719 (select (store (arr!18554 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306731 () Unit!22682)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22682)

(assert (=> b!657040 (= lt!306731 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306724 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657040 (= lt!306724 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657041 () Bool)

(declare-fun e!377415 () Unit!22682)

(declare-fun Unit!22686 () Unit!22682)

(assert (=> b!657041 (= e!377415 Unit!22686)))

(declare-fun b!657042 () Bool)

(declare-fun e!377417 () Bool)

(assert (=> b!657042 (= e!377417 e!377411)))

(declare-fun res!426105 () Bool)

(assert (=> b!657042 (=> (not res!426105) (not e!377411))))

(declare-fun lt!306727 () SeekEntryResult!6991)

(assert (=> b!657042 (= res!426105 (and (= lt!306727 (Found!6991 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18554 a!2986) index!984) (select (arr!18554 a!2986) j!136))) (not (= (select (arr!18554 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657042 (= lt!306727 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18554 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657043 () Bool)

(declare-fun res!426118 () Bool)

(assert (=> b!657043 (=> (not res!426118) (not e!377406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657043 (= res!426118 (validKeyInArray!0 k0!1786))))

(declare-fun b!657044 () Bool)

(declare-fun Unit!22687 () Unit!22682)

(assert (=> b!657044 (= e!377413 Unit!22687)))

(assert (=> b!657044 false))

(declare-fun b!657045 () Bool)

(declare-fun res!426117 () Bool)

(assert (=> b!657045 (=> (not res!426117) (not e!377406))))

(declare-fun arrayContainsKey!0 (array!38715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657045 (= res!426117 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!426106 () Bool)

(declare-fun b!657046 () Bool)

(assert (=> b!657046 (= res!426106 (arrayContainsKey!0 lt!306720 (select (arr!18554 a!2986) j!136) j!136))))

(declare-fun e!377416 () Bool)

(assert (=> b!657046 (=> (not res!426106) (not e!377416))))

(declare-fun e!377409 () Bool)

(assert (=> b!657046 (= e!377409 e!377416)))

(declare-fun b!657047 () Bool)

(assert (=> b!657047 (= e!377416 (arrayContainsKey!0 lt!306720 (select (arr!18554 a!2986) j!136) index!984))))

(declare-fun b!657048 () Bool)

(declare-fun res!426109 () Bool)

(assert (=> b!657048 (= res!426109 (bvsge j!136 index!984))))

(assert (=> b!657048 (=> res!426109 e!377409)))

(declare-fun e!377405 () Bool)

(assert (=> b!657048 (= e!377405 e!377409)))

(declare-fun b!657049 () Bool)

(declare-fun Unit!22688 () Unit!22682)

(assert (=> b!657049 (= e!377412 Unit!22688)))

(declare-fun res!426112 () Bool)

(assert (=> b!657049 (= res!426112 (= (select (store (arr!18554 a!2986) i!1108 k0!1786) index!984) (select (arr!18554 a!2986) j!136)))))

(assert (=> b!657049 (=> (not res!426112) (not e!377405))))

(assert (=> b!657049 e!377405))

(declare-fun c!75834 () Bool)

(assert (=> b!657049 (= c!75834 (bvslt j!136 index!984))))

(declare-fun lt!306730 () Unit!22682)

(declare-fun e!377404 () Unit!22682)

(assert (=> b!657049 (= lt!306730 e!377404)))

(declare-fun c!75833 () Bool)

(assert (=> b!657049 (= c!75833 (bvslt index!984 j!136))))

(declare-fun lt!306729 () Unit!22682)

(assert (=> b!657049 (= lt!306729 e!377415)))

(assert (=> b!657049 false))

(declare-fun e!377410 () Bool)

(declare-fun b!657050 () Bool)

(assert (=> b!657050 (= e!377410 (arrayContainsKey!0 lt!306720 (select (arr!18554 a!2986) j!136) index!984))))

(declare-fun b!657051 () Bool)

(declare-fun Unit!22689 () Unit!22682)

(assert (=> b!657051 (= e!377404 Unit!22689)))

(declare-fun b!657052 () Bool)

(assert (=> b!657052 false))

(declare-fun lt!306725 () Unit!22682)

(declare-datatypes ((List!12634 0))(
  ( (Nil!12631) (Cons!12630 (h!13675 (_ BitVec 64)) (t!18853 List!12634)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38715 (_ BitVec 64) (_ BitVec 32) List!12634) Unit!22682)

(assert (=> b!657052 (= lt!306725 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306720 (select (arr!18554 a!2986) j!136) index!984 Nil!12631))))

(declare-fun arrayNoDuplicates!0 (array!38715 (_ BitVec 32) List!12634) Bool)

(assert (=> b!657052 (arrayNoDuplicates!0 lt!306720 index!984 Nil!12631)))

(declare-fun lt!306717 () Unit!22682)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38715 (_ BitVec 32) (_ BitVec 32)) Unit!22682)

(assert (=> b!657052 (= lt!306717 (lemmaNoDuplicateFromThenFromBigger!0 lt!306720 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657052 (arrayNoDuplicates!0 lt!306720 #b00000000000000000000000000000000 Nil!12631)))

(declare-fun lt!306714 () Unit!22682)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12634) Unit!22682)

(assert (=> b!657052 (= lt!306714 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12631))))

(assert (=> b!657052 (arrayContainsKey!0 lt!306720 (select (arr!18554 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306715 () Unit!22682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22682)

(assert (=> b!657052 (= lt!306715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306720 (select (arr!18554 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657052 e!377410))

(declare-fun res!426108 () Bool)

(assert (=> b!657052 (=> (not res!426108) (not e!377410))))

(assert (=> b!657052 (= res!426108 (arrayContainsKey!0 lt!306720 (select (arr!18554 a!2986) j!136) j!136))))

(declare-fun Unit!22690 () Unit!22682)

(assert (=> b!657052 (= e!377415 Unit!22690)))

(declare-fun b!657053 () Bool)

(declare-fun res!426119 () Bool)

(assert (=> b!657053 (=> (not res!426119) (not e!377406))))

(assert (=> b!657053 (= res!426119 (validKeyInArray!0 (select (arr!18554 a!2986) j!136)))))

(declare-fun b!657054 () Bool)

(assert (=> b!657054 (= e!377408 (= lt!306727 lt!306732))))

(declare-fun b!657055 () Bool)

(assert (=> b!657055 false))

(declare-fun lt!306716 () Unit!22682)

(assert (=> b!657055 (= lt!306716 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306720 (select (arr!18554 a!2986) j!136) j!136 Nil!12631))))

(assert (=> b!657055 (arrayNoDuplicates!0 lt!306720 j!136 Nil!12631)))

(declare-fun lt!306728 () Unit!22682)

(assert (=> b!657055 (= lt!306728 (lemmaNoDuplicateFromThenFromBigger!0 lt!306720 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657055 (arrayNoDuplicates!0 lt!306720 #b00000000000000000000000000000000 Nil!12631)))

(declare-fun lt!306726 () Unit!22682)

(assert (=> b!657055 (= lt!306726 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12631))))

(assert (=> b!657055 (arrayContainsKey!0 lt!306720 (select (arr!18554 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306718 () Unit!22682)

(assert (=> b!657055 (= lt!306718 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306720 (select (arr!18554 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22691 () Unit!22682)

(assert (=> b!657055 (= e!377404 Unit!22691)))

(declare-fun b!657056 () Bool)

(declare-fun res!426107 () Bool)

(assert (=> b!657056 (=> (not res!426107) (not e!377407))))

(assert (=> b!657056 (= res!426107 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12631))))

(declare-fun b!657057 () Bool)

(assert (=> b!657057 (= e!377407 e!377417)))

(declare-fun res!426114 () Bool)

(assert (=> b!657057 (=> (not res!426114) (not e!377417))))

(assert (=> b!657057 (= res!426114 (= (select (store (arr!18554 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657057 (= lt!306720 (array!38716 (store (arr!18554 a!2986) i!1108 k0!1786) (size!18919 a!2986)))))

(assert (= (and start!59546 res!426121) b!657035))

(assert (= (and b!657035 res!426116) b!657053))

(assert (= (and b!657053 res!426119) b!657043))

(assert (= (and b!657043 res!426118) b!657045))

(assert (= (and b!657045 res!426117) b!657033))

(assert (= (and b!657033 res!426110) b!657036))

(assert (= (and b!657036 res!426115) b!657056))

(assert (= (and b!657056 res!426107) b!657034))

(assert (= (and b!657034 res!426111) b!657057))

(assert (= (and b!657057 res!426114) b!657042))

(assert (= (and b!657042 res!426105) b!657040))

(assert (= (and b!657040 res!426120) b!657054))

(assert (= (and b!657040 c!75832) b!657044))

(assert (= (and b!657040 (not c!75832)) b!657039))

(assert (= (and b!657040 c!75831) b!657049))

(assert (= (and b!657040 (not c!75831)) b!657037))

(assert (= (and b!657049 res!426112) b!657048))

(assert (= (and b!657048 (not res!426109)) b!657046))

(assert (= (and b!657046 res!426106) b!657047))

(assert (= (and b!657049 c!75834) b!657055))

(assert (= (and b!657049 (not c!75834)) b!657051))

(assert (= (and b!657049 c!75833) b!657052))

(assert (= (and b!657049 (not c!75833)) b!657041))

(assert (= (and b!657052 res!426108) b!657050))

(assert (= (and b!657040 (not res!426113)) b!657038))

(declare-fun m!629595 () Bool)

(assert (=> b!657049 m!629595))

(declare-fun m!629597 () Bool)

(assert (=> b!657049 m!629597))

(declare-fun m!629599 () Bool)

(assert (=> b!657049 m!629599))

(declare-fun m!629601 () Bool)

(assert (=> b!657056 m!629601))

(assert (=> b!657046 m!629599))

(assert (=> b!657046 m!629599))

(declare-fun m!629603 () Bool)

(assert (=> b!657046 m!629603))

(assert (=> b!657057 m!629595))

(declare-fun m!629605 () Bool)

(assert (=> b!657057 m!629605))

(declare-fun m!629607 () Bool)

(assert (=> b!657045 m!629607))

(declare-fun m!629609 () Bool)

(assert (=> b!657042 m!629609))

(assert (=> b!657042 m!629599))

(assert (=> b!657042 m!629599))

(declare-fun m!629611 () Bool)

(assert (=> b!657042 m!629611))

(declare-fun m!629613 () Bool)

(assert (=> b!657033 m!629613))

(declare-fun m!629615 () Bool)

(assert (=> b!657040 m!629615))

(declare-fun m!629617 () Bool)

(assert (=> b!657040 m!629617))

(assert (=> b!657040 m!629599))

(assert (=> b!657040 m!629595))

(declare-fun m!629619 () Bool)

(assert (=> b!657040 m!629619))

(declare-fun m!629621 () Bool)

(assert (=> b!657040 m!629621))

(declare-fun m!629623 () Bool)

(assert (=> b!657040 m!629623))

(assert (=> b!657040 m!629599))

(declare-fun m!629625 () Bool)

(assert (=> b!657040 m!629625))

(assert (=> b!657038 m!629595))

(assert (=> b!657038 m!629597))

(declare-fun m!629627 () Bool)

(assert (=> b!657034 m!629627))

(declare-fun m!629629 () Bool)

(assert (=> b!657043 m!629629))

(declare-fun m!629631 () Bool)

(assert (=> b!657055 m!629631))

(assert (=> b!657055 m!629599))

(assert (=> b!657055 m!629599))

(declare-fun m!629633 () Bool)

(assert (=> b!657055 m!629633))

(declare-fun m!629635 () Bool)

(assert (=> b!657055 m!629635))

(assert (=> b!657055 m!629599))

(declare-fun m!629637 () Bool)

(assert (=> b!657055 m!629637))

(declare-fun m!629639 () Bool)

(assert (=> b!657055 m!629639))

(assert (=> b!657055 m!629599))

(declare-fun m!629641 () Bool)

(assert (=> b!657055 m!629641))

(declare-fun m!629643 () Bool)

(assert (=> b!657055 m!629643))

(declare-fun m!629645 () Bool)

(assert (=> start!59546 m!629645))

(declare-fun m!629647 () Bool)

(assert (=> start!59546 m!629647))

(declare-fun m!629649 () Bool)

(assert (=> b!657036 m!629649))

(declare-fun m!629651 () Bool)

(assert (=> b!657052 m!629651))

(assert (=> b!657052 m!629599))

(assert (=> b!657052 m!629599))

(assert (=> b!657052 m!629603))

(declare-fun m!629653 () Bool)

(assert (=> b!657052 m!629653))

(assert (=> b!657052 m!629599))

(declare-fun m!629655 () Bool)

(assert (=> b!657052 m!629655))

(assert (=> b!657052 m!629635))

(assert (=> b!657052 m!629599))

(declare-fun m!629657 () Bool)

(assert (=> b!657052 m!629657))

(assert (=> b!657052 m!629599))

(declare-fun m!629659 () Bool)

(assert (=> b!657052 m!629659))

(assert (=> b!657052 m!629643))

(assert (=> b!657053 m!629599))

(assert (=> b!657053 m!629599))

(declare-fun m!629661 () Bool)

(assert (=> b!657053 m!629661))

(assert (=> b!657047 m!629599))

(assert (=> b!657047 m!629599))

(declare-fun m!629663 () Bool)

(assert (=> b!657047 m!629663))

(assert (=> b!657050 m!629599))

(assert (=> b!657050 m!629599))

(assert (=> b!657050 m!629663))

(check-sat (not b!657055) (not b!657046) (not b!657056) (not b!657047) (not start!59546) (not b!657052) (not b!657042) (not b!657033) (not b!657040) (not b!657036) (not b!657045) (not b!657043) (not b!657050) (not b!657053))
(check-sat)
