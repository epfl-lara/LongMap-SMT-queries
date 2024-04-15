; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55884 () Bool)

(assert start!55884)

(declare-fun b!611370 () Bool)

(declare-fun e!350341 () Bool)

(declare-fun e!350342 () Bool)

(assert (=> b!611370 (= e!350341 e!350342)))

(declare-fun res!393233 () Bool)

(assert (=> b!611370 (=> (not res!393233) (not e!350342))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37368 0))(
  ( (array!37369 (arr!17930 (Array (_ BitVec 32) (_ BitVec 64))) (size!18295 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37368)

(declare-datatypes ((SeekEntryResult!6367 0))(
  ( (MissingZero!6367 (index!27752 (_ BitVec 32))) (Found!6367 (index!27753 (_ BitVec 32))) (Intermediate!6367 (undefined!7179 Bool) (index!27754 (_ BitVec 32)) (x!56578 (_ BitVec 32))) (Undefined!6367) (MissingVacant!6367 (index!27755 (_ BitVec 32))) )
))
(declare-fun lt!279608 () SeekEntryResult!6367)

(assert (=> b!611370 (= res!393233 (and (= lt!279608 (Found!6367 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17930 a!2986) index!984) (select (arr!17930 a!2986) j!136))) (not (= (select (arr!17930 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37368 (_ BitVec 32)) SeekEntryResult!6367)

(assert (=> b!611370 (= lt!279608 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611371 () Bool)

(declare-fun e!350346 () Bool)

(assert (=> b!611371 (= e!350346 e!350341)))

(declare-fun res!393226 () Bool)

(assert (=> b!611371 (=> (not res!393226) (not e!350341))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!611371 (= res!393226 (= (select (store (arr!17930 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!279609 () array!37368)

(assert (=> b!611371 (= lt!279609 (array!37369 (store (arr!17930 a!2986) i!1108 k0!1786) (size!18295 a!2986)))))

(declare-fun b!611372 () Bool)

(declare-datatypes ((Unit!19584 0))(
  ( (Unit!19585) )
))
(declare-fun e!350349 () Unit!19584)

(declare-fun Unit!19586 () Unit!19584)

(assert (=> b!611372 (= e!350349 Unit!19586)))

(declare-fun b!611373 () Bool)

(declare-fun e!350344 () Bool)

(declare-fun e!350343 () Bool)

(assert (=> b!611373 (= e!350344 e!350343)))

(declare-fun res!393224 () Bool)

(assert (=> b!611373 (=> res!393224 e!350343)))

(declare-fun lt!279604 () (_ BitVec 64))

(declare-fun lt!279598 () (_ BitVec 64))

(assert (=> b!611373 (= res!393224 (or (not (= (select (arr!17930 a!2986) j!136) lt!279598)) (not (= (select (arr!17930 a!2986) j!136) lt!279604)) (bvsge j!136 index!984)))))

(declare-fun b!611374 () Bool)

(declare-fun e!350345 () Unit!19584)

(declare-fun Unit!19587 () Unit!19584)

(assert (=> b!611374 (= e!350345 Unit!19587)))

(declare-fun e!350347 () Bool)

(declare-fun b!611375 () Bool)

(declare-fun arrayContainsKey!0 (array!37368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611375 (= e!350347 (arrayContainsKey!0 lt!279609 (select (arr!17930 a!2986) j!136) index!984))))

(declare-fun b!611376 () Bool)

(declare-fun e!350348 () Bool)

(assert (=> b!611376 (= e!350348 e!350346)))

(declare-fun res!393234 () Bool)

(assert (=> b!611376 (=> (not res!393234) (not e!350346))))

(declare-fun lt!279601 () SeekEntryResult!6367)

(assert (=> b!611376 (= res!393234 (or (= lt!279601 (MissingZero!6367 i!1108)) (= lt!279601 (MissingVacant!6367 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37368 (_ BitVec 32)) SeekEntryResult!6367)

(assert (=> b!611376 (= lt!279601 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611377 () Bool)

(declare-fun e!350352 () Bool)

(assert (=> b!611377 (= e!350352 (arrayContainsKey!0 lt!279609 (select (arr!17930 a!2986) j!136) index!984))))

(declare-fun b!611378 () Bool)

(declare-fun e!350350 () Bool)

(assert (=> b!611378 (= e!350350 true)))

(declare-datatypes ((List!12010 0))(
  ( (Nil!12007) (Cons!12006 (h!13051 (_ BitVec 64)) (t!18229 List!12010)) )
))
(declare-fun arrayNoDuplicates!0 (array!37368 (_ BitVec 32) List!12010) Bool)

(assert (=> b!611378 (arrayNoDuplicates!0 lt!279609 #b00000000000000000000000000000000 Nil!12007)))

(declare-fun lt!279603 () Unit!19584)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12010) Unit!19584)

(assert (=> b!611378 (= lt!279603 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12007))))

(assert (=> b!611378 (arrayContainsKey!0 lt!279609 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279602 () Unit!19584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19584)

(assert (=> b!611378 (= lt!279602 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279609 (select (arr!17930 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611378 e!350352))

(declare-fun res!393227 () Bool)

(assert (=> b!611378 (=> (not res!393227) (not e!350352))))

(assert (=> b!611378 (= res!393227 (arrayContainsKey!0 lt!279609 (select (arr!17930 a!2986) j!136) j!136))))

(declare-fun res!393223 () Bool)

(assert (=> start!55884 (=> (not res!393223) (not e!350348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55884 (= res!393223 (validMask!0 mask!3053))))

(assert (=> start!55884 e!350348))

(assert (=> start!55884 true))

(declare-fun array_inv!13813 (array!37368) Bool)

(assert (=> start!55884 (array_inv!13813 a!2986)))

(declare-fun b!611379 () Bool)

(declare-fun res!393230 () Bool)

(assert (=> b!611379 (=> (not res!393230) (not e!350348))))

(assert (=> b!611379 (= res!393230 (and (= (size!18295 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18295 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18295 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611380 () Bool)

(declare-fun e!350355 () Bool)

(assert (=> b!611380 (= e!350355 e!350350)))

(declare-fun res!393220 () Bool)

(assert (=> b!611380 (=> res!393220 e!350350)))

(assert (=> b!611380 (= res!393220 (bvsge index!984 j!136))))

(declare-fun lt!279605 () Unit!19584)

(assert (=> b!611380 (= lt!279605 e!350345)))

(declare-fun c!69444 () Bool)

(assert (=> b!611380 (= c!69444 (bvslt j!136 index!984))))

(declare-fun b!611381 () Bool)

(declare-fun res!393232 () Bool)

(assert (=> b!611381 (=> (not res!393232) (not e!350348))))

(assert (=> b!611381 (= res!393232 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611382 () Bool)

(declare-fun e!350353 () Bool)

(declare-fun lt!279607 () SeekEntryResult!6367)

(assert (=> b!611382 (= e!350353 (= lt!279608 lt!279607))))

(declare-fun b!611383 () Bool)

(declare-fun res!393229 () Bool)

(assert (=> b!611383 (=> (not res!393229) (not e!350348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611383 (= res!393229 (validKeyInArray!0 (select (arr!17930 a!2986) j!136)))))

(declare-fun b!611384 () Bool)

(declare-fun res!393222 () Bool)

(assert (=> b!611384 (=> (not res!393222) (not e!350346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37368 (_ BitVec 32)) Bool)

(assert (=> b!611384 (= res!393222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611385 () Bool)

(declare-fun res!393235 () Bool)

(assert (=> b!611385 (=> (not res!393235) (not e!350346))))

(assert (=> b!611385 (= res!393235 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12007))))

(declare-fun b!611386 () Bool)

(declare-fun Unit!19588 () Unit!19584)

(assert (=> b!611386 (= e!350349 Unit!19588)))

(assert (=> b!611386 false))

(declare-fun b!611387 () Bool)

(declare-fun res!393231 () Bool)

(assert (=> b!611387 (=> (not res!393231) (not e!350346))))

(assert (=> b!611387 (= res!393231 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17930 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611388 () Bool)

(assert (=> b!611388 (= e!350343 e!350347)))

(declare-fun res!393236 () Bool)

(assert (=> b!611388 (=> (not res!393236) (not e!350347))))

(assert (=> b!611388 (= res!393236 (arrayContainsKey!0 lt!279609 (select (arr!17930 a!2986) j!136) j!136))))

(declare-fun b!611389 () Bool)

(declare-fun e!350354 () Bool)

(assert (=> b!611389 (= e!350354 e!350355)))

(declare-fun res!393225 () Bool)

(assert (=> b!611389 (=> res!393225 e!350355)))

(assert (=> b!611389 (= res!393225 (or (not (= (select (arr!17930 a!2986) j!136) lt!279598)) (not (= (select (arr!17930 a!2986) j!136) lt!279604))))))

(assert (=> b!611389 e!350344))

(declare-fun res!393221 () Bool)

(assert (=> b!611389 (=> (not res!393221) (not e!350344))))

(assert (=> b!611389 (= res!393221 (= lt!279604 (select (arr!17930 a!2986) j!136)))))

(assert (=> b!611389 (= lt!279604 (select (store (arr!17930 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!611390 () Bool)

(declare-fun Unit!19589 () Unit!19584)

(assert (=> b!611390 (= e!350345 Unit!19589)))

(declare-fun lt!279594 () Unit!19584)

(assert (=> b!611390 (= lt!279594 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279609 (select (arr!17930 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611390 (arrayContainsKey!0 lt!279609 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279606 () Unit!19584)

(assert (=> b!611390 (= lt!279606 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12007))))

(assert (=> b!611390 (arrayNoDuplicates!0 lt!279609 #b00000000000000000000000000000000 Nil!12007)))

(declare-fun lt!279610 () Unit!19584)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37368 (_ BitVec 32) (_ BitVec 32)) Unit!19584)

(assert (=> b!611390 (= lt!279610 (lemmaNoDuplicateFromThenFromBigger!0 lt!279609 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611390 (arrayNoDuplicates!0 lt!279609 j!136 Nil!12007)))

(declare-fun lt!279600 () Unit!19584)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37368 (_ BitVec 64) (_ BitVec 32) List!12010) Unit!19584)

(assert (=> b!611390 (= lt!279600 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279609 (select (arr!17930 a!2986) j!136) j!136 Nil!12007))))

(assert (=> b!611390 false))

(declare-fun b!611391 () Bool)

(declare-fun res!393219 () Bool)

(assert (=> b!611391 (=> (not res!393219) (not e!350348))))

(assert (=> b!611391 (= res!393219 (validKeyInArray!0 k0!1786))))

(declare-fun b!611392 () Bool)

(assert (=> b!611392 (= e!350342 (not e!350354))))

(declare-fun res!393228 () Bool)

(assert (=> b!611392 (=> res!393228 e!350354)))

(declare-fun lt!279596 () SeekEntryResult!6367)

(assert (=> b!611392 (= res!393228 (not (= lt!279596 (Found!6367 index!984))))))

(declare-fun lt!279599 () Unit!19584)

(assert (=> b!611392 (= lt!279599 e!350349)))

(declare-fun c!69443 () Bool)

(assert (=> b!611392 (= c!69443 (= lt!279596 Undefined!6367))))

(assert (=> b!611392 (= lt!279596 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279598 lt!279609 mask!3053))))

(assert (=> b!611392 e!350353))

(declare-fun res!393218 () Bool)

(assert (=> b!611392 (=> (not res!393218) (not e!350353))))

(declare-fun lt!279595 () (_ BitVec 32))

(assert (=> b!611392 (= res!393218 (= lt!279607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279595 vacantSpotIndex!68 lt!279598 lt!279609 mask!3053)))))

(assert (=> b!611392 (= lt!279607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279595 vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611392 (= lt!279598 (select (store (arr!17930 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279597 () Unit!19584)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37368 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19584)

(assert (=> b!611392 (= lt!279597 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279595 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611392 (= lt!279595 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55884 res!393223) b!611379))

(assert (= (and b!611379 res!393230) b!611383))

(assert (= (and b!611383 res!393229) b!611391))

(assert (= (and b!611391 res!393219) b!611381))

(assert (= (and b!611381 res!393232) b!611376))

(assert (= (and b!611376 res!393234) b!611384))

(assert (= (and b!611384 res!393222) b!611385))

(assert (= (and b!611385 res!393235) b!611387))

(assert (= (and b!611387 res!393231) b!611371))

(assert (= (and b!611371 res!393226) b!611370))

(assert (= (and b!611370 res!393233) b!611392))

(assert (= (and b!611392 res!393218) b!611382))

(assert (= (and b!611392 c!69443) b!611386))

(assert (= (and b!611392 (not c!69443)) b!611372))

(assert (= (and b!611392 (not res!393228)) b!611389))

(assert (= (and b!611389 res!393221) b!611373))

(assert (= (and b!611373 (not res!393224)) b!611388))

(assert (= (and b!611388 res!393236) b!611375))

(assert (= (and b!611389 (not res!393225)) b!611380))

(assert (= (and b!611380 c!69444) b!611390))

(assert (= (and b!611380 (not c!69444)) b!611374))

(assert (= (and b!611380 (not res!393220)) b!611378))

(assert (= (and b!611378 res!393227) b!611377))

(declare-fun m!587275 () Bool)

(assert (=> b!611377 m!587275))

(assert (=> b!611377 m!587275))

(declare-fun m!587277 () Bool)

(assert (=> b!611377 m!587277))

(declare-fun m!587279 () Bool)

(assert (=> b!611384 m!587279))

(declare-fun m!587281 () Bool)

(assert (=> b!611381 m!587281))

(declare-fun m!587283 () Bool)

(assert (=> b!611376 m!587283))

(assert (=> b!611383 m!587275))

(assert (=> b!611383 m!587275))

(declare-fun m!587285 () Bool)

(assert (=> b!611383 m!587285))

(assert (=> b!611378 m!587275))

(assert (=> b!611378 m!587275))

(declare-fun m!587287 () Bool)

(assert (=> b!611378 m!587287))

(assert (=> b!611378 m!587275))

(declare-fun m!587289 () Bool)

(assert (=> b!611378 m!587289))

(declare-fun m!587291 () Bool)

(assert (=> b!611378 m!587291))

(assert (=> b!611378 m!587275))

(declare-fun m!587293 () Bool)

(assert (=> b!611378 m!587293))

(declare-fun m!587295 () Bool)

(assert (=> b!611378 m!587295))

(assert (=> b!611388 m!587275))

(assert (=> b!611388 m!587275))

(assert (=> b!611388 m!587293))

(assert (=> b!611375 m!587275))

(assert (=> b!611375 m!587275))

(assert (=> b!611375 m!587277))

(declare-fun m!587297 () Bool)

(assert (=> b!611371 m!587297))

(declare-fun m!587299 () Bool)

(assert (=> b!611371 m!587299))

(declare-fun m!587301 () Bool)

(assert (=> b!611391 m!587301))

(declare-fun m!587303 () Bool)

(assert (=> b!611392 m!587303))

(assert (=> b!611392 m!587297))

(assert (=> b!611392 m!587275))

(declare-fun m!587305 () Bool)

(assert (=> b!611392 m!587305))

(declare-fun m!587307 () Bool)

(assert (=> b!611392 m!587307))

(declare-fun m!587309 () Bool)

(assert (=> b!611392 m!587309))

(declare-fun m!587311 () Bool)

(assert (=> b!611392 m!587311))

(assert (=> b!611392 m!587275))

(declare-fun m!587313 () Bool)

(assert (=> b!611392 m!587313))

(declare-fun m!587315 () Bool)

(assert (=> b!611387 m!587315))

(assert (=> b!611389 m!587275))

(assert (=> b!611389 m!587297))

(declare-fun m!587317 () Bool)

(assert (=> b!611389 m!587317))

(declare-fun m!587319 () Bool)

(assert (=> b!611385 m!587319))

(declare-fun m!587321 () Bool)

(assert (=> b!611370 m!587321))

(assert (=> b!611370 m!587275))

(assert (=> b!611370 m!587275))

(declare-fun m!587323 () Bool)

(assert (=> b!611370 m!587323))

(declare-fun m!587325 () Bool)

(assert (=> start!55884 m!587325))

(declare-fun m!587327 () Bool)

(assert (=> start!55884 m!587327))

(assert (=> b!611373 m!587275))

(assert (=> b!611390 m!587275))

(declare-fun m!587329 () Bool)

(assert (=> b!611390 m!587329))

(declare-fun m!587331 () Bool)

(assert (=> b!611390 m!587331))

(assert (=> b!611390 m!587275))

(assert (=> b!611390 m!587291))

(assert (=> b!611390 m!587275))

(declare-fun m!587333 () Bool)

(assert (=> b!611390 m!587333))

(assert (=> b!611390 m!587275))

(declare-fun m!587335 () Bool)

(assert (=> b!611390 m!587335))

(declare-fun m!587337 () Bool)

(assert (=> b!611390 m!587337))

(assert (=> b!611390 m!587295))

(check-sat (not b!611376) (not b!611390) (not start!55884) (not b!611384) (not b!611388) (not b!611375) (not b!611370) (not b!611377) (not b!611378) (not b!611385) (not b!611381) (not b!611391) (not b!611383) (not b!611392))
(check-sat)
