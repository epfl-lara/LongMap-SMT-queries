; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56178 () Bool)

(assert start!56178)

(declare-fun b!621921 () Bool)

(assert (=> b!621921 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37648 0))(
  ( (array!37649 (arr!18070 (Array (_ BitVec 32) (_ BitVec 64))) (size!18434 (_ BitVec 32))) )
))
(declare-fun lt!287970 () array!37648)

(declare-fun a!2986 () array!37648)

(declare-datatypes ((Unit!20828 0))(
  ( (Unit!20829) )
))
(declare-fun lt!287963 () Unit!20828)

(declare-datatypes ((List!12111 0))(
  ( (Nil!12108) (Cons!12107 (h!13152 (_ BitVec 64)) (t!18339 List!12111)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37648 (_ BitVec 64) (_ BitVec 32) List!12111) Unit!20828)

(assert (=> b!621921 (= lt!287963 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287970 (select (arr!18070 a!2986) j!136) j!136 Nil!12108))))

(declare-fun arrayNoDuplicates!0 (array!37648 (_ BitVec 32) List!12111) Bool)

(assert (=> b!621921 (arrayNoDuplicates!0 lt!287970 j!136 Nil!12108)))

(declare-fun lt!287967 () Unit!20828)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37648 (_ BitVec 32) (_ BitVec 32)) Unit!20828)

