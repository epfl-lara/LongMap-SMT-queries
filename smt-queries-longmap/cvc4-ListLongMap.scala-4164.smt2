; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56676 () Bool)

(assert start!56676)

(declare-fun b!628306 () Bool)

(declare-fun res!406007 () Bool)

(declare-fun e!359491 () Bool)

(assert (=> b!628306 (=> (not res!406007) (not e!359491))))

(declare-datatypes ((array!37968 0))(
  ( (array!37969 (arr!18224 (Array (_ BitVec 32) (_ BitVec 64))) (size!18588 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37968)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37968 (_ BitVec 32)) Bool)

(assert (=> b!628306 (= res!406007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628307 () Bool)

(declare-fun res!406008 () Bool)

(declare-fun e!359492 () Bool)

(assert (=> b!628307 (=> (not res!406008) (not e!359492))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628307 (= res!406008 (and (= (size!18588 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18588 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18588 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628308 () Bool)

(declare-fun res!406011 () Bool)

(assert (=> b!628308 (=> (not res!406011) (not e!359491))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628308 (= res!406011 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18224 a!2986) index!984) (select (arr!18224 a!2986) j!136))) (not (= (select (arr!18224 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628309 () Bool)

(declare-fun res!406010 () Bool)

(assert (=> b!628309 (=> (not res!406010) (not e!359491))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6664 0))(
  ( (MissingZero!6664 (index!28940 (_ BitVec 32))) (Found!6664 (index!28941 (_ BitVec 32))) (Intermediate!6664 (undefined!7476 Bool) (index!28942 (_ BitVec 32)) (x!57668 (_ BitVec 32))) (Undefined!6664) (MissingVacant!6664 (index!28943 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37968 (_ BitVec 32)) SeekEntryResult!6664)

(assert (=> b!628309 (= res!406010 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18224 a!2986) j!136) a!2986 mask!3053) (Found!6664 j!136)))))

(declare-fun b!628311 () Bool)

(assert (=> b!628311 (= e!359492 e!359491)))

(declare-fun res!406014 () Bool)

(assert (=> b!628311 (=> (not res!406014) (not e!359491))))

(declare-fun lt!290436 () SeekEntryResult!6664)

(assert (=> b!628311 (= res!406014 (or (= lt!290436 (MissingZero!6664 i!1108)) (= lt!290436 (MissingVacant!6664 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37968 (_ BitVec 32)) SeekEntryResult!6664)

(assert (=> b!628311 (= lt!290436 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628312 () Bool)

(declare-fun res!406015 () Bool)

(assert (=> b!628312 (=> (not res!406015) (not e!359491))))

(assert (=> b!628312 (= res!406015 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18224 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18224 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628313 () Bool)

(declare-fun res!406012 () Bool)

(assert (=> b!628313 (=> (not res!406012) (not e!359492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628313 (= res!406012 (validKeyInArray!0 (select (arr!18224 a!2986) j!136)))))

(declare-fun b!628314 () Bool)

(declare-fun lt!290437 () (_ BitVec 32))

(assert (=> b!628314 (= e!359491 (or (bvslt lt!290437 #b00000000000000000000000000000000) (bvsge lt!290437 (bvadd mask!3053 #b00000000000000000000000000000001))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628314 (= lt!290437 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!406013 () Bool)

(assert (=> start!56676 (=> (not res!406013) (not e!359492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56676 (= res!406013 (validMask!0 mask!3053))))

(assert (=> start!56676 e!359492))

(assert (=> start!56676 true))

(declare-fun array_inv!14020 (array!37968) Bool)

(assert (=> start!56676 (array_inv!14020 a!2986)))

(declare-fun b!628310 () Bool)

(declare-fun res!406009 () Bool)

(assert (=> b!628310 (=> (not res!406009) (not e!359492))))

(assert (=> b!628310 (= res!406009 (validKeyInArray!0 k!1786))))

(declare-fun b!628315 () Bool)

(declare-fun res!406016 () Bool)

(assert (=> b!628315 (=> (not res!406016) (not e!359492))))

(declare-fun arrayContainsKey!0 (array!37968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628315 (= res!406016 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628316 () Bool)

(declare-fun res!406006 () Bool)

(assert (=> b!628316 (=> (not res!406006) (not e!359491))))

(declare-datatypes ((List!12265 0))(
  ( (Nil!12262) (Cons!12261 (h!13306 (_ BitVec 64)) (t!18493 List!12265)) )
))
(declare-fun arrayNoDuplicates!0 (array!37968 (_ BitVec 32) List!12265) Bool)

(assert (=> b!628316 (= res!406006 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12262))))

(assert (= (and start!56676 res!406013) b!628307))

(assert (= (and b!628307 res!406008) b!628313))

(assert (= (and b!628313 res!406012) b!628310))

(assert (= (and b!628310 res!406009) b!628315))

(assert (= (and b!628315 res!406016) b!628311))

(assert (= (and b!628311 res!406014) b!628306))

(assert (= (and b!628306 res!406007) b!628316))

(assert (= (and b!628316 res!406006) b!628312))

(assert (= (and b!628312 res!406015) b!628309))

(assert (= (and b!628309 res!406010) b!628308))

(assert (= (and b!628308 res!406011) b!628314))

(declare-fun m!603537 () Bool)

(assert (=> b!628308 m!603537))

(declare-fun m!603539 () Bool)

(assert (=> b!628308 m!603539))

(declare-fun m!603541 () Bool)

(assert (=> b!628310 m!603541))

(declare-fun m!603543 () Bool)

(assert (=> b!628314 m!603543))

(declare-fun m!603545 () Bool)

(assert (=> b!628306 m!603545))

(assert (=> b!628313 m!603539))

(assert (=> b!628313 m!603539))

(declare-fun m!603547 () Bool)

(assert (=> b!628313 m!603547))

(declare-fun m!603549 () Bool)

(assert (=> b!628312 m!603549))

(declare-fun m!603551 () Bool)

(assert (=> b!628312 m!603551))

(declare-fun m!603553 () Bool)

(assert (=> b!628312 m!603553))

(declare-fun m!603555 () Bool)

(assert (=> start!56676 m!603555))

(declare-fun m!603557 () Bool)

(assert (=> start!56676 m!603557))

(assert (=> b!628309 m!603539))

(assert (=> b!628309 m!603539))

(declare-fun m!603559 () Bool)

(assert (=> b!628309 m!603559))

(declare-fun m!603561 () Bool)

(assert (=> b!628315 m!603561))

(declare-fun m!603563 () Bool)

(assert (=> b!628316 m!603563))

(declare-fun m!603565 () Bool)

(assert (=> b!628311 m!603565))

(push 1)

(assert (not b!628309))

(assert (not b!628306))

(assert (not b!628313))

(assert (not b!628310))

(assert (not b!628316))

(assert (not b!628314))

(assert (not b!628315))

(assert (not b!628311))

(assert (not start!56676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89001 () Bool)

(assert (=> d!89001 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628310 d!89001))

(declare-fun b!628366 () Bool)

(declare-fun e!359537 () Bool)

(declare-fun e!359536 () Bool)

(assert (=> b!628366 (= e!359537 e!359536)))

(declare-fun c!71525 () Bool)

(assert (=> b!628366 (= c!71525 (validKeyInArray!0 (select (arr!18224 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628367 () Bool)

(declare-fun e!359538 () Bool)

(assert (=> b!628367 (= e!359538 e!359537)))

(declare-fun res!406052 () Bool)

(assert (=> b!628367 (=> (not res!406052) (not e!359537))))

(declare-fun e!359535 () Bool)

(assert (=> b!628367 (= res!406052 (not e!359535))))

(declare-fun res!406051 () Bool)

(assert (=> b!628367 (=> (not res!406051) (not e!359535))))

(assert (=> b!628367 (= res!406051 (validKeyInArray!0 (select (arr!18224 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628368 () Bool)

(declare-fun call!33263 () Bool)

(assert (=> b!628368 (= e!359536 call!33263)))

(declare-fun b!628369 () Bool)

(assert (=> b!628369 (= e!359536 call!33263)))

(declare-fun b!628370 () Bool)

(declare-fun contains!3080 (List!12265 (_ BitVec 64)) Bool)

(assert (=> b!628370 (= e!359535 (contains!3080 Nil!12262 (select (arr!18224 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89003 () Bool)

(declare-fun res!406050 () Bool)

(assert (=> d!89003 (=> res!406050 e!359538)))

(assert (=> d!89003 (= res!406050 (bvsge #b00000000000000000000000000000000 (size!18588 a!2986)))))

(assert (=> d!89003 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12262) e!359538)))

(declare-fun bm!33260 () Bool)

(assert (=> bm!33260 (= call!33263 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71525 (Cons!12261 (select (arr!18224 a!2986) #b00000000000000000000000000000000) Nil!12262) Nil!12262)))))

(assert (= (and d!89003 (not res!406050)) b!628367))

(assert (= (and b!628367 res!406051) b!628370))

(assert (= (and b!628367 res!406052) b!628366))

(assert (= (and b!628366 c!71525) b!628368))

(assert (= (and b!628366 (not c!71525)) b!628369))

(assert (= (or b!628368 b!628369) bm!33260))

(declare-fun m!603591 () Bool)

(assert (=> b!628366 m!603591))

(assert (=> b!628366 m!603591))

(declare-fun m!603593 () Bool)

(assert (=> b!628366 m!603593))

(assert (=> b!628367 m!603591))

(assert (=> b!628367 m!603591))

(assert (=> b!628367 m!603593))

(assert (=> b!628370 m!603591))

(assert (=> b!628370 m!603591))

(declare-fun m!603595 () Bool)

(assert (=> b!628370 m!603595))

(assert (=> bm!33260 m!603591))

(declare-fun m!603597 () Bool)

(assert (=> bm!33260 m!603597))

(assert (=> b!628316 d!89003))

(declare-fun b!628419 () Bool)

(declare-fun e!359564 () SeekEntryResult!6664)

(assert (=> b!628419 (= e!359564 Undefined!6664)))

(declare-fun b!628420 () Bool)

(declare-fun e!359563 () SeekEntryResult!6664)

(declare-fun lt!290468 () SeekEntryResult!6664)

(assert (=> b!628420 (= e!359563 (Found!6664 (index!28942 lt!290468)))))

(declare-fun b!628421 () Bool)

(assert (=> b!628421 (= e!359564 e!359563)))

(declare-fun lt!290469 () (_ BitVec 64))

(assert (=> b!628421 (= lt!290469 (select (arr!18224 a!2986) (index!28942 lt!290468)))))

(declare-fun c!71550 () Bool)

(assert (=> b!628421 (= c!71550 (= lt!290469 k!1786))))

(declare-fun d!89009 () Bool)

(declare-fun lt!290470 () SeekEntryResult!6664)

(assert (=> d!89009 (and (or (is-Undefined!6664 lt!290470) (not (is-Found!6664 lt!290470)) (and (bvsge (index!28941 lt!290470) #b00000000000000000000000000000000) (bvslt (index!28941 lt!290470) (size!18588 a!2986)))) (or (is-Undefined!6664 lt!290470) (is-Found!6664 lt!290470) (not (is-MissingZero!6664 lt!290470)) (and (bvsge (index!28940 lt!290470) #b00000000000000000000000000000000) (bvslt (index!28940 lt!290470) (size!18588 a!2986)))) (or (is-Undefined!6664 lt!290470) (is-Found!6664 lt!290470) (is-MissingZero!6664 lt!290470) (not (is-MissingVacant!6664 lt!290470)) (and (bvsge (index!28943 lt!290470) #b00000000000000000000000000000000) (bvslt (index!28943 lt!290470) (size!18588 a!2986)))) (or (is-Undefined!6664 lt!290470) (ite (is-Found!6664 lt!290470) (= (select (arr!18224 a!2986) (index!28941 lt!290470)) k!1786) (ite (is-MissingZero!6664 lt!290470) (= (select (arr!18224 a!2986) (index!28940 lt!290470)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6664 lt!290470) (= (select (arr!18224 a!2986) (index!28943 lt!290470)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89009 (= lt!290470 e!359564)))

(declare-fun c!71552 () Bool)

(assert (=> d!89009 (= c!71552 (and (is-Intermediate!6664 lt!290468) (undefined!7476 lt!290468)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37968 (_ BitVec 32)) SeekEntryResult!6664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89009 (= lt!290468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89009 (validMask!0 mask!3053)))

(assert (=> d!89009 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!290470)))

(declare-fun e!359565 () SeekEntryResult!6664)

(declare-fun b!628422 () Bool)

(assert (=> b!628422 (= e!359565 (seekKeyOrZeroReturnVacant!0 (x!57668 lt!290468) (index!28942 lt!290468) (index!28942 lt!290468) k!1786 a!2986 mask!3053))))

(declare-fun b!628423 () Bool)

(declare-fun c!71551 () Bool)

(assert (=> b!628423 (= c!71551 (= lt!290469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628423 (= e!359563 e!359565)))

(declare-fun b!628424 () Bool)

(assert (=> b!628424 (= e!359565 (MissingZero!6664 (index!28942 lt!290468)))))

(assert (= (and d!89009 c!71552) b!628419))

(assert (= (and d!89009 (not c!71552)) b!628421))

(assert (= (and b!628421 c!71550) b!628420))

(assert (= (and b!628421 (not c!71550)) b!628423))

(assert (= (and b!628423 c!71551) b!628424))

(assert (= (and b!628423 (not c!71551)) b!628422))

(declare-fun m!603619 () Bool)

(assert (=> b!628421 m!603619))

(declare-fun m!603621 () Bool)

(assert (=> d!89009 m!603621))

(declare-fun m!603623 () Bool)

(assert (=> d!89009 m!603623))

(declare-fun m!603625 () Bool)

(assert (=> d!89009 m!603625))

(declare-fun m!603627 () Bool)

(assert (=> d!89009 m!603627))

(assert (=> d!89009 m!603555))

(assert (=> d!89009 m!603625))

(declare-fun m!603629 () Bool)

(assert (=> d!89009 m!603629))

(declare-fun m!603631 () Bool)

(assert (=> b!628422 m!603631))

(assert (=> b!628311 d!89009))

(declare-fun d!89015 () Bool)

(declare-fun lt!290473 () (_ BitVec 32))

(assert (=> d!89015 (and (bvsge lt!290473 #b00000000000000000000000000000000) (bvslt lt!290473 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89015 (= lt!290473 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89015 (validMask!0 mask!3053)))

(assert (=> d!89015 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290473)))

(declare-fun bs!18955 () Bool)

(assert (= bs!18955 d!89015))

(declare-fun m!603633 () Bool)

(assert (=> bs!18955 m!603633))

(assert (=> bs!18955 m!603555))

(assert (=> b!628314 d!89015))

(declare-fun b!628481 () Bool)

(declare-fun e!359598 () SeekEntryResult!6664)

(assert (=> b!628481 (= e!359598 (Found!6664 index!984))))

(declare-fun b!628482 () Bool)

(declare-fun e!359596 () SeekEntryResult!6664)

(assert (=> b!628482 (= e!359596 e!359598)))

(declare-fun c!71579 () Bool)

(declare-fun lt!290499 () (_ BitVec 64))

(assert (=> b!628482 (= c!71579 (= lt!290499 (select (arr!18224 a!2986) j!136)))))

(declare-fun lt!290500 () SeekEntryResult!6664)

(declare-fun d!89017 () Bool)

(assert (=> d!89017 (and (or (is-Undefined!6664 lt!290500) (not (is-Found!6664 lt!290500)) (and (bvsge (index!28941 lt!290500) #b00000000000000000000000000000000) (bvslt (index!28941 lt!290500) (size!18588 a!2986)))) (or (is-Undefined!6664 lt!290500) (is-Found!6664 lt!290500) (not (is-MissingVacant!6664 lt!290500)) (not (= (index!28943 lt!290500) vacantSpotIndex!68)) (and (bvsge (index!28943 lt!290500) #b00000000000000000000000000000000) (bvslt (index!28943 lt!290500) (size!18588 a!2986)))) (or (is-Undefined!6664 lt!290500) (ite (is-Found!6664 lt!290500) (= (select (arr!18224 a!2986) (index!28941 lt!290500)) (select (arr!18224 a!2986) j!136)) (and (is-MissingVacant!6664 lt!290500) (= (index!28943 lt!290500) vacantSpotIndex!68) (= (select (arr!18224 a!2986) (index!28943 lt!290500)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89017 (= lt!290500 e!359596)))

(declare-fun c!71580 () Bool)

(assert (=> d!89017 (= c!71580 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89017 (= lt!290499 (select (arr!18224 a!2986) index!984))))

(assert (=> d!89017 (validMask!0 mask!3053)))

(assert (=> d!89017 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18224 a!2986) j!136) a!2986 mask!3053) lt!290500)))

(declare-fun b!628483 () Bool)

(declare-fun c!71581 () Bool)

(assert (=> b!628483 (= c!71581 (= lt!290499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359597 () SeekEntryResult!6664)

(assert (=> b!628483 (= e!359598 e!359597)))

(declare-fun b!628484 () Bool)

(assert (=> b!628484 (= e!359596 Undefined!6664)))

(declare-fun b!628485 () Bool)

(assert (=> b!628485 (= e!359597 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18224 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628486 () Bool)

(assert (=> b!628486 (= e!359597 (MissingVacant!6664 vacantSpotIndex!68))))

(assert (= (and d!89017 c!71580) b!628484))

(assert (= (and d!89017 (not c!71580)) b!628482))

(assert (= (and b!628482 c!71579) b!628481))

(assert (= (and b!628482 (not c!71579)) b!628483))

(assert (= (and b!628483 c!71581) b!628486))

(assert (= (and b!628483 (not c!71581)) b!628485))

(declare-fun m!603655 () Bool)

(assert (=> d!89017 m!603655))

(declare-fun m!603657 () Bool)

(assert (=> d!89017 m!603657))

(assert (=> d!89017 m!603537))

(assert (=> d!89017 m!603555))

(assert (=> b!628485 m!603543))

(assert (=> b!628485 m!603543))

(assert (=> b!628485 m!603539))

(declare-fun m!603659 () Bool)

(assert (=> b!628485 m!603659))

(assert (=> b!628309 d!89017))

(declare-fun d!89023 () Bool)

(declare-fun res!406063 () Bool)

(declare-fun e!359606 () Bool)

(assert (=> d!89023 (=> res!406063 e!359606)))

(assert (=> d!89023 (= res!406063 (= (select (arr!18224 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89023 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!359606)))

(declare-fun b!628495 () Bool)

(declare-fun e!359607 () Bool)

(assert (=> b!628495 (= e!359606 e!359607)))

(declare-fun res!406064 () Bool)

(assert (=> b!628495 (=> (not res!406064) (not e!359607))))

(assert (=> b!628495 (= res!406064 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18588 a!2986)))))

(declare-fun b!628496 () Bool)

(assert (=> b!628496 (= e!359607 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89023 (not res!406063)) b!628495))

(assert (= (and b!628495 res!406064) b!628496))

(assert (=> d!89023 m!603591))

(declare-fun m!603669 () Bool)

(assert (=> b!628496 m!603669))

(assert (=> b!628315 d!89023))

(declare-fun d!89027 () Bool)

(assert (=> d!89027 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56676 d!89027))

(declare-fun d!89037 () Bool)

(assert (=> d!89037 (= (array_inv!14020 a!2986) (bvsge (size!18588 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56676 d!89037))

(declare-fun d!89039 () Bool)

(assert (=> d!89039 (= (validKeyInArray!0 (select (arr!18224 a!2986) j!136)) (and (not (= (select (arr!18224 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18224 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628313 d!89039))

(declare-fun b!628520 () Bool)

(declare-fun e!359628 () Bool)

(declare-fun call!33272 () Bool)

(assert (=> b!628520 (= e!359628 call!33272)))

(declare-fun b!628521 () Bool)

(declare-fun e!359626 () Bool)

(assert (=> b!628521 (= e!359626 call!33272)))

(declare-fun b!628522 () Bool)

(declare-fun e!359627 () Bool)

(assert (=> b!628522 (= e!359627 e!359626)))

(declare-fun c!71588 () Bool)

(assert (=> b!628522 (= c!71588 (validKeyInArray!0 (select (arr!18224 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89041 () Bool)

(declare-fun res!406078 () Bool)

(assert (=> d!89041 (=> res!406078 e!359627)))

(assert (=> d!89041 (= res!406078 (bvsge #b00000000000000000000000000000000 (size!18588 a!2986)))))

(assert (=> d!89041 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359627)))

(declare-fun bm!33269 () Bool)

(assert (=> bm!33269 (= call!33272 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!628523 () Bool)

(assert (=> b!628523 (= e!359626 e!359628)))

(declare-fun lt!290516 () (_ BitVec 64))

(assert (=> b!628523 (= lt!290516 (select (arr!18224 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21102 0))(
  ( (Unit!21103) )
))
(declare-fun lt!290517 () Unit!21102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37968 (_ BitVec 64) (_ BitVec 32)) Unit!21102)

(assert (=> b!628523 (= lt!290517 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290516 #b00000000000000000000000000000000))))

(assert (=> b!628523 (arrayContainsKey!0 a!2986 lt!290516 #b00000000000000000000000000000000)))

(declare-fun lt!290518 () Unit!21102)

(assert (=> b!628523 (= lt!290518 lt!290517)))

(declare-fun res!406079 () Bool)

(assert (=> b!628523 (= res!406079 (= (seekEntryOrOpen!0 (select (arr!18224 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6664 #b00000000000000000000000000000000)))))

(assert (=> b!628523 (=> (not res!406079) (not e!359628))))

(assert (= (and d!89041 (not res!406078)) b!628522))

(assert (= (and b!628522 c!71588) b!628523))

(assert (= (and b!628522 (not c!71588)) b!628521))

(assert (= (and b!628523 res!406079) b!628520))

(assert (= (or b!628520 b!628521) bm!33269))

(assert (=> b!628522 m!603591))

(assert (=> b!628522 m!603591))

(assert (=> b!628522 m!603593))

(declare-fun m!603679 () Bool)

(assert (=> bm!33269 m!603679))

(assert (=> b!628523 m!603591))

(declare-fun m!603681 () Bool)

(assert (=> b!628523 m!603681))

(declare-fun m!603683 () Bool)

(assert (=> b!628523 m!603683))

(assert (=> b!628523 m!603591))

(declare-fun m!603685 () Bool)

(assert (=> b!628523 m!603685))

(assert (=> b!628306 d!89041))

(push 1)

(assert (not bm!33260))

(assert (not d!89015))

(assert (not bm!33269))

(assert (not b!628422))

(assert (not d!89009))

(assert (not d!89017))

(assert (not b!628366))

(assert (not b!628523))

(assert (not b!628485))

(assert (not b!628370))

(assert (not b!628496))

(assert (not b!628367))

(assert (not b!628522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

