; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56160 () Bool)

(assert start!56160)

(declare-fun b!619657 () Bool)

(declare-fun e!355390 () Bool)

(declare-fun e!355400 () Bool)

(assert (=> b!619657 (= e!355390 e!355400)))

(declare-fun res!399235 () Bool)

(assert (=> b!619657 (=> (not res!399235) (not e!355400))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6427 0))(
  ( (MissingZero!6427 (index!27992 (_ BitVec 32))) (Found!6427 (index!27993 (_ BitVec 32))) (Intermediate!6427 (undefined!7239 Bool) (index!27994 (_ BitVec 32)) (x!56926 (_ BitVec 32))) (Undefined!6427) (MissingVacant!6427 (index!27995 (_ BitVec 32))) )
))
(declare-fun lt!286022 () SeekEntryResult!6427)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37575 0))(
  ( (array!37576 (arr!18031 (Array (_ BitVec 32) (_ BitVec 64))) (size!18395 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37575)

(assert (=> b!619657 (= res!399235 (and (= lt!286022 (Found!6427 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18031 a!2986) index!984) (select (arr!18031 a!2986) j!136))) (not (= (select (arr!18031 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37575 (_ BitVec 32)) SeekEntryResult!6427)

(assert (=> b!619657 (= lt!286022 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18031 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619658 () Bool)

(declare-fun res!399243 () Bool)

(declare-fun e!355389 () Bool)

(assert (=> b!619658 (=> (not res!399243) (not e!355389))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619658 (= res!399243 (validKeyInArray!0 k0!1786))))

(declare-fun b!619659 () Bool)

(declare-fun lt!286033 () array!37575)

(declare-fun e!355387 () Bool)

(declare-fun arrayContainsKey!0 (array!37575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619659 (= e!355387 (arrayContainsKey!0 lt!286033 (select (arr!18031 a!2986) j!136) index!984))))

(declare-fun res!399248 () Bool)

(assert (=> start!56160 (=> (not res!399248) (not e!355389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56160 (= res!399248 (validMask!0 mask!3053))))

(assert (=> start!56160 e!355389))

(assert (=> start!56160 true))

(declare-fun array_inv!13890 (array!37575) Bool)

(assert (=> start!56160 (array_inv!13890 a!2986)))

(declare-fun b!619660 () Bool)

(declare-datatypes ((Unit!20467 0))(
  ( (Unit!20468) )
))
(declare-fun e!355388 () Unit!20467)

(declare-fun Unit!20469 () Unit!20467)

(assert (=> b!619660 (= e!355388 Unit!20469)))

(declare-fun b!619661 () Bool)

(declare-fun res!399244 () Bool)

(declare-fun e!355397 () Bool)

(assert (=> b!619661 (=> (not res!399244) (not e!355397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37575 (_ BitVec 32)) Bool)

(assert (=> b!619661 (= res!399244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619662 () Bool)

(declare-fun e!355398 () Bool)

(declare-fun lt!286026 () SeekEntryResult!6427)

(assert (=> b!619662 (= e!355398 (= lt!286022 lt!286026))))

(declare-fun b!619663 () Bool)

(assert (=> b!619663 (= e!355389 e!355397)))

(declare-fun res!399247 () Bool)

(assert (=> b!619663 (=> (not res!399247) (not e!355397))))

(declare-fun lt!286028 () SeekEntryResult!6427)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!619663 (= res!399247 (or (= lt!286028 (MissingZero!6427 i!1108)) (= lt!286028 (MissingVacant!6427 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37575 (_ BitVec 32)) SeekEntryResult!6427)

(assert (=> b!619663 (= lt!286028 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619664 () Bool)

(declare-fun e!355399 () Unit!20467)

(declare-fun Unit!20470 () Unit!20467)

(assert (=> b!619664 (= e!355399 Unit!20470)))

(declare-fun b!619665 () Bool)

(assert (=> b!619665 (= e!355397 e!355390)))

(declare-fun res!399249 () Bool)

(assert (=> b!619665 (=> (not res!399249) (not e!355390))))

(assert (=> b!619665 (= res!399249 (= (select (store (arr!18031 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619665 (= lt!286033 (array!37576 (store (arr!18031 a!2986) i!1108 k0!1786) (size!18395 a!2986)))))

(declare-fun b!619666 () Bool)

(declare-fun res!399241 () Bool)

(assert (=> b!619666 (=> (not res!399241) (not e!355389))))

(assert (=> b!619666 (= res!399241 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619667 () Bool)

(declare-fun Unit!20471 () Unit!20467)

(assert (=> b!619667 (= e!355388 Unit!20471)))

(assert (=> b!619667 false))

(declare-fun b!619668 () Bool)

(declare-fun res!399246 () Bool)

(assert (=> b!619668 (=> (not res!399246) (not e!355397))))

(declare-datatypes ((List!11979 0))(
  ( (Nil!11976) (Cons!11975 (h!13023 (_ BitVec 64)) (t!18199 List!11979)) )
))
(declare-fun arrayNoDuplicates!0 (array!37575 (_ BitVec 32) List!11979) Bool)

(assert (=> b!619668 (= res!399246 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11976))))

(declare-fun b!619669 () Bool)

(declare-fun e!355393 () Unit!20467)

(declare-fun Unit!20472 () Unit!20467)

(assert (=> b!619669 (= e!355393 Unit!20472)))

(declare-fun b!619670 () Bool)

(declare-fun e!355391 () Bool)

(assert (=> b!619670 (= e!355391 true)))

(assert (=> b!619670 (= (select (store (arr!18031 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619671 () Bool)

(declare-fun Unit!20473 () Unit!20467)

(assert (=> b!619671 (= e!355399 Unit!20473)))

(declare-fun res!399234 () Bool)

(assert (=> b!619671 (= res!399234 (= (select (store (arr!18031 a!2986) i!1108 k0!1786) index!984) (select (arr!18031 a!2986) j!136)))))

(declare-fun e!355392 () Bool)

(assert (=> b!619671 (=> (not res!399234) (not e!355392))))

(assert (=> b!619671 e!355392))

(declare-fun c!70583 () Bool)

(assert (=> b!619671 (= c!70583 (bvslt j!136 index!984))))

(declare-fun lt!286039 () Unit!20467)

(declare-fun e!355401 () Unit!20467)

(assert (=> b!619671 (= lt!286039 e!355401)))

(declare-fun c!70581 () Bool)

(assert (=> b!619671 (= c!70581 (bvslt index!984 j!136))))

(declare-fun lt!286025 () Unit!20467)

(assert (=> b!619671 (= lt!286025 e!355393)))

(assert (=> b!619671 false))

(declare-fun b!619672 () Bool)

(declare-fun res!399245 () Bool)

(assert (=> b!619672 (=> (not res!399245) (not e!355389))))

(assert (=> b!619672 (= res!399245 (validKeyInArray!0 (select (arr!18031 a!2986) j!136)))))

(declare-fun b!619673 () Bool)

(declare-fun res!399242 () Bool)

(assert (=> b!619673 (=> (not res!399242) (not e!355397))))

(assert (=> b!619673 (= res!399242 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18031 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619674 () Bool)

(declare-fun res!399240 () Bool)

(assert (=> b!619674 (= res!399240 (bvsge j!136 index!984))))

(declare-fun e!355394 () Bool)

(assert (=> b!619674 (=> res!399240 e!355394)))

(assert (=> b!619674 (= e!355392 e!355394)))

(declare-fun b!619675 () Bool)

(assert (=> b!619675 (= e!355400 (not e!355391))))

(declare-fun res!399238 () Bool)

(assert (=> b!619675 (=> res!399238 e!355391)))

(declare-fun lt!286024 () SeekEntryResult!6427)

(assert (=> b!619675 (= res!399238 (not (= lt!286024 (MissingVacant!6427 vacantSpotIndex!68))))))

(declare-fun lt!286032 () Unit!20467)

(assert (=> b!619675 (= lt!286032 e!355399)))

(declare-fun c!70580 () Bool)

(assert (=> b!619675 (= c!70580 (= lt!286024 (Found!6427 index!984)))))

(declare-fun lt!286021 () Unit!20467)

(assert (=> b!619675 (= lt!286021 e!355388)))

(declare-fun c!70582 () Bool)

(assert (=> b!619675 (= c!70582 (= lt!286024 Undefined!6427))))

(declare-fun lt!286030 () (_ BitVec 64))

(assert (=> b!619675 (= lt!286024 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286030 lt!286033 mask!3053))))

(assert (=> b!619675 e!355398))

(declare-fun res!399239 () Bool)

(assert (=> b!619675 (=> (not res!399239) (not e!355398))))

(declare-fun lt!286038 () (_ BitVec 32))

(assert (=> b!619675 (= res!399239 (= lt!286026 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286038 vacantSpotIndex!68 lt!286030 lt!286033 mask!3053)))))

(assert (=> b!619675 (= lt!286026 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286038 vacantSpotIndex!68 (select (arr!18031 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619675 (= lt!286030 (select (store (arr!18031 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286031 () Unit!20467)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37575 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20467)

(assert (=> b!619675 (= lt!286031 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286038 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619675 (= lt!286038 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!619676 () Bool)

(assert (=> b!619676 false))

(declare-fun lt!286027 () Unit!20467)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37575 (_ BitVec 64) (_ BitVec 32) List!11979) Unit!20467)

(assert (=> b!619676 (= lt!286027 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286033 (select (arr!18031 a!2986) j!136) index!984 Nil!11976))))

(assert (=> b!619676 (arrayNoDuplicates!0 lt!286033 index!984 Nil!11976)))

(declare-fun lt!286020 () Unit!20467)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37575 (_ BitVec 32) (_ BitVec 32)) Unit!20467)

(assert (=> b!619676 (= lt!286020 (lemmaNoDuplicateFromThenFromBigger!0 lt!286033 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619676 (arrayNoDuplicates!0 lt!286033 #b00000000000000000000000000000000 Nil!11976)))

(declare-fun lt!286035 () Unit!20467)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11979) Unit!20467)

(assert (=> b!619676 (= lt!286035 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11976))))

(assert (=> b!619676 (arrayContainsKey!0 lt!286033 (select (arr!18031 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286029 () Unit!20467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20467)

(assert (=> b!619676 (= lt!286029 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286033 (select (arr!18031 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355396 () Bool)

(assert (=> b!619676 e!355396))

(declare-fun res!399236 () Bool)

(assert (=> b!619676 (=> (not res!399236) (not e!355396))))

(assert (=> b!619676 (= res!399236 (arrayContainsKey!0 lt!286033 (select (arr!18031 a!2986) j!136) j!136))))

(declare-fun Unit!20474 () Unit!20467)

(assert (=> b!619676 (= e!355393 Unit!20474)))

(declare-fun b!619677 () Bool)

(declare-fun Unit!20475 () Unit!20467)

(assert (=> b!619677 (= e!355401 Unit!20475)))

(declare-fun b!619678 () Bool)

(assert (=> b!619678 (= e!355396 (arrayContainsKey!0 lt!286033 (select (arr!18031 a!2986) j!136) index!984))))

(declare-fun res!399237 () Bool)

(declare-fun b!619679 () Bool)

(assert (=> b!619679 (= res!399237 (arrayContainsKey!0 lt!286033 (select (arr!18031 a!2986) j!136) j!136))))

(assert (=> b!619679 (=> (not res!399237) (not e!355387))))

(assert (=> b!619679 (= e!355394 e!355387)))

(declare-fun b!619680 () Bool)

(declare-fun res!399250 () Bool)

(assert (=> b!619680 (=> (not res!399250) (not e!355389))))

(assert (=> b!619680 (= res!399250 (and (= (size!18395 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18395 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18395 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619681 () Bool)

(assert (=> b!619681 false))

(declare-fun lt!286034 () Unit!20467)

(assert (=> b!619681 (= lt!286034 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286033 (select (arr!18031 a!2986) j!136) j!136 Nil!11976))))

(assert (=> b!619681 (arrayNoDuplicates!0 lt!286033 j!136 Nil!11976)))

(declare-fun lt!286037 () Unit!20467)

(assert (=> b!619681 (= lt!286037 (lemmaNoDuplicateFromThenFromBigger!0 lt!286033 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619681 (arrayNoDuplicates!0 lt!286033 #b00000000000000000000000000000000 Nil!11976)))

(declare-fun lt!286036 () Unit!20467)

(assert (=> b!619681 (= lt!286036 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11976))))

(assert (=> b!619681 (arrayContainsKey!0 lt!286033 (select (arr!18031 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286023 () Unit!20467)

(assert (=> b!619681 (= lt!286023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286033 (select (arr!18031 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20476 () Unit!20467)

(assert (=> b!619681 (= e!355401 Unit!20476)))

(assert (= (and start!56160 res!399248) b!619680))

(assert (= (and b!619680 res!399250) b!619672))

(assert (= (and b!619672 res!399245) b!619658))

(assert (= (and b!619658 res!399243) b!619666))

(assert (= (and b!619666 res!399241) b!619663))

(assert (= (and b!619663 res!399247) b!619661))

(assert (= (and b!619661 res!399244) b!619668))

(assert (= (and b!619668 res!399246) b!619673))

(assert (= (and b!619673 res!399242) b!619665))

(assert (= (and b!619665 res!399249) b!619657))

(assert (= (and b!619657 res!399235) b!619675))

(assert (= (and b!619675 res!399239) b!619662))

(assert (= (and b!619675 c!70582) b!619667))

(assert (= (and b!619675 (not c!70582)) b!619660))

(assert (= (and b!619675 c!70580) b!619671))

(assert (= (and b!619675 (not c!70580)) b!619664))

(assert (= (and b!619671 res!399234) b!619674))

(assert (= (and b!619674 (not res!399240)) b!619679))

(assert (= (and b!619679 res!399237) b!619659))

(assert (= (and b!619671 c!70583) b!619681))

(assert (= (and b!619671 (not c!70583)) b!619677))

(assert (= (and b!619671 c!70581) b!619676))

(assert (= (and b!619671 (not c!70581)) b!619669))

(assert (= (and b!619676 res!399236) b!619678))

(assert (= (and b!619675 (not res!399238)) b!619670))

(declare-fun m!595907 () Bool)

(assert (=> b!619658 m!595907))

(declare-fun m!595909 () Bool)

(assert (=> b!619665 m!595909))

(declare-fun m!595911 () Bool)

(assert (=> b!619665 m!595911))

(declare-fun m!595913 () Bool)

(assert (=> b!619661 m!595913))

(declare-fun m!595915 () Bool)

(assert (=> b!619681 m!595915))

(assert (=> b!619681 m!595915))

(declare-fun m!595917 () Bool)

(assert (=> b!619681 m!595917))

(declare-fun m!595919 () Bool)

(assert (=> b!619681 m!595919))

(assert (=> b!619681 m!595915))

(declare-fun m!595921 () Bool)

(assert (=> b!619681 m!595921))

(declare-fun m!595923 () Bool)

(assert (=> b!619681 m!595923))

(assert (=> b!619681 m!595915))

(declare-fun m!595925 () Bool)

(assert (=> b!619681 m!595925))

(declare-fun m!595927 () Bool)

(assert (=> b!619681 m!595927))

(declare-fun m!595929 () Bool)

(assert (=> b!619681 m!595929))

(assert (=> b!619659 m!595915))

(assert (=> b!619659 m!595915))

(declare-fun m!595931 () Bool)

(assert (=> b!619659 m!595931))

(assert (=> b!619678 m!595915))

(assert (=> b!619678 m!595915))

(assert (=> b!619678 m!595931))

(declare-fun m!595933 () Bool)

(assert (=> b!619666 m!595933))

(declare-fun m!595935 () Bool)

(assert (=> b!619663 m!595935))

(assert (=> b!619670 m!595909))

(declare-fun m!595937 () Bool)

(assert (=> b!619670 m!595937))

(assert (=> b!619679 m!595915))

(assert (=> b!619679 m!595915))

(declare-fun m!595939 () Bool)

(assert (=> b!619679 m!595939))

(assert (=> b!619671 m!595909))

(assert (=> b!619671 m!595937))

(assert (=> b!619671 m!595915))

(declare-fun m!595941 () Bool)

(assert (=> b!619657 m!595941))

(assert (=> b!619657 m!595915))

(assert (=> b!619657 m!595915))

(declare-fun m!595943 () Bool)

(assert (=> b!619657 m!595943))

(assert (=> b!619672 m!595915))

(assert (=> b!619672 m!595915))

(declare-fun m!595945 () Bool)

(assert (=> b!619672 m!595945))

(assert (=> b!619676 m!595915))

(declare-fun m!595947 () Bool)

(assert (=> b!619676 m!595947))

(assert (=> b!619676 m!595915))

(declare-fun m!595949 () Bool)

(assert (=> b!619676 m!595949))

(declare-fun m!595951 () Bool)

(assert (=> b!619676 m!595951))

(assert (=> b!619676 m!595923))

(assert (=> b!619676 m!595915))

(declare-fun m!595953 () Bool)

(assert (=> b!619676 m!595953))

(declare-fun m!595955 () Bool)

(assert (=> b!619676 m!595955))

(assert (=> b!619676 m!595929))

(assert (=> b!619676 m!595915))

(assert (=> b!619676 m!595939))

(assert (=> b!619676 m!595915))

(declare-fun m!595957 () Bool)

(assert (=> b!619673 m!595957))

(declare-fun m!595959 () Bool)

(assert (=> b!619668 m!595959))

(declare-fun m!595961 () Bool)

(assert (=> b!619675 m!595961))

(declare-fun m!595963 () Bool)

(assert (=> b!619675 m!595963))

(assert (=> b!619675 m!595915))

(declare-fun m!595965 () Bool)

(assert (=> b!619675 m!595965))

(assert (=> b!619675 m!595909))

(declare-fun m!595967 () Bool)

(assert (=> b!619675 m!595967))

(declare-fun m!595969 () Bool)

(assert (=> b!619675 m!595969))

(assert (=> b!619675 m!595915))

(declare-fun m!595971 () Bool)

(assert (=> b!619675 m!595971))

(declare-fun m!595973 () Bool)

(assert (=> start!56160 m!595973))

(declare-fun m!595975 () Bool)

(assert (=> start!56160 m!595975))

(check-sat (not b!619661) (not b!619675) (not b!619666) (not b!619678) (not b!619672) (not b!619676) (not b!619681) (not b!619663) (not b!619658) (not b!619659) (not b!619679) (not b!619668) (not b!619657) (not start!56160))
(check-sat)
