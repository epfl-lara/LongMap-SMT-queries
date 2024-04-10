; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58992 () Bool)

(assert start!58992)

(declare-fun b!650911 () Bool)

(declare-fun e!373474 () Bool)

(declare-fun e!373465 () Bool)

(assert (=> b!650911 (= e!373474 e!373465)))

(declare-fun res!422018 () Bool)

(assert (=> b!650911 (=> (not res!422018) (not e!373465))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38573 0))(
  ( (array!38574 (arr!18491 (Array (_ BitVec 32) (_ BitVec 64))) (size!18855 (_ BitVec 32))) )
))
(declare-fun lt!302549 () array!38573)

(declare-fun a!2986 () array!38573)

(declare-fun arrayContainsKey!0 (array!38573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650911 (= res!422018 (arrayContainsKey!0 lt!302549 (select (arr!18491 a!2986) j!136) j!136))))

(declare-fun b!650912 () Bool)

(declare-fun e!373476 () Bool)

(declare-datatypes ((SeekEntryResult!6931 0))(
  ( (MissingZero!6931 (index!30074 (_ BitVec 32))) (Found!6931 (index!30075 (_ BitVec 32))) (Intermediate!6931 (undefined!7743 Bool) (index!30076 (_ BitVec 32)) (x!58857 (_ BitVec 32))) (Undefined!6931) (MissingVacant!6931 (index!30077 (_ BitVec 32))) )
))
(declare-fun lt!302560 () SeekEntryResult!6931)

(declare-fun lt!302554 () SeekEntryResult!6931)

(assert (=> b!650912 (= e!373476 (= lt!302560 lt!302554))))

(declare-fun e!373473 () Bool)

(declare-fun b!650913 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650913 (= e!373473 (arrayContainsKey!0 lt!302549 (select (arr!18491 a!2986) j!136) index!984))))

(declare-fun res!422021 () Bool)

(declare-fun e!373472 () Bool)

(assert (=> start!58992 (=> (not res!422021) (not e!373472))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58992 (= res!422021 (validMask!0 mask!3053))))

(assert (=> start!58992 e!373472))

(assert (=> start!58992 true))

(declare-fun array_inv!14287 (array!38573) Bool)

(assert (=> start!58992 (array_inv!14287 a!2986)))

(declare-fun b!650914 () Bool)

(assert (=> b!650914 (= e!373465 (arrayContainsKey!0 lt!302549 (select (arr!18491 a!2986) j!136) index!984))))

(declare-fun b!650915 () Bool)

(declare-datatypes ((Unit!22212 0))(
  ( (Unit!22213) )
))
(declare-fun e!373470 () Unit!22212)

(declare-fun Unit!22214 () Unit!22212)

(assert (=> b!650915 (= e!373470 Unit!22214)))

(assert (=> b!650915 false))

(declare-fun b!650916 () Bool)

(declare-fun e!373463 () Bool)

(declare-fun e!373468 () Bool)

(assert (=> b!650916 (= e!373463 e!373468)))

(declare-fun res!422005 () Bool)

(assert (=> b!650916 (=> res!422005 e!373468)))

(assert (=> b!650916 (= res!422005 (bvsge index!984 j!136))))

(declare-fun lt!302557 () Unit!22212)

(declare-fun e!373475 () Unit!22212)

(assert (=> b!650916 (= lt!302557 e!373475)))

(declare-fun c!74822 () Bool)

(assert (=> b!650916 (= c!74822 (bvslt j!136 index!984))))

(declare-fun b!650917 () Bool)

(declare-fun res!422011 () Bool)

