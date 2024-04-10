; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56210 () Bool)

(assert start!56210)

(declare-fun b!623073 () Bool)

(declare-fun res!401569 () Bool)

(declare-fun e!357389 () Bool)

(assert (=> b!623073 (=> (not res!401569) (not e!357389))))

(declare-datatypes ((array!37680 0))(
  ( (array!37681 (arr!18086 (Array (_ BitVec 32) (_ BitVec 64))) (size!18450 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37680)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37680 (_ BitVec 32)) Bool)

(assert (=> b!623073 (= res!401569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!623074 () Bool)

(declare-fun lt!288926 () array!37680)

(declare-fun e!357391 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623074 (= e!357391 (arrayContainsKey!0 lt!288926 (select (arr!18086 a!2986) j!136) index!984))))

(declare-fun b!623075 () Bool)

(declare-fun res!401561 () Bool)

(assert (=> b!623075 (=> (not res!401561) (not e!357389))))

(declare-datatypes ((List!12127 0))(
  ( (Nil!12124) (Cons!12123 (h!13168 (_ BitVec 64)) (t!18355 List!12127)) )
))
(declare-fun arrayNoDuplicates!0 (array!37680 (_ BitVec 32) List!12127) Bool)

(assert (=> b!623075 (= res!401561 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12124))))

(declare-fun b!623076 () Bool)

(declare-datatypes ((Unit!20988 0))(
  ( (Unit!20989) )
))
(declare-fun e!357385 () Unit!20988)

(declare-fun Unit!20990 () Unit!20988)

(assert (=> b!623076 (= e!357385 Unit!20990)))

(assert (=> b!623076 false))

(declare-fun b!623077 () Bool)

(declare-fun e!357396 () Bool)

(declare-datatypes ((SeekEntryResult!6526 0))(
  ( (MissingZero!6526 (index!28388 (_ BitVec 32))) (Found!6526 (index!28389 (_ BitVec 32))) (Intermediate!6526 (undefined!7338 Bool) (index!28390 (_ BitVec 32)) (x!57150 (_ BitVec 32))) (Undefined!6526) (MissingVacant!6526 (index!28391 (_ BitVec 32))) )
))
(declare-fun lt!288936 () SeekEntryResult!6526)

(declare-fun lt!288934 () SeekEntryResult!6526)

(assert (=> b!623077 (= e!357396 (= lt!288936 lt!288934))))

(declare-fun b!623078 () Bool)

(assert (=> b!623078 false))

(declare-fun lt!288927 () Unit!20988)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37680 (_ BitVec 64) (_ BitVec 32) List!12127) Unit!20988)

(assert (=> b!623078 (= lt!288927 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288926 (select (arr!18086 a!2986) j!136) index!984 Nil!12124))))

(assert (=> b!623078 (arrayNoDuplicates!0 lt!288926 index!984 Nil!12124)))

(declare-fun lt!288920 () Unit!20988)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37680 (_ BitVec 32) (_ BitVec 32)) Unit!20988)

