; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123808 () Bool)

(assert start!123808)

(declare-fun b!1434320 () Bool)

(declare-fun res!967354 () Bool)

(declare-fun e!809696 () Bool)

(assert (=> b!1434320 (=> (not res!967354) (not e!809696))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97661 0))(
  ( (array!97662 (arr!47134 (Array (_ BitVec 32) (_ BitVec 64))) (size!47685 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97661)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1434320 (= res!967354 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47685 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47685 a!2831))))))

(declare-fun b!1434321 () Bool)

(declare-fun res!967360 () Bool)

(declare-fun e!809698 () Bool)

(assert (=> b!1434321 (=> (not res!967360) (not e!809698))))

(declare-datatypes ((SeekEntryResult!11315 0))(
  ( (MissingZero!11315 (index!47652 (_ BitVec 32))) (Found!11315 (index!47653 (_ BitVec 32))) (Intermediate!11315 (undefined!12127 Bool) (index!47654 (_ BitVec 32)) (x!129453 (_ BitVec 32))) (Undefined!11315) (MissingVacant!11315 (index!47655 (_ BitVec 32))) )
))
(declare-fun lt!631316 () SeekEntryResult!11315)

(declare-fun lt!631315 () array!97661)

(declare-fun lt!631312 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97661 (_ BitVec 32)) SeekEntryResult!11315)

(assert (=> b!1434321 (= res!967360 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631312 lt!631315 mask!2608) lt!631316))))

(declare-fun b!1434322 () Bool)

(declare-fun e!809699 () Bool)

(assert (=> b!1434322 (= e!809696 e!809699)))

(declare-fun res!967350 () Bool)

(assert (=> b!1434322 (=> (not res!967350) (not e!809699))))

(declare-fun lt!631311 () SeekEntryResult!11315)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434322 (= res!967350 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) (select (arr!47134 a!2831) j!81) a!2831 mask!2608) lt!631311))))

