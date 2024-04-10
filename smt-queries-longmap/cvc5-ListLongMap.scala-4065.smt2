; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55702 () Bool)

(assert start!55702)

(declare-fun b!610467 () Bool)

(declare-datatypes ((Unit!19570 0))(
  ( (Unit!19571) )
))
(declare-fun e!349707 () Unit!19570)

(declare-fun Unit!19572 () Unit!19570)

(assert (=> b!610467 (= e!349707 Unit!19572)))

(declare-fun b!610468 () Bool)

(declare-fun e!349719 () Bool)

(declare-fun e!349706 () Bool)

(assert (=> b!610468 (= e!349719 (not e!349706))))

(declare-fun res!392681 () Bool)

(assert (=> b!610468 (=> res!392681 e!349706)))

(declare-datatypes ((SeekEntryResult!6365 0))(
  ( (MissingZero!6365 (index!27738 (_ BitVec 32))) (Found!6365 (index!27739 (_ BitVec 32))) (Intermediate!6365 (undefined!7177 Bool) (index!27740 (_ BitVec 32)) (x!56547 (_ BitVec 32))) (Undefined!6365) (MissingVacant!6365 (index!27741 (_ BitVec 32))) )
))
(declare-fun lt!279232 () SeekEntryResult!6365)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!610468 (= res!392681 (not (= lt!279232 (Found!6365 index!984))))))

(declare-fun lt!279227 () Unit!19570)

(assert (=> b!610468 (= lt!279227 e!349707)))

(declare-fun c!69269 () Bool)

(assert (=> b!610468 (= c!69269 (= lt!279232 Undefined!6365))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37352 0))(
  ( (array!37353 (arr!17925 (Array (_ BitVec 32) (_ BitVec 64))) (size!18289 (_ BitVec 32))) )
))
(declare-fun lt!279225 () array!37352)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!279224 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37352 (_ BitVec 32)) SeekEntryResult!6365)

(assert (=> b!610468 (= lt!279232 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279224 lt!279225 mask!3053))))

(declare-fun e!349711 () Bool)

(assert (=> b!610468 e!349711))

(declare-fun res!392676 () Bool)

(assert (=> b!610468 (=> (not res!392676) (not e!349711))))

(declare-fun lt!279222 () (_ BitVec 32))

(declare-fun lt!279221 () SeekEntryResult!6365)