(assert (=> b!650917 (=> (not res!422011) (not e!373472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650917 (= res!422011 (validKeyInArray!0 (select (arr!18491 a!2986) j!136)))))

(declare-fun b!650918 () Bool)

(declare-fun e!373462 () Bool)

(assert (=> b!650918 (= e!373462 e!373474)))

(declare-fun res!422016 () Bool)

(assert (=> b!650918 (=> res!422016 e!373474)))

(declare-fun lt!302559 () (_ BitVec 64))

(declare-fun lt!302546 () (_ BitVec 64))

(assert (=> b!650918 (= res!422016 (or (not (= (select (arr!18491 a!2986) j!136) lt!302559)) (not (= (select (arr!18491 a!2986) j!136) lt!302546)) (bvsge j!136 index!984)))))

(declare-fun b!650919 () Bool)

(declare-fun res!422017 () Bool)

(assert (=> b!650919 (=> (not res!422017) (not e!373472))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!650919 (= res!422017 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650920 () Bool)

(declare-fun e!373464 () Bool)

(declare-fun e!373469 () Bool)

(assert (=> b!650920 (= e!373464 e!373469)))

(declare-fun res!422012 () Bool)

(assert (=> b!650920 (=> (not res!422012) (not e!373469))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!650920 (= res!422012 (= (select (store (arr!18491 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650920 (= lt!302549 (array!38574 (store (arr!18491 a!2986) i!1108 k!1786) (size!18855 a!2986)))))

(declare-fun b!650921 () Bool)

(assert (=> b!650921 (= e!373468 (or (bvsge (size!18855 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18855 a!2986)) (bvsle index!984 (size!18855 a!2986))))))

(declare-datatypes ((List!12532 0))(
  ( (Nil!12529) (Cons!12528 (h!13573 (_ BitVec 64)) (t!18760 List!12532)) )
))
(declare-fun arrayNoDuplicates!0 (array!38573 (_ BitVec 32) List!12532) Bool)

(assert (=> b!650921 (arrayNoDuplicates!0 lt!302549 #b00000000000000000000000000000000 Nil!12529)))

(declare-fun lt!302551 () Unit!22212)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38573 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12532) Unit!22212)

(assert (=> b!650921 (= lt!302551 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12529))))

(assert (=> b!650921 (arrayContainsKey!0 lt!302549 (select (arr!18491 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302553 () Unit!22212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38573 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22212)

(assert (=> b!650921 (= lt!302553 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302549 (select (arr!18491 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650921 e!373473))

(declare-fun res!422010 () Bool)

(assert (=> b!650921 (=> (not res!422010) (not e!373473))))

(assert (=> b!650921 (= res!422010 (arrayContainsKey!0 lt!302549 (select (arr!18491 a!2986) j!136) j!136))))

(declare-fun b!650922 () Bool)

(declare-fun Unit!22215 () Unit!22212)

(assert (=> b!650922 (= e!373470 Unit!22215)))

(declare-fun b!650923 () Bool)

(declare-fun Unit!22216 () Unit!22212)

(assert (=> b!650923 (= e!373475 Unit!22216)))

(declare-fun lt!302544 () Unit!22212)

(assert (=> b!650923 (= lt!302544 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302549 (select (arr!18491 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650923 (arrayContainsKey!0 lt!302549 (select (arr!18491 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302555 () Unit!22212)

(assert (=> b!650923 (= lt!302555 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12529))))

(assert (=> b!650923 (arrayNoDuplicates!0 lt!302549 #b00000000000000000000000000000000 Nil!12529)))

(declare-fun lt!302548 () Unit!22212)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38573 (_ BitVec 32) (_ BitVec 32)) Unit!22212)

(assert (=> b!650923 (= lt!302548 (lemmaNoDuplicateFromThenFromBigger!0 lt!302549 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650923 (arrayNoDuplicates!0 lt!302549 j!136 Nil!12529)))

(declare-fun lt!302552 () Unit!22212)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38573 (_ BitVec 64) (_ BitVec 32) List!12532) Unit!22212)

(assert (=> b!650923 (= lt!302552 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302549 (select (arr!18491 a!2986) j!136) j!136 Nil!12529))))

(assert (=> b!650923 false))

(declare-fun b!650924 () Bool)

(declare-fun Unit!22217 () Unit!22212)

(assert (=> b!650924 (= e!373475 Unit!22217)))

(declare-fun b!650925 () Bool)

(declare-fun res!422007 () Bool)

(assert (=> b!650925 (=> (not res!422007) (not e!373464))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650925 (= res!422007 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18491 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650926 () Bool)

(declare-fun e!373466 () Bool)

(declare-fun e!373467 () Bool)

(assert (=> b!650926 (= e!373466 (not e!373467))))

(declare-fun res!422009 () Bool)

(assert (=> b!650926 (=> res!422009 e!373467)))

(declare-fun lt!302547 () SeekEntryResult!6931)

(assert (=> b!650926 (= res!422009 (not (= lt!302547 (Found!6931 index!984))))))

(declare-fun lt!302545 () Unit!22212)

(assert (=> b!650926 (= lt!302545 e!373470)))

(declare-fun c!74821 () Bool)

(assert (=> b!650926 (= c!74821 (= lt!302547 Undefined!6931))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38573 (_ BitVec 32)) SeekEntryResult!6931)

(assert (=> b!650926 (= lt!302547 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302559 lt!302549 mask!3053))))

(assert (=> b!650926 e!373476))

(declare-fun res!422014 () Bool)

(assert (=> b!650926 (=> (not res!422014) (not e!373476))))

(declare-fun lt!302550 () (_ BitVec 32))

(assert (=> b!650926 (= res!422014 (= lt!302554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302550 vacantSpotIndex!68 lt!302559 lt!302549 mask!3053)))))

(assert (=> b!650926 (= lt!302554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302550 vacantSpotIndex!68 (select (arr!18491 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650926 (= lt!302559 (select (store (arr!18491 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302558 () Unit!22212)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38573 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22212)

(assert (=> b!650926 (= lt!302558 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302550 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650926 (= lt!302550 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650927 () Bool)

(assert (=> b!650927 (= e!373467 e!373463)))

(declare-fun res!422015 () Bool)

(assert (=> b!650927 (=> res!422015 e!373463)))

(assert (=> b!650927 (= res!422015 (or (not (= (select (arr!18491 a!2986) j!136) lt!302559)) (not (= (select (arr!18491 a!2986) j!136) lt!302546))))))

(assert (=> b!650927 e!373462))

(declare-fun res!422004 () Bool)

(assert (=> b!650927 (=> (not res!422004) (not e!373462))))

(assert (=> b!650927 (= res!422004 (= lt!302546 (select (arr!18491 a!2986) j!136)))))

(assert (=> b!650927 (= lt!302546 (select (store (arr!18491 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!650928 () Bool)

(assert (=> b!650928 (= e!373472 e!373464)))

(declare-fun res!422003 () Bool)

(assert (=> b!650928 (=> (not res!422003) (not e!373464))))

(declare-fun lt!302556 () SeekEntryResult!6931)

(assert (=> b!650928 (= res!422003 (or (= lt!302556 (MissingZero!6931 i!1108)) (= lt!302556 (MissingVacant!6931 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38573 (_ BitVec 32)) SeekEntryResult!6931)

(assert (=> b!650928 (= lt!302556 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650929 () Bool)

(assert (=> b!650929 (= e!373469 e!373466)))

(declare-fun res!422019 () Bool)

(assert (=> b!650929 (=> (not res!422019) (not e!373466))))

(assert (=> b!650929 (= res!422019 (and (= lt!302560 (Found!6931 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18491 a!2986) index!984) (select (arr!18491 a!2986) j!136))) (not (= (select (arr!18491 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650929 (= lt!302560 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18491 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650930 () Bool)

(declare-fun res!422013 () Bool)

(assert (=> b!650930 (=> (not res!422013) (not e!373472))))

(assert (=> b!650930 (= res!422013 (validKeyInArray!0 k!1786))))

(declare-fun b!650931 () Bool)

(declare-fun res!422006 () Bool)

(assert (=> b!650931 (=> (not res!422006) (not e!373464))))

(assert (=> b!650931 (= res!422006 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12529))))

(declare-fun b!650932 () Bool)

(declare-fun res!422020 () Bool)

(assert (=> b!650932 (=> (not res!422020) (not e!373472))))

(assert (=> b!650932 (= res!422020 (and (= (size!18855 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18855 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18855 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650933 () Bool)

(declare-fun res!422008 () Bool)

(assert (=> b!650933 (=> (not res!422008) (not e!373464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38573 (_ BitVec 32)) Bool)

(assert (=> b!650933 (= res!422008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58992 res!422021) b!650932))

(assert (= (and b!650932 res!422020) b!650917))

(assert (= (and b!650917 res!422011) b!650930))

(assert (= (and b!650930 res!422013) b!650919))

(assert (= (and b!650919 res!422017) b!650928))

(assert (= (and b!650928 res!422003) b!650933))

(assert (= (and b!650933 res!422008) b!650931))

(assert (= (and b!650931 res!422006) b!650925))

(assert (= (and b!650925 res!422007) b!650920))

(assert (= (and b!650920 res!422012) b!650929))

(assert (= (and b!650929 res!422019) b!650926))

(assert (= (and b!650926 res!422014) b!650912))

(assert (= (and b!650926 c!74821) b!650915))

(assert (= (and b!650926 (not c!74821)) b!650922))

(assert (= (and b!650926 (not res!422009)) b!650927))

(assert (= (and b!650927 res!422004) b!650918))

(assert (= (and b!650918 (not res!422016)) b!650911))

(assert (= (and b!650911 res!422018) b!650914))

(assert (= (and b!650927 (not res!422015)) b!650916))

(assert (= (and b!650916 c!74822) b!650923))

(assert (= (and b!650916 (not c!74822)) b!650924))

(assert (= (and b!650916 (not res!422005)) b!650921))

(assert (= (and b!650921 res!422010) b!650913))

(declare-fun m!624079 () Bool)

(assert (=> b!650929 m!624079))

(declare-fun m!624081 () Bool)

(assert (=> b!650929 m!624081))

(assert (=> b!650929 m!624081))

(declare-fun m!624083 () Bool)

(assert (=> b!650929 m!624083))

(assert (=> b!650911 m!624081))

(assert (=> b!650911 m!624081))

(declare-fun m!624085 () Bool)

(assert (=> b!650911 m!624085))

(declare-fun m!624087 () Bool)

(assert (=> start!58992 m!624087))

(declare-fun m!624089 () Bool)

(assert (=> start!58992 m!624089))

(assert (=> b!650917 m!624081))

(assert (=> b!650917 m!624081))

(declare-fun m!624091 () Bool)

(assert (=> b!650917 m!624091))

(declare-fun m!624093 () Bool)

(assert (=> b!650930 m!624093))

(declare-fun m!624095 () Bool)

(assert (=> b!650920 m!624095))

(declare-fun m!624097 () Bool)

(assert (=> b!650920 m!624097))

(assert (=> b!650914 m!624081))

(assert (=> b!650914 m!624081))

(declare-fun m!624099 () Bool)

(assert (=> b!650914 m!624099))

(assert (=> b!650913 m!624081))

(assert (=> b!650913 m!624081))

(assert (=> b!650913 m!624099))

(assert (=> b!650918 m!624081))

(declare-fun m!624101 () Bool)

(assert (=> b!650925 m!624101))

(declare-fun m!624103 () Bool)

(assert (=> b!650923 m!624103))

(assert (=> b!650923 m!624081))

(declare-fun m!624105 () Bool)

(assert (=> b!650923 m!624105))

(declare-fun m!624107 () Bool)

(assert (=> b!650923 m!624107))

(assert (=> b!650923 m!624081))

(declare-fun m!624109 () Bool)

(assert (=> b!650923 m!624109))

(declare-fun m!624111 () Bool)

(assert (=> b!650923 m!624111))

(assert (=> b!650923 m!624081))

(declare-fun m!624113 () Bool)

(assert (=> b!650923 m!624113))

(assert (=> b!650923 m!624081))

(declare-fun m!624115 () Bool)

(assert (=> b!650923 m!624115))

(assert (=> b!650927 m!624081))

(assert (=> b!650927 m!624095))

(declare-fun m!624117 () Bool)

(assert (=> b!650927 m!624117))

(declare-fun m!624119 () Bool)

(assert (=> b!650933 m!624119))

(assert (=> b!650921 m!624103))

(assert (=> b!650921 m!624081))

(assert (=> b!650921 m!624081))

(assert (=> b!650921 m!624085))

(assert (=> b!650921 m!624081))

(declare-fun m!624121 () Bool)

(assert (=> b!650921 m!624121))

(assert (=> b!650921 m!624081))

(declare-fun m!624123 () Bool)

(assert (=> b!650921 m!624123))

(assert (=> b!650921 m!624111))

(declare-fun m!624125 () Bool)

(assert (=> b!650928 m!624125))

(declare-fun m!624127 () Bool)

(assert (=> b!650926 m!624127))

(declare-fun m!624129 () Bool)

(assert (=> b!650926 m!624129))

(assert (=> b!650926 m!624081))

(assert (=> b!650926 m!624095))

(assert (=> b!650926 m!624081))

(declare-fun m!624131 () Bool)

(assert (=> b!650926 m!624131))

(declare-fun m!624133 () Bool)

(assert (=> b!650926 m!624133))

(declare-fun m!624135 () Bool)

(assert (=> b!650926 m!624135))

(declare-fun m!624137 () Bool)

(assert (=> b!650926 m!624137))

(declare-fun m!624139 () Bool)

(assert (=> b!650919 m!624139))

(declare-fun m!624141 () Bool)

(assert (=> b!650931 m!624141))

(push 1)

(assert (not b!650917))

(assert (not b!650926))

(assert (not b!650929))

(assert (not b!650923))

(assert (not b!650933))

(assert (not b!650931))

(assert (not b!650928))

(assert (not b!650921))

(assert (not b!650914))

(assert (not b!650930))

(assert (not start!58992))

(assert (not b!650919))

(assert (not b!650913))

(assert (not b!650911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

