; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54512 () Bool)

(assert start!54512)

(declare-fun b!595033 () Bool)

(declare-fun res!380948 () Bool)

(declare-fun e!339973 () Bool)

(assert (=> b!595033 (=> (not res!380948) (not e!339973))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36972 0))(
  ( (array!36973 (arr!17750 (Array (_ BitVec 32) (_ BitVec 64))) (size!18114 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36972)

(assert (=> b!595033 (= res!380948 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17750 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595034 () Bool)

(declare-fun res!380961 () Bool)

(assert (=> b!595034 (=> (not res!380961) (not e!339973))))

(declare-datatypes ((List!11791 0))(
  ( (Nil!11788) (Cons!11787 (h!12832 (_ BitVec 64)) (t!18019 List!11791)) )
))
(declare-fun arrayNoDuplicates!0 (array!36972 (_ BitVec 32) List!11791) Bool)

(assert (=> b!595034 (= res!380961 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11788))))

(declare-fun b!595035 () Bool)

(declare-fun res!380947 () Bool)

(declare-fun e!339979 () Bool)

(assert (=> b!595035 (=> res!380947 e!339979)))

(declare-fun contains!2926 (List!11791 (_ BitVec 64)) Bool)

(assert (=> b!595035 (= res!380947 (contains!2926 Nil!11788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595036 () Bool)

(declare-fun res!380963 () Bool)

(assert (=> b!595036 (=> res!380963 e!339979)))

(assert (=> b!595036 (= res!380963 (contains!2926 Nil!11788 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595037 () Bool)

(declare-fun e!339974 () Bool)

(declare-fun e!339975 () Bool)

(assert (=> b!595037 (= e!339974 (not e!339975))))

(declare-fun res!380950 () Bool)

(assert (=> b!595037 (=> res!380950 e!339975)))

(declare-datatypes ((SeekEntryResult!6190 0))(
  ( (MissingZero!6190 (index!27008 (_ BitVec 32))) (Found!6190 (index!27009 (_ BitVec 32))) (Intermediate!6190 (undefined!7002 Bool) (index!27010 (_ BitVec 32)) (x!55810 (_ BitVec 32))) (Undefined!6190) (MissingVacant!6190 (index!27011 (_ BitVec 32))) )
))
(declare-fun lt!270167 () SeekEntryResult!6190)

(assert (=> b!595037 (= res!380950 (not (= lt!270167 (Found!6190 index!984))))))

(declare-datatypes ((Unit!18678 0))(
  ( (Unit!18679) )
))
(declare-fun lt!270163 () Unit!18678)

(declare-fun e!339972 () Unit!18678)

(assert (=> b!595037 (= lt!270163 e!339972)))

(declare-fun c!67412 () Bool)

(assert (=> b!595037 (= c!67412 (= lt!270167 Undefined!6190))))

(declare-fun lt!270169 () (_ BitVec 64))

(declare-fun lt!270158 () array!36972)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36972 (_ BitVec 32)) SeekEntryResult!6190)

(assert (=> b!595037 (= lt!270167 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270169 lt!270158 mask!3053))))

(declare-fun e!339984 () Bool)

(assert (=> b!595037 e!339984))

(declare-fun res!380953 () Bool)

(assert (=> b!595037 (=> (not res!380953) (not e!339984))))

(declare-fun lt!270162 () SeekEntryResult!6190)

(declare-fun lt!270164 () (_ BitVec 32))

(assert (=> b!595037 (= res!380953 (= lt!270162 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270164 vacantSpotIndex!68 lt!270169 lt!270158 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595037 (= lt!270162 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270164 vacantSpotIndex!68 (select (arr!17750 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!595037 (= lt!270169 (select (store (arr!17750 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270165 () Unit!18678)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36972 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18678)

(assert (=> b!595037 (= lt!270165 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270164 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595037 (= lt!270164 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595038 () Bool)

(declare-fun res!380962 () Bool)

(declare-fun e!339981 () Bool)

(assert (=> b!595038 (=> (not res!380962) (not e!339981))))

(assert (=> b!595038 (= res!380962 (and (= (size!18114 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18114 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18114 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595039 () Bool)

(declare-fun res!380960 () Bool)

(assert (=> b!595039 (=> (not res!380960) (not e!339981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595039 (= res!380960 (validKeyInArray!0 k!1786))))

(declare-fun b!595040 () Bool)

(declare-fun e!339978 () Bool)

(assert (=> b!595040 (= e!339975 e!339978)))

(declare-fun res!380956 () Bool)

(assert (=> b!595040 (=> res!380956 e!339978)))

(declare-fun lt!270160 () (_ BitVec 64))

(assert (=> b!595040 (= res!380956 (or (not (= (select (arr!17750 a!2986) j!136) lt!270169)) (not (= (select (arr!17750 a!2986) j!136) lt!270160)) (bvsge j!136 index!984)))))

(declare-fun e!339982 () Bool)

(assert (=> b!595040 e!339982))

(declare-fun res!380949 () Bool)

(assert (=> b!595040 (=> (not res!380949) (not e!339982))))

(assert (=> b!595040 (= res!380949 (= lt!270160 (select (arr!17750 a!2986) j!136)))))

(assert (=> b!595040 (= lt!270160 (select (store (arr!17750 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595041 () Bool)

(declare-fun e!339983 () Bool)

(declare-fun e!339977 () Bool)

(assert (=> b!595041 (= e!339983 e!339977)))

(declare-fun res!380943 () Bool)

(assert (=> b!595041 (=> (not res!380943) (not e!339977))))

(declare-fun arrayContainsKey!0 (array!36972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595041 (= res!380943 (arrayContainsKey!0 lt!270158 (select (arr!17750 a!2986) j!136) j!136))))

(declare-fun b!595042 () Bool)

(declare-fun res!380944 () Bool)

(assert (=> b!595042 (=> (not res!380944) (not e!339973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36972 (_ BitVec 32)) Bool)

(assert (=> b!595042 (= res!380944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595043 () Bool)

(assert (=> b!595043 (= e!339981 e!339973)))

(declare-fun res!380951 () Bool)

(assert (=> b!595043 (=> (not res!380951) (not e!339973))))

(declare-fun lt!270166 () SeekEntryResult!6190)

(assert (=> b!595043 (= res!380951 (or (= lt!270166 (MissingZero!6190 i!1108)) (= lt!270166 (MissingVacant!6190 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36972 (_ BitVec 32)) SeekEntryResult!6190)

(assert (=> b!595043 (= lt!270166 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595044 () Bool)

(declare-fun res!380957 () Bool)

(assert (=> b!595044 (=> res!380957 e!339979)))

(declare-fun noDuplicate!245 (List!11791) Bool)

(assert (=> b!595044 (= res!380957 (not (noDuplicate!245 Nil!11788)))))

(declare-fun b!595045 () Bool)

(declare-fun Unit!18680 () Unit!18678)

(assert (=> b!595045 (= e!339972 Unit!18680)))

(declare-fun b!595046 () Bool)

(declare-fun res!380958 () Bool)

(assert (=> b!595046 (=> (not res!380958) (not e!339981))))

(assert (=> b!595046 (= res!380958 (validKeyInArray!0 (select (arr!17750 a!2986) j!136)))))

(declare-fun b!595047 () Bool)

(assert (=> b!595047 (= e!339978 e!339979)))

(declare-fun res!380945 () Bool)

(assert (=> b!595047 (=> res!380945 e!339979)))

(assert (=> b!595047 (= res!380945 (or (bvsge (size!18114 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18114 a!2986))))))

(assert (=> b!595047 (arrayContainsKey!0 lt!270158 (select (arr!17750 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270161 () Unit!18678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36972 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18678)

(assert (=> b!595047 (= lt!270161 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270158 (select (arr!17750 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595048 () Bool)

(declare-fun lt!270168 () SeekEntryResult!6190)

(assert (=> b!595048 (= e!339984 (= lt!270168 lt!270162))))

(declare-fun b!595049 () Bool)

(declare-fun Unit!18681 () Unit!18678)

(assert (=> b!595049 (= e!339972 Unit!18681)))

(assert (=> b!595049 false))

(declare-fun b!595050 () Bool)

(declare-fun e!339976 () Bool)

(assert (=> b!595050 (= e!339976 e!339974)))

(declare-fun res!380954 () Bool)

(assert (=> b!595050 (=> (not res!380954) (not e!339974))))

(assert (=> b!595050 (= res!380954 (and (= lt!270168 (Found!6190 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17750 a!2986) index!984) (select (arr!17750 a!2986) j!136))) (not (= (select (arr!17750 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595050 (= lt!270168 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17750 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595051 () Bool)

(assert (=> b!595051 (= e!339979 true)))

(declare-fun lt!270159 () Bool)

(assert (=> b!595051 (= lt!270159 (contains!2926 Nil!11788 k!1786))))

(declare-fun b!595052 () Bool)

(assert (=> b!595052 (= e!339982 e!339983)))

(declare-fun res!380952 () Bool)

(assert (=> b!595052 (=> res!380952 e!339983)))

(assert (=> b!595052 (= res!380952 (or (not (= (select (arr!17750 a!2986) j!136) lt!270169)) (not (= (select (arr!17750 a!2986) j!136) lt!270160)) (bvsge j!136 index!984)))))

(declare-fun b!595053 () Bool)

(declare-fun res!380959 () Bool)

(assert (=> b!595053 (=> (not res!380959) (not e!339981))))

(assert (=> b!595053 (= res!380959 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!380946 () Bool)

(assert (=> start!54512 (=> (not res!380946) (not e!339981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54512 (= res!380946 (validMask!0 mask!3053))))

(assert (=> start!54512 e!339981))

(assert (=> start!54512 true))

(declare-fun array_inv!13546 (array!36972) Bool)

(assert (=> start!54512 (array_inv!13546 a!2986)))

(declare-fun b!595054 () Bool)

(assert (=> b!595054 (= e!339973 e!339976)))

(declare-fun res!380955 () Bool)

(assert (=> b!595054 (=> (not res!380955) (not e!339976))))

(assert (=> b!595054 (= res!380955 (= (select (store (arr!17750 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595054 (= lt!270158 (array!36973 (store (arr!17750 a!2986) i!1108 k!1786) (size!18114 a!2986)))))

(declare-fun b!595055 () Bool)

(assert (=> b!595055 (= e!339977 (arrayContainsKey!0 lt!270158 (select (arr!17750 a!2986) j!136) index!984))))

(assert (= (and start!54512 res!380946) b!595038))

(assert (= (and b!595038 res!380962) b!595046))

(assert (= (and b!595046 res!380958) b!595039))

(assert (= (and b!595039 res!380960) b!595053))

(assert (= (and b!595053 res!380959) b!595043))

(assert (= (and b!595043 res!380951) b!595042))

(assert (= (and b!595042 res!380944) b!595034))

(assert (= (and b!595034 res!380961) b!595033))

(assert (= (and b!595033 res!380948) b!595054))

(assert (= (and b!595054 res!380955) b!595050))

(assert (= (and b!595050 res!380954) b!595037))

(assert (= (and b!595037 res!380953) b!595048))

(assert (= (and b!595037 c!67412) b!595049))

(assert (= (and b!595037 (not c!67412)) b!595045))

(assert (= (and b!595037 (not res!380950)) b!595040))

(assert (= (and b!595040 res!380949) b!595052))

(assert (= (and b!595052 (not res!380952)) b!595041))

(assert (= (and b!595041 res!380943) b!595055))

(assert (= (and b!595040 (not res!380956)) b!595047))

(assert (= (and b!595047 (not res!380945)) b!595044))

(assert (= (and b!595044 (not res!380957)) b!595035))

(assert (= (and b!595035 (not res!380947)) b!595036))

(assert (= (and b!595036 (not res!380963)) b!595051))

(declare-fun m!572749 () Bool)

(assert (=> b!595035 m!572749))

(declare-fun m!572751 () Bool)

(assert (=> b!595044 m!572751))

(declare-fun m!572753 () Bool)

(assert (=> b!595039 m!572753))

(declare-fun m!572755 () Bool)

(assert (=> b!595036 m!572755))

(declare-fun m!572757 () Bool)

(assert (=> b!595040 m!572757))

(declare-fun m!572759 () Bool)

(assert (=> b!595040 m!572759))

(declare-fun m!572761 () Bool)

(assert (=> b!595040 m!572761))

(declare-fun m!572763 () Bool)

(assert (=> b!595033 m!572763))

(declare-fun m!572765 () Bool)

(assert (=> b!595037 m!572765))

(declare-fun m!572767 () Bool)

(assert (=> b!595037 m!572767))

(assert (=> b!595037 m!572757))

(assert (=> b!595037 m!572759))

(declare-fun m!572769 () Bool)

(assert (=> b!595037 m!572769))

(declare-fun m!572771 () Bool)

(assert (=> b!595037 m!572771))

(declare-fun m!572773 () Bool)

(assert (=> b!595037 m!572773))

(assert (=> b!595037 m!572757))

(declare-fun m!572775 () Bool)

(assert (=> b!595037 m!572775))

(assert (=> b!595055 m!572757))

(assert (=> b!595055 m!572757))

(declare-fun m!572777 () Bool)

(assert (=> b!595055 m!572777))

(declare-fun m!572779 () Bool)

(assert (=> b!595051 m!572779))

(assert (=> b!595046 m!572757))

(assert (=> b!595046 m!572757))

(declare-fun m!572781 () Bool)

(assert (=> b!595046 m!572781))

(declare-fun m!572783 () Bool)

(assert (=> b!595053 m!572783))

(declare-fun m!572785 () Bool)

(assert (=> b!595050 m!572785))

(assert (=> b!595050 m!572757))

(assert (=> b!595050 m!572757))

(declare-fun m!572787 () Bool)

(assert (=> b!595050 m!572787))

(assert (=> b!595047 m!572757))

(assert (=> b!595047 m!572757))

(declare-fun m!572789 () Bool)

(assert (=> b!595047 m!572789))

(assert (=> b!595047 m!572757))

(declare-fun m!572791 () Bool)

(assert (=> b!595047 m!572791))

(declare-fun m!572793 () Bool)

(assert (=> start!54512 m!572793))

(declare-fun m!572795 () Bool)

(assert (=> start!54512 m!572795))

(declare-fun m!572797 () Bool)

(assert (=> b!595034 m!572797))

(declare-fun m!572799 () Bool)

(assert (=> b!595042 m!572799))

(assert (=> b!595054 m!572759))

(declare-fun m!572801 () Bool)

(assert (=> b!595054 m!572801))

(declare-fun m!572803 () Bool)

(assert (=> b!595043 m!572803))

(assert (=> b!595052 m!572757))

(assert (=> b!595041 m!572757))

(assert (=> b!595041 m!572757))

(declare-fun m!572805 () Bool)

(assert (=> b!595041 m!572805))

(push 1)

