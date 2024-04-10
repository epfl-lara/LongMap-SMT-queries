; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54908 () Bool)

(assert start!54908)

(declare-fun b!601233 () Bool)

(declare-fun e!343777 () Bool)

(declare-fun e!343771 () Bool)

(assert (=> b!601233 (= e!343777 (not e!343771))))

(declare-fun res!386045 () Bool)

(assert (=> b!601233 (=> res!386045 e!343771)))

(declare-datatypes ((SeekEntryResult!6271 0))(
  ( (MissingZero!6271 (index!27341 (_ BitVec 32))) (Found!6271 (index!27342 (_ BitVec 32))) (Intermediate!6271 (undefined!7083 Bool) (index!27343 (_ BitVec 32)) (x!56134 (_ BitVec 32))) (Undefined!6271) (MissingVacant!6271 (index!27344 (_ BitVec 32))) )
))
(declare-fun lt!273651 () SeekEntryResult!6271)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601233 (= res!386045 (not (= lt!273651 (Found!6271 index!984))))))

(declare-datatypes ((Unit!19006 0))(
  ( (Unit!19007) )
))
(declare-fun lt!273663 () Unit!19006)

(declare-fun e!343778 () Unit!19006)

(assert (=> b!601233 (= lt!273663 e!343778)))

(declare-fun c!67970 () Bool)

(assert (=> b!601233 (= c!67970 (= lt!273651 Undefined!6271))))

(declare-datatypes ((array!37143 0))(
  ( (array!37144 (arr!17831 (Array (_ BitVec 32) (_ BitVec 64))) (size!18195 (_ BitVec 32))) )
))
(declare-fun lt!273659 () array!37143)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!273664 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37143 (_ BitVec 32)) SeekEntryResult!6271)

(assert (=> b!601233 (= lt!273651 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273664 lt!273659 mask!3053))))

(declare-fun e!343770 () Bool)

(assert (=> b!601233 e!343770))

(declare-fun res!386042 () Bool)

(assert (=> b!601233 (=> (not res!386042) (not e!343770))))

(declare-fun lt!273660 () SeekEntryResult!6271)

(declare-fun lt!273662 () (_ BitVec 32))

