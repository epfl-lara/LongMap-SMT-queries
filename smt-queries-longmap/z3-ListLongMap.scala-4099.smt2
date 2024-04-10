; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56094 () Bool)

(assert start!56094)

(declare-datatypes ((array!37564 0))(
  ( (array!37565 (arr!18028 (Array (_ BitVec 32) (_ BitVec 64))) (size!18392 (_ BitVec 32))) )
))
(declare-fun lt!285443 () array!37564)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!618848 () Bool)

(declare-fun e!354898 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37564)

(declare-fun arrayContainsKey!0 (array!37564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618848 (= e!354898 (arrayContainsKey!0 lt!285443 (select (arr!18028 a!2986) j!136) index!984))))

(declare-fun b!618849 () Bool)

(declare-fun e!354909 () Bool)

(declare-fun e!354904 () Bool)

(assert (=> b!618849 (= e!354909 e!354904)))

(declare-fun res!398735 () Bool)

(assert (=> b!618849 (=> (not res!398735) (not e!354904))))

(declare-datatypes ((SeekEntryResult!6468 0))(
  ( (MissingZero!6468 (index!28156 (_ BitVec 32))) (Found!6468 (index!28157 (_ BitVec 32))) (Intermediate!6468 (undefined!7280 Bool) (index!28158 (_ BitVec 32)) (x!56940 (_ BitVec 32))) (Undefined!6468) (MissingVacant!6468 (index!28159 (_ BitVec 32))) )
))
(declare-fun lt!285440 () SeekEntryResult!6468)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618849 (= res!398735 (and (= lt!285440 (Found!6468 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18028 a!2986) index!984) (select (arr!18028 a!2986) j!136))) (not (= (select (arr!18028 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37564 (_ BitVec 32)) SeekEntryResult!6468)

(assert (=> b!618849 (= lt!285440 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18028 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618850 () Bool)

(declare-fun res!398737 () Bool)

(declare-fun e!354905 () Bool)

(assert (=> b!618850 (=> (not res!398737) (not e!354905))))

(assert (=> b!618850 (= res!398737 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18028 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618851 () Bool)

(declare-datatypes ((Unit!20408 0))(
  ( (Unit!20409) )
))
(declare-fun e!354903 () Unit!20408)

(declare-fun Unit!20410 () Unit!20408)

(assert (=> b!618851 (= e!354903 Unit!20410)))

(declare-fun b!618852 () Bool)

(declare-fun e!354910 () Unit!20408)

(declare-fun Unit!20411 () Unit!20408)

(assert (=> b!618852 (= e!354910 Unit!20411)))

(declare-fun b!618853 () Bool)

(declare-fun res!398725 () Bool)

(assert (=> b!618853 (=> (not res!398725) (not e!354905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37564 (_ BitVec 32)) Bool)

(assert (=> b!618853 (= res!398725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618854 () Bool)

(assert (=> b!618854 (= e!354905 e!354909)))

(declare-fun res!398724 () Bool)

(assert (=> b!618854 (=> (not res!398724) (not e!354909))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!618854 (= res!398724 (= (select (store (arr!18028 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618854 (= lt!285443 (array!37565 (store (arr!18028 a!2986) i!1108 k0!1786) (size!18392 a!2986)))))

(declare-fun b!618855 () Bool)

(assert (=> b!618855 false))

(declare-fun lt!285445 () Unit!20408)

(declare-datatypes ((List!12069 0))(
  ( (Nil!12066) (Cons!12065 (h!13110 (_ BitVec 64)) (t!18297 List!12069)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37564 (_ BitVec 64) (_ BitVec 32) List!12069) Unit!20408)

(assert (=> b!618855 (= lt!285445 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285443 (select (arr!18028 a!2986) j!136) j!136 Nil!12066))))

(declare-fun arrayNoDuplicates!0 (array!37564 (_ BitVec 32) List!12069) Bool)

(assert (=> b!618855 (arrayNoDuplicates!0 lt!285443 j!136 Nil!12066)))

(declare-fun lt!285442 () Unit!20408)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37564 (_ BitVec 32) (_ BitVec 32)) Unit!20408)

(assert (=> b!618855 (= lt!285442 (lemmaNoDuplicateFromThenFromBigger!0 lt!285443 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618855 (arrayNoDuplicates!0 lt!285443 #b00000000000000000000000000000000 Nil!12066)))

(declare-fun lt!285451 () Unit!20408)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37564 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12069) Unit!20408)

(assert (=> b!618855 (= lt!285451 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12066))))

(assert (=> b!618855 (arrayContainsKey!0 lt!285443 (select (arr!18028 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285441 () Unit!20408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37564 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20408)

(assert (=> b!618855 (= lt!285441 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285443 (select (arr!18028 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354906 () Unit!20408)

(declare-fun Unit!20412 () Unit!20408)

(assert (=> b!618855 (= e!354906 Unit!20412)))

(declare-fun b!618856 () Bool)

(declare-fun e!354899 () Bool)

(assert (=> b!618856 (= e!354904 (not e!354899))))

(declare-fun res!398728 () Bool)

(assert (=> b!618856 (=> res!398728 e!354899)))

(declare-fun lt!285448 () SeekEntryResult!6468)

(assert (=> b!618856 (= res!398728 (not (= lt!285448 (MissingVacant!6468 vacantSpotIndex!68))))))

(declare-fun lt!285449 () Unit!20408)

(assert (=> b!618856 (= lt!285449 e!354903)))

(declare-fun c!70433 () Bool)

(assert (=> b!618856 (= c!70433 (= lt!285448 (Found!6468 index!984)))))

(declare-fun lt!285450 () Unit!20408)

(declare-fun e!354900 () Unit!20408)

(assert (=> b!618856 (= lt!285450 e!354900)))

(declare-fun c!70432 () Bool)

(assert (=> b!618856 (= c!70432 (= lt!285448 Undefined!6468))))

(declare-fun lt!285454 () (_ BitVec 64))

(assert (=> b!618856 (= lt!285448 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285454 lt!285443 mask!3053))))

(declare-fun e!354901 () Bool)

(assert (=> b!618856 e!354901))

(declare-fun res!398733 () Bool)

(assert (=> b!618856 (=> (not res!398733) (not e!354901))))

(declare-fun lt!285452 () (_ BitVec 32))

(declare-fun lt!285455 () SeekEntryResult!6468)

(assert (=> b!618856 (= res!398733 (= lt!285455 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285452 vacantSpotIndex!68 lt!285454 lt!285443 mask!3053)))))

(assert (=> b!618856 (= lt!285455 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285452 vacantSpotIndex!68 (select (arr!18028 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618856 (= lt!285454 (select (store (arr!18028 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285447 () Unit!20408)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37564 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20408)

(assert (=> b!618856 (= lt!285447 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285452 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618856 (= lt!285452 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618857 () Bool)

(declare-fun res!398723 () Bool)

(declare-fun e!354907 () Bool)

(assert (=> b!618857 (=> (not res!398723) (not e!354907))))

(assert (=> b!618857 (= res!398723 (and (= (size!18392 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18392 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18392 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618858 () Bool)

(declare-fun Unit!20413 () Unit!20408)

(assert (=> b!618858 (= e!354900 Unit!20413)))

(assert (=> b!618858 false))

(declare-fun b!618860 () Bool)

(declare-fun res!398738 () Bool)

(assert (=> b!618860 (=> (not res!398738) (not e!354907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618860 (= res!398738 (validKeyInArray!0 (select (arr!18028 a!2986) j!136)))))

(declare-fun b!618861 () Bool)

(declare-fun res!398734 () Bool)

(assert (=> b!618861 (= res!398734 (bvsge j!136 index!984))))

(declare-fun e!354911 () Bool)

(assert (=> b!618861 (=> res!398734 e!354911)))

(declare-fun e!354902 () Bool)

(assert (=> b!618861 (= e!354902 e!354911)))

(declare-fun b!618862 () Bool)

(assert (=> b!618862 (= e!354907 e!354905)))

(declare-fun res!398722 () Bool)

(assert (=> b!618862 (=> (not res!398722) (not e!354905))))

(declare-fun lt!285439 () SeekEntryResult!6468)

(assert (=> b!618862 (= res!398722 (or (= lt!285439 (MissingZero!6468 i!1108)) (= lt!285439 (MissingVacant!6468 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37564 (_ BitVec 32)) SeekEntryResult!6468)

(assert (=> b!618862 (= lt!285439 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!398736 () Bool)

(declare-fun b!618863 () Bool)

(assert (=> b!618863 (= res!398736 (arrayContainsKey!0 lt!285443 (select (arr!18028 a!2986) j!136) j!136))))

(declare-fun e!354912 () Bool)

(assert (=> b!618863 (=> (not res!398736) (not e!354912))))

(assert (=> b!618863 (= e!354911 e!354912)))

(declare-fun b!618864 () Bool)

(assert (=> b!618864 (= e!354899 true)))

(assert (=> b!618864 (= (select (store (arr!18028 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618865 () Bool)

(declare-fun res!398727 () Bool)

(assert (=> b!618865 (=> (not res!398727) (not e!354905))))

(assert (=> b!618865 (= res!398727 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12066))))

(declare-fun b!618866 () Bool)

(declare-fun Unit!20414 () Unit!20408)

(assert (=> b!618866 (= e!354900 Unit!20414)))

(declare-fun b!618867 () Bool)

(assert (=> b!618867 (= e!354912 (arrayContainsKey!0 lt!285443 (select (arr!18028 a!2986) j!136) index!984))))

(declare-fun b!618868 () Bool)

(declare-fun res!398729 () Bool)

(assert (=> b!618868 (=> (not res!398729) (not e!354907))))

(assert (=> b!618868 (= res!398729 (validKeyInArray!0 k0!1786))))

(declare-fun b!618859 () Bool)

(declare-fun Unit!20415 () Unit!20408)

(assert (=> b!618859 (= e!354903 Unit!20415)))

(declare-fun res!398731 () Bool)

(assert (=> b!618859 (= res!398731 (= (select (store (arr!18028 a!2986) i!1108 k0!1786) index!984) (select (arr!18028 a!2986) j!136)))))

(assert (=> b!618859 (=> (not res!398731) (not e!354902))))

(assert (=> b!618859 e!354902))

(declare-fun c!70430 () Bool)

(assert (=> b!618859 (= c!70430 (bvslt j!136 index!984))))

(declare-fun lt!285438 () Unit!20408)

(assert (=> b!618859 (= lt!285438 e!354906)))

(declare-fun c!70431 () Bool)

(assert (=> b!618859 (= c!70431 (bvslt index!984 j!136))))

(declare-fun lt!285453 () Unit!20408)

(assert (=> b!618859 (= lt!285453 e!354910)))

(assert (=> b!618859 false))

(declare-fun res!398726 () Bool)

(assert (=> start!56094 (=> (not res!398726) (not e!354907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56094 (= res!398726 (validMask!0 mask!3053))))

(assert (=> start!56094 e!354907))

(assert (=> start!56094 true))

(declare-fun array_inv!13824 (array!37564) Bool)

(assert (=> start!56094 (array_inv!13824 a!2986)))

(declare-fun b!618869 () Bool)

(assert (=> b!618869 (= e!354901 (= lt!285440 lt!285455))))

(declare-fun b!618870 () Bool)

(declare-fun res!398732 () Bool)

(assert (=> b!618870 (=> (not res!398732) (not e!354907))))

(assert (=> b!618870 (= res!398732 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618871 () Bool)

(assert (=> b!618871 false))

(declare-fun lt!285446 () Unit!20408)

(assert (=> b!618871 (= lt!285446 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285443 (select (arr!18028 a!2986) j!136) index!984 Nil!12066))))

(assert (=> b!618871 (arrayNoDuplicates!0 lt!285443 index!984 Nil!12066)))

(declare-fun lt!285444 () Unit!20408)

(assert (=> b!618871 (= lt!285444 (lemmaNoDuplicateFromThenFromBigger!0 lt!285443 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618871 (arrayNoDuplicates!0 lt!285443 #b00000000000000000000000000000000 Nil!12066)))

(declare-fun lt!285456 () Unit!20408)

(assert (=> b!618871 (= lt!285456 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12066))))

(assert (=> b!618871 (arrayContainsKey!0 lt!285443 (select (arr!18028 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285457 () Unit!20408)

(assert (=> b!618871 (= lt!285457 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285443 (select (arr!18028 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618871 e!354898))

(declare-fun res!398730 () Bool)

(assert (=> b!618871 (=> (not res!398730) (not e!354898))))

(assert (=> b!618871 (= res!398730 (arrayContainsKey!0 lt!285443 (select (arr!18028 a!2986) j!136) j!136))))

(declare-fun Unit!20416 () Unit!20408)

(assert (=> b!618871 (= e!354910 Unit!20416)))

(declare-fun b!618872 () Bool)

(declare-fun Unit!20417 () Unit!20408)

(assert (=> b!618872 (= e!354906 Unit!20417)))

(assert (= (and start!56094 res!398726) b!618857))

(assert (= (and b!618857 res!398723) b!618860))

(assert (= (and b!618860 res!398738) b!618868))

(assert (= (and b!618868 res!398729) b!618870))

(assert (= (and b!618870 res!398732) b!618862))

(assert (= (and b!618862 res!398722) b!618853))

(assert (= (and b!618853 res!398725) b!618865))

(assert (= (and b!618865 res!398727) b!618850))

(assert (= (and b!618850 res!398737) b!618854))

(assert (= (and b!618854 res!398724) b!618849))

(assert (= (and b!618849 res!398735) b!618856))

(assert (= (and b!618856 res!398733) b!618869))

(assert (= (and b!618856 c!70432) b!618858))

(assert (= (and b!618856 (not c!70432)) b!618866))

(assert (= (and b!618856 c!70433) b!618859))

(assert (= (and b!618856 (not c!70433)) b!618851))

(assert (= (and b!618859 res!398731) b!618861))

(assert (= (and b!618861 (not res!398734)) b!618863))

(assert (= (and b!618863 res!398736) b!618867))

(assert (= (and b!618859 c!70430) b!618855))

(assert (= (and b!618859 (not c!70430)) b!618872))

(assert (= (and b!618859 c!70431) b!618871))

(assert (= (and b!618859 (not c!70431)) b!618852))

(assert (= (and b!618871 res!398730) b!618848))

(assert (= (and b!618856 (not res!398728)) b!618864))

(declare-fun m!594861 () Bool)

(assert (=> b!618855 m!594861))

(declare-fun m!594863 () Bool)

(assert (=> b!618855 m!594863))

(declare-fun m!594865 () Bool)

(assert (=> b!618855 m!594865))

(declare-fun m!594867 () Bool)

(assert (=> b!618855 m!594867))

(assert (=> b!618855 m!594861))

(declare-fun m!594869 () Bool)

(assert (=> b!618855 m!594869))

(declare-fun m!594871 () Bool)

(assert (=> b!618855 m!594871))

(declare-fun m!594873 () Bool)

(assert (=> b!618855 m!594873))

(assert (=> b!618855 m!594861))

(assert (=> b!618855 m!594861))

(declare-fun m!594875 () Bool)

(assert (=> b!618855 m!594875))

(declare-fun m!594877 () Bool)

(assert (=> b!618853 m!594877))

(declare-fun m!594879 () Bool)

(assert (=> b!618865 m!594879))

(declare-fun m!594881 () Bool)

(assert (=> b!618862 m!594881))

(declare-fun m!594883 () Bool)

(assert (=> b!618871 m!594883))

(declare-fun m!594885 () Bool)

(assert (=> b!618871 m!594885))

(assert (=> b!618871 m!594861))

(declare-fun m!594887 () Bool)

(assert (=> b!618871 m!594887))

(assert (=> b!618871 m!594861))

(assert (=> b!618871 m!594861))

(declare-fun m!594889 () Bool)

(assert (=> b!618871 m!594889))

(assert (=> b!618871 m!594867))

(assert (=> b!618871 m!594861))

(declare-fun m!594891 () Bool)

(assert (=> b!618871 m!594891))

(assert (=> b!618871 m!594861))

(declare-fun m!594893 () Bool)

(assert (=> b!618871 m!594893))

(assert (=> b!618871 m!594873))

(declare-fun m!594895 () Bool)

(assert (=> b!618864 m!594895))

(declare-fun m!594897 () Bool)

(assert (=> b!618864 m!594897))

(declare-fun m!594899 () Bool)

(assert (=> b!618850 m!594899))

(declare-fun m!594901 () Bool)

(assert (=> b!618856 m!594901))

(declare-fun m!594903 () Bool)

(assert (=> b!618856 m!594903))

(assert (=> b!618856 m!594861))

(assert (=> b!618856 m!594861))

(declare-fun m!594905 () Bool)

(assert (=> b!618856 m!594905))

(assert (=> b!618856 m!594895))

(declare-fun m!594907 () Bool)

(assert (=> b!618856 m!594907))

(declare-fun m!594909 () Bool)

(assert (=> b!618856 m!594909))

(declare-fun m!594911 () Bool)

(assert (=> b!618856 m!594911))

(declare-fun m!594913 () Bool)

(assert (=> start!56094 m!594913))

(declare-fun m!594915 () Bool)

(assert (=> start!56094 m!594915))

(assert (=> b!618860 m!594861))

(assert (=> b!618860 m!594861))

(declare-fun m!594917 () Bool)

(assert (=> b!618860 m!594917))

(assert (=> b!618854 m!594895))

(declare-fun m!594919 () Bool)

(assert (=> b!618854 m!594919))

(declare-fun m!594921 () Bool)

(assert (=> b!618870 m!594921))

(assert (=> b!618859 m!594895))

(assert (=> b!618859 m!594897))

(assert (=> b!618859 m!594861))

(assert (=> b!618867 m!594861))

(assert (=> b!618867 m!594861))

(declare-fun m!594923 () Bool)

(assert (=> b!618867 m!594923))

(declare-fun m!594925 () Bool)

(assert (=> b!618868 m!594925))

(assert (=> b!618863 m!594861))

(assert (=> b!618863 m!594861))

(assert (=> b!618863 m!594891))

(assert (=> b!618848 m!594861))

(assert (=> b!618848 m!594861))

(assert (=> b!618848 m!594923))

(declare-fun m!594927 () Bool)

(assert (=> b!618849 m!594927))

(assert (=> b!618849 m!594861))

(assert (=> b!618849 m!594861))

(declare-fun m!594929 () Bool)

(assert (=> b!618849 m!594929))

(check-sat (not b!618867) (not b!618855) (not start!56094) (not b!618868) (not b!618856) (not b!618863) (not b!618870) (not b!618865) (not b!618849) (not b!618871) (not b!618848) (not b!618862) (not b!618853) (not b!618860))
(check-sat)
