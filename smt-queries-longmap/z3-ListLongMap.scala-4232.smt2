; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58386 () Bool)

(assert start!58386)

(declare-fun b!644298 () Bool)

(declare-datatypes ((Unit!21801 0))(
  ( (Unit!21802) )
))
(declare-fun e!369133 () Unit!21801)

(declare-fun Unit!21803 () Unit!21801)

(assert (=> b!644298 (= e!369133 Unit!21803)))

(assert (=> b!644298 false))

(declare-fun b!644299 () Bool)

(declare-fun e!369139 () Bool)

(declare-fun e!369131 () Bool)

(assert (=> b!644299 (= e!369139 e!369131)))

(declare-fun res!417337 () Bool)

(assert (=> b!644299 (=> res!417337 e!369131)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!298566 () (_ BitVec 64))

(declare-fun lt!298576 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38421 0))(
  ( (array!38422 (arr!18421 (Array (_ BitVec 32) (_ BitVec 64))) (size!18785 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38421)

(assert (=> b!644299 (= res!417337 (or (not (= (select (arr!18421 a!2986) j!136) lt!298576)) (not (= (select (arr!18421 a!2986) j!136) lt!298566)) (bvsge j!136 index!984)))))

(declare-fun b!644300 () Bool)

(declare-fun e!369136 () Bool)

(declare-fun e!369141 () Bool)

(assert (=> b!644300 (= e!369136 e!369141)))

(declare-fun res!417326 () Bool)

(assert (=> b!644300 (=> (not res!417326) (not e!369141))))

(declare-datatypes ((SeekEntryResult!6817 0))(
  ( (MissingZero!6817 (index!29600 (_ BitVec 32))) (Found!6817 (index!29601 (_ BitVec 32))) (Intermediate!6817 (undefined!7629 Bool) (index!29602 (_ BitVec 32)) (x!58524 (_ BitVec 32))) (Undefined!6817) (MissingVacant!6817 (index!29603 (_ BitVec 32))) )
))
(declare-fun lt!298574 () SeekEntryResult!6817)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644300 (= res!417326 (and (= lt!298574 (Found!6817 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18421 a!2986) index!984) (select (arr!18421 a!2986) j!136))) (not (= (select (arr!18421 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38421 (_ BitVec 32)) SeekEntryResult!6817)

(assert (=> b!644300 (= lt!298574 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18421 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644301 () Bool)

(declare-fun e!369129 () Bool)

(assert (=> b!644301 (= e!369129 e!369136)))

(declare-fun res!417335 () Bool)

(assert (=> b!644301 (=> (not res!417335) (not e!369136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!644301 (= res!417335 (= (select (store (arr!18421 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!298568 () array!38421)

(assert (=> b!644301 (= lt!298568 (array!38422 (store (arr!18421 a!2986) i!1108 k0!1786) (size!18785 a!2986)))))

(declare-fun b!644302 () Bool)

(declare-fun e!369128 () Bool)

(assert (=> b!644302 (= e!369141 (not e!369128))))

(declare-fun res!417329 () Bool)

(assert (=> b!644302 (=> res!417329 e!369128)))

(declare-fun lt!298565 () SeekEntryResult!6817)

(assert (=> b!644302 (= res!417329 (not (= lt!298565 (Found!6817 index!984))))))

(declare-fun lt!298577 () Unit!21801)

(assert (=> b!644302 (= lt!298577 e!369133)))

(declare-fun c!73858 () Bool)

(assert (=> b!644302 (= c!73858 (= lt!298565 Undefined!6817))))

(assert (=> b!644302 (= lt!298565 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298576 lt!298568 mask!3053))))

(declare-fun e!369137 () Bool)

(assert (=> b!644302 e!369137))

(declare-fun res!417333 () Bool)

(assert (=> b!644302 (=> (not res!417333) (not e!369137))))

(declare-fun lt!298571 () (_ BitVec 32))

(declare-fun lt!298569 () SeekEntryResult!6817)

(assert (=> b!644302 (= res!417333 (= lt!298569 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298571 vacantSpotIndex!68 lt!298576 lt!298568 mask!3053)))))

(assert (=> b!644302 (= lt!298569 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298571 vacantSpotIndex!68 (select (arr!18421 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644302 (= lt!298576 (select (store (arr!18421 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298567 () Unit!21801)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21801)

(assert (=> b!644302 (= lt!298567 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298571 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644302 (= lt!298571 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!644303 () Bool)

(declare-fun res!417324 () Bool)

(declare-fun e!369130 () Bool)

(assert (=> b!644303 (=> (not res!417324) (not e!369130))))

(declare-fun arrayContainsKey!0 (array!38421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644303 (= res!417324 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644304 () Bool)

(declare-fun res!417327 () Bool)

(assert (=> b!644304 (=> (not res!417327) (not e!369130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644304 (= res!417327 (validKeyInArray!0 (select (arr!18421 a!2986) j!136)))))

(declare-fun b!644305 () Bool)

(declare-fun Unit!21804 () Unit!21801)

(assert (=> b!644305 (= e!369133 Unit!21804)))

(declare-fun b!644306 () Bool)

(declare-fun res!417321 () Bool)

(assert (=> b!644306 (=> (not res!417321) (not e!369129))))

(assert (=> b!644306 (= res!417321 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18421 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644307 () Bool)

(assert (=> b!644307 (= e!369137 (= lt!298574 lt!298569))))

(declare-fun b!644308 () Bool)

(declare-fun e!369134 () Bool)

(declare-fun e!369135 () Bool)

(assert (=> b!644308 (= e!369134 e!369135)))

(declare-fun res!417334 () Bool)

(assert (=> b!644308 (=> res!417334 e!369135)))

(assert (=> b!644308 (= res!417334 (bvsge index!984 j!136))))

(declare-fun lt!298575 () Unit!21801)

(declare-fun e!369138 () Unit!21801)

(assert (=> b!644308 (= lt!298575 e!369138)))

(declare-fun c!73859 () Bool)

(assert (=> b!644308 (= c!73859 (bvslt j!136 index!984))))

(declare-fun b!644309 () Bool)

(declare-fun e!369132 () Bool)

(assert (=> b!644309 (= e!369132 (arrayContainsKey!0 lt!298568 (select (arr!18421 a!2986) j!136) index!984))))

(declare-fun b!644310 () Bool)

(assert (=> b!644310 (= e!369130 e!369129)))

(declare-fun res!417322 () Bool)

(assert (=> b!644310 (=> (not res!417322) (not e!369129))))

(declare-fun lt!298578 () SeekEntryResult!6817)

(assert (=> b!644310 (= res!417322 (or (= lt!298578 (MissingZero!6817 i!1108)) (= lt!298578 (MissingVacant!6817 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38421 (_ BitVec 32)) SeekEntryResult!6817)

(assert (=> b!644310 (= lt!298578 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644311 () Bool)

(declare-fun Unit!21805 () Unit!21801)

(assert (=> b!644311 (= e!369138 Unit!21805)))

(declare-fun lt!298570 () Unit!21801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21801)

(assert (=> b!644311 (= lt!298570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298568 (select (arr!18421 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644311 (arrayContainsKey!0 lt!298568 (select (arr!18421 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298579 () Unit!21801)

(declare-datatypes ((List!12369 0))(
  ( (Nil!12366) (Cons!12365 (h!13413 (_ BitVec 64)) (t!18589 List!12369)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12369) Unit!21801)

(assert (=> b!644311 (= lt!298579 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12366))))

(declare-fun arrayNoDuplicates!0 (array!38421 (_ BitVec 32) List!12369) Bool)

(assert (=> b!644311 (arrayNoDuplicates!0 lt!298568 #b00000000000000000000000000000000 Nil!12366)))

(declare-fun lt!298572 () Unit!21801)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38421 (_ BitVec 32) (_ BitVec 32)) Unit!21801)

(assert (=> b!644311 (= lt!298572 (lemmaNoDuplicateFromThenFromBigger!0 lt!298568 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644311 (arrayNoDuplicates!0 lt!298568 j!136 Nil!12366)))

(declare-fun lt!298573 () Unit!21801)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38421 (_ BitVec 64) (_ BitVec 32) List!12369) Unit!21801)

(assert (=> b!644311 (= lt!298573 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298568 (select (arr!18421 a!2986) j!136) j!136 Nil!12366))))

(assert (=> b!644311 false))

(declare-fun res!417331 () Bool)

(assert (=> start!58386 (=> (not res!417331) (not e!369130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58386 (= res!417331 (validMask!0 mask!3053))))

(assert (=> start!58386 e!369130))

(assert (=> start!58386 true))

(declare-fun array_inv!14280 (array!38421) Bool)

(assert (=> start!58386 (array_inv!14280 a!2986)))

(declare-fun b!644312 () Bool)

(declare-fun res!417336 () Bool)

(assert (=> b!644312 (=> (not res!417336) (not e!369129))))

(assert (=> b!644312 (= res!417336 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12366))))

(declare-fun b!644313 () Bool)

(assert (=> b!644313 (= e!369135 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!644313 e!369132))

(declare-fun res!417323 () Bool)

(assert (=> b!644313 (=> (not res!417323) (not e!369132))))

(assert (=> b!644313 (= res!417323 (arrayContainsKey!0 lt!298568 (select (arr!18421 a!2986) j!136) j!136))))

(declare-fun b!644314 () Bool)

(declare-fun Unit!21806 () Unit!21801)

(assert (=> b!644314 (= e!369138 Unit!21806)))

(declare-fun b!644315 () Bool)

(declare-fun res!417320 () Bool)

(assert (=> b!644315 (=> (not res!417320) (not e!369130))))

(assert (=> b!644315 (= res!417320 (and (= (size!18785 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18785 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18785 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644316 () Bool)

(declare-fun e!369140 () Bool)

(assert (=> b!644316 (= e!369131 e!369140)))

(declare-fun res!417328 () Bool)

(assert (=> b!644316 (=> (not res!417328) (not e!369140))))

(assert (=> b!644316 (= res!417328 (arrayContainsKey!0 lt!298568 (select (arr!18421 a!2986) j!136) j!136))))

(declare-fun b!644317 () Bool)

(assert (=> b!644317 (= e!369140 (arrayContainsKey!0 lt!298568 (select (arr!18421 a!2986) j!136) index!984))))

(declare-fun b!644318 () Bool)

(assert (=> b!644318 (= e!369128 e!369134)))

(declare-fun res!417330 () Bool)

(assert (=> b!644318 (=> res!417330 e!369134)))

(assert (=> b!644318 (= res!417330 (or (not (= (select (arr!18421 a!2986) j!136) lt!298576)) (not (= (select (arr!18421 a!2986) j!136) lt!298566))))))

(assert (=> b!644318 e!369139))

(declare-fun res!417319 () Bool)

(assert (=> b!644318 (=> (not res!417319) (not e!369139))))

(assert (=> b!644318 (= res!417319 (= lt!298566 (select (arr!18421 a!2986) j!136)))))

(assert (=> b!644318 (= lt!298566 (select (store (arr!18421 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644319 () Bool)

(declare-fun res!417332 () Bool)

(assert (=> b!644319 (=> (not res!417332) (not e!369129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38421 (_ BitVec 32)) Bool)

(assert (=> b!644319 (= res!417332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644320 () Bool)

(declare-fun res!417325 () Bool)

(assert (=> b!644320 (=> (not res!417325) (not e!369130))))

(assert (=> b!644320 (= res!417325 (validKeyInArray!0 k0!1786))))

(assert (= (and start!58386 res!417331) b!644315))

(assert (= (and b!644315 res!417320) b!644304))

(assert (= (and b!644304 res!417327) b!644320))

(assert (= (and b!644320 res!417325) b!644303))

(assert (= (and b!644303 res!417324) b!644310))

(assert (= (and b!644310 res!417322) b!644319))

(assert (= (and b!644319 res!417332) b!644312))

(assert (= (and b!644312 res!417336) b!644306))

(assert (= (and b!644306 res!417321) b!644301))

(assert (= (and b!644301 res!417335) b!644300))

(assert (= (and b!644300 res!417326) b!644302))

(assert (= (and b!644302 res!417333) b!644307))

(assert (= (and b!644302 c!73858) b!644298))

(assert (= (and b!644302 (not c!73858)) b!644305))

(assert (= (and b!644302 (not res!417329)) b!644318))

(assert (= (and b!644318 res!417319) b!644299))

(assert (= (and b!644299 (not res!417337)) b!644316))

(assert (= (and b!644316 res!417328) b!644317))

(assert (= (and b!644318 (not res!417330)) b!644308))

(assert (= (and b!644308 c!73859) b!644311))

(assert (= (and b!644308 (not c!73859)) b!644314))

(assert (= (and b!644308 (not res!417334)) b!644313))

(assert (= (and b!644313 res!417323) b!644309))

(declare-fun m!618355 () Bool)

(assert (=> b!644299 m!618355))

(assert (=> b!644309 m!618355))

(assert (=> b!644309 m!618355))

(declare-fun m!618357 () Bool)

(assert (=> b!644309 m!618357))

(declare-fun m!618359 () Bool)

(assert (=> b!644303 m!618359))

(assert (=> b!644313 m!618355))

(assert (=> b!644313 m!618355))

(declare-fun m!618361 () Bool)

(assert (=> b!644313 m!618361))

(declare-fun m!618363 () Bool)

(assert (=> b!644300 m!618363))

(assert (=> b!644300 m!618355))

(assert (=> b!644300 m!618355))

(declare-fun m!618365 () Bool)

(assert (=> b!644300 m!618365))

(declare-fun m!618367 () Bool)

(assert (=> b!644302 m!618367))

(declare-fun m!618369 () Bool)

(assert (=> b!644302 m!618369))

(assert (=> b!644302 m!618355))

(declare-fun m!618371 () Bool)

(assert (=> b!644302 m!618371))

(assert (=> b!644302 m!618355))

(declare-fun m!618373 () Bool)

(assert (=> b!644302 m!618373))

(declare-fun m!618375 () Bool)

(assert (=> b!644302 m!618375))

(declare-fun m!618377 () Bool)

(assert (=> b!644302 m!618377))

(declare-fun m!618379 () Bool)

(assert (=> b!644302 m!618379))

(declare-fun m!618381 () Bool)

(assert (=> b!644306 m!618381))

(assert (=> b!644316 m!618355))

(assert (=> b!644316 m!618355))

(assert (=> b!644316 m!618361))

(declare-fun m!618383 () Bool)

(assert (=> b!644319 m!618383))

(assert (=> b!644311 m!618355))

(assert (=> b!644311 m!618355))

(declare-fun m!618385 () Bool)

(assert (=> b!644311 m!618385))

(declare-fun m!618387 () Bool)

(assert (=> b!644311 m!618387))

(declare-fun m!618389 () Bool)

(assert (=> b!644311 m!618389))

(assert (=> b!644311 m!618355))

(declare-fun m!618391 () Bool)

(assert (=> b!644311 m!618391))

(declare-fun m!618393 () Bool)

(assert (=> b!644311 m!618393))

(assert (=> b!644311 m!618355))

(declare-fun m!618395 () Bool)

(assert (=> b!644311 m!618395))

(declare-fun m!618397 () Bool)

(assert (=> b!644311 m!618397))

(assert (=> b!644304 m!618355))

(assert (=> b!644304 m!618355))

(declare-fun m!618399 () Bool)

(assert (=> b!644304 m!618399))

(assert (=> b!644317 m!618355))

(assert (=> b!644317 m!618355))

(assert (=> b!644317 m!618357))

(declare-fun m!618401 () Bool)

(assert (=> start!58386 m!618401))

(declare-fun m!618403 () Bool)

(assert (=> start!58386 m!618403))

(declare-fun m!618405 () Bool)

(assert (=> b!644310 m!618405))

(assert (=> b!644318 m!618355))

(assert (=> b!644318 m!618371))

(declare-fun m!618407 () Bool)

(assert (=> b!644318 m!618407))

(declare-fun m!618409 () Bool)

(assert (=> b!644320 m!618409))

(assert (=> b!644301 m!618371))

(declare-fun m!618411 () Bool)

(assert (=> b!644301 m!618411))

(declare-fun m!618413 () Bool)

(assert (=> b!644312 m!618413))

(check-sat (not b!644300) (not b!644302) (not start!58386) (not b!644304) (not b!644316) (not b!644320) (not b!644310) (not b!644317) (not b!644319) (not b!644303) (not b!644309) (not b!644312) (not b!644313) (not b!644311))
(check-sat)
