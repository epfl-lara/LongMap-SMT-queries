; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57112 () Bool)

(assert start!57112)

(declare-fun b!632352 () Bool)

(declare-fun e!361530 () Bool)

(assert (=> b!632352 (= e!361530 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38131 0))(
  ( (array!38132 (arr!18298 (Array (_ BitVec 32) (_ BitVec 64))) (size!18662 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38131)

(assert (=> b!632352 (= (select (store (arr!18298 a!2986) i!1108 k0!1786) index!984) (select (arr!18298 a!2986) j!136))))

(declare-fun b!632353 () Bool)

(declare-fun res!408967 () Bool)

(declare-fun e!361523 () Bool)

(assert (=> b!632353 (=> (not res!408967) (not e!361523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632353 (= res!408967 (validKeyInArray!0 (select (arr!18298 a!2986) j!136)))))

(declare-fun b!632354 () Bool)

(declare-fun e!361529 () Bool)

(declare-datatypes ((SeekEntryResult!6738 0))(
  ( (MissingZero!6738 (index!29245 (_ BitVec 32))) (Found!6738 (index!29246 (_ BitVec 32))) (Intermediate!6738 (undefined!7550 Bool) (index!29247 (_ BitVec 32)) (x!57981 (_ BitVec 32))) (Undefined!6738) (MissingVacant!6738 (index!29248 (_ BitVec 32))) )
))
(declare-fun lt!292240 () SeekEntryResult!6738)

(declare-fun lt!292242 () SeekEntryResult!6738)

(assert (=> b!632354 (= e!361529 (= lt!292240 lt!292242))))

(declare-fun b!632355 () Bool)

(declare-fun e!361527 () Bool)

(declare-fun e!361524 () Bool)

(assert (=> b!632355 (= e!361527 e!361524)))

(declare-fun res!408970 () Bool)

(assert (=> b!632355 (=> (not res!408970) (not e!361524))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!632355 (= res!408970 (= (select (store (arr!18298 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292238 () array!38131)

(assert (=> b!632355 (= lt!292238 (array!38132 (store (arr!18298 a!2986) i!1108 k0!1786) (size!18662 a!2986)))))

(declare-fun b!632356 () Bool)

(declare-fun res!408972 () Bool)

(assert (=> b!632356 (=> (not res!408972) (not e!361527))))

(declare-datatypes ((List!12339 0))(
  ( (Nil!12336) (Cons!12335 (h!13380 (_ BitVec 64)) (t!18567 List!12339)) )
))
(declare-fun arrayNoDuplicates!0 (array!38131 (_ BitVec 32) List!12339) Bool)

(assert (=> b!632356 (= res!408972 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12336))))

(declare-fun b!632357 () Bool)

(declare-fun res!408963 () Bool)

(assert (=> b!632357 (=> (not res!408963) (not e!361523))))

(declare-fun arrayContainsKey!0 (array!38131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632357 (= res!408963 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632358 () Bool)

(declare-fun e!361526 () Bool)

(assert (=> b!632358 (= e!361526 (not e!361530))))

(declare-fun res!408971 () Bool)

(assert (=> b!632358 (=> res!408971 e!361530)))

(declare-fun lt!292246 () SeekEntryResult!6738)

(assert (=> b!632358 (= res!408971 (not (= lt!292246 (Found!6738 index!984))))))

(declare-datatypes ((Unit!21286 0))(
  ( (Unit!21287) )
))
(declare-fun lt!292241 () Unit!21286)

(declare-fun e!361528 () Unit!21286)

(assert (=> b!632358 (= lt!292241 e!361528)))

(declare-fun c!72062 () Bool)

(assert (=> b!632358 (= c!72062 (= lt!292246 Undefined!6738))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292239 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38131 (_ BitVec 32)) SeekEntryResult!6738)

(assert (=> b!632358 (= lt!292246 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292239 lt!292238 mask!3053))))

(assert (=> b!632358 e!361529))

(declare-fun res!408966 () Bool)

(assert (=> b!632358 (=> (not res!408966) (not e!361529))))

(declare-fun lt!292244 () (_ BitVec 32))

(assert (=> b!632358 (= res!408966 (= lt!292242 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292244 vacantSpotIndex!68 lt!292239 lt!292238 mask!3053)))))

(assert (=> b!632358 (= lt!292242 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292244 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632358 (= lt!292239 (select (store (arr!18298 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292245 () Unit!21286)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21286)

(assert (=> b!632358 (= lt!292245 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292244 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632358 (= lt!292244 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632359 () Bool)

(declare-fun res!408974 () Bool)

(assert (=> b!632359 (=> (not res!408974) (not e!361523))))

(assert (=> b!632359 (= res!408974 (validKeyInArray!0 k0!1786))))

(declare-fun b!632360 () Bool)

(declare-fun res!408964 () Bool)

(assert (=> b!632360 (=> (not res!408964) (not e!361527))))

(assert (=> b!632360 (= res!408964 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18298 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632362 () Bool)

(assert (=> b!632362 (= e!361524 e!361526)))

(declare-fun res!408962 () Bool)

(assert (=> b!632362 (=> (not res!408962) (not e!361526))))

(assert (=> b!632362 (= res!408962 (and (= lt!292240 (Found!6738 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18298 a!2986) index!984) (select (arr!18298 a!2986) j!136))) (not (= (select (arr!18298 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632362 (= lt!292240 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632363 () Bool)

(declare-fun res!408965 () Bool)

(assert (=> b!632363 (=> (not res!408965) (not e!361527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38131 (_ BitVec 32)) Bool)

(assert (=> b!632363 (= res!408965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632364 () Bool)

(assert (=> b!632364 (= e!361523 e!361527)))

(declare-fun res!408969 () Bool)

(assert (=> b!632364 (=> (not res!408969) (not e!361527))))

(declare-fun lt!292243 () SeekEntryResult!6738)

(assert (=> b!632364 (= res!408969 (or (= lt!292243 (MissingZero!6738 i!1108)) (= lt!292243 (MissingVacant!6738 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38131 (_ BitVec 32)) SeekEntryResult!6738)

(assert (=> b!632364 (= lt!292243 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!408973 () Bool)

(assert (=> start!57112 (=> (not res!408973) (not e!361523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57112 (= res!408973 (validMask!0 mask!3053))))

(assert (=> start!57112 e!361523))

(assert (=> start!57112 true))

(declare-fun array_inv!14094 (array!38131) Bool)

(assert (=> start!57112 (array_inv!14094 a!2986)))

(declare-fun b!632361 () Bool)

(declare-fun Unit!21288 () Unit!21286)

(assert (=> b!632361 (= e!361528 Unit!21288)))

(assert (=> b!632361 false))

(declare-fun b!632365 () Bool)

(declare-fun Unit!21289 () Unit!21286)

(assert (=> b!632365 (= e!361528 Unit!21289)))

(declare-fun b!632366 () Bool)

(declare-fun res!408968 () Bool)

(assert (=> b!632366 (=> (not res!408968) (not e!361523))))

(assert (=> b!632366 (= res!408968 (and (= (size!18662 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18662 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18662 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57112 res!408973) b!632366))

(assert (= (and b!632366 res!408968) b!632353))

(assert (= (and b!632353 res!408967) b!632359))

(assert (= (and b!632359 res!408974) b!632357))

(assert (= (and b!632357 res!408963) b!632364))

(assert (= (and b!632364 res!408969) b!632363))

(assert (= (and b!632363 res!408965) b!632356))

(assert (= (and b!632356 res!408972) b!632360))

(assert (= (and b!632360 res!408964) b!632355))

(assert (= (and b!632355 res!408970) b!632362))

(assert (= (and b!632362 res!408962) b!632358))

(assert (= (and b!632358 res!408966) b!632354))

(assert (= (and b!632358 c!72062) b!632361))

(assert (= (and b!632358 (not c!72062)) b!632365))

(assert (= (and b!632358 (not res!408971)) b!632352))

(declare-fun m!607185 () Bool)

(assert (=> b!632360 m!607185))

(declare-fun m!607187 () Bool)

(assert (=> b!632364 m!607187))

(declare-fun m!607189 () Bool)

(assert (=> b!632352 m!607189))

(declare-fun m!607191 () Bool)

(assert (=> b!632352 m!607191))

(declare-fun m!607193 () Bool)

(assert (=> b!632352 m!607193))

(declare-fun m!607195 () Bool)

(assert (=> b!632358 m!607195))

(declare-fun m!607197 () Bool)

(assert (=> b!632358 m!607197))

(assert (=> b!632358 m!607193))

(assert (=> b!632358 m!607189))

(declare-fun m!607199 () Bool)

(assert (=> b!632358 m!607199))

(declare-fun m!607201 () Bool)

(assert (=> b!632358 m!607201))

(assert (=> b!632358 m!607193))

(declare-fun m!607203 () Bool)

(assert (=> b!632358 m!607203))

(declare-fun m!607205 () Bool)

(assert (=> b!632358 m!607205))

(declare-fun m!607207 () Bool)

(assert (=> b!632363 m!607207))

(assert (=> b!632353 m!607193))

(assert (=> b!632353 m!607193))

(declare-fun m!607209 () Bool)

(assert (=> b!632353 m!607209))

(declare-fun m!607211 () Bool)

(assert (=> start!57112 m!607211))

(declare-fun m!607213 () Bool)

(assert (=> start!57112 m!607213))

(declare-fun m!607215 () Bool)

(assert (=> b!632359 m!607215))

(assert (=> b!632355 m!607189))

(declare-fun m!607217 () Bool)

(assert (=> b!632355 m!607217))

(declare-fun m!607219 () Bool)

(assert (=> b!632356 m!607219))

(declare-fun m!607221 () Bool)

(assert (=> b!632362 m!607221))

(assert (=> b!632362 m!607193))

(assert (=> b!632362 m!607193))

(declare-fun m!607223 () Bool)

(assert (=> b!632362 m!607223))

(declare-fun m!607225 () Bool)

(assert (=> b!632357 m!607225))

(check-sat (not b!632364) (not b!632362) (not b!632356) (not b!632353) (not b!632358) (not b!632363) (not start!57112) (not b!632357) (not b!632359))
(check-sat)
