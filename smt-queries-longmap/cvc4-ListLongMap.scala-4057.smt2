; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55574 () Bool)

(assert start!55574)

(declare-datatypes ((array!37305 0))(
  ( (array!37306 (arr!17903 (Array (_ BitVec 32) (_ BitVec 64))) (size!18267 (_ BitVec 32))) )
))
(declare-fun lt!277959 () array!37305)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!348453 () Bool)

(declare-fun b!608430 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37305)

(declare-fun arrayContainsKey!0 (array!37305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608430 (= e!348453 (arrayContainsKey!0 lt!277959 (select (arr!17903 a!2986) j!136) index!984))))

(declare-fun b!608431 () Bool)

(declare-fun e!348441 () Bool)

(declare-fun e!348442 () Bool)

(assert (=> b!608431 (= e!348441 (not e!348442))))

(declare-fun res!391102 () Bool)

(assert (=> b!608431 (=> res!391102 e!348442)))

(declare-datatypes ((SeekEntryResult!6343 0))(
  ( (MissingZero!6343 (index!27647 (_ BitVec 32))) (Found!6343 (index!27648 (_ BitVec 32))) (Intermediate!6343 (undefined!7155 Bool) (index!27649 (_ BitVec 32)) (x!56452 (_ BitVec 32))) (Undefined!6343) (MissingVacant!6343 (index!27650 (_ BitVec 32))) )
))
(declare-fun lt!277957 () SeekEntryResult!6343)

(assert (=> b!608431 (= res!391102 (not (= lt!277957 (Found!6343 index!984))))))

(declare-datatypes ((Unit!19438 0))(
  ( (Unit!19439) )
))
(declare-fun lt!277958 () Unit!19438)

(declare-fun e!348447 () Unit!19438)

(assert (=> b!608431 (= lt!277958 e!348447)))

(declare-fun c!69031 () Bool)

(assert (=> b!608431 (= c!69031 (= lt!277957 Undefined!6343))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!277949 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37305 (_ BitVec 32)) SeekEntryResult!6343)

(assert (=> b!608431 (= lt!277957 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277949 lt!277959 mask!3053))))

(declare-fun e!348445 () Bool)

(assert (=> b!608431 e!348445))

(declare-fun res!391104 () Bool)

(assert (=> b!608431 (=> (not res!391104) (not e!348445))))

(declare-fun lt!277952 () SeekEntryResult!6343)

(declare-fun lt!277963 () (_ BitVec 32))

(assert (=> b!608431 (= res!391104 (= lt!277952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277963 vacantSpotIndex!68 lt!277949 lt!277959 mask!3053)))))

