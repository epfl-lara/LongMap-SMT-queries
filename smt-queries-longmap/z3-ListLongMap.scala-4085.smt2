; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56010 () Bool)

(assert start!56010)

(declare-fun b!615720 () Bool)

(declare-datatypes ((Unit!19988 0))(
  ( (Unit!19989) )
))
(declare-fun e!353030 () Unit!19988)

(declare-fun Unit!19990 () Unit!19988)

(assert (=> b!615720 (= e!353030 Unit!19990)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!396604 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37480 0))(
  ( (array!37481 (arr!17986 (Array (_ BitVec 32) (_ BitVec 64))) (size!18350 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37480)

(assert (=> b!615720 (= res!396604 (= (select (store (arr!17986 a!2986) i!1108 k0!1786) index!984) (select (arr!17986 a!2986) j!136)))))

(declare-fun e!353032 () Bool)

(assert (=> b!615720 (=> (not res!396604) (not e!353032))))

(assert (=> b!615720 e!353032))

(declare-fun c!69929 () Bool)

(assert (=> b!615720 (= c!69929 (bvslt j!136 index!984))))

(declare-fun lt!282927 () Unit!19988)

(declare-fun e!353035 () Unit!19988)

(assert (=> b!615720 (= lt!282927 e!353035)))

(declare-fun c!69926 () Bool)

(assert (=> b!615720 (= c!69926 (bvslt index!984 j!136))))

(declare-fun lt!282934 () Unit!19988)

(declare-fun e!353041 () Unit!19988)

(assert (=> b!615720 (= lt!282934 e!353041)))

(assert (=> b!615720 false))

(declare-fun b!615721 () Bool)

(declare-fun Unit!19991 () Unit!19988)

(assert (=> b!615721 (= e!353035 Unit!19991)))

(declare-fun b!615722 () Bool)

(declare-fun e!353031 () Bool)

(declare-datatypes ((SeekEntryResult!6426 0))(
  ( (MissingZero!6426 (index!27988 (_ BitVec 32))) (Found!6426 (index!27989 (_ BitVec 32))) (Intermediate!6426 (undefined!7238 Bool) (index!27990 (_ BitVec 32)) (x!56786 (_ BitVec 32))) (Undefined!6426) (MissingVacant!6426 (index!27991 (_ BitVec 32))) )
))
(declare-fun lt!282924 () SeekEntryResult!6426)

(declare-fun lt!282918 () SeekEntryResult!6426)

(assert (=> b!615722 (= e!353031 (= lt!282924 lt!282918))))

(declare-fun b!615723 () Bool)

(declare-fun res!396606 () Bool)

(assert (=> b!615723 (= res!396606 (bvsge j!136 index!984))))

(declare-fun e!353034 () Bool)

(assert (=> b!615723 (=> res!396606 e!353034)))

(assert (=> b!615723 (= e!353032 e!353034)))

(declare-fun res!396611 () Bool)

(declare-fun e!353033 () Bool)

(assert (=> start!56010 (=> (not res!396611) (not e!353033))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56010 (= res!396611 (validMask!0 mask!3053))))

(assert (=> start!56010 e!353033))

(assert (=> start!56010 true))

(declare-fun array_inv!13782 (array!37480) Bool)

(assert (=> start!56010 (array_inv!13782 a!2986)))

(declare-fun b!615724 () Bool)

(declare-fun e!353042 () Unit!19988)

(declare-fun Unit!19992 () Unit!19988)

(assert (=> b!615724 (= e!353042 Unit!19992)))

(assert (=> b!615724 false))

(declare-fun b!615725 () Bool)

(declare-fun lt!282923 () array!37480)

(declare-fun e!353038 () Bool)

(declare-fun arrayContainsKey!0 (array!37480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615725 (= e!353038 (arrayContainsKey!0 lt!282923 (select (arr!17986 a!2986) j!136) index!984))))

(declare-fun b!615726 () Bool)

(declare-fun e!353040 () Bool)

(assert (=> b!615726 (= e!353040 (not true))))

(declare-fun lt!282920 () Unit!19988)

(assert (=> b!615726 (= lt!282920 e!353030)))

(declare-fun c!69928 () Bool)

(declare-fun lt!282928 () SeekEntryResult!6426)

(assert (=> b!615726 (= c!69928 (= lt!282928 (Found!6426 index!984)))))

(declare-fun lt!282925 () Unit!19988)

(assert (=> b!615726 (= lt!282925 e!353042)))

(declare-fun c!69927 () Bool)

(assert (=> b!615726 (= c!69927 (= lt!282928 Undefined!6426))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282933 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37480 (_ BitVec 32)) SeekEntryResult!6426)

(assert (=> b!615726 (= lt!282928 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282933 lt!282923 mask!3053))))

(assert (=> b!615726 e!353031))

(declare-fun res!396615 () Bool)

(assert (=> b!615726 (=> (not res!396615) (not e!353031))))

(declare-fun lt!282936 () (_ BitVec 32))

(assert (=> b!615726 (= res!396615 (= lt!282918 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282936 vacantSpotIndex!68 lt!282933 lt!282923 mask!3053)))))

(assert (=> b!615726 (= lt!282918 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282936 vacantSpotIndex!68 (select (arr!17986 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615726 (= lt!282933 (select (store (arr!17986 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282921 () Unit!19988)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19988)

(assert (=> b!615726 (= lt!282921 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282936 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615726 (= lt!282936 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615727 () Bool)

(declare-fun res!396614 () Bool)

(declare-fun e!353037 () Bool)

(assert (=> b!615727 (=> (not res!396614) (not e!353037))))

(assert (=> b!615727 (= res!396614 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17986 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615728 () Bool)

(declare-fun res!396608 () Bool)

(assert (=> b!615728 (=> (not res!396608) (not e!353033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615728 (= res!396608 (validKeyInArray!0 (select (arr!17986 a!2986) j!136)))))

(declare-fun b!615729 () Bool)

(assert (=> b!615729 false))

(declare-fun lt!282930 () Unit!19988)

(declare-datatypes ((List!12027 0))(
  ( (Nil!12024) (Cons!12023 (h!13068 (_ BitVec 64)) (t!18255 List!12027)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37480 (_ BitVec 64) (_ BitVec 32) List!12027) Unit!19988)

(assert (=> b!615729 (= lt!282930 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282923 (select (arr!17986 a!2986) j!136) j!136 Nil!12024))))

(declare-fun arrayNoDuplicates!0 (array!37480 (_ BitVec 32) List!12027) Bool)

(assert (=> b!615729 (arrayNoDuplicates!0 lt!282923 j!136 Nil!12024)))

(declare-fun lt!282937 () Unit!19988)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37480 (_ BitVec 32) (_ BitVec 32)) Unit!19988)

(assert (=> b!615729 (= lt!282937 (lemmaNoDuplicateFromThenFromBigger!0 lt!282923 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615729 (arrayNoDuplicates!0 lt!282923 #b00000000000000000000000000000000 Nil!12024)))

(declare-fun lt!282931 () Unit!19988)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37480 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12027) Unit!19988)

(assert (=> b!615729 (= lt!282931 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12024))))

(assert (=> b!615729 (arrayContainsKey!0 lt!282923 (select (arr!17986 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282932 () Unit!19988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37480 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19988)

(assert (=> b!615729 (= lt!282932 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282923 (select (arr!17986 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19993 () Unit!19988)

(assert (=> b!615729 (= e!353035 Unit!19993)))

(declare-fun b!615730 () Bool)

(declare-fun Unit!19994 () Unit!19988)

(assert (=> b!615730 (= e!353041 Unit!19994)))

(declare-fun b!615731 () Bool)

(declare-fun res!396610 () Bool)

(assert (=> b!615731 (=> (not res!396610) (not e!353037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37480 (_ BitVec 32)) Bool)

(assert (=> b!615731 (= res!396610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615732 () Bool)

(declare-fun res!396605 () Bool)

(assert (=> b!615732 (=> (not res!396605) (not e!353033))))

(assert (=> b!615732 (= res!396605 (validKeyInArray!0 k0!1786))))

(declare-fun e!353039 () Bool)

(declare-fun b!615733 () Bool)

(assert (=> b!615733 (= e!353039 (arrayContainsKey!0 lt!282923 (select (arr!17986 a!2986) j!136) index!984))))

(declare-fun b!615734 () Bool)

(assert (=> b!615734 false))

(declare-fun lt!282929 () Unit!19988)

(assert (=> b!615734 (= lt!282929 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282923 (select (arr!17986 a!2986) j!136) index!984 Nil!12024))))

(assert (=> b!615734 (arrayNoDuplicates!0 lt!282923 index!984 Nil!12024)))

(declare-fun lt!282926 () Unit!19988)

(assert (=> b!615734 (= lt!282926 (lemmaNoDuplicateFromThenFromBigger!0 lt!282923 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615734 (arrayNoDuplicates!0 lt!282923 #b00000000000000000000000000000000 Nil!12024)))

(declare-fun lt!282919 () Unit!19988)

(assert (=> b!615734 (= lt!282919 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12024))))

(assert (=> b!615734 (arrayContainsKey!0 lt!282923 (select (arr!17986 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282922 () Unit!19988)

(assert (=> b!615734 (= lt!282922 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282923 (select (arr!17986 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615734 e!353039))

(declare-fun res!396617 () Bool)

(assert (=> b!615734 (=> (not res!396617) (not e!353039))))

(assert (=> b!615734 (= res!396617 (arrayContainsKey!0 lt!282923 (select (arr!17986 a!2986) j!136) j!136))))

(declare-fun Unit!19995 () Unit!19988)

(assert (=> b!615734 (= e!353041 Unit!19995)))

(declare-fun b!615735 () Bool)

(declare-fun e!353036 () Bool)

(assert (=> b!615735 (= e!353036 e!353040)))

(declare-fun res!396602 () Bool)

(assert (=> b!615735 (=> (not res!396602) (not e!353040))))

(assert (=> b!615735 (= res!396602 (and (= lt!282924 (Found!6426 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17986 a!2986) index!984) (select (arr!17986 a!2986) j!136))) (not (= (select (arr!17986 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615735 (= lt!282924 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17986 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615736 () Bool)

(declare-fun res!396612 () Bool)

(assert (=> b!615736 (=> (not res!396612) (not e!353033))))

(assert (=> b!615736 (= res!396612 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615737 () Bool)

(assert (=> b!615737 (= e!353037 e!353036)))

(declare-fun res!396607 () Bool)

(assert (=> b!615737 (=> (not res!396607) (not e!353036))))

(assert (=> b!615737 (= res!396607 (= (select (store (arr!17986 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615737 (= lt!282923 (array!37481 (store (arr!17986 a!2986) i!1108 k0!1786) (size!18350 a!2986)))))

(declare-fun b!615738 () Bool)

(declare-fun Unit!19996 () Unit!19988)

(assert (=> b!615738 (= e!353030 Unit!19996)))

(declare-fun b!615739 () Bool)

(declare-fun res!396616 () Bool)

(assert (=> b!615739 (=> (not res!396616) (not e!353037))))

(assert (=> b!615739 (= res!396616 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12024))))

(declare-fun b!615740 () Bool)

(assert (=> b!615740 (= e!353033 e!353037)))

(declare-fun res!396613 () Bool)

(assert (=> b!615740 (=> (not res!396613) (not e!353037))))

(declare-fun lt!282935 () SeekEntryResult!6426)

(assert (=> b!615740 (= res!396613 (or (= lt!282935 (MissingZero!6426 i!1108)) (= lt!282935 (MissingVacant!6426 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37480 (_ BitVec 32)) SeekEntryResult!6426)

(assert (=> b!615740 (= lt!282935 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615741 () Bool)

(declare-fun Unit!19997 () Unit!19988)

(assert (=> b!615741 (= e!353042 Unit!19997)))

(declare-fun b!615742 () Bool)

(declare-fun res!396603 () Bool)

(assert (=> b!615742 (=> (not res!396603) (not e!353033))))

(assert (=> b!615742 (= res!396603 (and (= (size!18350 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18350 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18350 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615743 () Bool)

(declare-fun res!396609 () Bool)

(assert (=> b!615743 (= res!396609 (arrayContainsKey!0 lt!282923 (select (arr!17986 a!2986) j!136) j!136))))

(assert (=> b!615743 (=> (not res!396609) (not e!353038))))

(assert (=> b!615743 (= e!353034 e!353038)))

(assert (= (and start!56010 res!396611) b!615742))

(assert (= (and b!615742 res!396603) b!615728))

(assert (= (and b!615728 res!396608) b!615732))

(assert (= (and b!615732 res!396605) b!615736))

(assert (= (and b!615736 res!396612) b!615740))

(assert (= (and b!615740 res!396613) b!615731))

(assert (= (and b!615731 res!396610) b!615739))

(assert (= (and b!615739 res!396616) b!615727))

(assert (= (and b!615727 res!396614) b!615737))

(assert (= (and b!615737 res!396607) b!615735))

(assert (= (and b!615735 res!396602) b!615726))

(assert (= (and b!615726 res!396615) b!615722))

(assert (= (and b!615726 c!69927) b!615724))

(assert (= (and b!615726 (not c!69927)) b!615741))

(assert (= (and b!615726 c!69928) b!615720))

(assert (= (and b!615726 (not c!69928)) b!615738))

(assert (= (and b!615720 res!396604) b!615723))

(assert (= (and b!615723 (not res!396606)) b!615743))

(assert (= (and b!615743 res!396609) b!615725))

(assert (= (and b!615720 c!69929) b!615729))

(assert (= (and b!615720 (not c!69929)) b!615721))

(assert (= (and b!615720 c!69926) b!615734))

(assert (= (and b!615720 (not c!69926)) b!615730))

(assert (= (and b!615734 res!396617) b!615733))

(declare-fun m!591915 () Bool)

(assert (=> b!615728 m!591915))

(assert (=> b!615728 m!591915))

(declare-fun m!591917 () Bool)

(assert (=> b!615728 m!591917))

(assert (=> b!615734 m!591915))

(declare-fun m!591919 () Bool)

(assert (=> b!615734 m!591919))

(assert (=> b!615734 m!591915))

(declare-fun m!591921 () Bool)

(assert (=> b!615734 m!591921))

(assert (=> b!615734 m!591915))

(declare-fun m!591923 () Bool)

(assert (=> b!615734 m!591923))

(declare-fun m!591925 () Bool)

(assert (=> b!615734 m!591925))

(assert (=> b!615734 m!591915))

(declare-fun m!591927 () Bool)

(assert (=> b!615734 m!591927))

(declare-fun m!591929 () Bool)

(assert (=> b!615734 m!591929))

(declare-fun m!591931 () Bool)

(assert (=> b!615734 m!591931))

(declare-fun m!591933 () Bool)

(assert (=> b!615734 m!591933))

(assert (=> b!615734 m!591915))

(declare-fun m!591935 () Bool)

(assert (=> b!615731 m!591935))

(declare-fun m!591937 () Bool)

(assert (=> b!615726 m!591937))

(declare-fun m!591939 () Bool)

(assert (=> b!615726 m!591939))

(assert (=> b!615726 m!591915))

(declare-fun m!591941 () Bool)

(assert (=> b!615726 m!591941))

(assert (=> b!615726 m!591915))

(declare-fun m!591943 () Bool)

(assert (=> b!615726 m!591943))

(declare-fun m!591945 () Bool)

(assert (=> b!615726 m!591945))

(declare-fun m!591947 () Bool)

(assert (=> b!615726 m!591947))

(declare-fun m!591949 () Bool)

(assert (=> b!615726 m!591949))

(assert (=> b!615743 m!591915))

(assert (=> b!615743 m!591915))

(assert (=> b!615743 m!591923))

(declare-fun m!591951 () Bool)

(assert (=> b!615735 m!591951))

(assert (=> b!615735 m!591915))

(assert (=> b!615735 m!591915))

(declare-fun m!591953 () Bool)

(assert (=> b!615735 m!591953))

(assert (=> b!615729 m!591915))

(assert (=> b!615729 m!591915))

(declare-fun m!591955 () Bool)

(assert (=> b!615729 m!591955))

(assert (=> b!615729 m!591925))

(declare-fun m!591957 () Bool)

(assert (=> b!615729 m!591957))

(assert (=> b!615729 m!591915))

(declare-fun m!591959 () Bool)

(assert (=> b!615729 m!591959))

(assert (=> b!615729 m!591931))

(declare-fun m!591961 () Bool)

(assert (=> b!615729 m!591961))

(assert (=> b!615729 m!591915))

(declare-fun m!591963 () Bool)

(assert (=> b!615729 m!591963))

(assert (=> b!615737 m!591945))

(declare-fun m!591965 () Bool)

(assert (=> b!615737 m!591965))

(declare-fun m!591967 () Bool)

(assert (=> b!615727 m!591967))

(assert (=> b!615720 m!591945))

(declare-fun m!591969 () Bool)

(assert (=> b!615720 m!591969))

(assert (=> b!615720 m!591915))

(declare-fun m!591971 () Bool)

(assert (=> b!615740 m!591971))

(declare-fun m!591973 () Bool)

(assert (=> b!615732 m!591973))

(declare-fun m!591975 () Bool)

(assert (=> b!615739 m!591975))

(assert (=> b!615733 m!591915))

(assert (=> b!615733 m!591915))

(declare-fun m!591977 () Bool)

(assert (=> b!615733 m!591977))

(assert (=> b!615725 m!591915))

(assert (=> b!615725 m!591915))

(assert (=> b!615725 m!591977))

(declare-fun m!591979 () Bool)

(assert (=> b!615736 m!591979))

(declare-fun m!591981 () Bool)

(assert (=> start!56010 m!591981))

(declare-fun m!591983 () Bool)

(assert (=> start!56010 m!591983))

(check-sat (not b!615732) (not b!615739) (not start!56010) (not b!615729) (not b!615734) (not b!615733) (not b!615731) (not b!615725) (not b!615740) (not b!615726) (not b!615743) (not b!615735) (not b!615736) (not b!615728))
(check-sat)
