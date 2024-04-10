; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58850 () Bool)

(assert start!58850)

(declare-fun b!648405 () Bool)

(declare-fun e!371895 () Bool)

(declare-fun e!371894 () Bool)

(assert (=> b!648405 (= e!371895 e!371894)))

(declare-fun res!420074 () Bool)

(assert (=> b!648405 (=> res!420074 e!371894)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!648405 (= res!420074 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22038 0))(
  ( (Unit!22039) )
))
(declare-fun lt!300929 () Unit!22038)

(declare-fun e!371886 () Unit!22038)

(assert (=> b!648405 (= lt!300929 e!371886)))

(declare-fun c!74542 () Bool)

(assert (=> b!648405 (= c!74542 (bvslt j!136 index!984))))

(declare-fun b!648406 () Bool)

(declare-fun e!371893 () Bool)

(declare-fun e!371892 () Bool)

(assert (=> b!648406 (= e!371893 e!371892)))

(declare-fun res!420057 () Bool)

(assert (=> b!648406 (=> (not res!420057) (not e!371892))))

(declare-datatypes ((array!38512 0))(
  ( (array!38513 (arr!18462 (Array (_ BitVec 32) (_ BitVec 64))) (size!18826 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38512)

(declare-fun lt!300930 () array!38512)

(declare-fun arrayContainsKey!0 (array!38512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648406 (= res!420057 (arrayContainsKey!0 lt!300930 (select (arr!18462 a!2986) j!136) j!136))))

(declare-fun b!648407 () Bool)

(declare-fun res!420056 () Bool)

(declare-fun e!371890 () Bool)

(assert (=> b!648407 (=> (not res!420056) (not e!371890))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648407 (= res!420056 (and (= (size!18826 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18826 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18826 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648409 () Bool)

(declare-fun Unit!22040 () Unit!22038)

(assert (=> b!648409 (= e!371886 Unit!22040)))

(declare-fun lt!300921 () Unit!22038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22038)

(assert (=> b!648409 (= lt!300921 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300930 (select (arr!18462 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648409 (arrayContainsKey!0 lt!300930 (select (arr!18462 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300934 () Unit!22038)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!12503 0))(
  ( (Nil!12500) (Cons!12499 (h!13544 (_ BitVec 64)) (t!18731 List!12503)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12503) Unit!22038)

(assert (=> b!648409 (= lt!300934 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12500))))

(declare-fun arrayNoDuplicates!0 (array!38512 (_ BitVec 32) List!12503) Bool)

(assert (=> b!648409 (arrayNoDuplicates!0 lt!300930 #b00000000000000000000000000000000 Nil!12500)))

(declare-fun lt!300918 () Unit!22038)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38512 (_ BitVec 32) (_ BitVec 32)) Unit!22038)

(assert (=> b!648409 (= lt!300918 (lemmaNoDuplicateFromThenFromBigger!0 lt!300930 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648409 (arrayNoDuplicates!0 lt!300930 j!136 Nil!12500)))

(declare-fun lt!300931 () Unit!22038)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38512 (_ BitVec 64) (_ BitVec 32) List!12503) Unit!22038)

(assert (=> b!648409 (= lt!300931 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300930 (select (arr!18462 a!2986) j!136) j!136 Nil!12500))))

(assert (=> b!648409 false))

(declare-fun b!648410 () Bool)

(declare-fun Unit!22041 () Unit!22038)

(assert (=> b!648410 (= e!371886 Unit!22041)))

(declare-fun b!648411 () Bool)

(declare-fun e!371889 () Bool)

(assert (=> b!648411 (= e!371890 e!371889)))

(declare-fun res!420065 () Bool)

(assert (=> b!648411 (=> (not res!420065) (not e!371889))))

(declare-datatypes ((SeekEntryResult!6902 0))(
  ( (MissingZero!6902 (index!29955 (_ BitVec 32))) (Found!6902 (index!29956 (_ BitVec 32))) (Intermediate!6902 (undefined!7714 Bool) (index!29957 (_ BitVec 32)) (x!58747 (_ BitVec 32))) (Undefined!6902) (MissingVacant!6902 (index!29958 (_ BitVec 32))) )
))
(declare-fun lt!300933 () SeekEntryResult!6902)

(assert (=> b!648411 (= res!420065 (or (= lt!300933 (MissingZero!6902 i!1108)) (= lt!300933 (MissingVacant!6902 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38512 (_ BitVec 32)) SeekEntryResult!6902)

(assert (=> b!648411 (= lt!300933 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!648412 () Bool)

(declare-fun res!420069 () Bool)

(declare-fun e!371891 () Bool)

(assert (=> b!648412 (=> res!420069 e!371891)))

(declare-fun contains!3158 (List!12503 (_ BitVec 64)) Bool)

(assert (=> b!648412 (= res!420069 (contains!3158 Nil!12500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648413 () Bool)

(declare-fun e!371897 () Bool)

(declare-fun lt!300928 () SeekEntryResult!6902)

(declare-fun lt!300924 () SeekEntryResult!6902)

(assert (=> b!648413 (= e!371897 (= lt!300928 lt!300924))))

(declare-fun b!648414 () Bool)

(declare-fun res!420062 () Bool)

(assert (=> b!648414 (=> res!420062 e!371891)))

(assert (=> b!648414 (= res!420062 (contains!3158 Nil!12500 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648415 () Bool)

(declare-fun e!371896 () Bool)

(assert (=> b!648415 (= e!371889 e!371896)))

(declare-fun res!420075 () Bool)

(assert (=> b!648415 (=> (not res!420075) (not e!371896))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!648415 (= res!420075 (= (select (store (arr!18462 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648415 (= lt!300930 (array!38513 (store (arr!18462 a!2986) i!1108 k!1786) (size!18826 a!2986)))))

(declare-fun b!648416 () Bool)

(declare-fun e!371900 () Unit!22038)

(declare-fun Unit!22042 () Unit!22038)

(assert (=> b!648416 (= e!371900 Unit!22042)))

(declare-fun b!648417 () Bool)

(declare-fun res!420064 () Bool)

(assert (=> b!648417 (=> (not res!420064) (not e!371889))))

(assert (=> b!648417 (= res!420064 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12500))))

(declare-fun b!648418 () Bool)

(assert (=> b!648418 (= e!371891 true)))

(declare-fun lt!300927 () Bool)

(assert (=> b!648418 (= lt!300927 (contains!3158 Nil!12500 k!1786))))

(declare-fun b!648419 () Bool)

(declare-fun res!420077 () Bool)

(assert (=> b!648419 (=> (not res!420077) (not e!371890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648419 (= res!420077 (validKeyInArray!0 k!1786))))

(declare-fun b!648420 () Bool)

(declare-fun e!371901 () Bool)

(assert (=> b!648420 (= e!371901 e!371895)))

(declare-fun res!420058 () Bool)

(assert (=> b!648420 (=> res!420058 e!371895)))

(declare-fun lt!300925 () (_ BitVec 64))

(declare-fun lt!300926 () (_ BitVec 64))

(assert (=> b!648420 (= res!420058 (or (not (= (select (arr!18462 a!2986) j!136) lt!300925)) (not (= (select (arr!18462 a!2986) j!136) lt!300926))))))

(declare-fun e!371888 () Bool)

(assert (=> b!648420 e!371888))

(declare-fun res!420067 () Bool)

(assert (=> b!648420 (=> (not res!420067) (not e!371888))))

(assert (=> b!648420 (= res!420067 (= lt!300926 (select (arr!18462 a!2986) j!136)))))

(assert (=> b!648420 (= lt!300926 (select (store (arr!18462 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!648421 () Bool)

(declare-fun Unit!22043 () Unit!22038)

(assert (=> b!648421 (= e!371900 Unit!22043)))

(assert (=> b!648421 false))

(declare-fun b!648422 () Bool)

(declare-fun res!420066 () Bool)

(assert (=> b!648422 (=> (not res!420066) (not e!371890))))

(assert (=> b!648422 (= res!420066 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648408 () Bool)

(declare-fun e!371898 () Bool)

(assert (=> b!648408 (= e!371898 (not e!371901))))

(declare-fun res!420072 () Bool)

(assert (=> b!648408 (=> res!420072 e!371901)))

(declare-fun lt!300919 () SeekEntryResult!6902)

(assert (=> b!648408 (= res!420072 (not (= lt!300919 (Found!6902 index!984))))))

(declare-fun lt!300923 () Unit!22038)

(assert (=> b!648408 (= lt!300923 e!371900)))

(declare-fun c!74543 () Bool)

(assert (=> b!648408 (= c!74543 (= lt!300919 Undefined!6902))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38512 (_ BitVec 32)) SeekEntryResult!6902)

(assert (=> b!648408 (= lt!300919 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300925 lt!300930 mask!3053))))

(assert (=> b!648408 e!371897))

(declare-fun res!420055 () Bool)

(assert (=> b!648408 (=> (not res!420055) (not e!371897))))

(declare-fun lt!300932 () (_ BitVec 32))

(assert (=> b!648408 (= res!420055 (= lt!300924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300932 vacantSpotIndex!68 lt!300925 lt!300930 mask!3053)))))

(assert (=> b!648408 (= lt!300924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300932 vacantSpotIndex!68 (select (arr!18462 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648408 (= lt!300925 (select (store (arr!18462 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300922 () Unit!22038)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22038)

(assert (=> b!648408 (= lt!300922 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300932 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648408 (= lt!300932 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!420061 () Bool)

(assert (=> start!58850 (=> (not res!420061) (not e!371890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58850 (= res!420061 (validMask!0 mask!3053))))

(assert (=> start!58850 e!371890))

(assert (=> start!58850 true))

(declare-fun array_inv!14258 (array!38512) Bool)

(assert (=> start!58850 (array_inv!14258 a!2986)))

(declare-fun b!648423 () Bool)

(assert (=> b!648423 (= e!371892 (arrayContainsKey!0 lt!300930 (select (arr!18462 a!2986) j!136) index!984))))

(declare-fun b!648424 () Bool)

(declare-fun e!371899 () Bool)

(assert (=> b!648424 (= e!371899 (arrayContainsKey!0 lt!300930 (select (arr!18462 a!2986) j!136) index!984))))

(declare-fun b!648425 () Bool)

(assert (=> b!648425 (= e!371894 e!371891)))

(declare-fun res!420068 () Bool)

(assert (=> b!648425 (=> res!420068 e!371891)))

(assert (=> b!648425 (= res!420068 (or (bvsge (size!18826 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18826 a!2986))))))

(assert (=> b!648425 (arrayContainsKey!0 lt!300930 (select (arr!18462 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300920 () Unit!22038)

(assert (=> b!648425 (= lt!300920 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300930 (select (arr!18462 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648425 e!371899))

(declare-fun res!420076 () Bool)

(assert (=> b!648425 (=> (not res!420076) (not e!371899))))

(assert (=> b!648425 (= res!420076 (arrayContainsKey!0 lt!300930 (select (arr!18462 a!2986) j!136) j!136))))

(declare-fun b!648426 () Bool)

(declare-fun res!420070 () Bool)

(assert (=> b!648426 (=> (not res!420070) (not e!371889))))

(assert (=> b!648426 (= res!420070 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18462 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648427 () Bool)

(assert (=> b!648427 (= e!371896 e!371898)))

(declare-fun res!420071 () Bool)

(assert (=> b!648427 (=> (not res!420071) (not e!371898))))

(assert (=> b!648427 (= res!420071 (and (= lt!300928 (Found!6902 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18462 a!2986) index!984) (select (arr!18462 a!2986) j!136))) (not (= (select (arr!18462 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648427 (= lt!300928 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18462 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648428 () Bool)

(declare-fun res!420060 () Bool)

(assert (=> b!648428 (=> (not res!420060) (not e!371890))))

(assert (=> b!648428 (= res!420060 (validKeyInArray!0 (select (arr!18462 a!2986) j!136)))))

(declare-fun b!648429 () Bool)

(declare-fun res!420063 () Bool)

(assert (=> b!648429 (=> res!420063 e!371891)))

(declare-fun noDuplicate!420 (List!12503) Bool)

(assert (=> b!648429 (= res!420063 (not (noDuplicate!420 Nil!12500)))))

(declare-fun b!648430 () Bool)

(declare-fun res!420073 () Bool)

(assert (=> b!648430 (=> (not res!420073) (not e!371889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38512 (_ BitVec 32)) Bool)

(assert (=> b!648430 (= res!420073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648431 () Bool)

(assert (=> b!648431 (= e!371888 e!371893)))

(declare-fun res!420059 () Bool)

(assert (=> b!648431 (=> res!420059 e!371893)))

(assert (=> b!648431 (= res!420059 (or (not (= (select (arr!18462 a!2986) j!136) lt!300925)) (not (= (select (arr!18462 a!2986) j!136) lt!300926)) (bvsge j!136 index!984)))))

(assert (= (and start!58850 res!420061) b!648407))

(assert (= (and b!648407 res!420056) b!648428))

(assert (= (and b!648428 res!420060) b!648419))

(assert (= (and b!648419 res!420077) b!648422))

(assert (= (and b!648422 res!420066) b!648411))

(assert (= (and b!648411 res!420065) b!648430))

(assert (= (and b!648430 res!420073) b!648417))

(assert (= (and b!648417 res!420064) b!648426))

(assert (= (and b!648426 res!420070) b!648415))

(assert (= (and b!648415 res!420075) b!648427))

(assert (= (and b!648427 res!420071) b!648408))

(assert (= (and b!648408 res!420055) b!648413))

(assert (= (and b!648408 c!74543) b!648421))

(assert (= (and b!648408 (not c!74543)) b!648416))

(assert (= (and b!648408 (not res!420072)) b!648420))

(assert (= (and b!648420 res!420067) b!648431))

(assert (= (and b!648431 (not res!420059)) b!648406))

(assert (= (and b!648406 res!420057) b!648423))

(assert (= (and b!648420 (not res!420058)) b!648405))

(assert (= (and b!648405 c!74542) b!648409))

(assert (= (and b!648405 (not c!74542)) b!648410))

(assert (= (and b!648405 (not res!420074)) b!648425))

(assert (= (and b!648425 res!420076) b!648424))

(assert (= (and b!648425 (not res!420068)) b!648429))

(assert (= (and b!648429 (not res!420063)) b!648412))

(assert (= (and b!648412 (not res!420069)) b!648414))

(assert (= (and b!648414 (not res!420062)) b!648418))

(declare-fun m!621773 () Bool)

(assert (=> b!648428 m!621773))

(assert (=> b!648428 m!621773))

(declare-fun m!621775 () Bool)

(assert (=> b!648428 m!621775))

(declare-fun m!621777 () Bool)

(assert (=> b!648426 m!621777))

(declare-fun m!621779 () Bool)

(assert (=> b!648419 m!621779))

(assert (=> b!648406 m!621773))

(assert (=> b!648406 m!621773))

(declare-fun m!621781 () Bool)

(assert (=> b!648406 m!621781))

(declare-fun m!621783 () Bool)

(assert (=> b!648417 m!621783))

(assert (=> b!648423 m!621773))

(assert (=> b!648423 m!621773))

(declare-fun m!621785 () Bool)

(assert (=> b!648423 m!621785))

(declare-fun m!621787 () Bool)

(assert (=> b!648418 m!621787))

(assert (=> b!648420 m!621773))

(declare-fun m!621789 () Bool)

(assert (=> b!648420 m!621789))

(declare-fun m!621791 () Bool)

(assert (=> b!648420 m!621791))

(assert (=> b!648424 m!621773))

(assert (=> b!648424 m!621773))

(assert (=> b!648424 m!621785))

(assert (=> b!648415 m!621789))

(declare-fun m!621793 () Bool)

(assert (=> b!648415 m!621793))

(declare-fun m!621795 () Bool)

(assert (=> start!58850 m!621795))

(declare-fun m!621797 () Bool)

(assert (=> start!58850 m!621797))

(declare-fun m!621799 () Bool)

(assert (=> b!648427 m!621799))

(assert (=> b!648427 m!621773))

(assert (=> b!648427 m!621773))

(declare-fun m!621801 () Bool)

(assert (=> b!648427 m!621801))

(declare-fun m!621803 () Bool)

(assert (=> b!648422 m!621803))

(declare-fun m!621805 () Bool)

(assert (=> b!648429 m!621805))

(assert (=> b!648431 m!621773))

(declare-fun m!621807 () Bool)

(assert (=> b!648408 m!621807))

(declare-fun m!621809 () Bool)

(assert (=> b!648408 m!621809))

(declare-fun m!621811 () Bool)

(assert (=> b!648408 m!621811))

(assert (=> b!648408 m!621789))

(assert (=> b!648408 m!621773))

(declare-fun m!621813 () Bool)

(assert (=> b!648408 m!621813))

(declare-fun m!621815 () Bool)

(assert (=> b!648408 m!621815))

(declare-fun m!621817 () Bool)

(assert (=> b!648408 m!621817))

(assert (=> b!648408 m!621773))

(declare-fun m!621819 () Bool)

(assert (=> b!648411 m!621819))

(declare-fun m!621821 () Bool)

(assert (=> b!648414 m!621821))

(assert (=> b!648425 m!621773))

(assert (=> b!648425 m!621773))

(declare-fun m!621823 () Bool)

(assert (=> b!648425 m!621823))

(assert (=> b!648425 m!621773))

(declare-fun m!621825 () Bool)

(assert (=> b!648425 m!621825))

(assert (=> b!648425 m!621773))

(assert (=> b!648425 m!621781))

(declare-fun m!621827 () Bool)

(assert (=> b!648430 m!621827))

(declare-fun m!621829 () Bool)

(assert (=> b!648409 m!621829))

(assert (=> b!648409 m!621773))

(declare-fun m!621831 () Bool)

(assert (=> b!648409 m!621831))

(assert (=> b!648409 m!621773))

(declare-fun m!621833 () Bool)

(assert (=> b!648409 m!621833))

(declare-fun m!621835 () Bool)

(assert (=> b!648409 m!621835))

(assert (=> b!648409 m!621773))

(declare-fun m!621837 () Bool)

(assert (=> b!648409 m!621837))

(assert (=> b!648409 m!621773))

(declare-fun m!621839 () Bool)

(assert (=> b!648409 m!621839))

(declare-fun m!621841 () Bool)

(assert (=> b!648409 m!621841))

(declare-fun m!621843 () Bool)

(assert (=> b!648412 m!621843))

(push 1)

