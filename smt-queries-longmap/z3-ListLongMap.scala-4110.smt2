; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56142 () Bool)

(assert start!56142)

(declare-fun res!400183 () Bool)

(declare-fun e!356125 () Bool)

(assert (=> start!56142 (=> (not res!400183) (not e!356125))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56142 (= res!400183 (validMask!0 mask!3053))))

(assert (=> start!56142 e!356125))

(assert (=> start!56142 true))

(declare-datatypes ((array!37626 0))(
  ( (array!37627 (arr!18059 (Array (_ BitVec 32) (_ BitVec 64))) (size!18424 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37626)

(declare-fun array_inv!13942 (array!37626) Bool)

(assert (=> start!56142 (array_inv!13942 a!2986)))

(declare-fun b!620930 () Bool)

(assert (=> b!620930 false))

(declare-fun lt!287136 () array!37626)

(declare-datatypes ((Unit!20706 0))(
  ( (Unit!20707) )
))
(declare-fun lt!287127 () Unit!20706)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((List!12139 0))(
  ( (Nil!12136) (Cons!12135 (h!13180 (_ BitVec 64)) (t!18358 List!12139)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37626 (_ BitVec 64) (_ BitVec 32) List!12139) Unit!20706)

(assert (=> b!620930 (= lt!287127 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287136 (select (arr!18059 a!2986) j!136) j!136 Nil!12136))))

(declare-fun arrayNoDuplicates!0 (array!37626 (_ BitVec 32) List!12139) Bool)

(assert (=> b!620930 (arrayNoDuplicates!0 lt!287136 j!136 Nil!12136)))

(declare-fun lt!287133 () Unit!20706)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37626 (_ BitVec 32) (_ BitVec 32)) Unit!20706)

(assert (=> b!620930 (= lt!287133 (lemmaNoDuplicateFromThenFromBigger!0 lt!287136 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620930 (arrayNoDuplicates!0 lt!287136 #b00000000000000000000000000000000 Nil!12136)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!287139 () Unit!20706)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12139) Unit!20706)

(assert (=> b!620930 (= lt!287139 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12136))))

(declare-fun arrayContainsKey!0 (array!37626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620930 (arrayContainsKey!0 lt!287136 (select (arr!18059 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287124 () Unit!20706)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20706)

(assert (=> b!620930 (= lt!287124 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287136 (select (arr!18059 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356127 () Unit!20706)

(declare-fun Unit!20708 () Unit!20706)

(assert (=> b!620930 (= e!356127 Unit!20708)))

(declare-fun b!620931 () Bool)

(declare-fun e!356130 () Bool)

(declare-fun e!356120 () Bool)

(assert (=> b!620931 (= e!356130 e!356120)))

(declare-fun res!400191 () Bool)

(assert (=> b!620931 (=> (not res!400191) (not e!356120))))

(declare-datatypes ((SeekEntryResult!6496 0))(
  ( (MissingZero!6496 (index!28268 (_ BitVec 32))) (Found!6496 (index!28269 (_ BitVec 32))) (Intermediate!6496 (undefined!7308 Bool) (index!28270 (_ BitVec 32)) (x!57051 (_ BitVec 32))) (Undefined!6496) (MissingVacant!6496 (index!28271 (_ BitVec 32))) )
))
(declare-fun lt!287126 () SeekEntryResult!6496)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620931 (= res!400191 (and (= lt!287126 (Found!6496 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18059 a!2986) index!984) (select (arr!18059 a!2986) j!136))) (not (= (select (arr!18059 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37626 (_ BitVec 32)) SeekEntryResult!6496)

(assert (=> b!620931 (= lt!287126 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18059 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620932 () Bool)

(declare-fun e!356121 () Unit!20706)

(declare-fun Unit!20709 () Unit!20706)

(assert (=> b!620932 (= e!356121 Unit!20709)))

(declare-fun e!356119 () Bool)

(declare-fun b!620933 () Bool)

(assert (=> b!620933 (= e!356119 (arrayContainsKey!0 lt!287136 (select (arr!18059 a!2986) j!136) index!984))))

(declare-fun b!620934 () Bool)

(declare-fun res!400184 () Bool)

(declare-fun e!356118 () Bool)

(assert (=> b!620934 (=> (not res!400184) (not e!356118))))

(assert (=> b!620934 (= res!400184 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12136))))

(declare-fun b!620935 () Bool)

(declare-fun e!356129 () Unit!20706)

(declare-fun Unit!20710 () Unit!20706)

(assert (=> b!620935 (= e!356129 Unit!20710)))

(declare-fun b!620936 () Bool)

(declare-fun res!400193 () Bool)

(assert (=> b!620936 (=> (not res!400193) (not e!356125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620936 (= res!400193 (validKeyInArray!0 k0!1786))))

(declare-fun b!620937 () Bool)

(declare-fun res!400189 () Bool)

(assert (=> b!620937 (=> (not res!400189) (not e!356125))))

(assert (=> b!620937 (= res!400189 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620938 () Bool)

(declare-fun Unit!20711 () Unit!20706)

(assert (=> b!620938 (= e!356121 Unit!20711)))

(assert (=> b!620938 false))

(declare-fun b!620939 () Bool)

(assert (=> b!620939 (= e!356118 e!356130)))

(declare-fun res!400180 () Bool)

(assert (=> b!620939 (=> (not res!400180) (not e!356130))))

(assert (=> b!620939 (= res!400180 (= (select (store (arr!18059 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620939 (= lt!287136 (array!37627 (store (arr!18059 a!2986) i!1108 k0!1786) (size!18424 a!2986)))))

(declare-fun e!356123 () Bool)

(declare-fun b!620940 () Bool)

(assert (=> b!620940 (= e!356123 (arrayContainsKey!0 lt!287136 (select (arr!18059 a!2986) j!136) index!984))))

(declare-fun b!620941 () Bool)

(declare-fun res!400185 () Bool)

(assert (=> b!620941 (=> (not res!400185) (not e!356125))))

(assert (=> b!620941 (= res!400185 (and (= (size!18424 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18424 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18424 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620942 () Bool)

(declare-fun Unit!20712 () Unit!20706)

(assert (=> b!620942 (= e!356129 Unit!20712)))

(declare-fun res!400181 () Bool)

(assert (=> b!620942 (= res!400181 (= (select (store (arr!18059 a!2986) i!1108 k0!1786) index!984) (select (arr!18059 a!2986) j!136)))))

(declare-fun e!356122 () Bool)

(assert (=> b!620942 (=> (not res!400181) (not e!356122))))

(assert (=> b!620942 e!356122))

(declare-fun c!70743 () Bool)

(assert (=> b!620942 (= c!70743 (bvslt j!136 index!984))))

(declare-fun lt!287143 () Unit!20706)

(assert (=> b!620942 (= lt!287143 e!356127)))

(declare-fun c!70744 () Bool)

(assert (=> b!620942 (= c!70744 (bvslt index!984 j!136))))

(declare-fun lt!287129 () Unit!20706)

(declare-fun e!356117 () Unit!20706)

(assert (=> b!620942 (= lt!287129 e!356117)))

(assert (=> b!620942 false))

(declare-fun b!620943 () Bool)

(declare-fun e!356128 () Bool)

(declare-fun lt!287134 () SeekEntryResult!6496)

(assert (=> b!620943 (= e!356128 (= lt!287126 lt!287134))))

(declare-fun b!620944 () Bool)

(assert (=> b!620944 (= e!356120 (not true))))

(declare-fun lt!287140 () Unit!20706)

(assert (=> b!620944 (= lt!287140 e!356129)))

(declare-fun c!70745 () Bool)

(declare-fun lt!287137 () SeekEntryResult!6496)

(assert (=> b!620944 (= c!70745 (= lt!287137 (Found!6496 index!984)))))

(declare-fun lt!287125 () Unit!20706)

(assert (=> b!620944 (= lt!287125 e!356121)))

(declare-fun c!70746 () Bool)

(assert (=> b!620944 (= c!70746 (= lt!287137 Undefined!6496))))

(declare-fun lt!287130 () (_ BitVec 64))

(assert (=> b!620944 (= lt!287137 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287130 lt!287136 mask!3053))))

(assert (=> b!620944 e!356128))

(declare-fun res!400182 () Bool)

(assert (=> b!620944 (=> (not res!400182) (not e!356128))))

(declare-fun lt!287132 () (_ BitVec 32))

(assert (=> b!620944 (= res!400182 (= lt!287134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287132 vacantSpotIndex!68 lt!287130 lt!287136 mask!3053)))))

(assert (=> b!620944 (= lt!287134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287132 vacantSpotIndex!68 (select (arr!18059 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620944 (= lt!287130 (select (store (arr!18059 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287135 () Unit!20706)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37626 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20706)

(assert (=> b!620944 (= lt!287135 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287132 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620944 (= lt!287132 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620945 () Bool)

(declare-fun res!400188 () Bool)

(assert (=> b!620945 (=> (not res!400188) (not e!356118))))

(assert (=> b!620945 (= res!400188 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18059 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!400186 () Bool)

(declare-fun b!620946 () Bool)

(assert (=> b!620946 (= res!400186 (arrayContainsKey!0 lt!287136 (select (arr!18059 a!2986) j!136) j!136))))

(assert (=> b!620946 (=> (not res!400186) (not e!356119))))

(declare-fun e!356124 () Bool)

(assert (=> b!620946 (= e!356124 e!356119)))

(declare-fun b!620947 () Bool)

(declare-fun res!400187 () Bool)

(assert (=> b!620947 (= res!400187 (bvsge j!136 index!984))))

(assert (=> b!620947 (=> res!400187 e!356124)))

(assert (=> b!620947 (= e!356122 e!356124)))

(declare-fun b!620948 () Bool)

(declare-fun Unit!20713 () Unit!20706)

(assert (=> b!620948 (= e!356117 Unit!20713)))

(declare-fun b!620949 () Bool)

(declare-fun Unit!20714 () Unit!20706)

(assert (=> b!620949 (= e!356127 Unit!20714)))

(declare-fun b!620950 () Bool)

(assert (=> b!620950 (= e!356125 e!356118)))

(declare-fun res!400178 () Bool)

(assert (=> b!620950 (=> (not res!400178) (not e!356118))))

(declare-fun lt!287131 () SeekEntryResult!6496)

(assert (=> b!620950 (= res!400178 (or (= lt!287131 (MissingZero!6496 i!1108)) (= lt!287131 (MissingVacant!6496 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37626 (_ BitVec 32)) SeekEntryResult!6496)

(assert (=> b!620950 (= lt!287131 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620951 () Bool)

(assert (=> b!620951 false))

(declare-fun lt!287128 () Unit!20706)

(assert (=> b!620951 (= lt!287128 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287136 (select (arr!18059 a!2986) j!136) index!984 Nil!12136))))

(assert (=> b!620951 (arrayNoDuplicates!0 lt!287136 index!984 Nil!12136)))

(declare-fun lt!287142 () Unit!20706)

(assert (=> b!620951 (= lt!287142 (lemmaNoDuplicateFromThenFromBigger!0 lt!287136 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620951 (arrayNoDuplicates!0 lt!287136 #b00000000000000000000000000000000 Nil!12136)))

(declare-fun lt!287138 () Unit!20706)

(assert (=> b!620951 (= lt!287138 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12136))))

(assert (=> b!620951 (arrayContainsKey!0 lt!287136 (select (arr!18059 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287141 () Unit!20706)

(assert (=> b!620951 (= lt!287141 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287136 (select (arr!18059 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620951 e!356123))

(declare-fun res!400179 () Bool)

(assert (=> b!620951 (=> (not res!400179) (not e!356123))))

(assert (=> b!620951 (= res!400179 (arrayContainsKey!0 lt!287136 (select (arr!18059 a!2986) j!136) j!136))))

(declare-fun Unit!20715 () Unit!20706)

(assert (=> b!620951 (= e!356117 Unit!20715)))

(declare-fun b!620952 () Bool)

(declare-fun res!400190 () Bool)

(assert (=> b!620952 (=> (not res!400190) (not e!356118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37626 (_ BitVec 32)) Bool)

(assert (=> b!620952 (= res!400190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620953 () Bool)

(declare-fun res!400192 () Bool)

(assert (=> b!620953 (=> (not res!400192) (not e!356125))))

(assert (=> b!620953 (= res!400192 (validKeyInArray!0 (select (arr!18059 a!2986) j!136)))))

(assert (= (and start!56142 res!400183) b!620941))

(assert (= (and b!620941 res!400185) b!620953))

(assert (= (and b!620953 res!400192) b!620936))

(assert (= (and b!620936 res!400193) b!620937))

(assert (= (and b!620937 res!400189) b!620950))

(assert (= (and b!620950 res!400178) b!620952))

(assert (= (and b!620952 res!400190) b!620934))

(assert (= (and b!620934 res!400184) b!620945))

(assert (= (and b!620945 res!400188) b!620939))

(assert (= (and b!620939 res!400180) b!620931))

(assert (= (and b!620931 res!400191) b!620944))

(assert (= (and b!620944 res!400182) b!620943))

(assert (= (and b!620944 c!70746) b!620938))

(assert (= (and b!620944 (not c!70746)) b!620932))

(assert (= (and b!620944 c!70745) b!620942))

(assert (= (and b!620944 (not c!70745)) b!620935))

(assert (= (and b!620942 res!400181) b!620947))

(assert (= (and b!620947 (not res!400187)) b!620946))

(assert (= (and b!620946 res!400186) b!620933))

(assert (= (and b!620942 c!70743) b!620930))

(assert (= (and b!620942 (not c!70743)) b!620949))

(assert (= (and b!620942 c!70744) b!620951))

(assert (= (and b!620942 (not c!70744)) b!620948))

(assert (= (and b!620951 res!400179) b!620940))

(declare-fun m!596329 () Bool)

(assert (=> b!620953 m!596329))

(assert (=> b!620953 m!596329))

(declare-fun m!596331 () Bool)

(assert (=> b!620953 m!596331))

(declare-fun m!596333 () Bool)

(assert (=> b!620944 m!596333))

(declare-fun m!596335 () Bool)

(assert (=> b!620944 m!596335))

(assert (=> b!620944 m!596329))

(declare-fun m!596337 () Bool)

(assert (=> b!620944 m!596337))

(declare-fun m!596339 () Bool)

(assert (=> b!620944 m!596339))

(declare-fun m!596341 () Bool)

(assert (=> b!620944 m!596341))

(declare-fun m!596343 () Bool)

(assert (=> b!620944 m!596343))

(declare-fun m!596345 () Bool)

(assert (=> b!620944 m!596345))

(assert (=> b!620944 m!596329))

(declare-fun m!596347 () Bool)

(assert (=> start!56142 m!596347))

(declare-fun m!596349 () Bool)

(assert (=> start!56142 m!596349))

(declare-fun m!596351 () Bool)

(assert (=> b!620951 m!596351))

(assert (=> b!620951 m!596329))

(declare-fun m!596353 () Bool)

(assert (=> b!620951 m!596353))

(assert (=> b!620951 m!596329))

(declare-fun m!596355 () Bool)

(assert (=> b!620951 m!596355))

(assert (=> b!620951 m!596329))

(declare-fun m!596357 () Bool)

(assert (=> b!620951 m!596357))

(assert (=> b!620951 m!596329))

(declare-fun m!596359 () Bool)

(assert (=> b!620951 m!596359))

(assert (=> b!620951 m!596329))

(declare-fun m!596361 () Bool)

(assert (=> b!620951 m!596361))

(declare-fun m!596363 () Bool)

(assert (=> b!620951 m!596363))

(declare-fun m!596365 () Bool)

(assert (=> b!620951 m!596365))

(assert (=> b!620939 m!596339))

(declare-fun m!596367 () Bool)

(assert (=> b!620939 m!596367))

(assert (=> b!620940 m!596329))

(assert (=> b!620940 m!596329))

(declare-fun m!596369 () Bool)

(assert (=> b!620940 m!596369))

(declare-fun m!596371 () Bool)

(assert (=> b!620937 m!596371))

(declare-fun m!596373 () Bool)

(assert (=> b!620934 m!596373))

(declare-fun m!596375 () Bool)

(assert (=> b!620950 m!596375))

(assert (=> b!620930 m!596351))

(declare-fun m!596377 () Bool)

(assert (=> b!620930 m!596377))

(assert (=> b!620930 m!596329))

(declare-fun m!596379 () Bool)

(assert (=> b!620930 m!596379))

(assert (=> b!620930 m!596329))

(declare-fun m!596381 () Bool)

(assert (=> b!620930 m!596381))

(assert (=> b!620930 m!596329))

(declare-fun m!596383 () Bool)

(assert (=> b!620930 m!596383))

(assert (=> b!620930 m!596329))

(declare-fun m!596385 () Bool)

(assert (=> b!620930 m!596385))

(assert (=> b!620930 m!596365))

(declare-fun m!596387 () Bool)

(assert (=> b!620936 m!596387))

(declare-fun m!596389 () Bool)

(assert (=> b!620952 m!596389))

(declare-fun m!596391 () Bool)

(assert (=> b!620931 m!596391))

(assert (=> b!620931 m!596329))

(assert (=> b!620931 m!596329))

(declare-fun m!596393 () Bool)

(assert (=> b!620931 m!596393))

(assert (=> b!620933 m!596329))

(assert (=> b!620933 m!596329))

(assert (=> b!620933 m!596369))

(assert (=> b!620946 m!596329))

(assert (=> b!620946 m!596329))

(assert (=> b!620946 m!596359))

(assert (=> b!620942 m!596339))

(declare-fun m!596395 () Bool)

(assert (=> b!620942 m!596395))

(assert (=> b!620942 m!596329))

(declare-fun m!596397 () Bool)

(assert (=> b!620945 m!596397))

(check-sat (not b!620936) (not b!620944) (not b!620933) (not b!620951) (not b!620930) (not start!56142) (not b!620950) (not b!620934) (not b!620952) (not b!620953) (not b!620946) (not b!620937) (not b!620940) (not b!620931))
(check-sat)