(assert (=> b!608431 (= lt!277952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277963 vacantSpotIndex!68 (select (arr!17903 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!608431 (= lt!277949 (select (store (arr!17903 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277951 () Unit!19438)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19438)

(assert (=> b!608431 (= lt!277951 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277963 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608431 (= lt!277963 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608432 () Bool)

(declare-fun e!348439 () Bool)

(declare-fun e!348440 () Bool)

(assert (=> b!608432 (= e!348439 e!348440)))

(declare-fun res!391107 () Bool)

(assert (=> b!608432 (=> (not res!391107) (not e!348440))))

(assert (=> b!608432 (= res!391107 (= (select (store (arr!17903 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608432 (= lt!277959 (array!37306 (store (arr!17903 a!2986) i!1108 k!1786) (size!18267 a!2986)))))

(declare-fun b!608433 () Bool)

(declare-fun res!391111 () Bool)

(declare-fun e!348438 () Bool)

(assert (=> b!608433 (=> res!391111 e!348438)))

(declare-datatypes ((List!11944 0))(
  ( (Nil!11941) (Cons!11940 (h!12985 (_ BitVec 64)) (t!18172 List!11944)) )
))
(declare-fun contains!3020 (List!11944 (_ BitVec 64)) Bool)

(assert (=> b!608433 (= res!391111 (contains!3020 Nil!11941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608434 () Bool)

(declare-fun e!348448 () Unit!19438)

(declare-fun Unit!19440 () Unit!19438)

(assert (=> b!608434 (= e!348448 Unit!19440)))

(declare-fun b!608435 () Bool)

(declare-fun lt!277960 () SeekEntryResult!6343)

(assert (=> b!608435 (= e!348445 (= lt!277960 lt!277952))))

(declare-fun b!608436 () Bool)

(declare-fun res!391123 () Bool)

(assert (=> b!608436 (=> res!391123 e!348438)))

(assert (=> b!608436 (= res!391123 (contains!3020 Nil!11941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608437 () Bool)

(declare-fun res!391109 () Bool)

(declare-fun e!348443 () Bool)

(assert (=> b!608437 (=> (not res!391109) (not e!348443))))

(assert (=> b!608437 (= res!391109 (and (= (size!18267 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18267 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18267 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608438 () Bool)

(declare-fun res!391110 () Bool)

(assert (=> b!608438 (=> (not res!391110) (not e!348439))))

(assert (=> b!608438 (= res!391110 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17903 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608439 () Bool)

(declare-fun res!391113 () Bool)

(assert (=> b!608439 (=> (not res!391113) (not e!348443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608439 (= res!391113 (validKeyInArray!0 (select (arr!17903 a!2986) j!136)))))

(declare-fun b!608441 () Bool)

(declare-fun Unit!19441 () Unit!19438)

(assert (=> b!608441 (= e!348447 Unit!19441)))

(declare-fun b!608442 () Bool)

(declare-fun res!391121 () Bool)

(assert (=> b!608442 (=> (not res!391121) (not e!348443))))

(assert (=> b!608442 (= res!391121 (validKeyInArray!0 k!1786))))

(declare-fun b!608443 () Bool)

(declare-fun res!391108 () Bool)

(assert (=> b!608443 (=> (not res!391108) (not e!348443))))

(assert (=> b!608443 (= res!391108 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608444 () Bool)

(declare-fun e!348449 () Bool)

(declare-fun e!348450 () Bool)

(assert (=> b!608444 (= e!348449 e!348450)))

(declare-fun res!391118 () Bool)

(assert (=> b!608444 (=> res!391118 e!348450)))

(declare-fun lt!277961 () (_ BitVec 64))

(assert (=> b!608444 (= res!391118 (or (not (= (select (arr!17903 a!2986) j!136) lt!277949)) (not (= (select (arr!17903 a!2986) j!136) lt!277961)) (bvsge j!136 index!984)))))

(declare-fun b!608445 () Bool)

(assert (=> b!608445 (= e!348443 e!348439)))

(declare-fun res!391103 () Bool)

(assert (=> b!608445 (=> (not res!391103) (not e!348439))))

(declare-fun lt!277953 () SeekEntryResult!6343)

(assert (=> b!608445 (= res!391103 (or (= lt!277953 (MissingZero!6343 i!1108)) (= lt!277953 (MissingVacant!6343 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37305 (_ BitVec 32)) SeekEntryResult!6343)

(assert (=> b!608445 (= lt!277953 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608446 () Bool)

(declare-fun Unit!19442 () Unit!19438)

(assert (=> b!608446 (= e!348448 Unit!19442)))

(declare-fun lt!277948 () Unit!19438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19438)

(assert (=> b!608446 (= lt!277948 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277959 (select (arr!17903 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608446 (arrayContainsKey!0 lt!277959 (select (arr!17903 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277947 () Unit!19438)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11944) Unit!19438)

(assert (=> b!608446 (= lt!277947 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11941))))

(declare-fun arrayNoDuplicates!0 (array!37305 (_ BitVec 32) List!11944) Bool)

(assert (=> b!608446 (arrayNoDuplicates!0 lt!277959 #b00000000000000000000000000000000 Nil!11941)))

(declare-fun lt!277956 () Unit!19438)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37305 (_ BitVec 32) (_ BitVec 32)) Unit!19438)

(assert (=> b!608446 (= lt!277956 (lemmaNoDuplicateFromThenFromBigger!0 lt!277959 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608446 (arrayNoDuplicates!0 lt!277959 j!136 Nil!11941)))

(declare-fun lt!277955 () Unit!19438)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37305 (_ BitVec 64) (_ BitVec 32) List!11944) Unit!19438)

(assert (=> b!608446 (= lt!277955 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277959 (select (arr!17903 a!2986) j!136) j!136 Nil!11941))))

(assert (=> b!608446 false))

(declare-fun b!608447 () Bool)

(declare-fun res!391117 () Bool)

(assert (=> b!608447 (=> res!391117 e!348438)))

(declare-fun noDuplicate!326 (List!11944) Bool)

(assert (=> b!608447 (= res!391117 (not (noDuplicate!326 Nil!11941)))))

(declare-fun b!608448 () Bool)

(declare-fun res!391116 () Bool)

(assert (=> b!608448 (=> (not res!391116) (not e!348439))))

(assert (=> b!608448 (= res!391116 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11941))))

(declare-fun b!608449 () Bool)

(declare-fun Unit!19443 () Unit!19438)

(assert (=> b!608449 (= e!348447 Unit!19443)))

(assert (=> b!608449 false))

(declare-fun b!608450 () Bool)

(declare-fun e!348444 () Bool)

(declare-fun e!348452 () Bool)

(assert (=> b!608450 (= e!348444 e!348452)))

(declare-fun res!391115 () Bool)

(assert (=> b!608450 (=> res!391115 e!348452)))

(assert (=> b!608450 (= res!391115 (bvsge index!984 j!136))))

(declare-fun lt!277962 () Unit!19438)

(assert (=> b!608450 (= lt!277962 e!348448)))

(declare-fun c!69032 () Bool)

(assert (=> b!608450 (= c!69032 (bvslt j!136 index!984))))

(declare-fun b!608451 () Bool)

(assert (=> b!608451 (= e!348442 e!348444)))

(declare-fun res!391112 () Bool)

(assert (=> b!608451 (=> res!391112 e!348444)))

(assert (=> b!608451 (= res!391112 (or (not (= (select (arr!17903 a!2986) j!136) lt!277949)) (not (= (select (arr!17903 a!2986) j!136) lt!277961))))))

(assert (=> b!608451 e!348449))

(declare-fun res!391120 () Bool)

(assert (=> b!608451 (=> (not res!391120) (not e!348449))))

(assert (=> b!608451 (= res!391120 (= lt!277961 (select (arr!17903 a!2986) j!136)))))

(assert (=> b!608451 (= lt!277961 (select (store (arr!17903 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608452 () Bool)

(declare-fun e!348451 () Bool)

(assert (=> b!608452 (= e!348450 e!348451)))

(declare-fun res!391124 () Bool)

(assert (=> b!608452 (=> (not res!391124) (not e!348451))))

(assert (=> b!608452 (= res!391124 (arrayContainsKey!0 lt!277959 (select (arr!17903 a!2986) j!136) j!136))))

(declare-fun b!608453 () Bool)

(declare-fun res!391105 () Bool)

(assert (=> b!608453 (=> (not res!391105) (not e!348439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37305 (_ BitVec 32)) Bool)

(assert (=> b!608453 (= res!391105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608454 () Bool)

(assert (=> b!608454 (= e!348451 (arrayContainsKey!0 lt!277959 (select (arr!17903 a!2986) j!136) index!984))))

(declare-fun b!608455 () Bool)

(assert (=> b!608455 (= e!348440 e!348441)))

(declare-fun res!391114 () Bool)

(assert (=> b!608455 (=> (not res!391114) (not e!348441))))

(assert (=> b!608455 (= res!391114 (and (= lt!277960 (Found!6343 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17903 a!2986) index!984) (select (arr!17903 a!2986) j!136))) (not (= (select (arr!17903 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608455 (= lt!277960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17903 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608456 () Bool)

(assert (=> b!608456 (= e!348452 e!348438)))

(declare-fun res!391122 () Bool)

(assert (=> b!608456 (=> res!391122 e!348438)))

(assert (=> b!608456 (= res!391122 (or (bvsge (size!18267 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18267 a!2986))))))

(assert (=> b!608456 (arrayContainsKey!0 lt!277959 (select (arr!17903 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277950 () Unit!19438)

(assert (=> b!608456 (= lt!277950 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277959 (select (arr!17903 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608456 e!348453))

(declare-fun res!391119 () Bool)

(assert (=> b!608456 (=> (not res!391119) (not e!348453))))

(assert (=> b!608456 (= res!391119 (arrayContainsKey!0 lt!277959 (select (arr!17903 a!2986) j!136) j!136))))

(declare-fun res!391106 () Bool)

(assert (=> start!55574 (=> (not res!391106) (not e!348443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55574 (= res!391106 (validMask!0 mask!3053))))

(assert (=> start!55574 e!348443))

(assert (=> start!55574 true))

(declare-fun array_inv!13699 (array!37305) Bool)

(assert (=> start!55574 (array_inv!13699 a!2986)))

(declare-fun b!608440 () Bool)

(assert (=> b!608440 (= e!348438 true)))

(declare-fun lt!277954 () Bool)

(assert (=> b!608440 (= lt!277954 (contains!3020 Nil!11941 k!1786))))

(assert (= (and start!55574 res!391106) b!608437))

(assert (= (and b!608437 res!391109) b!608439))

(assert (= (and b!608439 res!391113) b!608442))

(assert (= (and b!608442 res!391121) b!608443))

(assert (= (and b!608443 res!391108) b!608445))

(assert (= (and b!608445 res!391103) b!608453))

(assert (= (and b!608453 res!391105) b!608448))

(assert (= (and b!608448 res!391116) b!608438))

(assert (= (and b!608438 res!391110) b!608432))

(assert (= (and b!608432 res!391107) b!608455))

(assert (= (and b!608455 res!391114) b!608431))

(assert (= (and b!608431 res!391104) b!608435))

(assert (= (and b!608431 c!69031) b!608449))

(assert (= (and b!608431 (not c!69031)) b!608441))

(assert (= (and b!608431 (not res!391102)) b!608451))

(assert (= (and b!608451 res!391120) b!608444))

(assert (= (and b!608444 (not res!391118)) b!608452))

(assert (= (and b!608452 res!391124) b!608454))

(assert (= (and b!608451 (not res!391112)) b!608450))

(assert (= (and b!608450 c!69032) b!608446))

(assert (= (and b!608450 (not c!69032)) b!608434))

(assert (= (and b!608450 (not res!391115)) b!608456))

(assert (= (and b!608456 res!391119) b!608430))

(assert (= (and b!608456 (not res!391122)) b!608447))

(assert (= (and b!608447 (not res!391117)) b!608433))

(assert (= (and b!608433 (not res!391111)) b!608436))

(assert (= (and b!608436 (not res!391123)) b!608440))

(declare-fun m!585059 () Bool)

(assert (=> b!608439 m!585059))

(assert (=> b!608439 m!585059))

(declare-fun m!585061 () Bool)

(assert (=> b!608439 m!585061))

(assert (=> b!608451 m!585059))

(declare-fun m!585063 () Bool)

(assert (=> b!608451 m!585063))

(declare-fun m!585065 () Bool)

(assert (=> b!608451 m!585065))

(declare-fun m!585067 () Bool)

(assert (=> b!608446 m!585067))

(assert (=> b!608446 m!585059))

(declare-fun m!585069 () Bool)

(assert (=> b!608446 m!585069))

(assert (=> b!608446 m!585059))

(declare-fun m!585071 () Bool)

(assert (=> b!608446 m!585071))

(assert (=> b!608446 m!585059))

(declare-fun m!585073 () Bool)

(assert (=> b!608446 m!585073))

(declare-fun m!585075 () Bool)

(assert (=> b!608446 m!585075))

(declare-fun m!585077 () Bool)

(assert (=> b!608446 m!585077))

(assert (=> b!608446 m!585059))

(declare-fun m!585079 () Bool)

(assert (=> b!608446 m!585079))

(declare-fun m!585081 () Bool)

(assert (=> b!608445 m!585081))

(assert (=> b!608444 m!585059))

(declare-fun m!585083 () Bool)

(assert (=> b!608440 m!585083))

(declare-fun m!585085 () Bool)

(assert (=> b!608443 m!585085))

(declare-fun m!585087 () Bool)

(assert (=> b!608453 m!585087))

(declare-fun m!585089 () Bool)

(assert (=> b!608447 m!585089))

(declare-fun m!585091 () Bool)

(assert (=> b!608448 m!585091))

(assert (=> b!608452 m!585059))

(assert (=> b!608452 m!585059))

(declare-fun m!585093 () Bool)

(assert (=> b!608452 m!585093))

(declare-fun m!585095 () Bool)

(assert (=> b!608455 m!585095))

(assert (=> b!608455 m!585059))

(assert (=> b!608455 m!585059))

(declare-fun m!585097 () Bool)

(assert (=> b!608455 m!585097))

(declare-fun m!585099 () Bool)

(assert (=> b!608438 m!585099))

(assert (=> b!608456 m!585059))

(assert (=> b!608456 m!585059))

(declare-fun m!585101 () Bool)

(assert (=> b!608456 m!585101))

(assert (=> b!608456 m!585059))

(declare-fun m!585103 () Bool)

(assert (=> b!608456 m!585103))

(assert (=> b!608456 m!585059))

(assert (=> b!608456 m!585093))

(declare-fun m!585105 () Bool)

(assert (=> b!608431 m!585105))

(declare-fun m!585107 () Bool)

(assert (=> b!608431 m!585107))

(assert (=> b!608431 m!585059))

(assert (=> b!608431 m!585059))

(declare-fun m!585109 () Bool)

(assert (=> b!608431 m!585109))

(declare-fun m!585111 () Bool)

(assert (=> b!608431 m!585111))

(assert (=> b!608431 m!585063))

(declare-fun m!585113 () Bool)

(assert (=> b!608431 m!585113))

(declare-fun m!585115 () Bool)

(assert (=> b!608431 m!585115))

(assert (=> b!608430 m!585059))

(assert (=> b!608430 m!585059))

(declare-fun m!585117 () Bool)

(assert (=> b!608430 m!585117))

(declare-fun m!585119 () Bool)

(assert (=> b!608433 m!585119))

(assert (=> b!608454 m!585059))

(assert (=> b!608454 m!585059))

(assert (=> b!608454 m!585117))

(declare-fun m!585121 () Bool)

(assert (=> b!608436 m!585121))

(declare-fun m!585123 () Bool)

(assert (=> start!55574 m!585123))

(declare-fun m!585125 () Bool)

(assert (=> start!55574 m!585125))

(assert (=> b!608432 m!585063))

(declare-fun m!585127 () Bool)

(assert (=> b!608432 m!585127))

(declare-fun m!585129 () Bool)

(assert (=> b!608442 m!585129))

(push 1)