(assert (=> b!621921 (= lt!287967 (lemmaNoDuplicateFromThenFromBigger!0 lt!287970 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621921 (arrayNoDuplicates!0 lt!287970 #b00000000000000000000000000000000 Nil!12108)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!287976 () Unit!20828)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12111) Unit!20828)

(assert (=> b!621921 (= lt!287976 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12108))))

(declare-fun arrayContainsKey!0 (array!37648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621921 (arrayContainsKey!0 lt!287970 (select (arr!18070 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287964 () Unit!20828)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20828)

(assert (=> b!621921 (= lt!287964 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287970 (select (arr!18070 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356720 () Unit!20828)

(declare-fun Unit!20830 () Unit!20828)

(assert (=> b!621921 (= e!356720 Unit!20830)))

(declare-fun b!621922 () Bool)

(declare-fun res!400798 () Bool)

(declare-fun e!356724 () Bool)

(assert (=> b!621922 (=> (not res!400798) (not e!356724))))

(assert (=> b!621922 (= res!400798 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621923 () Bool)

(declare-fun res!400799 () Bool)

(declare-fun e!356713 () Bool)

(assert (=> b!621923 (=> (not res!400799) (not e!356713))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621923 (= res!400799 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18070 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621924 () Bool)

(declare-fun res!400793 () Bool)

(assert (=> b!621924 (=> (not res!400793) (not e!356713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37648 (_ BitVec 32)) Bool)

(assert (=> b!621924 (= res!400793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621925 () Bool)

(declare-fun res!400800 () Bool)

(assert (=> b!621925 (=> (not res!400800) (not e!356713))))

(assert (=> b!621925 (= res!400800 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12108))))

(declare-fun b!621926 () Bool)

(declare-fun res!400791 () Bool)

(assert (=> b!621926 (= res!400791 (bvsge j!136 index!984))))

(declare-fun e!356719 () Bool)

(assert (=> b!621926 (=> res!400791 e!356719)))

(declare-fun e!356722 () Bool)

(assert (=> b!621926 (= e!356722 e!356719)))

(declare-fun b!621927 () Bool)

(assert (=> b!621927 (= e!356724 e!356713)))

(declare-fun res!400801 () Bool)

(assert (=> b!621927 (=> (not res!400801) (not e!356713))))

(declare-datatypes ((SeekEntryResult!6510 0))(
  ( (MissingZero!6510 (index!28324 (_ BitVec 32))) (Found!6510 (index!28325 (_ BitVec 32))) (Intermediate!6510 (undefined!7322 Bool) (index!28326 (_ BitVec 32)) (x!57094 (_ BitVec 32))) (Undefined!6510) (MissingVacant!6510 (index!28327 (_ BitVec 32))) )
))
(declare-fun lt!287958 () SeekEntryResult!6510)

(assert (=> b!621927 (= res!400801 (or (= lt!287958 (MissingZero!6510 i!1108)) (= lt!287958 (MissingVacant!6510 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37648 (_ BitVec 32)) SeekEntryResult!6510)

(assert (=> b!621927 (= lt!287958 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621928 () Bool)

(declare-fun e!356721 () Unit!20828)

(declare-fun Unit!20831 () Unit!20828)

(assert (=> b!621928 (= e!356721 Unit!20831)))

(declare-fun b!621929 () Bool)

(declare-fun Unit!20832 () Unit!20828)

(assert (=> b!621929 (= e!356721 Unit!20832)))

(declare-fun res!400792 () Bool)

(assert (=> b!621929 (= res!400792 (= (select (store (arr!18070 a!2986) i!1108 k0!1786) index!984) (select (arr!18070 a!2986) j!136)))))

(assert (=> b!621929 (=> (not res!400792) (not e!356722))))

(assert (=> b!621929 e!356722))

(declare-fun c!70934 () Bool)

(assert (=> b!621929 (= c!70934 (bvslt j!136 index!984))))

(declare-fun lt!287974 () Unit!20828)

(assert (=> b!621929 (= lt!287974 e!356720)))

(declare-fun c!70935 () Bool)

(assert (=> b!621929 (= c!70935 (bvslt index!984 j!136))))

(declare-fun lt!287972 () Unit!20828)

(declare-fun e!356714 () Unit!20828)

(assert (=> b!621929 (= lt!287972 e!356714)))

(assert (=> b!621929 false))

(declare-fun b!621930 () Bool)

(assert (=> b!621930 false))

(declare-fun lt!287966 () Unit!20828)

(assert (=> b!621930 (= lt!287966 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287970 (select (arr!18070 a!2986) j!136) index!984 Nil!12108))))

(assert (=> b!621930 (arrayNoDuplicates!0 lt!287970 index!984 Nil!12108)))

(declare-fun lt!287969 () Unit!20828)

(assert (=> b!621930 (= lt!287969 (lemmaNoDuplicateFromThenFromBigger!0 lt!287970 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621930 (arrayNoDuplicates!0 lt!287970 #b00000000000000000000000000000000 Nil!12108)))

(declare-fun lt!287968 () Unit!20828)

(assert (=> b!621930 (= lt!287968 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12108))))

(assert (=> b!621930 (arrayContainsKey!0 lt!287970 (select (arr!18070 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287971 () Unit!20828)

(assert (=> b!621930 (= lt!287971 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287970 (select (arr!18070 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356717 () Bool)

(assert (=> b!621930 e!356717))

(declare-fun res!400789 () Bool)

(assert (=> b!621930 (=> (not res!400789) (not e!356717))))

(assert (=> b!621930 (= res!400789 (arrayContainsKey!0 lt!287970 (select (arr!18070 a!2986) j!136) j!136))))

(declare-fun Unit!20833 () Unit!20828)

(assert (=> b!621930 (= e!356714 Unit!20833)))

(declare-fun b!621931 () Bool)

(declare-fun res!400795 () Bool)

(assert (=> b!621931 (=> (not res!400795) (not e!356724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621931 (= res!400795 (validKeyInArray!0 (select (arr!18070 a!2986) j!136)))))

(declare-fun b!621932 () Bool)

(assert (=> b!621932 (= e!356717 (arrayContainsKey!0 lt!287970 (select (arr!18070 a!2986) j!136) index!984))))

(declare-fun b!621933 () Bool)

(declare-fun Unit!20834 () Unit!20828)

(assert (=> b!621933 (= e!356714 Unit!20834)))

(declare-fun b!621934 () Bool)

(declare-fun e!356723 () Bool)

(declare-fun e!356718 () Bool)

(assert (=> b!621934 (= e!356723 e!356718)))

(declare-fun res!400790 () Bool)

(assert (=> b!621934 (=> (not res!400790) (not e!356718))))

(declare-fun lt!287973 () SeekEntryResult!6510)

(assert (=> b!621934 (= res!400790 (and (= lt!287973 (Found!6510 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18070 a!2986) index!984) (select (arr!18070 a!2986) j!136))) (not (= (select (arr!18070 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37648 (_ BitVec 32)) SeekEntryResult!6510)

(assert (=> b!621934 (= lt!287973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18070 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621935 () Bool)

(declare-fun res!400787 () Bool)

(assert (=> b!621935 (=> (not res!400787) (not e!356724))))

(assert (=> b!621935 (= res!400787 (validKeyInArray!0 k0!1786))))

(declare-fun res!400796 () Bool)

(declare-fun b!621936 () Bool)

(assert (=> b!621936 (= res!400796 (arrayContainsKey!0 lt!287970 (select (arr!18070 a!2986) j!136) j!136))))

(declare-fun e!356711 () Bool)

(assert (=> b!621936 (=> (not res!400796) (not e!356711))))

(assert (=> b!621936 (= e!356719 e!356711)))

(declare-fun b!621937 () Bool)

(declare-fun e!356712 () Unit!20828)

(declare-fun Unit!20835 () Unit!20828)

(assert (=> b!621937 (= e!356712 Unit!20835)))

(assert (=> b!621937 false))

(declare-fun b!621938 () Bool)

(declare-fun e!356715 () Bool)

(declare-fun lt!287962 () SeekEntryResult!6510)

(assert (=> b!621938 (= e!356715 (= lt!287973 lt!287962))))

(declare-fun b!621939 () Bool)

(assert (=> b!621939 (= e!356713 e!356723)))

(declare-fun res!400794 () Bool)

(assert (=> b!621939 (=> (not res!400794) (not e!356723))))

(assert (=> b!621939 (= res!400794 (= (select (store (arr!18070 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621939 (= lt!287970 (array!37649 (store (arr!18070 a!2986) i!1108 k0!1786) (size!18434 a!2986)))))

(declare-fun b!621940 () Bool)

(assert (=> b!621940 (= e!356711 (arrayContainsKey!0 lt!287970 (select (arr!18070 a!2986) j!136) index!984))))

(declare-fun b!621941 () Bool)

(declare-fun Unit!20836 () Unit!20828)

(assert (=> b!621941 (= e!356720 Unit!20836)))

(declare-fun b!621942 () Bool)

(declare-fun res!400797 () Bool)

(assert (=> b!621942 (=> (not res!400797) (not e!356724))))

(assert (=> b!621942 (= res!400797 (and (= (size!18434 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18434 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18434 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621943 () Bool)

(assert (=> b!621943 (= e!356718 (not true))))

(declare-fun lt!287975 () Unit!20828)

(assert (=> b!621943 (= lt!287975 e!356721)))

(declare-fun c!70936 () Bool)

(declare-fun lt!287959 () SeekEntryResult!6510)

(assert (=> b!621943 (= c!70936 (= lt!287959 (Found!6510 index!984)))))

(declare-fun lt!287965 () Unit!20828)

(assert (=> b!621943 (= lt!287965 e!356712)))

(declare-fun c!70937 () Bool)

(assert (=> b!621943 (= c!70937 (= lt!287959 Undefined!6510))))

(declare-fun lt!287977 () (_ BitVec 64))

(assert (=> b!621943 (= lt!287959 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287977 lt!287970 mask!3053))))

(assert (=> b!621943 e!356715))

(declare-fun res!400788 () Bool)

(assert (=> b!621943 (=> (not res!400788) (not e!356715))))

(declare-fun lt!287960 () (_ BitVec 32))

(assert (=> b!621943 (= res!400788 (= lt!287962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287960 vacantSpotIndex!68 lt!287977 lt!287970 mask!3053)))))

(assert (=> b!621943 (= lt!287962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287960 vacantSpotIndex!68 (select (arr!18070 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621943 (= lt!287977 (select (store (arr!18070 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287961 () Unit!20828)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37648 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20828)

(assert (=> b!621943 (= lt!287961 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287960 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621943 (= lt!287960 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!400802 () Bool)

(assert (=> start!56178 (=> (not res!400802) (not e!356724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56178 (= res!400802 (validMask!0 mask!3053))))

(assert (=> start!56178 e!356724))

(assert (=> start!56178 true))

(declare-fun array_inv!13866 (array!37648) Bool)

(assert (=> start!56178 (array_inv!13866 a!2986)))

(declare-fun b!621944 () Bool)

(declare-fun Unit!20837 () Unit!20828)

(assert (=> b!621944 (= e!356712 Unit!20837)))

(assert (= (and start!56178 res!400802) b!621942))

(assert (= (and b!621942 res!400797) b!621931))

(assert (= (and b!621931 res!400795) b!621935))

(assert (= (and b!621935 res!400787) b!621922))

(assert (= (and b!621922 res!400798) b!621927))

(assert (= (and b!621927 res!400801) b!621924))

(assert (= (and b!621924 res!400793) b!621925))

(assert (= (and b!621925 res!400800) b!621923))

(assert (= (and b!621923 res!400799) b!621939))

(assert (= (and b!621939 res!400794) b!621934))

(assert (= (and b!621934 res!400790) b!621943))

(assert (= (and b!621943 res!400788) b!621938))

(assert (= (and b!621943 c!70937) b!621937))

(assert (= (and b!621943 (not c!70937)) b!621944))

(assert (= (and b!621943 c!70936) b!621929))

(assert (= (and b!621943 (not c!70936)) b!621928))

(assert (= (and b!621929 res!400792) b!621926))

(assert (= (and b!621926 (not res!400791)) b!621936))

(assert (= (and b!621936 res!400796) b!621940))

(assert (= (and b!621929 c!70934) b!621921))

(assert (= (and b!621929 (not c!70934)) b!621941))

(assert (= (and b!621929 c!70935) b!621930))

(assert (= (and b!621929 (not c!70935)) b!621933))

(assert (= (and b!621930 res!400789) b!621932))

(declare-fun m!597801 () Bool)

(assert (=> b!621925 m!597801))

(declare-fun m!597803 () Bool)

(assert (=> b!621940 m!597803))

(assert (=> b!621940 m!597803))

(declare-fun m!597805 () Bool)

(assert (=> b!621940 m!597805))

(declare-fun m!597807 () Bool)

(assert (=> start!56178 m!597807))

(declare-fun m!597809 () Bool)

(assert (=> start!56178 m!597809))

(assert (=> b!621931 m!597803))

(assert (=> b!621931 m!597803))

(declare-fun m!597811 () Bool)

(assert (=> b!621931 m!597811))

(declare-fun m!597813 () Bool)

(assert (=> b!621923 m!597813))

(declare-fun m!597815 () Bool)

(assert (=> b!621924 m!597815))

(declare-fun m!597817 () Bool)

(assert (=> b!621943 m!597817))

(assert (=> b!621943 m!597803))

(declare-fun m!597819 () Bool)

(assert (=> b!621943 m!597819))

(declare-fun m!597821 () Bool)

(assert (=> b!621943 m!597821))

(assert (=> b!621943 m!597803))

(declare-fun m!597823 () Bool)

(assert (=> b!621943 m!597823))

(declare-fun m!597825 () Bool)

(assert (=> b!621943 m!597825))

(declare-fun m!597827 () Bool)

(assert (=> b!621943 m!597827))

(declare-fun m!597829 () Bool)

(assert (=> b!621943 m!597829))

(assert (=> b!621921 m!597803))

(declare-fun m!597831 () Bool)

(assert (=> b!621921 m!597831))

(assert (=> b!621921 m!597803))

(declare-fun m!597833 () Bool)

(assert (=> b!621921 m!597833))

(declare-fun m!597835 () Bool)

(assert (=> b!621921 m!597835))

(assert (=> b!621921 m!597803))

(declare-fun m!597837 () Bool)

(assert (=> b!621921 m!597837))

(declare-fun m!597839 () Bool)

(assert (=> b!621921 m!597839))

(assert (=> b!621921 m!597803))

(declare-fun m!597841 () Bool)

(assert (=> b!621921 m!597841))

(declare-fun m!597843 () Bool)

(assert (=> b!621921 m!597843))

(declare-fun m!597845 () Bool)

(assert (=> b!621934 m!597845))

(assert (=> b!621934 m!597803))

(assert (=> b!621934 m!597803))

(declare-fun m!597847 () Bool)

(assert (=> b!621934 m!597847))

(declare-fun m!597849 () Bool)

(assert (=> b!621922 m!597849))

(assert (=> b!621939 m!597819))

(declare-fun m!597851 () Bool)

(assert (=> b!621939 m!597851))

(assert (=> b!621932 m!597803))

(assert (=> b!621932 m!597803))

(assert (=> b!621932 m!597805))

(assert (=> b!621936 m!597803))

(assert (=> b!621936 m!597803))

(declare-fun m!597853 () Bool)

(assert (=> b!621936 m!597853))

(declare-fun m!597855 () Bool)

(assert (=> b!621935 m!597855))

(declare-fun m!597857 () Bool)

(assert (=> b!621927 m!597857))

(assert (=> b!621930 m!597803))

(declare-fun m!597859 () Bool)

(assert (=> b!621930 m!597859))

(assert (=> b!621930 m!597803))

(assert (=> b!621930 m!597803))

(assert (=> b!621930 m!597853))

(declare-fun m!597861 () Bool)

(assert (=> b!621930 m!597861))

(assert (=> b!621930 m!597835))

(assert (=> b!621930 m!597803))

(declare-fun m!597863 () Bool)

(assert (=> b!621930 m!597863))

(assert (=> b!621930 m!597803))

(declare-fun m!597865 () Bool)

(assert (=> b!621930 m!597865))

(declare-fun m!597867 () Bool)

(assert (=> b!621930 m!597867))

(assert (=> b!621930 m!597843))

(assert (=> b!621929 m!597819))

(declare-fun m!597869 () Bool)

(assert (=> b!621929 m!597869))

(assert (=> b!621929 m!597803))

(check-sat (not start!56178) (not b!621925) (not b!621927) (not b!621935) (not b!621931) (not b!621921) (not b!621936) (not b!621932) (not b!621943) (not b!621930) (not b!621924) (not b!621940) (not b!621922) (not b!621934))
(check-sat)
