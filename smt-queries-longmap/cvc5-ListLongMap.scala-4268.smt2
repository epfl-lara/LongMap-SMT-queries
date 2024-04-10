; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59348 () Bool)

(assert start!59348)

(declare-fun b!655101 () Bool)

(declare-datatypes ((Unit!22494 0))(
  ( (Unit!22495) )
))
(declare-fun e!376218 () Unit!22494)

(declare-fun Unit!22496 () Unit!22494)

(assert (=> b!655101 (= e!376218 Unit!22496)))

(assert (=> b!655101 false))

(declare-fun b!655102 () Bool)

(assert (=> b!655102 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38668 0))(
  ( (array!38669 (arr!18534 (Array (_ BitVec 32) (_ BitVec 64))) (size!18898 (_ BitVec 32))) )
))
(declare-fun lt!305418 () array!38668)

(declare-fun lt!305413 () Unit!22494)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38668)

(declare-datatypes ((List!12575 0))(
  ( (Nil!12572) (Cons!12571 (h!13616 (_ BitVec 64)) (t!18803 List!12575)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38668 (_ BitVec 64) (_ BitVec 32) List!12575) Unit!22494)

(assert (=> b!655102 (= lt!305413 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305418 (select (arr!18534 a!2986) j!136) index!984 Nil!12572))))

(declare-fun arrayNoDuplicates!0 (array!38668 (_ BitVec 32) List!12575) Bool)

(assert (=> b!655102 (arrayNoDuplicates!0 lt!305418 index!984 Nil!12572)))

(declare-fun lt!305409 () Unit!22494)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38668 (_ BitVec 32) (_ BitVec 32)) Unit!22494)