(assert (=> b!610468 (= res!392676 (= lt!279221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 lt!279224 lt!279225 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37352)

(assert (=> b!610468 (= lt!279221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!610468 (= lt!279224 (select (store (arr!17925 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279223 () Unit!19570)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19570)

(assert (=> b!610468 (= lt!279223 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610468 (= lt!279222 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!349715 () Bool)

(declare-fun b!610469 () Bool)

(declare-fun arrayContainsKey!0 (array!37352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610469 (= e!349715 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) index!984))))

(declare-fun b!610470 () Bool)

(declare-fun e!349714 () Bool)

(declare-datatypes ((List!11966 0))(
  ( (Nil!11963) (Cons!11962 (h!13007 (_ BitVec 64)) (t!18194 List!11966)) )
))
(declare-fun noDuplicate!342 (List!11966) Bool)

(assert (=> b!610470 (= e!349714 (noDuplicate!342 Nil!11963))))

(declare-fun res!392679 () Bool)

(declare-fun e!349718 () Bool)

(assert (=> start!55702 (=> (not res!392679) (not e!349718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55702 (= res!392679 (validMask!0 mask!3053))))

(assert (=> start!55702 e!349718))

(assert (=> start!55702 true))

(declare-fun array_inv!13721 (array!37352) Bool)

(assert (=> start!55702 (array_inv!13721 a!2986)))

(declare-fun b!610471 () Bool)

(declare-fun res!392669 () Bool)

(assert (=> b!610471 (=> (not res!392669) (not e!349718))))

(assert (=> b!610471 (= res!392669 (and (= (size!18289 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18289 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610472 () Bool)

(declare-fun res!392673 () Bool)

(declare-fun e!349713 () Bool)

(assert (=> b!610472 (=> (not res!392673) (not e!349713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37352 (_ BitVec 32)) Bool)

(assert (=> b!610472 (= res!392673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!610473 () Bool)

(declare-fun Unit!19573 () Unit!19570)

(assert (=> b!610473 (= e!349707 Unit!19573)))

(assert (=> b!610473 false))

(declare-fun b!610474 () Bool)

(declare-fun res!392683 () Bool)

(assert (=> b!610474 (=> (not res!392683) (not e!349713))))

(declare-fun arrayNoDuplicates!0 (array!37352 (_ BitVec 32) List!11966) Bool)

(assert (=> b!610474 (= res!392683 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11963))))

(declare-fun b!610475 () Bool)

(declare-fun e!349712 () Bool)

(assert (=> b!610475 (= e!349712 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) index!984))))

(declare-fun b!610476 () Bool)

(declare-fun e!349705 () Bool)

(assert (=> b!610476 (= e!349706 e!349705)))

(declare-fun res!392672 () Bool)

(assert (=> b!610476 (=> res!392672 e!349705)))

(declare-fun lt!279229 () (_ BitVec 64))

(assert (=> b!610476 (= res!392672 (or (not (= (select (arr!17925 a!2986) j!136) lt!279224)) (not (= (select (arr!17925 a!2986) j!136) lt!279229))))))

(declare-fun e!349709 () Bool)

(assert (=> b!610476 e!349709))

(declare-fun res!392682 () Bool)

(assert (=> b!610476 (=> (not res!392682) (not e!349709))))

(assert (=> b!610476 (= res!392682 (= lt!279229 (select (arr!17925 a!2986) j!136)))))

(assert (=> b!610476 (= lt!279229 (select (store (arr!17925 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!610477 () Bool)

(declare-fun res!392680 () Bool)

(assert (=> b!610477 (=> (not res!392680) (not e!349718))))

(assert (=> b!610477 (= res!392680 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610478 () Bool)

(declare-fun e!349704 () Unit!19570)

(declare-fun Unit!19574 () Unit!19570)

(assert (=> b!610478 (= e!349704 Unit!19574)))

(declare-fun b!610479 () Bool)

(declare-fun e!349710 () Bool)

(assert (=> b!610479 (= e!349710 e!349719)))

(declare-fun res!392677 () Bool)

(assert (=> b!610479 (=> (not res!392677) (not e!349719))))

(declare-fun lt!279217 () SeekEntryResult!6365)

(assert (=> b!610479 (= res!392677 (and (= lt!279217 (Found!6365 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17925 a!2986) index!984) (select (arr!17925 a!2986) j!136))) (not (= (select (arr!17925 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!610479 (= lt!279217 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610480 () Bool)

(declare-fun e!349717 () Bool)

(assert (=> b!610480 (= e!349717 e!349715)))

(declare-fun res!392668 () Bool)

(assert (=> b!610480 (=> (not res!392668) (not e!349715))))

(assert (=> b!610480 (= res!392668 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136))))

(declare-fun b!610481 () Bool)

(declare-fun res!392675 () Bool)

(assert (=> b!610481 (=> (not res!392675) (not e!349713))))

(assert (=> b!610481 (= res!392675 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17925 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610482 () Bool)

(assert (=> b!610482 (= e!349718 e!349713)))

(declare-fun res!392684 () Bool)

(assert (=> b!610482 (=> (not res!392684) (not e!349713))))

(declare-fun lt!279216 () SeekEntryResult!6365)

(assert (=> b!610482 (= res!392684 (or (= lt!279216 (MissingZero!6365 i!1108)) (= lt!279216 (MissingVacant!6365 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37352 (_ BitVec 32)) SeekEntryResult!6365)

(assert (=> b!610482 (= lt!279216 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!610483 () Bool)

(declare-fun Unit!19575 () Unit!19570)

(assert (=> b!610483 (= e!349704 Unit!19575)))

(declare-fun lt!279220 () Unit!19570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19570)

(assert (=> b!610483 (= lt!279220 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279225 (select (arr!17925 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610483 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279219 () Unit!19570)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11966) Unit!19570)

(assert (=> b!610483 (= lt!279219 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11963))))

(assert (=> b!610483 (arrayNoDuplicates!0 lt!279225 #b00000000000000000000000000000000 Nil!11963)))

(declare-fun lt!279230 () Unit!19570)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37352 (_ BitVec 32) (_ BitVec 32)) Unit!19570)

(assert (=> b!610483 (= lt!279230 (lemmaNoDuplicateFromThenFromBigger!0 lt!279225 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610483 (arrayNoDuplicates!0 lt!279225 j!136 Nil!11963)))

(declare-fun lt!279226 () Unit!19570)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37352 (_ BitVec 64) (_ BitVec 32) List!11966) Unit!19570)

(assert (=> b!610483 (= lt!279226 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136 Nil!11963))))

(assert (=> b!610483 false))

(declare-fun b!610484 () Bool)

(declare-fun res!392674 () Bool)

(assert (=> b!610484 (=> (not res!392674) (not e!349718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610484 (= res!392674 (validKeyInArray!0 (select (arr!17925 a!2986) j!136)))))

(declare-fun b!610485 () Bool)

(assert (=> b!610485 (= e!349713 e!349710)))

(declare-fun res!392670 () Bool)

(assert (=> b!610485 (=> (not res!392670) (not e!349710))))

(assert (=> b!610485 (= res!392670 (= (select (store (arr!17925 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610485 (= lt!279225 (array!37353 (store (arr!17925 a!2986) i!1108 k!1786) (size!18289 a!2986)))))

(declare-fun b!610486 () Bool)

(declare-fun res!392671 () Bool)

(assert (=> b!610486 (=> (not res!392671) (not e!349718))))

(assert (=> b!610486 (= res!392671 (validKeyInArray!0 k!1786))))

(declare-fun b!610487 () Bool)

(assert (=> b!610487 (= e!349709 e!349717)))

(declare-fun res!392665 () Bool)

(assert (=> b!610487 (=> res!392665 e!349717)))

(assert (=> b!610487 (= res!392665 (or (not (= (select (arr!17925 a!2986) j!136) lt!279224)) (not (= (select (arr!17925 a!2986) j!136) lt!279229)) (bvsge j!136 index!984)))))

(declare-fun b!610488 () Bool)

(declare-fun e!349716 () Bool)

(assert (=> b!610488 (= e!349716 e!349714)))

(declare-fun res!392678 () Bool)

(assert (=> b!610488 (=> res!392678 e!349714)))

(assert (=> b!610488 (= res!392678 (or (bvsgt #b00000000000000000000000000000000 (size!18289 a!2986)) (bvsge (size!18289 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!610488 (arrayNoDuplicates!0 lt!279225 #b00000000000000000000000000000000 Nil!11963)))

(declare-fun lt!279231 () Unit!19570)

(assert (=> b!610488 (= lt!279231 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11963))))

(assert (=> b!610488 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279218 () Unit!19570)

(assert (=> b!610488 (= lt!279218 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!610488 e!349712))

(declare-fun res!392666 () Bool)

(assert (=> b!610488 (=> (not res!392666) (not e!349712))))

(assert (=> b!610488 (= res!392666 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136))))

(declare-fun b!610489 () Bool)

(assert (=> b!610489 (= e!349705 e!349716)))

(declare-fun res!392667 () Bool)

(assert (=> b!610489 (=> res!392667 e!349716)))

(assert (=> b!610489 (= res!392667 (bvsge index!984 j!136))))

(declare-fun lt!279228 () Unit!19570)

(assert (=> b!610489 (= lt!279228 e!349704)))

(declare-fun c!69268 () Bool)

(assert (=> b!610489 (= c!69268 (bvslt j!136 index!984))))

(declare-fun b!610490 () Bool)

(assert (=> b!610490 (= e!349711 (= lt!279217 lt!279221))))

(assert (= (and start!55702 res!392679) b!610471))

(assert (= (and b!610471 res!392669) b!610484))

(assert (= (and b!610484 res!392674) b!610486))

(assert (= (and b!610486 res!392671) b!610477))

(assert (= (and b!610477 res!392680) b!610482))

(assert (= (and b!610482 res!392684) b!610472))

(assert (= (and b!610472 res!392673) b!610474))

(assert (= (and b!610474 res!392683) b!610481))

(assert (= (and b!610481 res!392675) b!610485))

(assert (= (and b!610485 res!392670) b!610479))

(assert (= (and b!610479 res!392677) b!610468))

(assert (= (and b!610468 res!392676) b!610490))

(assert (= (and b!610468 c!69269) b!610473))

(assert (= (and b!610468 (not c!69269)) b!610467))

(assert (= (and b!610468 (not res!392681)) b!610476))

(assert (= (and b!610476 res!392682) b!610487))

(assert (= (and b!610487 (not res!392665)) b!610480))

(assert (= (and b!610480 res!392668) b!610469))

(assert (= (and b!610476 (not res!392672)) b!610489))

(assert (= (and b!610489 c!69268) b!610483))

(assert (= (and b!610489 (not c!69268)) b!610478))

(assert (= (and b!610489 (not res!392667)) b!610488))

(assert (= (and b!610488 res!392666) b!610475))

(assert (= (and b!610488 (not res!392678)) b!610470))

(declare-fun m!586925 () Bool)

(assert (=> b!610485 m!586925))

(declare-fun m!586927 () Bool)

(assert (=> b!610485 m!586927))

(declare-fun m!586929 () Bool)

(assert (=> b!610487 m!586929))

(declare-fun m!586931 () Bool)

(assert (=> start!55702 m!586931))

(declare-fun m!586933 () Bool)

(assert (=> start!55702 m!586933))

(declare-fun m!586935 () Bool)

(assert (=> b!610472 m!586935))

(assert (=> b!610469 m!586929))

(assert (=> b!610469 m!586929))

(declare-fun m!586937 () Bool)

(assert (=> b!610469 m!586937))

(assert (=> b!610484 m!586929))

(assert (=> b!610484 m!586929))

(declare-fun m!586939 () Bool)

(assert (=> b!610484 m!586939))

(assert (=> b!610475 m!586929))

(assert (=> b!610475 m!586929))

(assert (=> b!610475 m!586937))

(declare-fun m!586941 () Bool)

(assert (=> b!610477 m!586941))

(assert (=> b!610480 m!586929))

(assert (=> b!610480 m!586929))

(declare-fun m!586943 () Bool)

(assert (=> b!610480 m!586943))

(assert (=> b!610483 m!586929))

(declare-fun m!586945 () Bool)

(assert (=> b!610483 m!586945))

(assert (=> b!610483 m!586929))

(declare-fun m!586947 () Bool)

(assert (=> b!610483 m!586947))

(declare-fun m!586949 () Bool)

(assert (=> b!610483 m!586949))

(declare-fun m!586951 () Bool)

(assert (=> b!610483 m!586951))

(assert (=> b!610483 m!586929))

(declare-fun m!586953 () Bool)

(assert (=> b!610483 m!586953))

(assert (=> b!610483 m!586929))

(declare-fun m!586955 () Bool)

(assert (=> b!610483 m!586955))

(declare-fun m!586957 () Bool)

(assert (=> b!610483 m!586957))

(assert (=> b!610488 m!586929))

(assert (=> b!610488 m!586929))

(declare-fun m!586959 () Bool)

(assert (=> b!610488 m!586959))

(assert (=> b!610488 m!586957))

(assert (=> b!610488 m!586929))

(declare-fun m!586961 () Bool)

(assert (=> b!610488 m!586961))

(assert (=> b!610488 m!586929))

(assert (=> b!610488 m!586943))

(assert (=> b!610488 m!586949))

(declare-fun m!586963 () Bool)

(assert (=> b!610468 m!586963))

(assert (=> b!610468 m!586929))

(assert (=> b!610468 m!586925))

(declare-fun m!586965 () Bool)

(assert (=> b!610468 m!586965))

(declare-fun m!586967 () Bool)

(assert (=> b!610468 m!586967))

(assert (=> b!610468 m!586929))

(declare-fun m!586969 () Bool)

(assert (=> b!610468 m!586969))

(declare-fun m!586971 () Bool)

(assert (=> b!610468 m!586971))

(declare-fun m!586973 () Bool)

(assert (=> b!610468 m!586973))

(declare-fun m!586975 () Bool)

(assert (=> b!610474 m!586975))

(declare-fun m!586977 () Bool)

(assert (=> b!610470 m!586977))

(declare-fun m!586979 () Bool)

(assert (=> b!610486 m!586979))

(declare-fun m!586981 () Bool)

(assert (=> b!610479 m!586981))

(assert (=> b!610479 m!586929))

(assert (=> b!610479 m!586929))

(declare-fun m!586983 () Bool)

(assert (=> b!610479 m!586983))

(declare-fun m!586985 () Bool)

(assert (=> b!610481 m!586985))

(assert (=> b!610476 m!586929))

(assert (=> b!610476 m!586925))

(declare-fun m!586987 () Bool)

(assert (=> b!610476 m!586987))

(declare-fun m!586989 () Bool)

(assert (=> b!610482 m!586989))

(push 1)

(assert (not b!610482))

(assert (not b!610470))

(assert (not b!610483))

(assert (not b!610468))

(assert (not b!610474))

(assert (not b!610477))

(assert (not b!610479))

(assert (not b!610480))

(assert (not b!610475))

(assert (not b!610472))

(assert (not b!610469))

(assert (not b!610484))

(assert (not start!55702))

(assert (not b!610486))

(assert (not b!610488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!610691 () Bool)

(declare-fun e!349858 () Bool)

(declare-fun e!349861 () Bool)

(assert (=> b!610691 (= e!349858 e!349861)))

(declare-fun c!69296 () Bool)

(assert (=> b!610691 (= c!69296 (validKeyInArray!0 (select (arr!17925 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610692 () Bool)

(declare-fun call!33140 () Bool)

(assert (=> b!610692 (= e!349861 call!33140)))

(declare-fun b!610693 () Bool)

(assert (=> b!610693 (= e!349861 call!33140)))

(declare-fun b!610694 () Bool)

(declare-fun e!349860 () Bool)

(declare-fun contains!3040 (List!11966 (_ BitVec 64)) Bool)

(assert (=> b!610694 (= e!349860 (contains!3040 Nil!11963 (select (arr!17925 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610695 () Bool)

(declare-fun e!349859 () Bool)

(assert (=> b!610695 (= e!349859 e!349858)))

(declare-fun res!392835 () Bool)

(assert (=> b!610695 (=> (not res!392835) (not e!349858))))

(assert (=> b!610695 (= res!392835 (not e!349860))))

(declare-fun res!392833 () Bool)

(assert (=> b!610695 (=> (not res!392833) (not e!349860))))

(assert (=> b!610695 (= res!392833 (validKeyInArray!0 (select (arr!17925 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33137 () Bool)

(assert (=> bm!33137 (= call!33140 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69296 (Cons!11962 (select (arr!17925 a!2986) #b00000000000000000000000000000000) Nil!11963) Nil!11963)))))

(declare-fun d!88257 () Bool)

(declare-fun res!392834 () Bool)

(assert (=> d!88257 (=> res!392834 e!349859)))

(assert (=> d!88257 (= res!392834 (bvsge #b00000000000000000000000000000000 (size!18289 a!2986)))))

(assert (=> d!88257 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11963) e!349859)))

(assert (= (and d!88257 (not res!392834)) b!610695))

(assert (= (and b!610695 res!392833) b!610694))

(assert (= (and b!610695 res!392835) b!610691))

(assert (= (and b!610691 c!69296) b!610692))

(assert (= (and b!610691 (not c!69296)) b!610693))

(assert (= (or b!610692 b!610693) bm!33137))

(declare-fun m!587165 () Bool)

(assert (=> b!610691 m!587165))

(assert (=> b!610691 m!587165))

(declare-fun m!587167 () Bool)

(assert (=> b!610691 m!587167))

(assert (=> b!610694 m!587165))

(assert (=> b!610694 m!587165))

(declare-fun m!587169 () Bool)

(assert (=> b!610694 m!587169))

(assert (=> b!610695 m!587165))

(assert (=> b!610695 m!587165))

(assert (=> b!610695 m!587167))

(assert (=> bm!33137 m!587165))

(declare-fun m!587171 () Bool)

(assert (=> bm!33137 m!587171))

(assert (=> b!610474 d!88257))

(declare-fun d!88269 () Bool)

(assert (=> d!88269 (= (validKeyInArray!0 (select (arr!17925 a!2986) j!136)) (and (not (= (select (arr!17925 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17925 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610484 d!88269))

(declare-fun d!88271 () Bool)

(declare-fun res!392846 () Bool)

(declare-fun e!349874 () Bool)

(assert (=> d!88271 (=> res!392846 e!349874)))

(assert (=> d!88271 (= res!392846 (= (select (arr!17925 lt!279225) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17925 a!2986) j!136)))))

(assert (=> d!88271 (= (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349874)))

(declare-fun b!610710 () Bool)

(declare-fun e!349875 () Bool)

(assert (=> b!610710 (= e!349874 e!349875)))

(declare-fun res!392847 () Bool)

(assert (=> b!610710 (=> (not res!392847) (not e!349875))))

(assert (=> b!610710 (= res!392847 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18289 lt!279225)))))

(declare-fun b!610711 () Bool)

(assert (=> b!610711 (= e!349875 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88271 (not res!392846)) b!610710))

(assert (= (and b!610710 res!392847) b!610711))

(declare-fun m!587173 () Bool)

(assert (=> d!88271 m!587173))

(assert (=> b!610711 m!586929))

(declare-fun m!587175 () Bool)

(assert (=> b!610711 m!587175))

(assert (=> b!610483 d!88271))

(declare-fun d!88273 () Bool)

(assert (=> d!88273 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279358 () Unit!19570)

(declare-fun choose!114 (array!37352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19570)

(assert (=> d!88273 (= lt!279358 (choose!114 lt!279225 (select (arr!17925 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88273 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88273 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279225 (select (arr!17925 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279358)))

(declare-fun bs!18629 () Bool)

(assert (= bs!18629 d!88273))

(assert (=> bs!18629 m!586929))

(assert (=> bs!18629 m!586955))

(assert (=> bs!18629 m!586929))

(declare-fun m!587185 () Bool)

(assert (=> bs!18629 m!587185))

(assert (=> b!610483 d!88273))

(declare-fun d!88277 () Bool)

(assert (=> d!88277 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18289 lt!279225)) (not (= (select (arr!17925 lt!279225) j!136) (select (arr!17925 a!2986) j!136))))))

(declare-fun lt!279364 () Unit!19570)

(declare-fun choose!21 (array!37352 (_ BitVec 64) (_ BitVec 32) List!11966) Unit!19570)

(assert (=> d!88277 (= lt!279364 (choose!21 lt!279225 (select (arr!17925 a!2986) j!136) j!136 Nil!11963))))

(assert (=> d!88277 (bvslt (size!18289 lt!279225) #b01111111111111111111111111111111)))

(assert (=> d!88277 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136 Nil!11963) lt!279364)))

(declare-fun bs!18630 () Bool)

(assert (= bs!18630 d!88277))

(declare-fun m!587189 () Bool)

(assert (=> bs!18630 m!587189))

(assert (=> bs!18630 m!586929))

(declare-fun m!587193 () Bool)

(assert (=> bs!18630 m!587193))

(assert (=> b!610483 d!88277))

(declare-fun d!88281 () Bool)

(assert (=> d!88281 (arrayNoDuplicates!0 lt!279225 j!136 Nil!11963)))

(declare-fun lt!279373 () Unit!19570)

(declare-fun choose!39 (array!37352 (_ BitVec 32) (_ BitVec 32)) Unit!19570)

(assert (=> d!88281 (= lt!279373 (choose!39 lt!279225 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88281 (bvslt (size!18289 lt!279225) #b01111111111111111111111111111111)))

(assert (=> d!88281 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279225 #b00000000000000000000000000000000 j!136) lt!279373)))

(declare-fun bs!18631 () Bool)

(assert (= bs!18631 d!88281))

(assert (=> bs!18631 m!586951))

(declare-fun m!587199 () Bool)

(assert (=> bs!18631 m!587199))

(assert (=> b!610483 d!88281))

(declare-fun b!610734 () Bool)

(declare-fun e!349891 () Bool)

(declare-fun e!349894 () Bool)

(assert (=> b!610734 (= e!349891 e!349894)))

(declare-fun c!69306 () Bool)

(assert (=> b!610734 (= c!69306 (validKeyInArray!0 (select (arr!17925 lt!279225) #b00000000000000000000000000000000)))))

(declare-fun b!610735 () Bool)

(declare-fun call!33144 () Bool)

(assert (=> b!610735 (= e!349894 call!33144)))

(declare-fun b!610736 () Bool)

(assert (=> b!610736 (= e!349894 call!33144)))

(declare-fun b!610737 () Bool)

(declare-fun e!349893 () Bool)

(assert (=> b!610737 (= e!349893 (contains!3040 Nil!11963 (select (arr!17925 lt!279225) #b00000000000000000000000000000000)))))

(declare-fun b!610738 () Bool)

(declare-fun e!349892 () Bool)

(assert (=> b!610738 (= e!349892 e!349891)))

(declare-fun res!392858 () Bool)

(assert (=> b!610738 (=> (not res!392858) (not e!349891))))

(assert (=> b!610738 (= res!392858 (not e!349893))))

(declare-fun res!392856 () Bool)

(assert (=> b!610738 (=> (not res!392856) (not e!349893))))

(assert (=> b!610738 (= res!392856 (validKeyInArray!0 (select (arr!17925 lt!279225) #b00000000000000000000000000000000)))))

(declare-fun bm!33141 () Bool)

(assert (=> bm!33141 (= call!33144 (arrayNoDuplicates!0 lt!279225 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69306 (Cons!11962 (select (arr!17925 lt!279225) #b00000000000000000000000000000000) Nil!11963) Nil!11963)))))

(declare-fun d!88285 () Bool)

(declare-fun res!392857 () Bool)

(assert (=> d!88285 (=> res!392857 e!349892)))

(assert (=> d!88285 (= res!392857 (bvsge #b00000000000000000000000000000000 (size!18289 lt!279225)))))

(assert (=> d!88285 (= (arrayNoDuplicates!0 lt!279225 #b00000000000000000000000000000000 Nil!11963) e!349892)))

(assert (= (and d!88285 (not res!392857)) b!610738))

(assert (= (and b!610738 res!392856) b!610737))

(assert (= (and b!610738 res!392858) b!610734))

(assert (= (and b!610734 c!69306) b!610735))

(assert (= (and b!610734 (not c!69306)) b!610736))

(assert (= (or b!610735 b!610736) bm!33141))

(declare-fun m!587201 () Bool)

(assert (=> b!610734 m!587201))

(assert (=> b!610734 m!587201))

(declare-fun m!587203 () Bool)

(assert (=> b!610734 m!587203))

(assert (=> b!610737 m!587201))

(assert (=> b!610737 m!587201))

(declare-fun m!587205 () Bool)

(assert (=> b!610737 m!587205))

(assert (=> b!610738 m!587201))

(assert (=> b!610738 m!587201))

(assert (=> b!610738 m!587203))

(assert (=> bm!33141 m!587201))

(declare-fun m!587207 () Bool)

(assert (=> bm!33141 m!587207))

(assert (=> b!610483 d!88285))

(declare-fun b!610739 () Bool)

(declare-fun e!349895 () Bool)

(declare-fun e!349898 () Bool)

(assert (=> b!610739 (= e!349895 e!349898)))

(declare-fun c!69307 () Bool)

(assert (=> b!610739 (= c!69307 (validKeyInArray!0 (select (arr!17925 lt!279225) j!136)))))

(declare-fun b!610740 () Bool)

(declare-fun call!33145 () Bool)

(assert (=> b!610740 (= e!349898 call!33145)))

(declare-fun b!610741 () Bool)

(assert (=> b!610741 (= e!349898 call!33145)))

(declare-fun b!610742 () Bool)

(declare-fun e!349897 () Bool)

(assert (=> b!610742 (= e!349897 (contains!3040 Nil!11963 (select (arr!17925 lt!279225) j!136)))))

(declare-fun b!610743 () Bool)

(declare-fun e!349896 () Bool)

(assert (=> b!610743 (= e!349896 e!349895)))

(declare-fun res!392861 () Bool)

(assert (=> b!610743 (=> (not res!392861) (not e!349895))))

(assert (=> b!610743 (= res!392861 (not e!349897))))

(declare-fun res!392859 () Bool)

(assert (=> b!610743 (=> (not res!392859) (not e!349897))))

(assert (=> b!610743 (= res!392859 (validKeyInArray!0 (select (arr!17925 lt!279225) j!136)))))

(declare-fun bm!33142 () Bool)

(assert (=> bm!33142 (= call!33145 (arrayNoDuplicates!0 lt!279225 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69307 (Cons!11962 (select (arr!17925 lt!279225) j!136) Nil!11963) Nil!11963)))))

(declare-fun d!88287 () Bool)

(declare-fun res!392860 () Bool)

(assert (=> d!88287 (=> res!392860 e!349896)))

(assert (=> d!88287 (= res!392860 (bvsge j!136 (size!18289 lt!279225)))))

(assert (=> d!88287 (= (arrayNoDuplicates!0 lt!279225 j!136 Nil!11963) e!349896)))

(assert (= (and d!88287 (not res!392860)) b!610743))

(assert (= (and b!610743 res!392859) b!610742))

(assert (= (and b!610743 res!392861) b!610739))

(assert (= (and b!610739 c!69307) b!610740))

(assert (= (and b!610739 (not c!69307)) b!610741))

(assert (= (or b!610740 b!610741) bm!33142))

(assert (=> b!610739 m!587189))

(assert (=> b!610739 m!587189))

(declare-fun m!587209 () Bool)

(assert (=> b!610739 m!587209))

(assert (=> b!610742 m!587189))

(assert (=> b!610742 m!587189))

(declare-fun m!587211 () Bool)

(assert (=> b!610742 m!587211))

(assert (=> b!610743 m!587189))

(assert (=> b!610743 m!587189))

(assert (=> b!610743 m!587209))

(assert (=> bm!33142 m!587189))

(declare-fun m!587213 () Bool)

(assert (=> bm!33142 m!587213))

(assert (=> b!610483 d!88287))

(declare-fun d!88289 () Bool)

(declare-fun e!349910 () Bool)

(assert (=> d!88289 e!349910))

(declare-fun res!392870 () Bool)

(assert (=> d!88289 (=> (not res!392870) (not e!349910))))

(assert (=> d!88289 (= res!392870 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986))))))

(declare-fun lt!279379 () Unit!19570)

(declare-fun choose!41 (array!37352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11966) Unit!19570)

(assert (=> d!88289 (= lt!279379 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11963))))

(assert (=> d!88289 (bvslt (size!18289 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88289 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11963) lt!279379)))

(declare-fun b!610756 () Bool)

(assert (=> b!610756 (= e!349910 (arrayNoDuplicates!0 (array!37353 (store (arr!17925 a!2986) i!1108 k!1786) (size!18289 a!2986)) #b00000000000000000000000000000000 Nil!11963))))

(assert (= (and d!88289 res!392870) b!610756))

(declare-fun m!587229 () Bool)

(assert (=> d!88289 m!587229))

(assert (=> b!610756 m!586925))

(declare-fun m!587231 () Bool)

(assert (=> b!610756 m!587231))

(assert (=> b!610483 d!88289))

(declare-fun b!610800 () Bool)

(declare-fun e!349939 () Bool)

(declare-fun call!33151 () Bool)

(assert (=> b!610800 (= e!349939 call!33151)))

(declare-fun b!610801 () Bool)

(declare-fun e!349940 () Bool)

(assert (=> b!610801 (= e!349940 e!349939)))

(declare-fun lt!279393 () (_ BitVec 64))

(assert (=> b!610801 (= lt!279393 (select (arr!17925 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279394 () Unit!19570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37352 (_ BitVec 64) (_ BitVec 32)) Unit!19570)

(assert (=> b!610801 (= lt!279394 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279393 #b00000000000000000000000000000000))))

(assert (=> b!610801 (arrayContainsKey!0 a!2986 lt!279393 #b00000000000000000000000000000000)))

(declare-fun lt!279392 () Unit!19570)

(assert (=> b!610801 (= lt!279392 lt!279394)))

(declare-fun res!392884 () Bool)

(assert (=> b!610801 (= res!392884 (= (seekEntryOrOpen!0 (select (arr!17925 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6365 #b00000000000000000000000000000000)))))

(assert (=> b!610801 (=> (not res!392884) (not e!349939))))

(declare-fun b!610802 () Bool)

(assert (=> b!610802 (= e!349940 call!33151)))

(declare-fun d!88293 () Bool)

(declare-fun res!392885 () Bool)

(declare-fun e!349938 () Bool)

(assert (=> d!88293 (=> res!392885 e!349938)))

(assert (=> d!88293 (= res!392885 (bvsge #b00000000000000000000000000000000 (size!18289 a!2986)))))

(assert (=> d!88293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349938)))

(declare-fun bm!33148 () Bool)

(assert (=> bm!33148 (= call!33151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610803 () Bool)

(assert (=> b!610803 (= e!349938 e!349940)))

(declare-fun c!69325 () Bool)

(assert (=> b!610803 (= c!69325 (validKeyInArray!0 (select (arr!17925 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88293 (not res!392885)) b!610803))

(assert (= (and b!610803 c!69325) b!610801))

(assert (= (and b!610803 (not c!69325)) b!610802))

(assert (= (and b!610801 res!392884) b!610800))

(assert (= (or b!610800 b!610802) bm!33148))

(assert (=> b!610801 m!587165))

(declare-fun m!587251 () Bool)

(assert (=> b!610801 m!587251))

(declare-fun m!587253 () Bool)

(assert (=> b!610801 m!587253))

(assert (=> b!610801 m!587165))

(declare-fun m!587255 () Bool)

(assert (=> b!610801 m!587255))

(declare-fun m!587257 () Bool)

(assert (=> bm!33148 m!587257))

(assert (=> b!610803 m!587165))

(assert (=> b!610803 m!587165))

(assert (=> b!610803 m!587167))

(assert (=> b!610472 d!88293))

(declare-fun b!610846 () Bool)

(declare-fun e!349971 () SeekEntryResult!6365)

(declare-fun e!349972 () SeekEntryResult!6365)

(assert (=> b!610846 (= e!349971 e!349972)))

(declare-fun lt!279423 () (_ BitVec 64))

(declare-fun lt!279422 () SeekEntryResult!6365)

(assert (=> b!610846 (= lt!279423 (select (arr!17925 a!2986) (index!27740 lt!279422)))))

(declare-fun c!69341 () Bool)

(assert (=> b!610846 (= c!69341 (= lt!279423 k!1786))))

(declare-fun b!610847 () Bool)

(assert (=> b!610847 (= e!349972 (Found!6365 (index!27740 lt!279422)))))

(declare-fun b!610848 () Bool)

(declare-fun e!349970 () SeekEntryResult!6365)

(assert (=> b!610848 (= e!349970 (seekKeyOrZeroReturnVacant!0 (x!56547 lt!279422) (index!27740 lt!279422) (index!27740 lt!279422) k!1786 a!2986 mask!3053))))

(declare-fun b!610850 () Bool)

(assert (=> b!610850 (= e!349970 (MissingZero!6365 (index!27740 lt!279422)))))

(declare-fun b!610851 () Bool)

(declare-fun c!69340 () Bool)

(assert (=> b!610851 (= c!69340 (= lt!279423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610851 (= e!349972 e!349970)))

(declare-fun b!610849 () Bool)

(assert (=> b!610849 (= e!349971 Undefined!6365)))

(declare-fun d!88301 () Bool)

(declare-fun lt!279421 () SeekEntryResult!6365)

(assert (=> d!88301 (and (or (is-Undefined!6365 lt!279421) (not (is-Found!6365 lt!279421)) (and (bvsge (index!27739 lt!279421) #b00000000000000000000000000000000) (bvslt (index!27739 lt!279421) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279421) (is-Found!6365 lt!279421) (not (is-MissingZero!6365 lt!279421)) (and (bvsge (index!27738 lt!279421) #b00000000000000000000000000000000) (bvslt (index!27738 lt!279421) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279421) (is-Found!6365 lt!279421) (is-MissingZero!6365 lt!279421) (not (is-MissingVacant!6365 lt!279421)) (and (bvsge (index!27741 lt!279421) #b00000000000000000000000000000000) (bvslt (index!27741 lt!279421) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279421) (ite (is-Found!6365 lt!279421) (= (select (arr!17925 a!2986) (index!27739 lt!279421)) k!1786) (ite (is-MissingZero!6365 lt!279421) (= (select (arr!17925 a!2986) (index!27738 lt!279421)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6365 lt!279421) (= (select (arr!17925 a!2986) (index!27741 lt!279421)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88301 (= lt!279421 e!349971)))

(declare-fun c!69339 () Bool)

(assert (=> d!88301 (= c!69339 (and (is-Intermediate!6365 lt!279422) (undefined!7177 lt!279422)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37352 (_ BitVec 32)) SeekEntryResult!6365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88301 (= lt!279422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88301 (validMask!0 mask!3053)))

(assert (=> d!88301 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!279421)))

(assert (= (and d!88301 c!69339) b!610849))

(assert (= (and d!88301 (not c!69339)) b!610846))

(assert (= (and b!610846 c!69341) b!610847))

(assert (= (and b!610846 (not c!69341)) b!610851))

(assert (= (and b!610851 c!69340) b!610850))

(assert (= (and b!610851 (not c!69340)) b!610848))

(declare-fun m!587309 () Bool)

(assert (=> b!610846 m!587309))

(declare-fun m!587311 () Bool)

(assert (=> b!610848 m!587311))

(declare-fun m!587313 () Bool)

(assert (=> d!88301 m!587313))

(declare-fun m!587315 () Bool)

(assert (=> d!88301 m!587315))

(assert (=> d!88301 m!587313))

(assert (=> d!88301 m!586931))

(declare-fun m!587317 () Bool)

(assert (=> d!88301 m!587317))

(declare-fun m!587319 () Bool)

(assert (=> d!88301 m!587319))

(declare-fun m!587321 () Bool)

(assert (=> d!88301 m!587321))

(assert (=> b!610482 d!88301))

(declare-fun d!88331 () Bool)

(declare-fun res!392908 () Bool)

(declare-fun e!349979 () Bool)

(assert (=> d!88331 (=> res!392908 e!349979)))

(assert (=> d!88331 (= res!392908 (is-Nil!11963 Nil!11963))))

(assert (=> d!88331 (= (noDuplicate!342 Nil!11963) e!349979)))

(declare-fun b!610856 () Bool)

(declare-fun e!349980 () Bool)

(assert (=> b!610856 (= e!349979 e!349980)))

(declare-fun res!392909 () Bool)

(assert (=> b!610856 (=> (not res!392909) (not e!349980))))

(assert (=> b!610856 (= res!392909 (not (contains!3040 (t!18194 Nil!11963) (h!13007 Nil!11963))))))

(declare-fun b!610857 () Bool)

(assert (=> b!610857 (= e!349980 (noDuplicate!342 (t!18194 Nil!11963)))))

(assert (= (and d!88331 (not res!392908)) b!610856))

(assert (= (and b!610856 res!392909) b!610857))

(declare-fun m!587323 () Bool)

(assert (=> b!610856 m!587323))

(declare-fun m!587325 () Bool)

(assert (=> b!610857 m!587325))

(assert (=> b!610470 d!88331))

(declare-fun d!88333 () Bool)

(declare-fun res!392910 () Bool)

(declare-fun e!349981 () Bool)

(assert (=> d!88333 (=> res!392910 e!349981)))

(assert (=> d!88333 (= res!392910 (= (select (arr!17925 lt!279225) index!984) (select (arr!17925 a!2986) j!136)))))

(assert (=> d!88333 (= (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) index!984) e!349981)))

(declare-fun b!610860 () Bool)

(declare-fun e!349982 () Bool)

(assert (=> b!610860 (= e!349981 e!349982)))

(declare-fun res!392911 () Bool)

(assert (=> b!610860 (=> (not res!392911) (not e!349982))))

(assert (=> b!610860 (= res!392911 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18289 lt!279225)))))

(declare-fun b!610861 () Bool)

(assert (=> b!610861 (= e!349982 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88333 (not res!392910)) b!610860))

(assert (= (and b!610860 res!392911) b!610861))

(declare-fun m!587327 () Bool)

(assert (=> d!88333 m!587327))

(assert (=> b!610861 m!586929))

(declare-fun m!587329 () Bool)

(assert (=> b!610861 m!587329))

(assert (=> b!610469 d!88333))

(declare-fun d!88335 () Bool)

(declare-fun res!392912 () Bool)

(declare-fun e!349983 () Bool)

(assert (=> d!88335 (=> res!392912 e!349983)))

(assert (=> d!88335 (= res!392912 (= (select (arr!17925 lt!279225) j!136) (select (arr!17925 a!2986) j!136)))))

(assert (=> d!88335 (= (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136) e!349983)))

(declare-fun b!610862 () Bool)

(declare-fun e!349984 () Bool)

(assert (=> b!610862 (= e!349983 e!349984)))

(declare-fun res!392913 () Bool)

(assert (=> b!610862 (=> (not res!392913) (not e!349984))))

(assert (=> b!610862 (= res!392913 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18289 lt!279225)))))

(declare-fun b!610863 () Bool)

(assert (=> b!610863 (= e!349984 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88335 (not res!392912)) b!610862))

(assert (= (and b!610862 res!392913) b!610863))

(assert (=> d!88335 m!587189))

(assert (=> b!610863 m!586929))

(declare-fun m!587331 () Bool)

(assert (=> b!610863 m!587331))

(assert (=> b!610480 d!88335))

(declare-fun b!610907 () Bool)

(declare-fun e!350015 () SeekEntryResult!6365)

(assert (=> b!610907 (= e!350015 (Found!6365 index!984))))

(declare-fun d!88337 () Bool)

(declare-fun lt!279449 () SeekEntryResult!6365)

(assert (=> d!88337 (and (or (is-Undefined!6365 lt!279449) (not (is-Found!6365 lt!279449)) (and (bvsge (index!27739 lt!279449) #b00000000000000000000000000000000) (bvslt (index!27739 lt!279449) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279449) (is-Found!6365 lt!279449) (not (is-MissingVacant!6365 lt!279449)) (not (= (index!27741 lt!279449) vacantSpotIndex!68)) (and (bvsge (index!27741 lt!279449) #b00000000000000000000000000000000) (bvslt (index!27741 lt!279449) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279449) (ite (is-Found!6365 lt!279449) (= (select (arr!17925 a!2986) (index!27739 lt!279449)) (select (arr!17925 a!2986) j!136)) (and (is-MissingVacant!6365 lt!279449) (= (index!27741 lt!279449) vacantSpotIndex!68) (= (select (arr!17925 a!2986) (index!27741 lt!279449)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350016 () SeekEntryResult!6365)

(assert (=> d!88337 (= lt!279449 e!350016)))

(declare-fun c!69356 () Bool)

(assert (=> d!88337 (= c!69356 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279450 () (_ BitVec 64))

(assert (=> d!88337 (= lt!279450 (select (arr!17925 a!2986) index!984))))

(assert (=> d!88337 (validMask!0 mask!3053)))

(assert (=> d!88337 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053) lt!279449)))

(declare-fun b!610908 () Bool)

(declare-fun e!350014 () SeekEntryResult!6365)

(assert (=> b!610908 (= e!350014 (MissingVacant!6365 vacantSpotIndex!68))))

(declare-fun b!610909 () Bool)

(assert (=> b!610909 (= e!350016 Undefined!6365)))

(declare-fun b!610910 () Bool)

(declare-fun c!69357 () Bool)

(assert (=> b!610910 (= c!69357 (= lt!279450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610910 (= e!350015 e!350014)))

(declare-fun b!610911 () Bool)

(assert (=> b!610911 (= e!350014 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610912 () Bool)

(assert (=> b!610912 (= e!350016 e!350015)))

(declare-fun c!69358 () Bool)

(assert (=> b!610912 (= c!69358 (= lt!279450 (select (arr!17925 a!2986) j!136)))))

(assert (= (and d!88337 c!69356) b!610909))

(assert (= (and d!88337 (not c!69356)) b!610912))

(assert (= (and b!610912 c!69358) b!610907))

(assert (= (and b!610912 (not c!69358)) b!610910))

(assert (= (and b!610910 c!69357) b!610908))

(assert (= (and b!610910 (not c!69357)) b!610911))

(declare-fun m!587375 () Bool)

(assert (=> d!88337 m!587375))

(declare-fun m!587377 () Bool)

(assert (=> d!88337 m!587377))

(assert (=> d!88337 m!586981))

(assert (=> d!88337 m!586931))

(assert (=> b!610911 m!586971))

(assert (=> b!610911 m!586971))

(assert (=> b!610911 m!586929))

(declare-fun m!587379 () Bool)

(assert (=> b!610911 m!587379))

(assert (=> b!610479 d!88337))

(declare-fun b!610913 () Bool)

(declare-fun e!350018 () SeekEntryResult!6365)

(assert (=> b!610913 (= e!350018 (Found!6365 lt!279222))))

(declare-fun lt!279451 () SeekEntryResult!6365)

(declare-fun d!88363 () Bool)

(assert (=> d!88363 (and (or (is-Undefined!6365 lt!279451) (not (is-Found!6365 lt!279451)) (and (bvsge (index!27739 lt!279451) #b00000000000000000000000000000000) (bvslt (index!27739 lt!279451) (size!18289 lt!279225)))) (or (is-Undefined!6365 lt!279451) (is-Found!6365 lt!279451) (not (is-MissingVacant!6365 lt!279451)) (not (= (index!27741 lt!279451) vacantSpotIndex!68)) (and (bvsge (index!27741 lt!279451) #b00000000000000000000000000000000) (bvslt (index!27741 lt!279451) (size!18289 lt!279225)))) (or (is-Undefined!6365 lt!279451) (ite (is-Found!6365 lt!279451) (= (select (arr!17925 lt!279225) (index!27739 lt!279451)) lt!279224) (and (is-MissingVacant!6365 lt!279451) (= (index!27741 lt!279451) vacantSpotIndex!68) (= (select (arr!17925 lt!279225) (index!27741 lt!279451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350019 () SeekEntryResult!6365)

(assert (=> d!88363 (= lt!279451 e!350019)))

(declare-fun c!69359 () Bool)

(assert (=> d!88363 (= c!69359 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279452 () (_ BitVec 64))

(assert (=> d!88363 (= lt!279452 (select (arr!17925 lt!279225) lt!279222))))

(assert (=> d!88363 (validMask!0 mask!3053)))

(assert (=> d!88363 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 lt!279224 lt!279225 mask!3053) lt!279451)))

(declare-fun b!610914 () Bool)

(declare-fun e!350017 () SeekEntryResult!6365)

(assert (=> b!610914 (= e!350017 (MissingVacant!6365 vacantSpotIndex!68))))

(declare-fun b!610915 () Bool)

(assert (=> b!610915 (= e!350019 Undefined!6365)))

(declare-fun b!610916 () Bool)

(declare-fun c!69360 () Bool)

(assert (=> b!610916 (= c!69360 (= lt!279452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610916 (= e!350018 e!350017)))

(declare-fun b!610917 () Bool)

(assert (=> b!610917 (= e!350017 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279222 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!279224 lt!279225 mask!3053))))

(declare-fun b!610918 () Bool)

(assert (=> b!610918 (= e!350019 e!350018)))

(declare-fun c!69361 () Bool)

(assert (=> b!610918 (= c!69361 (= lt!279452 lt!279224))))

(assert (= (and d!88363 c!69359) b!610915))

(assert (= (and d!88363 (not c!69359)) b!610918))

(assert (= (and b!610918 c!69361) b!610913))

(assert (= (and b!610918 (not c!69361)) b!610916))

(assert (= (and b!610916 c!69360) b!610914))

(assert (= (and b!610916 (not c!69360)) b!610917))

(declare-fun m!587381 () Bool)

(assert (=> d!88363 m!587381))

(declare-fun m!587383 () Bool)

(assert (=> d!88363 m!587383))

(declare-fun m!587385 () Bool)

(assert (=> d!88363 m!587385))

(assert (=> d!88363 m!586931))

(declare-fun m!587387 () Bool)

(assert (=> b!610917 m!587387))

(assert (=> b!610917 m!587387))

(declare-fun m!587389 () Bool)

(assert (=> b!610917 m!587389))

(assert (=> b!610468 d!88363))

(declare-fun d!88365 () Bool)

(declare-fun lt!279455 () (_ BitVec 32))

(assert (=> d!88365 (and (bvsge lt!279455 #b00000000000000000000000000000000) (bvslt lt!279455 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88365 (= lt!279455 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88365 (validMask!0 mask!3053)))

(assert (=> d!88365 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279455)))

(declare-fun bs!18640 () Bool)

(assert (= bs!18640 d!88365))

(declare-fun m!587391 () Bool)

(assert (=> bs!18640 m!587391))

(assert (=> bs!18640 m!586931))

(assert (=> b!610468 d!88365))

(declare-fun d!88367 () Bool)

(declare-fun e!350045 () Bool)

(assert (=> d!88367 e!350045))

(declare-fun res!392938 () Bool)

(assert (=> d!88367 (=> (not res!392938) (not e!350045))))

(assert (=> d!88367 (= res!392938 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18289 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18289 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18289 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986))))))

(declare-fun lt!279468 () Unit!19570)

(declare-fun choose!9 (array!37352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19570)

(assert (=> d!88367 (= lt!279468 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88367 (validMask!0 mask!3053)))

(assert (=> d!88367 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 mask!3053) lt!279468)))

(declare-fun b!610960 () Bool)

(assert (=> b!610960 (= e!350045 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 (select (store (arr!17925 a!2986) i!1108 k!1786) j!136) (array!37353 (store (arr!17925 a!2986) i!1108 k!1786) (size!18289 a!2986)) mask!3053)))))

(assert (= (and d!88367 res!392938) b!610960))

(declare-fun m!587425 () Bool)

(assert (=> d!88367 m!587425))

(assert (=> d!88367 m!586931))

(assert (=> b!610960 m!586929))

(assert (=> b!610960 m!586963))

(assert (=> b!610960 m!586925))

(assert (=> b!610960 m!586929))

(assert (=> b!610960 m!586969))

(assert (=> b!610960 m!586963))

(declare-fun m!587427 () Bool)

(assert (=> b!610960 m!587427))

(assert (=> b!610468 d!88367))

(declare-fun b!610961 () Bool)

(declare-fun e!350047 () SeekEntryResult!6365)

(assert (=> b!610961 (= e!350047 (Found!6365 index!984))))

(declare-fun lt!279471 () SeekEntryResult!6365)

(declare-fun d!88383 () Bool)

(assert (=> d!88383 (and (or (is-Undefined!6365 lt!279471) (not (is-Found!6365 lt!279471)) (and (bvsge (index!27739 lt!279471) #b00000000000000000000000000000000) (bvslt (index!27739 lt!279471) (size!18289 lt!279225)))) (or (is-Undefined!6365 lt!279471) (is-Found!6365 lt!279471) (not (is-MissingVacant!6365 lt!279471)) (not (= (index!27741 lt!279471) vacantSpotIndex!68)) (and (bvsge (index!27741 lt!279471) #b00000000000000000000000000000000) (bvslt (index!27741 lt!279471) (size!18289 lt!279225)))) (or (is-Undefined!6365 lt!279471) (ite (is-Found!6365 lt!279471) (= (select (arr!17925 lt!279225) (index!27739 lt!279471)) lt!279224) (and (is-MissingVacant!6365 lt!279471) (= (index!27741 lt!279471) vacantSpotIndex!68) (= (select (arr!17925 lt!279225) (index!27741 lt!279471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350048 () SeekEntryResult!6365)

(assert (=> d!88383 (= lt!279471 e!350048)))

(declare-fun c!69378 () Bool)

(assert (=> d!88383 (= c!69378 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279472 () (_ BitVec 64))

(assert (=> d!88383 (= lt!279472 (select (arr!17925 lt!279225) index!984))))

(assert (=> d!88383 (validMask!0 mask!3053)))

(assert (=> d!88383 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279224 lt!279225 mask!3053) lt!279471)))

(declare-fun b!610962 () Bool)

(declare-fun e!350046 () SeekEntryResult!6365)

(assert (=> b!610962 (= e!350046 (MissingVacant!6365 vacantSpotIndex!68))))

(declare-fun b!610963 () Bool)

(assert (=> b!610963 (= e!350048 Undefined!6365)))

(declare-fun b!610964 () Bool)

(declare-fun c!69379 () Bool)

(assert (=> b!610964 (= c!69379 (= lt!279472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610964 (= e!350047 e!350046)))

(declare-fun b!610965 () Bool)

(assert (=> b!610965 (= e!350046 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!279224 lt!279225 mask!3053))))

(declare-fun b!610966 () Bool)

(assert (=> b!610966 (= e!350048 e!350047)))

(declare-fun c!69380 () Bool)

(assert (=> b!610966 (= c!69380 (= lt!279472 lt!279224))))

(assert (= (and d!88383 c!69378) b!610963))

(assert (= (and d!88383 (not c!69378)) b!610966))

(assert (= (and b!610966 c!69380) b!610961))

(assert (= (and b!610966 (not c!69380)) b!610964))

(assert (= (and b!610964 c!69379) b!610962))

(assert (= (and b!610964 (not c!69379)) b!610965))

(declare-fun m!587431 () Bool)

(assert (=> d!88383 m!587431))

(declare-fun m!587433 () Bool)

(assert (=> d!88383 m!587433))

(assert (=> d!88383 m!587327))

(assert (=> d!88383 m!586931))

(assert (=> b!610965 m!586971))

(assert (=> b!610965 m!586971))

(declare-fun m!587435 () Bool)

(assert (=> b!610965 m!587435))

(assert (=> b!610468 d!88383))

(declare-fun b!610973 () Bool)

(declare-fun e!350053 () SeekEntryResult!6365)

(assert (=> b!610973 (= e!350053 (Found!6365 lt!279222))))

(declare-fun lt!279476 () SeekEntryResult!6365)

(declare-fun d!88387 () Bool)

(assert (=> d!88387 (and (or (is-Undefined!6365 lt!279476) (not (is-Found!6365 lt!279476)) (and (bvsge (index!27739 lt!279476) #b00000000000000000000000000000000) (bvslt (index!27739 lt!279476) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279476) (is-Found!6365 lt!279476) (not (is-MissingVacant!6365 lt!279476)) (not (= (index!27741 lt!279476) vacantSpotIndex!68)) (and (bvsge (index!27741 lt!279476) #b00000000000000000000000000000000) (bvslt (index!27741 lt!279476) (size!18289 a!2986)))) (or (is-Undefined!6365 lt!279476) (ite (is-Found!6365 lt!279476) (= (select (arr!17925 a!2986) (index!27739 lt!279476)) (select (arr!17925 a!2986) j!136)) (and (is-MissingVacant!6365 lt!279476) (= (index!27741 lt!279476) vacantSpotIndex!68) (= (select (arr!17925 a!2986) (index!27741 lt!279476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350054 () SeekEntryResult!6365)

(assert (=> d!88387 (= lt!279476 e!350054)))

(declare-fun c!69384 () Bool)

(assert (=> d!88387 (= c!69384 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279477 () (_ BitVec 64))

(assert (=> d!88387 (= lt!279477 (select (arr!17925 a!2986) lt!279222))))

(assert (=> d!88387 (validMask!0 mask!3053)))

(assert (=> d!88387 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279222 vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053) lt!279476)))

(declare-fun b!610974 () Bool)

(declare-fun e!350052 () SeekEntryResult!6365)

(assert (=> b!610974 (= e!350052 (MissingVacant!6365 vacantSpotIndex!68))))

(declare-fun b!610975 () Bool)

(assert (=> b!610975 (= e!350054 Undefined!6365)))

(declare-fun b!610976 () Bool)

(declare-fun c!69385 () Bool)

(assert (=> b!610976 (= c!69385 (= lt!279477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610976 (= e!350053 e!350052)))

(declare-fun b!610977 () Bool)

(assert (=> b!610977 (= e!350052 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279222 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17925 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610978 () Bool)

(assert (=> b!610978 (= e!350054 e!350053)))

(declare-fun c!69386 () Bool)

(assert (=> b!610978 (= c!69386 (= lt!279477 (select (arr!17925 a!2986) j!136)))))

(assert (= (and d!88387 c!69384) b!610975))

(assert (= (and d!88387 (not c!69384)) b!610978))

(assert (= (and b!610978 c!69386) b!610973))

(assert (= (and b!610978 (not c!69386)) b!610976))

(assert (= (and b!610976 c!69385) b!610974))

(assert (= (and b!610976 (not c!69385)) b!610977))

(declare-fun m!587445 () Bool)

(assert (=> d!88387 m!587445))

(declare-fun m!587447 () Bool)

(assert (=> d!88387 m!587447))

(declare-fun m!587449 () Bool)

(assert (=> d!88387 m!587449))

(assert (=> d!88387 m!586931))

(assert (=> b!610977 m!587387))

(assert (=> b!610977 m!587387))

(assert (=> b!610977 m!586929))

(declare-fun m!587451 () Bool)

(assert (=> b!610977 m!587451))

(assert (=> b!610468 d!88387))

(declare-fun d!88391 () Bool)

(declare-fun res!392939 () Bool)

(declare-fun e!350055 () Bool)

(assert (=> d!88391 (=> res!392939 e!350055)))

(assert (=> d!88391 (= res!392939 (= (select (arr!17925 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88391 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!350055)))

(declare-fun b!610979 () Bool)

(declare-fun e!350056 () Bool)

(assert (=> b!610979 (= e!350055 e!350056)))

(declare-fun res!392940 () Bool)

(assert (=> b!610979 (=> (not res!392940) (not e!350056))))

(assert (=> b!610979 (= res!392940 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18289 a!2986)))))

(declare-fun b!610980 () Bool)

(assert (=> b!610980 (= e!350056 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88391 (not res!392939)) b!610979))

(assert (= (and b!610979 res!392940) b!610980))

(assert (=> d!88391 m!587165))

(declare-fun m!587453 () Bool)

(assert (=> b!610980 m!587453))

(assert (=> b!610477 d!88391))

(declare-fun d!88393 () Bool)

(assert (=> d!88393 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55702 d!88393))

(declare-fun d!88395 () Bool)

(assert (=> d!88395 (= (array_inv!13721 a!2986) (bvsge (size!18289 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55702 d!88395))

(declare-fun d!88397 () Bool)

(assert (=> d!88397 (arrayContainsKey!0 lt!279225 (select (arr!17925 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279480 () Unit!19570)

(assert (=> d!88397 (= lt!279480 (choose!114 lt!279225 (select (arr!17925 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88397 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88397 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279225 (select (arr!17925 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279480)))

(declare-fun bs!18642 () Bool)

(assert (= bs!18642 d!88397))

(assert (=> bs!18642 m!586929))

(assert (=> bs!18642 m!586961))

