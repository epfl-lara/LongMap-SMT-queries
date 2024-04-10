; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59090 () Bool)

(assert start!59090)

(declare-fun b!651742 () Bool)

(declare-fun e!374028 () Bool)

(declare-fun e!374030 () Bool)

(assert (=> b!651742 (= e!374028 e!374030)))

(declare-fun res!422541 () Bool)

(assert (=> b!651742 (=> res!422541 e!374030)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!651742 (= res!422541 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22254 0))(
  ( (Unit!22255) )
))
(declare-fun lt!303067 () Unit!22254)

(declare-fun e!374031 () Unit!22254)

(assert (=> b!651742 (= lt!303067 e!374031)))

(declare-fun c!74972 () Bool)

(assert (=> b!651742 (= c!74972 (bvslt j!136 index!984))))

(declare-fun b!651743 () Bool)

(declare-fun res!422552 () Bool)

(declare-fun e!374024 () Bool)

(assert (=> b!651743 (=> (not res!422552) (not e!374024))))

(declare-datatypes ((array!38590 0))(
  ( (array!38591 (arr!18498 (Array (_ BitVec 32) (_ BitVec 64))) (size!18862 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38590)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651743 (= res!422552 (validKeyInArray!0 (select (arr!18498 a!2986) j!136)))))

(declare-fun b!651744 () Bool)

(declare-fun e!374017 () Bool)

(declare-fun e!374023 () Bool)

(assert (=> b!651744 (= e!374017 e!374023)))

(declare-fun res!422549 () Bool)

(assert (=> b!651744 (=> (not res!422549) (not e!374023))))

(declare-datatypes ((SeekEntryResult!6938 0))(
  ( (MissingZero!6938 (index!30105 (_ BitVec 32))) (Found!6938 (index!30106 (_ BitVec 32))) (Intermediate!6938 (undefined!7750 Bool) (index!30107 (_ BitVec 32)) (x!58897 (_ BitVec 32))) (Undefined!6938) (MissingVacant!6938 (index!30108 (_ BitVec 32))) )
))
(declare-fun lt!303076 () SeekEntryResult!6938)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!651744 (= res!422549 (and (= lt!303076 (Found!6938 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18498 a!2986) index!984) (select (arr!18498 a!2986) j!136))) (not (= (select (arr!18498 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38590 (_ BitVec 32)) SeekEntryResult!6938)

(assert (=> b!651744 (= lt!303076 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18498 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651745 () Bool)

(declare-fun e!374027 () Bool)

(assert (=> b!651745 (= e!374024 e!374027)))

(declare-fun res!422534 () Bool)

(assert (=> b!651745 (=> (not res!422534) (not e!374027))))

(declare-fun lt!303073 () SeekEntryResult!6938)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651745 (= res!422534 (or (= lt!303073 (MissingZero!6938 i!1108)) (= lt!303073 (MissingVacant!6938 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38590 (_ BitVec 32)) SeekEntryResult!6938)

(assert (=> b!651745 (= lt!303073 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!651746 () Bool)

(declare-fun e!374020 () Bool)

(declare-fun lt!303065 () SeekEntryResult!6938)

(assert (=> b!651746 (= e!374020 (= lt!303076 lt!303065))))

(declare-fun b!651747 () Bool)

(declare-fun e!374022 () Unit!22254)

(declare-fun Unit!22256 () Unit!22254)

(assert (=> b!651747 (= e!374022 Unit!22256)))

(declare-fun b!651748 () Bool)

(declare-fun res!422547 () Bool)

(assert (=> b!651748 (=> (not res!422547) (not e!374027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38590 (_ BitVec 32)) Bool)

(assert (=> b!651748 (= res!422547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun lt!303074 () array!38590)

(declare-fun b!651749 () Bool)

(declare-fun e!374018 () Bool)

(declare-fun arrayContainsKey!0 (array!38590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651749 (= e!374018 (arrayContainsKey!0 lt!303074 (select (arr!18498 a!2986) j!136) index!984))))

(declare-fun b!651750 () Bool)

(declare-fun Unit!22257 () Unit!22254)

(assert (=> b!651750 (= e!374031 Unit!22257)))

(declare-fun lt!303078 () Unit!22254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22254)

(assert (=> b!651750 (= lt!303078 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303074 (select (arr!18498 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651750 (arrayContainsKey!0 lt!303074 (select (arr!18498 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303068 () Unit!22254)

(declare-datatypes ((List!12539 0))(
  ( (Nil!12536) (Cons!12535 (h!13580 (_ BitVec 64)) (t!18767 List!12539)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12539) Unit!22254)

(assert (=> b!651750 (= lt!303068 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12536))))

(declare-fun arrayNoDuplicates!0 (array!38590 (_ BitVec 32) List!12539) Bool)

(assert (=> b!651750 (arrayNoDuplicates!0 lt!303074 #b00000000000000000000000000000000 Nil!12536)))

(declare-fun lt!303077 () Unit!22254)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38590 (_ BitVec 32) (_ BitVec 32)) Unit!22254)

(assert (=> b!651750 (= lt!303077 (lemmaNoDuplicateFromThenFromBigger!0 lt!303074 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651750 (arrayNoDuplicates!0 lt!303074 j!136 Nil!12536)))

(declare-fun lt!303075 () Unit!22254)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38590 (_ BitVec 64) (_ BitVec 32) List!12539) Unit!22254)

(assert (=> b!651750 (= lt!303075 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303074 (select (arr!18498 a!2986) j!136) j!136 Nil!12536))))

(assert (=> b!651750 false))

(declare-fun b!651751 () Bool)

(declare-fun res!422551 () Bool)

(assert (=> b!651751 (=> (not res!422551) (not e!374024))))

(assert (=> b!651751 (= res!422551 (and (= (size!18862 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18862 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18862 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651752 () Bool)

(declare-fun Unit!22258 () Unit!22254)

(assert (=> b!651752 (= e!374022 Unit!22258)))

(assert (=> b!651752 false))

(declare-fun b!651753 () Bool)

(assert (=> b!651753 (= e!374027 e!374017)))

(declare-fun res!422538 () Bool)

(assert (=> b!651753 (=> (not res!422538) (not e!374017))))

(assert (=> b!651753 (= res!422538 (= (select (store (arr!18498 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651753 (= lt!303074 (array!38591 (store (arr!18498 a!2986) i!1108 k!1786) (size!18862 a!2986)))))

(declare-fun b!651754 () Bool)

(declare-fun res!422540 () Bool)

(assert (=> b!651754 (=> (not res!422540) (not e!374024))))

(assert (=> b!651754 (= res!422540 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651755 () Bool)

(declare-fun e!374029 () Bool)

(assert (=> b!651755 (= e!374029 e!374028)))

(declare-fun res!422539 () Bool)

(assert (=> b!651755 (=> res!422539 e!374028)))

(declare-fun lt!303069 () (_ BitVec 64))

(declare-fun lt!303066 () (_ BitVec 64))

(assert (=> b!651755 (= res!422539 (or (not (= (select (arr!18498 a!2986) j!136) lt!303066)) (not (= (select (arr!18498 a!2986) j!136) lt!303069))))))

(declare-fun e!374026 () Bool)

(assert (=> b!651755 e!374026))

(declare-fun res!422545 () Bool)

(assert (=> b!651755 (=> (not res!422545) (not e!374026))))

(assert (=> b!651755 (= res!422545 (= lt!303069 (select (arr!18498 a!2986) j!136)))))

(assert (=> b!651755 (= lt!303069 (select (store (arr!18498 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651756 () Bool)

(declare-fun res!422544 () Bool)

(assert (=> b!651756 (=> (not res!422544) (not e!374027))))

(assert (=> b!651756 (= res!422544 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12536))))

(declare-fun res!422543 () Bool)

(assert (=> start!59090 (=> (not res!422543) (not e!374024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59090 (= res!422543 (validMask!0 mask!3053))))

(assert (=> start!59090 e!374024))

(assert (=> start!59090 true))

(declare-fun array_inv!14294 (array!38590) Bool)

(assert (=> start!59090 (array_inv!14294 a!2986)))

(declare-fun b!651757 () Bool)

(assert (=> b!651757 (= e!374023 (not e!374029))))

(declare-fun res!422550 () Bool)

(assert (=> b!651757 (=> res!422550 e!374029)))

(declare-fun lt!303070 () SeekEntryResult!6938)

(assert (=> b!651757 (= res!422550 (not (= lt!303070 (Found!6938 index!984))))))

(declare-fun lt!303079 () Unit!22254)

(assert (=> b!651757 (= lt!303079 e!374022)))

(declare-fun c!74971 () Bool)

(assert (=> b!651757 (= c!74971 (= lt!303070 Undefined!6938))))

(assert (=> b!651757 (= lt!303070 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303066 lt!303074 mask!3053))))

(assert (=> b!651757 e!374020))

(declare-fun res!422536 () Bool)

(assert (=> b!651757 (=> (not res!422536) (not e!374020))))

(declare-fun lt!303063 () (_ BitVec 32))

(assert (=> b!651757 (= res!422536 (= lt!303065 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303063 vacantSpotIndex!68 lt!303066 lt!303074 mask!3053)))))

(assert (=> b!651757 (= lt!303065 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303063 vacantSpotIndex!68 (select (arr!18498 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651757 (= lt!303066 (select (store (arr!18498 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303064 () Unit!22254)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22254)

(assert (=> b!651757 (= lt!303064 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303063 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651757 (= lt!303063 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651758 () Bool)

(declare-fun e!374025 () Bool)

(assert (=> b!651758 (= e!374026 e!374025)))

(declare-fun res!422546 () Bool)

(assert (=> b!651758 (=> res!422546 e!374025)))

(assert (=> b!651758 (= res!422546 (or (not (= (select (arr!18498 a!2986) j!136) lt!303066)) (not (= (select (arr!18498 a!2986) j!136) lt!303069)) (bvsge j!136 index!984)))))

(declare-fun b!651759 () Bool)

(declare-fun e!374021 () Bool)

(assert (=> b!651759 (= e!374021 (arrayContainsKey!0 lt!303074 (select (arr!18498 a!2986) j!136) index!984))))

(declare-fun b!651760 () Bool)

(assert (=> b!651760 (= e!374030 true)))

(assert (=> b!651760 (arrayNoDuplicates!0 lt!303074 index!984 Nil!12536)))

(declare-fun lt!303062 () Unit!22254)

(assert (=> b!651760 (= lt!303062 (lemmaNoDuplicateFromThenFromBigger!0 lt!303074 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651760 (arrayNoDuplicates!0 lt!303074 #b00000000000000000000000000000000 Nil!12536)))

(declare-fun lt!303072 () Unit!22254)

(assert (=> b!651760 (= lt!303072 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12536))))

(assert (=> b!651760 (arrayContainsKey!0 lt!303074 (select (arr!18498 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303071 () Unit!22254)

(assert (=> b!651760 (= lt!303071 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303074 (select (arr!18498 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651760 e!374018))

(declare-fun res!422542 () Bool)

(assert (=> b!651760 (=> (not res!422542) (not e!374018))))

(assert (=> b!651760 (= res!422542 (arrayContainsKey!0 lt!303074 (select (arr!18498 a!2986) j!136) j!136))))

(declare-fun b!651761 () Bool)

(declare-fun res!422548 () Bool)

(assert (=> b!651761 (=> (not res!422548) (not e!374027))))

(assert (=> b!651761 (= res!422548 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18498 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651762 () Bool)

(assert (=> b!651762 (= e!374025 e!374021)))

(declare-fun res!422535 () Bool)

(assert (=> b!651762 (=> (not res!422535) (not e!374021))))

(assert (=> b!651762 (= res!422535 (arrayContainsKey!0 lt!303074 (select (arr!18498 a!2986) j!136) j!136))))

(declare-fun b!651763 () Bool)

(declare-fun res!422537 () Bool)

(assert (=> b!651763 (=> (not res!422537) (not e!374024))))

(assert (=> b!651763 (= res!422537 (validKeyInArray!0 k!1786))))

(declare-fun b!651764 () Bool)

(declare-fun Unit!22259 () Unit!22254)

(assert (=> b!651764 (= e!374031 Unit!22259)))

(assert (= (and start!59090 res!422543) b!651751))

(assert (= (and b!651751 res!422551) b!651743))

(assert (= (and b!651743 res!422552) b!651763))

(assert (= (and b!651763 res!422537) b!651754))

(assert (= (and b!651754 res!422540) b!651745))

(assert (= (and b!651745 res!422534) b!651748))

(assert (= (and b!651748 res!422547) b!651756))

(assert (= (and b!651756 res!422544) b!651761))

(assert (= (and b!651761 res!422548) b!651753))

(assert (= (and b!651753 res!422538) b!651744))

(assert (= (and b!651744 res!422549) b!651757))

(assert (= (and b!651757 res!422536) b!651746))

(assert (= (and b!651757 c!74971) b!651752))

(assert (= (and b!651757 (not c!74971)) b!651747))

(assert (= (and b!651757 (not res!422550)) b!651755))

(assert (= (and b!651755 res!422545) b!651758))

(assert (= (and b!651758 (not res!422546)) b!651762))

(assert (= (and b!651762 res!422535) b!651759))

(assert (= (and b!651755 (not res!422539)) b!651742))

(assert (= (and b!651742 c!74972) b!651750))

(assert (= (and b!651742 (not c!74972)) b!651764))

(assert (= (and b!651742 (not res!422541)) b!651760))

(assert (= (and b!651760 res!422542) b!651749))

(declare-fun m!624893 () Bool)

(assert (=> b!651755 m!624893))

(declare-fun m!624895 () Bool)

(assert (=> b!651755 m!624895))

(declare-fun m!624897 () Bool)

(assert (=> b!651755 m!624897))

(assert (=> b!651743 m!624893))

(assert (=> b!651743 m!624893))

(declare-fun m!624899 () Bool)

(assert (=> b!651743 m!624899))

(assert (=> b!651760 m!624893))

(declare-fun m!624901 () Bool)

(assert (=> b!651760 m!624901))

(declare-fun m!624903 () Bool)

(assert (=> b!651760 m!624903))

(assert (=> b!651760 m!624893))

(declare-fun m!624905 () Bool)

(assert (=> b!651760 m!624905))

(assert (=> b!651760 m!624893))

(declare-fun m!624907 () Bool)

(assert (=> b!651760 m!624907))

(declare-fun m!624909 () Bool)

(assert (=> b!651760 m!624909))

(assert (=> b!651760 m!624893))

(declare-fun m!624911 () Bool)

(assert (=> b!651760 m!624911))

(declare-fun m!624913 () Bool)

(assert (=> b!651760 m!624913))

(declare-fun m!624915 () Bool)

(assert (=> b!651756 m!624915))

(declare-fun m!624917 () Bool)

(assert (=> b!651744 m!624917))

(assert (=> b!651744 m!624893))

(assert (=> b!651744 m!624893))

(declare-fun m!624919 () Bool)

(assert (=> b!651744 m!624919))

(declare-fun m!624921 () Bool)

(assert (=> b!651750 m!624921))

(assert (=> b!651750 m!624893))

(assert (=> b!651750 m!624905))

(assert (=> b!651750 m!624893))

(declare-fun m!624923 () Bool)

(assert (=> b!651750 m!624923))

(assert (=> b!651750 m!624893))

(declare-fun m!624925 () Bool)

(assert (=> b!651750 m!624925))

(assert (=> b!651750 m!624909))

(assert (=> b!651750 m!624893))

(declare-fun m!624927 () Bool)

(assert (=> b!651750 m!624927))

(declare-fun m!624929 () Bool)

(assert (=> b!651750 m!624929))

(assert (=> b!651762 m!624893))

(assert (=> b!651762 m!624893))

(assert (=> b!651762 m!624907))

(assert (=> b!651759 m!624893))

(assert (=> b!651759 m!624893))

(declare-fun m!624931 () Bool)

(assert (=> b!651759 m!624931))

(declare-fun m!624933 () Bool)

(assert (=> b!651754 m!624933))

(declare-fun m!624935 () Bool)

(assert (=> b!651748 m!624935))

(declare-fun m!624937 () Bool)

(assert (=> b!651761 m!624937))

(declare-fun m!624939 () Bool)

(assert (=> b!651745 m!624939))

(assert (=> b!651749 m!624893))

(assert (=> b!651749 m!624893))

(assert (=> b!651749 m!624931))

(declare-fun m!624941 () Bool)

(assert (=> b!651763 m!624941))

(assert (=> b!651758 m!624893))

(declare-fun m!624943 () Bool)

(assert (=> b!651757 m!624943))

(declare-fun m!624945 () Bool)

(assert (=> b!651757 m!624945))

(assert (=> b!651757 m!624895))

(declare-fun m!624947 () Bool)

(assert (=> b!651757 m!624947))

(declare-fun m!624949 () Bool)

(assert (=> b!651757 m!624949))

(assert (=> b!651757 m!624893))

(declare-fun m!624951 () Bool)

(assert (=> b!651757 m!624951))

(declare-fun m!624953 () Bool)

(assert (=> b!651757 m!624953))

(assert (=> b!651757 m!624893))

(declare-fun m!624955 () Bool)

(assert (=> start!59090 m!624955))

(declare-fun m!624957 () Bool)

(assert (=> start!59090 m!624957))

(assert (=> b!651753 m!624895))

(declare-fun m!624959 () Bool)

(assert (=> b!651753 m!624959))

(push 1)

