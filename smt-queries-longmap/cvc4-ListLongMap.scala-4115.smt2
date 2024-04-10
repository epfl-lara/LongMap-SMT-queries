; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56192 () Bool)

(assert start!56192)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!357012 () Bool)

(declare-fun b!622425 () Bool)

(declare-datatypes ((array!37662 0))(
  ( (array!37663 (arr!18077 (Array (_ BitVec 32) (_ BitVec 64))) (size!18441 (_ BitVec 32))) )
))
(declare-fun lt!288378 () array!37662)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37662)

(declare-fun arrayContainsKey!0 (array!37662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622425 (= e!357012 (arrayContainsKey!0 lt!288378 (select (arr!18077 a!2986) j!136) index!984))))

(declare-fun b!622426 () Bool)

(declare-fun res!401131 () Bool)

(declare-fun e!357016 () Bool)

(assert (=> b!622426 (=> (not res!401131) (not e!357016))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!622426 (= res!401131 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622427 () Bool)

(declare-fun e!357017 () Bool)

(assert (=> b!622427 (= e!357017 (not true))))

(declare-datatypes ((Unit!20898 0))(
  ( (Unit!20899) )
))
(declare-fun lt!288386 () Unit!20898)

(declare-fun e!357008 () Unit!20898)

(assert (=> b!622427 (= lt!288386 e!357008)))

(declare-fun c!71021 () Bool)

(declare-datatypes ((SeekEntryResult!6517 0))(
  ( (MissingZero!6517 (index!28352 (_ BitVec 32))) (Found!6517 (index!28353 (_ BitVec 32))) (Intermediate!6517 (undefined!7329 Bool) (index!28354 (_ BitVec 32)) (x!57117 (_ BitVec 32))) (Undefined!6517) (MissingVacant!6517 (index!28355 (_ BitVec 32))) )
))
(declare-fun lt!288380 () SeekEntryResult!6517)

(assert (=> b!622427 (= c!71021 (= lt!288380 (Found!6517 index!984)))))

(declare-fun lt!288394 () Unit!20898)

(declare-fun e!357011 () Unit!20898)

(assert (=> b!622427 (= lt!288394 e!357011)))

(declare-fun c!71018 () Bool)

(assert (=> b!622427 (= c!71018 (= lt!288380 Undefined!6517))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!288384 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37662 (_ BitVec 32)) SeekEntryResult!6517)

(assert (=> b!622427 (= lt!288380 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288384 lt!288378 mask!3053))))

(declare-fun e!357006 () Bool)

(assert (=> b!622427 e!357006))

(declare-fun res!401134 () Bool)

(assert (=> b!622427 (=> (not res!401134) (not e!357006))))

(declare-fun lt!288392 () (_ BitVec 32))

(declare-fun lt!288390 () SeekEntryResult!6517)

(assert (=> b!622427 (= res!401134 (= lt!288390 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288392 vacantSpotIndex!68 lt!288384 lt!288378 mask!3053)))))