(assert (=> b!601233 (= res!386042 (= lt!273660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273662 vacantSpotIndex!68 lt!273664 lt!273659 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37143)

(assert (=> b!601233 (= lt!273660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273662 vacantSpotIndex!68 (select (arr!17831 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!601233 (= lt!273664 (select (store (arr!17831 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273655 () Unit!19006)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19006)

(assert (=> b!601233 (= lt!273655 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273662 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601233 (= lt!273662 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601234 () Bool)

(declare-fun e!343772 () Unit!19006)

(declare-fun Unit!19008 () Unit!19006)

(assert (=> b!601234 (= e!343772 Unit!19008)))

(declare-fun lt!273658 () Unit!19006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19006)

(assert (=> b!601234 (= lt!273658 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273659 (select (arr!17831 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601234 (arrayContainsKey!0 lt!273659 (select (arr!17831 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273650 () Unit!19006)

(declare-datatypes ((List!11872 0))(
  ( (Nil!11869) (Cons!11868 (h!12913 (_ BitVec 64)) (t!18100 List!11872)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11872) Unit!19006)

(assert (=> b!601234 (= lt!273650 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11869))))

(declare-fun arrayNoDuplicates!0 (array!37143 (_ BitVec 32) List!11872) Bool)

(assert (=> b!601234 (arrayNoDuplicates!0 lt!273659 #b00000000000000000000000000000000 Nil!11869)))

(declare-fun lt!273657 () Unit!19006)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37143 (_ BitVec 32) (_ BitVec 32)) Unit!19006)

(assert (=> b!601234 (= lt!273657 (lemmaNoDuplicateFromThenFromBigger!0 lt!273659 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601234 (arrayNoDuplicates!0 lt!273659 j!136 Nil!11869)))

(declare-fun lt!273654 () Unit!19006)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37143 (_ BitVec 64) (_ BitVec 32) List!11872) Unit!19006)

(assert (=> b!601234 (= lt!273654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273659 (select (arr!17831 a!2986) j!136) j!136 Nil!11869))))

(assert (=> b!601234 false))

(declare-fun b!601235 () Bool)

(declare-fun res!386043 () Bool)

(declare-fun e!343768 () Bool)

(assert (=> b!601235 (=> (not res!386043) (not e!343768))))

(assert (=> b!601235 (= res!386043 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11869))))

(declare-fun b!601236 () Bool)

(declare-fun e!343779 () Bool)

(declare-fun e!343775 () Bool)

(assert (=> b!601236 (= e!343779 e!343775)))

(declare-fun res!386036 () Bool)

(assert (=> b!601236 (=> (not res!386036) (not e!343775))))

(assert (=> b!601236 (= res!386036 (arrayContainsKey!0 lt!273659 (select (arr!17831 a!2986) j!136) j!136))))

(declare-fun b!601237 () Bool)

(declare-fun e!343773 () Bool)

(assert (=> b!601237 (= e!343773 e!343779)))

(declare-fun res!386029 () Bool)

(assert (=> b!601237 (=> res!386029 e!343779)))

(declare-fun lt!273656 () (_ BitVec 64))

(assert (=> b!601237 (= res!386029 (or (not (= (select (arr!17831 a!2986) j!136) lt!273664)) (not (= (select (arr!17831 a!2986) j!136) lt!273656)) (bvsge j!136 index!984)))))

(declare-fun b!601238 () Bool)

(declare-fun res!386034 () Bool)

(assert (=> b!601238 (=> (not res!386034) (not e!343768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37143 (_ BitVec 32)) Bool)

(assert (=> b!601238 (= res!386034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601239 () Bool)

(declare-fun e!343767 () Bool)

(assert (=> b!601239 (= e!343767 true)))

(declare-fun lt!273661 () Unit!19006)

(assert (=> b!601239 (= lt!273661 e!343772)))

(declare-fun c!67969 () Bool)

(assert (=> b!601239 (= c!67969 (bvslt j!136 index!984))))

(declare-fun b!601240 () Bool)

(declare-fun Unit!19009 () Unit!19006)

(assert (=> b!601240 (= e!343778 Unit!19009)))

(assert (=> b!601240 false))

(declare-fun b!601241 () Bool)

(assert (=> b!601241 (= e!343775 (arrayContainsKey!0 lt!273659 (select (arr!17831 a!2986) j!136) index!984))))

(declare-fun b!601242 () Bool)

(declare-fun res!386037 () Bool)

(declare-fun e!343774 () Bool)

(assert (=> b!601242 (=> (not res!386037) (not e!343774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601242 (= res!386037 (validKeyInArray!0 (select (arr!17831 a!2986) j!136)))))

(declare-fun b!601243 () Bool)

(declare-fun Unit!19010 () Unit!19006)

(assert (=> b!601243 (= e!343772 Unit!19010)))

(declare-fun b!601244 () Bool)

(declare-fun e!343769 () Bool)

(assert (=> b!601244 (= e!343768 e!343769)))

(declare-fun res!386033 () Bool)

(assert (=> b!601244 (=> (not res!386033) (not e!343769))))

(assert (=> b!601244 (= res!386033 (= (select (store (arr!17831 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601244 (= lt!273659 (array!37144 (store (arr!17831 a!2986) i!1108 k!1786) (size!18195 a!2986)))))

(declare-fun res!386035 () Bool)

(assert (=> start!54908 (=> (not res!386035) (not e!343774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54908 (= res!386035 (validMask!0 mask!3053))))

(assert (=> start!54908 e!343774))

(assert (=> start!54908 true))

(declare-fun array_inv!13627 (array!37143) Bool)

(assert (=> start!54908 (array_inv!13627 a!2986)))

(declare-fun b!601245 () Bool)

(declare-fun res!386030 () Bool)

(assert (=> b!601245 (=> (not res!386030) (not e!343774))))

(assert (=> b!601245 (= res!386030 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601246 () Bool)

(assert (=> b!601246 (= e!343774 e!343768)))

(declare-fun res!386031 () Bool)

(assert (=> b!601246 (=> (not res!386031) (not e!343768))))

(declare-fun lt!273652 () SeekEntryResult!6271)

(assert (=> b!601246 (= res!386031 (or (= lt!273652 (MissingZero!6271 i!1108)) (= lt!273652 (MissingVacant!6271 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37143 (_ BitVec 32)) SeekEntryResult!6271)

(assert (=> b!601246 (= lt!273652 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601247 () Bool)

(assert (=> b!601247 (= e!343769 e!343777)))

(declare-fun res!386041 () Bool)

(assert (=> b!601247 (=> (not res!386041) (not e!343777))))

(declare-fun lt!273653 () SeekEntryResult!6271)

(assert (=> b!601247 (= res!386041 (and (= lt!273653 (Found!6271 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17831 a!2986) index!984) (select (arr!17831 a!2986) j!136))) (not (= (select (arr!17831 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601247 (= lt!273653 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17831 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601248 () Bool)

(assert (=> b!601248 (= e!343771 e!343767)))

(declare-fun res!386032 () Bool)

(assert (=> b!601248 (=> res!386032 e!343767)))

(assert (=> b!601248 (= res!386032 (or (not (= (select (arr!17831 a!2986) j!136) lt!273664)) (not (= (select (arr!17831 a!2986) j!136) lt!273656))))))

(assert (=> b!601248 e!343773))

(declare-fun res!386038 () Bool)

(assert (=> b!601248 (=> (not res!386038) (not e!343773))))

(assert (=> b!601248 (= res!386038 (= lt!273656 (select (arr!17831 a!2986) j!136)))))

(assert (=> b!601248 (= lt!273656 (select (store (arr!17831 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!601249 () Bool)

(declare-fun Unit!19011 () Unit!19006)

(assert (=> b!601249 (= e!343778 Unit!19011)))

(declare-fun b!601250 () Bool)

(declare-fun res!386044 () Bool)

(assert (=> b!601250 (=> (not res!386044) (not e!343774))))

(assert (=> b!601250 (= res!386044 (and (= (size!18195 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18195 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18195 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601251 () Bool)

(assert (=> b!601251 (= e!343770 (= lt!273653 lt!273660))))

(declare-fun b!601252 () Bool)

(declare-fun res!386040 () Bool)

(assert (=> b!601252 (=> (not res!386040) (not e!343768))))

(assert (=> b!601252 (= res!386040 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17831 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601253 () Bool)

(declare-fun res!386039 () Bool)

(assert (=> b!601253 (=> (not res!386039) (not e!343774))))

(assert (=> b!601253 (= res!386039 (validKeyInArray!0 k!1786))))

(assert (= (and start!54908 res!386035) b!601250))

(assert (= (and b!601250 res!386044) b!601242))

(assert (= (and b!601242 res!386037) b!601253))

(assert (= (and b!601253 res!386039) b!601245))

(assert (= (and b!601245 res!386030) b!601246))

(assert (= (and b!601246 res!386031) b!601238))

(assert (= (and b!601238 res!386034) b!601235))

(assert (= (and b!601235 res!386043) b!601252))

(assert (= (and b!601252 res!386040) b!601244))

(assert (= (and b!601244 res!386033) b!601247))

(assert (= (and b!601247 res!386041) b!601233))

(assert (= (and b!601233 res!386042) b!601251))

(assert (= (and b!601233 c!67970) b!601240))

(assert (= (and b!601233 (not c!67970)) b!601249))

(assert (= (and b!601233 (not res!386045)) b!601248))

(assert (= (and b!601248 res!386038) b!601237))

(assert (= (and b!601237 (not res!386029)) b!601236))

(assert (= (and b!601236 res!386036) b!601241))

(assert (= (and b!601248 (not res!386032)) b!601239))

(assert (= (and b!601239 c!67969) b!601234))

(assert (= (and b!601239 (not c!67969)) b!601243))

(declare-fun m!578429 () Bool)

(assert (=> b!601252 m!578429))

(declare-fun m!578431 () Bool)

(assert (=> b!601238 m!578431))

(declare-fun m!578433 () Bool)

(assert (=> b!601253 m!578433))

(declare-fun m!578435 () Bool)

(assert (=> b!601248 m!578435))

(declare-fun m!578437 () Bool)

(assert (=> b!601248 m!578437))

(declare-fun m!578439 () Bool)

(assert (=> b!601248 m!578439))

(declare-fun m!578441 () Bool)

(assert (=> b!601246 m!578441))

(declare-fun m!578443 () Bool)

(assert (=> b!601245 m!578443))

(assert (=> b!601236 m!578435))

(assert (=> b!601236 m!578435))

(declare-fun m!578445 () Bool)

(assert (=> b!601236 m!578445))

(assert (=> b!601233 m!578435))

(declare-fun m!578447 () Bool)

(assert (=> b!601233 m!578447))

(declare-fun m!578449 () Bool)

(assert (=> b!601233 m!578449))

(assert (=> b!601233 m!578435))

(assert (=> b!601233 m!578437))

(declare-fun m!578451 () Bool)

(assert (=> b!601233 m!578451))

(declare-fun m!578453 () Bool)

(assert (=> b!601233 m!578453))

(declare-fun m!578455 () Bool)

(assert (=> b!601233 m!578455))

(declare-fun m!578457 () Bool)

(assert (=> b!601233 m!578457))

(declare-fun m!578459 () Bool)

(assert (=> b!601247 m!578459))

(assert (=> b!601247 m!578435))

(assert (=> b!601247 m!578435))

(declare-fun m!578461 () Bool)

(assert (=> b!601247 m!578461))

(assert (=> b!601241 m!578435))

(assert (=> b!601241 m!578435))

(declare-fun m!578463 () Bool)

(assert (=> b!601241 m!578463))

(assert (=> b!601242 m!578435))

(assert (=> b!601242 m!578435))

(declare-fun m!578465 () Bool)

(assert (=> b!601242 m!578465))

(assert (=> b!601244 m!578437))

(declare-fun m!578467 () Bool)

(assert (=> b!601244 m!578467))

(declare-fun m!578469 () Bool)

(assert (=> start!54908 m!578469))

(declare-fun m!578471 () Bool)

(assert (=> start!54908 m!578471))

(assert (=> b!601237 m!578435))

(assert (=> b!601234 m!578435))

(assert (=> b!601234 m!578435))

(declare-fun m!578473 () Bool)

(assert (=> b!601234 m!578473))

(declare-fun m!578475 () Bool)

(assert (=> b!601234 m!578475))

(assert (=> b!601234 m!578435))

(declare-fun m!578477 () Bool)

(assert (=> b!601234 m!578477))

(assert (=> b!601234 m!578435))

(declare-fun m!578479 () Bool)

(assert (=> b!601234 m!578479))

(declare-fun m!578481 () Bool)

(assert (=> b!601234 m!578481))

(declare-fun m!578483 () Bool)

(assert (=> b!601234 m!578483))

(declare-fun m!578485 () Bool)

(assert (=> b!601234 m!578485))

(declare-fun m!578487 () Bool)

(assert (=> b!601235 m!578487))

(push 1)