(assert (=> b!623078 (= lt!288920 (lemmaNoDuplicateFromThenFromBigger!0 lt!288926 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623078 (arrayNoDuplicates!0 lt!288926 #b00000000000000000000000000000000 Nil!12124)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!288929 () Unit!20988)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12127) Unit!20988)

(assert (=> b!623078 (= lt!288929 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12124))))

(assert (=> b!623078 (arrayContainsKey!0 lt!288926 (select (arr!18086 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288937 () Unit!20988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20988)

(assert (=> b!623078 (= lt!288937 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288926 (select (arr!18086 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623078 e!357391))

(declare-fun res!401563 () Bool)

(assert (=> b!623078 (=> (not res!401563) (not e!357391))))

(assert (=> b!623078 (= res!401563 (arrayContainsKey!0 lt!288926 (select (arr!18086 a!2986) j!136) j!136))))

(declare-fun e!357388 () Unit!20988)

(declare-fun Unit!20991 () Unit!20988)

(assert (=> b!623078 (= e!357388 Unit!20991)))

(declare-fun b!623079 () Bool)

(assert (=> b!623079 false))

(declare-fun lt!288928 () Unit!20988)

(assert (=> b!623079 (= lt!288928 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288926 (select (arr!18086 a!2986) j!136) j!136 Nil!12124))))

(assert (=> b!623079 (arrayNoDuplicates!0 lt!288926 j!136 Nil!12124)))

(declare-fun lt!288930 () Unit!20988)

(assert (=> b!623079 (= lt!288930 (lemmaNoDuplicateFromThenFromBigger!0 lt!288926 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623079 (arrayNoDuplicates!0 lt!288926 #b00000000000000000000000000000000 Nil!12124)))

(declare-fun lt!288932 () Unit!20988)

(assert (=> b!623079 (= lt!288932 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12124))))

(assert (=> b!623079 (arrayContainsKey!0 lt!288926 (select (arr!18086 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288919 () Unit!20988)

(assert (=> b!623079 (= lt!288919 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288926 (select (arr!18086 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357384 () Unit!20988)

(declare-fun Unit!20992 () Unit!20988)

(assert (=> b!623079 (= e!357384 Unit!20992)))

(declare-fun b!623081 () Bool)

(declare-fun Unit!20993 () Unit!20988)

(assert (=> b!623081 (= e!357388 Unit!20993)))

(declare-fun b!623082 () Bool)

(declare-fun e!357394 () Unit!20988)

(declare-fun Unit!20994 () Unit!20988)

(assert (=> b!623082 (= e!357394 Unit!20994)))

(declare-fun res!401555 () Bool)

(assert (=> b!623082 (= res!401555 (= (select (store (arr!18086 a!2986) i!1108 k!1786) index!984) (select (arr!18086 a!2986) j!136)))))

(declare-fun e!357383 () Bool)

(assert (=> b!623082 (=> (not res!401555) (not e!357383))))

(assert (=> b!623082 e!357383))

(declare-fun c!71129 () Bool)

(assert (=> b!623082 (= c!71129 (bvslt j!136 index!984))))

(declare-fun lt!288918 () Unit!20988)

(assert (=> b!623082 (= lt!288918 e!357384)))

(declare-fun c!71127 () Bool)

(assert (=> b!623082 (= c!71127 (bvslt index!984 j!136))))

(declare-fun lt!288933 () Unit!20988)

(assert (=> b!623082 (= lt!288933 e!357388)))

(assert (=> b!623082 false))

(declare-fun b!623083 () Bool)

(declare-fun e!357387 () Bool)

(assert (=> b!623083 (= e!357387 e!357389)))

(declare-fun res!401568 () Bool)

(assert (=> b!623083 (=> (not res!401568) (not e!357389))))

(declare-fun lt!288922 () SeekEntryResult!6526)

(assert (=> b!623083 (= res!401568 (or (= lt!288922 (MissingZero!6526 i!1108)) (= lt!288922 (MissingVacant!6526 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37680 (_ BitVec 32)) SeekEntryResult!6526)

(assert (=> b!623083 (= lt!288922 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623084 () Bool)

(declare-fun res!401565 () Bool)

(assert (=> b!623084 (=> (not res!401565) (not e!357387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623084 (= res!401565 (validKeyInArray!0 (select (arr!18086 a!2986) j!136)))))

(declare-fun b!623085 () Bool)

(declare-fun Unit!20995 () Unit!20988)

(assert (=> b!623085 (= e!357384 Unit!20995)))

(declare-fun b!623086 () Bool)

(declare-fun res!401570 () Bool)

(assert (=> b!623086 (=> (not res!401570) (not e!357389))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!623086 (= res!401570 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18086 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623087 () Bool)

(declare-fun res!401564 () Bool)

(assert (=> b!623087 (= res!401564 (bvsge j!136 index!984))))

(declare-fun e!357392 () Bool)

(assert (=> b!623087 (=> res!401564 e!357392)))

(assert (=> b!623087 (= e!357383 e!357392)))

(declare-fun b!623088 () Bool)

(declare-fun res!401557 () Bool)

(assert (=> b!623088 (=> (not res!401557) (not e!357387))))

(assert (=> b!623088 (= res!401557 (and (= (size!18450 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18450 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18450 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623089 () Bool)

(declare-fun Unit!20996 () Unit!20988)

(assert (=> b!623089 (= e!357385 Unit!20996)))

(declare-fun b!623090 () Bool)

(declare-fun res!401558 () Bool)

(assert (=> b!623090 (= res!401558 (arrayContainsKey!0 lt!288926 (select (arr!18086 a!2986) j!136) j!136))))

(declare-fun e!357395 () Bool)

(assert (=> b!623090 (=> (not res!401558) (not e!357395))))

(assert (=> b!623090 (= e!357392 e!357395)))

(declare-fun b!623091 () Bool)

(assert (=> b!623091 (= e!357395 (arrayContainsKey!0 lt!288926 (select (arr!18086 a!2986) j!136) index!984))))

(declare-fun b!623092 () Bool)

(declare-fun e!357390 () Bool)

(declare-fun e!357386 () Bool)

(assert (=> b!623092 (= e!357390 e!357386)))

(declare-fun res!401556 () Bool)

(assert (=> b!623092 (=> (not res!401556) (not e!357386))))

(assert (=> b!623092 (= res!401556 (and (= lt!288936 (Found!6526 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18086 a!2986) index!984) (select (arr!18086 a!2986) j!136))) (not (= (select (arr!18086 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37680 (_ BitVec 32)) SeekEntryResult!6526)

(assert (=> b!623092 (= lt!288936 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18086 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623093 () Bool)

(assert (=> b!623093 (= e!357386 (not true))))

(declare-fun lt!288921 () Unit!20988)

(assert (=> b!623093 (= lt!288921 e!357394)))

(declare-fun c!71128 () Bool)

(declare-fun lt!288931 () SeekEntryResult!6526)

(assert (=> b!623093 (= c!71128 (= lt!288931 (Found!6526 index!984)))))

(declare-fun lt!288924 () Unit!20988)

(assert (=> b!623093 (= lt!288924 e!357385)))

(declare-fun c!71126 () Bool)

(assert (=> b!623093 (= c!71126 (= lt!288931 Undefined!6526))))

(declare-fun lt!288923 () (_ BitVec 64))

(assert (=> b!623093 (= lt!288931 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288923 lt!288926 mask!3053))))

(assert (=> b!623093 e!357396))

(declare-fun res!401560 () Bool)

(assert (=> b!623093 (=> (not res!401560) (not e!357396))))

(declare-fun lt!288935 () (_ BitVec 32))

(assert (=> b!623093 (= res!401560 (= lt!288934 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288935 vacantSpotIndex!68 lt!288923 lt!288926 mask!3053)))))

(assert (=> b!623093 (= lt!288934 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288935 vacantSpotIndex!68 (select (arr!18086 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623093 (= lt!288923 (select (store (arr!18086 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288925 () Unit!20988)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37680 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20988)

(assert (=> b!623093 (= lt!288925 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288935 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623093 (= lt!288935 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623094 () Bool)

(declare-fun res!401567 () Bool)

(assert (=> b!623094 (=> (not res!401567) (not e!357387))))

(assert (=> b!623094 (= res!401567 (validKeyInArray!0 k!1786))))

(declare-fun b!623095 () Bool)

(assert (=> b!623095 (= e!357389 e!357390)))

(declare-fun res!401559 () Bool)

(assert (=> b!623095 (=> (not res!401559) (not e!357390))))

(assert (=> b!623095 (= res!401559 (= (select (store (arr!18086 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623095 (= lt!288926 (array!37681 (store (arr!18086 a!2986) i!1108 k!1786) (size!18450 a!2986)))))

(declare-fun b!623096 () Bool)

(declare-fun res!401562 () Bool)

(assert (=> b!623096 (=> (not res!401562) (not e!357387))))

(assert (=> b!623096 (= res!401562 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!401566 () Bool)

(assert (=> start!56210 (=> (not res!401566) (not e!357387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56210 (= res!401566 (validMask!0 mask!3053))))

(assert (=> start!56210 e!357387))

(assert (=> start!56210 true))

(declare-fun array_inv!13882 (array!37680) Bool)

(assert (=> start!56210 (array_inv!13882 a!2986)))

(declare-fun b!623080 () Bool)

(declare-fun Unit!20997 () Unit!20988)

(assert (=> b!623080 (= e!357394 Unit!20997)))

(assert (= (and start!56210 res!401566) b!623088))

(assert (= (and b!623088 res!401557) b!623084))

(assert (= (and b!623084 res!401565) b!623094))

(assert (= (and b!623094 res!401567) b!623096))

(assert (= (and b!623096 res!401562) b!623083))

(assert (= (and b!623083 res!401568) b!623073))

(assert (= (and b!623073 res!401569) b!623075))

(assert (= (and b!623075 res!401561) b!623086))

(assert (= (and b!623086 res!401570) b!623095))

(assert (= (and b!623095 res!401559) b!623092))

(assert (= (and b!623092 res!401556) b!623093))

(assert (= (and b!623093 res!401560) b!623077))

(assert (= (and b!623093 c!71126) b!623076))

(assert (= (and b!623093 (not c!71126)) b!623089))

(assert (= (and b!623093 c!71128) b!623082))

(assert (= (and b!623093 (not c!71128)) b!623080))

(assert (= (and b!623082 res!401555) b!623087))

(assert (= (and b!623087 (not res!401564)) b!623090))

(assert (= (and b!623090 res!401558) b!623091))

(assert (= (and b!623082 c!71129) b!623079))

(assert (= (and b!623082 (not c!71129)) b!623085))

(assert (= (and b!623082 c!71127) b!623078))

(assert (= (and b!623082 (not c!71127)) b!623081))

(assert (= (and b!623078 res!401563) b!623074))

(declare-fun m!598921 () Bool)

(assert (=> b!623073 m!598921))

(declare-fun m!598923 () Bool)

(assert (=> b!623090 m!598923))

(assert (=> b!623090 m!598923))

(declare-fun m!598925 () Bool)

(assert (=> b!623090 m!598925))

(declare-fun m!598927 () Bool)

(assert (=> b!623096 m!598927))

(declare-fun m!598929 () Bool)

(assert (=> b!623086 m!598929))

(declare-fun m!598931 () Bool)

(assert (=> b!623092 m!598931))

(assert (=> b!623092 m!598923))

(assert (=> b!623092 m!598923))

(declare-fun m!598933 () Bool)

(assert (=> b!623092 m!598933))

(declare-fun m!598935 () Bool)

(assert (=> b!623093 m!598935))

(declare-fun m!598937 () Bool)

(assert (=> b!623093 m!598937))

(assert (=> b!623093 m!598923))

(declare-fun m!598939 () Bool)

(assert (=> b!623093 m!598939))

(assert (=> b!623093 m!598923))

(declare-fun m!598941 () Bool)

(assert (=> b!623093 m!598941))

(declare-fun m!598943 () Bool)

(assert (=> b!623093 m!598943))

(declare-fun m!598945 () Bool)

(assert (=> b!623093 m!598945))

(declare-fun m!598947 () Bool)

(assert (=> b!623093 m!598947))

(assert (=> b!623074 m!598923))

(assert (=> b!623074 m!598923))

(declare-fun m!598949 () Bool)

(assert (=> b!623074 m!598949))

(assert (=> b!623095 m!598943))

(declare-fun m!598951 () Bool)

(assert (=> b!623095 m!598951))

(assert (=> b!623084 m!598923))

(assert (=> b!623084 m!598923))

(declare-fun m!598953 () Bool)

(assert (=> b!623084 m!598953))

(assert (=> b!623079 m!598923))

(declare-fun m!598955 () Bool)

(assert (=> b!623079 m!598955))

(assert (=> b!623079 m!598923))

(assert (=> b!623079 m!598923))

(declare-fun m!598957 () Bool)

(assert (=> b!623079 m!598957))

(declare-fun m!598959 () Bool)

(assert (=> b!623079 m!598959))

(assert (=> b!623079 m!598923))

(declare-fun m!598961 () Bool)

(assert (=> b!623079 m!598961))

(declare-fun m!598963 () Bool)

(assert (=> b!623079 m!598963))

(declare-fun m!598965 () Bool)

(assert (=> b!623079 m!598965))

(declare-fun m!598967 () Bool)

(assert (=> b!623079 m!598967))

(declare-fun m!598969 () Bool)

(assert (=> b!623083 m!598969))

(assert (=> b!623078 m!598923))

(declare-fun m!598971 () Bool)

(assert (=> b!623078 m!598971))

(assert (=> b!623078 m!598923))

(declare-fun m!598973 () Bool)

(assert (=> b!623078 m!598973))

(assert (=> b!623078 m!598923))

(assert (=> b!623078 m!598925))

(assert (=> b!623078 m!598923))

(declare-fun m!598975 () Bool)

(assert (=> b!623078 m!598975))

(assert (=> b!623078 m!598923))

(declare-fun m!598977 () Bool)

(assert (=> b!623078 m!598977))

(declare-fun m!598979 () Bool)

(assert (=> b!623078 m!598979))

(assert (=> b!623078 m!598963))

(assert (=> b!623078 m!598967))

(declare-fun m!598981 () Bool)

(assert (=> b!623094 m!598981))

(assert (=> b!623091 m!598923))

(assert (=> b!623091 m!598923))

(assert (=> b!623091 m!598949))

(declare-fun m!598983 () Bool)

(assert (=> start!56210 m!598983))

(declare-fun m!598985 () Bool)

(assert (=> start!56210 m!598985))

(declare-fun m!598987 () Bool)

(assert (=> b!623075 m!598987))

(assert (=> b!623082 m!598943))

(declare-fun m!598989 () Bool)

(assert (=> b!623082 m!598989))

(assert (=> b!623082 m!598923))

(push 1)

