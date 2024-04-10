; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57020 () Bool)

(assert start!57020)

(declare-fun b!631369 () Bool)

(declare-fun e!360977 () Bool)

(declare-fun e!360980 () Bool)

(assert (=> b!631369 (= e!360977 e!360980)))

(declare-fun res!408276 () Bool)

(assert (=> b!631369 (=> (not res!408276) (not e!360980))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38096 0))(
  ( (array!38097 (arr!18282 (Array (_ BitVec 32) (_ BitVec 64))) (size!18646 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38096)

(assert (=> b!631369 (= res!408276 (= (select (store (arr!18282 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291706 () array!38096)

(assert (=> b!631369 (= lt!291706 (array!38097 (store (arr!18282 a!2986) i!1108 k!1786) (size!18646 a!2986)))))

(declare-fun b!631370 () Bool)

(declare-datatypes ((Unit!21222 0))(
  ( (Unit!21223) )
))
(declare-fun e!360979 () Unit!21222)

(declare-fun Unit!21224 () Unit!21222)

(assert (=> b!631370 (= e!360979 Unit!21224)))

(declare-fun b!631371 () Bool)

(declare-fun e!360978 () Bool)

(assert (=> b!631371 (= e!360980 e!360978)))

(declare-fun res!408284 () Bool)

(assert (=> b!631371 (=> (not res!408284) (not e!360978))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6722 0))(
  ( (MissingZero!6722 (index!29178 (_ BitVec 32))) (Found!6722 (index!29179 (_ BitVec 32))) (Intermediate!6722 (undefined!7534 Bool) (index!29180 (_ BitVec 32)) (x!57916 (_ BitVec 32))) (Undefined!6722) (MissingVacant!6722 (index!29181 (_ BitVec 32))) )
))
(declare-fun lt!291702 () SeekEntryResult!6722)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631371 (= res!408284 (and (= lt!291702 (Found!6722 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18282 a!2986) index!984) (select (arr!18282 a!2986) j!136))) (not (= (select (arr!18282 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38096 (_ BitVec 32)) SeekEntryResult!6722)

(assert (=> b!631371 (= lt!291702 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18282 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631372 () Bool)

(declare-fun e!360976 () Bool)

(declare-fun lt!291705 () SeekEntryResult!6722)

(assert (=> b!631372 (= e!360976 (= lt!291702 lt!291705))))

(declare-fun b!631373 () Bool)

(declare-fun res!408277 () Bool)

(assert (=> b!631373 (=> (not res!408277) (not e!360977))))

(assert (=> b!631373 (= res!408277 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18282 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631374 () Bool)

(declare-fun res!408283 () Bool)

(assert (=> b!631374 (=> (not res!408283) (not e!360977))))

(declare-datatypes ((List!12323 0))(
  ( (Nil!12320) (Cons!12319 (h!13364 (_ BitVec 64)) (t!18551 List!12323)) )
))
(declare-fun arrayNoDuplicates!0 (array!38096 (_ BitVec 32) List!12323) Bool)

(assert (=> b!631374 (= res!408283 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12320))))

(declare-fun b!631375 () Bool)

(declare-fun e!360981 () Bool)

(assert (=> b!631375 (= e!360981 e!360977)))

(declare-fun res!408281 () Bool)

(assert (=> b!631375 (=> (not res!408281) (not e!360977))))

(declare-fun lt!291699 () SeekEntryResult!6722)

(assert (=> b!631375 (= res!408281 (or (= lt!291699 (MissingZero!6722 i!1108)) (= lt!291699 (MissingVacant!6722 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38096 (_ BitVec 32)) SeekEntryResult!6722)

(assert (=> b!631375 (= lt!291699 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631376 () Bool)

(declare-fun res!408274 () Bool)

(assert (=> b!631376 (=> (not res!408274) (not e!360981))))

(declare-fun arrayContainsKey!0 (array!38096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631376 (= res!408274 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!408282 () Bool)

(assert (=> start!57020 (=> (not res!408282) (not e!360981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57020 (= res!408282 (validMask!0 mask!3053))))

(assert (=> start!57020 e!360981))

(assert (=> start!57020 true))

(declare-fun array_inv!14078 (array!38096) Bool)

(assert (=> start!57020 (array_inv!14078 a!2986)))

(declare-fun b!631377 () Bool)

(declare-fun res!408273 () Bool)

(assert (=> b!631377 (=> (not res!408273) (not e!360981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631377 (= res!408273 (validKeyInArray!0 k!1786))))

(declare-fun b!631378 () Bool)

(declare-fun res!408278 () Bool)

(assert (=> b!631378 (=> (not res!408278) (not e!360977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38096 (_ BitVec 32)) Bool)

(assert (=> b!631378 (= res!408278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631379 () Bool)

(declare-fun res!408275 () Bool)

(assert (=> b!631379 (=> (not res!408275) (not e!360981))))

(assert (=> b!631379 (= res!408275 (and (= (size!18646 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18646 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18646 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631380 () Bool)

(declare-fun res!408280 () Bool)

(assert (=> b!631380 (=> (not res!408280) (not e!360981))))

(assert (=> b!631380 (= res!408280 (validKeyInArray!0 (select (arr!18282 a!2986) j!136)))))

(declare-fun b!631381 () Bool)

(declare-fun Unit!21225 () Unit!21222)

(assert (=> b!631381 (= e!360979 Unit!21225)))

(assert (=> b!631381 false))

(declare-fun lt!291703 () SeekEntryResult!6722)

(declare-fun b!631382 () Bool)

(assert (=> b!631382 (= e!360978 (not (or (not (= lt!291703 (Found!6722 index!984))) (= (select (store (arr!18282 a!2986) i!1108 k!1786) index!984) (select (arr!18282 a!2986) j!136)))))))

(declare-fun lt!291700 () Unit!21222)

(assert (=> b!631382 (= lt!291700 e!360979)))

(declare-fun c!71915 () Bool)

(assert (=> b!631382 (= c!71915 (= lt!291703 Undefined!6722))))

(declare-fun lt!291698 () (_ BitVec 64))

(assert (=> b!631382 (= lt!291703 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291698 lt!291706 mask!3053))))

(assert (=> b!631382 e!360976))

(declare-fun res!408279 () Bool)

(assert (=> b!631382 (=> (not res!408279) (not e!360976))))

(declare-fun lt!291701 () (_ BitVec 32))

(assert (=> b!631382 (= res!408279 (= lt!291705 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 lt!291698 lt!291706 mask!3053)))))

(assert (=> b!631382 (= lt!291705 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 (select (arr!18282 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631382 (= lt!291698 (select (store (arr!18282 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291704 () Unit!21222)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38096 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21222)

(assert (=> b!631382 (= lt!291704 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631382 (= lt!291701 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57020 res!408282) b!631379))

(assert (= (and b!631379 res!408275) b!631380))

(assert (= (and b!631380 res!408280) b!631377))

(assert (= (and b!631377 res!408273) b!631376))

(assert (= (and b!631376 res!408274) b!631375))

(assert (= (and b!631375 res!408281) b!631378))

(assert (= (and b!631378 res!408278) b!631374))

(assert (= (and b!631374 res!408283) b!631373))

(assert (= (and b!631373 res!408277) b!631369))

(assert (= (and b!631369 res!408276) b!631371))

(assert (= (and b!631371 res!408284) b!631382))

(assert (= (and b!631382 res!408279) b!631372))

(assert (= (and b!631382 c!71915) b!631381))

(assert (= (and b!631382 (not c!71915)) b!631370))

(declare-fun m!606303 () Bool)

(assert (=> b!631380 m!606303))

(assert (=> b!631380 m!606303))

(declare-fun m!606305 () Bool)

(assert (=> b!631380 m!606305))

(declare-fun m!606307 () Bool)

(assert (=> b!631373 m!606307))

(declare-fun m!606309 () Bool)

(assert (=> b!631378 m!606309))

(declare-fun m!606311 () Bool)

(assert (=> b!631371 m!606311))

(assert (=> b!631371 m!606303))

(assert (=> b!631371 m!606303))

(declare-fun m!606313 () Bool)

(assert (=> b!631371 m!606313))

(declare-fun m!606315 () Bool)

(assert (=> b!631377 m!606315))

(declare-fun m!606317 () Bool)

(assert (=> start!57020 m!606317))

(declare-fun m!606319 () Bool)

(assert (=> start!57020 m!606319))

(declare-fun m!606321 () Bool)

(assert (=> b!631369 m!606321))

(declare-fun m!606323 () Bool)

(assert (=> b!631369 m!606323))

(declare-fun m!606325 () Bool)

(assert (=> b!631374 m!606325))

(declare-fun m!606327 () Bool)

(assert (=> b!631382 m!606327))

(declare-fun m!606329 () Bool)

(assert (=> b!631382 m!606329))

(assert (=> b!631382 m!606303))

(assert (=> b!631382 m!606303))

(declare-fun m!606331 () Bool)

(assert (=> b!631382 m!606331))

(declare-fun m!606333 () Bool)

(assert (=> b!631382 m!606333))

(declare-fun m!606335 () Bool)

(assert (=> b!631382 m!606335))

(declare-fun m!606337 () Bool)

(assert (=> b!631382 m!606337))

(declare-fun m!606339 () Bool)

(assert (=> b!631382 m!606339))

(assert (=> b!631382 m!606321))

(declare-fun m!606341 () Bool)

(assert (=> b!631376 m!606341))

(declare-fun m!606343 () Bool)

(assert (=> b!631375 m!606343))

(push 1)

(assert (not start!57020))

(assert (not b!631382))

(assert (not b!631378))

(assert (not b!631375))

(assert (not b!631376))

(assert (not b!631374))

(assert (not b!631380))

(assert (not b!631371))

(assert (not b!631377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!33329 () Bool)

(declare-fun call!33332 () Bool)

(declare-fun c!71936 () Bool)

(assert (=> bm!33329 (= call!33332 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71936 (Cons!12319 (select (arr!18282 a!2986) #b00000000000000000000000000000000) Nil!12320) Nil!12320)))))

(declare-fun b!631513 () Bool)

(declare-fun e!361057 () Bool)

(declare-fun e!361056 () Bool)

(assert (=> b!631513 (= e!361057 e!361056)))

(assert (=> b!631513 (= c!71936 (validKeyInArray!0 (select (arr!18282 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631514 () Bool)

(assert (=> b!631514 (= e!361056 call!33332)))

(declare-fun d!89325 () Bool)

(declare-fun res!408375 () Bool)

(declare-fun e!361059 () Bool)

(assert (=> d!89325 (=> res!408375 e!361059)))

(assert (=> d!89325 (= res!408375 (bvsge #b00000000000000000000000000000000 (size!18646 a!2986)))))

(assert (=> d!89325 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12320) e!361059)))

(declare-fun b!631515 () Bool)

(assert (=> b!631515 (= e!361056 call!33332)))

(declare-fun b!631516 () Bool)

(declare-fun e!361058 () Bool)

(declare-fun contains!3088 (List!12323 (_ BitVec 64)) Bool)

(assert (=> b!631516 (= e!361058 (contains!3088 Nil!12320 (select (arr!18282 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631517 () Bool)

(assert (=> b!631517 (= e!361059 e!361057)))

(declare-fun res!408376 () Bool)

(assert (=> b!631517 (=> (not res!408376) (not e!361057))))

(assert (=> b!631517 (= res!408376 (not e!361058))))

(declare-fun res!408377 () Bool)

(assert (=> b!631517 (=> (not res!408377) (not e!361058))))

(assert (=> b!631517 (= res!408377 (validKeyInArray!0 (select (arr!18282 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89325 (not res!408375)) b!631517))

(assert (= (and b!631517 res!408377) b!631516))

(assert (= (and b!631517 res!408376) b!631513))

(assert (= (and b!631513 c!71936) b!631514))

(assert (= (and b!631513 (not c!71936)) b!631515))

(assert (= (or b!631514 b!631515) bm!33329))

(declare-fun m!606449 () Bool)

(assert (=> bm!33329 m!606449))

(declare-fun m!606451 () Bool)

(assert (=> bm!33329 m!606451))

(assert (=> b!631513 m!606449))

(assert (=> b!631513 m!606449))

(declare-fun m!606453 () Bool)

(assert (=> b!631513 m!606453))

(assert (=> b!631516 m!606449))

(assert (=> b!631516 m!606449))

(declare-fun m!606455 () Bool)

(assert (=> b!631516 m!606455))

(assert (=> b!631517 m!606449))

(assert (=> b!631517 m!606449))

(assert (=> b!631517 m!606453))

(assert (=> b!631374 d!89325))

(declare-fun d!89329 () Bool)

(assert (=> d!89329 (= (validKeyInArray!0 (select (arr!18282 a!2986) j!136)) (and (not (= (select (arr!18282 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18282 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631380 d!89329))

(declare-fun b!631572 () Bool)

(declare-fun e!361091 () SeekEntryResult!6722)

(declare-fun e!361092 () SeekEntryResult!6722)

(assert (=> b!631572 (= e!361091 e!361092)))

(declare-fun lt!291799 () (_ BitVec 64))

(declare-fun lt!291798 () SeekEntryResult!6722)

(assert (=> b!631572 (= lt!291799 (select (arr!18282 a!2986) (index!29180 lt!291798)))))

(declare-fun c!71962 () Bool)

(assert (=> b!631572 (= c!71962 (= lt!291799 k!1786))))

(declare-fun d!89331 () Bool)

(declare-fun lt!291797 () SeekEntryResult!6722)

(assert (=> d!89331 (and (or (is-Undefined!6722 lt!291797) (not (is-Found!6722 lt!291797)) (and (bvsge (index!29179 lt!291797) #b00000000000000000000000000000000) (bvslt (index!29179 lt!291797) (size!18646 a!2986)))) (or (is-Undefined!6722 lt!291797) (is-Found!6722 lt!291797) (not (is-MissingZero!6722 lt!291797)) (and (bvsge (index!29178 lt!291797) #b00000000000000000000000000000000) (bvslt (index!29178 lt!291797) (size!18646 a!2986)))) (or (is-Undefined!6722 lt!291797) (is-Found!6722 lt!291797) (is-MissingZero!6722 lt!291797) (not (is-MissingVacant!6722 lt!291797)) (and (bvsge (index!29181 lt!291797) #b00000000000000000000000000000000) (bvslt (index!29181 lt!291797) (size!18646 a!2986)))) (or (is-Undefined!6722 lt!291797) (ite (is-Found!6722 lt!291797) (= (select (arr!18282 a!2986) (index!29179 lt!291797)) k!1786) (ite (is-MissingZero!6722 lt!291797) (= (select (arr!18282 a!2986) (index!29178 lt!291797)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6722 lt!291797) (= (select (arr!18282 a!2986) (index!29181 lt!291797)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89331 (= lt!291797 e!361091)))

(declare-fun c!71961 () Bool)

(assert (=> d!89331 (= c!71961 (and (is-Intermediate!6722 lt!291798) (undefined!7534 lt!291798)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38096 (_ BitVec 32)) SeekEntryResult!6722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89331 (= lt!291798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89331 (validMask!0 mask!3053)))

(assert (=> d!89331 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!291797)))

(declare-fun b!631573 () Bool)

(declare-fun c!71960 () Bool)

(assert (=> b!631573 (= c!71960 (= lt!291799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361093 () SeekEntryResult!6722)

(assert (=> b!631573 (= e!361092 e!361093)))

(declare-fun b!631574 () Bool)

(assert (=> b!631574 (= e!361093 (seekKeyOrZeroReturnVacant!0 (x!57916 lt!291798) (index!29180 lt!291798) (index!29180 lt!291798) k!1786 a!2986 mask!3053))))

(declare-fun b!631575 () Bool)

(assert (=> b!631575 (= e!361092 (Found!6722 (index!29180 lt!291798)))))

(declare-fun b!631576 () Bool)

(assert (=> b!631576 (= e!361093 (MissingZero!6722 (index!29180 lt!291798)))))

(declare-fun b!631577 () Bool)

(assert (=> b!631577 (= e!361091 Undefined!6722)))

(assert (= (and d!89331 c!71961) b!631577))

(assert (= (and d!89331 (not c!71961)) b!631572))

(assert (= (and b!631572 c!71962) b!631575))

(assert (= (and b!631572 (not c!71962)) b!631573))

(assert (= (and b!631573 c!71960) b!631576))

(assert (= (and b!631573 (not c!71960)) b!631574))

(declare-fun m!606483 () Bool)

(assert (=> b!631572 m!606483))

(declare-fun m!606485 () Bool)

(assert (=> d!89331 m!606485))

(declare-fun m!606487 () Bool)

(assert (=> d!89331 m!606487))

(declare-fun m!606489 () Bool)

(assert (=> d!89331 m!606489))

(declare-fun m!606491 () Bool)

(assert (=> d!89331 m!606491))

(declare-fun m!606493 () Bool)

(assert (=> d!89331 m!606493))

(assert (=> d!89331 m!606317))

(assert (=> d!89331 m!606487))

(declare-fun m!606495 () Bool)

(assert (=> b!631574 m!606495))

(assert (=> b!631375 d!89331))

(declare-fun b!631616 () Bool)

(declare-fun e!361124 () Bool)

(declare-fun call!33341 () Bool)

(assert (=> b!631616 (= e!361124 call!33341)))

(declare-fun bm!33338 () Bool)

(assert (=> bm!33338 (= call!33341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!631617 () Bool)

(declare-fun e!361125 () Bool)

(assert (=> b!631617 (= e!361124 e!361125)))

(declare-fun lt!291820 () (_ BitVec 64))

(assert (=> b!631617 (= lt!291820 (select (arr!18282 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291819 () Unit!21222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38096 (_ BitVec 64) (_ BitVec 32)) Unit!21222)

(assert (=> b!631617 (= lt!291819 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291820 #b00000000000000000000000000000000))))

(assert (=> b!631617 (arrayContainsKey!0 a!2986 lt!291820 #b00000000000000000000000000000000)))

(declare-fun lt!291818 () Unit!21222)

(assert (=> b!631617 (= lt!291818 lt!291819)))

(declare-fun res!408407 () Bool)

(assert (=> b!631617 (= res!408407 (= (seekEntryOrOpen!0 (select (arr!18282 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6722 #b00000000000000000000000000000000)))))

(assert (=> b!631617 (=> (not res!408407) (not e!361125))))

(declare-fun b!631618 () Bool)

(assert (=> b!631618 (= e!361125 call!33341)))

(declare-fun b!631619 () Bool)

(declare-fun e!361123 () Bool)

(assert (=> b!631619 (= e!361123 e!361124)))

(declare-fun c!71972 () Bool)

(assert (=> b!631619 (= c!71972 (validKeyInArray!0 (select (arr!18282 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89347 () Bool)

(declare-fun res!408406 () Bool)

(assert (=> d!89347 (=> res!408406 e!361123)))

(assert (=> d!89347 (= res!408406 (bvsge #b00000000000000000000000000000000 (size!18646 a!2986)))))

(assert (=> d!89347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361123)))

(assert (= (and d!89347 (not res!408406)) b!631619))

(assert (= (and b!631619 c!71972) b!631617))

(assert (= (and b!631619 (not c!71972)) b!631616))

(assert (= (and b!631617 res!408407) b!631618))

(assert (= (or b!631618 b!631616) bm!33338))

(declare-fun m!606527 () Bool)

(assert (=> bm!33338 m!606527))

(assert (=> b!631617 m!606449))

(declare-fun m!606529 () Bool)

(assert (=> b!631617 m!606529))

(declare-fun m!606531 () Bool)

(assert (=> b!631617 m!606531))

(assert (=> b!631617 m!606449))

(declare-fun m!606533 () Bool)

(assert (=> b!631617 m!606533))

(assert (=> b!631619 m!606449))

(assert (=> b!631619 m!606449))

(assert (=> b!631619 m!606453))

(assert (=> b!631378 d!89347))

(declare-fun b!631668 () Bool)

(declare-fun e!361151 () SeekEntryResult!6722)

(assert (=> b!631668 (= e!361151 (MissingVacant!6722 vacantSpotIndex!68))))

(declare-fun b!631670 () Bool)

(declare-fun e!361150 () SeekEntryResult!6722)

(assert (=> b!631670 (= e!361150 Undefined!6722)))

(declare-fun b!631671 () Bool)

(declare-fun e!361152 () SeekEntryResult!6722)

(assert (=> b!631671 (= e!361152 (Found!6722 lt!291701))))

(declare-fun b!631672 () Bool)

(assert (=> b!631672 (= e!361151 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291701 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!291698 lt!291706 mask!3053))))

(declare-fun b!631673 () Bool)

(declare-fun c!71998 () Bool)

(declare-fun lt!291844 () (_ BitVec 64))

(assert (=> b!631673 (= c!71998 (= lt!291844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631673 (= e!361152 e!361151)))

(declare-fun lt!291843 () SeekEntryResult!6722)

(declare-fun d!89361 () Bool)

(assert (=> d!89361 (and (or (is-Undefined!6722 lt!291843) (not (is-Found!6722 lt!291843)) (and (bvsge (index!29179 lt!291843) #b00000000000000000000000000000000) (bvslt (index!29179 lt!291843) (size!18646 lt!291706)))) (or (is-Undefined!6722 lt!291843) (is-Found!6722 lt!291843) (not (is-MissingVacant!6722 lt!291843)) (not (= (index!29181 lt!291843) vacantSpotIndex!68)) (and (bvsge (index!29181 lt!291843) #b00000000000000000000000000000000) (bvslt (index!29181 lt!291843) (size!18646 lt!291706)))) (or (is-Undefined!6722 lt!291843) (ite (is-Found!6722 lt!291843) (= (select (arr!18282 lt!291706) (index!29179 lt!291843)) lt!291698) (and (is-MissingVacant!6722 lt!291843) (= (index!29181 lt!291843) vacantSpotIndex!68) (= (select (arr!18282 lt!291706) (index!29181 lt!291843)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89361 (= lt!291843 e!361150)))

(declare-fun c!71997 () Bool)

(assert (=> d!89361 (= c!71997 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89361 (= lt!291844 (select (arr!18282 lt!291706) lt!291701))))

(assert (=> d!89361 (validMask!0 mask!3053)))

(assert (=> d!89361 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 lt!291698 lt!291706 mask!3053) lt!291843)))

(declare-fun b!631669 () Bool)

(assert (=> b!631669 (= e!361150 e!361152)))

(declare-fun c!71999 () Bool)

(assert (=> b!631669 (= c!71999 (= lt!291844 lt!291698))))

(assert (= (and d!89361 c!71997) b!631670))

(assert (= (and d!89361 (not c!71997)) b!631669))

(assert (= (and b!631669 c!71999) b!631671))

(assert (= (and b!631669 (not c!71999)) b!631673))

(assert (= (and b!631673 c!71998) b!631668))

(assert (= (and b!631673 (not c!71998)) b!631672))

(declare-fun m!606563 () Bool)

(assert (=> b!631672 m!606563))

(assert (=> b!631672 m!606563))

(declare-fun m!606565 () Bool)

(assert (=> b!631672 m!606565))

(declare-fun m!606567 () Bool)

(assert (=> d!89361 m!606567))

(declare-fun m!606569 () Bool)

(assert (=> d!89361 m!606569))

(declare-fun m!606571 () Bool)

(assert (=> d!89361 m!606571))

(assert (=> d!89361 m!606317))

(assert (=> b!631382 d!89361))

(declare-fun b!631674 () Bool)

(declare-fun e!361154 () SeekEntryResult!6722)

(assert (=> b!631674 (= e!361154 (MissingVacant!6722 vacantSpotIndex!68))))

(declare-fun b!631676 () Bool)

(declare-fun e!361153 () SeekEntryResult!6722)

(assert (=> b!631676 (= e!361153 Undefined!6722)))

(declare-fun b!631677 () Bool)

(declare-fun e!361155 () SeekEntryResult!6722)

(assert (=> b!631677 (= e!361155 (Found!6722 index!984))))

(declare-fun b!631678 () Bool)

(assert (=> b!631678 (= e!361154 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291698 lt!291706 mask!3053))))

(declare-fun b!631679 () Bool)

(declare-fun c!72001 () Bool)

(declare-fun lt!291846 () (_ BitVec 64))

(assert (=> b!631679 (= c!72001 (= lt!291846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631679 (= e!361155 e!361154)))

(declare-fun lt!291845 () SeekEntryResult!6722)

(declare-fun d!89367 () Bool)

(assert (=> d!89367 (and (or (is-Undefined!6722 lt!291845) (not (is-Found!6722 lt!291845)) (and (bvsge (index!29179 lt!291845) #b00000000000000000000000000000000) (bvslt (index!29179 lt!291845) (size!18646 lt!291706)))) (or (is-Undefined!6722 lt!291845) (is-Found!6722 lt!291845) (not (is-MissingVacant!6722 lt!291845)) (not (= (index!29181 lt!291845) vacantSpotIndex!68)) (and (bvsge (index!29181 lt!291845) #b00000000000000000000000000000000) (bvslt (index!29181 lt!291845) (size!18646 lt!291706)))) (or (is-Undefined!6722 lt!291845) (ite (is-Found!6722 lt!291845) (= (select (arr!18282 lt!291706) (index!29179 lt!291845)) lt!291698) (and (is-MissingVacant!6722 lt!291845) (= (index!29181 lt!291845) vacantSpotIndex!68) (= (select (arr!18282 lt!291706) (index!29181 lt!291845)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89367 (= lt!291845 e!361153)))

(declare-fun c!72000 () Bool)

(assert (=> d!89367 (= c!72000 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89367 (= lt!291846 (select (arr!18282 lt!291706) index!984))))

(assert (=> d!89367 (validMask!0 mask!3053)))

(assert (=> d!89367 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291698 lt!291706 mask!3053) lt!291845)))

(declare-fun b!631675 () Bool)

(assert (=> b!631675 (= e!361153 e!361155)))

(declare-fun c!72002 () Bool)

(assert (=> b!631675 (= c!72002 (= lt!291846 lt!291698))))

(assert (= (and d!89367 c!72000) b!631676))

(assert (= (and d!89367 (not c!72000)) b!631675))

(assert (= (and b!631675 c!72002) b!631677))

(assert (= (and b!631675 (not c!72002)) b!631679))

(assert (= (and b!631679 c!72001) b!631674))

(assert (= (and b!631679 (not c!72001)) b!631678))

(assert (=> b!631678 m!606327))

(assert (=> b!631678 m!606327))

(declare-fun m!606573 () Bool)

(assert (=> b!631678 m!606573))

(declare-fun m!606575 () Bool)

(assert (=> d!89367 m!606575))

(declare-fun m!606577 () Bool)

(assert (=> d!89367 m!606577))

(declare-fun m!606579 () Bool)

(assert (=> d!89367 m!606579))

(assert (=> d!89367 m!606317))

(assert (=> b!631382 d!89367))

(declare-fun d!89369 () Bool)

(declare-fun lt!291849 () (_ BitVec 32))

(assert (=> d!89369 (and (bvsge lt!291849 #b00000000000000000000000000000000) (bvslt lt!291849 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89369 (= lt!291849 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89369 (validMask!0 mask!3053)))

(assert (=> d!89369 (= (nextIndex!0 index!984 x!910 mask!3053) lt!291849)))

(declare-fun bs!19028 () Bool)

(assert (= bs!19028 d!89369))

(declare-fun m!606581 () Bool)

(assert (=> bs!19028 m!606581))

(assert (=> bs!19028 m!606317))

(assert (=> b!631382 d!89369))

(declare-fun d!89371 () Bool)

(declare-fun e!361175 () Bool)

(assert (=> d!89371 e!361175))

(declare-fun res!408421 () Bool)

(assert (=> d!89371 (=> (not res!408421) (not e!361175))))

(assert (=> d!89371 (= res!408421 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18646 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18646 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18646 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18646 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18646 a!2986))))))

(declare-fun lt!291856 () Unit!21222)

(declare-fun choose!9 (array!38096 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21222)

(assert (=> d!89371 (= lt!291856 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89371 (validMask!0 mask!3053)))

(assert (=> d!89371 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 mask!3053) lt!291856)))

(declare-fun b!631703 () Bool)

(assert (=> b!631703 (= e!361175 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 (select (arr!18282 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 (select (store (arr!18282 a!2986) i!1108 k!1786) j!136) (array!38097 (store (arr!18282 a!2986) i!1108 k!1786) (size!18646 a!2986)) mask!3053)))))

(assert (= (and d!89371 res!408421) b!631703))

(declare-fun m!606595 () Bool)

(assert (=> d!89371 m!606595))

(assert (=> d!89371 m!606317))

(assert (=> b!631703 m!606303))

(assert (=> b!631703 m!606331))

(assert (=> b!631703 m!606329))

(declare-fun m!606597 () Bool)

(assert (=> b!631703 m!606597))

(assert (=> b!631703 m!606303))

(assert (=> b!631703 m!606329))

(assert (=> b!631703 m!606321))

(assert (=> b!631382 d!89371))

(declare-fun b!631706 () Bool)

(declare-fun e!361177 () SeekEntryResult!6722)

(assert (=> b!631706 (= e!361177 (MissingVacant!6722 vacantSpotIndex!68))))

(declare-fun b!631708 () Bool)

(declare-fun e!361176 () SeekEntryResult!6722)

(assert (=> b!631708 (= e!361176 Undefined!6722)))

(declare-fun b!631709 () Bool)

(declare-fun e!361178 () SeekEntryResult!6722)

(assert (=> b!631709 (= e!361178 (Found!6722 lt!291701))))

(declare-fun b!631710 () Bool)

(assert (=> b!631710 (= e!361177 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291701 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18282 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631711 () Bool)

(declare-fun c!72010 () Bool)

(declare-fun lt!291858 () (_ BitVec 64))

(assert (=> b!631711 (= c!72010 (= lt!291858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631711 (= e!361178 e!361177)))

(declare-fun lt!291857 () SeekEntryResult!6722)

(declare-fun d!89381 () Bool)

(assert (=> d!89381 (and (or (is-Undefined!6722 lt!291857) (not (is-Found!6722 lt!291857)) (and (bvsge (index!29179 lt!291857) #b00000000000000000000000000000000) (bvslt (index!29179 lt!291857) (size!18646 a!2986)))) (or (is-Undefined!6722 lt!291857) (is-Found!6722 lt!291857) (not (is-MissingVacant!6722 lt!291857)) (not (= (index!29181 lt!291857) vacantSpotIndex!68)) (and (bvsge (index!29181 lt!291857) #b00000000000000000000000000000000) (bvslt (index!29181 lt!291857) (size!18646 a!2986)))) (or (is-Undefined!6722 lt!291857) (ite (is-Found!6722 lt!291857) (= (select (arr!18282 a!2986) (index!29179 lt!291857)) (select (arr!18282 a!2986) j!136)) (and (is-MissingVacant!6722 lt!291857) (= (index!29181 lt!291857) vacantSpotIndex!68) (= (select (arr!18282 a!2986) (index!29181 lt!291857)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89381 (= lt!291857 e!361176)))

(declare-fun c!72009 () Bool)

(assert (=> d!89381 (= c!72009 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89381 (= lt!291858 (select (arr!18282 a!2986) lt!291701))))

(assert (=> d!89381 (validMask!0 mask!3053)))

(assert (=> d!89381 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291701 vacantSpotIndex!68 (select (arr!18282 a!2986) j!136) a!2986 mask!3053) lt!291857)))

(declare-fun b!631707 () Bool)

(assert (=> b!631707 (= e!361176 e!361178)))

(declare-fun c!72011 () Bool)

(assert (=> b!631707 (= c!72011 (= lt!291858 (select (arr!18282 a!2986) j!136)))))

(assert (= (and d!89381 c!72009) b!631708))

(assert (= (and d!89381 (not c!72009)) b!631707))

(assert (= (and b!631707 c!72011) b!631709))

(assert (= (and b!631707 (not c!72011)) b!631711))

(assert (= (and b!631711 c!72010) b!631706))

(assert (= (and b!631711 (not c!72010)) b!631710))

(assert (=> b!631710 m!606563))

(assert (=> b!631710 m!606563))

(assert (=> b!631710 m!606303))

(declare-fun m!606599 () Bool)

(assert (=> b!631710 m!606599))

(declare-fun m!606601 () Bool)

(assert (=> d!89381 m!606601))

(declare-fun m!606603 () Bool)

(assert (=> d!89381 m!606603))

(declare-fun m!606605 () Bool)

