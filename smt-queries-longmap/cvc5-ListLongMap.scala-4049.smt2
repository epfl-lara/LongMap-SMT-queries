; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55252 () Bool)

(assert start!55252)

(declare-fun res!388960 () Bool)

(declare-fun e!346453 () Bool)

(assert (=> start!55252 (=> (not res!388960) (not e!346453))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55252 (= res!388960 (validMask!0 mask!3053))))

(assert (=> start!55252 e!346453))

(assert (=> start!55252 true))

(declare-datatypes ((array!37244 0))(
  ( (array!37245 (arr!17877 (Array (_ BitVec 32) (_ BitVec 64))) (size!18241 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37244)

(declare-fun array_inv!13673 (array!37244) Bool)

(assert (=> start!55252 (array_inv!13673 a!2986)))

(declare-fun b!605329 () Bool)

(declare-fun e!346456 () Bool)

(declare-fun e!346457 () Bool)

(assert (=> b!605329 (= e!346456 e!346457)))

(declare-fun res!388954 () Bool)

(assert (=> b!605329 (=> res!388954 e!346457)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276197 () (_ BitVec 64))

(declare-fun lt!276208 () (_ BitVec 64))

(assert (=> b!605329 (= res!388954 (or (not (= (select (arr!17877 a!2986) j!136) lt!276208)) (not (= (select (arr!17877 a!2986) j!136) lt!276197))))))

(declare-fun e!346446 () Bool)

(assert (=> b!605329 e!346446))

(declare-fun res!388956 () Bool)

(assert (=> b!605329 (=> (not res!388956) (not e!346446))))

(assert (=> b!605329 (= res!388956 (= lt!276197 (select (arr!17877 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!605329 (= lt!276197 (select (store (arr!17877 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!605330 () Bool)

(declare-datatypes ((Unit!19282 0))(
  ( (Unit!19283) )
))
(declare-fun e!346449 () Unit!19282)

(declare-fun Unit!19284 () Unit!19282)

(assert (=> b!605330 (= e!346449 Unit!19284)))

(declare-fun b!605331 () Bool)

(declare-fun e!346452 () Bool)

(declare-fun e!346444 () Bool)

(assert (=> b!605331 (= e!346452 e!346444)))

(declare-fun res!388952 () Bool)

(assert (=> b!605331 (=> (not res!388952) (not e!346444))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6317 0))(
  ( (MissingZero!6317 (index!27534 (_ BitVec 32))) (Found!6317 (index!27535 (_ BitVec 32))) (Intermediate!6317 (undefined!7129 Bool) (index!27536 (_ BitVec 32)) (x!56335 (_ BitVec 32))) (Undefined!6317) (MissingVacant!6317 (index!27537 (_ BitVec 32))) )
))
(declare-fun lt!276195 () SeekEntryResult!6317)

(assert (=> b!605331 (= res!388952 (and (= lt!276195 (Found!6317 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17877 a!2986) index!984) (select (arr!17877 a!2986) j!136))) (not (= (select (arr!17877 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37244 (_ BitVec 32)) SeekEntryResult!6317)

(assert (=> b!605331 (= lt!276195 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605332 () Bool)

(declare-fun e!346454 () Bool)

(assert (=> b!605332 (= e!346454 e!346452)))

(declare-fun res!388955 () Bool)

(assert (=> b!605332 (=> (not res!388955) (not e!346452))))

(assert (=> b!605332 (= res!388955 (= (select (store (arr!17877 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!276204 () array!37244)

(assert (=> b!605332 (= lt!276204 (array!37245 (store (arr!17877 a!2986) i!1108 k!1786) (size!18241 a!2986)))))

(declare-fun b!605333 () Bool)

(declare-fun res!388950 () Bool)

(assert (=> b!605333 (=> (not res!388950) (not e!346454))))

(declare-datatypes ((List!11918 0))(
  ( (Nil!11915) (Cons!11914 (h!12959 (_ BitVec 64)) (t!18146 List!11918)) )
))
(declare-fun arrayNoDuplicates!0 (array!37244 (_ BitVec 32) List!11918) Bool)

(assert (=> b!605333 (= res!388950 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11915))))

(declare-fun b!605334 () Bool)

(declare-fun res!388948 () Bool)

(assert (=> b!605334 (=> (not res!388948) (not e!346453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605334 (= res!388948 (validKeyInArray!0 k!1786))))

(declare-fun b!605335 () Bool)

(declare-fun e!346455 () Bool)

(declare-fun arrayContainsKey!0 (array!37244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605335 (= e!346455 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) index!984))))

(declare-fun b!605336 () Bool)

(declare-fun e!346447 () Unit!19282)

(declare-fun Unit!19285 () Unit!19282)

(assert (=> b!605336 (= e!346447 Unit!19285)))

(declare-fun b!605337 () Bool)

(assert (=> b!605337 (= e!346453 e!346454)))

(declare-fun res!388946 () Bool)

(assert (=> b!605337 (=> (not res!388946) (not e!346454))))

(declare-fun lt!276203 () SeekEntryResult!6317)

(assert (=> b!605337 (= res!388946 (or (= lt!276203 (MissingZero!6317 i!1108)) (= lt!276203 (MissingVacant!6317 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37244 (_ BitVec 32)) SeekEntryResult!6317)

(assert (=> b!605337 (= lt!276203 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!605338 () Bool)

(declare-fun res!388958 () Bool)

(assert (=> b!605338 (=> (not res!388958) (not e!346453))))

(assert (=> b!605338 (= res!388958 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605339 () Bool)

(declare-fun e!346448 () Bool)

(assert (=> b!605339 (= e!346448 (or (bvsgt #b00000000000000000000000000000000 (size!18241 a!2986)) (bvslt (size!18241 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605339 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276194 () Unit!19282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37244 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19282)

(assert (=> b!605339 (= lt!276194 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276204 (select (arr!17877 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!346445 () Bool)

(assert (=> b!605339 e!346445))

(declare-fun res!388957 () Bool)

(assert (=> b!605339 (=> (not res!388957) (not e!346445))))

(assert (=> b!605339 (= res!388957 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) j!136))))

(declare-fun b!605340 () Bool)

(assert (=> b!605340 (= e!346445 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) index!984))))

(declare-fun b!605341 () Bool)

(declare-fun res!388949 () Bool)

(assert (=> b!605341 (=> (not res!388949) (not e!346453))))

(assert (=> b!605341 (= res!388949 (and (= (size!18241 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18241 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605342 () Bool)

(declare-fun res!388959 () Bool)

(assert (=> b!605342 (=> (not res!388959) (not e!346454))))

(assert (=> b!605342 (= res!388959 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17877 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605343 () Bool)

(declare-fun e!346458 () Bool)

(assert (=> b!605343 (= e!346458 e!346455)))

(declare-fun res!388944 () Bool)

(assert (=> b!605343 (=> (not res!388944) (not e!346455))))

(assert (=> b!605343 (= res!388944 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) j!136))))

(declare-fun b!605344 () Bool)

(assert (=> b!605344 (= e!346446 e!346458)))

(declare-fun res!388961 () Bool)

(assert (=> b!605344 (=> res!388961 e!346458)))

(assert (=> b!605344 (= res!388961 (or (not (= (select (arr!17877 a!2986) j!136) lt!276208)) (not (= (select (arr!17877 a!2986) j!136) lt!276197)) (bvsge j!136 index!984)))))

(declare-fun b!605345 () Bool)

(declare-fun e!346451 () Bool)

(declare-fun lt!276201 () SeekEntryResult!6317)

(assert (=> b!605345 (= e!346451 (= lt!276195 lt!276201))))

(declare-fun b!605346 () Bool)

(assert (=> b!605346 (= e!346457 e!346448)))

(declare-fun res!388945 () Bool)

(assert (=> b!605346 (=> res!388945 e!346448)))

(assert (=> b!605346 (= res!388945 (bvsge index!984 j!136))))

(declare-fun lt!276199 () Unit!19282)

(assert (=> b!605346 (= lt!276199 e!346449)))

(declare-fun c!68561 () Bool)

(assert (=> b!605346 (= c!68561 (bvslt j!136 index!984))))

(declare-fun b!605347 () Bool)

(declare-fun res!388953 () Bool)

(assert (=> b!605347 (=> (not res!388953) (not e!346454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37244 (_ BitVec 32)) Bool)

(assert (=> b!605347 (= res!388953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605348 () Bool)

(assert (=> b!605348 (= e!346444 (not e!346456))))

(declare-fun res!388943 () Bool)

(assert (=> b!605348 (=> res!388943 e!346456)))

(declare-fun lt!276205 () SeekEntryResult!6317)

(assert (=> b!605348 (= res!388943 (not (= lt!276205 (Found!6317 index!984))))))

(declare-fun lt!276193 () Unit!19282)

(assert (=> b!605348 (= lt!276193 e!346447)))

(declare-fun c!68560 () Bool)

(assert (=> b!605348 (= c!68560 (= lt!276205 Undefined!6317))))

(assert (=> b!605348 (= lt!276205 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276208 lt!276204 mask!3053))))

(assert (=> b!605348 e!346451))

(declare-fun res!388951 () Bool)

(assert (=> b!605348 (=> (not res!388951) (not e!346451))))

(declare-fun lt!276207 () (_ BitVec 32))

(assert (=> b!605348 (= res!388951 (= lt!276201 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 lt!276208 lt!276204 mask!3053)))))

(assert (=> b!605348 (= lt!276201 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605348 (= lt!276208 (select (store (arr!17877 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276200 () Unit!19282)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19282)

(assert (=> b!605348 (= lt!276200 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605348 (= lt!276207 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605349 () Bool)

(declare-fun Unit!19286 () Unit!19282)

(assert (=> b!605349 (= e!346447 Unit!19286)))

(assert (=> b!605349 false))

(declare-fun b!605350 () Bool)

(declare-fun res!388947 () Bool)

(assert (=> b!605350 (=> (not res!388947) (not e!346453))))

(assert (=> b!605350 (= res!388947 (validKeyInArray!0 (select (arr!17877 a!2986) j!136)))))

(declare-fun b!605351 () Bool)

(declare-fun Unit!19287 () Unit!19282)

(assert (=> b!605351 (= e!346449 Unit!19287)))

(declare-fun lt!276198 () Unit!19282)

(assert (=> b!605351 (= lt!276198 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276204 (select (arr!17877 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605351 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276202 () Unit!19282)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37244 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11918) Unit!19282)

(assert (=> b!605351 (= lt!276202 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11915))))

(assert (=> b!605351 (arrayNoDuplicates!0 lt!276204 #b00000000000000000000000000000000 Nil!11915)))

(declare-fun lt!276196 () Unit!19282)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37244 (_ BitVec 32) (_ BitVec 32)) Unit!19282)

(assert (=> b!605351 (= lt!276196 (lemmaNoDuplicateFromThenFromBigger!0 lt!276204 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605351 (arrayNoDuplicates!0 lt!276204 j!136 Nil!11915)))

(declare-fun lt!276206 () Unit!19282)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37244 (_ BitVec 64) (_ BitVec 32) List!11918) Unit!19282)

(assert (=> b!605351 (= lt!276206 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276204 (select (arr!17877 a!2986) j!136) j!136 Nil!11915))))

(assert (=> b!605351 false))

(assert (= (and start!55252 res!388960) b!605341))

(assert (= (and b!605341 res!388949) b!605350))

(assert (= (and b!605350 res!388947) b!605334))

(assert (= (and b!605334 res!388948) b!605338))

(assert (= (and b!605338 res!388958) b!605337))

(assert (= (and b!605337 res!388946) b!605347))

(assert (= (and b!605347 res!388953) b!605333))

(assert (= (and b!605333 res!388950) b!605342))

(assert (= (and b!605342 res!388959) b!605332))

(assert (= (and b!605332 res!388955) b!605331))

(assert (= (and b!605331 res!388952) b!605348))

(assert (= (and b!605348 res!388951) b!605345))

(assert (= (and b!605348 c!68560) b!605349))

(assert (= (and b!605348 (not c!68560)) b!605336))

(assert (= (and b!605348 (not res!388943)) b!605329))

(assert (= (and b!605329 res!388956) b!605344))

(assert (= (and b!605344 (not res!388961)) b!605343))

(assert (= (and b!605343 res!388944) b!605335))

(assert (= (and b!605329 (not res!388954)) b!605346))

(assert (= (and b!605346 c!68561) b!605351))

(assert (= (and b!605346 (not c!68561)) b!605330))

(assert (= (and b!605346 (not res!388945)) b!605339))

(assert (= (and b!605339 res!388957) b!605340))

(declare-fun m!582191 () Bool)

(assert (=> b!605333 m!582191))

(declare-fun m!582193 () Bool)

(assert (=> b!605348 m!582193))

(declare-fun m!582195 () Bool)

(assert (=> b!605348 m!582195))

(declare-fun m!582197 () Bool)

(assert (=> b!605348 m!582197))

(assert (=> b!605348 m!582197))

(declare-fun m!582199 () Bool)

(assert (=> b!605348 m!582199))

(declare-fun m!582201 () Bool)

(assert (=> b!605348 m!582201))

(declare-fun m!582203 () Bool)

(assert (=> b!605348 m!582203))

(declare-fun m!582205 () Bool)

(assert (=> b!605348 m!582205))

(declare-fun m!582207 () Bool)

(assert (=> b!605348 m!582207))

(assert (=> b!605340 m!582197))

(assert (=> b!605340 m!582197))

(declare-fun m!582209 () Bool)

(assert (=> b!605340 m!582209))

(assert (=> b!605329 m!582197))

(assert (=> b!605329 m!582201))

(declare-fun m!582211 () Bool)

(assert (=> b!605329 m!582211))

(assert (=> b!605335 m!582197))

(assert (=> b!605335 m!582197))

(assert (=> b!605335 m!582209))

(assert (=> b!605344 m!582197))

(declare-fun m!582213 () Bool)

(assert (=> b!605331 m!582213))

(assert (=> b!605331 m!582197))

(assert (=> b!605331 m!582197))

(declare-fun m!582215 () Bool)

(assert (=> b!605331 m!582215))

(declare-fun m!582217 () Bool)

(assert (=> start!55252 m!582217))

(declare-fun m!582219 () Bool)

(assert (=> start!55252 m!582219))

(declare-fun m!582221 () Bool)

(assert (=> b!605337 m!582221))

(assert (=> b!605332 m!582201))

(declare-fun m!582223 () Bool)

(assert (=> b!605332 m!582223))

(declare-fun m!582225 () Bool)

(assert (=> b!605338 m!582225))

(assert (=> b!605351 m!582197))

(declare-fun m!582227 () Bool)

(assert (=> b!605351 m!582227))

(declare-fun m!582229 () Bool)

(assert (=> b!605351 m!582229))

(declare-fun m!582231 () Bool)

(assert (=> b!605351 m!582231))

(declare-fun m!582233 () Bool)

(assert (=> b!605351 m!582233))

(assert (=> b!605351 m!582197))

(declare-fun m!582235 () Bool)

(assert (=> b!605351 m!582235))

(declare-fun m!582237 () Bool)

(assert (=> b!605351 m!582237))

(assert (=> b!605351 m!582197))

(assert (=> b!605351 m!582197))

(declare-fun m!582239 () Bool)

(assert (=> b!605351 m!582239))

(assert (=> b!605350 m!582197))

(assert (=> b!605350 m!582197))

(declare-fun m!582241 () Bool)

(assert (=> b!605350 m!582241))

(declare-fun m!582243 () Bool)

(assert (=> b!605342 m!582243))

(declare-fun m!582245 () Bool)

(assert (=> b!605347 m!582245))

(declare-fun m!582247 () Bool)

(assert (=> b!605334 m!582247))

(assert (=> b!605343 m!582197))

(assert (=> b!605343 m!582197))

(declare-fun m!582249 () Bool)

(assert (=> b!605343 m!582249))

(assert (=> b!605339 m!582197))

(assert (=> b!605339 m!582197))

(declare-fun m!582251 () Bool)

(assert (=> b!605339 m!582251))

(assert (=> b!605339 m!582197))

(declare-fun m!582253 () Bool)

(assert (=> b!605339 m!582253))

(assert (=> b!605339 m!582197))

(assert (=> b!605339 m!582249))

(push 1)

(assert (not b!605334))

(assert (not b!605340))

(assert (not b!605337))

(assert (not b!605338))

(assert (not b!605348))

(assert (not b!605333))

(assert (not b!605351))

(assert (not start!55252))

(assert (not b!605350))

(assert (not b!605347))

(assert (not b!605339))

(assert (not b!605335))

(assert (not b!605331))

(assert (not b!605343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87605 () Bool)

(declare-fun res!389095 () Bool)

(declare-fun e!346585 () Bool)

(assert (=> d!87605 (=> res!389095 e!346585)))

(assert (=> d!87605 (= res!389095 (= (select (arr!17877 lt!276204) j!136) (select (arr!17877 a!2986) j!136)))))

(assert (=> d!87605 (= (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) j!136) e!346585)))

(declare-fun b!605543 () Bool)

(declare-fun e!346586 () Bool)

(assert (=> b!605543 (= e!346585 e!346586)))

(declare-fun res!389096 () Bool)

(assert (=> b!605543 (=> (not res!389096) (not e!346586))))

(assert (=> b!605543 (= res!389096 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18241 lt!276204)))))

(declare-fun b!605544 () Bool)

(assert (=> b!605544 (= e!346586 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87605 (not res!389095)) b!605543))

(assert (= (and b!605543 res!389096) b!605544))

(declare-fun m!582417 () Bool)

(assert (=> d!87605 m!582417))

(assert (=> b!605544 m!582197))

(declare-fun m!582419 () Bool)

(assert (=> b!605544 m!582419))

(assert (=> b!605343 d!87605))

(declare-fun b!605577 () Bool)

(declare-fun c!68602 () Bool)

(declare-fun lt!276337 () (_ BitVec 64))

(assert (=> b!605577 (= c!68602 (= lt!276337 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346611 () SeekEntryResult!6317)

(declare-fun e!346610 () SeekEntryResult!6317)

(assert (=> b!605577 (= e!346611 e!346610)))

(declare-fun b!605579 () Bool)

(assert (=> b!605579 (= e!346610 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605580 () Bool)

(declare-fun e!346612 () SeekEntryResult!6317)

(assert (=> b!605580 (= e!346612 Undefined!6317)))

(declare-fun b!605581 () Bool)

(assert (=> b!605581 (= e!346612 e!346611)))

(declare-fun c!68600 () Bool)

(assert (=> b!605581 (= c!68600 (= lt!276337 (select (arr!17877 a!2986) j!136)))))

(declare-fun b!605582 () Bool)

(assert (=> b!605582 (= e!346611 (Found!6317 index!984))))

(declare-fun b!605578 () Bool)

(assert (=> b!605578 (= e!346610 (MissingVacant!6317 vacantSpotIndex!68))))

(declare-fun d!87609 () Bool)

(declare-fun lt!276338 () SeekEntryResult!6317)

(assert (=> d!87609 (and (or (is-Undefined!6317 lt!276338) (not (is-Found!6317 lt!276338)) (and (bvsge (index!27535 lt!276338) #b00000000000000000000000000000000) (bvslt (index!27535 lt!276338) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276338) (is-Found!6317 lt!276338) (not (is-MissingVacant!6317 lt!276338)) (not (= (index!27537 lt!276338) vacantSpotIndex!68)) (and (bvsge (index!27537 lt!276338) #b00000000000000000000000000000000) (bvslt (index!27537 lt!276338) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276338) (ite (is-Found!6317 lt!276338) (= (select (arr!17877 a!2986) (index!27535 lt!276338)) (select (arr!17877 a!2986) j!136)) (and (is-MissingVacant!6317 lt!276338) (= (index!27537 lt!276338) vacantSpotIndex!68) (= (select (arr!17877 a!2986) (index!27537 lt!276338)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87609 (= lt!276338 e!346612)))

(declare-fun c!68601 () Bool)

(assert (=> d!87609 (= c!68601 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87609 (= lt!276337 (select (arr!17877 a!2986) index!984))))

(assert (=> d!87609 (validMask!0 mask!3053)))

(assert (=> d!87609 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053) lt!276338)))

(assert (= (and d!87609 c!68601) b!605580))

(assert (= (and d!87609 (not c!68601)) b!605581))

(assert (= (and b!605581 c!68600) b!605582))

(assert (= (and b!605581 (not c!68600)) b!605577))

(assert (= (and b!605577 c!68602) b!605578))

(assert (= (and b!605577 (not c!68602)) b!605579))

(assert (=> b!605579 m!582193))

(assert (=> b!605579 m!582193))

(assert (=> b!605579 m!582197))

(declare-fun m!582445 () Bool)

(assert (=> b!605579 m!582445))

(declare-fun m!582447 () Bool)

(assert (=> d!87609 m!582447))

(declare-fun m!582449 () Bool)

(assert (=> d!87609 m!582449))

(assert (=> d!87609 m!582213))

(assert (=> d!87609 m!582217))

(assert (=> b!605331 d!87609))

(declare-fun d!87623 () Bool)

(declare-fun res!389111 () Bool)

(declare-fun e!346613 () Bool)

(assert (=> d!87623 (=> res!389111 e!346613)))

(assert (=> d!87623 (= res!389111 (= (select (arr!17877 lt!276204) index!984) (select (arr!17877 a!2986) j!136)))))

(assert (=> d!87623 (= (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) index!984) e!346613)))

(declare-fun b!605583 () Bool)

(declare-fun e!346614 () Bool)

(assert (=> b!605583 (= e!346613 e!346614)))

(declare-fun res!389112 () Bool)

(assert (=> b!605583 (=> (not res!389112) (not e!346614))))

(assert (=> b!605583 (= res!389112 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18241 lt!276204)))))

(declare-fun b!605584 () Bool)

(assert (=> b!605584 (= e!346614 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87623 (not res!389111)) b!605583))

(assert (= (and b!605583 res!389112) b!605584))

(declare-fun m!582451 () Bool)

(assert (=> d!87623 m!582451))

(assert (=> b!605584 m!582197))

(declare-fun m!582453 () Bool)

(assert (=> b!605584 m!582453))

(assert (=> b!605335 d!87623))

(declare-fun d!87625 () Bool)

(assert (=> d!87625 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605334 d!87625))

(declare-fun b!605619 () Bool)

(declare-fun e!346639 () Bool)

(declare-fun e!346640 () Bool)

(assert (=> b!605619 (= e!346639 e!346640)))

(declare-fun c!68613 () Bool)

(assert (=> b!605619 (= c!68613 (validKeyInArray!0 (select (arr!17877 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605620 () Bool)

(declare-fun call!33048 () Bool)

(assert (=> b!605620 (= e!346640 call!33048)))

(declare-fun d!87627 () Bool)

(declare-fun res!389129 () Bool)

(declare-fun e!346641 () Bool)

(assert (=> d!87627 (=> res!389129 e!346641)))

(assert (=> d!87627 (= res!389129 (bvsge #b00000000000000000000000000000000 (size!18241 a!2986)))))

(assert (=> d!87627 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11915) e!346641)))

(declare-fun b!605621 () Bool)

(assert (=> b!605621 (= e!346641 e!346639)))

(declare-fun res!389127 () Bool)

(assert (=> b!605621 (=> (not res!389127) (not e!346639))))

(declare-fun e!346642 () Bool)

(assert (=> b!605621 (= res!389127 (not e!346642))))

(declare-fun res!389128 () Bool)

(assert (=> b!605621 (=> (not res!389128) (not e!346642))))

(assert (=> b!605621 (= res!389128 (validKeyInArray!0 (select (arr!17877 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33045 () Bool)

(assert (=> bm!33045 (= call!33048 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68613 (Cons!11914 (select (arr!17877 a!2986) #b00000000000000000000000000000000) Nil!11915) Nil!11915)))))

(declare-fun b!605622 () Bool)

(assert (=> b!605622 (= e!346640 call!33048)))

(declare-fun b!605623 () Bool)

(declare-fun contains!2996 (List!11918 (_ BitVec 64)) Bool)

(assert (=> b!605623 (= e!346642 (contains!2996 Nil!11915 (select (arr!17877 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87627 (not res!389129)) b!605621))

(assert (= (and b!605621 res!389128) b!605623))

(assert (= (and b!605621 res!389127) b!605619))

(assert (= (and b!605619 c!68613) b!605620))

(assert (= (and b!605619 (not c!68613)) b!605622))

(assert (= (or b!605620 b!605622) bm!33045))

(declare-fun m!582471 () Bool)

(assert (=> b!605619 m!582471))

(assert (=> b!605619 m!582471))

(declare-fun m!582473 () Bool)

(assert (=> b!605619 m!582473))

(assert (=> b!605621 m!582471))

(assert (=> b!605621 m!582471))

(assert (=> b!605621 m!582473))

(assert (=> bm!33045 m!582471))

(declare-fun m!582475 () Bool)

(assert (=> bm!33045 m!582475))

(assert (=> b!605623 m!582471))

(assert (=> b!605623 m!582471))

(declare-fun m!582477 () Bool)

(assert (=> b!605623 m!582477))

(assert (=> b!605333 d!87627))

(declare-fun b!605630 () Bool)

(declare-fun c!68619 () Bool)

(declare-fun lt!276348 () (_ BitVec 64))

(assert (=> b!605630 (= c!68619 (= lt!276348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346647 () SeekEntryResult!6317)

(declare-fun e!346646 () SeekEntryResult!6317)

(assert (=> b!605630 (= e!346647 e!346646)))

(declare-fun b!605632 () Bool)

(assert (=> b!605632 (= e!346646 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276207 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605633 () Bool)

(declare-fun e!346648 () SeekEntryResult!6317)

(assert (=> b!605633 (= e!346648 Undefined!6317)))

(declare-fun b!605634 () Bool)

(assert (=> b!605634 (= e!346648 e!346647)))

(declare-fun c!68617 () Bool)

(assert (=> b!605634 (= c!68617 (= lt!276348 (select (arr!17877 a!2986) j!136)))))

(declare-fun b!605635 () Bool)

(assert (=> b!605635 (= e!346647 (Found!6317 lt!276207))))

(declare-fun b!605631 () Bool)

(assert (=> b!605631 (= e!346646 (MissingVacant!6317 vacantSpotIndex!68))))

(declare-fun lt!276349 () SeekEntryResult!6317)

(declare-fun d!87635 () Bool)

(assert (=> d!87635 (and (or (is-Undefined!6317 lt!276349) (not (is-Found!6317 lt!276349)) (and (bvsge (index!27535 lt!276349) #b00000000000000000000000000000000) (bvslt (index!27535 lt!276349) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276349) (is-Found!6317 lt!276349) (not (is-MissingVacant!6317 lt!276349)) (not (= (index!27537 lt!276349) vacantSpotIndex!68)) (and (bvsge (index!27537 lt!276349) #b00000000000000000000000000000000) (bvslt (index!27537 lt!276349) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276349) (ite (is-Found!6317 lt!276349) (= (select (arr!17877 a!2986) (index!27535 lt!276349)) (select (arr!17877 a!2986) j!136)) (and (is-MissingVacant!6317 lt!276349) (= (index!27537 lt!276349) vacantSpotIndex!68) (= (select (arr!17877 a!2986) (index!27537 lt!276349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87635 (= lt!276349 e!346648)))

(declare-fun c!68618 () Bool)

(assert (=> d!87635 (= c!68618 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87635 (= lt!276348 (select (arr!17877 a!2986) lt!276207))))

(assert (=> d!87635 (validMask!0 mask!3053)))

(assert (=> d!87635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053) lt!276349)))

(assert (= (and d!87635 c!68618) b!605633))

(assert (= (and d!87635 (not c!68618)) b!605634))

(assert (= (and b!605634 c!68617) b!605635))

(assert (= (and b!605634 (not c!68617)) b!605630))

(assert (= (and b!605630 c!68619) b!605631))

(assert (= (and b!605630 (not c!68619)) b!605632))

(declare-fun m!582493 () Bool)

(assert (=> b!605632 m!582493))

(assert (=> b!605632 m!582493))

(assert (=> b!605632 m!582197))

(declare-fun m!582495 () Bool)

(assert (=> b!605632 m!582495))

(declare-fun m!582497 () Bool)

(assert (=> d!87635 m!582497))

(declare-fun m!582499 () Bool)

(assert (=> d!87635 m!582499))

(declare-fun m!582501 () Bool)

(assert (=> d!87635 m!582501))

(assert (=> d!87635 m!582217))

(assert (=> b!605348 d!87635))

(declare-fun b!605636 () Bool)

(declare-fun c!68622 () Bool)

(declare-fun lt!276350 () (_ BitVec 64))

(assert (=> b!605636 (= c!68622 (= lt!276350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346650 () SeekEntryResult!6317)

(declare-fun e!346649 () SeekEntryResult!6317)

(assert (=> b!605636 (= e!346650 e!346649)))

(declare-fun b!605638 () Bool)

(assert (=> b!605638 (= e!346649 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276208 lt!276204 mask!3053))))

(declare-fun b!605639 () Bool)

(declare-fun e!346651 () SeekEntryResult!6317)

(assert (=> b!605639 (= e!346651 Undefined!6317)))

(declare-fun b!605640 () Bool)

(assert (=> b!605640 (= e!346651 e!346650)))

(declare-fun c!68620 () Bool)

(assert (=> b!605640 (= c!68620 (= lt!276350 lt!276208))))

(declare-fun b!605641 () Bool)

(assert (=> b!605641 (= e!346650 (Found!6317 index!984))))

(declare-fun b!605637 () Bool)

(assert (=> b!605637 (= e!346649 (MissingVacant!6317 vacantSpotIndex!68))))

(declare-fun d!87639 () Bool)

(declare-fun lt!276351 () SeekEntryResult!6317)

(assert (=> d!87639 (and (or (is-Undefined!6317 lt!276351) (not (is-Found!6317 lt!276351)) (and (bvsge (index!27535 lt!276351) #b00000000000000000000000000000000) (bvslt (index!27535 lt!276351) (size!18241 lt!276204)))) (or (is-Undefined!6317 lt!276351) (is-Found!6317 lt!276351) (not (is-MissingVacant!6317 lt!276351)) (not (= (index!27537 lt!276351) vacantSpotIndex!68)) (and (bvsge (index!27537 lt!276351) #b00000000000000000000000000000000) (bvslt (index!27537 lt!276351) (size!18241 lt!276204)))) (or (is-Undefined!6317 lt!276351) (ite (is-Found!6317 lt!276351) (= (select (arr!17877 lt!276204) (index!27535 lt!276351)) lt!276208) (and (is-MissingVacant!6317 lt!276351) (= (index!27537 lt!276351) vacantSpotIndex!68) (= (select (arr!17877 lt!276204) (index!27537 lt!276351)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87639 (= lt!276351 e!346651)))

(declare-fun c!68621 () Bool)

(assert (=> d!87639 (= c!68621 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87639 (= lt!276350 (select (arr!17877 lt!276204) index!984))))

(assert (=> d!87639 (validMask!0 mask!3053)))

(assert (=> d!87639 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276208 lt!276204 mask!3053) lt!276351)))

(assert (= (and d!87639 c!68621) b!605639))

(assert (= (and d!87639 (not c!68621)) b!605640))

(assert (= (and b!605640 c!68620) b!605641))

(assert (= (and b!605640 (not c!68620)) b!605636))

(assert (= (and b!605636 c!68622) b!605637))

(assert (= (and b!605636 (not c!68622)) b!605638))

(assert (=> b!605638 m!582193))

(assert (=> b!605638 m!582193))

(declare-fun m!582503 () Bool)

(assert (=> b!605638 m!582503))

(declare-fun m!582505 () Bool)

(assert (=> d!87639 m!582505))

(declare-fun m!582507 () Bool)

(assert (=> d!87639 m!582507))

(assert (=> d!87639 m!582451))

(assert (=> d!87639 m!582217))

(assert (=> b!605348 d!87639))

(declare-fun d!87641 () Bool)

(declare-fun e!346678 () Bool)

(assert (=> d!87641 e!346678))

(declare-fun res!389149 () Bool)

(assert (=> d!87641 (=> (not res!389149) (not e!346678))))

(assert (=> d!87641 (= res!389149 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18241 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18241 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18241 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18241 a!2986))))))

(declare-fun lt!276365 () Unit!19282)

(declare-fun choose!9 (array!37244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19282)

(assert (=> d!87641 (= lt!276365 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87641 (validMask!0 mask!3053)))

(assert (=> d!87641 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 mask!3053) lt!276365)))

(declare-fun b!605675 () Bool)

(assert (=> b!605675 (= e!346678 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 (select (arr!17877 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 (select (store (arr!17877 a!2986) i!1108 k!1786) j!136) (array!37245 (store (arr!17877 a!2986) i!1108 k!1786) (size!18241 a!2986)) mask!3053)))))

(assert (= (and d!87641 res!389149) b!605675))

(declare-fun m!582539 () Bool)

(assert (=> d!87641 m!582539))

(assert (=> d!87641 m!582217))

(assert (=> b!605675 m!582195))

(declare-fun m!582541 () Bool)

(assert (=> b!605675 m!582541))

(assert (=> b!605675 m!582197))

(assert (=> b!605675 m!582197))

(assert (=> b!605675 m!582199))

(assert (=> b!605675 m!582195))

(assert (=> b!605675 m!582201))

(assert (=> b!605348 d!87641))

(declare-fun d!87657 () Bool)

(declare-fun lt!276372 () (_ BitVec 32))

(assert (=> d!87657 (and (bvsge lt!276372 #b00000000000000000000000000000000) (bvslt lt!276372 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87657 (= lt!276372 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87657 (validMask!0 mask!3053)))

(assert (=> d!87657 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276372)))

(declare-fun bs!18524 () Bool)

(assert (= bs!18524 d!87657))

(declare-fun m!582543 () Bool)

(assert (=> bs!18524 m!582543))

(assert (=> bs!18524 m!582217))

(assert (=> b!605348 d!87657))

(declare-fun b!605688 () Bool)

(declare-fun c!68638 () Bool)

(declare-fun lt!276373 () (_ BitVec 64))

(assert (=> b!605688 (= c!68638 (= lt!276373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346686 () SeekEntryResult!6317)

(declare-fun e!346685 () SeekEntryResult!6317)

(assert (=> b!605688 (= e!346686 e!346685)))

(declare-fun b!605690 () Bool)

(assert (=> b!605690 (= e!346685 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276207 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276208 lt!276204 mask!3053))))

(declare-fun b!605691 () Bool)

(declare-fun e!346687 () SeekEntryResult!6317)

(assert (=> b!605691 (= e!346687 Undefined!6317)))

(declare-fun b!605692 () Bool)

(assert (=> b!605692 (= e!346687 e!346686)))

(declare-fun c!68636 () Bool)

(assert (=> b!605692 (= c!68636 (= lt!276373 lt!276208))))

(declare-fun b!605693 () Bool)

(assert (=> b!605693 (= e!346686 (Found!6317 lt!276207))))

(declare-fun b!605689 () Bool)

(assert (=> b!605689 (= e!346685 (MissingVacant!6317 vacantSpotIndex!68))))

(declare-fun lt!276374 () SeekEntryResult!6317)

(declare-fun d!87659 () Bool)

(assert (=> d!87659 (and (or (is-Undefined!6317 lt!276374) (not (is-Found!6317 lt!276374)) (and (bvsge (index!27535 lt!276374) #b00000000000000000000000000000000) (bvslt (index!27535 lt!276374) (size!18241 lt!276204)))) (or (is-Undefined!6317 lt!276374) (is-Found!6317 lt!276374) (not (is-MissingVacant!6317 lt!276374)) (not (= (index!27537 lt!276374) vacantSpotIndex!68)) (and (bvsge (index!27537 lt!276374) #b00000000000000000000000000000000) (bvslt (index!27537 lt!276374) (size!18241 lt!276204)))) (or (is-Undefined!6317 lt!276374) (ite (is-Found!6317 lt!276374) (= (select (arr!17877 lt!276204) (index!27535 lt!276374)) lt!276208) (and (is-MissingVacant!6317 lt!276374) (= (index!27537 lt!276374) vacantSpotIndex!68) (= (select (arr!17877 lt!276204) (index!27537 lt!276374)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87659 (= lt!276374 e!346687)))

(declare-fun c!68637 () Bool)

(assert (=> d!87659 (= c!68637 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87659 (= lt!276373 (select (arr!17877 lt!276204) lt!276207))))

(assert (=> d!87659 (validMask!0 mask!3053)))

(assert (=> d!87659 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276207 vacantSpotIndex!68 lt!276208 lt!276204 mask!3053) lt!276374)))

(assert (= (and d!87659 c!68637) b!605691))

(assert (= (and d!87659 (not c!68637)) b!605692))

(assert (= (and b!605692 c!68636) b!605693))

(assert (= (and b!605692 (not c!68636)) b!605688))

(assert (= (and b!605688 c!68638) b!605689))

(assert (= (and b!605688 (not c!68638)) b!605690))

(assert (=> b!605690 m!582493))

(assert (=> b!605690 m!582493))

(declare-fun m!582545 () Bool)

(assert (=> b!605690 m!582545))

(declare-fun m!582547 () Bool)

(assert (=> d!87659 m!582547))

(declare-fun m!582549 () Bool)

(assert (=> d!87659 m!582549))

(declare-fun m!582551 () Bool)

(assert (=> d!87659 m!582551))

(assert (=> d!87659 m!582217))

(assert (=> b!605348 d!87659))

(declare-fun b!605749 () Bool)

(declare-fun e!346720 () SeekEntryResult!6317)

(declare-fun lt!276405 () SeekEntryResult!6317)

(assert (=> b!605749 (= e!346720 (MissingZero!6317 (index!27536 lt!276405)))))

(declare-fun b!605750 () Bool)

(declare-fun e!346719 () SeekEntryResult!6317)

(assert (=> b!605750 (= e!346719 (Found!6317 (index!27536 lt!276405)))))

(declare-fun d!87661 () Bool)

(declare-fun lt!276403 () SeekEntryResult!6317)

(assert (=> d!87661 (and (or (is-Undefined!6317 lt!276403) (not (is-Found!6317 lt!276403)) (and (bvsge (index!27535 lt!276403) #b00000000000000000000000000000000) (bvslt (index!27535 lt!276403) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276403) (is-Found!6317 lt!276403) (not (is-MissingZero!6317 lt!276403)) (and (bvsge (index!27534 lt!276403) #b00000000000000000000000000000000) (bvslt (index!27534 lt!276403) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276403) (is-Found!6317 lt!276403) (is-MissingZero!6317 lt!276403) (not (is-MissingVacant!6317 lt!276403)) (and (bvsge (index!27537 lt!276403) #b00000000000000000000000000000000) (bvslt (index!27537 lt!276403) (size!18241 a!2986)))) (or (is-Undefined!6317 lt!276403) (ite (is-Found!6317 lt!276403) (= (select (arr!17877 a!2986) (index!27535 lt!276403)) k!1786) (ite (is-MissingZero!6317 lt!276403) (= (select (arr!17877 a!2986) (index!27534 lt!276403)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6317 lt!276403) (= (select (arr!17877 a!2986) (index!27537 lt!276403)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!346721 () SeekEntryResult!6317)

(assert (=> d!87661 (= lt!276403 e!346721)))

(declare-fun c!68664 () Bool)

(assert (=> d!87661 (= c!68664 (and (is-Intermediate!6317 lt!276405) (undefined!7129 lt!276405)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37244 (_ BitVec 32)) SeekEntryResult!6317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87661 (= lt!276405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87661 (validMask!0 mask!3053)))

(assert (=> d!87661 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!276403)))

(declare-fun b!605751 () Bool)

(assert (=> b!605751 (= e!346721 e!346719)))

(declare-fun lt!276404 () (_ BitVec 64))

(assert (=> b!605751 (= lt!276404 (select (arr!17877 a!2986) (index!27536 lt!276405)))))

(declare-fun c!68663 () Bool)

(assert (=> b!605751 (= c!68663 (= lt!276404 k!1786))))

(declare-fun b!605752 () Bool)

(assert (=> b!605752 (= e!346720 (seekKeyOrZeroReturnVacant!0 (x!56335 lt!276405) (index!27536 lt!276405) (index!27536 lt!276405) k!1786 a!2986 mask!3053))))

(declare-fun b!605753 () Bool)

(declare-fun c!68665 () Bool)

(assert (=> b!605753 (= c!68665 (= lt!276404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605753 (= e!346719 e!346720)))

(declare-fun b!605754 () Bool)

(assert (=> b!605754 (= e!346721 Undefined!6317)))

(assert (= (and d!87661 c!68664) b!605754))

(assert (= (and d!87661 (not c!68664)) b!605751))

(assert (= (and b!605751 c!68663) b!605750))

(assert (= (and b!605751 (not c!68663)) b!605753))

(assert (= (and b!605753 c!68665) b!605749))

(assert (= (and b!605753 (not c!68665)) b!605752))

(declare-fun m!582605 () Bool)

(assert (=> d!87661 m!582605))

(assert (=> d!87661 m!582217))

(declare-fun m!582607 () Bool)

(assert (=> d!87661 m!582607))

(declare-fun m!582609 () Bool)

(assert (=> d!87661 m!582609))

(declare-fun m!582611 () Bool)

(assert (=> d!87661 m!582611))

(assert (=> d!87661 m!582605))

(declare-fun m!582613 () Bool)

(assert (=> d!87661 m!582613))

(declare-fun m!582615 () Bool)

(assert (=> b!605751 m!582615))

(declare-fun m!582617 () Bool)

(assert (=> b!605752 m!582617))

(assert (=> b!605337 d!87661))

(declare-fun bm!33055 () Bool)

(declare-fun call!33058 () Bool)

(assert (=> bm!33055 (= call!33058 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!605775 () Bool)

(declare-fun e!346739 () Bool)

(declare-fun e!346738 () Bool)

(assert (=> b!605775 (= e!346739 e!346738)))

(declare-fun c!68671 () Bool)

(assert (=> b!605775 (= c!68671 (validKeyInArray!0 (select (arr!17877 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605776 () Bool)

(assert (=> b!605776 (= e!346738 call!33058)))

(declare-fun d!87683 () Bool)

(declare-fun res!389167 () Bool)

(assert (=> d!87683 (=> res!389167 e!346739)))

(assert (=> d!87683 (= res!389167 (bvsge #b00000000000000000000000000000000 (size!18241 a!2986)))))

(assert (=> d!87683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346739)))

(declare-fun b!605777 () Bool)

(declare-fun e!346737 () Bool)

(assert (=> b!605777 (= e!346738 e!346737)))

(declare-fun lt!276423 () (_ BitVec 64))

(assert (=> b!605777 (= lt!276423 (select (arr!17877 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276421 () Unit!19282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37244 (_ BitVec 64) (_ BitVec 32)) Unit!19282)

(assert (=> b!605777 (= lt!276421 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276423 #b00000000000000000000000000000000))))

(assert (=> b!605777 (arrayContainsKey!0 a!2986 lt!276423 #b00000000000000000000000000000000)))

(declare-fun lt!276422 () Unit!19282)

(assert (=> b!605777 (= lt!276422 lt!276421)))

(declare-fun res!389168 () Bool)

(assert (=> b!605777 (= res!389168 (= (seekEntryOrOpen!0 (select (arr!17877 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6317 #b00000000000000000000000000000000)))))

(assert (=> b!605777 (=> (not res!389168) (not e!346737))))

(declare-fun b!605778 () Bool)

(assert (=> b!605778 (= e!346737 call!33058)))

(assert (= (and d!87683 (not res!389167)) b!605775))

(assert (= (and b!605775 c!68671) b!605777))

(assert (= (and b!605775 (not c!68671)) b!605776))

(assert (= (and b!605777 res!389168) b!605778))

(assert (= (or b!605778 b!605776) bm!33055))

(declare-fun m!582627 () Bool)

(assert (=> bm!33055 m!582627))

(assert (=> b!605775 m!582471))

(assert (=> b!605775 m!582471))

(assert (=> b!605775 m!582473))

(assert (=> b!605777 m!582471))

(declare-fun m!582629 () Bool)

(assert (=> b!605777 m!582629))

(declare-fun m!582631 () Bool)

(assert (=> b!605777 m!582631))

(assert (=> b!605777 m!582471))

(declare-fun m!582635 () Bool)

(assert (=> b!605777 m!582635))

(assert (=> b!605347 d!87683))

(assert (=> b!605340 d!87623))

(declare-fun d!87689 () Bool)

(declare-fun res!389171 () Bool)

(declare-fun e!346742 () Bool)

(assert (=> d!87689 (=> res!389171 e!346742)))

(assert (=> d!87689 (= res!389171 (= (select (arr!17877 lt!276204) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17877 a!2986) j!136)))))

(assert (=> d!87689 (= (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346742)))

(declare-fun b!605781 () Bool)

(declare-fun e!346743 () Bool)

(assert (=> b!605781 (= e!346742 e!346743)))

(declare-fun res!389172 () Bool)

(assert (=> b!605781 (=> (not res!389172) (not e!346743))))

(assert (=> b!605781 (= res!389172 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18241 lt!276204)))))

(declare-fun b!605782 () Bool)

(assert (=> b!605782 (= e!346743 (arrayContainsKey!0 lt!276204 (select (arr!17877 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87689 (not res!389171)) b!605781))

(assert (= (and b!605781 res!389172) b!605782))

(declare-fun m!582639 () Bool)

(assert (=> d!87689 m!582639))

(assert (=> b!605782 m!582197))

(declare-fun m!582641 () Bool)

(assert (=> b!605782 m!582641))

(assert (=> b!605351 d!87689))

(declare-fun b!605783 () Bool)

(declare-fun e!346744 () Bool)

(declare-fun e!346745 () Bool)

(assert (=> b!605783 (= e!346744 e!346745)))

(declare-fun c!68672 () Bool)

(assert (=> b!605783 (= c!68672 (validKeyInArray!0 (select (arr!17877 lt!276204) j!136)))))

(declare-fun b!605784 () Bool)

(declare-fun call!33059 () Bool)

(assert (=> b!605784 (= e!346745 call!33059)))

(declare-fun d!87693 () Bool)

(declare-fun res!389175 () Bool)

(declare-fun e!346746 () Bool)

(assert (=> d!87693 (=> res!389175 e!346746)))

(assert (=> d!87693 (= res!389175 (bvsge j!136 (size!18241 lt!276204)))))

(assert (=> d!87693 (= (arrayNoDuplicates!0 lt!276204 j!136 Nil!11915) e!346746)))

(declare-fun b!605785 () Bool)

(assert (=> b!605785 (= e!346746 e!346744)))

(declare-fun res!389173 () Bool)

(assert (=> b!605785 (=> (not res!389173) (not e!346744))))

(declare-fun e!346747 () Bool)

(assert (=> b!605785 (= res!389173 (not e!346747))))

(declare-fun res!389174 () Bool)

(assert (=> b!605785 (=> (not res!389174) (not e!346747))))

(assert (=> b!605785 (= res!389174 (validKeyInArray!0 (select (arr!17877 lt!276204) j!136)))))

(declare-fun bm!33056 () Bool)

(assert (=> bm!33056 (= call!33059 (arrayNoDuplicates!0 lt!276204 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68672 (Cons!11914 (select (arr!17877 lt!276204) j!136) Nil!11915) Nil!11915)))))

(declare-fun b!605786 () Bool)