(assert (=> b!1434322 (= lt!631311 (Intermediate!11315 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434323 () Bool)

(declare-fun e!809694 () Bool)

(assert (=> b!1434323 (= e!809694 (and (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110)))))

(declare-fun lt!631313 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434323 (= lt!631313 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1434324 () Bool)

(assert (=> b!1434324 (= e!809699 e!809698)))

(declare-fun res!967351 () Bool)

(assert (=> b!1434324 (=> (not res!967351) (not e!809698))))

(assert (=> b!1434324 (= res!967351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631312 mask!2608) lt!631312 lt!631315 mask!2608) lt!631316))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434324 (= lt!631316 (Intermediate!11315 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434324 (= lt!631312 (select (store (arr!47134 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434324 (= lt!631315 (array!97662 (store (arr!47134 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47685 a!2831)))))

(declare-fun b!1434325 () Bool)

(declare-fun e!809697 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97661 (_ BitVec 32)) SeekEntryResult!11315)

(assert (=> b!1434325 (= e!809697 (= (seekEntryOrOpen!0 (select (arr!47134 a!2831) j!81) a!2831 mask!2608) (Found!11315 j!81)))))

(declare-fun b!1434326 () Bool)

(declare-fun res!967348 () Bool)

(assert (=> b!1434326 (=> (not res!967348) (not e!809696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434326 (= res!967348 (validKeyInArray!0 (select (arr!47134 a!2831) i!982)))))

(declare-fun b!1434327 () Bool)

(declare-fun res!967359 () Bool)

(assert (=> b!1434327 (=> (not res!967359) (not e!809696))))

(assert (=> b!1434327 (= res!967359 (and (= (size!47685 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47685 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47685 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434328 () Bool)

(assert (=> b!1434328 (= e!809698 (not e!809694))))

(declare-fun res!967352 () Bool)

(assert (=> b!1434328 (=> res!967352 e!809694)))

(assert (=> b!1434328 (= res!967352 (or (= (select (arr!47134 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47134 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47134 a!2831) index!585) (select (arr!47134 a!2831) j!81)) (= (select (store (arr!47134 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434328 e!809697))

(declare-fun res!967356 () Bool)

(assert (=> b!1434328 (=> (not res!967356) (not e!809697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97661 (_ BitVec 32)) Bool)

(assert (=> b!1434328 (= res!967356 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48407 0))(
  ( (Unit!48408) )
))
(declare-fun lt!631314 () Unit!48407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48407)

(assert (=> b!1434328 (= lt!631314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434329 () Bool)

(declare-fun res!967358 () Bool)

(assert (=> b!1434329 (=> (not res!967358) (not e!809698))))

(assert (=> b!1434329 (= res!967358 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434330 () Bool)

(declare-fun res!967347 () Bool)

(assert (=> b!1434330 (=> (not res!967347) (not e!809696))))

(assert (=> b!1434330 (= res!967347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434331 () Bool)

(declare-fun res!967355 () Bool)

(assert (=> b!1434331 (=> (not res!967355) (not e!809696))))

(assert (=> b!1434331 (= res!967355 (validKeyInArray!0 (select (arr!47134 a!2831) j!81)))))

(declare-fun b!1434333 () Bool)

(declare-fun res!967353 () Bool)

(assert (=> b!1434333 (=> (not res!967353) (not e!809696))))

(declare-datatypes ((List!33631 0))(
  ( (Nil!33628) (Cons!33627 (h!34961 (_ BitVec 64)) (t!48317 List!33631)) )
))
(declare-fun arrayNoDuplicates!0 (array!97661 (_ BitVec 32) List!33631) Bool)

(assert (=> b!1434333 (= res!967353 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33628))))

(declare-fun b!1434332 () Bool)

(declare-fun res!967357 () Bool)

(assert (=> b!1434332 (=> (not res!967357) (not e!809698))))

(assert (=> b!1434332 (= res!967357 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47134 a!2831) j!81) a!2831 mask!2608) lt!631311))))

(declare-fun res!967349 () Bool)

(assert (=> start!123808 (=> (not res!967349) (not e!809696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123808 (= res!967349 (validMask!0 mask!2608))))

(assert (=> start!123808 e!809696))

(assert (=> start!123808 true))

(declare-fun array_inv!36415 (array!97661) Bool)

(assert (=> start!123808 (array_inv!36415 a!2831)))

(assert (= (and start!123808 res!967349) b!1434327))

(assert (= (and b!1434327 res!967359) b!1434326))

(assert (= (and b!1434326 res!967348) b!1434331))

(assert (= (and b!1434331 res!967355) b!1434330))

(assert (= (and b!1434330 res!967347) b!1434333))

(assert (= (and b!1434333 res!967353) b!1434320))

(assert (= (and b!1434320 res!967354) b!1434322))

(assert (= (and b!1434322 res!967350) b!1434324))

(assert (= (and b!1434324 res!967351) b!1434332))

(assert (= (and b!1434332 res!967357) b!1434321))

(assert (= (and b!1434321 res!967360) b!1434329))

(assert (= (and b!1434329 res!967358) b!1434328))

(assert (= (and b!1434328 res!967356) b!1434325))

(assert (= (and b!1434328 (not res!967352)) b!1434323))

(declare-fun m!1324255 () Bool)

(assert (=> b!1434325 m!1324255))

(assert (=> b!1434325 m!1324255))

(declare-fun m!1324257 () Bool)

(assert (=> b!1434325 m!1324257))

(assert (=> b!1434331 m!1324255))

(assert (=> b!1434331 m!1324255))

(declare-fun m!1324259 () Bool)

(assert (=> b!1434331 m!1324259))

(declare-fun m!1324261 () Bool)

(assert (=> b!1434330 m!1324261))

(declare-fun m!1324263 () Bool)

(assert (=> b!1434323 m!1324263))

(declare-fun m!1324265 () Bool)

(assert (=> b!1434333 m!1324265))

(declare-fun m!1324267 () Bool)

(assert (=> b!1434328 m!1324267))

(declare-fun m!1324269 () Bool)

(assert (=> b!1434328 m!1324269))

(declare-fun m!1324271 () Bool)

(assert (=> b!1434328 m!1324271))

(declare-fun m!1324273 () Bool)

(assert (=> b!1434328 m!1324273))

(assert (=> b!1434328 m!1324255))

(declare-fun m!1324275 () Bool)

(assert (=> b!1434328 m!1324275))

(declare-fun m!1324277 () Bool)

(assert (=> b!1434324 m!1324277))

(assert (=> b!1434324 m!1324277))

(declare-fun m!1324279 () Bool)

(assert (=> b!1434324 m!1324279))

(assert (=> b!1434324 m!1324267))

(declare-fun m!1324281 () Bool)

(assert (=> b!1434324 m!1324281))

(declare-fun m!1324283 () Bool)

(assert (=> b!1434321 m!1324283))

(assert (=> b!1434322 m!1324255))

(assert (=> b!1434322 m!1324255))

(declare-fun m!1324285 () Bool)

(assert (=> b!1434322 m!1324285))

(assert (=> b!1434322 m!1324285))

(assert (=> b!1434322 m!1324255))

(declare-fun m!1324287 () Bool)

(assert (=> b!1434322 m!1324287))

(declare-fun m!1324289 () Bool)

(assert (=> start!123808 m!1324289))

(declare-fun m!1324291 () Bool)

(assert (=> start!123808 m!1324291))

(assert (=> b!1434332 m!1324255))

(assert (=> b!1434332 m!1324255))

(declare-fun m!1324293 () Bool)

(assert (=> b!1434332 m!1324293))

(declare-fun m!1324295 () Bool)

(assert (=> b!1434326 m!1324295))

(assert (=> b!1434326 m!1324295))

(declare-fun m!1324297 () Bool)

(assert (=> b!1434326 m!1324297))

(check-sat (not b!1434331) (not b!1434325) (not b!1434324) (not b!1434330) (not b!1434321) (not b!1434332) (not start!123808) (not b!1434322) (not b!1434333) (not b!1434328) (not b!1434323) (not b!1434326))
(check-sat)
(get-model)

(declare-fun d!154387 () Bool)

(declare-fun lt!631355 () (_ BitVec 32))

(assert (=> d!154387 (and (bvsge lt!631355 #b00000000000000000000000000000000) (bvslt lt!631355 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154387 (= lt!631355 (choose!52 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(assert (=> d!154387 (validMask!0 mask!2608)))

(assert (=> d!154387 (= (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631355)))

(declare-fun bs!41734 () Bool)

(assert (= bs!41734 d!154387))

(declare-fun m!1324387 () Bool)

(assert (=> bs!41734 m!1324387))

(assert (=> bs!41734 m!1324289))

(assert (=> b!1434323 d!154387))

(declare-fun b!1434436 () Bool)

(declare-fun e!809750 () SeekEntryResult!11315)

(assert (=> b!1434436 (= e!809750 (Intermediate!11315 false (toIndex!0 lt!631312 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154389 () Bool)

(declare-fun e!809746 () Bool)

(assert (=> d!154389 e!809746))

(declare-fun c!133000 () Bool)

(declare-fun lt!631360 () SeekEntryResult!11315)

(get-info :version)

(assert (=> d!154389 (= c!133000 (and ((_ is Intermediate!11315) lt!631360) (undefined!12127 lt!631360)))))

(declare-fun e!809748 () SeekEntryResult!11315)

(assert (=> d!154389 (= lt!631360 e!809748)))

(declare-fun c!132999 () Bool)

(assert (=> d!154389 (= c!132999 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631361 () (_ BitVec 64))

(assert (=> d!154389 (= lt!631361 (select (arr!47134 lt!631315) (toIndex!0 lt!631312 mask!2608)))))

(assert (=> d!154389 (validMask!0 mask!2608)))

(assert (=> d!154389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631312 mask!2608) lt!631312 lt!631315 mask!2608) lt!631360)))

(declare-fun b!1434437 () Bool)

(declare-fun e!809747 () Bool)

(assert (=> b!1434437 (= e!809746 e!809747)))

(declare-fun res!967453 () Bool)

(assert (=> b!1434437 (= res!967453 (and ((_ is Intermediate!11315) lt!631360) (not (undefined!12127 lt!631360)) (bvslt (x!129453 lt!631360) #b01111111111111111111111111111110) (bvsge (x!129453 lt!631360) #b00000000000000000000000000000000) (bvsge (x!129453 lt!631360) #b00000000000000000000000000000000)))))

(assert (=> b!1434437 (=> (not res!967453) (not e!809747))))

(declare-fun b!1434438 () Bool)

(assert (=> b!1434438 (= e!809750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631312 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!631312 lt!631315 mask!2608))))

(declare-fun b!1434439 () Bool)

(assert (=> b!1434439 (= e!809748 (Intermediate!11315 true (toIndex!0 lt!631312 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434440 () Bool)

(assert (=> b!1434440 (and (bvsge (index!47654 lt!631360) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631360) (size!47685 lt!631315)))))

(declare-fun res!967452 () Bool)

(assert (=> b!1434440 (= res!967452 (= (select (arr!47134 lt!631315) (index!47654 lt!631360)) lt!631312))))

(declare-fun e!809749 () Bool)

(assert (=> b!1434440 (=> res!967452 e!809749)))

(assert (=> b!1434440 (= e!809747 e!809749)))

(declare-fun b!1434441 () Bool)

(assert (=> b!1434441 (and (bvsge (index!47654 lt!631360) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631360) (size!47685 lt!631315)))))

(declare-fun res!967451 () Bool)

(assert (=> b!1434441 (= res!967451 (= (select (arr!47134 lt!631315) (index!47654 lt!631360)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434441 (=> res!967451 e!809749)))

(declare-fun b!1434442 () Bool)

(assert (=> b!1434442 (= e!809746 (bvsge (x!129453 lt!631360) #b01111111111111111111111111111110))))

(declare-fun b!1434443 () Bool)

(assert (=> b!1434443 (and (bvsge (index!47654 lt!631360) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631360) (size!47685 lt!631315)))))

(assert (=> b!1434443 (= e!809749 (= (select (arr!47134 lt!631315) (index!47654 lt!631360)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434444 () Bool)

(assert (=> b!1434444 (= e!809748 e!809750)))

(declare-fun c!132998 () Bool)

(assert (=> b!1434444 (= c!132998 (or (= lt!631361 lt!631312) (= (bvadd lt!631361 lt!631361) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154389 c!132999) b!1434439))

(assert (= (and d!154389 (not c!132999)) b!1434444))

(assert (= (and b!1434444 c!132998) b!1434436))

(assert (= (and b!1434444 (not c!132998)) b!1434438))

(assert (= (and d!154389 c!133000) b!1434442))

(assert (= (and d!154389 (not c!133000)) b!1434437))

(assert (= (and b!1434437 res!967453) b!1434440))

(assert (= (and b!1434440 (not res!967452)) b!1434441))

(assert (= (and b!1434441 (not res!967451)) b!1434443))

(declare-fun m!1324389 () Bool)

(assert (=> b!1434443 m!1324389))

(assert (=> b!1434440 m!1324389))

(assert (=> b!1434441 m!1324389))

(assert (=> b!1434438 m!1324277))

(declare-fun m!1324391 () Bool)

(assert (=> b!1434438 m!1324391))

(assert (=> b!1434438 m!1324391))

(declare-fun m!1324393 () Bool)

(assert (=> b!1434438 m!1324393))

(assert (=> d!154389 m!1324277))

(declare-fun m!1324395 () Bool)

(assert (=> d!154389 m!1324395))

(assert (=> d!154389 m!1324289))

(assert (=> b!1434324 d!154389))

(declare-fun d!154391 () Bool)

(declare-fun lt!631367 () (_ BitVec 32))

(declare-fun lt!631366 () (_ BitVec 32))

(assert (=> d!154391 (= lt!631367 (bvmul (bvxor lt!631366 (bvlshr lt!631366 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154391 (= lt!631366 ((_ extract 31 0) (bvand (bvxor lt!631312 (bvlshr lt!631312 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154391 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967454 (let ((h!34964 ((_ extract 31 0) (bvand (bvxor lt!631312 (bvlshr lt!631312 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129458 (bvmul (bvxor h!34964 (bvlshr h!34964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129458 (bvlshr x!129458 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967454 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967454 #b00000000000000000000000000000000))))))

(assert (=> d!154391 (= (toIndex!0 lt!631312 mask!2608) (bvand (bvxor lt!631367 (bvlshr lt!631367 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434324 d!154391))

(declare-fun b!1434475 () Bool)

(declare-fun e!809769 () SeekEntryResult!11315)

(declare-fun lt!631378 () SeekEntryResult!11315)

(assert (=> b!1434475 (= e!809769 (Found!11315 (index!47654 lt!631378)))))

(declare-fun e!809770 () SeekEntryResult!11315)

(declare-fun b!1434476 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97661 (_ BitVec 32)) SeekEntryResult!11315)

(assert (=> b!1434476 (= e!809770 (seekKeyOrZeroReturnVacant!0 (x!129453 lt!631378) (index!47654 lt!631378) (index!47654 lt!631378) (select (arr!47134 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434477 () Bool)

(assert (=> b!1434477 (= e!809770 (MissingZero!11315 (index!47654 lt!631378)))))

(declare-fun b!1434478 () Bool)

(declare-fun e!809771 () SeekEntryResult!11315)

(assert (=> b!1434478 (= e!809771 e!809769)))

(declare-fun lt!631380 () (_ BitVec 64))

(assert (=> b!1434478 (= lt!631380 (select (arr!47134 a!2831) (index!47654 lt!631378)))))

(declare-fun c!133015 () Bool)

(assert (=> b!1434478 (= c!133015 (= lt!631380 (select (arr!47134 a!2831) j!81)))))

(declare-fun b!1434479 () Bool)

(declare-fun c!133014 () Bool)

(assert (=> b!1434479 (= c!133014 (= lt!631380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434479 (= e!809769 e!809770)))

(declare-fun b!1434480 () Bool)

(assert (=> b!1434480 (= e!809771 Undefined!11315)))

(declare-fun d!154393 () Bool)

(declare-fun lt!631379 () SeekEntryResult!11315)

(assert (=> d!154393 (and (or ((_ is Undefined!11315) lt!631379) (not ((_ is Found!11315) lt!631379)) (and (bvsge (index!47653 lt!631379) #b00000000000000000000000000000000) (bvslt (index!47653 lt!631379) (size!47685 a!2831)))) (or ((_ is Undefined!11315) lt!631379) ((_ is Found!11315) lt!631379) (not ((_ is MissingZero!11315) lt!631379)) (and (bvsge (index!47652 lt!631379) #b00000000000000000000000000000000) (bvslt (index!47652 lt!631379) (size!47685 a!2831)))) (or ((_ is Undefined!11315) lt!631379) ((_ is Found!11315) lt!631379) ((_ is MissingZero!11315) lt!631379) (not ((_ is MissingVacant!11315) lt!631379)) (and (bvsge (index!47655 lt!631379) #b00000000000000000000000000000000) (bvslt (index!47655 lt!631379) (size!47685 a!2831)))) (or ((_ is Undefined!11315) lt!631379) (ite ((_ is Found!11315) lt!631379) (= (select (arr!47134 a!2831) (index!47653 lt!631379)) (select (arr!47134 a!2831) j!81)) (ite ((_ is MissingZero!11315) lt!631379) (= (select (arr!47134 a!2831) (index!47652 lt!631379)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11315) lt!631379) (= (select (arr!47134 a!2831) (index!47655 lt!631379)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154393 (= lt!631379 e!809771)))

(declare-fun c!133013 () Bool)

(assert (=> d!154393 (= c!133013 (and ((_ is Intermediate!11315) lt!631378) (undefined!12127 lt!631378)))))

(assert (=> d!154393 (= lt!631378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) (select (arr!47134 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154393 (validMask!0 mask!2608)))

(assert (=> d!154393 (= (seekEntryOrOpen!0 (select (arr!47134 a!2831) j!81) a!2831 mask!2608) lt!631379)))

(assert (= (and d!154393 c!133013) b!1434480))

(assert (= (and d!154393 (not c!133013)) b!1434478))

(assert (= (and b!1434478 c!133015) b!1434475))

(assert (= (and b!1434478 (not c!133015)) b!1434479))

(assert (= (and b!1434479 c!133014) b!1434477))

(assert (= (and b!1434479 (not c!133014)) b!1434476))

(assert (=> b!1434476 m!1324255))

(declare-fun m!1324397 () Bool)

(assert (=> b!1434476 m!1324397))

(declare-fun m!1324399 () Bool)

(assert (=> b!1434478 m!1324399))

(assert (=> d!154393 m!1324255))

(assert (=> d!154393 m!1324285))

(declare-fun m!1324401 () Bool)

(assert (=> d!154393 m!1324401))

(declare-fun m!1324403 () Bool)

(assert (=> d!154393 m!1324403))

(assert (=> d!154393 m!1324289))

(declare-fun m!1324405 () Bool)

(assert (=> d!154393 m!1324405))

(assert (=> d!154393 m!1324285))

(assert (=> d!154393 m!1324255))

(assert (=> d!154393 m!1324287))

(assert (=> b!1434325 d!154393))

(declare-fun d!154399 () Bool)

(assert (=> d!154399 (= (validKeyInArray!0 (select (arr!47134 a!2831) i!982)) (and (not (= (select (arr!47134 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47134 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434326 d!154399))

(declare-fun b!1434513 () Bool)

(declare-fun e!809794 () Bool)

(declare-fun call!67560 () Bool)

(assert (=> b!1434513 (= e!809794 call!67560)))

(declare-fun b!1434514 () Bool)

(declare-fun e!809793 () Bool)

(assert (=> b!1434514 (= e!809793 e!809794)))

(declare-fun lt!631395 () (_ BitVec 64))

(assert (=> b!1434514 (= lt!631395 (select (arr!47134 a!2831) j!81))))

(declare-fun lt!631393 () Unit!48407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97661 (_ BitVec 64) (_ BitVec 32)) Unit!48407)

(assert (=> b!1434514 (= lt!631393 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631395 j!81))))

(declare-fun arrayContainsKey!0 (array!97661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434514 (arrayContainsKey!0 a!2831 lt!631395 #b00000000000000000000000000000000)))

(declare-fun lt!631394 () Unit!48407)

(assert (=> b!1434514 (= lt!631394 lt!631393)))

(declare-fun res!967478 () Bool)

(assert (=> b!1434514 (= res!967478 (= (seekEntryOrOpen!0 (select (arr!47134 a!2831) j!81) a!2831 mask!2608) (Found!11315 j!81)))))

(assert (=> b!1434514 (=> (not res!967478) (not e!809794))))

(declare-fun b!1434515 () Bool)

(declare-fun e!809795 () Bool)

(assert (=> b!1434515 (= e!809795 e!809793)))

(declare-fun c!133024 () Bool)

(assert (=> b!1434515 (= c!133024 (validKeyInArray!0 (select (arr!47134 a!2831) j!81)))))

(declare-fun b!1434516 () Bool)

(assert (=> b!1434516 (= e!809793 call!67560)))

(declare-fun d!154401 () Bool)

(declare-fun res!967479 () Bool)

(assert (=> d!154401 (=> res!967479 e!809795)))

(assert (=> d!154401 (= res!967479 (bvsge j!81 (size!47685 a!2831)))))

(assert (=> d!154401 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809795)))

(declare-fun bm!67557 () Bool)

(assert (=> bm!67557 (= call!67560 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!154401 (not res!967479)) b!1434515))

(assert (= (and b!1434515 c!133024) b!1434514))

(assert (= (and b!1434515 (not c!133024)) b!1434516))

(assert (= (and b!1434514 res!967478) b!1434513))

(assert (= (or b!1434513 b!1434516) bm!67557))

(assert (=> b!1434514 m!1324255))

(declare-fun m!1324423 () Bool)

(assert (=> b!1434514 m!1324423))

(declare-fun m!1324425 () Bool)

(assert (=> b!1434514 m!1324425))

(assert (=> b!1434514 m!1324255))

(assert (=> b!1434514 m!1324257))

(assert (=> b!1434515 m!1324255))

(assert (=> b!1434515 m!1324255))

(assert (=> b!1434515 m!1324259))

(declare-fun m!1324427 () Bool)

(assert (=> bm!67557 m!1324427))

(assert (=> b!1434328 d!154401))

(declare-fun d!154409 () Bool)

(assert (=> d!154409 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631402 () Unit!48407)

(declare-fun choose!38 (array!97661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48407)

(assert (=> d!154409 (= lt!631402 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154409 (validMask!0 mask!2608)))

(assert (=> d!154409 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631402)))

(declare-fun bs!41735 () Bool)

(assert (= bs!41735 d!154409))

(assert (=> bs!41735 m!1324273))

(declare-fun m!1324437 () Bool)

(assert (=> bs!41735 m!1324437))

(assert (=> bs!41735 m!1324289))

(assert (=> b!1434328 d!154409))

(declare-fun b!1434526 () Bool)

(declare-fun e!809802 () Bool)

(declare-fun call!67561 () Bool)

(assert (=> b!1434526 (= e!809802 call!67561)))

(declare-fun b!1434527 () Bool)

(declare-fun e!809801 () Bool)

(assert (=> b!1434527 (= e!809801 e!809802)))

(declare-fun lt!631405 () (_ BitVec 64))

(assert (=> b!1434527 (= lt!631405 (select (arr!47134 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631403 () Unit!48407)

(assert (=> b!1434527 (= lt!631403 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631405 #b00000000000000000000000000000000))))

(assert (=> b!1434527 (arrayContainsKey!0 a!2831 lt!631405 #b00000000000000000000000000000000)))

(declare-fun lt!631404 () Unit!48407)

(assert (=> b!1434527 (= lt!631404 lt!631403)))

(declare-fun res!967483 () Bool)

(assert (=> b!1434527 (= res!967483 (= (seekEntryOrOpen!0 (select (arr!47134 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11315 #b00000000000000000000000000000000)))))

(assert (=> b!1434527 (=> (not res!967483) (not e!809802))))

(declare-fun b!1434528 () Bool)

(declare-fun e!809803 () Bool)

(assert (=> b!1434528 (= e!809803 e!809801)))

(declare-fun c!133028 () Bool)

(assert (=> b!1434528 (= c!133028 (validKeyInArray!0 (select (arr!47134 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434529 () Bool)

(assert (=> b!1434529 (= e!809801 call!67561)))

(declare-fun d!154413 () Bool)

(declare-fun res!967484 () Bool)

(assert (=> d!154413 (=> res!967484 e!809803)))

(assert (=> d!154413 (= res!967484 (bvsge #b00000000000000000000000000000000 (size!47685 a!2831)))))

(assert (=> d!154413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809803)))

(declare-fun bm!67558 () Bool)

(assert (=> bm!67558 (= call!67561 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!154413 (not res!967484)) b!1434528))

(assert (= (and b!1434528 c!133028) b!1434527))

(assert (= (and b!1434528 (not c!133028)) b!1434529))

(assert (= (and b!1434527 res!967483) b!1434526))

(assert (= (or b!1434526 b!1434529) bm!67558))

(declare-fun m!1324439 () Bool)

(assert (=> b!1434527 m!1324439))

(declare-fun m!1324441 () Bool)

(assert (=> b!1434527 m!1324441))

(declare-fun m!1324443 () Bool)

(assert (=> b!1434527 m!1324443))

(assert (=> b!1434527 m!1324439))

(declare-fun m!1324445 () Bool)

(assert (=> b!1434527 m!1324445))

(assert (=> b!1434528 m!1324439))

(assert (=> b!1434528 m!1324439))

(declare-fun m!1324447 () Bool)

(assert (=> b!1434528 m!1324447))

(declare-fun m!1324449 () Bool)

(assert (=> bm!67558 m!1324449))

(assert (=> b!1434330 d!154413))

(declare-fun d!154415 () Bool)

(assert (=> d!154415 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123808 d!154415))

(declare-fun d!154421 () Bool)

(assert (=> d!154421 (= (array_inv!36415 a!2831) (bvsge (size!47685 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123808 d!154421))

(declare-fun d!154425 () Bool)

(assert (=> d!154425 (= (validKeyInArray!0 (select (arr!47134 a!2831) j!81)) (and (not (= (select (arr!47134 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47134 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434331 d!154425))

(declare-fun b!1434578 () Bool)

(declare-fun e!809837 () SeekEntryResult!11315)

(assert (=> b!1434578 (= e!809837 (Intermediate!11315 false index!585 x!605))))

(declare-fun d!154427 () Bool)

(declare-fun e!809833 () Bool)

(assert (=> d!154427 e!809833))

(declare-fun c!133046 () Bool)

(declare-fun lt!631426 () SeekEntryResult!11315)

(assert (=> d!154427 (= c!133046 (and ((_ is Intermediate!11315) lt!631426) (undefined!12127 lt!631426)))))

(declare-fun e!809835 () SeekEntryResult!11315)

(assert (=> d!154427 (= lt!631426 e!809835)))

(declare-fun c!133045 () Bool)

(assert (=> d!154427 (= c!133045 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631427 () (_ BitVec 64))

(assert (=> d!154427 (= lt!631427 (select (arr!47134 lt!631315) index!585))))

(assert (=> d!154427 (validMask!0 mask!2608)))

(assert (=> d!154427 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631312 lt!631315 mask!2608) lt!631426)))

(declare-fun b!1434579 () Bool)

(declare-fun e!809834 () Bool)

(assert (=> b!1434579 (= e!809833 e!809834)))

(declare-fun res!967505 () Bool)

(assert (=> b!1434579 (= res!967505 (and ((_ is Intermediate!11315) lt!631426) (not (undefined!12127 lt!631426)) (bvslt (x!129453 lt!631426) #b01111111111111111111111111111110) (bvsge (x!129453 lt!631426) #b00000000000000000000000000000000) (bvsge (x!129453 lt!631426) x!605)))))

(assert (=> b!1434579 (=> (not res!967505) (not e!809834))))

(declare-fun b!1434580 () Bool)

(assert (=> b!1434580 (= e!809837 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!631312 lt!631315 mask!2608))))

(declare-fun b!1434581 () Bool)

(assert (=> b!1434581 (= e!809835 (Intermediate!11315 true index!585 x!605))))

(declare-fun b!1434582 () Bool)

(assert (=> b!1434582 (and (bvsge (index!47654 lt!631426) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631426) (size!47685 lt!631315)))))

(declare-fun res!967504 () Bool)

(assert (=> b!1434582 (= res!967504 (= (select (arr!47134 lt!631315) (index!47654 lt!631426)) lt!631312))))

(declare-fun e!809836 () Bool)

(assert (=> b!1434582 (=> res!967504 e!809836)))

(assert (=> b!1434582 (= e!809834 e!809836)))

(declare-fun b!1434583 () Bool)

(assert (=> b!1434583 (and (bvsge (index!47654 lt!631426) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631426) (size!47685 lt!631315)))))

(declare-fun res!967503 () Bool)

(assert (=> b!1434583 (= res!967503 (= (select (arr!47134 lt!631315) (index!47654 lt!631426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434583 (=> res!967503 e!809836)))

(declare-fun b!1434584 () Bool)

(assert (=> b!1434584 (= e!809833 (bvsge (x!129453 lt!631426) #b01111111111111111111111111111110))))

(declare-fun b!1434585 () Bool)

(assert (=> b!1434585 (and (bvsge (index!47654 lt!631426) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631426) (size!47685 lt!631315)))))

(assert (=> b!1434585 (= e!809836 (= (select (arr!47134 lt!631315) (index!47654 lt!631426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434586 () Bool)

(assert (=> b!1434586 (= e!809835 e!809837)))

(declare-fun c!133044 () Bool)

(assert (=> b!1434586 (= c!133044 (or (= lt!631427 lt!631312) (= (bvadd lt!631427 lt!631427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154427 c!133045) b!1434581))

(assert (= (and d!154427 (not c!133045)) b!1434586))

(assert (= (and b!1434586 c!133044) b!1434578))

(assert (= (and b!1434586 (not c!133044)) b!1434580))

(assert (= (and d!154427 c!133046) b!1434584))

(assert (= (and d!154427 (not c!133046)) b!1434579))

(assert (= (and b!1434579 res!967505) b!1434582))

(assert (= (and b!1434582 (not res!967504)) b!1434583))

(assert (= (and b!1434583 (not res!967503)) b!1434585))

(declare-fun m!1324471 () Bool)

(assert (=> b!1434585 m!1324471))

(assert (=> b!1434582 m!1324471))

(assert (=> b!1434583 m!1324471))

(declare-fun m!1324473 () Bool)

(assert (=> b!1434580 m!1324473))

(assert (=> b!1434580 m!1324473))

(declare-fun m!1324475 () Bool)

(assert (=> b!1434580 m!1324475))

(declare-fun m!1324477 () Bool)

(assert (=> d!154427 m!1324477))

(assert (=> d!154427 m!1324289))

(assert (=> b!1434321 d!154427))

(declare-fun b!1434587 () Bool)

(declare-fun e!809842 () SeekEntryResult!11315)

(assert (=> b!1434587 (= e!809842 (Intermediate!11315 false index!585 x!605))))

(declare-fun d!154431 () Bool)

(declare-fun e!809838 () Bool)

(assert (=> d!154431 e!809838))

(declare-fun c!133049 () Bool)

(declare-fun lt!631428 () SeekEntryResult!11315)

(assert (=> d!154431 (= c!133049 (and ((_ is Intermediate!11315) lt!631428) (undefined!12127 lt!631428)))))

(declare-fun e!809840 () SeekEntryResult!11315)

(assert (=> d!154431 (= lt!631428 e!809840)))

(declare-fun c!133048 () Bool)

(assert (=> d!154431 (= c!133048 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631429 () (_ BitVec 64))

(assert (=> d!154431 (= lt!631429 (select (arr!47134 a!2831) index!585))))

(assert (=> d!154431 (validMask!0 mask!2608)))

(assert (=> d!154431 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47134 a!2831) j!81) a!2831 mask!2608) lt!631428)))

(declare-fun b!1434588 () Bool)

(declare-fun e!809839 () Bool)

(assert (=> b!1434588 (= e!809838 e!809839)))

(declare-fun res!967508 () Bool)

(assert (=> b!1434588 (= res!967508 (and ((_ is Intermediate!11315) lt!631428) (not (undefined!12127 lt!631428)) (bvslt (x!129453 lt!631428) #b01111111111111111111111111111110) (bvsge (x!129453 lt!631428) #b00000000000000000000000000000000) (bvsge (x!129453 lt!631428) x!605)))))

(assert (=> b!1434588 (=> (not res!967508) (not e!809839))))

(declare-fun b!1434589 () Bool)

(assert (=> b!1434589 (= e!809842 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47134 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434590 () Bool)

(assert (=> b!1434590 (= e!809840 (Intermediate!11315 true index!585 x!605))))

(declare-fun b!1434591 () Bool)

(assert (=> b!1434591 (and (bvsge (index!47654 lt!631428) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631428) (size!47685 a!2831)))))

(declare-fun res!967507 () Bool)

(assert (=> b!1434591 (= res!967507 (= (select (arr!47134 a!2831) (index!47654 lt!631428)) (select (arr!47134 a!2831) j!81)))))

(declare-fun e!809841 () Bool)

(assert (=> b!1434591 (=> res!967507 e!809841)))

(assert (=> b!1434591 (= e!809839 e!809841)))

(declare-fun b!1434592 () Bool)

(assert (=> b!1434592 (and (bvsge (index!47654 lt!631428) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631428) (size!47685 a!2831)))))

(declare-fun res!967506 () Bool)

(assert (=> b!1434592 (= res!967506 (= (select (arr!47134 a!2831) (index!47654 lt!631428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434592 (=> res!967506 e!809841)))

(declare-fun b!1434593 () Bool)

(assert (=> b!1434593 (= e!809838 (bvsge (x!129453 lt!631428) #b01111111111111111111111111111110))))

(declare-fun b!1434594 () Bool)

(assert (=> b!1434594 (and (bvsge (index!47654 lt!631428) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631428) (size!47685 a!2831)))))

(assert (=> b!1434594 (= e!809841 (= (select (arr!47134 a!2831) (index!47654 lt!631428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434595 () Bool)

(assert (=> b!1434595 (= e!809840 e!809842)))

(declare-fun c!133047 () Bool)

(assert (=> b!1434595 (= c!133047 (or (= lt!631429 (select (arr!47134 a!2831) j!81)) (= (bvadd lt!631429 lt!631429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154431 c!133048) b!1434590))

(assert (= (and d!154431 (not c!133048)) b!1434595))

(assert (= (and b!1434595 c!133047) b!1434587))

(assert (= (and b!1434595 (not c!133047)) b!1434589))

(assert (= (and d!154431 c!133049) b!1434593))

(assert (= (and d!154431 (not c!133049)) b!1434588))

(assert (= (and b!1434588 res!967508) b!1434591))

(assert (= (and b!1434591 (not res!967507)) b!1434592))

(assert (= (and b!1434592 (not res!967506)) b!1434594))

(declare-fun m!1324479 () Bool)

(assert (=> b!1434594 m!1324479))

(assert (=> b!1434591 m!1324479))

(assert (=> b!1434592 m!1324479))

(assert (=> b!1434589 m!1324473))

(assert (=> b!1434589 m!1324473))

(assert (=> b!1434589 m!1324255))

(declare-fun m!1324481 () Bool)

(assert (=> b!1434589 m!1324481))

(assert (=> d!154431 m!1324271))

(assert (=> d!154431 m!1324289))

(assert (=> b!1434332 d!154431))

(declare-fun e!809847 () SeekEntryResult!11315)

(declare-fun b!1434596 () Bool)

(assert (=> b!1434596 (= e!809847 (Intermediate!11315 false (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154435 () Bool)

(declare-fun e!809843 () Bool)

(assert (=> d!154435 e!809843))

(declare-fun c!133052 () Bool)

(declare-fun lt!631430 () SeekEntryResult!11315)

(assert (=> d!154435 (= c!133052 (and ((_ is Intermediate!11315) lt!631430) (undefined!12127 lt!631430)))))

(declare-fun e!809845 () SeekEntryResult!11315)

(assert (=> d!154435 (= lt!631430 e!809845)))

(declare-fun c!133051 () Bool)

(assert (=> d!154435 (= c!133051 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631431 () (_ BitVec 64))

(assert (=> d!154435 (= lt!631431 (select (arr!47134 a!2831) (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608)))))

(assert (=> d!154435 (validMask!0 mask!2608)))

(assert (=> d!154435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) (select (arr!47134 a!2831) j!81) a!2831 mask!2608) lt!631430)))

(declare-fun b!1434597 () Bool)

(declare-fun e!809844 () Bool)

(assert (=> b!1434597 (= e!809843 e!809844)))

(declare-fun res!967511 () Bool)

(assert (=> b!1434597 (= res!967511 (and ((_ is Intermediate!11315) lt!631430) (not (undefined!12127 lt!631430)) (bvslt (x!129453 lt!631430) #b01111111111111111111111111111110) (bvsge (x!129453 lt!631430) #b00000000000000000000000000000000) (bvsge (x!129453 lt!631430) #b00000000000000000000000000000000)))))

(assert (=> b!1434597 (=> (not res!967511) (not e!809844))))

(declare-fun b!1434598 () Bool)

(assert (=> b!1434598 (= e!809847 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47134 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434599 () Bool)

(assert (=> b!1434599 (= e!809845 (Intermediate!11315 true (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434600 () Bool)

(assert (=> b!1434600 (and (bvsge (index!47654 lt!631430) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631430) (size!47685 a!2831)))))

(declare-fun res!967510 () Bool)

(assert (=> b!1434600 (= res!967510 (= (select (arr!47134 a!2831) (index!47654 lt!631430)) (select (arr!47134 a!2831) j!81)))))

(declare-fun e!809846 () Bool)

(assert (=> b!1434600 (=> res!967510 e!809846)))

(assert (=> b!1434600 (= e!809844 e!809846)))

(declare-fun b!1434601 () Bool)

(assert (=> b!1434601 (and (bvsge (index!47654 lt!631430) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631430) (size!47685 a!2831)))))

(declare-fun res!967509 () Bool)

(assert (=> b!1434601 (= res!967509 (= (select (arr!47134 a!2831) (index!47654 lt!631430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434601 (=> res!967509 e!809846)))

(declare-fun b!1434602 () Bool)

(assert (=> b!1434602 (= e!809843 (bvsge (x!129453 lt!631430) #b01111111111111111111111111111110))))

(declare-fun b!1434603 () Bool)

(assert (=> b!1434603 (and (bvsge (index!47654 lt!631430) #b00000000000000000000000000000000) (bvslt (index!47654 lt!631430) (size!47685 a!2831)))))

(assert (=> b!1434603 (= e!809846 (= (select (arr!47134 a!2831) (index!47654 lt!631430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434604 () Bool)

(assert (=> b!1434604 (= e!809845 e!809847)))

(declare-fun c!133050 () Bool)

(assert (=> b!1434604 (= c!133050 (or (= lt!631431 (select (arr!47134 a!2831) j!81)) (= (bvadd lt!631431 lt!631431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!154435 c!133051) b!1434599))

(assert (= (and d!154435 (not c!133051)) b!1434604))

(assert (= (and b!1434604 c!133050) b!1434596))

(assert (= (and b!1434604 (not c!133050)) b!1434598))

(assert (= (and d!154435 c!133052) b!1434602))

(assert (= (and d!154435 (not c!133052)) b!1434597))

(assert (= (and b!1434597 res!967511) b!1434600))

(assert (= (and b!1434600 (not res!967510)) b!1434601))

(assert (= (and b!1434601 (not res!967509)) b!1434603))

(declare-fun m!1324483 () Bool)

(assert (=> b!1434603 m!1324483))

(assert (=> b!1434600 m!1324483))

(assert (=> b!1434601 m!1324483))

(assert (=> b!1434598 m!1324285))

(declare-fun m!1324485 () Bool)

(assert (=> b!1434598 m!1324485))

(assert (=> b!1434598 m!1324485))

(assert (=> b!1434598 m!1324255))

(declare-fun m!1324487 () Bool)

(assert (=> b!1434598 m!1324487))

(assert (=> d!154435 m!1324285))

(declare-fun m!1324489 () Bool)

(assert (=> d!154435 m!1324489))

(assert (=> d!154435 m!1324289))

(assert (=> b!1434322 d!154435))

(declare-fun d!154437 () Bool)

(declare-fun lt!631435 () (_ BitVec 32))

(declare-fun lt!631434 () (_ BitVec 32))

(assert (=> d!154437 (= lt!631435 (bvmul (bvxor lt!631434 (bvlshr lt!631434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154437 (= lt!631434 ((_ extract 31 0) (bvand (bvxor (select (arr!47134 a!2831) j!81) (bvlshr (select (arr!47134 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154437 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967454 (let ((h!34964 ((_ extract 31 0) (bvand (bvxor (select (arr!47134 a!2831) j!81) (bvlshr (select (arr!47134 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129458 (bvmul (bvxor h!34964 (bvlshr h!34964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129458 (bvlshr x!129458 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967454 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967454 #b00000000000000000000000000000000))))))

(assert (=> d!154437 (= (toIndex!0 (select (arr!47134 a!2831) j!81) mask!2608) (bvand (bvxor lt!631435 (bvlshr lt!631435 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434322 d!154437))

(declare-fun b!1434624 () Bool)

(declare-fun e!809863 () Bool)

(declare-fun e!809864 () Bool)

(assert (=> b!1434624 (= e!809863 e!809864)))

(declare-fun c!133058 () Bool)

(assert (=> b!1434624 (= c!133058 (validKeyInArray!0 (select (arr!47134 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434625 () Bool)

(declare-fun call!67567 () Bool)

(assert (=> b!1434625 (= e!809864 call!67567)))

(declare-fun d!154439 () Bool)

(declare-fun res!967524 () Bool)

(declare-fun e!809861 () Bool)

(assert (=> d!154439 (=> res!967524 e!809861)))

(assert (=> d!154439 (= res!967524 (bvsge #b00000000000000000000000000000000 (size!47685 a!2831)))))

(assert (=> d!154439 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33628) e!809861)))

(declare-fun b!1434626 () Bool)

(assert (=> b!1434626 (= e!809864 call!67567)))

(declare-fun b!1434627 () Bool)

(declare-fun e!809862 () Bool)

(declare-fun contains!9914 (List!33631 (_ BitVec 64)) Bool)

(assert (=> b!1434627 (= e!809862 (contains!9914 Nil!33628 (select (arr!47134 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434628 () Bool)

(assert (=> b!1434628 (= e!809861 e!809863)))

(declare-fun res!967522 () Bool)

(assert (=> b!1434628 (=> (not res!967522) (not e!809863))))

(assert (=> b!1434628 (= res!967522 (not e!809862))))

(declare-fun res!967523 () Bool)

(assert (=> b!1434628 (=> (not res!967523) (not e!809862))))

(assert (=> b!1434628 (= res!967523 (validKeyInArray!0 (select (arr!47134 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67564 () Bool)

(assert (=> bm!67564 (= call!67567 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133058 (Cons!33627 (select (arr!47134 a!2831) #b00000000000000000000000000000000) Nil!33628) Nil!33628)))))

(assert (= (and d!154439 (not res!967524)) b!1434628))

(assert (= (and b!1434628 res!967523) b!1434627))

(assert (= (and b!1434628 res!967522) b!1434624))

(assert (= (and b!1434624 c!133058) b!1434626))

(assert (= (and b!1434624 (not c!133058)) b!1434625))

(assert (= (or b!1434626 b!1434625) bm!67564))

(assert (=> b!1434624 m!1324439))

(assert (=> b!1434624 m!1324439))

(assert (=> b!1434624 m!1324447))

(assert (=> b!1434627 m!1324439))

(assert (=> b!1434627 m!1324439))

(declare-fun m!1324501 () Bool)

(assert (=> b!1434627 m!1324501))

(assert (=> b!1434628 m!1324439))

(assert (=> b!1434628 m!1324439))

(assert (=> b!1434628 m!1324447))

(assert (=> bm!67564 m!1324439))

(declare-fun m!1324503 () Bool)

(assert (=> bm!67564 m!1324503))

(assert (=> b!1434333 d!154439))

(check-sat (not d!154389) (not d!154387) (not bm!67557) (not b!1434580) (not b!1434598) (not b!1434624) (not d!154435) (not b!1434627) (not b!1434476) (not b!1434527) (not bm!67558) (not b!1434589) (not bm!67564) (not b!1434515) (not b!1434628) (not d!154393) (not d!154409) (not b!1434514) (not b!1434438) (not b!1434528) (not d!154431) (not d!154427))
(check-sat)
