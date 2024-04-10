; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56920 () Bool)

(assert start!56920)

(declare-fun res!407483 () Bool)

(declare-fun e!360390 () Bool)

(assert (=> start!56920 (=> (not res!407483) (not e!360390))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56920 (= res!407483 (validMask!0 mask!3053))))

(assert (=> start!56920 e!360390))

(assert (=> start!56920 true))

(declare-datatypes ((array!38053 0))(
  ( (array!38054 (arr!18262 (Array (_ BitVec 32) (_ BitVec 64))) (size!18626 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38053)

(declare-fun array_inv!14058 (array!38053) Bool)

(assert (=> start!56920 (array_inv!14058 a!2986)))

(declare-fun b!630267 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!291103 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!291105 () array!38053)

(declare-fun e!360391 () Bool)

(declare-datatypes ((SeekEntryResult!6702 0))(
  ( (MissingZero!6702 (index!29095 (_ BitVec 32))) (Found!6702 (index!29096 (_ BitVec 32))) (Intermediate!6702 (undefined!7514 Bool) (index!29097 (_ BitVec 32)) (x!57831 (_ BitVec 32))) (Undefined!6702) (MissingVacant!6702 (index!29098 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38053 (_ BitVec 32)) SeekEntryResult!6702)

(assert (=> b!630267 (= e!360391 (not (not (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291103 lt!291105 mask!3053) Undefined!6702))))))

(declare-fun e!360392 () Bool)

(assert (=> b!630267 e!360392))

(declare-fun res!407488 () Bool)

(assert (=> b!630267 (=> (not res!407488) (not e!360392))))

(declare-fun lt!291107 () (_ BitVec 32))

(declare-fun lt!291106 () SeekEntryResult!6702)

(assert (=> b!630267 (= res!407488 (= lt!291106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 lt!291103 lt!291105 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630267 (= lt!291106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!630267 (= lt!291103 (select (store (arr!18262 a!2986) i!1108 k0!1786) j!136))))

(declare-datatypes ((Unit!21146 0))(
  ( (Unit!21147) )
))
(declare-fun lt!291104 () Unit!21146)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21146)

(assert (=> b!630267 (= lt!291104 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630267 (= lt!291107 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630268 () Bool)

(declare-fun e!360393 () Bool)

(assert (=> b!630268 (= e!360390 e!360393)))

(declare-fun res!407487 () Bool)

(assert (=> b!630268 (=> (not res!407487) (not e!360393))))

(declare-fun lt!291108 () SeekEntryResult!6702)

(assert (=> b!630268 (= res!407487 (or (= lt!291108 (MissingZero!6702 i!1108)) (= lt!291108 (MissingVacant!6702 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38053 (_ BitVec 32)) SeekEntryResult!6702)

(assert (=> b!630268 (= lt!291108 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630269 () Bool)

(declare-fun res!407485 () Bool)

(assert (=> b!630269 (=> (not res!407485) (not e!360393))))

(assert (=> b!630269 (= res!407485 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18262 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630270 () Bool)

(declare-fun res!407490 () Bool)

(assert (=> b!630270 (=> (not res!407490) (not e!360390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630270 (= res!407490 (validKeyInArray!0 k0!1786))))

(declare-fun b!630271 () Bool)

(declare-fun e!360389 () Bool)

(assert (=> b!630271 (= e!360393 e!360389)))

(declare-fun res!407486 () Bool)

(assert (=> b!630271 (=> (not res!407486) (not e!360389))))

(assert (=> b!630271 (= res!407486 (= (select (store (arr!18262 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630271 (= lt!291105 (array!38054 (store (arr!18262 a!2986) i!1108 k0!1786) (size!18626 a!2986)))))

(declare-fun b!630272 () Bool)

(declare-fun res!407491 () Bool)

(assert (=> b!630272 (=> (not res!407491) (not e!360390))))

(declare-fun arrayContainsKey!0 (array!38053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630272 (= res!407491 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630273 () Bool)

(assert (=> b!630273 (= e!360389 e!360391)))

(declare-fun res!407492 () Bool)

(assert (=> b!630273 (=> (not res!407492) (not e!360391))))

(declare-fun lt!291109 () SeekEntryResult!6702)

(assert (=> b!630273 (= res!407492 (and (= lt!291109 (Found!6702 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18262 a!2986) index!984) (select (arr!18262 a!2986) j!136))) (not (= (select (arr!18262 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630273 (= lt!291109 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630274 () Bool)

(assert (=> b!630274 (= e!360392 (= lt!291109 lt!291106))))

(declare-fun b!630275 () Bool)

(declare-fun res!407484 () Bool)

(assert (=> b!630275 (=> (not res!407484) (not e!360390))))

(assert (=> b!630275 (= res!407484 (and (= (size!18626 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18626 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18626 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630276 () Bool)

(declare-fun res!407482 () Bool)

(assert (=> b!630276 (=> (not res!407482) (not e!360393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38053 (_ BitVec 32)) Bool)

(assert (=> b!630276 (= res!407482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630277 () Bool)

(declare-fun res!407481 () Bool)

(assert (=> b!630277 (=> (not res!407481) (not e!360390))))

(assert (=> b!630277 (= res!407481 (validKeyInArray!0 (select (arr!18262 a!2986) j!136)))))

(declare-fun b!630278 () Bool)

(declare-fun res!407489 () Bool)

(assert (=> b!630278 (=> (not res!407489) (not e!360393))))

(declare-datatypes ((List!12303 0))(
  ( (Nil!12300) (Cons!12299 (h!13344 (_ BitVec 64)) (t!18531 List!12303)) )
))
(declare-fun arrayNoDuplicates!0 (array!38053 (_ BitVec 32) List!12303) Bool)

(assert (=> b!630278 (= res!407489 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12300))))

(assert (= (and start!56920 res!407483) b!630275))

(assert (= (and b!630275 res!407484) b!630277))

(assert (= (and b!630277 res!407481) b!630270))

(assert (= (and b!630270 res!407490) b!630272))

(assert (= (and b!630272 res!407491) b!630268))

(assert (= (and b!630268 res!407487) b!630276))

(assert (= (and b!630276 res!407482) b!630278))

(assert (= (and b!630278 res!407489) b!630269))

(assert (= (and b!630269 res!407485) b!630271))

(assert (= (and b!630271 res!407486) b!630273))

(assert (= (and b!630273 res!407492) b!630267))

(assert (= (and b!630267 res!407488) b!630274))

(declare-fun m!605293 () Bool)

(assert (=> b!630276 m!605293))

(declare-fun m!605295 () Bool)

(assert (=> b!630269 m!605295))

(declare-fun m!605297 () Bool)

(assert (=> b!630270 m!605297))

(declare-fun m!605299 () Bool)

(assert (=> b!630267 m!605299))

(declare-fun m!605301 () Bool)

(assert (=> b!630267 m!605301))

(declare-fun m!605303 () Bool)

(assert (=> b!630267 m!605303))

(declare-fun m!605305 () Bool)

(assert (=> b!630267 m!605305))

(declare-fun m!605307 () Bool)

(assert (=> b!630267 m!605307))

(assert (=> b!630267 m!605305))

(declare-fun m!605309 () Bool)

(assert (=> b!630267 m!605309))

(declare-fun m!605311 () Bool)

(assert (=> b!630267 m!605311))

(declare-fun m!605313 () Bool)

(assert (=> b!630267 m!605313))

(declare-fun m!605315 () Bool)

(assert (=> b!630268 m!605315))

(declare-fun m!605317 () Bool)

(assert (=> b!630272 m!605317))

(assert (=> b!630271 m!605307))

(declare-fun m!605319 () Bool)

(assert (=> b!630271 m!605319))

(assert (=> b!630277 m!605305))

(assert (=> b!630277 m!605305))

(declare-fun m!605321 () Bool)

(assert (=> b!630277 m!605321))

(declare-fun m!605323 () Bool)

(assert (=> b!630273 m!605323))

(assert (=> b!630273 m!605305))

(assert (=> b!630273 m!605305))

(declare-fun m!605325 () Bool)

(assert (=> b!630273 m!605325))

(declare-fun m!605327 () Bool)

(assert (=> start!56920 m!605327))

(declare-fun m!605329 () Bool)

(assert (=> start!56920 m!605329))

(declare-fun m!605331 () Bool)

(assert (=> b!630278 m!605331))

(check-sat (not b!630273) (not b!630270) (not b!630276) (not start!56920) (not b!630267) (not b!630278) (not b!630268) (not b!630272) (not b!630277))
(check-sat)
(get-model)

(declare-fun d!89217 () Bool)

(assert (=> d!89217 (= (validKeyInArray!0 (select (arr!18262 a!2986) j!136)) (and (not (= (select (arr!18262 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18262 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630277 d!89217))

(declare-fun d!89219 () Bool)

(declare-fun res!407533 () Bool)

(declare-fun e!360416 () Bool)

(assert (=> d!89219 (=> res!407533 e!360416)))

(assert (=> d!89219 (= res!407533 (= (select (arr!18262 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89219 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!360416)))

(declare-fun b!630319 () Bool)

(declare-fun e!360417 () Bool)

(assert (=> b!630319 (= e!360416 e!360417)))

(declare-fun res!407534 () Bool)

(assert (=> b!630319 (=> (not res!407534) (not e!360417))))

(assert (=> b!630319 (= res!407534 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18626 a!2986)))))

(declare-fun b!630320 () Bool)

(assert (=> b!630320 (= e!360417 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89219 (not res!407533)) b!630319))

(assert (= (and b!630319 res!407534) b!630320))

(declare-fun m!605373 () Bool)

(assert (=> d!89219 m!605373))

(declare-fun m!605375 () Bool)

(assert (=> b!630320 m!605375))

(assert (=> b!630272 d!89219))

(declare-fun b!630333 () Bool)

(declare-fun e!360425 () SeekEntryResult!6702)

(declare-fun e!360424 () SeekEntryResult!6702)

(assert (=> b!630333 (= e!360425 e!360424)))

(declare-fun lt!291136 () (_ BitVec 64))

(declare-fun c!71767 () Bool)

(assert (=> b!630333 (= c!71767 (= lt!291136 (select (arr!18262 a!2986) j!136)))))

(declare-fun b!630334 () Bool)

(declare-fun c!71766 () Bool)

(assert (=> b!630334 (= c!71766 (= lt!291136 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360426 () SeekEntryResult!6702)

(assert (=> b!630334 (= e!360424 e!360426)))

(declare-fun b!630335 () Bool)

(assert (=> b!630335 (= e!360426 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630336 () Bool)

(assert (=> b!630336 (= e!360426 (MissingVacant!6702 vacantSpotIndex!68))))

(declare-fun lt!291135 () SeekEntryResult!6702)

(declare-fun d!89221 () Bool)

(get-info :version)

(assert (=> d!89221 (and (or ((_ is Undefined!6702) lt!291135) (not ((_ is Found!6702) lt!291135)) (and (bvsge (index!29096 lt!291135) #b00000000000000000000000000000000) (bvslt (index!29096 lt!291135) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291135) ((_ is Found!6702) lt!291135) (not ((_ is MissingVacant!6702) lt!291135)) (not (= (index!29098 lt!291135) vacantSpotIndex!68)) (and (bvsge (index!29098 lt!291135) #b00000000000000000000000000000000) (bvslt (index!29098 lt!291135) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291135) (ite ((_ is Found!6702) lt!291135) (= (select (arr!18262 a!2986) (index!29096 lt!291135)) (select (arr!18262 a!2986) j!136)) (and ((_ is MissingVacant!6702) lt!291135) (= (index!29098 lt!291135) vacantSpotIndex!68) (= (select (arr!18262 a!2986) (index!29098 lt!291135)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89221 (= lt!291135 e!360425)))

(declare-fun c!71768 () Bool)

(assert (=> d!89221 (= c!71768 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89221 (= lt!291136 (select (arr!18262 a!2986) index!984))))

(assert (=> d!89221 (validMask!0 mask!3053)))

(assert (=> d!89221 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053) lt!291135)))

(declare-fun b!630337 () Bool)

(assert (=> b!630337 (= e!360425 Undefined!6702)))

(declare-fun b!630338 () Bool)

(assert (=> b!630338 (= e!360424 (Found!6702 index!984))))

(assert (= (and d!89221 c!71768) b!630337))

(assert (= (and d!89221 (not c!71768)) b!630333))

(assert (= (and b!630333 c!71767) b!630338))

(assert (= (and b!630333 (not c!71767)) b!630334))

(assert (= (and b!630334 c!71766) b!630336))

(assert (= (and b!630334 (not c!71766)) b!630335))

(assert (=> b!630335 m!605299))

(assert (=> b!630335 m!605299))

(assert (=> b!630335 m!605305))

(declare-fun m!605377 () Bool)

(assert (=> b!630335 m!605377))

(declare-fun m!605379 () Bool)

(assert (=> d!89221 m!605379))

(declare-fun m!605381 () Bool)

(assert (=> d!89221 m!605381))

(assert (=> d!89221 m!605323))

(assert (=> d!89221 m!605327))

(assert (=> b!630273 d!89221))

(declare-fun d!89223 () Bool)

(declare-fun lt!291143 () SeekEntryResult!6702)

(assert (=> d!89223 (and (or ((_ is Undefined!6702) lt!291143) (not ((_ is Found!6702) lt!291143)) (and (bvsge (index!29096 lt!291143) #b00000000000000000000000000000000) (bvslt (index!29096 lt!291143) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291143) ((_ is Found!6702) lt!291143) (not ((_ is MissingZero!6702) lt!291143)) (and (bvsge (index!29095 lt!291143) #b00000000000000000000000000000000) (bvslt (index!29095 lt!291143) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291143) ((_ is Found!6702) lt!291143) ((_ is MissingZero!6702) lt!291143) (not ((_ is MissingVacant!6702) lt!291143)) (and (bvsge (index!29098 lt!291143) #b00000000000000000000000000000000) (bvslt (index!29098 lt!291143) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291143) (ite ((_ is Found!6702) lt!291143) (= (select (arr!18262 a!2986) (index!29096 lt!291143)) k0!1786) (ite ((_ is MissingZero!6702) lt!291143) (= (select (arr!18262 a!2986) (index!29095 lt!291143)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6702) lt!291143) (= (select (arr!18262 a!2986) (index!29098 lt!291143)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!360435 () SeekEntryResult!6702)

(assert (=> d!89223 (= lt!291143 e!360435)))

(declare-fun c!71777 () Bool)

(declare-fun lt!291144 () SeekEntryResult!6702)

(assert (=> d!89223 (= c!71777 (and ((_ is Intermediate!6702) lt!291144) (undefined!7514 lt!291144)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38053 (_ BitVec 32)) SeekEntryResult!6702)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89223 (= lt!291144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89223 (validMask!0 mask!3053)))

(assert (=> d!89223 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!291143)))

(declare-fun b!630351 () Bool)

(assert (=> b!630351 (= e!360435 Undefined!6702)))

(declare-fun b!630352 () Bool)

(declare-fun c!71776 () Bool)

(declare-fun lt!291145 () (_ BitVec 64))

(assert (=> b!630352 (= c!71776 (= lt!291145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360433 () SeekEntryResult!6702)

(declare-fun e!360434 () SeekEntryResult!6702)

(assert (=> b!630352 (= e!360433 e!360434)))

(declare-fun b!630353 () Bool)

(assert (=> b!630353 (= e!360433 (Found!6702 (index!29097 lt!291144)))))

(declare-fun b!630354 () Bool)

(assert (=> b!630354 (= e!360435 e!360433)))

(assert (=> b!630354 (= lt!291145 (select (arr!18262 a!2986) (index!29097 lt!291144)))))

(declare-fun c!71775 () Bool)

(assert (=> b!630354 (= c!71775 (= lt!291145 k0!1786))))

(declare-fun b!630355 () Bool)

(assert (=> b!630355 (= e!360434 (seekKeyOrZeroReturnVacant!0 (x!57831 lt!291144) (index!29097 lt!291144) (index!29097 lt!291144) k0!1786 a!2986 mask!3053))))

(declare-fun b!630356 () Bool)

(assert (=> b!630356 (= e!360434 (MissingZero!6702 (index!29097 lt!291144)))))

(assert (= (and d!89223 c!71777) b!630351))

(assert (= (and d!89223 (not c!71777)) b!630354))

(assert (= (and b!630354 c!71775) b!630353))

(assert (= (and b!630354 (not c!71775)) b!630352))

(assert (= (and b!630352 c!71776) b!630356))

(assert (= (and b!630352 (not c!71776)) b!630355))

(declare-fun m!605383 () Bool)

(assert (=> d!89223 m!605383))

(declare-fun m!605385 () Bool)

(assert (=> d!89223 m!605385))

(assert (=> d!89223 m!605327))

(declare-fun m!605387 () Bool)

(assert (=> d!89223 m!605387))

(declare-fun m!605389 () Bool)

(assert (=> d!89223 m!605389))

(assert (=> d!89223 m!605387))

(declare-fun m!605391 () Bool)

(assert (=> d!89223 m!605391))

(declare-fun m!605393 () Bool)

(assert (=> b!630354 m!605393))

(declare-fun m!605395 () Bool)

(assert (=> b!630355 m!605395))

(assert (=> b!630268 d!89223))

(declare-fun d!89227 () Bool)

(declare-fun e!360450 () Bool)

(assert (=> d!89227 e!360450))

(declare-fun res!407547 () Bool)

(assert (=> d!89227 (=> (not res!407547) (not e!360450))))

(assert (=> d!89227 (= res!407547 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18626 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18626 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18626 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18626 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18626 a!2986))))))

(declare-fun lt!291154 () Unit!21146)

(declare-fun choose!9 (array!38053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21146)

(assert (=> d!89227 (= lt!291154 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89227 (validMask!0 mask!3053)))

(assert (=> d!89227 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 mask!3053) lt!291154)))

(declare-fun b!630373 () Bool)

(assert (=> b!630373 (= e!360450 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 (select (store (arr!18262 a!2986) i!1108 k0!1786) j!136) (array!38054 (store (arr!18262 a!2986) i!1108 k0!1786) (size!18626 a!2986)) mask!3053)))))

(assert (= (and d!89227 res!407547) b!630373))

(declare-fun m!605401 () Bool)

(assert (=> d!89227 m!605401))

(assert (=> d!89227 m!605327))

(assert (=> b!630373 m!605301))

(declare-fun m!605403 () Bool)

(assert (=> b!630373 m!605403))

(assert (=> b!630373 m!605305))

(assert (=> b!630373 m!605307))

(assert (=> b!630373 m!605301))

(assert (=> b!630373 m!605305))

(assert (=> b!630373 m!605309))

(assert (=> b!630267 d!89227))

(declare-fun b!630374 () Bool)

(declare-fun e!360452 () SeekEntryResult!6702)

(declare-fun e!360451 () SeekEntryResult!6702)

(assert (=> b!630374 (= e!360452 e!360451)))

(declare-fun c!71781 () Bool)

(declare-fun lt!291156 () (_ BitVec 64))

(assert (=> b!630374 (= c!71781 (= lt!291156 lt!291103))))

(declare-fun b!630375 () Bool)

(declare-fun c!71780 () Bool)

(assert (=> b!630375 (= c!71780 (= lt!291156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360453 () SeekEntryResult!6702)

(assert (=> b!630375 (= e!360451 e!360453)))

(declare-fun b!630376 () Bool)

(assert (=> b!630376 (= e!360453 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291103 lt!291105 mask!3053))))

(declare-fun b!630377 () Bool)

(assert (=> b!630377 (= e!360453 (MissingVacant!6702 vacantSpotIndex!68))))

(declare-fun d!89235 () Bool)

(declare-fun lt!291155 () SeekEntryResult!6702)

(assert (=> d!89235 (and (or ((_ is Undefined!6702) lt!291155) (not ((_ is Found!6702) lt!291155)) (and (bvsge (index!29096 lt!291155) #b00000000000000000000000000000000) (bvslt (index!29096 lt!291155) (size!18626 lt!291105)))) (or ((_ is Undefined!6702) lt!291155) ((_ is Found!6702) lt!291155) (not ((_ is MissingVacant!6702) lt!291155)) (not (= (index!29098 lt!291155) vacantSpotIndex!68)) (and (bvsge (index!29098 lt!291155) #b00000000000000000000000000000000) (bvslt (index!29098 lt!291155) (size!18626 lt!291105)))) (or ((_ is Undefined!6702) lt!291155) (ite ((_ is Found!6702) lt!291155) (= (select (arr!18262 lt!291105) (index!29096 lt!291155)) lt!291103) (and ((_ is MissingVacant!6702) lt!291155) (= (index!29098 lt!291155) vacantSpotIndex!68) (= (select (arr!18262 lt!291105) (index!29098 lt!291155)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89235 (= lt!291155 e!360452)))

(declare-fun c!71782 () Bool)

(assert (=> d!89235 (= c!71782 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89235 (= lt!291156 (select (arr!18262 lt!291105) index!984))))

(assert (=> d!89235 (validMask!0 mask!3053)))

(assert (=> d!89235 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291103 lt!291105 mask!3053) lt!291155)))

(declare-fun b!630378 () Bool)

(assert (=> b!630378 (= e!360452 Undefined!6702)))

(declare-fun b!630379 () Bool)

(assert (=> b!630379 (= e!360451 (Found!6702 index!984))))

(assert (= (and d!89235 c!71782) b!630378))

(assert (= (and d!89235 (not c!71782)) b!630374))

(assert (= (and b!630374 c!71781) b!630379))

(assert (= (and b!630374 (not c!71781)) b!630375))

(assert (= (and b!630375 c!71780) b!630377))

(assert (= (and b!630375 (not c!71780)) b!630376))

(assert (=> b!630376 m!605299))

(assert (=> b!630376 m!605299))

(declare-fun m!605405 () Bool)

(assert (=> b!630376 m!605405))

(declare-fun m!605407 () Bool)

(assert (=> d!89235 m!605407))

(declare-fun m!605409 () Bool)

(assert (=> d!89235 m!605409))

(declare-fun m!605411 () Bool)

(assert (=> d!89235 m!605411))

(assert (=> d!89235 m!605327))

(assert (=> b!630267 d!89235))

(declare-fun b!630380 () Bool)

(declare-fun e!360455 () SeekEntryResult!6702)

(declare-fun e!360454 () SeekEntryResult!6702)

(assert (=> b!630380 (= e!360455 e!360454)))

(declare-fun c!71784 () Bool)

(declare-fun lt!291158 () (_ BitVec 64))

(assert (=> b!630380 (= c!71784 (= lt!291158 (select (arr!18262 a!2986) j!136)))))

(declare-fun b!630381 () Bool)

(declare-fun c!71783 () Bool)

(assert (=> b!630381 (= c!71783 (= lt!291158 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360456 () SeekEntryResult!6702)

(assert (=> b!630381 (= e!360454 e!360456)))

(declare-fun b!630382 () Bool)

(assert (=> b!630382 (= e!360456 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291107 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630383 () Bool)

(assert (=> b!630383 (= e!360456 (MissingVacant!6702 vacantSpotIndex!68))))

(declare-fun d!89237 () Bool)

(declare-fun lt!291157 () SeekEntryResult!6702)

(assert (=> d!89237 (and (or ((_ is Undefined!6702) lt!291157) (not ((_ is Found!6702) lt!291157)) (and (bvsge (index!29096 lt!291157) #b00000000000000000000000000000000) (bvslt (index!29096 lt!291157) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291157) ((_ is Found!6702) lt!291157) (not ((_ is MissingVacant!6702) lt!291157)) (not (= (index!29098 lt!291157) vacantSpotIndex!68)) (and (bvsge (index!29098 lt!291157) #b00000000000000000000000000000000) (bvslt (index!29098 lt!291157) (size!18626 a!2986)))) (or ((_ is Undefined!6702) lt!291157) (ite ((_ is Found!6702) lt!291157) (= (select (arr!18262 a!2986) (index!29096 lt!291157)) (select (arr!18262 a!2986) j!136)) (and ((_ is MissingVacant!6702) lt!291157) (= (index!29098 lt!291157) vacantSpotIndex!68) (= (select (arr!18262 a!2986) (index!29098 lt!291157)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89237 (= lt!291157 e!360455)))

(declare-fun c!71785 () Bool)

(assert (=> d!89237 (= c!71785 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89237 (= lt!291158 (select (arr!18262 a!2986) lt!291107))))

(assert (=> d!89237 (validMask!0 mask!3053)))

(assert (=> d!89237 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053) lt!291157)))

(declare-fun b!630384 () Bool)

(assert (=> b!630384 (= e!360455 Undefined!6702)))

(declare-fun b!630385 () Bool)

(assert (=> b!630385 (= e!360454 (Found!6702 lt!291107))))

(assert (= (and d!89237 c!71785) b!630384))

(assert (= (and d!89237 (not c!71785)) b!630380))

(assert (= (and b!630380 c!71784) b!630385))

(assert (= (and b!630380 (not c!71784)) b!630381))

(assert (= (and b!630381 c!71783) b!630383))

(assert (= (and b!630381 (not c!71783)) b!630382))

(declare-fun m!605413 () Bool)

(assert (=> b!630382 m!605413))

(assert (=> b!630382 m!605413))

(assert (=> b!630382 m!605305))

(declare-fun m!605415 () Bool)

(assert (=> b!630382 m!605415))

(declare-fun m!605417 () Bool)

(assert (=> d!89237 m!605417))

(declare-fun m!605419 () Bool)

(assert (=> d!89237 m!605419))

(declare-fun m!605421 () Bool)

(assert (=> d!89237 m!605421))

(assert (=> d!89237 m!605327))

(assert (=> b!630267 d!89237))

(declare-fun d!89239 () Bool)

(declare-fun lt!291170 () (_ BitVec 32))

(assert (=> d!89239 (and (bvsge lt!291170 #b00000000000000000000000000000000) (bvslt lt!291170 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89239 (= lt!291170 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89239 (validMask!0 mask!3053)))

(assert (=> d!89239 (= (nextIndex!0 index!984 x!910 mask!3053) lt!291170)))

(declare-fun bs!19003 () Bool)

(assert (= bs!19003 d!89239))

(declare-fun m!605433 () Bool)

(assert (=> bs!19003 m!605433))

(assert (=> bs!19003 m!605327))

(assert (=> b!630267 d!89239))

(declare-fun b!630402 () Bool)

(declare-fun e!360467 () SeekEntryResult!6702)

(declare-fun e!360466 () SeekEntryResult!6702)

(assert (=> b!630402 (= e!360467 e!360466)))

(declare-fun c!71794 () Bool)

(declare-fun lt!291172 () (_ BitVec 64))

(assert (=> b!630402 (= c!71794 (= lt!291172 lt!291103))))

(declare-fun b!630403 () Bool)

(declare-fun c!71793 () Bool)

(assert (=> b!630403 (= c!71793 (= lt!291172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360468 () SeekEntryResult!6702)

(assert (=> b!630403 (= e!360466 e!360468)))

(declare-fun b!630404 () Bool)

(assert (=> b!630404 (= e!360468 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291107 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!291103 lt!291105 mask!3053))))

(declare-fun b!630405 () Bool)

(assert (=> b!630405 (= e!360468 (MissingVacant!6702 vacantSpotIndex!68))))

(declare-fun d!89243 () Bool)

(declare-fun lt!291171 () SeekEntryResult!6702)

(assert (=> d!89243 (and (or ((_ is Undefined!6702) lt!291171) (not ((_ is Found!6702) lt!291171)) (and (bvsge (index!29096 lt!291171) #b00000000000000000000000000000000) (bvslt (index!29096 lt!291171) (size!18626 lt!291105)))) (or ((_ is Undefined!6702) lt!291171) ((_ is Found!6702) lt!291171) (not ((_ is MissingVacant!6702) lt!291171)) (not (= (index!29098 lt!291171) vacantSpotIndex!68)) (and (bvsge (index!29098 lt!291171) #b00000000000000000000000000000000) (bvslt (index!29098 lt!291171) (size!18626 lt!291105)))) (or ((_ is Undefined!6702) lt!291171) (ite ((_ is Found!6702) lt!291171) (= (select (arr!18262 lt!291105) (index!29096 lt!291171)) lt!291103) (and ((_ is MissingVacant!6702) lt!291171) (= (index!29098 lt!291171) vacantSpotIndex!68) (= (select (arr!18262 lt!291105) (index!29098 lt!291171)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89243 (= lt!291171 e!360467)))

(declare-fun c!71795 () Bool)

(assert (=> d!89243 (= c!71795 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89243 (= lt!291172 (select (arr!18262 lt!291105) lt!291107))))

(assert (=> d!89243 (validMask!0 mask!3053)))

(assert (=> d!89243 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291107 vacantSpotIndex!68 lt!291103 lt!291105 mask!3053) lt!291171)))

(declare-fun b!630406 () Bool)

(assert (=> b!630406 (= e!360467 Undefined!6702)))

(declare-fun b!630407 () Bool)

(assert (=> b!630407 (= e!360466 (Found!6702 lt!291107))))

(assert (= (and d!89243 c!71795) b!630406))

(assert (= (and d!89243 (not c!71795)) b!630402))

(assert (= (and b!630402 c!71794) b!630407))

(assert (= (and b!630402 (not c!71794)) b!630403))

(assert (= (and b!630403 c!71793) b!630405))

(assert (= (and b!630403 (not c!71793)) b!630404))

(assert (=> b!630404 m!605413))

(assert (=> b!630404 m!605413))

(declare-fun m!605435 () Bool)

(assert (=> b!630404 m!605435))

(declare-fun m!605437 () Bool)

(assert (=> d!89243 m!605437))

(declare-fun m!605439 () Bool)

(assert (=> d!89243 m!605439))

(declare-fun m!605441 () Bool)

(assert (=> d!89243 m!605441))

(assert (=> d!89243 m!605327))

(assert (=> b!630267 d!89243))

(declare-fun b!630424 () Bool)

(declare-fun e!360483 () Bool)

(declare-fun contains!3085 (List!12303 (_ BitVec 64)) Bool)

(assert (=> b!630424 (= e!360483 (contains!3085 Nil!12300 (select (arr!18262 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630425 () Bool)

(declare-fun e!360481 () Bool)

(declare-fun call!33314 () Bool)

(assert (=> b!630425 (= e!360481 call!33314)))

(declare-fun d!89247 () Bool)

(declare-fun res!407558 () Bool)

(declare-fun e!360482 () Bool)

(assert (=> d!89247 (=> res!407558 e!360482)))

(assert (=> d!89247 (= res!407558 (bvsge #b00000000000000000000000000000000 (size!18626 a!2986)))))

(assert (=> d!89247 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12300) e!360482)))

(declare-fun bm!33311 () Bool)

(declare-fun c!71801 () Bool)

(assert (=> bm!33311 (= call!33314 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71801 (Cons!12299 (select (arr!18262 a!2986) #b00000000000000000000000000000000) Nil!12300) Nil!12300)))))

(declare-fun b!630426 () Bool)

(assert (=> b!630426 (= e!360481 call!33314)))

(declare-fun b!630427 () Bool)

(declare-fun e!360480 () Bool)

(assert (=> b!630427 (= e!360482 e!360480)))

(declare-fun res!407557 () Bool)

(assert (=> b!630427 (=> (not res!407557) (not e!360480))))

(assert (=> b!630427 (= res!407557 (not e!360483))))

(declare-fun res!407556 () Bool)

(assert (=> b!630427 (=> (not res!407556) (not e!360483))))

(assert (=> b!630427 (= res!407556 (validKeyInArray!0 (select (arr!18262 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630428 () Bool)

(assert (=> b!630428 (= e!360480 e!360481)))

(assert (=> b!630428 (= c!71801 (validKeyInArray!0 (select (arr!18262 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89247 (not res!407558)) b!630427))

(assert (= (and b!630427 res!407556) b!630424))

(assert (= (and b!630427 res!407557) b!630428))

(assert (= (and b!630428 c!71801) b!630425))

(assert (= (and b!630428 (not c!71801)) b!630426))

(assert (= (or b!630425 b!630426) bm!33311))

(assert (=> b!630424 m!605373))

(assert (=> b!630424 m!605373))

(declare-fun m!605457 () Bool)

(assert (=> b!630424 m!605457))

(assert (=> bm!33311 m!605373))

(declare-fun m!605459 () Bool)

(assert (=> bm!33311 m!605459))

(assert (=> b!630427 m!605373))

(assert (=> b!630427 m!605373))

(declare-fun m!605461 () Bool)

(assert (=> b!630427 m!605461))

(assert (=> b!630428 m!605373))

(assert (=> b!630428 m!605373))

(assert (=> b!630428 m!605461))

(assert (=> b!630278 d!89247))

(declare-fun d!89251 () Bool)

(assert (=> d!89251 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56920 d!89251))

(declare-fun d!89257 () Bool)

(assert (=> d!89257 (= (array_inv!14058 a!2986) (bvsge (size!18626 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56920 d!89257))

(declare-fun b!630485 () Bool)

(declare-fun e!360518 () Bool)

(declare-fun e!360517 () Bool)

(assert (=> b!630485 (= e!360518 e!360517)))

(declare-fun c!71825 () Bool)

(assert (=> b!630485 (= c!71825 (validKeyInArray!0 (select (arr!18262 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630486 () Bool)

(declare-fun call!33320 () Bool)

(assert (=> b!630486 (= e!360517 call!33320)))

(declare-fun bm!33317 () Bool)

(assert (=> bm!33317 (= call!33320 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!630487 () Bool)

(declare-fun e!360519 () Bool)

(assert (=> b!630487 (= e!360519 call!33320)))

(declare-fun b!630488 () Bool)

(assert (=> b!630488 (= e!360517 e!360519)))

(declare-fun lt!291205 () (_ BitVec 64))

(assert (=> b!630488 (= lt!291205 (select (arr!18262 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291203 () Unit!21146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38053 (_ BitVec 64) (_ BitVec 32)) Unit!21146)

(assert (=> b!630488 (= lt!291203 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291205 #b00000000000000000000000000000000))))

(assert (=> b!630488 (arrayContainsKey!0 a!2986 lt!291205 #b00000000000000000000000000000000)))

(declare-fun lt!291204 () Unit!21146)

(assert (=> b!630488 (= lt!291204 lt!291203)))

(declare-fun res!407570 () Bool)

(assert (=> b!630488 (= res!407570 (= (seekEntryOrOpen!0 (select (arr!18262 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6702 #b00000000000000000000000000000000)))))

(assert (=> b!630488 (=> (not res!407570) (not e!360519))))

(declare-fun d!89259 () Bool)

(declare-fun res!407569 () Bool)

(assert (=> d!89259 (=> res!407569 e!360518)))

(assert (=> d!89259 (= res!407569 (bvsge #b00000000000000000000000000000000 (size!18626 a!2986)))))

(assert (=> d!89259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360518)))

(assert (= (and d!89259 (not res!407569)) b!630485))

(assert (= (and b!630485 c!71825) b!630488))

(assert (= (and b!630485 (not c!71825)) b!630486))

(assert (= (and b!630488 res!407570) b!630487))

(assert (= (or b!630487 b!630486) bm!33317))

(assert (=> b!630485 m!605373))

(assert (=> b!630485 m!605373))

(assert (=> b!630485 m!605461))

(declare-fun m!605493 () Bool)

(assert (=> bm!33317 m!605493))

(assert (=> b!630488 m!605373))

(declare-fun m!605495 () Bool)

(assert (=> b!630488 m!605495))

(declare-fun m!605497 () Bool)

(assert (=> b!630488 m!605497))

(assert (=> b!630488 m!605373))

(declare-fun m!605499 () Bool)

(assert (=> b!630488 m!605499))

(assert (=> b!630276 d!89259))

(declare-fun d!89265 () Bool)

(assert (=> d!89265 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630270 d!89265))

(check-sat (not b!630488) (not d!89221) (not b!630355) (not d!89239) (not b!630428) (not bm!33311) (not b!630320) (not d!89227) (not bm!33317) (not b!630427) (not b!630335) (not b!630404) (not b!630424) (not b!630485) (not b!630382) (not d!89235) (not d!89243) (not d!89237) (not b!630376) (not b!630373) (not d!89223))
(check-sat)
