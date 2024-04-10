; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56008 () Bool)

(assert start!56008)

(declare-fun b!615648 () Bool)

(declare-fun res!396557 () Bool)

(declare-fun e!352994 () Bool)

(assert (=> b!615648 (=> (not res!396557) (not e!352994))))

(declare-datatypes ((array!37478 0))(
  ( (array!37479 (arr!17985 (Array (_ BitVec 32) (_ BitVec 64))) (size!18349 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37478)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37478 (_ BitVec 32)) Bool)

(assert (=> b!615648 (= res!396557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615649 () Bool)

(declare-fun e!352998 () Bool)

(assert (=> b!615649 (= e!352994 e!352998)))

(declare-fun res!396568 () Bool)

(assert (=> b!615649 (=> (not res!396568) (not e!352998))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615649 (= res!396568 (= (select (store (arr!17985 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!282861 () array!37478)

(assert (=> b!615649 (= lt!282861 (array!37479 (store (arr!17985 a!2986) i!1108 k!1786) (size!18349 a!2986)))))

(declare-fun b!615650 () Bool)

(assert (=> b!615650 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!19978 0))(
  ( (Unit!19979) )
))
(declare-fun lt!282870 () Unit!19978)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12026 0))(
  ( (Nil!12023) (Cons!12022 (h!13067 (_ BitVec 64)) (t!18254 List!12026)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37478 (_ BitVec 64) (_ BitVec 32) List!12026) Unit!19978)

(assert (=> b!615650 (= lt!282870 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282861 (select (arr!17985 a!2986) j!136) index!984 Nil!12023))))

(declare-fun arrayNoDuplicates!0 (array!37478 (_ BitVec 32) List!12026) Bool)

(assert (=> b!615650 (arrayNoDuplicates!0 lt!282861 index!984 Nil!12023)))

(declare-fun lt!282864 () Unit!19978)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37478 (_ BitVec 32) (_ BitVec 32)) Unit!19978)

(assert (=> b!615650 (= lt!282864 (lemmaNoDuplicateFromThenFromBigger!0 lt!282861 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615650 (arrayNoDuplicates!0 lt!282861 #b00000000000000000000000000000000 Nil!12023)))

(declare-fun lt!282875 () Unit!19978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12026) Unit!19978)

(assert (=> b!615650 (= lt!282875 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12023))))

(declare-fun arrayContainsKey!0 (array!37478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615650 (arrayContainsKey!0 lt!282861 (select (arr!17985 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282866 () Unit!19978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19978)

(assert (=> b!615650 (= lt!282866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282861 (select (arr!17985 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353000 () Bool)

(assert (=> b!615650 e!353000))

(declare-fun res!396562 () Bool)

(assert (=> b!615650 (=> (not res!396562) (not e!353000))))

(assert (=> b!615650 (= res!396562 (arrayContainsKey!0 lt!282861 (select (arr!17985 a!2986) j!136) j!136))))

(declare-fun e!352999 () Unit!19978)

(declare-fun Unit!19980 () Unit!19978)

(assert (=> b!615650 (= e!352999 Unit!19980)))

(declare-fun res!396559 () Bool)

(declare-fun e!352995 () Bool)

(assert (=> start!56008 (=> (not res!396559) (not e!352995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56008 (= res!396559 (validMask!0 mask!3053))))

(assert (=> start!56008 e!352995))

(assert (=> start!56008 true))

(declare-fun array_inv!13781 (array!37478) Bool)

(assert (=> start!56008 (array_inv!13781 a!2986)))

(declare-fun b!615651 () Bool)

(assert (=> b!615651 (= e!353000 (arrayContainsKey!0 lt!282861 (select (arr!17985 a!2986) j!136) index!984))))

(declare-fun b!615652 () Bool)

(declare-fun res!396564 () Bool)

(assert (=> b!615652 (=> (not res!396564) (not e!352995))))

(assert (=> b!615652 (= res!396564 (and (= (size!18349 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18349 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18349 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615653 () Bool)

(declare-fun e!352996 () Unit!19978)

(declare-fun Unit!19981 () Unit!19978)

(assert (=> b!615653 (= e!352996 Unit!19981)))

(assert (=> b!615653 false))

(declare-fun b!615654 () Bool)

(declare-fun res!396566 () Bool)

(assert (=> b!615654 (=> (not res!396566) (not e!352994))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615654 (= res!396566 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17985 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615655 () Bool)

(assert (=> b!615655 (= e!352995 e!352994)))

(declare-fun res!396555 () Bool)

(assert (=> b!615655 (=> (not res!396555) (not e!352994))))

(declare-datatypes ((SeekEntryResult!6425 0))(
  ( (MissingZero!6425 (index!27984 (_ BitVec 32))) (Found!6425 (index!27985 (_ BitVec 32))) (Intermediate!6425 (undefined!7237 Bool) (index!27986 (_ BitVec 32)) (x!56785 (_ BitVec 32))) (Undefined!6425) (MissingVacant!6425 (index!27987 (_ BitVec 32))) )
))
(declare-fun lt!282869 () SeekEntryResult!6425)

(assert (=> b!615655 (= res!396555 (or (= lt!282869 (MissingZero!6425 i!1108)) (= lt!282869 (MissingVacant!6425 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37478 (_ BitVec 32)) SeekEntryResult!6425)

(assert (=> b!615655 (= lt!282869 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615656 () Bool)

(declare-fun res!396554 () Bool)

(assert (=> b!615656 (=> (not res!396554) (not e!352995))))

(assert (=> b!615656 (= res!396554 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615657 () Bool)

(declare-fun res!396558 () Bool)

(assert (=> b!615657 (=> (not res!396558) (not e!352995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615657 (= res!396558 (validKeyInArray!0 k!1786))))

(declare-fun b!615658 () Bool)

(declare-fun e!352997 () Bool)

(assert (=> b!615658 (= e!352997 (not true))))

(declare-fun lt!282873 () Unit!19978)

(declare-fun e!352993 () Unit!19978)

(assert (=> b!615658 (= lt!282873 e!352993)))

(declare-fun c!69915 () Bool)

(declare-fun lt!282865 () SeekEntryResult!6425)

(assert (=> b!615658 (= c!69915 (= lt!282865 (Found!6425 index!984)))))

(declare-fun lt!282868 () Unit!19978)

(assert (=> b!615658 (= lt!282868 e!352996)))

(declare-fun c!69914 () Bool)

(assert (=> b!615658 (= c!69914 (= lt!282865 Undefined!6425))))

(declare-fun lt!282859 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37478 (_ BitVec 32)) SeekEntryResult!6425)

(assert (=> b!615658 (= lt!282865 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282859 lt!282861 mask!3053))))

(declare-fun e!352992 () Bool)

(assert (=> b!615658 e!352992))

(declare-fun res!396560 () Bool)

(assert (=> b!615658 (=> (not res!396560) (not e!352992))))

(declare-fun lt!282858 () SeekEntryResult!6425)

(declare-fun lt!282876 () (_ BitVec 32))

(assert (=> b!615658 (= res!396560 (= lt!282858 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282876 vacantSpotIndex!68 lt!282859 lt!282861 mask!3053)))))

(assert (=> b!615658 (= lt!282858 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282876 vacantSpotIndex!68 (select (arr!17985 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615658 (= lt!282859 (select (store (arr!17985 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282862 () Unit!19978)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19978)

(assert (=> b!615658 (= lt!282862 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282876 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615658 (= lt!282876 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615659 () Bool)

(declare-fun Unit!19982 () Unit!19978)

(assert (=> b!615659 (= e!352999 Unit!19982)))

(declare-fun b!615660 () Bool)

(declare-fun e!352990 () Bool)

(assert (=> b!615660 (= e!352990 (arrayContainsKey!0 lt!282861 (select (arr!17985 a!2986) j!136) index!984))))

(declare-fun res!396565 () Bool)

(declare-fun b!615661 () Bool)

(assert (=> b!615661 (= res!396565 (arrayContainsKey!0 lt!282861 (select (arr!17985 a!2986) j!136) j!136))))

(assert (=> b!615661 (=> (not res!396565) (not e!352990))))

(declare-fun e!352991 () Bool)

(assert (=> b!615661 (= e!352991 e!352990)))

(declare-fun b!615662 () Bool)

(declare-fun e!352988 () Unit!19978)

(declare-fun Unit!19983 () Unit!19978)

(assert (=> b!615662 (= e!352988 Unit!19983)))

(declare-fun b!615663 () Bool)

(declare-fun Unit!19984 () Unit!19978)

(assert (=> b!615663 (= e!352996 Unit!19984)))

(declare-fun b!615664 () Bool)

(assert (=> b!615664 (= e!352998 e!352997)))

(declare-fun res!396561 () Bool)

(assert (=> b!615664 (=> (not res!396561) (not e!352997))))

(declare-fun lt!282871 () SeekEntryResult!6425)

(assert (=> b!615664 (= res!396561 (and (= lt!282871 (Found!6425 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17985 a!2986) index!984) (select (arr!17985 a!2986) j!136))) (not (= (select (arr!17985 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615664 (= lt!282871 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17985 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615665 () Bool)

(declare-fun res!396556 () Bool)

(assert (=> b!615665 (= res!396556 (bvsge j!136 index!984))))

(assert (=> b!615665 (=> res!396556 e!352991)))

(declare-fun e!352989 () Bool)

(assert (=> b!615665 (= e!352989 e!352991)))

(declare-fun b!615666 () Bool)

(declare-fun res!396563 () Bool)

(assert (=> b!615666 (=> (not res!396563) (not e!352995))))

(assert (=> b!615666 (= res!396563 (validKeyInArray!0 (select (arr!17985 a!2986) j!136)))))

(declare-fun b!615667 () Bool)

(declare-fun Unit!19985 () Unit!19978)

(assert (=> b!615667 (= e!352993 Unit!19985)))

(declare-fun b!615668 () Bool)

(declare-fun res!396569 () Bool)

(assert (=> b!615668 (=> (not res!396569) (not e!352994))))

(assert (=> b!615668 (= res!396569 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12023))))

(declare-fun b!615669 () Bool)

(assert (=> b!615669 (= e!352992 (= lt!282871 lt!282858))))

(declare-fun b!615670 () Bool)

(declare-fun Unit!19986 () Unit!19978)

(assert (=> b!615670 (= e!352993 Unit!19986)))

(declare-fun res!396567 () Bool)

(assert (=> b!615670 (= res!396567 (= (select (store (arr!17985 a!2986) i!1108 k!1786) index!984) (select (arr!17985 a!2986) j!136)))))

(assert (=> b!615670 (=> (not res!396567) (not e!352989))))

(assert (=> b!615670 e!352989))

(declare-fun c!69917 () Bool)

(assert (=> b!615670 (= c!69917 (bvslt j!136 index!984))))

(declare-fun lt!282877 () Unit!19978)

(assert (=> b!615670 (= lt!282877 e!352988)))

(declare-fun c!69916 () Bool)

(assert (=> b!615670 (= c!69916 (bvslt index!984 j!136))))

(declare-fun lt!282863 () Unit!19978)

(assert (=> b!615670 (= lt!282863 e!352999)))

(assert (=> b!615670 false))

(declare-fun b!615671 () Bool)

(assert (=> b!615671 false))

(declare-fun lt!282872 () Unit!19978)

(assert (=> b!615671 (= lt!282872 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282861 (select (arr!17985 a!2986) j!136) j!136 Nil!12023))))

(assert (=> b!615671 (arrayNoDuplicates!0 lt!282861 j!136 Nil!12023)))

(declare-fun lt!282867 () Unit!19978)

(assert (=> b!615671 (= lt!282867 (lemmaNoDuplicateFromThenFromBigger!0 lt!282861 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615671 (arrayNoDuplicates!0 lt!282861 #b00000000000000000000000000000000 Nil!12023)))

(declare-fun lt!282874 () Unit!19978)

(assert (=> b!615671 (= lt!282874 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12023))))

(assert (=> b!615671 (arrayContainsKey!0 lt!282861 (select (arr!17985 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282860 () Unit!19978)

(assert (=> b!615671 (= lt!282860 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282861 (select (arr!17985 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19987 () Unit!19978)

(assert (=> b!615671 (= e!352988 Unit!19987)))

(assert (= (and start!56008 res!396559) b!615652))

(assert (= (and b!615652 res!396564) b!615666))

(assert (= (and b!615666 res!396563) b!615657))

(assert (= (and b!615657 res!396558) b!615656))

(assert (= (and b!615656 res!396554) b!615655))

(assert (= (and b!615655 res!396555) b!615648))

(assert (= (and b!615648 res!396557) b!615668))

(assert (= (and b!615668 res!396569) b!615654))

(assert (= (and b!615654 res!396566) b!615649))

(assert (= (and b!615649 res!396568) b!615664))

(assert (= (and b!615664 res!396561) b!615658))

(assert (= (and b!615658 res!396560) b!615669))

(assert (= (and b!615658 c!69914) b!615653))

(assert (= (and b!615658 (not c!69914)) b!615663))

(assert (= (and b!615658 c!69915) b!615670))

(assert (= (and b!615658 (not c!69915)) b!615667))

(assert (= (and b!615670 res!396567) b!615665))

(assert (= (and b!615665 (not res!396556)) b!615661))

(assert (= (and b!615661 res!396565) b!615660))

(assert (= (and b!615670 c!69917) b!615671))

(assert (= (and b!615670 (not c!69917)) b!615662))

(assert (= (and b!615670 c!69916) b!615650))

(assert (= (and b!615670 (not c!69916)) b!615659))

(assert (= (and b!615650 res!396562) b!615651))

(declare-fun m!591845 () Bool)

(assert (=> b!615661 m!591845))

(assert (=> b!615661 m!591845))

(declare-fun m!591847 () Bool)

(assert (=> b!615661 m!591847))

(declare-fun m!591849 () Bool)

(assert (=> start!56008 m!591849))

(declare-fun m!591851 () Bool)

(assert (=> start!56008 m!591851))

(assert (=> b!615650 m!591845))

(declare-fun m!591853 () Bool)

(assert (=> b!615650 m!591853))

(assert (=> b!615650 m!591845))

(declare-fun m!591855 () Bool)

(assert (=> b!615650 m!591855))

(assert (=> b!615650 m!591845))

(declare-fun m!591857 () Bool)

(assert (=> b!615650 m!591857))

(assert (=> b!615650 m!591845))

(declare-fun m!591859 () Bool)

(assert (=> b!615650 m!591859))

(declare-fun m!591861 () Bool)

(assert (=> b!615650 m!591861))

(declare-fun m!591863 () Bool)

(assert (=> b!615650 m!591863))

(declare-fun m!591865 () Bool)

(assert (=> b!615650 m!591865))

(assert (=> b!615650 m!591845))

(assert (=> b!615650 m!591847))

(declare-fun m!591867 () Bool)

(assert (=> b!615668 m!591867))

(declare-fun m!591869 () Bool)

(assert (=> b!615656 m!591869))

(assert (=> b!615666 m!591845))

(assert (=> b!615666 m!591845))

(declare-fun m!591871 () Bool)

(assert (=> b!615666 m!591871))

(declare-fun m!591873 () Bool)

(assert (=> b!615658 m!591873))

(declare-fun m!591875 () Bool)

(assert (=> b!615658 m!591875))

(assert (=> b!615658 m!591845))

(declare-fun m!591877 () Bool)

(assert (=> b!615658 m!591877))

(declare-fun m!591879 () Bool)

(assert (=> b!615658 m!591879))

(declare-fun m!591881 () Bool)

(assert (=> b!615658 m!591881))

(declare-fun m!591883 () Bool)

(assert (=> b!615658 m!591883))

(assert (=> b!615658 m!591845))

(declare-fun m!591885 () Bool)

(assert (=> b!615658 m!591885))

(assert (=> b!615649 m!591877))

(declare-fun m!591887 () Bool)

(assert (=> b!615649 m!591887))

(declare-fun m!591889 () Bool)

(assert (=> b!615664 m!591889))

(assert (=> b!615664 m!591845))

(assert (=> b!615664 m!591845))

(declare-fun m!591891 () Bool)

(assert (=> b!615664 m!591891))

(assert (=> b!615660 m!591845))

(assert (=> b!615660 m!591845))

(declare-fun m!591893 () Bool)

(assert (=> b!615660 m!591893))

(declare-fun m!591895 () Bool)

(assert (=> b!615657 m!591895))

(declare-fun m!591897 () Bool)

(assert (=> b!615654 m!591897))

(assert (=> b!615651 m!591845))

(assert (=> b!615651 m!591845))

(assert (=> b!615651 m!591893))

(declare-fun m!591899 () Bool)

(assert (=> b!615655 m!591899))

(assert (=> b!615670 m!591877))

(declare-fun m!591901 () Bool)

(assert (=> b!615670 m!591901))

(assert (=> b!615670 m!591845))

(declare-fun m!591903 () Bool)

(assert (=> b!615648 m!591903))

(assert (=> b!615671 m!591845))

(declare-fun m!591905 () Bool)

(assert (=> b!615671 m!591905))

(assert (=> b!615671 m!591845))

(assert (=> b!615671 m!591845))

(declare-fun m!591907 () Bool)

(assert (=> b!615671 m!591907))

(assert (=> b!615671 m!591845))

(declare-fun m!591909 () Bool)

(assert (=> b!615671 m!591909))

(declare-fun m!591911 () Bool)

(assert (=> b!615671 m!591911))

(assert (=> b!615671 m!591863))

(declare-fun m!591913 () Bool)

(assert (=> b!615671 m!591913))

(assert (=> b!615671 m!591861))

(push 1)

