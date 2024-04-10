; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56014 () Bool)

(assert start!56014)

(declare-fun b!615864 () Bool)

(declare-fun e!353124 () Bool)

(declare-fun e!353121 () Bool)

(assert (=> b!615864 (= e!353124 e!353121)))

(declare-fun res!396710 () Bool)

(assert (=> b!615864 (=> (not res!396710) (not e!353121))))

(declare-datatypes ((SeekEntryResult!6428 0))(
  ( (MissingZero!6428 (index!27996 (_ BitVec 32))) (Found!6428 (index!27997 (_ BitVec 32))) (Intermediate!6428 (undefined!7240 Bool) (index!27998 (_ BitVec 32)) (x!56796 (_ BitVec 32))) (Undefined!6428) (MissingVacant!6428 (index!27999 (_ BitVec 32))) )
))
(declare-fun lt!283047 () SeekEntryResult!6428)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615864 (= res!396710 (or (= lt!283047 (MissingZero!6428 i!1108)) (= lt!283047 (MissingVacant!6428 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37484 0))(
  ( (array!37485 (arr!17988 (Array (_ BitVec 32) (_ BitVec 64))) (size!18352 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37484)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37484 (_ BitVec 32)) SeekEntryResult!6428)

(assert (=> b!615864 (= lt!283047 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615865 () Bool)

(declare-fun e!353116 () Bool)

(declare-fun e!353122 () Bool)

(assert (=> b!615865 (= e!353116 e!353122)))

(declare-fun res!396703 () Bool)

(assert (=> b!615865 (=> (not res!396703) (not e!353122))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!283038 () SeekEntryResult!6428)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615865 (= res!396703 (and (= lt!283038 (Found!6428 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17988 a!2986) index!984) (select (arr!17988 a!2986) j!136))) (not (= (select (arr!17988 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37484 (_ BitVec 32)) SeekEntryResult!6428)

(assert (=> b!615865 (= lt!283038 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17988 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615866 () Bool)

(declare-datatypes ((Unit!20008 0))(
  ( (Unit!20009) )
))
(declare-fun e!353118 () Unit!20008)

(declare-fun Unit!20010 () Unit!20008)

(assert (=> b!615866 (= e!353118 Unit!20010)))

(declare-fun b!615867 () Bool)

(declare-fun e!353127 () Unit!20008)

(declare-fun Unit!20011 () Unit!20008)

(assert (=> b!615867 (= e!353127 Unit!20011)))

(declare-fun b!615868 () Bool)

(assert (=> b!615868 (= e!353122 (not true))))

(declare-fun lt!283055 () Unit!20008)

(declare-fun e!353117 () Unit!20008)

(assert (=> b!615868 (= lt!283055 e!353117)))

(declare-fun c!69952 () Bool)

(declare-fun lt!283041 () SeekEntryResult!6428)

(assert (=> b!615868 (= c!69952 (= lt!283041 (Found!6428 index!984)))))

(declare-fun lt!283044 () Unit!20008)

(assert (=> b!615868 (= lt!283044 e!353118)))

(declare-fun c!69951 () Bool)

(assert (=> b!615868 (= c!69951 (= lt!283041 Undefined!6428))))

(declare-fun lt!283049 () array!37484)

(declare-fun lt!283040 () (_ BitVec 64))

(assert (=> b!615868 (= lt!283041 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283040 lt!283049 mask!3053))))

(declare-fun e!353126 () Bool)

(assert (=> b!615868 e!353126))

(declare-fun res!396704 () Bool)

(assert (=> b!615868 (=> (not res!396704) (not e!353126))))

(declare-fun lt!283046 () (_ BitVec 32))

(declare-fun lt!283054 () SeekEntryResult!6428)

(assert (=> b!615868 (= res!396704 (= lt!283054 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283046 vacantSpotIndex!68 lt!283040 lt!283049 mask!3053)))))

(assert (=> b!615868 (= lt!283054 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283046 vacantSpotIndex!68 (select (arr!17988 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615868 (= lt!283040 (select (store (arr!17988 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283057 () Unit!20008)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20008)

(assert (=> b!615868 (= lt!283057 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283046 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615868 (= lt!283046 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615869 () Bool)

(declare-fun Unit!20012 () Unit!20008)

(assert (=> b!615869 (= e!353117 Unit!20012)))

(declare-fun b!615870 () Bool)

(declare-fun res!396709 () Bool)

(assert (=> b!615870 (= res!396709 (bvsge j!136 index!984))))

(declare-fun e!353115 () Bool)

(assert (=> b!615870 (=> res!396709 e!353115)))

(declare-fun e!353119 () Bool)

(assert (=> b!615870 (= e!353119 e!353115)))

(declare-fun b!615871 () Bool)

(declare-fun res!396698 () Bool)

(assert (=> b!615871 (=> (not res!396698) (not e!353124))))

(declare-fun arrayContainsKey!0 (array!37484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615871 (= res!396698 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615872 () Bool)

(assert (=> b!615872 (= e!353126 (= lt!283038 lt!283054))))

(declare-fun b!615873 () Bool)

(assert (=> b!615873 false))

(declare-fun lt!283045 () Unit!20008)

(declare-datatypes ((List!12029 0))(
  ( (Nil!12026) (Cons!12025 (h!13070 (_ BitVec 64)) (t!18257 List!12029)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37484 (_ BitVec 64) (_ BitVec 32) List!12029) Unit!20008)

(assert (=> b!615873 (= lt!283045 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283049 (select (arr!17988 a!2986) j!136) j!136 Nil!12026))))

(declare-fun arrayNoDuplicates!0 (array!37484 (_ BitVec 32) List!12029) Bool)

(assert (=> b!615873 (arrayNoDuplicates!0 lt!283049 j!136 Nil!12026)))

(declare-fun lt!283053 () Unit!20008)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37484 (_ BitVec 32) (_ BitVec 32)) Unit!20008)

(assert (=> b!615873 (= lt!283053 (lemmaNoDuplicateFromThenFromBigger!0 lt!283049 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615873 (arrayNoDuplicates!0 lt!283049 #b00000000000000000000000000000000 Nil!12026)))

(declare-fun lt!283051 () Unit!20008)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12029) Unit!20008)

(assert (=> b!615873 (= lt!283051 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12026))))

(assert (=> b!615873 (arrayContainsKey!0 lt!283049 (select (arr!17988 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283039 () Unit!20008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20008)

(assert (=> b!615873 (= lt!283039 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283049 (select (arr!17988 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353125 () Unit!20008)

(declare-fun Unit!20013 () Unit!20008)

(assert (=> b!615873 (= e!353125 Unit!20013)))

(declare-fun b!615874 () Bool)

(declare-fun res!396707 () Bool)

(assert (=> b!615874 (=> (not res!396707) (not e!353124))))

(assert (=> b!615874 (= res!396707 (and (= (size!18352 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18352 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18352 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615875 () Bool)

(declare-fun res!396711 () Bool)

(assert (=> b!615875 (=> (not res!396711) (not e!353121))))

(assert (=> b!615875 (= res!396711 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17988 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615876 () Bool)

(declare-fun res!396699 () Bool)

(assert (=> b!615876 (=> (not res!396699) (not e!353124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615876 (= res!396699 (validKeyInArray!0 k!1786))))

(declare-fun b!615877 () Bool)

(declare-fun e!353114 () Bool)

(assert (=> b!615877 (= e!353114 (arrayContainsKey!0 lt!283049 (select (arr!17988 a!2986) j!136) index!984))))

(declare-fun b!615878 () Bool)

(declare-fun res!396702 () Bool)

(assert (=> b!615878 (=> (not res!396702) (not e!353124))))

(assert (=> b!615878 (= res!396702 (validKeyInArray!0 (select (arr!17988 a!2986) j!136)))))

(declare-fun b!615879 () Bool)

(declare-fun res!396708 () Bool)

(assert (=> b!615879 (=> (not res!396708) (not e!353121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37484 (_ BitVec 32)) Bool)

(assert (=> b!615879 (= res!396708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!396712 () Bool)

(assert (=> start!56014 (=> (not res!396712) (not e!353124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56014 (= res!396712 (validMask!0 mask!3053))))

(assert (=> start!56014 e!353124))

(assert (=> start!56014 true))

(declare-fun array_inv!13784 (array!37484) Bool)

(assert (=> start!56014 (array_inv!13784 a!2986)))

(declare-fun b!615880 () Bool)

(declare-fun Unit!20014 () Unit!20008)

(assert (=> b!615880 (= e!353118 Unit!20014)))

(assert (=> b!615880 false))

(declare-fun b!615881 () Bool)

(declare-fun Unit!20015 () Unit!20008)

(assert (=> b!615881 (= e!353125 Unit!20015)))

(declare-fun b!615882 () Bool)

(declare-fun Unit!20016 () Unit!20008)

(assert (=> b!615882 (= e!353117 Unit!20016)))

(declare-fun res!396713 () Bool)

(assert (=> b!615882 (= res!396713 (= (select (store (arr!17988 a!2986) i!1108 k!1786) index!984) (select (arr!17988 a!2986) j!136)))))

(assert (=> b!615882 (=> (not res!396713) (not e!353119))))

(assert (=> b!615882 e!353119))

(declare-fun c!69950 () Bool)

(assert (=> b!615882 (= c!69950 (bvslt j!136 index!984))))

(declare-fun lt!283052 () Unit!20008)

(assert (=> b!615882 (= lt!283052 e!353125)))

(declare-fun c!69953 () Bool)

(assert (=> b!615882 (= c!69953 (bvslt index!984 j!136))))

(declare-fun lt!283056 () Unit!20008)

(assert (=> b!615882 (= lt!283056 e!353127)))

(assert (=> b!615882 false))

(declare-fun b!615883 () Bool)

(assert (=> b!615883 false))

(declare-fun lt!283050 () Unit!20008)

(assert (=> b!615883 (= lt!283050 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283049 (select (arr!17988 a!2986) j!136) index!984 Nil!12026))))

(assert (=> b!615883 (arrayNoDuplicates!0 lt!283049 index!984 Nil!12026)))

(declare-fun lt!283042 () Unit!20008)

(assert (=> b!615883 (= lt!283042 (lemmaNoDuplicateFromThenFromBigger!0 lt!283049 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615883 (arrayNoDuplicates!0 lt!283049 #b00000000000000000000000000000000 Nil!12026)))

(declare-fun lt!283048 () Unit!20008)

(assert (=> b!615883 (= lt!283048 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12026))))

(assert (=> b!615883 (arrayContainsKey!0 lt!283049 (select (arr!17988 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283043 () Unit!20008)

(assert (=> b!615883 (= lt!283043 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283049 (select (arr!17988 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615883 e!353114))

(declare-fun res!396701 () Bool)

(assert (=> b!615883 (=> (not res!396701) (not e!353114))))

(assert (=> b!615883 (= res!396701 (arrayContainsKey!0 lt!283049 (select (arr!17988 a!2986) j!136) j!136))))

(declare-fun Unit!20017 () Unit!20008)

(assert (=> b!615883 (= e!353127 Unit!20017)))

(declare-fun res!396706 () Bool)

(declare-fun b!615884 () Bool)

(assert (=> b!615884 (= res!396706 (arrayContainsKey!0 lt!283049 (select (arr!17988 a!2986) j!136) j!136))))

(declare-fun e!353123 () Bool)

(assert (=> b!615884 (=> (not res!396706) (not e!353123))))

(assert (=> b!615884 (= e!353115 e!353123)))

(declare-fun b!615885 () Bool)

(declare-fun res!396700 () Bool)

(assert (=> b!615885 (=> (not res!396700) (not e!353121))))

(assert (=> b!615885 (= res!396700 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12026))))

(declare-fun b!615886 () Bool)

(assert (=> b!615886 (= e!353123 (arrayContainsKey!0 lt!283049 (select (arr!17988 a!2986) j!136) index!984))))

(declare-fun b!615887 () Bool)

(assert (=> b!615887 (= e!353121 e!353116)))

(declare-fun res!396705 () Bool)

(assert (=> b!615887 (=> (not res!396705) (not e!353116))))

(assert (=> b!615887 (= res!396705 (= (select (store (arr!17988 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615887 (= lt!283049 (array!37485 (store (arr!17988 a!2986) i!1108 k!1786) (size!18352 a!2986)))))

(assert (= (and start!56014 res!396712) b!615874))

(assert (= (and b!615874 res!396707) b!615878))

(assert (= (and b!615878 res!396702) b!615876))

(assert (= (and b!615876 res!396699) b!615871))

(assert (= (and b!615871 res!396698) b!615864))

(assert (= (and b!615864 res!396710) b!615879))

(assert (= (and b!615879 res!396708) b!615885))

(assert (= (and b!615885 res!396700) b!615875))

(assert (= (and b!615875 res!396711) b!615887))

(assert (= (and b!615887 res!396705) b!615865))

(assert (= (and b!615865 res!396703) b!615868))

(assert (= (and b!615868 res!396704) b!615872))

(assert (= (and b!615868 c!69951) b!615880))

(assert (= (and b!615868 (not c!69951)) b!615866))

(assert (= (and b!615868 c!69952) b!615882))

(assert (= (and b!615868 (not c!69952)) b!615869))

(assert (= (and b!615882 res!396713) b!615870))

(assert (= (and b!615870 (not res!396709)) b!615884))

(assert (= (and b!615884 res!396706) b!615886))

(assert (= (and b!615882 c!69950) b!615873))

(assert (= (and b!615882 (not c!69950)) b!615881))

(assert (= (and b!615882 c!69953) b!615883))

(assert (= (and b!615882 (not c!69953)) b!615867))

(assert (= (and b!615883 res!396701) b!615877))

(declare-fun m!592055 () Bool)

(assert (=> b!615886 m!592055))

(assert (=> b!615886 m!592055))

(declare-fun m!592057 () Bool)

(assert (=> b!615886 m!592057))

(declare-fun m!592059 () Bool)

(assert (=> b!615876 m!592059))

(declare-fun m!592061 () Bool)

(assert (=> b!615873 m!592061))

(declare-fun m!592063 () Bool)

(assert (=> b!615873 m!592063))

(assert (=> b!615873 m!592055))

(assert (=> b!615873 m!592055))

(declare-fun m!592065 () Bool)

(assert (=> b!615873 m!592065))

(assert (=> b!615873 m!592055))

(declare-fun m!592067 () Bool)

(assert (=> b!615873 m!592067))

(declare-fun m!592069 () Bool)

(assert (=> b!615873 m!592069))

(assert (=> b!615873 m!592055))

(declare-fun m!592071 () Bool)

(assert (=> b!615873 m!592071))

(declare-fun m!592073 () Bool)

(assert (=> b!615873 m!592073))

(assert (=> b!615877 m!592055))

(assert (=> b!615877 m!592055))

(assert (=> b!615877 m!592057))

(assert (=> b!615883 m!592055))

(declare-fun m!592075 () Bool)

(assert (=> b!615883 m!592075))

(assert (=> b!615883 m!592061))

(assert (=> b!615883 m!592055))

(declare-fun m!592077 () Bool)

(assert (=> b!615883 m!592077))

(assert (=> b!615883 m!592055))

(declare-fun m!592079 () Bool)

(assert (=> b!615883 m!592079))

(declare-fun m!592081 () Bool)

(assert (=> b!615883 m!592081))

(assert (=> b!615883 m!592055))

(declare-fun m!592083 () Bool)

(assert (=> b!615883 m!592083))

(assert (=> b!615883 m!592055))

(declare-fun m!592085 () Bool)

(assert (=> b!615883 m!592085))

(assert (=> b!615883 m!592069))

(assert (=> b!615884 m!592055))

(assert (=> b!615884 m!592055))

(assert (=> b!615884 m!592085))

(declare-fun m!592087 () Bool)

(assert (=> b!615882 m!592087))

(declare-fun m!592089 () Bool)

(assert (=> b!615882 m!592089))

(assert (=> b!615882 m!592055))

(declare-fun m!592091 () Bool)

(assert (=> b!615865 m!592091))

(assert (=> b!615865 m!592055))

(assert (=> b!615865 m!592055))

(declare-fun m!592093 () Bool)

(assert (=> b!615865 m!592093))

(declare-fun m!592095 () Bool)

(assert (=> b!615864 m!592095))

(declare-fun m!592097 () Bool)

(assert (=> b!615868 m!592097))

(assert (=> b!615868 m!592055))

(assert (=> b!615868 m!592087))

(declare-fun m!592099 () Bool)

(assert (=> b!615868 m!592099))

(declare-fun m!592101 () Bool)

(assert (=> b!615868 m!592101))

(declare-fun m!592103 () Bool)

(assert (=> b!615868 m!592103))

(assert (=> b!615868 m!592055))

(declare-fun m!592105 () Bool)

(assert (=> b!615868 m!592105))

(declare-fun m!592107 () Bool)

(assert (=> b!615868 m!592107))

(assert (=> b!615878 m!592055))

(assert (=> b!615878 m!592055))

(declare-fun m!592109 () Bool)

(assert (=> b!615878 m!592109))

(assert (=> b!615887 m!592087))

(declare-fun m!592111 () Bool)

(assert (=> b!615887 m!592111))

(declare-fun m!592113 () Bool)

(assert (=> b!615875 m!592113))

(declare-fun m!592115 () Bool)

(assert (=> b!615871 m!592115))

(declare-fun m!592117 () Bool)

(assert (=> b!615879 m!592117))

(declare-fun m!592119 () Bool)

(assert (=> start!56014 m!592119))

(declare-fun m!592121 () Bool)

(assert (=> start!56014 m!592121))

(declare-fun m!592123 () Bool)

(assert (=> b!615885 m!592123))

(push 1)