(assert (=> b!622427 (= lt!288390 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288392 vacantSpotIndex!68 (select (arr!18077 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!622427 (= lt!288384 (select (store (arr!18077 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288382 () Unit!20898)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37662 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20898)

(assert (=> b!622427 (= lt!288382 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288392 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622427 (= lt!288392 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622428 () Bool)

(declare-fun Unit!20900 () Unit!20898)

(assert (=> b!622428 (= e!357011 Unit!20900)))

(declare-fun b!622429 () Bool)

(declare-fun res!401130 () Bool)

(assert (=> b!622429 (= res!401130 (arrayContainsKey!0 lt!288378 (select (arr!18077 a!2986) j!136) j!136))))

(assert (=> b!622429 (=> (not res!401130) (not e!357012))))

(declare-fun e!357014 () Bool)

(assert (=> b!622429 (= e!357014 e!357012)))

(declare-fun b!622430 () Bool)

(declare-fun e!357015 () Bool)

(assert (=> b!622430 (= e!357015 e!357017)))

(declare-fun res!401127 () Bool)

(assert (=> b!622430 (=> (not res!401127) (not e!357017))))

(declare-fun lt!288389 () SeekEntryResult!6517)

(assert (=> b!622430 (= res!401127 (and (= lt!288389 (Found!6517 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18077 a!2986) index!984) (select (arr!18077 a!2986) j!136))) (not (= (select (arr!18077 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622430 (= lt!288389 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18077 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622431 () Bool)

(declare-fun Unit!20901 () Unit!20898)

(assert (=> b!622431 (= e!357008 Unit!20901)))

(declare-fun b!622432 () Bool)

(declare-fun res!401137 () Bool)

(declare-fun e!357007 () Bool)

(assert (=> b!622432 (=> (not res!401137) (not e!357007))))

(declare-datatypes ((List!12118 0))(
  ( (Nil!12115) (Cons!12114 (h!13159 (_ BitVec 64)) (t!18346 List!12118)) )
))
(declare-fun arrayNoDuplicates!0 (array!37662 (_ BitVec 32) List!12118) Bool)

(assert (=> b!622432 (= res!401137 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12115))))

(declare-fun b!622433 () Bool)

(assert (=> b!622433 false))

(declare-fun lt!288391 () Unit!20898)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37662 (_ BitVec 64) (_ BitVec 32) List!12118) Unit!20898)

(assert (=> b!622433 (= lt!288391 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288378 (select (arr!18077 a!2986) j!136) j!136 Nil!12115))))

(assert (=> b!622433 (arrayNoDuplicates!0 lt!288378 j!136 Nil!12115)))

(declare-fun lt!288381 () Unit!20898)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37662 (_ BitVec 32) (_ BitVec 32)) Unit!20898)

(assert (=> b!622433 (= lt!288381 (lemmaNoDuplicateFromThenFromBigger!0 lt!288378 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622433 (arrayNoDuplicates!0 lt!288378 #b00000000000000000000000000000000 Nil!12115)))

(declare-fun lt!288395 () Unit!20898)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12118) Unit!20898)

(assert (=> b!622433 (= lt!288395 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12115))))

(assert (=> b!622433 (arrayContainsKey!0 lt!288378 (select (arr!18077 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288393 () Unit!20898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20898)

(assert (=> b!622433 (= lt!288393 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288378 (select (arr!18077 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357005 () Unit!20898)

(declare-fun Unit!20902 () Unit!20898)

(assert (=> b!622433 (= e!357005 Unit!20902)))

(declare-fun b!622434 () Bool)

(declare-fun res!401136 () Bool)

(assert (=> b!622434 (=> (not res!401136) (not e!357016))))

(assert (=> b!622434 (= res!401136 (and (= (size!18441 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18441 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18441 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622435 () Bool)

(assert (=> b!622435 (= e!357006 (= lt!288389 lt!288390))))

(declare-fun b!622436 () Bool)

(declare-fun res!401128 () Bool)

(assert (=> b!622436 (=> (not res!401128) (not e!357007))))

(assert (=> b!622436 (= res!401128 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18077 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622437 () Bool)

(declare-fun e!357010 () Unit!20898)

(declare-fun Unit!20903 () Unit!20898)

(assert (=> b!622437 (= e!357010 Unit!20903)))

(declare-fun res!401133 () Bool)

(assert (=> start!56192 (=> (not res!401133) (not e!357016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56192 (= res!401133 (validMask!0 mask!3053))))

(assert (=> start!56192 e!357016))

(assert (=> start!56192 true))

(declare-fun array_inv!13873 (array!37662) Bool)

(assert (=> start!56192 (array_inv!13873 a!2986)))

(declare-fun b!622438 () Bool)

(declare-fun res!401132 () Bool)

(assert (=> b!622438 (= res!401132 (bvsge j!136 index!984))))

(assert (=> b!622438 (=> res!401132 e!357014)))

(declare-fun e!357013 () Bool)

(assert (=> b!622438 (= e!357013 e!357014)))

(declare-fun b!622439 () Bool)

(assert (=> b!622439 (= e!357007 e!357015)))

(declare-fun res!401135 () Bool)

(assert (=> b!622439 (=> (not res!401135) (not e!357015))))

(assert (=> b!622439 (= res!401135 (= (select (store (arr!18077 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622439 (= lt!288378 (array!37663 (store (arr!18077 a!2986) i!1108 k!1786) (size!18441 a!2986)))))

(declare-fun b!622440 () Bool)

(assert (=> b!622440 (= e!357016 e!357007)))

(declare-fun res!401125 () Bool)

(assert (=> b!622440 (=> (not res!401125) (not e!357007))))

(declare-fun lt!288388 () SeekEntryResult!6517)

(assert (=> b!622440 (= res!401125 (or (= lt!288388 (MissingZero!6517 i!1108)) (= lt!288388 (MissingVacant!6517 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37662 (_ BitVec 32)) SeekEntryResult!6517)

(assert (=> b!622440 (= lt!288388 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622441 () Bool)

(declare-fun res!401123 () Bool)

(assert (=> b!622441 (=> (not res!401123) (not e!357016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622441 (= res!401123 (validKeyInArray!0 k!1786))))

(declare-fun b!622442 () Bool)

(declare-fun res!401124 () Bool)

(assert (=> b!622442 (=> (not res!401124) (not e!357016))))

(assert (=> b!622442 (= res!401124 (validKeyInArray!0 (select (arr!18077 a!2986) j!136)))))

(declare-fun b!622443 () Bool)

(declare-fun Unit!20904 () Unit!20898)

(assert (=> b!622443 (= e!357008 Unit!20904)))

(declare-fun res!401138 () Bool)

(assert (=> b!622443 (= res!401138 (= (select (store (arr!18077 a!2986) i!1108 k!1786) index!984) (select (arr!18077 a!2986) j!136)))))

(assert (=> b!622443 (=> (not res!401138) (not e!357013))))

(assert (=> b!622443 e!357013))

(declare-fun c!71020 () Bool)

(assert (=> b!622443 (= c!71020 (bvslt j!136 index!984))))

(declare-fun lt!288397 () Unit!20898)

(assert (=> b!622443 (= lt!288397 e!357005)))

(declare-fun c!71019 () Bool)

(assert (=> b!622443 (= c!71019 (bvslt index!984 j!136))))

(declare-fun lt!288385 () Unit!20898)

(assert (=> b!622443 (= lt!288385 e!357010)))

(assert (=> b!622443 false))

(declare-fun b!622444 () Bool)

(declare-fun Unit!20905 () Unit!20898)

(assert (=> b!622444 (= e!357005 Unit!20905)))

(declare-fun b!622445 () Bool)

(assert (=> b!622445 false))

(declare-fun lt!288387 () Unit!20898)

(assert (=> b!622445 (= lt!288387 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288378 (select (arr!18077 a!2986) j!136) index!984 Nil!12115))))

(assert (=> b!622445 (arrayNoDuplicates!0 lt!288378 index!984 Nil!12115)))

(declare-fun lt!288396 () Unit!20898)

(assert (=> b!622445 (= lt!288396 (lemmaNoDuplicateFromThenFromBigger!0 lt!288378 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622445 (arrayNoDuplicates!0 lt!288378 #b00000000000000000000000000000000 Nil!12115)))

(declare-fun lt!288379 () Unit!20898)

(assert (=> b!622445 (= lt!288379 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12115))))

(assert (=> b!622445 (arrayContainsKey!0 lt!288378 (select (arr!18077 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288383 () Unit!20898)

(assert (=> b!622445 (= lt!288383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288378 (select (arr!18077 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357018 () Bool)

(assert (=> b!622445 e!357018))

(declare-fun res!401126 () Bool)

(assert (=> b!622445 (=> (not res!401126) (not e!357018))))

(assert (=> b!622445 (= res!401126 (arrayContainsKey!0 lt!288378 (select (arr!18077 a!2986) j!136) j!136))))

(declare-fun Unit!20906 () Unit!20898)

(assert (=> b!622445 (= e!357010 Unit!20906)))

(declare-fun b!622446 () Bool)

(assert (=> b!622446 (= e!357018 (arrayContainsKey!0 lt!288378 (select (arr!18077 a!2986) j!136) index!984))))

(declare-fun b!622447 () Bool)

(declare-fun res!401129 () Bool)

(assert (=> b!622447 (=> (not res!401129) (not e!357007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37662 (_ BitVec 32)) Bool)

(assert (=> b!622447 (= res!401129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622448 () Bool)

(declare-fun Unit!20907 () Unit!20898)

(assert (=> b!622448 (= e!357011 Unit!20907)))

(assert (=> b!622448 false))

(assert (= (and start!56192 res!401133) b!622434))

(assert (= (and b!622434 res!401136) b!622442))

(assert (= (and b!622442 res!401124) b!622441))

(assert (= (and b!622441 res!401123) b!622426))

(assert (= (and b!622426 res!401131) b!622440))

(assert (= (and b!622440 res!401125) b!622447))

(assert (= (and b!622447 res!401129) b!622432))

(assert (= (and b!622432 res!401137) b!622436))

(assert (= (and b!622436 res!401128) b!622439))

(assert (= (and b!622439 res!401135) b!622430))

(assert (= (and b!622430 res!401127) b!622427))

(assert (= (and b!622427 res!401134) b!622435))

(assert (= (and b!622427 c!71018) b!622448))

(assert (= (and b!622427 (not c!71018)) b!622428))

(assert (= (and b!622427 c!71021) b!622443))

(assert (= (and b!622427 (not c!71021)) b!622431))

(assert (= (and b!622443 res!401138) b!622438))

(assert (= (and b!622438 (not res!401132)) b!622429))

(assert (= (and b!622429 res!401130) b!622425))

(assert (= (and b!622443 c!71020) b!622433))

(assert (= (and b!622443 (not c!71020)) b!622444))

(assert (= (and b!622443 c!71019) b!622445))

(assert (= (and b!622443 (not c!71019)) b!622437))

(assert (= (and b!622445 res!401126) b!622446))

(declare-fun m!598291 () Bool)

(assert (=> b!622439 m!598291))

(declare-fun m!598293 () Bool)

(assert (=> b!622439 m!598293))

(declare-fun m!598295 () Bool)

(assert (=> b!622432 m!598295))

(declare-fun m!598297 () Bool)

(assert (=> b!622441 m!598297))

(declare-fun m!598299 () Bool)

(assert (=> b!622430 m!598299))

(declare-fun m!598301 () Bool)

(assert (=> b!622430 m!598301))

(assert (=> b!622430 m!598301))

(declare-fun m!598303 () Bool)

(assert (=> b!622430 m!598303))

(assert (=> b!622446 m!598301))

(assert (=> b!622446 m!598301))

(declare-fun m!598305 () Bool)

(assert (=> b!622446 m!598305))

(declare-fun m!598307 () Bool)

(assert (=> b!622440 m!598307))

(assert (=> b!622442 m!598301))

(assert (=> b!622442 m!598301))

(declare-fun m!598309 () Bool)

(assert (=> b!622442 m!598309))

(declare-fun m!598311 () Bool)

(assert (=> b!622426 m!598311))

(declare-fun m!598313 () Bool)

(assert (=> start!56192 m!598313))

(declare-fun m!598315 () Bool)

(assert (=> start!56192 m!598315))

(declare-fun m!598317 () Bool)

(assert (=> b!622427 m!598317))

(declare-fun m!598319 () Bool)

(assert (=> b!622427 m!598319))

(assert (=> b!622427 m!598301))

(assert (=> b!622427 m!598291))

(declare-fun m!598321 () Bool)

(assert (=> b!622427 m!598321))

(declare-fun m!598323 () Bool)

(assert (=> b!622427 m!598323))

(declare-fun m!598325 () Bool)

(assert (=> b!622427 m!598325))

(assert (=> b!622427 m!598301))

(declare-fun m!598327 () Bool)

(assert (=> b!622427 m!598327))

(declare-fun m!598329 () Bool)

(assert (=> b!622436 m!598329))

(assert (=> b!622445 m!598301))

(declare-fun m!598331 () Bool)

(assert (=> b!622445 m!598331))

(declare-fun m!598333 () Bool)

(assert (=> b!622445 m!598333))

(declare-fun m!598335 () Bool)

(assert (=> b!622445 m!598335))

(assert (=> b!622445 m!598301))

(declare-fun m!598337 () Bool)

(assert (=> b!622445 m!598337))

(assert (=> b!622445 m!598301))

(declare-fun m!598339 () Bool)

(assert (=> b!622445 m!598339))

(assert (=> b!622445 m!598301))

(declare-fun m!598341 () Bool)

(assert (=> b!622445 m!598341))

(declare-fun m!598343 () Bool)

(assert (=> b!622445 m!598343))

(declare-fun m!598345 () Bool)

(assert (=> b!622445 m!598345))

(assert (=> b!622445 m!598301))

(declare-fun m!598347 () Bool)

(assert (=> b!622447 m!598347))

(assert (=> b!622443 m!598291))

(declare-fun m!598349 () Bool)

(assert (=> b!622443 m!598349))

(assert (=> b!622443 m!598301))

(assert (=> b!622429 m!598301))

(assert (=> b!622429 m!598301))

(assert (=> b!622429 m!598341))

(assert (=> b!622425 m!598301))

(assert (=> b!622425 m!598301))

(assert (=> b!622425 m!598305))

(declare-fun m!598351 () Bool)

(assert (=> b!622433 m!598351))

(assert (=> b!622433 m!598301))

(declare-fun m!598353 () Bool)

(assert (=> b!622433 m!598353))

(assert (=> b!622433 m!598301))

(declare-fun m!598355 () Bool)

(assert (=> b!622433 m!598355))

(assert (=> b!622433 m!598301))

(declare-fun m!598357 () Bool)

(assert (=> b!622433 m!598357))

(declare-fun m!598359 () Bool)

(assert (=> b!622433 m!598359))

(assert (=> b!622433 m!598343))

(assert (=> b!622433 m!598345))

(assert (=> b!622433 m!598301))

(push 1)

