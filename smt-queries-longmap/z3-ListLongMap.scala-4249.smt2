; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58882 () Bool)

(assert start!58882)

(declare-fun b!649681 () Bool)

(declare-fun res!421156 () Bool)

(declare-fun e!372650 () Bool)

(assert (=> b!649681 (=> (not res!421156) (not e!372650))))

(declare-datatypes ((array!38544 0))(
  ( (array!38545 (arr!18478 (Array (_ BitVec 32) (_ BitVec 64))) (size!18842 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38544)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649681 (= res!421156 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649682 () Bool)

(declare-fun e!372652 () Bool)

(assert (=> b!649682 (= e!372650 e!372652)))

(declare-fun res!421150 () Bool)

(assert (=> b!649682 (=> (not res!421150) (not e!372652))))

(declare-datatypes ((SeekEntryResult!6918 0))(
  ( (MissingZero!6918 (index!30019 (_ BitVec 32))) (Found!6918 (index!30020 (_ BitVec 32))) (Intermediate!6918 (undefined!7730 Bool) (index!30021 (_ BitVec 32)) (x!58803 (_ BitVec 32))) (Undefined!6918) (MissingVacant!6918 (index!30022 (_ BitVec 32))) )
))
(declare-fun lt!301747 () SeekEntryResult!6918)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!649682 (= res!421150 (or (= lt!301747 (MissingZero!6918 i!1108)) (= lt!301747 (MissingVacant!6918 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38544 (_ BitVec 32)) SeekEntryResult!6918)

(assert (=> b!649682 (= lt!301747 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649683 () Bool)

(declare-datatypes ((Unit!22134 0))(
  ( (Unit!22135) )
))
(declare-fun e!372659 () Unit!22134)

(declare-fun Unit!22136 () Unit!22134)

(assert (=> b!649683 (= e!372659 Unit!22136)))

(declare-fun b!649684 () Bool)

(declare-fun res!421139 () Bool)

(assert (=> b!649684 (=> (not res!421139) (not e!372650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649684 (= res!421139 (validKeyInArray!0 k0!1786))))

(declare-fun b!649685 () Bool)

(declare-fun Unit!22137 () Unit!22134)

(assert (=> b!649685 (= e!372659 Unit!22137)))

(assert (=> b!649685 false))

(declare-fun b!649686 () Bool)

(declare-fun res!421152 () Bool)

(assert (=> b!649686 (=> (not res!421152) (not e!372652))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649686 (= res!421152 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18478 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649687 () Bool)

(declare-fun e!372654 () Bool)

(declare-fun e!372660 () Bool)

(assert (=> b!649687 (= e!372654 e!372660)))

(declare-fun res!421141 () Bool)

(assert (=> b!649687 (=> res!421141 e!372660)))

(declare-fun lt!301746 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!301748 () (_ BitVec 64))

(assert (=> b!649687 (= res!421141 (or (not (= (select (arr!18478 a!2986) j!136) lt!301748)) (not (= (select (arr!18478 a!2986) j!136) lt!301746)) (bvsge j!136 index!984)))))

(declare-fun b!649688 () Bool)

(declare-fun res!421149 () Bool)

(assert (=> b!649688 (=> (not res!421149) (not e!372652))))

(declare-datatypes ((List!12519 0))(
  ( (Nil!12516) (Cons!12515 (h!13560 (_ BitVec 64)) (t!18747 List!12519)) )
))
(declare-fun arrayNoDuplicates!0 (array!38544 (_ BitVec 32) List!12519) Bool)

(assert (=> b!649688 (= res!421149 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12516))))

(declare-fun b!649689 () Bool)

(declare-fun e!372658 () Unit!22134)

(declare-fun Unit!22138 () Unit!22134)

(assert (=> b!649689 (= e!372658 Unit!22138)))

(declare-fun b!649690 () Bool)

(declare-fun Unit!22139 () Unit!22134)

(assert (=> b!649690 (= e!372658 Unit!22139)))

(declare-fun lt!301742 () Unit!22134)

(declare-fun lt!301737 () array!38544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22134)

(assert (=> b!649690 (= lt!301742 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301737 (select (arr!18478 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649690 (arrayContainsKey!0 lt!301737 (select (arr!18478 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301749 () Unit!22134)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12519) Unit!22134)

(assert (=> b!649690 (= lt!301749 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12516))))

(assert (=> b!649690 (arrayNoDuplicates!0 lt!301737 #b00000000000000000000000000000000 Nil!12516)))

(declare-fun lt!301736 () Unit!22134)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38544 (_ BitVec 32) (_ BitVec 32)) Unit!22134)

(assert (=> b!649690 (= lt!301736 (lemmaNoDuplicateFromThenFromBigger!0 lt!301737 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649690 (arrayNoDuplicates!0 lt!301737 j!136 Nil!12516)))

(declare-fun lt!301735 () Unit!22134)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38544 (_ BitVec 64) (_ BitVec 32) List!12519) Unit!22134)

(assert (=> b!649690 (= lt!301735 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301737 (select (arr!18478 a!2986) j!136) j!136 Nil!12516))))

(assert (=> b!649690 false))

(declare-fun b!649691 () Bool)

(declare-fun e!372657 () Bool)

(declare-fun e!372662 () Bool)

(assert (=> b!649691 (= e!372657 e!372662)))

(declare-fun res!421147 () Bool)

(assert (=> b!649691 (=> res!421147 e!372662)))

(assert (=> b!649691 (= res!421147 (bvsge index!984 j!136))))

(declare-fun lt!301734 () Unit!22134)

(assert (=> b!649691 (= lt!301734 e!372658)))

(declare-fun c!74639 () Bool)

(assert (=> b!649691 (= c!74639 (bvslt j!136 index!984))))

(declare-fun b!649692 () Bool)

(declare-fun e!372661 () Bool)

(declare-fun lt!301739 () SeekEntryResult!6918)

(declare-fun lt!301745 () SeekEntryResult!6918)

(assert (=> b!649692 (= e!372661 (= lt!301739 lt!301745))))

(declare-fun b!649693 () Bool)

(declare-fun e!372653 () Bool)

(declare-fun e!372656 () Bool)

(assert (=> b!649693 (= e!372653 e!372656)))

(declare-fun res!421154 () Bool)

(assert (=> b!649693 (=> (not res!421154) (not e!372656))))

(assert (=> b!649693 (= res!421154 (and (= lt!301739 (Found!6918 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18478 a!2986) index!984) (select (arr!18478 a!2986) j!136))) (not (= (select (arr!18478 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38544 (_ BitVec 32)) SeekEntryResult!6918)

(assert (=> b!649693 (= lt!301739 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18478 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649694 () Bool)

(assert (=> b!649694 (= e!372662 true)))

(assert (=> b!649694 (arrayNoDuplicates!0 lt!301737 #b00000000000000000000000000000000 Nil!12516)))

(declare-fun lt!301743 () Unit!22134)

(assert (=> b!649694 (= lt!301743 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12516))))

(assert (=> b!649694 (arrayContainsKey!0 lt!301737 (select (arr!18478 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301750 () Unit!22134)

(assert (=> b!649694 (= lt!301750 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301737 (select (arr!18478 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372663 () Bool)

(assert (=> b!649694 e!372663))

(declare-fun res!421140 () Bool)

(assert (=> b!649694 (=> (not res!421140) (not e!372663))))

(assert (=> b!649694 (= res!421140 (arrayContainsKey!0 lt!301737 (select (arr!18478 a!2986) j!136) j!136))))

(declare-fun e!372649 () Bool)

(declare-fun b!649695 () Bool)

(assert (=> b!649695 (= e!372649 (arrayContainsKey!0 lt!301737 (select (arr!18478 a!2986) j!136) index!984))))

(declare-fun b!649696 () Bool)

(assert (=> b!649696 (= e!372660 e!372649)))

(declare-fun res!421142 () Bool)

(assert (=> b!649696 (=> (not res!421142) (not e!372649))))

(assert (=> b!649696 (= res!421142 (arrayContainsKey!0 lt!301737 (select (arr!18478 a!2986) j!136) j!136))))

(declare-fun b!649697 () Bool)

(assert (=> b!649697 (= e!372663 (arrayContainsKey!0 lt!301737 (select (arr!18478 a!2986) j!136) index!984))))

(declare-fun b!649698 () Bool)

(declare-fun res!421155 () Bool)

(assert (=> b!649698 (=> (not res!421155) (not e!372650))))

(assert (=> b!649698 (= res!421155 (validKeyInArray!0 (select (arr!18478 a!2986) j!136)))))

(declare-fun b!649699 () Bool)

(declare-fun e!372655 () Bool)

(assert (=> b!649699 (= e!372656 (not e!372655))))

(declare-fun res!421144 () Bool)

(assert (=> b!649699 (=> res!421144 e!372655)))

(declare-fun lt!301738 () SeekEntryResult!6918)

(assert (=> b!649699 (= res!421144 (not (= lt!301738 (Found!6918 index!984))))))

(declare-fun lt!301744 () Unit!22134)

(assert (=> b!649699 (= lt!301744 e!372659)))

(declare-fun c!74638 () Bool)

(assert (=> b!649699 (= c!74638 (= lt!301738 Undefined!6918))))

(assert (=> b!649699 (= lt!301738 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301748 lt!301737 mask!3053))))

(assert (=> b!649699 e!372661))

(declare-fun res!421148 () Bool)

(assert (=> b!649699 (=> (not res!421148) (not e!372661))))

(declare-fun lt!301740 () (_ BitVec 32))

(assert (=> b!649699 (= res!421148 (= lt!301745 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301740 vacantSpotIndex!68 lt!301748 lt!301737 mask!3053)))))

(assert (=> b!649699 (= lt!301745 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301740 vacantSpotIndex!68 (select (arr!18478 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649699 (= lt!301748 (select (store (arr!18478 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301741 () Unit!22134)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38544 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22134)

(assert (=> b!649699 (= lt!301741 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301740 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649699 (= lt!301740 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!421151 () Bool)

(assert (=> start!58882 (=> (not res!421151) (not e!372650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58882 (= res!421151 (validMask!0 mask!3053))))

(assert (=> start!58882 e!372650))

(assert (=> start!58882 true))

(declare-fun array_inv!14274 (array!38544) Bool)

(assert (=> start!58882 (array_inv!14274 a!2986)))

(declare-fun b!649700 () Bool)

(assert (=> b!649700 (= e!372655 e!372657)))

(declare-fun res!421153 () Bool)

(assert (=> b!649700 (=> res!421153 e!372657)))

(assert (=> b!649700 (= res!421153 (or (not (= (select (arr!18478 a!2986) j!136) lt!301748)) (not (= (select (arr!18478 a!2986) j!136) lt!301746))))))

(assert (=> b!649700 e!372654))

(declare-fun res!421145 () Bool)

(assert (=> b!649700 (=> (not res!421145) (not e!372654))))

(assert (=> b!649700 (= res!421145 (= lt!301746 (select (arr!18478 a!2986) j!136)))))

(assert (=> b!649700 (= lt!301746 (select (store (arr!18478 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649701 () Bool)

(declare-fun res!421157 () Bool)

(assert (=> b!649701 (=> (not res!421157) (not e!372650))))

(assert (=> b!649701 (= res!421157 (and (= (size!18842 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18842 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18842 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649702 () Bool)

(declare-fun res!421146 () Bool)

(assert (=> b!649702 (=> (not res!421146) (not e!372652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38544 (_ BitVec 32)) Bool)

(assert (=> b!649702 (= res!421146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649703 () Bool)

(assert (=> b!649703 (= e!372652 e!372653)))

(declare-fun res!421143 () Bool)

(assert (=> b!649703 (=> (not res!421143) (not e!372653))))

(assert (=> b!649703 (= res!421143 (= (select (store (arr!18478 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649703 (= lt!301737 (array!38545 (store (arr!18478 a!2986) i!1108 k0!1786) (size!18842 a!2986)))))

(assert (= (and start!58882 res!421151) b!649701))

(assert (= (and b!649701 res!421157) b!649698))

(assert (= (and b!649698 res!421155) b!649684))

(assert (= (and b!649684 res!421139) b!649681))

(assert (= (and b!649681 res!421156) b!649682))

(assert (= (and b!649682 res!421150) b!649702))

(assert (= (and b!649702 res!421146) b!649688))

(assert (= (and b!649688 res!421149) b!649686))

(assert (= (and b!649686 res!421152) b!649703))

(assert (= (and b!649703 res!421143) b!649693))

(assert (= (and b!649693 res!421154) b!649699))

(assert (= (and b!649699 res!421148) b!649692))

(assert (= (and b!649699 c!74638) b!649685))

(assert (= (and b!649699 (not c!74638)) b!649683))

(assert (= (and b!649699 (not res!421144)) b!649700))

(assert (= (and b!649700 res!421145) b!649687))

(assert (= (and b!649687 (not res!421141)) b!649696))

(assert (= (and b!649696 res!421142) b!649695))

(assert (= (and b!649700 (not res!421153)) b!649691))

(assert (= (and b!649691 c!74639) b!649690))

(assert (= (and b!649691 (not c!74639)) b!649689))

(assert (= (and b!649691 (not res!421147)) b!649694))

(assert (= (and b!649694 res!421140) b!649697))

(declare-fun m!622917 () Bool)

(assert (=> b!649695 m!622917))

(assert (=> b!649695 m!622917))

(declare-fun m!622919 () Bool)

(assert (=> b!649695 m!622919))

(assert (=> b!649690 m!622917))

(declare-fun m!622921 () Bool)

(assert (=> b!649690 m!622921))

(declare-fun m!622923 () Bool)

(assert (=> b!649690 m!622923))

(assert (=> b!649690 m!622917))

(assert (=> b!649690 m!622917))

(declare-fun m!622925 () Bool)

(assert (=> b!649690 m!622925))

(declare-fun m!622927 () Bool)

(assert (=> b!649690 m!622927))

(declare-fun m!622929 () Bool)

(assert (=> b!649690 m!622929))

(assert (=> b!649690 m!622917))

(declare-fun m!622931 () Bool)

(assert (=> b!649690 m!622931))

(declare-fun m!622933 () Bool)

(assert (=> b!649690 m!622933))

(declare-fun m!622935 () Bool)

(assert (=> b!649686 m!622935))

(assert (=> b!649699 m!622917))

(declare-fun m!622937 () Bool)

(assert (=> b!649699 m!622937))

(declare-fun m!622939 () Bool)

(assert (=> b!649699 m!622939))

(declare-fun m!622941 () Bool)

(assert (=> b!649699 m!622941))

(assert (=> b!649699 m!622917))

(declare-fun m!622943 () Bool)

(assert (=> b!649699 m!622943))

(declare-fun m!622945 () Bool)

(assert (=> b!649699 m!622945))

(declare-fun m!622947 () Bool)

(assert (=> b!649699 m!622947))

(declare-fun m!622949 () Bool)

(assert (=> b!649699 m!622949))

(assert (=> b!649700 m!622917))

(assert (=> b!649700 m!622943))

(declare-fun m!622951 () Bool)

(assert (=> b!649700 m!622951))

(declare-fun m!622953 () Bool)

(assert (=> start!58882 m!622953))

(declare-fun m!622955 () Bool)

(assert (=> start!58882 m!622955))

(assert (=> b!649697 m!622917))

(assert (=> b!649697 m!622917))

(assert (=> b!649697 m!622919))

(declare-fun m!622957 () Bool)

(assert (=> b!649681 m!622957))

(declare-fun m!622959 () Bool)

(assert (=> b!649688 m!622959))

(declare-fun m!622961 () Bool)

(assert (=> b!649684 m!622961))

(declare-fun m!622963 () Bool)

(assert (=> b!649693 m!622963))

(assert (=> b!649693 m!622917))

(assert (=> b!649693 m!622917))

(declare-fun m!622965 () Bool)

(assert (=> b!649693 m!622965))

(assert (=> b!649698 m!622917))

(assert (=> b!649698 m!622917))

(declare-fun m!622967 () Bool)

(assert (=> b!649698 m!622967))

(declare-fun m!622969 () Bool)

(assert (=> b!649702 m!622969))

(assert (=> b!649687 m!622917))

(declare-fun m!622971 () Bool)

(assert (=> b!649682 m!622971))

(assert (=> b!649703 m!622943))

(declare-fun m!622973 () Bool)

(assert (=> b!649703 m!622973))

(assert (=> b!649694 m!622917))

(declare-fun m!622975 () Bool)

(assert (=> b!649694 m!622975))

(assert (=> b!649694 m!622917))

(assert (=> b!649694 m!622917))

(declare-fun m!622977 () Bool)

(assert (=> b!649694 m!622977))

(assert (=> b!649694 m!622927))

(assert (=> b!649694 m!622917))

(declare-fun m!622979 () Bool)

(assert (=> b!649694 m!622979))

(assert (=> b!649694 m!622933))

(assert (=> b!649696 m!622917))

(assert (=> b!649696 m!622917))

(assert (=> b!649696 m!622979))

(check-sat (not b!649696) (not start!58882) (not b!649697) (not b!649698) (not b!649693) (not b!649690) (not b!649688) (not b!649694) (not b!649682) (not b!649684) (not b!649699) (not b!649702) (not b!649695) (not b!649681))
(check-sat)
