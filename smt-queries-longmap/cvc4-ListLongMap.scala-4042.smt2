; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55130 () Bool)

(assert start!55130)

(declare-fun res!387738 () Bool)

(declare-fun e!345362 () Bool)

(assert (=> start!55130 (=> (not res!387738) (not e!345362))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55130 (= res!387738 (validMask!0 mask!3053))))

(assert (=> start!55130 e!345362))

(assert (=> start!55130 true))

(declare-datatypes ((array!37203 0))(
  ( (array!37204 (arr!17858 (Array (_ BitVec 32) (_ BitVec 64))) (size!18222 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37203)

(declare-fun array_inv!13654 (array!37203) Bool)

(assert (=> start!55130 (array_inv!13654 a!2986)))

(declare-fun b!603685 () Bool)

(declare-fun res!387739 () Bool)

(assert (=> b!603685 (=> (not res!387739) (not e!345362))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603685 (= res!387739 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603686 () Bool)

(declare-fun e!345372 () Bool)

(assert (=> b!603686 (= e!345362 e!345372)))

(declare-fun res!387740 () Bool)

(assert (=> b!603686 (=> (not res!387740) (not e!345372))))

(declare-datatypes ((SeekEntryResult!6298 0))(
  ( (MissingZero!6298 (index!27455 (_ BitVec 32))) (Found!6298 (index!27456 (_ BitVec 32))) (Intermediate!6298 (undefined!7110 Bool) (index!27457 (_ BitVec 32)) (x!56251 (_ BitVec 32))) (Undefined!6298) (MissingVacant!6298 (index!27458 (_ BitVec 32))) )
))
(declare-fun lt!275159 () SeekEntryResult!6298)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603686 (= res!387740 (or (= lt!275159 (MissingZero!6298 i!1108)) (= lt!275159 (MissingVacant!6298 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37203 (_ BitVec 32)) SeekEntryResult!6298)

(assert (=> b!603686 (= lt!275159 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603687 () Bool)

(declare-fun res!387751 () Bool)

(assert (=> b!603687 (=> (not res!387751) (not e!345362))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603687 (= res!387751 (validKeyInArray!0 (select (arr!17858 a!2986) j!136)))))

(declare-fun b!603688 () Bool)

(declare-datatypes ((Unit!19168 0))(
  ( (Unit!19169) )
))
(declare-fun e!345366 () Unit!19168)

(declare-fun Unit!19170 () Unit!19168)

(assert (=> b!603688 (= e!345366 Unit!19170)))

(declare-fun b!603689 () Bool)

(declare-fun e!345365 () Bool)

(declare-fun e!345374 () Bool)

(assert (=> b!603689 (= e!345365 (not e!345374))))

(declare-fun res!387741 () Bool)

(assert (=> b!603689 (=> res!387741 e!345374)))

(declare-fun lt!275153 () SeekEntryResult!6298)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603689 (= res!387741 (not (= lt!275153 (Found!6298 index!984))))))

(declare-fun lt!275161 () Unit!19168)

(declare-fun e!345371 () Unit!19168)

(assert (=> b!603689 (= lt!275161 e!345371)))

(declare-fun c!68341 () Bool)

(assert (=> b!603689 (= c!68341 (= lt!275153 Undefined!6298))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!275167 () (_ BitVec 64))

(declare-fun lt!275155 () array!37203)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37203 (_ BitVec 32)) SeekEntryResult!6298)

(assert (=> b!603689 (= lt!275153 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275167 lt!275155 mask!3053))))

(declare-fun e!345367 () Bool)

(assert (=> b!603689 e!345367))

(declare-fun res!387742 () Bool)

(assert (=> b!603689 (=> (not res!387742) (not e!345367))))

(declare-fun lt!275164 () (_ BitVec 32))

(declare-fun lt!275165 () SeekEntryResult!6298)

(assert (=> b!603689 (= res!387742 (= lt!275165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275164 vacantSpotIndex!68 lt!275167 lt!275155 mask!3053)))))

(assert (=> b!603689 (= lt!275165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275164 vacantSpotIndex!68 (select (arr!17858 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603689 (= lt!275167 (select (store (arr!17858 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275154 () Unit!19168)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19168)

(assert (=> b!603689 (= lt!275154 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275164 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603689 (= lt!275164 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603690 () Bool)

(declare-fun e!345364 () Bool)

(declare-fun e!345361 () Bool)

(assert (=> b!603690 (= e!345364 e!345361)))

(declare-fun res!387752 () Bool)

(assert (=> b!603690 (=> (not res!387752) (not e!345361))))

(assert (=> b!603690 (= res!387752 (arrayContainsKey!0 lt!275155 (select (arr!17858 a!2986) j!136) j!136))))

(declare-fun b!603691 () Bool)

(declare-fun Unit!19171 () Unit!19168)

(assert (=> b!603691 (= e!345366 Unit!19171)))

(declare-fun lt!275158 () Unit!19168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19168)

(assert (=> b!603691 (= lt!275158 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275155 (select (arr!17858 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603691 (arrayContainsKey!0 lt!275155 (select (arr!17858 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275162 () Unit!19168)

(declare-datatypes ((List!11899 0))(
  ( (Nil!11896) (Cons!11895 (h!12940 (_ BitVec 64)) (t!18127 List!11899)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11899) Unit!19168)

(assert (=> b!603691 (= lt!275162 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11896))))

(declare-fun arrayNoDuplicates!0 (array!37203 (_ BitVec 32) List!11899) Bool)

(assert (=> b!603691 (arrayNoDuplicates!0 lt!275155 #b00000000000000000000000000000000 Nil!11896)))

(declare-fun lt!275156 () Unit!19168)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37203 (_ BitVec 32) (_ BitVec 32)) Unit!19168)

(assert (=> b!603691 (= lt!275156 (lemmaNoDuplicateFromThenFromBigger!0 lt!275155 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603691 (arrayNoDuplicates!0 lt!275155 j!136 Nil!11896)))

(declare-fun lt!275166 () Unit!19168)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37203 (_ BitVec 64) (_ BitVec 32) List!11899) Unit!19168)

(assert (=> b!603691 (= lt!275166 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275155 (select (arr!17858 a!2986) j!136) j!136 Nil!11896))))

(assert (=> b!603691 false))

(declare-fun b!603692 () Bool)

(declare-fun Unit!19172 () Unit!19168)

(assert (=> b!603692 (= e!345371 Unit!19172)))

(assert (=> b!603692 false))

(declare-fun b!603693 () Bool)

(declare-fun res!387744 () Bool)

(assert (=> b!603693 (=> (not res!387744) (not e!345372))))

(assert (=> b!603693 (= res!387744 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11896))))

(declare-fun b!603694 () Bool)

(declare-fun e!345370 () Bool)

(assert (=> b!603694 (= e!345370 true)))

(declare-fun e!345375 () Bool)

(assert (=> b!603694 e!345375))

(declare-fun res!387745 () Bool)

(assert (=> b!603694 (=> (not res!387745) (not e!345375))))

(assert (=> b!603694 (= res!387745 (arrayContainsKey!0 lt!275155 (select (arr!17858 a!2986) j!136) j!136))))

(declare-fun b!603695 () Bool)

(declare-fun e!345373 () Bool)

(assert (=> b!603695 (= e!345372 e!345373)))

(declare-fun res!387743 () Bool)

(assert (=> b!603695 (=> (not res!387743) (not e!345373))))

(assert (=> b!603695 (= res!387743 (= (select (store (arr!17858 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603695 (= lt!275155 (array!37204 (store (arr!17858 a!2986) i!1108 k!1786) (size!18222 a!2986)))))

(declare-fun b!603696 () Bool)

(declare-fun res!387750 () Bool)

(assert (=> b!603696 (=> (not res!387750) (not e!345372))))

(assert (=> b!603696 (= res!387750 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17858 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603697 () Bool)

(declare-fun e!345363 () Bool)

(assert (=> b!603697 (= e!345363 e!345364)))

(declare-fun res!387749 () Bool)

(assert (=> b!603697 (=> res!387749 e!345364)))

(declare-fun lt!275163 () (_ BitVec 64))

(assert (=> b!603697 (= res!387749 (or (not (= (select (arr!17858 a!2986) j!136) lt!275167)) (not (= (select (arr!17858 a!2986) j!136) lt!275163)) (bvsge j!136 index!984)))))

(declare-fun b!603698 () Bool)

(declare-fun e!345369 () Bool)

(assert (=> b!603698 (= e!345374 e!345369)))

(declare-fun res!387755 () Bool)

(assert (=> b!603698 (=> res!387755 e!345369)))

(assert (=> b!603698 (= res!387755 (or (not (= (select (arr!17858 a!2986) j!136) lt!275167)) (not (= (select (arr!17858 a!2986) j!136) lt!275163))))))

(assert (=> b!603698 e!345363))

(declare-fun res!387754 () Bool)

(assert (=> b!603698 (=> (not res!387754) (not e!345363))))

(assert (=> b!603698 (= res!387754 (= lt!275163 (select (arr!17858 a!2986) j!136)))))

(assert (=> b!603698 (= lt!275163 (select (store (arr!17858 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603699 () Bool)

(assert (=> b!603699 (= e!345373 e!345365)))

(declare-fun res!387747 () Bool)

(assert (=> b!603699 (=> (not res!387747) (not e!345365))))

(declare-fun lt!275157 () SeekEntryResult!6298)

(assert (=> b!603699 (= res!387747 (and (= lt!275157 (Found!6298 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17858 a!2986) index!984) (select (arr!17858 a!2986) j!136))) (not (= (select (arr!17858 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603699 (= lt!275157 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17858 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603700 () Bool)

(assert (=> b!603700 (= e!345367 (= lt!275157 lt!275165))))

(declare-fun b!603701 () Bool)

(declare-fun res!387753 () Bool)

(assert (=> b!603701 (=> (not res!387753) (not e!345362))))

(assert (=> b!603701 (= res!387753 (and (= (size!18222 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18222 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18222 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603702 () Bool)

(declare-fun res!387737 () Bool)

(assert (=> b!603702 (=> (not res!387737) (not e!345372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37203 (_ BitVec 32)) Bool)

(assert (=> b!603702 (= res!387737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603703 () Bool)

(declare-fun Unit!19173 () Unit!19168)

(assert (=> b!603703 (= e!345371 Unit!19173)))

(declare-fun b!603704 () Bool)

(declare-fun res!387748 () Bool)

(assert (=> b!603704 (=> (not res!387748) (not e!345362))))

(assert (=> b!603704 (= res!387748 (validKeyInArray!0 k!1786))))

(declare-fun b!603705 () Bool)

(assert (=> b!603705 (= e!345369 e!345370)))

(declare-fun res!387746 () Bool)

(assert (=> b!603705 (=> res!387746 e!345370)))

(assert (=> b!603705 (= res!387746 (bvsge index!984 j!136))))

(declare-fun lt!275160 () Unit!19168)

(assert (=> b!603705 (= lt!275160 e!345366)))

(declare-fun c!68342 () Bool)

(assert (=> b!603705 (= c!68342 (bvslt j!136 index!984))))

(declare-fun b!603706 () Bool)

(assert (=> b!603706 (= e!345375 (arrayContainsKey!0 lt!275155 (select (arr!17858 a!2986) j!136) index!984))))

(declare-fun b!603707 () Bool)

(assert (=> b!603707 (= e!345361 (arrayContainsKey!0 lt!275155 (select (arr!17858 a!2986) j!136) index!984))))

(assert (= (and start!55130 res!387738) b!603701))

(assert (= (and b!603701 res!387753) b!603687))

(assert (= (and b!603687 res!387751) b!603704))

(assert (= (and b!603704 res!387748) b!603685))

(assert (= (and b!603685 res!387739) b!603686))

(assert (= (and b!603686 res!387740) b!603702))

(assert (= (and b!603702 res!387737) b!603693))

(assert (= (and b!603693 res!387744) b!603696))

(assert (= (and b!603696 res!387750) b!603695))

(assert (= (and b!603695 res!387743) b!603699))

(assert (= (and b!603699 res!387747) b!603689))

(assert (= (and b!603689 res!387742) b!603700))

(assert (= (and b!603689 c!68341) b!603692))

(assert (= (and b!603689 (not c!68341)) b!603703))

(assert (= (and b!603689 (not res!387741)) b!603698))

(assert (= (and b!603698 res!387754) b!603697))

(assert (= (and b!603697 (not res!387749)) b!603690))

(assert (= (and b!603690 res!387752) b!603707))

(assert (= (and b!603698 (not res!387755)) b!603705))

(assert (= (and b!603705 c!68342) b!603691))

(assert (= (and b!603705 (not c!68342)) b!603688))

(assert (= (and b!603705 (not res!387746)) b!603694))

(assert (= (and b!603694 res!387745) b!603706))

(declare-fun m!580673 () Bool)

(assert (=> b!603685 m!580673))

(declare-fun m!580675 () Bool)

(assert (=> b!603693 m!580675))

(declare-fun m!580677 () Bool)

(assert (=> b!603691 m!580677))

(declare-fun m!580679 () Bool)

(assert (=> b!603691 m!580679))

(declare-fun m!580681 () Bool)

(assert (=> b!603691 m!580681))

(declare-fun m!580683 () Bool)

(assert (=> b!603691 m!580683))

(declare-fun m!580685 () Bool)

(assert (=> b!603691 m!580685))

(assert (=> b!603691 m!580683))

(assert (=> b!603691 m!580683))

(declare-fun m!580687 () Bool)

(assert (=> b!603691 m!580687))

(assert (=> b!603691 m!580683))

(declare-fun m!580689 () Bool)

(assert (=> b!603691 m!580689))

(declare-fun m!580691 () Bool)

(assert (=> b!603691 m!580691))

(declare-fun m!580693 () Bool)

(assert (=> b!603704 m!580693))

(assert (=> b!603687 m!580683))

(assert (=> b!603687 m!580683))

(declare-fun m!580695 () Bool)

(assert (=> b!603687 m!580695))

(assert (=> b!603697 m!580683))

(declare-fun m!580697 () Bool)

(assert (=> b!603695 m!580697))

(declare-fun m!580699 () Bool)

(assert (=> b!603695 m!580699))

(declare-fun m!580701 () Bool)

(assert (=> b!603696 m!580701))

(assert (=> b!603690 m!580683))

(assert (=> b!603690 m!580683))

(declare-fun m!580703 () Bool)

(assert (=> b!603690 m!580703))

(assert (=> b!603694 m!580683))

(assert (=> b!603694 m!580683))

(assert (=> b!603694 m!580703))

(declare-fun m!580705 () Bool)

(assert (=> b!603686 m!580705))

(declare-fun m!580707 () Bool)

(assert (=> b!603689 m!580707))

(declare-fun m!580709 () Bool)

(assert (=> b!603689 m!580709))

(declare-fun m!580711 () Bool)

(assert (=> b!603689 m!580711))

(assert (=> b!603689 m!580683))

(assert (=> b!603689 m!580697))

(assert (=> b!603689 m!580683))

(declare-fun m!580713 () Bool)

(assert (=> b!603689 m!580713))

(declare-fun m!580715 () Bool)

(assert (=> b!603689 m!580715))

(declare-fun m!580717 () Bool)

(assert (=> b!603689 m!580717))

(assert (=> b!603706 m!580683))

(assert (=> b!603706 m!580683))

(declare-fun m!580719 () Bool)

(assert (=> b!603706 m!580719))

(assert (=> b!603707 m!580683))

(assert (=> b!603707 m!580683))

(assert (=> b!603707 m!580719))

(declare-fun m!580721 () Bool)

(assert (=> b!603702 m!580721))

(declare-fun m!580723 () Bool)

(assert (=> start!55130 m!580723))

(declare-fun m!580725 () Bool)

(assert (=> start!55130 m!580725))

(assert (=> b!603698 m!580683))

(assert (=> b!603698 m!580697))

(declare-fun m!580727 () Bool)

(assert (=> b!603698 m!580727))

(declare-fun m!580729 () Bool)

(assert (=> b!603699 m!580729))

(assert (=> b!603699 m!580683))

(assert (=> b!603699 m!580683))

(declare-fun m!580731 () Bool)

(assert (=> b!603699 m!580731))

(push 1)