(assert (=> b!655102 (= lt!305409 (lemmaNoDuplicateFromThenFromBigger!0 lt!305418 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655102 (arrayNoDuplicates!0 lt!305418 #b00000000000000000000000000000000 Nil!12572)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!305406 () Unit!22494)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12575) Unit!22494)

(assert (=> b!655102 (= lt!305406 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12572))))

(declare-fun arrayContainsKey!0 (array!38668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655102 (arrayContainsKey!0 lt!305418 (select (arr!18534 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305403 () Unit!22494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22494)

(assert (=> b!655102 (= lt!305403 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305418 (select (arr!18534 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376215 () Bool)

(assert (=> b!655102 e!376215))

(declare-fun res!424960 () Bool)

(assert (=> b!655102 (=> (not res!424960) (not e!376215))))

(assert (=> b!655102 (= res!424960 (arrayContainsKey!0 lt!305418 (select (arr!18534 a!2986) j!136) j!136))))

(declare-fun e!376213 () Unit!22494)

(declare-fun Unit!22497 () Unit!22494)

(assert (=> b!655102 (= e!376213 Unit!22497)))

(declare-fun b!655103 () Bool)

(declare-fun res!424950 () Bool)

(declare-fun e!376217 () Bool)

(assert (=> b!655103 (=> (not res!424950) (not e!376217))))

(assert (=> b!655103 (= res!424950 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655104 () Bool)

(declare-fun res!424949 () Bool)

(assert (=> b!655104 (= res!424949 (arrayContainsKey!0 lt!305418 (select (arr!18534 a!2986) j!136) j!136))))

(declare-fun e!376220 () Bool)

(assert (=> b!655104 (=> (not res!424949) (not e!376220))))

(declare-fun e!376211 () Bool)

(assert (=> b!655104 (= e!376211 e!376220)))

(declare-fun b!655105 () Bool)

(declare-fun e!376212 () Unit!22494)

(declare-fun Unit!22498 () Unit!22494)

(assert (=> b!655105 (= e!376212 Unit!22498)))

(declare-fun b!655106 () Bool)

(declare-fun e!376224 () Bool)

(assert (=> b!655106 (= e!376224 (not true))))

(declare-fun lt!305405 () Unit!22494)

(assert (=> b!655106 (= lt!305405 e!376212)))

(declare-fun c!75443 () Bool)

(declare-datatypes ((SeekEntryResult!6974 0))(
  ( (MissingZero!6974 (index!30255 (_ BitVec 32))) (Found!6974 (index!30256 (_ BitVec 32))) (Intermediate!6974 (undefined!7786 Bool) (index!30257 (_ BitVec 32)) (x!59047 (_ BitVec 32))) (Undefined!6974) (MissingVacant!6974 (index!30258 (_ BitVec 32))) )
))
(declare-fun lt!305420 () SeekEntryResult!6974)

(assert (=> b!655106 (= c!75443 (= lt!305420 (Found!6974 index!984)))))

(declare-fun lt!305422 () Unit!22494)

(assert (=> b!655106 (= lt!305422 e!376218)))

(declare-fun c!75445 () Bool)

(assert (=> b!655106 (= c!75445 (= lt!305420 Undefined!6974))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!305419 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38668 (_ BitVec 32)) SeekEntryResult!6974)

(assert (=> b!655106 (= lt!305420 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305419 lt!305418 mask!3053))))

(declare-fun e!376223 () Bool)

(assert (=> b!655106 e!376223))

(declare-fun res!424961 () Bool)

(assert (=> b!655106 (=> (not res!424961) (not e!376223))))

(declare-fun lt!305410 () (_ BitVec 32))

(declare-fun lt!305414 () SeekEntryResult!6974)

(assert (=> b!655106 (= res!424961 (= lt!305414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305410 vacantSpotIndex!68 lt!305419 lt!305418 mask!3053)))))

(assert (=> b!655106 (= lt!305414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305410 vacantSpotIndex!68 (select (arr!18534 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655106 (= lt!305419 (select (store (arr!18534 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305415 () Unit!22494)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38668 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22494)

(assert (=> b!655106 (= lt!305415 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305410 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655106 (= lt!305410 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655107 () Bool)

(declare-fun Unit!22499 () Unit!22494)

(assert (=> b!655107 (= e!376218 Unit!22499)))

(declare-fun b!655108 () Bool)

(declare-fun res!424951 () Bool)

(declare-fun e!376216 () Bool)

(assert (=> b!655108 (=> (not res!424951) (not e!376216))))

(assert (=> b!655108 (= res!424951 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12572))))

(declare-fun b!655109 () Bool)

(declare-fun res!424953 () Bool)

(assert (=> b!655109 (= res!424953 (bvsge j!136 index!984))))

(assert (=> b!655109 (=> res!424953 e!376211)))

(declare-fun e!376221 () Bool)

(assert (=> b!655109 (= e!376221 e!376211)))

(declare-fun b!655110 () Bool)

(declare-fun res!424959 () Bool)

(assert (=> b!655110 (=> (not res!424959) (not e!376217))))

(assert (=> b!655110 (= res!424959 (and (= (size!18898 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18898 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18898 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655111 () Bool)

(declare-fun e!376214 () Bool)

(assert (=> b!655111 (= e!376214 e!376224)))

(declare-fun res!424963 () Bool)

(assert (=> b!655111 (=> (not res!424963) (not e!376224))))

(declare-fun lt!305412 () SeekEntryResult!6974)

(assert (=> b!655111 (= res!424963 (and (= lt!305412 (Found!6974 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18534 a!2986) index!984) (select (arr!18534 a!2986) j!136))) (not (= (select (arr!18534 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655111 (= lt!305412 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18534 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655112 () Bool)

(declare-fun res!424964 () Bool)

(assert (=> b!655112 (=> (not res!424964) (not e!376217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655112 (= res!424964 (validKeyInArray!0 (select (arr!18534 a!2986) j!136)))))

(declare-fun b!655113 () Bool)

(assert (=> b!655113 (= e!376217 e!376216)))

(declare-fun res!424955 () Bool)

(assert (=> b!655113 (=> (not res!424955) (not e!376216))))

(declare-fun lt!305408 () SeekEntryResult!6974)

(assert (=> b!655113 (= res!424955 (or (= lt!305408 (MissingZero!6974 i!1108)) (= lt!305408 (MissingVacant!6974 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38668 (_ BitVec 32)) SeekEntryResult!6974)

(assert (=> b!655113 (= lt!305408 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655114 () Bool)

(assert (=> b!655114 (= e!376216 e!376214)))

(declare-fun res!424952 () Bool)

(assert (=> b!655114 (=> (not res!424952) (not e!376214))))

(assert (=> b!655114 (= res!424952 (= (select (store (arr!18534 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655114 (= lt!305418 (array!38669 (store (arr!18534 a!2986) i!1108 k!1786) (size!18898 a!2986)))))

(declare-fun b!655115 () Bool)

(declare-fun Unit!22500 () Unit!22494)

(assert (=> b!655115 (= e!376213 Unit!22500)))

(declare-fun b!655116 () Bool)

(declare-fun e!376219 () Unit!22494)

(declare-fun Unit!22501 () Unit!22494)

(assert (=> b!655116 (= e!376219 Unit!22501)))

(declare-fun b!655117 () Bool)

(assert (=> b!655117 (= e!376223 (= lt!305412 lt!305414))))

(declare-fun b!655118 () Bool)

(assert (=> b!655118 (= e!376215 (arrayContainsKey!0 lt!305418 (select (arr!18534 a!2986) j!136) index!984))))

(declare-fun b!655119 () Bool)

(declare-fun Unit!22502 () Unit!22494)

(assert (=> b!655119 (= e!376212 Unit!22502)))

(declare-fun res!424962 () Bool)

(assert (=> b!655119 (= res!424962 (= (select (store (arr!18534 a!2986) i!1108 k!1786) index!984) (select (arr!18534 a!2986) j!136)))))

(assert (=> b!655119 (=> (not res!424962) (not e!376221))))

(assert (=> b!655119 e!376221))

(declare-fun c!75444 () Bool)

(assert (=> b!655119 (= c!75444 (bvslt j!136 index!984))))

(declare-fun lt!305421 () Unit!22494)

(assert (=> b!655119 (= lt!305421 e!376219)))

(declare-fun c!75446 () Bool)

(assert (=> b!655119 (= c!75446 (bvslt index!984 j!136))))

(declare-fun lt!305404 () Unit!22494)

(assert (=> b!655119 (= lt!305404 e!376213)))

(assert (=> b!655119 false))

(declare-fun b!655120 () Bool)

(declare-fun res!424958 () Bool)

(assert (=> b!655120 (=> (not res!424958) (not e!376216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38668 (_ BitVec 32)) Bool)

(assert (=> b!655120 (= res!424958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655121 () Bool)

(assert (=> b!655121 false))

(declare-fun lt!305407 () Unit!22494)

(assert (=> b!655121 (= lt!305407 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305418 (select (arr!18534 a!2986) j!136) j!136 Nil!12572))))

(assert (=> b!655121 (arrayNoDuplicates!0 lt!305418 j!136 Nil!12572)))

(declare-fun lt!305417 () Unit!22494)

(assert (=> b!655121 (= lt!305417 (lemmaNoDuplicateFromThenFromBigger!0 lt!305418 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655121 (arrayNoDuplicates!0 lt!305418 #b00000000000000000000000000000000 Nil!12572)))

(declare-fun lt!305411 () Unit!22494)

(assert (=> b!655121 (= lt!305411 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12572))))

(assert (=> b!655121 (arrayContainsKey!0 lt!305418 (select (arr!18534 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305416 () Unit!22494)

(assert (=> b!655121 (= lt!305416 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305418 (select (arr!18534 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22503 () Unit!22494)

(assert (=> b!655121 (= e!376219 Unit!22503)))

(declare-fun res!424954 () Bool)

(assert (=> start!59348 (=> (not res!424954) (not e!376217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59348 (= res!424954 (validMask!0 mask!3053))))

(assert (=> start!59348 e!376217))

(assert (=> start!59348 true))

(declare-fun array_inv!14330 (array!38668) Bool)

(assert (=> start!59348 (array_inv!14330 a!2986)))

(declare-fun b!655122 () Bool)

(declare-fun res!424957 () Bool)

(assert (=> b!655122 (=> (not res!424957) (not e!376217))))

(assert (=> b!655122 (= res!424957 (validKeyInArray!0 k!1786))))

(declare-fun b!655123 () Bool)

(declare-fun res!424956 () Bool)

(assert (=> b!655123 (=> (not res!424956) (not e!376216))))

(assert (=> b!655123 (= res!424956 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18534 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655124 () Bool)

(assert (=> b!655124 (= e!376220 (arrayContainsKey!0 lt!305418 (select (arr!18534 a!2986) j!136) index!984))))

(assert (= (and start!59348 res!424954) b!655110))

(assert (= (and b!655110 res!424959) b!655112))

(assert (= (and b!655112 res!424964) b!655122))

(assert (= (and b!655122 res!424957) b!655103))

(assert (= (and b!655103 res!424950) b!655113))

(assert (= (and b!655113 res!424955) b!655120))

(assert (= (and b!655120 res!424958) b!655108))

(assert (= (and b!655108 res!424951) b!655123))

(assert (= (and b!655123 res!424956) b!655114))

(assert (= (and b!655114 res!424952) b!655111))

(assert (= (and b!655111 res!424963) b!655106))

(assert (= (and b!655106 res!424961) b!655117))

(assert (= (and b!655106 c!75445) b!655101))

(assert (= (and b!655106 (not c!75445)) b!655107))

(assert (= (and b!655106 c!75443) b!655119))

(assert (= (and b!655106 (not c!75443)) b!655105))

(assert (= (and b!655119 res!424962) b!655109))

(assert (= (and b!655109 (not res!424953)) b!655104))

(assert (= (and b!655104 res!424949) b!655124))

(assert (= (and b!655119 c!75444) b!655121))

(assert (= (and b!655119 (not c!75444)) b!655116))

(assert (= (and b!655119 c!75446) b!655102))

(assert (= (and b!655119 (not c!75446)) b!655115))

(assert (= (and b!655102 res!424960) b!655118))

(declare-fun m!628187 () Bool)

(assert (=> start!59348 m!628187))

(declare-fun m!628189 () Bool)

(assert (=> start!59348 m!628189))

(declare-fun m!628191 () Bool)

(assert (=> b!655114 m!628191))

(declare-fun m!628193 () Bool)

(assert (=> b!655114 m!628193))

(declare-fun m!628195 () Bool)

(assert (=> b!655113 m!628195))

(declare-fun m!628197 () Bool)

(assert (=> b!655118 m!628197))

(assert (=> b!655118 m!628197))

(declare-fun m!628199 () Bool)

(assert (=> b!655118 m!628199))

(declare-fun m!628201 () Bool)

(assert (=> b!655108 m!628201))

(assert (=> b!655119 m!628191))

(declare-fun m!628203 () Bool)

(assert (=> b!655119 m!628203))

(assert (=> b!655119 m!628197))

(declare-fun m!628205 () Bool)

(assert (=> b!655106 m!628205))

(assert (=> b!655106 m!628197))

(assert (=> b!655106 m!628191))

(declare-fun m!628207 () Bool)

(assert (=> b!655106 m!628207))

(declare-fun m!628209 () Bool)

(assert (=> b!655106 m!628209))

(assert (=> b!655106 m!628197))

(declare-fun m!628211 () Bool)

(assert (=> b!655106 m!628211))

(declare-fun m!628213 () Bool)

(assert (=> b!655106 m!628213))

(declare-fun m!628215 () Bool)

(assert (=> b!655106 m!628215))

(assert (=> b!655102 m!628197))

(declare-fun m!628217 () Bool)

(assert (=> b!655102 m!628217))

(assert (=> b!655102 m!628197))

(declare-fun m!628219 () Bool)

(assert (=> b!655102 m!628219))

(assert (=> b!655102 m!628197))

(declare-fun m!628221 () Bool)

(assert (=> b!655102 m!628221))

(declare-fun m!628223 () Bool)

(assert (=> b!655102 m!628223))

(assert (=> b!655102 m!628197))

(declare-fun m!628225 () Bool)

(assert (=> b!655102 m!628225))

(declare-fun m!628227 () Bool)

(assert (=> b!655102 m!628227))

(assert (=> b!655102 m!628197))

(declare-fun m!628229 () Bool)

(assert (=> b!655102 m!628229))

(declare-fun m!628231 () Bool)

(assert (=> b!655102 m!628231))

(declare-fun m!628233 () Bool)

(assert (=> b!655111 m!628233))

(assert (=> b!655111 m!628197))

(assert (=> b!655111 m!628197))

(declare-fun m!628235 () Bool)

(assert (=> b!655111 m!628235))

(assert (=> b!655112 m!628197))

(assert (=> b!655112 m!628197))

(declare-fun m!628237 () Bool)

(assert (=> b!655112 m!628237))

(declare-fun m!628239 () Bool)

(assert (=> b!655120 m!628239))

(declare-fun m!628241 () Bool)

(assert (=> b!655103 m!628241))

(assert (=> b!655121 m!628197))

(declare-fun m!628243 () Bool)

(assert (=> b!655121 m!628243))

(assert (=> b!655121 m!628197))

(assert (=> b!655121 m!628197))

(declare-fun m!628245 () Bool)

(assert (=> b!655121 m!628245))

(assert (=> b!655121 m!628197))

(declare-fun m!628247 () Bool)

(assert (=> b!655121 m!628247))

(declare-fun m!628249 () Bool)

(assert (=> b!655121 m!628249))

(assert (=> b!655121 m!628231))

(declare-fun m!628251 () Bool)

(assert (=> b!655121 m!628251))

(assert (=> b!655121 m!628219))

(assert (=> b!655104 m!628197))

(assert (=> b!655104 m!628197))

(assert (=> b!655104 m!628229))

(assert (=> b!655124 m!628197))

(assert (=> b!655124 m!628197))

(assert (=> b!655124 m!628199))

(declare-fun m!628253 () Bool)

(assert (=> b!655122 m!628253))

(declare-fun m!628255 () Bool)

(assert (=> b!655123 m!628255))

(push 1)

