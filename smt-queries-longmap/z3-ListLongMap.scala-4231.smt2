; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58324 () Bool)

(assert start!58324)

(declare-fun b!643936 () Bool)

(declare-datatypes ((Unit!21810 0))(
  ( (Unit!21811) )
))
(declare-fun e!368897 () Unit!21810)

(declare-fun Unit!21812 () Unit!21810)

(assert (=> b!643936 (= e!368897 Unit!21812)))

(declare-fun b!643937 () Bool)

(declare-fun res!417103 () Bool)

(declare-fun e!368899 () Bool)

(assert (=> b!643937 (=> (not res!417103) (not e!368899))))

(declare-datatypes ((array!38421 0))(
  ( (array!38422 (arr!18424 (Array (_ BitVec 32) (_ BitVec 64))) (size!18788 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38421)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643937 (= res!417103 (validKeyInArray!0 (select (arr!18424 a!2986) j!136)))))

(declare-fun b!643939 () Bool)

(declare-fun res!417104 () Bool)

(assert (=> b!643939 (=> (not res!417104) (not e!368899))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!643939 (= res!417104 (and (= (size!18788 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18788 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18788 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643940 () Bool)

(declare-fun res!417094 () Bool)

(declare-fun e!368908 () Bool)

(assert (=> b!643940 (=> (not res!417094) (not e!368908))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!643940 (= res!417094 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18424 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643941 () Bool)

(declare-fun e!368909 () Bool)

(declare-fun e!368910 () Bool)

(assert (=> b!643941 (= e!368909 e!368910)))

(declare-fun res!417102 () Bool)

(assert (=> b!643941 (=> (not res!417102) (not e!368910))))

(declare-fun lt!298375 () array!38421)

(declare-fun arrayContainsKey!0 (array!38421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643941 (= res!417102 (arrayContainsKey!0 lt!298375 (select (arr!18424 a!2986) j!136) j!136))))

(declare-fun b!643942 () Bool)

(declare-fun e!368902 () Bool)

(declare-fun e!368907 () Bool)

(assert (=> b!643942 (= e!368902 (not e!368907))))

(declare-fun res!417107 () Bool)

(assert (=> b!643942 (=> res!417107 e!368907)))

(declare-datatypes ((SeekEntryResult!6864 0))(
  ( (MissingZero!6864 (index!29788 (_ BitVec 32))) (Found!6864 (index!29789 (_ BitVec 32))) (Intermediate!6864 (undefined!7676 Bool) (index!29790 (_ BitVec 32)) (x!58560 (_ BitVec 32))) (Undefined!6864) (MissingVacant!6864 (index!29791 (_ BitVec 32))) )
))
(declare-fun lt!298382 () SeekEntryResult!6864)

(assert (=> b!643942 (= res!417107 (not (= lt!298382 (Found!6864 index!984))))))

(declare-fun lt!298387 () Unit!21810)

(assert (=> b!643942 (= lt!298387 e!368897)))

(declare-fun c!73790 () Bool)

(assert (=> b!643942 (= c!73790 (= lt!298382 Undefined!6864))))

(declare-fun lt!298373 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38421 (_ BitVec 32)) SeekEntryResult!6864)

(assert (=> b!643942 (= lt!298382 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298373 lt!298375 mask!3053))))

(declare-fun e!368903 () Bool)

(assert (=> b!643942 e!368903))

(declare-fun res!417099 () Bool)

(assert (=> b!643942 (=> (not res!417099) (not e!368903))))

(declare-fun lt!298383 () (_ BitVec 32))

(declare-fun lt!298374 () SeekEntryResult!6864)

(assert (=> b!643942 (= res!417099 (= lt!298374 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298383 vacantSpotIndex!68 lt!298373 lt!298375 mask!3053)))))

(assert (=> b!643942 (= lt!298374 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298383 vacantSpotIndex!68 (select (arr!18424 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!643942 (= lt!298373 (select (store (arr!18424 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298380 () Unit!21810)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21810)

(assert (=> b!643942 (= lt!298380 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298383 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643942 (= lt!298383 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643943 () Bool)

(declare-fun e!368901 () Bool)

(assert (=> b!643943 (= e!368901 e!368902)))

(declare-fun res!417092 () Bool)

(assert (=> b!643943 (=> (not res!417092) (not e!368902))))

(declare-fun lt!298381 () SeekEntryResult!6864)

(assert (=> b!643943 (= res!417092 (and (= lt!298381 (Found!6864 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18424 a!2986) index!984) (select (arr!18424 a!2986) j!136))) (not (= (select (arr!18424 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!643943 (= lt!298381 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18424 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643944 () Bool)

(declare-fun e!368905 () Bool)

(assert (=> b!643944 (= e!368905 true)))

(declare-fun e!368900 () Bool)

(assert (=> b!643944 e!368900))

(declare-fun res!417096 () Bool)

(assert (=> b!643944 (=> (not res!417096) (not e!368900))))

(assert (=> b!643944 (= res!417096 (arrayContainsKey!0 lt!298375 (select (arr!18424 a!2986) j!136) j!136))))

(declare-fun b!643945 () Bool)

(declare-fun e!368896 () Bool)

(assert (=> b!643945 (= e!368896 e!368905)))

(declare-fun res!417106 () Bool)

(assert (=> b!643945 (=> res!417106 e!368905)))

(assert (=> b!643945 (= res!417106 (bvsge index!984 j!136))))

(declare-fun lt!298384 () Unit!21810)

(declare-fun e!368904 () Unit!21810)

(assert (=> b!643945 (= lt!298384 e!368904)))

(declare-fun c!73789 () Bool)

(assert (=> b!643945 (= c!73789 (bvslt j!136 index!984))))

(declare-fun b!643946 () Bool)

(assert (=> b!643946 (= e!368900 (arrayContainsKey!0 lt!298375 (select (arr!18424 a!2986) j!136) index!984))))

(declare-fun b!643947 () Bool)

(declare-fun res!417093 () Bool)

(assert (=> b!643947 (=> (not res!417093) (not e!368899))))

(assert (=> b!643947 (= res!417093 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643948 () Bool)

(declare-fun e!368898 () Bool)

(assert (=> b!643948 (= e!368898 e!368909)))

(declare-fun res!417108 () Bool)

(assert (=> b!643948 (=> res!417108 e!368909)))

(declare-fun lt!298376 () (_ BitVec 64))

(assert (=> b!643948 (= res!417108 (or (not (= (select (arr!18424 a!2986) j!136) lt!298373)) (not (= (select (arr!18424 a!2986) j!136) lt!298376)) (bvsge j!136 index!984)))))

(declare-fun b!643949 () Bool)

(declare-fun res!417095 () Bool)

(assert (=> b!643949 (=> (not res!417095) (not e!368908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38421 (_ BitVec 32)) Bool)

(assert (=> b!643949 (= res!417095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643950 () Bool)

(declare-fun Unit!21813 () Unit!21810)

(assert (=> b!643950 (= e!368897 Unit!21813)))

(assert (=> b!643950 false))

(declare-fun b!643951 () Bool)

(assert (=> b!643951 (= e!368899 e!368908)))

(declare-fun res!417100 () Bool)

(assert (=> b!643951 (=> (not res!417100) (not e!368908))))

(declare-fun lt!298386 () SeekEntryResult!6864)

(assert (=> b!643951 (= res!417100 (or (= lt!298386 (MissingZero!6864 i!1108)) (= lt!298386 (MissingVacant!6864 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38421 (_ BitVec 32)) SeekEntryResult!6864)

(assert (=> b!643951 (= lt!298386 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643952 () Bool)

(declare-fun Unit!21814 () Unit!21810)

(assert (=> b!643952 (= e!368904 Unit!21814)))

(declare-fun b!643953 () Bool)

(assert (=> b!643953 (= e!368908 e!368901)))

(declare-fun res!417098 () Bool)

(assert (=> b!643953 (=> (not res!417098) (not e!368901))))

(assert (=> b!643953 (= res!417098 (= (select (store (arr!18424 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643953 (= lt!298375 (array!38422 (store (arr!18424 a!2986) i!1108 k0!1786) (size!18788 a!2986)))))

(declare-fun b!643954 () Bool)

(assert (=> b!643954 (= e!368903 (= lt!298381 lt!298374))))

(declare-fun res!417110 () Bool)

(assert (=> start!58324 (=> (not res!417110) (not e!368899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58324 (= res!417110 (validMask!0 mask!3053))))

(assert (=> start!58324 e!368899))

(assert (=> start!58324 true))

(declare-fun array_inv!14220 (array!38421) Bool)

(assert (=> start!58324 (array_inv!14220 a!2986)))

(declare-fun b!643938 () Bool)

(declare-fun res!417109 () Bool)

(assert (=> b!643938 (=> (not res!417109) (not e!368899))))

(assert (=> b!643938 (= res!417109 (validKeyInArray!0 k0!1786))))

(declare-fun b!643955 () Bool)

(assert (=> b!643955 (= e!368910 (arrayContainsKey!0 lt!298375 (select (arr!18424 a!2986) j!136) index!984))))

(declare-fun b!643956 () Bool)

(assert (=> b!643956 (= e!368907 e!368896)))

(declare-fun res!417101 () Bool)

(assert (=> b!643956 (=> res!417101 e!368896)))

(assert (=> b!643956 (= res!417101 (or (not (= (select (arr!18424 a!2986) j!136) lt!298373)) (not (= (select (arr!18424 a!2986) j!136) lt!298376))))))

(assert (=> b!643956 e!368898))

(declare-fun res!417105 () Bool)

(assert (=> b!643956 (=> (not res!417105) (not e!368898))))

(assert (=> b!643956 (= res!417105 (= lt!298376 (select (arr!18424 a!2986) j!136)))))

(assert (=> b!643956 (= lt!298376 (select (store (arr!18424 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643957 () Bool)

(declare-fun Unit!21815 () Unit!21810)

(assert (=> b!643957 (= e!368904 Unit!21815)))

(declare-fun lt!298385 () Unit!21810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21810)

(assert (=> b!643957 (= lt!298385 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298375 (select (arr!18424 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643957 (arrayContainsKey!0 lt!298375 (select (arr!18424 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298379 () Unit!21810)

(declare-datatypes ((List!12465 0))(
  ( (Nil!12462) (Cons!12461 (h!13506 (_ BitVec 64)) (t!18693 List!12465)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12465) Unit!21810)

(assert (=> b!643957 (= lt!298379 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12462))))

(declare-fun arrayNoDuplicates!0 (array!38421 (_ BitVec 32) List!12465) Bool)

(assert (=> b!643957 (arrayNoDuplicates!0 lt!298375 #b00000000000000000000000000000000 Nil!12462)))

(declare-fun lt!298377 () Unit!21810)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38421 (_ BitVec 32) (_ BitVec 32)) Unit!21810)

(assert (=> b!643957 (= lt!298377 (lemmaNoDuplicateFromThenFromBigger!0 lt!298375 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643957 (arrayNoDuplicates!0 lt!298375 j!136 Nil!12462)))

(declare-fun lt!298378 () Unit!21810)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38421 (_ BitVec 64) (_ BitVec 32) List!12465) Unit!21810)

(assert (=> b!643957 (= lt!298378 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298375 (select (arr!18424 a!2986) j!136) j!136 Nil!12462))))

(assert (=> b!643957 false))

(declare-fun b!643958 () Bool)

(declare-fun res!417097 () Bool)

(assert (=> b!643958 (=> (not res!417097) (not e!368908))))

(assert (=> b!643958 (= res!417097 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12462))))

(assert (= (and start!58324 res!417110) b!643939))

(assert (= (and b!643939 res!417104) b!643937))

(assert (= (and b!643937 res!417103) b!643938))

(assert (= (and b!643938 res!417109) b!643947))

(assert (= (and b!643947 res!417093) b!643951))

(assert (= (and b!643951 res!417100) b!643949))

(assert (= (and b!643949 res!417095) b!643958))

(assert (= (and b!643958 res!417097) b!643940))

(assert (= (and b!643940 res!417094) b!643953))

(assert (= (and b!643953 res!417098) b!643943))

(assert (= (and b!643943 res!417092) b!643942))

(assert (= (and b!643942 res!417099) b!643954))

(assert (= (and b!643942 c!73790) b!643950))

(assert (= (and b!643942 (not c!73790)) b!643936))

(assert (= (and b!643942 (not res!417107)) b!643956))

(assert (= (and b!643956 res!417105) b!643948))

(assert (= (and b!643948 (not res!417108)) b!643941))

(assert (= (and b!643941 res!417102) b!643955))

(assert (= (and b!643956 (not res!417101)) b!643945))

(assert (= (and b!643945 c!73789) b!643957))

(assert (= (and b!643945 (not c!73789)) b!643952))

(assert (= (and b!643945 (not res!417106)) b!643944))

(assert (= (and b!643944 res!417096) b!643946))

(declare-fun m!617609 () Bool)

(assert (=> b!643951 m!617609))

(declare-fun m!617611 () Bool)

(assert (=> b!643947 m!617611))

(declare-fun m!617613 () Bool)

(assert (=> b!643958 m!617613))

(declare-fun m!617615 () Bool)

(assert (=> b!643949 m!617615))

(declare-fun m!617617 () Bool)

(assert (=> b!643942 m!617617))

(declare-fun m!617619 () Bool)

(assert (=> b!643942 m!617619))

(declare-fun m!617621 () Bool)

(assert (=> b!643942 m!617621))

(declare-fun m!617623 () Bool)

(assert (=> b!643942 m!617623))

(declare-fun m!617625 () Bool)

(assert (=> b!643942 m!617625))

(declare-fun m!617627 () Bool)

(assert (=> b!643942 m!617627))

(declare-fun m!617629 () Bool)

(assert (=> b!643942 m!617629))

(assert (=> b!643942 m!617625))

(declare-fun m!617631 () Bool)

(assert (=> b!643942 m!617631))

(assert (=> b!643953 m!617621))

(declare-fun m!617633 () Bool)

(assert (=> b!643953 m!617633))

(assert (=> b!643955 m!617625))

(assert (=> b!643955 m!617625))

(declare-fun m!617635 () Bool)

(assert (=> b!643955 m!617635))

(declare-fun m!617637 () Bool)

(assert (=> b!643943 m!617637))

(assert (=> b!643943 m!617625))

(assert (=> b!643943 m!617625))

(declare-fun m!617639 () Bool)

(assert (=> b!643943 m!617639))

(assert (=> b!643937 m!617625))

(assert (=> b!643937 m!617625))

(declare-fun m!617641 () Bool)

(assert (=> b!643937 m!617641))

(assert (=> b!643946 m!617625))

(assert (=> b!643946 m!617625))

(assert (=> b!643946 m!617635))

(assert (=> b!643944 m!617625))

(assert (=> b!643944 m!617625))

(declare-fun m!617643 () Bool)

(assert (=> b!643944 m!617643))

(assert (=> b!643957 m!617625))

(declare-fun m!617645 () Bool)

(assert (=> b!643957 m!617645))

(declare-fun m!617647 () Bool)

(assert (=> b!643957 m!617647))

(assert (=> b!643957 m!617625))

(declare-fun m!617649 () Bool)

(assert (=> b!643957 m!617649))

(declare-fun m!617651 () Bool)

(assert (=> b!643957 m!617651))

(declare-fun m!617653 () Bool)

(assert (=> b!643957 m!617653))

(assert (=> b!643957 m!617625))

(declare-fun m!617655 () Bool)

(assert (=> b!643957 m!617655))

(assert (=> b!643957 m!617625))

(declare-fun m!617657 () Bool)

(assert (=> b!643957 m!617657))

(assert (=> b!643941 m!617625))

(assert (=> b!643941 m!617625))

(assert (=> b!643941 m!617643))

(assert (=> b!643948 m!617625))

(declare-fun m!617659 () Bool)

(assert (=> b!643938 m!617659))

(declare-fun m!617661 () Bool)

(assert (=> start!58324 m!617661))

(declare-fun m!617663 () Bool)

(assert (=> start!58324 m!617663))

(declare-fun m!617665 () Bool)

(assert (=> b!643940 m!617665))

(assert (=> b!643956 m!617625))

(assert (=> b!643956 m!617621))

(declare-fun m!617667 () Bool)

(assert (=> b!643956 m!617667))

(check-sat (not b!643946) (not b!643958) (not b!643944) (not b!643937) (not b!643955) (not b!643943) (not b!643942) (not b!643947) (not b!643949) (not start!58324) (not b!643941) (not b!643951) (not b!643957) (not b!643938))
(check-sat)
