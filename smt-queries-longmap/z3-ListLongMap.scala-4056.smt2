; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55548 () Bool)

(assert start!55548)

(declare-fun b!607754 () Bool)

(declare-fun e!348038 () Bool)

(declare-fun e!348026 () Bool)

(assert (=> b!607754 (= e!348038 e!348026)))

(declare-fun res!390635 () Bool)

(assert (=> b!607754 (=> (not res!390635) (not e!348026))))

(declare-datatypes ((SeekEntryResult!6334 0))(
  ( (MissingZero!6334 (index!27611 (_ BitVec 32))) (Found!6334 (index!27612 (_ BitVec 32))) (Intermediate!6334 (undefined!7146 Bool) (index!27613 (_ BitVec 32)) (x!56430 (_ BitVec 32))) (Undefined!6334) (MissingVacant!6334 (index!27614 (_ BitVec 32))) )
))
(declare-fun lt!277470 () SeekEntryResult!6334)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!607754 (= res!390635 (or (= lt!277470 (MissingZero!6334 i!1108)) (= lt!277470 (MissingVacant!6334 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37293 0))(
  ( (array!37294 (arr!17897 (Array (_ BitVec 32) (_ BitVec 64))) (size!18262 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37293)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37293 (_ BitVec 32)) SeekEntryResult!6334)

(assert (=> b!607754 (= lt!277470 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607755 () Bool)

(declare-fun e!348028 () Bool)

(declare-fun lt!277466 () SeekEntryResult!6334)

(declare-fun lt!277460 () SeekEntryResult!6334)

(assert (=> b!607755 (= e!348028 (= lt!277466 lt!277460))))

(declare-fun b!607756 () Bool)

(declare-fun e!348036 () Bool)

(declare-fun e!348031 () Bool)

(assert (=> b!607756 (= e!348036 e!348031)))

(declare-fun res!390634 () Bool)

(assert (=> b!607756 (=> res!390634 e!348031)))

(assert (=> b!607756 (= res!390634 (or (bvsge (size!18262 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18262 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277463 () array!37293)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607756 (arrayContainsKey!0 lt!277463 (select (arr!17897 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19386 0))(
  ( (Unit!19387) )
))
(declare-fun lt!277461 () Unit!19386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19386)

(assert (=> b!607756 (= lt!277461 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277463 (select (arr!17897 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348024 () Bool)

(assert (=> b!607756 e!348024))

(declare-fun res!390650 () Bool)

(assert (=> b!607756 (=> (not res!390650) (not e!348024))))

(assert (=> b!607756 (= res!390650 (arrayContainsKey!0 lt!277463 (select (arr!17897 a!2986) j!136) j!136))))

(declare-fun b!607757 () Bool)

(declare-fun res!390632 () Bool)

(assert (=> b!607757 (=> (not res!390632) (not e!348038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607757 (= res!390632 (validKeyInArray!0 k0!1786))))

(declare-fun b!607758 () Bool)

(declare-fun e!348025 () Bool)

(assert (=> b!607758 (= e!348026 e!348025)))

(declare-fun res!390636 () Bool)

(assert (=> b!607758 (=> (not res!390636) (not e!348025))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!607758 (= res!390636 (= (select (store (arr!17897 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607758 (= lt!277463 (array!37294 (store (arr!17897 a!2986) i!1108 k0!1786) (size!18262 a!2986)))))

(declare-fun res!390645 () Bool)

(assert (=> start!55548 (=> (not res!390645) (not e!348038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55548 (= res!390645 (validMask!0 mask!3053))))

(assert (=> start!55548 e!348038))

(assert (=> start!55548 true))

(declare-fun array_inv!13780 (array!37293) Bool)

(assert (=> start!55548 (array_inv!13780 a!2986)))

(declare-fun b!607759 () Bool)

(declare-fun e!348033 () Bool)

(declare-fun e!348034 () Bool)

(assert (=> b!607759 (= e!348033 e!348034)))

(declare-fun res!390646 () Bool)

(assert (=> b!607759 (=> res!390646 e!348034)))

(declare-fun lt!277464 () (_ BitVec 64))

(declare-fun lt!277473 () (_ BitVec 64))

(assert (=> b!607759 (= res!390646 (or (not (= (select (arr!17897 a!2986) j!136) lt!277473)) (not (= (select (arr!17897 a!2986) j!136) lt!277464))))))

(declare-fun e!348029 () Bool)

(assert (=> b!607759 e!348029))

(declare-fun res!390631 () Bool)

(assert (=> b!607759 (=> (not res!390631) (not e!348029))))

(assert (=> b!607759 (= res!390631 (= lt!277464 (select (arr!17897 a!2986) j!136)))))

(assert (=> b!607759 (= lt!277464 (select (store (arr!17897 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607760 () Bool)

(declare-fun res!390649 () Bool)

(assert (=> b!607760 (=> res!390649 e!348031)))

(declare-datatypes ((List!11977 0))(
  ( (Nil!11974) (Cons!11973 (h!13018 (_ BitVec 64)) (t!18196 List!11977)) )
))
(declare-fun contains!2999 (List!11977 (_ BitVec 64)) Bool)

(assert (=> b!607760 (= res!390649 (contains!2999 Nil!11974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607761 () Bool)

(declare-fun res!390648 () Bool)

(assert (=> b!607761 (=> (not res!390648) (not e!348026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37293 (_ BitVec 32)) Bool)

(assert (=> b!607761 (= res!390648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607762 () Bool)

(declare-fun res!390643 () Bool)

(assert (=> b!607762 (=> (not res!390643) (not e!348026))))

(declare-fun arrayNoDuplicates!0 (array!37293 (_ BitVec 32) List!11977) Bool)

(assert (=> b!607762 (= res!390643 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11974))))

(declare-fun b!607763 () Bool)

(assert (=> b!607763 (= e!348034 e!348036)))

(declare-fun res!390647 () Bool)

(assert (=> b!607763 (=> res!390647 e!348036)))

(assert (=> b!607763 (= res!390647 (bvsge index!984 j!136))))

(declare-fun lt!277472 () Unit!19386)

(declare-fun e!348030 () Unit!19386)

(assert (=> b!607763 (= lt!277472 e!348030)))

(declare-fun c!68930 () Bool)

(assert (=> b!607763 (= c!68930 (bvslt j!136 index!984))))

(declare-fun b!607764 () Bool)

(declare-fun res!390640 () Bool)

(assert (=> b!607764 (=> (not res!390640) (not e!348038))))

(assert (=> b!607764 (= res!390640 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607765 () Bool)

(declare-fun res!390633 () Bool)

(assert (=> b!607765 (=> (not res!390633) (not e!348026))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607765 (= res!390633 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17897 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607766 () Bool)

(declare-fun res!390630 () Bool)

(assert (=> b!607766 (=> res!390630 e!348031)))

(declare-fun noDuplicate!326 (List!11977) Bool)

(assert (=> b!607766 (= res!390630 (not (noDuplicate!326 Nil!11974)))))

(declare-fun b!607767 () Bool)

(declare-fun res!390642 () Bool)

(assert (=> b!607767 (=> res!390642 e!348031)))

(assert (=> b!607767 (= res!390642 (contains!2999 Nil!11974 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607768 () Bool)

(declare-fun Unit!19388 () Unit!19386)

(assert (=> b!607768 (= e!348030 Unit!19388)))

(declare-fun lt!277467 () Unit!19386)

(assert (=> b!607768 (= lt!277467 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277463 (select (arr!17897 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607768 (arrayContainsKey!0 lt!277463 (select (arr!17897 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277468 () Unit!19386)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11977) Unit!19386)

(assert (=> b!607768 (= lt!277468 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11974))))

(assert (=> b!607768 (arrayNoDuplicates!0 lt!277463 #b00000000000000000000000000000000 Nil!11974)))

(declare-fun lt!277462 () Unit!19386)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37293 (_ BitVec 32) (_ BitVec 32)) Unit!19386)

(assert (=> b!607768 (= lt!277462 (lemmaNoDuplicateFromThenFromBigger!0 lt!277463 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607768 (arrayNoDuplicates!0 lt!277463 j!136 Nil!11974)))

(declare-fun lt!277474 () Unit!19386)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37293 (_ BitVec 64) (_ BitVec 32) List!11977) Unit!19386)

(assert (=> b!607768 (= lt!277474 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277463 (select (arr!17897 a!2986) j!136) j!136 Nil!11974))))

(assert (=> b!607768 false))

(declare-fun b!607769 () Bool)

(assert (=> b!607769 (= e!348031 true)))

(declare-fun lt!277459 () Bool)

(assert (=> b!607769 (= lt!277459 (contains!2999 Nil!11974 k0!1786))))

(declare-fun b!607770 () Bool)

(declare-fun e!348027 () Bool)

(declare-fun e!348032 () Bool)

(assert (=> b!607770 (= e!348027 e!348032)))

(declare-fun res!390628 () Bool)

(assert (=> b!607770 (=> (not res!390628) (not e!348032))))

(assert (=> b!607770 (= res!390628 (arrayContainsKey!0 lt!277463 (select (arr!17897 a!2986) j!136) j!136))))

(declare-fun b!607771 () Bool)

(declare-fun e!348037 () Unit!19386)

(declare-fun Unit!19389 () Unit!19386)

(assert (=> b!607771 (= e!348037 Unit!19389)))

(assert (=> b!607771 false))

(declare-fun b!607772 () Bool)

(assert (=> b!607772 (= e!348029 e!348027)))

(declare-fun res!390644 () Bool)

(assert (=> b!607772 (=> res!390644 e!348027)))

(assert (=> b!607772 (= res!390644 (or (not (= (select (arr!17897 a!2986) j!136) lt!277473)) (not (= (select (arr!17897 a!2986) j!136) lt!277464)) (bvsge j!136 index!984)))))

(declare-fun b!607773 () Bool)

(declare-fun Unit!19390 () Unit!19386)

(assert (=> b!607773 (= e!348037 Unit!19390)))

(declare-fun b!607774 () Bool)

(declare-fun res!390629 () Bool)

(assert (=> b!607774 (=> (not res!390629) (not e!348038))))

(assert (=> b!607774 (= res!390629 (and (= (size!18262 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18262 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18262 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607775 () Bool)

(declare-fun e!348035 () Bool)

(assert (=> b!607775 (= e!348025 e!348035)))

(declare-fun res!390637 () Bool)

(assert (=> b!607775 (=> (not res!390637) (not e!348035))))

(assert (=> b!607775 (= res!390637 (and (= lt!277466 (Found!6334 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17897 a!2986) index!984) (select (arr!17897 a!2986) j!136))) (not (= (select (arr!17897 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37293 (_ BitVec 32)) SeekEntryResult!6334)

(assert (=> b!607775 (= lt!277466 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17897 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607776 () Bool)

(assert (=> b!607776 (= e!348032 (arrayContainsKey!0 lt!277463 (select (arr!17897 a!2986) j!136) index!984))))

(declare-fun b!607777 () Bool)

(assert (=> b!607777 (= e!348024 (arrayContainsKey!0 lt!277463 (select (arr!17897 a!2986) j!136) index!984))))

(declare-fun b!607778 () Bool)

(declare-fun res!390638 () Bool)

(assert (=> b!607778 (=> (not res!390638) (not e!348038))))

(assert (=> b!607778 (= res!390638 (validKeyInArray!0 (select (arr!17897 a!2986) j!136)))))

(declare-fun b!607779 () Bool)

(declare-fun Unit!19391 () Unit!19386)

(assert (=> b!607779 (= e!348030 Unit!19391)))

(declare-fun b!607780 () Bool)

(assert (=> b!607780 (= e!348035 (not e!348033))))

(declare-fun res!390639 () Bool)

(assert (=> b!607780 (=> res!390639 e!348033)))

(declare-fun lt!277458 () SeekEntryResult!6334)

(assert (=> b!607780 (= res!390639 (not (= lt!277458 (Found!6334 index!984))))))

(declare-fun lt!277465 () Unit!19386)

(assert (=> b!607780 (= lt!277465 e!348037)))

(declare-fun c!68931 () Bool)

(assert (=> b!607780 (= c!68931 (= lt!277458 Undefined!6334))))

(assert (=> b!607780 (= lt!277458 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277473 lt!277463 mask!3053))))

(assert (=> b!607780 e!348028))

(declare-fun res!390641 () Bool)

(assert (=> b!607780 (=> (not res!390641) (not e!348028))))

(declare-fun lt!277469 () (_ BitVec 32))

(assert (=> b!607780 (= res!390641 (= lt!277460 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277469 vacantSpotIndex!68 lt!277473 lt!277463 mask!3053)))))

(assert (=> b!607780 (= lt!277460 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277469 vacantSpotIndex!68 (select (arr!17897 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607780 (= lt!277473 (select (store (arr!17897 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277471 () Unit!19386)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19386)

(assert (=> b!607780 (= lt!277471 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277469 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607780 (= lt!277469 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55548 res!390645) b!607774))

(assert (= (and b!607774 res!390629) b!607778))

(assert (= (and b!607778 res!390638) b!607757))

(assert (= (and b!607757 res!390632) b!607764))

(assert (= (and b!607764 res!390640) b!607754))

(assert (= (and b!607754 res!390635) b!607761))

(assert (= (and b!607761 res!390648) b!607762))

(assert (= (and b!607762 res!390643) b!607765))

(assert (= (and b!607765 res!390633) b!607758))

(assert (= (and b!607758 res!390636) b!607775))

(assert (= (and b!607775 res!390637) b!607780))

(assert (= (and b!607780 res!390641) b!607755))

(assert (= (and b!607780 c!68931) b!607771))

(assert (= (and b!607780 (not c!68931)) b!607773))

(assert (= (and b!607780 (not res!390639)) b!607759))

(assert (= (and b!607759 res!390631) b!607772))

(assert (= (and b!607772 (not res!390644)) b!607770))

(assert (= (and b!607770 res!390628) b!607776))

(assert (= (and b!607759 (not res!390646)) b!607763))

(assert (= (and b!607763 c!68930) b!607768))

(assert (= (and b!607763 (not c!68930)) b!607779))

(assert (= (and b!607763 (not res!390647)) b!607756))

(assert (= (and b!607756 res!390650) b!607777))

(assert (= (and b!607756 (not res!390634)) b!607766))

(assert (= (and b!607766 (not res!390630)) b!607760))

(assert (= (and b!607760 (not res!390649)) b!607767))

(assert (= (and b!607767 (not res!390642)) b!607769))

(declare-fun m!583927 () Bool)

(assert (=> b!607769 m!583927))

(declare-fun m!583929 () Bool)

(assert (=> b!607772 m!583929))

(assert (=> b!607777 m!583929))

(assert (=> b!607777 m!583929))

(declare-fun m!583931 () Bool)

(assert (=> b!607777 m!583931))

(assert (=> b!607778 m!583929))

(assert (=> b!607778 m!583929))

(declare-fun m!583933 () Bool)

(assert (=> b!607778 m!583933))

(declare-fun m!583935 () Bool)

(assert (=> b!607758 m!583935))

(declare-fun m!583937 () Bool)

(assert (=> b!607758 m!583937))

(declare-fun m!583939 () Bool)

(assert (=> b!607775 m!583939))

(assert (=> b!607775 m!583929))

(assert (=> b!607775 m!583929))

(declare-fun m!583941 () Bool)

(assert (=> b!607775 m!583941))

(declare-fun m!583943 () Bool)

(assert (=> b!607765 m!583943))

(declare-fun m!583945 () Bool)

(assert (=> b!607761 m!583945))

(assert (=> b!607770 m!583929))

(assert (=> b!607770 m!583929))

(declare-fun m!583947 () Bool)

(assert (=> b!607770 m!583947))

(declare-fun m!583949 () Bool)

(assert (=> start!55548 m!583949))

(declare-fun m!583951 () Bool)

(assert (=> start!55548 m!583951))

(declare-fun m!583953 () Bool)

(assert (=> b!607780 m!583953))

(declare-fun m!583955 () Bool)

(assert (=> b!607780 m!583955))

(assert (=> b!607780 m!583929))

(assert (=> b!607780 m!583935))

(declare-fun m!583957 () Bool)

(assert (=> b!607780 m!583957))

(declare-fun m!583959 () Bool)

(assert (=> b!607780 m!583959))

(assert (=> b!607780 m!583929))

(declare-fun m!583961 () Bool)

(assert (=> b!607780 m!583961))

(declare-fun m!583963 () Bool)

(assert (=> b!607780 m!583963))

(assert (=> b!607776 m!583929))

(assert (=> b!607776 m!583929))

(assert (=> b!607776 m!583931))

(declare-fun m!583965 () Bool)

(assert (=> b!607754 m!583965))

(declare-fun m!583967 () Bool)

(assert (=> b!607768 m!583967))

(declare-fun m!583969 () Bool)

(assert (=> b!607768 m!583969))

(assert (=> b!607768 m!583929))

(declare-fun m!583971 () Bool)

(assert (=> b!607768 m!583971))

(assert (=> b!607768 m!583929))

(declare-fun m!583973 () Bool)

(assert (=> b!607768 m!583973))

(assert (=> b!607768 m!583929))

(declare-fun m!583975 () Bool)

(assert (=> b!607768 m!583975))

(assert (=> b!607768 m!583929))

(declare-fun m!583977 () Bool)

(assert (=> b!607768 m!583977))

(declare-fun m!583979 () Bool)

(assert (=> b!607768 m!583979))

(declare-fun m!583981 () Bool)

(assert (=> b!607762 m!583981))

(declare-fun m!583983 () Bool)

(assert (=> b!607767 m!583983))

(declare-fun m!583985 () Bool)

(assert (=> b!607764 m!583985))

(assert (=> b!607759 m!583929))

(assert (=> b!607759 m!583935))

(declare-fun m!583987 () Bool)

(assert (=> b!607759 m!583987))

(assert (=> b!607756 m!583929))

(assert (=> b!607756 m!583929))

(declare-fun m!583989 () Bool)

(assert (=> b!607756 m!583989))

(assert (=> b!607756 m!583929))

(declare-fun m!583991 () Bool)

(assert (=> b!607756 m!583991))

(assert (=> b!607756 m!583929))

(assert (=> b!607756 m!583947))

(declare-fun m!583993 () Bool)

(assert (=> b!607760 m!583993))

(declare-fun m!583995 () Bool)

(assert (=> b!607757 m!583995))

(declare-fun m!583997 () Bool)

(assert (=> b!607766 m!583997))

(check-sat (not b!607754) (not b!607761) (not b!607762) (not b!607768) (not b!607760) (not b!607780) (not b!607756) (not b!607776) (not b!607777) (not b!607766) (not b!607778) (not b!607770) (not b!607764) (not b!607767) (not b!607757) (not start!55548) (not b!607775) (not b!607769))
(check-sat)
