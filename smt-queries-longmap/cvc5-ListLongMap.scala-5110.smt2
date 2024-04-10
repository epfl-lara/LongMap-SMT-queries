; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69266 () Bool)

(assert start!69266)

(declare-fun b!808229 () Bool)

(declare-fun res!552353 () Bool)

(declare-fun e!447412 () Bool)

(assert (=> b!808229 (=> (not res!552353) (not e!447412))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43966 0))(
  ( (array!43967 (arr!21060 (Array (_ BitVec 32) (_ BitVec 64))) (size!21481 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43966)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808229 (= res!552353 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21481 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21060 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21481 a!3170)) (= (select (arr!21060 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!552357 () Bool)

(declare-fun e!447409 () Bool)

(assert (=> start!69266 (=> (not res!552357) (not e!447409))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69266 (= res!552357 (validMask!0 mask!3266))))

(assert (=> start!69266 e!447409))

(assert (=> start!69266 true))

(declare-fun array_inv!16856 (array!43966) Bool)

(assert (=> start!69266 (array_inv!16856 a!3170)))

(declare-fun b!808230 () Bool)

(declare-fun e!447410 () Bool)

(assert (=> b!808230 (= e!447412 e!447410)))

(declare-fun res!552359 () Bool)

(assert (=> b!808230 (=> (not res!552359) (not e!447410))))

(declare-fun lt!362161 () (_ BitVec 64))

(declare-fun lt!362160 () array!43966)

(declare-datatypes ((SeekEntryResult!8651 0))(
  ( (MissingZero!8651 (index!36972 (_ BitVec 32))) (Found!8651 (index!36973 (_ BitVec 32))) (Intermediate!8651 (undefined!9463 Bool) (index!36974 (_ BitVec 32)) (x!67775 (_ BitVec 32))) (Undefined!8651) (MissingVacant!8651 (index!36975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43966 (_ BitVec 32)) SeekEntryResult!8651)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43966 (_ BitVec 32)) SeekEntryResult!8651)

(assert (=> b!808230 (= res!552359 (= (seekEntryOrOpen!0 lt!362161 lt!362160 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362161 lt!362160 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808230 (= lt!362161 (select (store (arr!21060 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808230 (= lt!362160 (array!43967 (store (arr!21060 a!3170) i!1163 k!2044) (size!21481 a!3170)))))

(declare-fun b!808231 () Bool)

(declare-fun res!552356 () Bool)

(assert (=> b!808231 (=> (not res!552356) (not e!447409))))

(assert (=> b!808231 (= res!552356 (and (= (size!21481 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21481 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21481 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808232 () Bool)

(declare-fun res!552362 () Bool)

(assert (=> b!808232 (=> (not res!552362) (not e!447409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808232 (= res!552362 (validKeyInArray!0 (select (arr!21060 a!3170) j!153)))))

(declare-fun b!808233 () Bool)

(declare-fun res!552352 () Bool)

(assert (=> b!808233 (=> (not res!552352) (not e!447409))))

(assert (=> b!808233 (= res!552352 (validKeyInArray!0 k!2044))))

(declare-fun b!808234 () Bool)

(declare-fun e!447411 () Bool)

(assert (=> b!808234 (= e!447410 e!447411)))

(declare-fun res!552355 () Bool)

(assert (=> b!808234 (=> (not res!552355) (not e!447411))))

(declare-fun lt!362164 () SeekEntryResult!8651)

(declare-fun lt!362163 () SeekEntryResult!8651)

(assert (=> b!808234 (= res!552355 (and (= lt!362163 lt!362164) (= lt!362164 (Found!8651 j!153)) (not (= (select (arr!21060 a!3170) index!1236) (select (arr!21060 a!3170) j!153)))))))

(assert (=> b!808234 (= lt!362164 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21060 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808234 (= lt!362163 (seekEntryOrOpen!0 (select (arr!21060 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808235 () Bool)

(assert (=> b!808235 (= e!447409 e!447412)))

(declare-fun res!552354 () Bool)

(assert (=> b!808235 (=> (not res!552354) (not e!447412))))

(declare-fun lt!362165 () SeekEntryResult!8651)

(assert (=> b!808235 (= res!552354 (or (= lt!362165 (MissingZero!8651 i!1163)) (= lt!362165 (MissingVacant!8651 i!1163))))))

(assert (=> b!808235 (= lt!362165 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808236 () Bool)

(declare-fun res!552360 () Bool)

(assert (=> b!808236 (=> (not res!552360) (not e!447412))))

(declare-datatypes ((List!15023 0))(
  ( (Nil!15020) (Cons!15019 (h!16148 (_ BitVec 64)) (t!21338 List!15023)) )
))
(declare-fun arrayNoDuplicates!0 (array!43966 (_ BitVec 32) List!15023) Bool)

(assert (=> b!808236 (= res!552360 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15020))))

(declare-fun b!808237 () Bool)

(assert (=> b!808237 (= e!447411 (bvsgt (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!362162 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808237 (= lt!362162 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808238 () Bool)

(declare-fun res!552358 () Bool)

(assert (=> b!808238 (=> (not res!552358) (not e!447412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43966 (_ BitVec 32)) Bool)

(assert (=> b!808238 (= res!552358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808239 () Bool)

(declare-fun res!552361 () Bool)

(assert (=> b!808239 (=> (not res!552361) (not e!447409))))

(declare-fun arrayContainsKey!0 (array!43966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808239 (= res!552361 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69266 res!552357) b!808231))

(assert (= (and b!808231 res!552356) b!808232))

(assert (= (and b!808232 res!552362) b!808233))

(assert (= (and b!808233 res!552352) b!808239))

(assert (= (and b!808239 res!552361) b!808235))

(assert (= (and b!808235 res!552354) b!808238))

(assert (= (and b!808238 res!552358) b!808236))

(assert (= (and b!808236 res!552360) b!808229))

(assert (= (and b!808229 res!552353) b!808230))

(assert (= (and b!808230 res!552359) b!808234))

(assert (= (and b!808234 res!552355) b!808237))

(declare-fun m!750383 () Bool)

(assert (=> b!808234 m!750383))

(declare-fun m!750385 () Bool)

(assert (=> b!808234 m!750385))

(assert (=> b!808234 m!750385))

(declare-fun m!750387 () Bool)

(assert (=> b!808234 m!750387))

(assert (=> b!808234 m!750385))

(declare-fun m!750389 () Bool)

(assert (=> b!808234 m!750389))

(declare-fun m!750391 () Bool)

(assert (=> b!808235 m!750391))

(declare-fun m!750393 () Bool)

(assert (=> b!808239 m!750393))

(assert (=> b!808232 m!750385))

(assert (=> b!808232 m!750385))

(declare-fun m!750395 () Bool)

(assert (=> b!808232 m!750395))

(declare-fun m!750397 () Bool)

(assert (=> b!808238 m!750397))

(declare-fun m!750399 () Bool)

(assert (=> start!69266 m!750399))

(declare-fun m!750401 () Bool)

(assert (=> start!69266 m!750401))

(declare-fun m!750403 () Bool)

(assert (=> b!808236 m!750403))

(declare-fun m!750405 () Bool)

(assert (=> b!808233 m!750405))

(declare-fun m!750407 () Bool)

(assert (=> b!808230 m!750407))

(declare-fun m!750409 () Bool)

(assert (=> b!808230 m!750409))

(declare-fun m!750411 () Bool)

(assert (=> b!808230 m!750411))

(declare-fun m!750413 () Bool)

(assert (=> b!808230 m!750413))

(declare-fun m!750415 () Bool)

(assert (=> b!808229 m!750415))

(declare-fun m!750417 () Bool)

(assert (=> b!808229 m!750417))

(declare-fun m!750419 () Bool)

(assert (=> b!808237 m!750419))

(push 1)

(assert (not b!808236))

(assert (not b!808234))

(assert (not b!808235))

(assert (not start!69266))

(assert (not b!808230))

(assert (not b!808237))

(assert (not b!808233))

(assert (not b!808238))

(assert (not b!808239))

(assert (not b!808232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!808350 () Bool)

(declare-fun e!447469 () Bool)

(declare-fun e!447470 () Bool)

(assert (=> b!808350 (= e!447469 e!447470)))

(declare-fun lt!362224 () (_ BitVec 64))

(assert (=> b!808350 (= lt!362224 (select (arr!21060 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27614 0))(
  ( (Unit!27615) )
))
(declare-fun lt!362225 () Unit!27614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43966 (_ BitVec 64) (_ BitVec 32)) Unit!27614)

(assert (=> b!808350 (= lt!362225 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362224 #b00000000000000000000000000000000))))

(assert (=> b!808350 (arrayContainsKey!0 a!3170 lt!362224 #b00000000000000000000000000000000)))

(declare-fun lt!362223 () Unit!27614)

(assert (=> b!808350 (= lt!362223 lt!362225)))

(declare-fun res!552434 () Bool)

(assert (=> b!808350 (= res!552434 (= (seekEntryOrOpen!0 (select (arr!21060 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8651 #b00000000000000000000000000000000)))))

(assert (=> b!808350 (=> (not res!552434) (not e!447470))))

(declare-fun bm!35382 () Bool)

(declare-fun call!35385 () Bool)

(assert (=> bm!35382 (= call!35385 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808351 () Bool)

(assert (=> b!808351 (= e!447470 call!35385)))

(declare-fun d!103745 () Bool)

(declare-fun res!552433 () Bool)

(declare-fun e!447468 () Bool)

(assert (=> d!103745 (=> res!552433 e!447468)))

(assert (=> d!103745 (= res!552433 (bvsge #b00000000000000000000000000000000 (size!21481 a!3170)))))

(assert (=> d!103745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447468)))

(declare-fun b!808352 () Bool)

(assert (=> b!808352 (= e!447468 e!447469)))

(declare-fun c!88369 () Bool)

(assert (=> b!808352 (= c!88369 (validKeyInArray!0 (select (arr!21060 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808353 () Bool)

(assert (=> b!808353 (= e!447469 call!35385)))

(assert (= (and d!103745 (not res!552433)) b!808352))

(assert (= (and b!808352 c!88369) b!808350))

(assert (= (and b!808352 (not c!88369)) b!808353))

(assert (= (and b!808350 res!552434) b!808351))

(assert (= (or b!808351 b!808353) bm!35382))

(declare-fun m!750519 () Bool)

(assert (=> b!808350 m!750519))

(declare-fun m!750521 () Bool)

(assert (=> b!808350 m!750521))

(declare-fun m!750523 () Bool)

(assert (=> b!808350 m!750523))

(assert (=> b!808350 m!750519))

(declare-fun m!750525 () Bool)

(assert (=> b!808350 m!750525))

(declare-fun m!750527 () Bool)

(assert (=> bm!35382 m!750527))

(assert (=> b!808352 m!750519))

(assert (=> b!808352 m!750519))

(declare-fun m!750529 () Bool)

(assert (=> b!808352 m!750529))

(assert (=> b!808238 d!103745))

(declare-fun d!103753 () Bool)

(assert (=> d!103753 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808233 d!103753))

(declare-fun d!103755 () Bool)

(declare-fun res!552439 () Bool)

(declare-fun e!447475 () Bool)

(assert (=> d!103755 (=> res!552439 e!447475)))

(assert (=> d!103755 (= res!552439 (= (select (arr!21060 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103755 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!447475)))

(declare-fun b!808358 () Bool)

(declare-fun e!447476 () Bool)

(assert (=> b!808358 (= e!447475 e!447476)))

(declare-fun res!552440 () Bool)

(assert (=> b!808358 (=> (not res!552440) (not e!447476))))

(assert (=> b!808358 (= res!552440 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21481 a!3170)))))

(declare-fun b!808359 () Bool)

(assert (=> b!808359 (= e!447476 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103755 (not res!552439)) b!808358))

(assert (= (and b!808358 res!552440) b!808359))

(assert (=> d!103755 m!750519))

(declare-fun m!750531 () Bool)

(assert (=> b!808359 m!750531))

(assert (=> b!808239 d!103755))

(declare-fun lt!362237 () SeekEntryResult!8651)

(declare-fun d!103757 () Bool)

(assert (=> d!103757 (and (or (is-Undefined!8651 lt!362237) (not (is-Found!8651 lt!362237)) (and (bvsge (index!36973 lt!362237) #b00000000000000000000000000000000) (bvslt (index!36973 lt!362237) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362237) (is-Found!8651 lt!362237) (not (is-MissingVacant!8651 lt!362237)) (not (= (index!36975 lt!362237) vacantBefore!23)) (and (bvsge (index!36975 lt!362237) #b00000000000000000000000000000000) (bvslt (index!36975 lt!362237) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362237) (ite (is-Found!8651 lt!362237) (= (select (arr!21060 a!3170) (index!36973 lt!362237)) (select (arr!21060 a!3170) j!153)) (and (is-MissingVacant!8651 lt!362237) (= (index!36975 lt!362237) vacantBefore!23) (= (select (arr!21060 a!3170) (index!36975 lt!362237)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447489 () SeekEntryResult!8651)

(assert (=> d!103757 (= lt!362237 e!447489)))

(declare-fun c!88383 () Bool)

(assert (=> d!103757 (= c!88383 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362236 () (_ BitVec 64))

(assert (=> d!103757 (= lt!362236 (select (arr!21060 a!3170) index!1236))))

(assert (=> d!103757 (validMask!0 mask!3266)))

(assert (=> d!103757 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21060 a!3170) j!153) a!3170 mask!3266) lt!362237)))

(declare-fun b!808384 () Bool)

(declare-fun e!447490 () SeekEntryResult!8651)

(assert (=> b!808384 (= e!447490 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21060 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808385 () Bool)

(declare-fun e!447491 () SeekEntryResult!8651)

(assert (=> b!808385 (= e!447489 e!447491)))

(declare-fun c!88382 () Bool)

(assert (=> b!808385 (= c!88382 (= lt!362236 (select (arr!21060 a!3170) j!153)))))

(declare-fun b!808386 () Bool)

(assert (=> b!808386 (= e!447491 (Found!8651 index!1236))))

(declare-fun b!808387 () Bool)

(assert (=> b!808387 (= e!447489 Undefined!8651)))

(declare-fun b!808388 () Bool)

(declare-fun c!88384 () Bool)

(assert (=> b!808388 (= c!88384 (= lt!362236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808388 (= e!447491 e!447490)))

(declare-fun b!808389 () Bool)

(assert (=> b!808389 (= e!447490 (MissingVacant!8651 vacantBefore!23))))

(assert (= (and d!103757 c!88383) b!808387))

(assert (= (and d!103757 (not c!88383)) b!808385))

(assert (= (and b!808385 c!88382) b!808386))

(assert (= (and b!808385 (not c!88382)) b!808388))

(assert (= (and b!808388 c!88384) b!808389))

(assert (= (and b!808388 (not c!88384)) b!808384))

(declare-fun m!750533 () Bool)

(assert (=> d!103757 m!750533))

(declare-fun m!750535 () Bool)

(assert (=> d!103757 m!750535))

(assert (=> d!103757 m!750383))

(assert (=> d!103757 m!750399))

(assert (=> b!808384 m!750419))

(assert (=> b!808384 m!750419))

(assert (=> b!808384 m!750385))

(declare-fun m!750537 () Bool)

(assert (=> b!808384 m!750537))

(assert (=> b!808234 d!103757))

(declare-fun e!447541 () SeekEntryResult!8651)

(declare-fun b!808462 () Bool)

(declare-fun lt!362257 () SeekEntryResult!8651)

(assert (=> b!808462 (= e!447541 (seekKeyOrZeroReturnVacant!0 (x!67775 lt!362257) (index!36974 lt!362257) (index!36974 lt!362257) (select (arr!21060 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808463 () Bool)

(declare-fun e!447540 () SeekEntryResult!8651)

(assert (=> b!808463 (= e!447540 Undefined!8651)))

(declare-fun d!103763 () Bool)

(declare-fun lt!362256 () SeekEntryResult!8651)

(assert (=> d!103763 (and (or (is-Undefined!8651 lt!362256) (not (is-Found!8651 lt!362256)) (and (bvsge (index!36973 lt!362256) #b00000000000000000000000000000000) (bvslt (index!36973 lt!362256) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362256) (is-Found!8651 lt!362256) (not (is-MissingZero!8651 lt!362256)) (and (bvsge (index!36972 lt!362256) #b00000000000000000000000000000000) (bvslt (index!36972 lt!362256) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362256) (is-Found!8651 lt!362256) (is-MissingZero!8651 lt!362256) (not (is-MissingVacant!8651 lt!362256)) (and (bvsge (index!36975 lt!362256) #b00000000000000000000000000000000) (bvslt (index!36975 lt!362256) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362256) (ite (is-Found!8651 lt!362256) (= (select (arr!21060 a!3170) (index!36973 lt!362256)) (select (arr!21060 a!3170) j!153)) (ite (is-MissingZero!8651 lt!362256) (= (select (arr!21060 a!3170) (index!36972 lt!362256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8651 lt!362256) (= (select (arr!21060 a!3170) (index!36975 lt!362256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103763 (= lt!362256 e!447540)))

(declare-fun c!88411 () Bool)

(assert (=> d!103763 (= c!88411 (and (is-Intermediate!8651 lt!362257) (undefined!9463 lt!362257)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43966 (_ BitVec 32)) SeekEntryResult!8651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103763 (= lt!362257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21060 a!3170) j!153) mask!3266) (select (arr!21060 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103763 (validMask!0 mask!3266)))

(assert (=> d!103763 (= (seekEntryOrOpen!0 (select (arr!21060 a!3170) j!153) a!3170 mask!3266) lt!362256)))

(declare-fun b!808464 () Bool)

(declare-fun c!88409 () Bool)

(declare-fun lt!362255 () (_ BitVec 64))

(assert (=> b!808464 (= c!88409 (= lt!362255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447542 () SeekEntryResult!8651)

(assert (=> b!808464 (= e!447542 e!447541)))

(declare-fun b!808465 () Bool)

(assert (=> b!808465 (= e!447540 e!447542)))

(assert (=> b!808465 (= lt!362255 (select (arr!21060 a!3170) (index!36974 lt!362257)))))

(declare-fun c!88410 () Bool)

(assert (=> b!808465 (= c!88410 (= lt!362255 (select (arr!21060 a!3170) j!153)))))

(declare-fun b!808466 () Bool)

(assert (=> b!808466 (= e!447542 (Found!8651 (index!36974 lt!362257)))))

(declare-fun b!808467 () Bool)

(assert (=> b!808467 (= e!447541 (MissingZero!8651 (index!36974 lt!362257)))))

(assert (= (and d!103763 c!88411) b!808463))

(assert (= (and d!103763 (not c!88411)) b!808465))

(assert (= (and b!808465 c!88410) b!808466))

(assert (= (and b!808465 (not c!88410)) b!808464))

(assert (= (and b!808464 c!88409) b!808467))

(assert (= (and b!808464 (not c!88409)) b!808462))

(assert (=> b!808462 m!750385))

(declare-fun m!750605 () Bool)

(assert (=> b!808462 m!750605))

(declare-fun m!750607 () Bool)

(assert (=> d!103763 m!750607))

(declare-fun m!750609 () Bool)

(assert (=> d!103763 m!750609))

(assert (=> d!103763 m!750399))

(declare-fun m!750611 () Bool)

(assert (=> d!103763 m!750611))

(assert (=> d!103763 m!750385))

(declare-fun m!750613 () Bool)

(assert (=> d!103763 m!750613))

(assert (=> d!103763 m!750613))

(assert (=> d!103763 m!750385))

(declare-fun m!750615 () Bool)

(assert (=> d!103763 m!750615))

(declare-fun m!750617 () Bool)

(assert (=> b!808465 m!750617))

(assert (=> b!808234 d!103763))

(declare-fun e!447544 () SeekEntryResult!8651)

(declare-fun b!808468 () Bool)

(declare-fun lt!362260 () SeekEntryResult!8651)

(assert (=> b!808468 (= e!447544 (seekKeyOrZeroReturnVacant!0 (x!67775 lt!362260) (index!36974 lt!362260) (index!36974 lt!362260) k!2044 a!3170 mask!3266))))

(declare-fun b!808469 () Bool)

(declare-fun e!447543 () SeekEntryResult!8651)

(assert (=> b!808469 (= e!447543 Undefined!8651)))

(declare-fun d!103783 () Bool)

(declare-fun lt!362259 () SeekEntryResult!8651)

(assert (=> d!103783 (and (or (is-Undefined!8651 lt!362259) (not (is-Found!8651 lt!362259)) (and (bvsge (index!36973 lt!362259) #b00000000000000000000000000000000) (bvslt (index!36973 lt!362259) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362259) (is-Found!8651 lt!362259) (not (is-MissingZero!8651 lt!362259)) (and (bvsge (index!36972 lt!362259) #b00000000000000000000000000000000) (bvslt (index!36972 lt!362259) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362259) (is-Found!8651 lt!362259) (is-MissingZero!8651 lt!362259) (not (is-MissingVacant!8651 lt!362259)) (and (bvsge (index!36975 lt!362259) #b00000000000000000000000000000000) (bvslt (index!36975 lt!362259) (size!21481 a!3170)))) (or (is-Undefined!8651 lt!362259) (ite (is-Found!8651 lt!362259) (= (select (arr!21060 a!3170) (index!36973 lt!362259)) k!2044) (ite (is-MissingZero!8651 lt!362259) (= (select (arr!21060 a!3170) (index!36972 lt!362259)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8651 lt!362259) (= (select (arr!21060 a!3170) (index!36975 lt!362259)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103783 (= lt!362259 e!447543)))

(declare-fun c!88414 () Bool)

(assert (=> d!103783 (= c!88414 (and (is-Intermediate!8651 lt!362260) (undefined!9463 lt!362260)))))

(assert (=> d!103783 (= lt!362260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103783 (validMask!0 mask!3266)))

(assert (=> d!103783 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!362259)))

(declare-fun b!808470 () Bool)

(declare-fun c!88412 () Bool)

(declare-fun lt!362258 () (_ BitVec 64))

(assert (=> b!808470 (= c!88412 (= lt!362258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447545 () SeekEntryResult!8651)

(assert (=> b!808470 (= e!447545 e!447544)))

(declare-fun b!808471 () Bool)

(assert (=> b!808471 (= e!447543 e!447545)))

(assert (=> b!808471 (= lt!362258 (select (arr!21060 a!3170) (index!36974 lt!362260)))))

(declare-fun c!88413 () Bool)

(assert (=> b!808471 (= c!88413 (= lt!362258 k!2044))))

(declare-fun b!808472 () Bool)

(assert (=> b!808472 (= e!447545 (Found!8651 (index!36974 lt!362260)))))

(declare-fun b!808473 () Bool)

(assert (=> b!808473 (= e!447544 (MissingZero!8651 (index!36974 lt!362260)))))

(assert (= (and d!103783 c!88414) b!808469))

(assert (= (and d!103783 (not c!88414)) b!808471))

(assert (= (and b!808471 c!88413) b!808472))

(assert (= (and b!808471 (not c!88413)) b!808470))

(assert (= (and b!808470 c!88412) b!808473))

(assert (= (and b!808470 (not c!88412)) b!808468))

(declare-fun m!750619 () Bool)

(assert (=> b!808468 m!750619))

(declare-fun m!750621 () Bool)

(assert (=> d!103783 m!750621))

(declare-fun m!750623 () Bool)

(assert (=> d!103783 m!750623))

(assert (=> d!103783 m!750399))

(declare-fun m!750625 () Bool)

(assert (=> d!103783 m!750625))

(declare-fun m!750627 () Bool)

(assert (=> d!103783 m!750627))

(assert (=> d!103783 m!750627))

(declare-fun m!750629 () Bool)

(assert (=> d!103783 m!750629))

(declare-fun m!750631 () Bool)

(assert (=> b!808471 m!750631))

(assert (=> b!808235 d!103783))

(declare-fun e!447547 () SeekEntryResult!8651)

(declare-fun lt!362263 () SeekEntryResult!8651)

(declare-fun b!808474 () Bool)

(assert (=> b!808474 (= e!447547 (seekKeyOrZeroReturnVacant!0 (x!67775 lt!362263) (index!36974 lt!362263) (index!36974 lt!362263) lt!362161 lt!362160 mask!3266))))

(declare-fun b!808475 () Bool)

(declare-fun e!447546 () SeekEntryResult!8651)

(assert (=> b!808475 (= e!447546 Undefined!8651)))

(declare-fun d!103785 () Bool)

(declare-fun lt!362262 () SeekEntryResult!8651)

(assert (=> d!103785 (and (or (is-Undefined!8651 lt!362262) (not (is-Found!8651 lt!362262)) (and (bvsge (index!36973 lt!362262) #b00000000000000000000000000000000) (bvslt (index!36973 lt!362262) (size!21481 lt!362160)))) (or (is-Undefined!8651 lt!362262) (is-Found!8651 lt!362262) (not (is-MissingZero!8651 lt!362262)) (and (bvsge (index!36972 lt!362262) #b00000000000000000000000000000000) (bvslt (index!36972 lt!362262) (size!21481 lt!362160)))) (or (is-Undefined!8651 lt!362262) (is-Found!8651 lt!362262) (is-MissingZero!8651 lt!362262) (not (is-MissingVacant!8651 lt!362262)) (and (bvsge (index!36975 lt!362262) #b00000000000000000000000000000000) (bvslt (index!36975 lt!362262) (size!21481 lt!362160)))) (or (is-Undefined!8651 lt!362262) (ite (is-Found!8651 lt!362262) (= (select (arr!21060 lt!362160) (index!36973 lt!362262)) lt!362161) (ite (is-MissingZero!8651 lt!362262) (= (select (arr!21060 lt!362160) (index!36972 lt!362262)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8651 lt!362262) (= (select (arr!21060 lt!362160) (index!36975 lt!362262)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103785 (= lt!362262 e!447546)))

(declare-fun c!88417 () Bool)

(assert (=> d!103785 (= c!88417 (and (is-Intermediate!8651 lt!362263) (undefined!9463 lt!362263)))))

(assert (=> d!103785 (= lt!362263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362161 mask!3266) lt!362161 lt!362160 mask!3266))))

(assert (=> d!103785 (validMask!0 mask!3266)))

(assert (=> d!103785 (= (seekEntryOrOpen!0 lt!362161 lt!362160 mask!3266) lt!362262)))

(declare-fun b!808476 () Bool)

(declare-fun c!88415 () Bool)

(declare-fun lt!362261 () (_ BitVec 64))

(assert (=> b!808476 (= c!88415 (= lt!362261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447548 () SeekEntryResult!8651)

(assert (=> b!808476 (= e!447548 e!447547)))

(declare-fun b!808477 () Bool)

(assert (=> b!808477 (= e!447546 e!447548)))

(assert (=> b!808477 (= lt!362261 (select (arr!21060 lt!362160) (index!36974 lt!362263)))))

(declare-fun c!88416 () Bool)

(assert (=> b!808477 (= c!88416 (= lt!362261 lt!362161))))

(declare-fun b!808478 () Bool)

(assert (=> b!808478 (= e!447548 (Found!8651 (index!36974 lt!362263)))))

(declare-fun b!808479 () Bool)

(assert (=> b!808479 (= e!447547 (MissingZero!8651 (index!36974 lt!362263)))))

(assert (= (and d!103785 c!88417) b!808475))

(assert (= (and d!103785 (not c!88417)) b!808477))

(assert (= (and b!808477 c!88416) b!808478))

(assert (= (and b!808477 (not c!88416)) b!808476))

(assert (= (and b!808476 c!88415) b!808479))

(assert (= (and b!808476 (not c!88415)) b!808474))

(declare-fun m!750633 () Bool)

(assert (=> b!808474 m!750633))

(declare-fun m!750635 () Bool)

(assert (=> d!103785 m!750635))

(declare-fun m!750637 () Bool)

(assert (=> d!103785 m!750637))

(assert (=> d!103785 m!750399))

(declare-fun m!750639 () Bool)

(assert (=> d!103785 m!750639))

(declare-fun m!750641 () Bool)

(assert (=> d!103785 m!750641))

(assert (=> d!103785 m!750641))

(declare-fun m!750643 () Bool)

(assert (=> d!103785 m!750643))

(declare-fun m!750645 () Bool)

(assert (=> b!808477 m!750645))

(assert (=> b!808230 d!103785))

(declare-fun lt!362265 () SeekEntryResult!8651)

(declare-fun d!103787 () Bool)

(assert (=> d!103787 (and (or (is-Undefined!8651 lt!362265) (not (is-Found!8651 lt!362265)) (and (bvsge (index!36973 lt!362265) #b00000000000000000000000000000000) (bvslt (index!36973 lt!362265) (size!21481 lt!362160)))) (or (is-Undefined!8651 lt!362265) (is-Found!8651 lt!362265) (not (is-MissingVacant!8651 lt!362265)) (not (= (index!36975 lt!362265) vacantAfter!23)) (and (bvsge (index!36975 lt!362265) #b00000000000000000000000000000000) (bvslt (index!36975 lt!362265) (size!21481 lt!362160)))) (or (is-Undefined!8651 lt!362265) (ite (is-Found!8651 lt!362265) (= (select (arr!21060 lt!362160) (index!36973 lt!362265)) lt!362161) (and (is-MissingVacant!8651 lt!362265) (= (index!36975 lt!362265) vacantAfter!23) (= (select (arr!21060 lt!362160) (index!36975 lt!362265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447549 () SeekEntryResult!8651)

(assert (=> d!103787 (= lt!362265 e!447549)))

(declare-fun c!88419 () Bool)

(assert (=> d!103787 (= c!88419 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362264 () (_ BitVec 64))

(assert (=> d!103787 (= lt!362264 (select (arr!21060 lt!362160) index!1236))))

(assert (=> d!103787 (validMask!0 mask!3266)))

(assert (=> d!103787 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362161 lt!362160 mask!3266) lt!362265)))

(declare-fun e!447550 () SeekEntryResult!8651)

(declare-fun b!808480 () Bool)

(assert (=> b!808480 (= e!447550 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362161 lt!362160 mask!3266))))

(declare-fun b!808481 () Bool)

(declare-fun e!447551 () SeekEntryResult!8651)

(assert (=> b!808481 (= e!447549 e!447551)))

(declare-fun c!88418 () Bool)

(assert (=> b!808481 (= c!88418 (= lt!362264 lt!362161))))

(declare-fun b!808482 () Bool)

(assert (=> b!808482 (= e!447551 (Found!8651 index!1236))))

(declare-fun b!808483 () Bool)

(assert (=> b!808483 (= e!447549 Undefined!8651)))

(declare-fun b!808484 () Bool)

(declare-fun c!88420 () Bool)

(assert (=> b!808484 (= c!88420 (= lt!362264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808484 (= e!447551 e!447550)))

(declare-fun b!808485 () Bool)

(assert (=> b!808485 (= e!447550 (MissingVacant!8651 vacantAfter!23))))

(assert (= (and d!103787 c!88419) b!808483))

(assert (= (and d!103787 (not c!88419)) b!808481))

(assert (= (and b!808481 c!88418) b!808482))

(assert (= (and b!808481 (not c!88418)) b!808484))

(assert (= (and b!808484 c!88420) b!808485))

(assert (= (and b!808484 (not c!88420)) b!808480))

(declare-fun m!750647 () Bool)

(assert (=> d!103787 m!750647))

(declare-fun m!750649 () Bool)

(assert (=> d!103787 m!750649))

(declare-fun m!750651 () Bool)

(assert (=> d!103787 m!750651))

(assert (=> d!103787 m!750399))

(assert (=> b!808480 m!750419))

(assert (=> b!808480 m!750419))

(declare-fun m!750653 () Bool)

(assert (=> b!808480 m!750653))

(assert (=> b!808230 d!103787))

(declare-fun b!808512 () Bool)

(declare-fun e!447572 () Bool)

(declare-fun e!447573 () Bool)

(assert (=> b!808512 (= e!447572 e!447573)))

(declare-fun res!552481 () Bool)

(assert (=> b!808512 (=> (not res!552481) (not e!447573))))

(declare-fun e!447574 () Bool)

(assert (=> b!808512 (= res!552481 (not e!447574))))

(declare-fun res!552480 () Bool)

(assert (=> b!808512 (=> (not res!552480) (not e!447574))))

(assert (=> b!808512 (= res!552480 (validKeyInArray!0 (select (arr!21060 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808513 () Bool)

(declare-fun contains!4126 (List!15023 (_ BitVec 64)) Bool)

(assert (=> b!808513 (= e!447574 (contains!4126 Nil!15020 (select (arr!21060 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35395 () Bool)

(declare-fun call!35398 () Bool)

(declare-fun c!88427 () Bool)

(assert (=> bm!35395 (= call!35398 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88427 (Cons!15019 (select (arr!21060 a!3170) #b00000000000000000000000000000000) Nil!15020) Nil!15020)))))

(declare-fun b!808515 () Bool)

(declare-fun e!447575 () Bool)

(assert (=> b!808515 (= e!447575 call!35398)))

(declare-fun b!808516 () Bool)

(assert (=> b!808516 (= e!447575 call!35398)))

(declare-fun d!103789 () Bool)

(declare-fun res!552479 () Bool)

(assert (=> d!103789 (=> res!552479 e!447572)))

(assert (=> d!103789 (= res!552479 (bvsge #b00000000000000000000000000000000 (size!21481 a!3170)))))

(assert (=> d!103789 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15020) e!447572)))

(declare-fun b!808514 () Bool)

(assert (=> b!808514 (= e!447573 e!447575)))

(assert (=> b!808514 (= c!88427 (validKeyInArray!0 (select (arr!21060 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103789 (not res!552479)) b!808512))

(assert (= (and b!808512 res!552480) b!808513))

(assert (= (and b!808512 res!552481) b!808514))

(assert (= (and b!808514 c!88427) b!808516))

(assert (= (and b!808514 (not c!88427)) b!808515))

(assert (= (or b!808516 b!808515) bm!35395))

(assert (=> b!808512 m!750519))

(assert (=> b!808512 m!750519))

(assert (=> b!808512 m!750529))

(assert (=> b!808513 m!750519))

(assert (=> b!808513 m!750519))

(declare-fun m!750655 () Bool)

(assert (=> b!808513 m!750655))

(assert (=> bm!35395 m!750519))

(declare-fun m!750657 () Bool)

(assert (=> bm!35395 m!750657))

(assert (=> b!808514 m!750519))

(assert (=> b!808514 m!750519))

(assert (=> b!808514 m!750529))

(assert (=> b!808236 d!103789))

(declare-fun d!103791 () Bool)

(assert (=> d!103791 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69266 d!103791))

(declare-fun d!103799 () Bool)

(assert (=> d!103799 (= (array_inv!16856 a!3170) (bvsge (size!21481 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69266 d!103799))

(declare-fun d!103801 () Bool)

(declare-fun lt!362292 () (_ BitVec 32))

(assert (=> d!103801 (and (bvsge lt!362292 #b00000000000000000000000000000000) (bvslt lt!362292 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103801 (= lt!362292 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103801 (validMask!0 mask!3266)))

(assert (=> d!103801 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362292)))

(declare-fun bs!22394 () Bool)

(assert (= bs!22394 d!103801))

(declare-fun m!750691 () Bool)

(assert (=> bs!22394 m!750691))

(assert (=> bs!22394 m!750399))

(assert (=> b!808237 d!103801))

(declare-fun d!103803 () Bool)

(assert (=> d!103803 (= (validKeyInArray!0 (select (arr!21060 a!3170) j!153)) (and (not (= (select (arr!21060 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21060 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808232 d!103803))

(push 1)

(assert (not b!808352))

(assert (not bm!35395))

(assert (not b!808513))

(assert (not b!808474))

(assert (not b!808468))

(assert (not b!808512))

(assert (not d!103785))

(assert (not b!808384))

(assert (not b!808480))

(assert (not d!103787))

(assert (not b!808350))

(assert (not b!808462))

(assert (not b!808514))

(assert (not d!103783))

(assert (not d!103763))

(assert (not d!103801))

(assert (not b!808359))

(assert (not d!103757))

(assert (not bm!35382))

(check-sat)

