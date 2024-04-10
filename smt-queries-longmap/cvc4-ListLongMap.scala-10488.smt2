; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123454 () Bool)

(assert start!123454)

(declare-fun b!1431212 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97477 0))(
  ( (array!97478 (arr!47047 (Array (_ BitVec 32) (_ BitVec 64))) (size!47597 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97477)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun e!808019 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431212 (= e!808019 (or (= (select (arr!47047 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47047 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47047 a!2831) index!585) (select (arr!47047 a!2831) j!81)) (not (= (select (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1431213 () Bool)

(declare-fun res!965283 () Bool)

(declare-fun e!808021 () Bool)

(assert (=> b!1431213 (=> (not res!965283) (not e!808021))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1431213 (= res!965283 (and (= (size!47597 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47597 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47597 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!965282 () Bool)

(assert (=> start!123454 (=> (not res!965282) (not e!808021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123454 (= res!965282 (validMask!0 mask!2608))))

(assert (=> start!123454 e!808021))

(assert (=> start!123454 true))

(declare-fun array_inv!36075 (array!97477) Bool)

(assert (=> start!123454 (array_inv!36075 a!2831)))

(declare-fun b!1431214 () Bool)

(declare-fun res!965290 () Bool)

(assert (=> b!1431214 (=> (not res!965290) (not e!808019))))

(declare-datatypes ((SeekEntryResult!11326 0))(
  ( (MissingZero!11326 (index!47696 (_ BitVec 32))) (Found!11326 (index!47697 (_ BitVec 32))) (Intermediate!11326 (undefined!12138 Bool) (index!47698 (_ BitVec 32)) (x!129338 (_ BitVec 32))) (Undefined!11326) (MissingVacant!11326 (index!47699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97477 (_ BitVec 32)) SeekEntryResult!11326)

(assert (=> b!1431214 (= res!965290 (= (seekEntryOrOpen!0 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) (Found!11326 j!81)))))

(declare-fun b!1431215 () Bool)

(declare-fun res!965279 () Bool)

(declare-fun e!808020 () Bool)

(assert (=> b!1431215 (=> (not res!965279) (not e!808020))))

(declare-fun lt!630070 () SeekEntryResult!11326)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97477 (_ BitVec 32)) SeekEntryResult!11326)

(assert (=> b!1431215 (= res!965279 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630070))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun b!1431216 () Bool)

(assert (=> b!1431216 (= e!808020 (not (or (= (select (arr!47047 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47047 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47047 a!2831) index!585) (select (arr!47047 a!2831) j!81)) (not (= (select (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge intermediateAfterX!13 intermediateBeforeX!13) (not undefinedAfter!5))))))

(assert (=> b!1431216 e!808019))

(declare-fun res!965278 () Bool)

(assert (=> b!1431216 (=> (not res!965278) (not e!808019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97477 (_ BitVec 32)) Bool)

(assert (=> b!1431216 (= res!965278 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48398 0))(
  ( (Unit!48399) )
))
(declare-fun lt!630071 () Unit!48398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48398)

(assert (=> b!1431216 (= lt!630071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431217 () Bool)

(declare-fun res!965286 () Bool)

(assert (=> b!1431217 (=> (not res!965286) (not e!808021))))

(assert (=> b!1431217 (= res!965286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431218 () Bool)

(declare-fun res!965277 () Bool)

(assert (=> b!1431218 (=> (not res!965277) (not e!808021))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1431218 (= res!965277 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47597 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47597 a!2831))))))

(declare-fun b!1431219 () Bool)

(declare-fun res!965288 () Bool)

(assert (=> b!1431219 (=> (not res!965288) (not e!808021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431219 (= res!965288 (validKeyInArray!0 (select (arr!47047 a!2831) j!81)))))

(declare-fun b!1431220 () Bool)

(declare-fun res!965287 () Bool)

(assert (=> b!1431220 (=> (not res!965287) (not e!808020))))

(assert (=> b!1431220 (= res!965287 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431221 () Bool)

(declare-fun e!808018 () Bool)

(assert (=> b!1431221 (= e!808021 e!808018)))

(declare-fun res!965280 () Bool)

(assert (=> b!1431221 (=> (not res!965280) (not e!808018))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431221 (= res!965280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630070))))

(assert (=> b!1431221 (= lt!630070 (Intermediate!11326 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431222 () Bool)

(assert (=> b!1431222 (= e!808018 e!808020)))

(declare-fun res!965289 () Bool)

(assert (=> b!1431222 (=> (not res!965289) (not e!808020))))

(declare-fun lt!630072 () SeekEntryResult!11326)

(declare-fun lt!630068 () array!97477)

(declare-fun lt!630069 () (_ BitVec 64))

(assert (=> b!1431222 (= res!965289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630069 mask!2608) lt!630069 lt!630068 mask!2608) lt!630072))))

(assert (=> b!1431222 (= lt!630072 (Intermediate!11326 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431222 (= lt!630069 (select (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431222 (= lt!630068 (array!97478 (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47597 a!2831)))))

(declare-fun b!1431223 () Bool)

(declare-fun res!965285 () Bool)

(assert (=> b!1431223 (=> (not res!965285) (not e!808021))))

(assert (=> b!1431223 (= res!965285 (validKeyInArray!0 (select (arr!47047 a!2831) i!982)))))

(declare-fun b!1431224 () Bool)

(declare-fun res!965281 () Bool)

(assert (=> b!1431224 (=> (not res!965281) (not e!808020))))

(assert (=> b!1431224 (= res!965281 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630069 lt!630068 mask!2608) lt!630072))))

(declare-fun b!1431225 () Bool)

(declare-fun res!965284 () Bool)

(assert (=> b!1431225 (=> (not res!965284) (not e!808021))))

(declare-datatypes ((List!33557 0))(
  ( (Nil!33554) (Cons!33553 (h!34873 (_ BitVec 64)) (t!48251 List!33557)) )
))
(declare-fun arrayNoDuplicates!0 (array!97477 (_ BitVec 32) List!33557) Bool)

(assert (=> b!1431225 (= res!965284 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33554))))

(assert (= (and start!123454 res!965282) b!1431213))

(assert (= (and b!1431213 res!965283) b!1431223))

(assert (= (and b!1431223 res!965285) b!1431219))

(assert (= (and b!1431219 res!965288) b!1431217))

(assert (= (and b!1431217 res!965286) b!1431225))

(assert (= (and b!1431225 res!965284) b!1431218))

(assert (= (and b!1431218 res!965277) b!1431221))

(assert (= (and b!1431221 res!965280) b!1431222))

(assert (= (and b!1431222 res!965289) b!1431215))

(assert (= (and b!1431215 res!965279) b!1431224))

(assert (= (and b!1431224 res!965281) b!1431220))

(assert (= (and b!1431220 res!965287) b!1431216))

(assert (= (and b!1431216 res!965278) b!1431214))

(assert (= (and b!1431214 res!965290) b!1431212))

(declare-fun m!1321101 () Bool)

(assert (=> b!1431224 m!1321101))

(declare-fun m!1321103 () Bool)

(assert (=> b!1431214 m!1321103))

(assert (=> b!1431214 m!1321103))

(declare-fun m!1321105 () Bool)

(assert (=> b!1431214 m!1321105))

(declare-fun m!1321107 () Bool)

(assert (=> b!1431222 m!1321107))

(assert (=> b!1431222 m!1321107))

(declare-fun m!1321109 () Bool)

(assert (=> b!1431222 m!1321109))

(declare-fun m!1321111 () Bool)

(assert (=> b!1431222 m!1321111))

(declare-fun m!1321113 () Bool)

(assert (=> b!1431222 m!1321113))

(declare-fun m!1321115 () Bool)

(assert (=> start!123454 m!1321115))

(declare-fun m!1321117 () Bool)

(assert (=> start!123454 m!1321117))

(declare-fun m!1321119 () Bool)

(assert (=> b!1431217 m!1321119))

(assert (=> b!1431216 m!1321111))

(declare-fun m!1321121 () Bool)

(assert (=> b!1431216 m!1321121))

(declare-fun m!1321123 () Bool)

(assert (=> b!1431216 m!1321123))

(declare-fun m!1321125 () Bool)

(assert (=> b!1431216 m!1321125))

(assert (=> b!1431216 m!1321103))

(declare-fun m!1321127 () Bool)

(assert (=> b!1431216 m!1321127))

(assert (=> b!1431212 m!1321123))

(assert (=> b!1431212 m!1321103))

(assert (=> b!1431212 m!1321111))

(assert (=> b!1431212 m!1321121))

(assert (=> b!1431215 m!1321103))

(assert (=> b!1431215 m!1321103))

(declare-fun m!1321129 () Bool)

(assert (=> b!1431215 m!1321129))

(assert (=> b!1431221 m!1321103))

(assert (=> b!1431221 m!1321103))

(declare-fun m!1321131 () Bool)

(assert (=> b!1431221 m!1321131))

(assert (=> b!1431221 m!1321131))

(assert (=> b!1431221 m!1321103))

(declare-fun m!1321133 () Bool)

(assert (=> b!1431221 m!1321133))

(declare-fun m!1321135 () Bool)

(assert (=> b!1431223 m!1321135))

(assert (=> b!1431223 m!1321135))

(declare-fun m!1321137 () Bool)

(assert (=> b!1431223 m!1321137))

(declare-fun m!1321139 () Bool)

(assert (=> b!1431225 m!1321139))

(assert (=> b!1431219 m!1321103))

(assert (=> b!1431219 m!1321103))

(declare-fun m!1321141 () Bool)

(assert (=> b!1431219 m!1321141))

(push 1)

(assert (not b!1431215))

(assert (not start!123454))

(assert (not b!1431223))

(assert (not b!1431221))

(assert (not b!1431217))

(assert (not b!1431224))

(assert (not b!1431225))

(assert (not b!1431214))

(assert (not b!1431222))

(assert (not b!1431219))

(assert (not b!1431216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1431344 () Bool)

(declare-fun e!808096 () Bool)

(declare-fun e!808092 () Bool)

(assert (=> b!1431344 (= e!808096 e!808092)))

(declare-fun res!965337 () Bool)

(declare-fun lt!630114 () SeekEntryResult!11326)

(assert (=> b!1431344 (= res!965337 (and (is-Intermediate!11326 lt!630114) (not (undefined!12138 lt!630114)) (bvslt (x!129338 lt!630114) #b01111111111111111111111111111110) (bvsge (x!129338 lt!630114) #b00000000000000000000000000000000) (bvsge (x!129338 lt!630114) #b00000000000000000000000000000000)))))

(assert (=> b!1431344 (=> (not res!965337) (not e!808092))))

(declare-fun b!1431345 () Bool)

(assert (=> b!1431345 (= e!808096 (bvsge (x!129338 lt!630114) #b01111111111111111111111111111110))))

(declare-fun e!808095 () SeekEntryResult!11326)

(declare-fun b!1431346 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431346 (= e!808095 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630069 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630069 lt!630068 mask!2608))))

(declare-fun b!1431347 () Bool)

(assert (=> b!1431347 (and (bvsge (index!47698 lt!630114) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630114) (size!47597 lt!630068)))))

(declare-fun res!965335 () Bool)

(assert (=> b!1431347 (= res!965335 (= (select (arr!47047 lt!630068) (index!47698 lt!630114)) lt!630069))))

(declare-fun e!808094 () Bool)

(assert (=> b!1431347 (=> res!965335 e!808094)))

(assert (=> b!1431347 (= e!808092 e!808094)))

(declare-fun b!1431348 () Bool)

(assert (=> b!1431348 (and (bvsge (index!47698 lt!630114) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630114) (size!47597 lt!630068)))))

(declare-fun res!965336 () Bool)

(assert (=> b!1431348 (= res!965336 (= (select (arr!47047 lt!630068) (index!47698 lt!630114)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431348 (=> res!965336 e!808094)))

(declare-fun b!1431349 () Bool)

(assert (=> b!1431349 (and (bvsge (index!47698 lt!630114) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630114) (size!47597 lt!630068)))))

(assert (=> b!1431349 (= e!808094 (= (select (arr!47047 lt!630068) (index!47698 lt!630114)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431350 () Bool)

(declare-fun e!808093 () SeekEntryResult!11326)

(assert (=> b!1431350 (= e!808093 e!808095)))

(declare-fun c!132503 () Bool)

(declare-fun lt!630113 () (_ BitVec 64))

(assert (=> b!1431350 (= c!132503 (or (= lt!630113 lt!630069) (= (bvadd lt!630113 lt!630113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153883 () Bool)

(assert (=> d!153883 e!808096))

(declare-fun c!132501 () Bool)

(assert (=> d!153883 (= c!132501 (and (is-Intermediate!11326 lt!630114) (undefined!12138 lt!630114)))))

(assert (=> d!153883 (= lt!630114 e!808093)))

(declare-fun c!132502 () Bool)

(assert (=> d!153883 (= c!132502 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153883 (= lt!630113 (select (arr!47047 lt!630068) (toIndex!0 lt!630069 mask!2608)))))

(assert (=> d!153883 (validMask!0 mask!2608)))

(assert (=> d!153883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630069 mask!2608) lt!630069 lt!630068 mask!2608) lt!630114)))

(declare-fun b!1431351 () Bool)

(assert (=> b!1431351 (= e!808093 (Intermediate!11326 true (toIndex!0 lt!630069 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431352 () Bool)

(assert (=> b!1431352 (= e!808095 (Intermediate!11326 false (toIndex!0 lt!630069 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153883 c!132502) b!1431351))

(assert (= (and d!153883 (not c!132502)) b!1431350))

(assert (= (and b!1431350 c!132503) b!1431352))

(assert (= (and b!1431350 (not c!132503)) b!1431346))

(assert (= (and d!153883 c!132501) b!1431345))

(assert (= (and d!153883 (not c!132501)) b!1431344))

(assert (= (and b!1431344 res!965337) b!1431347))

(assert (= (and b!1431347 (not res!965335)) b!1431348))

(assert (= (and b!1431348 (not res!965336)) b!1431349))

(declare-fun m!1321187 () Bool)

(assert (=> b!1431349 m!1321187))

(assert (=> d!153883 m!1321107))

(declare-fun m!1321189 () Bool)

(assert (=> d!153883 m!1321189))

(assert (=> d!153883 m!1321115))

(assert (=> b!1431346 m!1321107))

(declare-fun m!1321191 () Bool)

(assert (=> b!1431346 m!1321191))

(assert (=> b!1431346 m!1321191))

(declare-fun m!1321193 () Bool)

(assert (=> b!1431346 m!1321193))

(assert (=> b!1431348 m!1321187))

(assert (=> b!1431347 m!1321187))

(assert (=> b!1431222 d!153883))

(declare-fun d!153899 () Bool)

(declare-fun lt!630131 () (_ BitVec 32))

(declare-fun lt!630130 () (_ BitVec 32))

(assert (=> d!153899 (= lt!630131 (bvmul (bvxor lt!630130 (bvlshr lt!630130 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153899 (= lt!630130 ((_ extract 31 0) (bvand (bvxor lt!630069 (bvlshr lt!630069 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153899 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965338 (let ((h!34876 ((_ extract 31 0) (bvand (bvxor lt!630069 (bvlshr lt!630069 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129344 (bvmul (bvxor h!34876 (bvlshr h!34876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129344 (bvlshr x!129344 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965338 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965338 #b00000000000000000000000000000000))))))

(assert (=> d!153899 (= (toIndex!0 lt!630069 mask!2608) (bvand (bvxor lt!630131 (bvlshr lt!630131 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431222 d!153899))

(declare-fun b!1431408 () Bool)

(declare-fun e!808134 () Bool)

(declare-fun e!808133 () Bool)

(assert (=> b!1431408 (= e!808134 e!808133)))

(declare-fun c!132522 () Bool)

(assert (=> b!1431408 (= c!132522 (validKeyInArray!0 (select (arr!47047 a!2831) j!81)))))

(declare-fun bm!67465 () Bool)

(declare-fun call!67468 () Bool)

(assert (=> bm!67465 (= call!67468 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431409 () Bool)

(assert (=> b!1431409 (= e!808133 call!67468)))

(declare-fun d!153905 () Bool)

(declare-fun res!965358 () Bool)

(assert (=> d!153905 (=> res!965358 e!808134)))

(assert (=> d!153905 (= res!965358 (bvsge j!81 (size!47597 a!2831)))))

(assert (=> d!153905 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808134)))

(declare-fun b!1431410 () Bool)

(declare-fun e!808135 () Bool)

(assert (=> b!1431410 (= e!808133 e!808135)))

(declare-fun lt!630156 () (_ BitVec 64))

(assert (=> b!1431410 (= lt!630156 (select (arr!47047 a!2831) j!81))))

(declare-fun lt!630155 () Unit!48398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97477 (_ BitVec 64) (_ BitVec 32)) Unit!48398)

(assert (=> b!1431410 (= lt!630155 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630156 j!81))))

(declare-fun arrayContainsKey!0 (array!97477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1431410 (arrayContainsKey!0 a!2831 lt!630156 #b00000000000000000000000000000000)))

(declare-fun lt!630157 () Unit!48398)

(assert (=> b!1431410 (= lt!630157 lt!630155)))

(declare-fun res!965359 () Bool)

(assert (=> b!1431410 (= res!965359 (= (seekEntryOrOpen!0 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) (Found!11326 j!81)))))

(assert (=> b!1431410 (=> (not res!965359) (not e!808135))))

(declare-fun b!1431411 () Bool)

(assert (=> b!1431411 (= e!808135 call!67468)))

(assert (= (and d!153905 (not res!965358)) b!1431408))

(assert (= (and b!1431408 c!132522) b!1431410))

(assert (= (and b!1431408 (not c!132522)) b!1431409))

(assert (= (and b!1431410 res!965359) b!1431411))

(assert (= (or b!1431411 b!1431409) bm!67465))

(assert (=> b!1431408 m!1321103))

(assert (=> b!1431408 m!1321103))

(assert (=> b!1431408 m!1321141))

(declare-fun m!1321227 () Bool)

(assert (=> bm!67465 m!1321227))

(assert (=> b!1431410 m!1321103))

(declare-fun m!1321229 () Bool)

(assert (=> b!1431410 m!1321229))

(declare-fun m!1321231 () Bool)

(assert (=> b!1431410 m!1321231))

(assert (=> b!1431410 m!1321103))

(assert (=> b!1431410 m!1321105))

(assert (=> b!1431216 d!153905))

(declare-fun d!153915 () Bool)

(assert (=> d!153915 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630163 () Unit!48398)

(declare-fun choose!38 (array!97477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48398)

(assert (=> d!153915 (= lt!630163 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153915 (validMask!0 mask!2608)))

(assert (=> d!153915 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630163)))

(declare-fun bs!41695 () Bool)

(assert (= bs!41695 d!153915))

(assert (=> bs!41695 m!1321125))

(declare-fun m!1321235 () Bool)

(assert (=> bs!41695 m!1321235))

(assert (=> bs!41695 m!1321115))

(assert (=> b!1431216 d!153915))

(declare-fun b!1431416 () Bool)

(declare-fun e!808143 () Bool)

(declare-fun e!808139 () Bool)

(assert (=> b!1431416 (= e!808143 e!808139)))

(declare-fun res!965364 () Bool)

(declare-fun lt!630168 () SeekEntryResult!11326)

(assert (=> b!1431416 (= res!965364 (and (is-Intermediate!11326 lt!630168) (not (undefined!12138 lt!630168)) (bvslt (x!129338 lt!630168) #b01111111111111111111111111111110) (bvsge (x!129338 lt!630168) #b00000000000000000000000000000000) (bvsge (x!129338 lt!630168) #b00000000000000000000000000000000)))))

(assert (=> b!1431416 (=> (not res!965364) (not e!808139))))

(declare-fun b!1431417 () Bool)

(assert (=> b!1431417 (= e!808143 (bvsge (x!129338 lt!630168) #b01111111111111111111111111111110))))

(declare-fun b!1431418 () Bool)

(declare-fun e!808142 () SeekEntryResult!11326)

(assert (=> b!1431418 (= e!808142 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431419 () Bool)

(assert (=> b!1431419 (and (bvsge (index!47698 lt!630168) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630168) (size!47597 a!2831)))))

(declare-fun res!965362 () Bool)

(assert (=> b!1431419 (= res!965362 (= (select (arr!47047 a!2831) (index!47698 lt!630168)) (select (arr!47047 a!2831) j!81)))))

(declare-fun e!808141 () Bool)

(assert (=> b!1431419 (=> res!965362 e!808141)))

(assert (=> b!1431419 (= e!808139 e!808141)))

(declare-fun b!1431420 () Bool)

(assert (=> b!1431420 (and (bvsge (index!47698 lt!630168) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630168) (size!47597 a!2831)))))

(declare-fun res!965363 () Bool)

(assert (=> b!1431420 (= res!965363 (= (select (arr!47047 a!2831) (index!47698 lt!630168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431420 (=> res!965363 e!808141)))

(declare-fun b!1431421 () Bool)

(assert (=> b!1431421 (and (bvsge (index!47698 lt!630168) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630168) (size!47597 a!2831)))))

(assert (=> b!1431421 (= e!808141 (= (select (arr!47047 a!2831) (index!47698 lt!630168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431422 () Bool)

(declare-fun e!808140 () SeekEntryResult!11326)

(assert (=> b!1431422 (= e!808140 e!808142)))

(declare-fun lt!630167 () (_ BitVec 64))

(declare-fun c!132526 () Bool)

(assert (=> b!1431422 (= c!132526 (or (= lt!630167 (select (arr!47047 a!2831) j!81)) (= (bvadd lt!630167 lt!630167) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153919 () Bool)

(assert (=> d!153919 e!808143))

(declare-fun c!132524 () Bool)

(assert (=> d!153919 (= c!132524 (and (is-Intermediate!11326 lt!630168) (undefined!12138 lt!630168)))))

(assert (=> d!153919 (= lt!630168 e!808140)))

(declare-fun c!132525 () Bool)

(assert (=> d!153919 (= c!132525 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153919 (= lt!630167 (select (arr!47047 a!2831) (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608)))))

(assert (=> d!153919 (validMask!0 mask!2608)))

(assert (=> d!153919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630168)))

(declare-fun b!1431423 () Bool)

(assert (=> b!1431423 (= e!808140 (Intermediate!11326 true (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431424 () Bool)

(assert (=> b!1431424 (= e!808142 (Intermediate!11326 false (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153919 c!132525) b!1431423))

(assert (= (and d!153919 (not c!132525)) b!1431422))

(assert (= (and b!1431422 c!132526) b!1431424))

(assert (= (and b!1431422 (not c!132526)) b!1431418))

(assert (= (and d!153919 c!132524) b!1431417))

(assert (= (and d!153919 (not c!132524)) b!1431416))

(assert (= (and b!1431416 res!965364) b!1431419))

(assert (= (and b!1431419 (not res!965362)) b!1431420))

(assert (= (and b!1431420 (not res!965363)) b!1431421))

(declare-fun m!1321245 () Bool)

(assert (=> b!1431421 m!1321245))

(assert (=> d!153919 m!1321131))

(declare-fun m!1321247 () Bool)

(assert (=> d!153919 m!1321247))

(assert (=> d!153919 m!1321115))

(assert (=> b!1431418 m!1321131))

(declare-fun m!1321249 () Bool)

(assert (=> b!1431418 m!1321249))

(assert (=> b!1431418 m!1321249))

(assert (=> b!1431418 m!1321103))

(declare-fun m!1321251 () Bool)

(assert (=> b!1431418 m!1321251))

(assert (=> b!1431420 m!1321245))

(assert (=> b!1431419 m!1321245))

(assert (=> b!1431221 d!153919))

(declare-fun d!153923 () Bool)

(declare-fun lt!630170 () (_ BitVec 32))

(declare-fun lt!630169 () (_ BitVec 32))

(assert (=> d!153923 (= lt!630170 (bvmul (bvxor lt!630169 (bvlshr lt!630169 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153923 (= lt!630169 ((_ extract 31 0) (bvand (bvxor (select (arr!47047 a!2831) j!81) (bvlshr (select (arr!47047 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153923 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965338 (let ((h!34876 ((_ extract 31 0) (bvand (bvxor (select (arr!47047 a!2831) j!81) (bvlshr (select (arr!47047 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129344 (bvmul (bvxor h!34876 (bvlshr h!34876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129344 (bvlshr x!129344 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965338 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965338 #b00000000000000000000000000000000))))))

(assert (=> d!153923 (= (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) (bvand (bvxor lt!630170 (bvlshr lt!630170 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431221 d!153923))

(declare-fun b!1431425 () Bool)

(declare-fun e!808148 () Bool)

(declare-fun e!808144 () Bool)

(assert (=> b!1431425 (= e!808148 e!808144)))

(declare-fun res!965367 () Bool)

(declare-fun lt!630172 () SeekEntryResult!11326)

(assert (=> b!1431425 (= res!965367 (and (is-Intermediate!11326 lt!630172) (not (undefined!12138 lt!630172)) (bvslt (x!129338 lt!630172) #b01111111111111111111111111111110) (bvsge (x!129338 lt!630172) #b00000000000000000000000000000000) (bvsge (x!129338 lt!630172) x!605)))))

(assert (=> b!1431425 (=> (not res!965367) (not e!808144))))

(declare-fun b!1431426 () Bool)

(assert (=> b!1431426 (= e!808148 (bvsge (x!129338 lt!630172) #b01111111111111111111111111111110))))

(declare-fun b!1431427 () Bool)

(declare-fun e!808147 () SeekEntryResult!11326)

(assert (=> b!1431427 (= e!808147 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431428 () Bool)

(assert (=> b!1431428 (and (bvsge (index!47698 lt!630172) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630172) (size!47597 a!2831)))))

(declare-fun res!965365 () Bool)

(assert (=> b!1431428 (= res!965365 (= (select (arr!47047 a!2831) (index!47698 lt!630172)) (select (arr!47047 a!2831) j!81)))))

(declare-fun e!808146 () Bool)

(assert (=> b!1431428 (=> res!965365 e!808146)))

(assert (=> b!1431428 (= e!808144 e!808146)))

(declare-fun b!1431429 () Bool)

(assert (=> b!1431429 (and (bvsge (index!47698 lt!630172) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630172) (size!47597 a!2831)))))

(declare-fun res!965366 () Bool)

(assert (=> b!1431429 (= res!965366 (= (select (arr!47047 a!2831) (index!47698 lt!630172)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431429 (=> res!965366 e!808146)))

(declare-fun b!1431430 () Bool)

(assert (=> b!1431430 (and (bvsge (index!47698 lt!630172) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630172) (size!47597 a!2831)))))

(assert (=> b!1431430 (= e!808146 (= (select (arr!47047 a!2831) (index!47698 lt!630172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431431 () Bool)

(declare-fun e!808145 () SeekEntryResult!11326)

(assert (=> b!1431431 (= e!808145 e!808147)))

(declare-fun c!132529 () Bool)

(declare-fun lt!630171 () (_ BitVec 64))

(assert (=> b!1431431 (= c!132529 (or (= lt!630171 (select (arr!47047 a!2831) j!81)) (= (bvadd lt!630171 lt!630171) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153925 () Bool)

(assert (=> d!153925 e!808148))

(declare-fun c!132527 () Bool)

(assert (=> d!153925 (= c!132527 (and (is-Intermediate!11326 lt!630172) (undefined!12138 lt!630172)))))

(assert (=> d!153925 (= lt!630172 e!808145)))

(declare-fun c!132528 () Bool)

(assert (=> d!153925 (= c!132528 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153925 (= lt!630171 (select (arr!47047 a!2831) index!585))))

(assert (=> d!153925 (validMask!0 mask!2608)))

(assert (=> d!153925 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630172)))

(declare-fun b!1431432 () Bool)

(assert (=> b!1431432 (= e!808145 (Intermediate!11326 true index!585 x!605))))

(declare-fun b!1431433 () Bool)

(assert (=> b!1431433 (= e!808147 (Intermediate!11326 false index!585 x!605))))

(assert (= (and d!153925 c!132528) b!1431432))

(assert (= (and d!153925 (not c!132528)) b!1431431))

(assert (= (and b!1431431 c!132529) b!1431433))

(assert (= (and b!1431431 (not c!132529)) b!1431427))

(assert (= (and d!153925 c!132527) b!1431426))

(assert (= (and d!153925 (not c!132527)) b!1431425))

(assert (= (and b!1431425 res!965367) b!1431428))

(assert (= (and b!1431428 (not res!965365)) b!1431429))

(assert (= (and b!1431429 (not res!965366)) b!1431430))

(declare-fun m!1321253 () Bool)

(assert (=> b!1431430 m!1321253))

(assert (=> d!153925 m!1321123))

(assert (=> d!153925 m!1321115))

(declare-fun m!1321255 () Bool)

(assert (=> b!1431427 m!1321255))

(assert (=> b!1431427 m!1321255))

(assert (=> b!1431427 m!1321103))

(declare-fun m!1321257 () Bool)

(assert (=> b!1431427 m!1321257))

(assert (=> b!1431429 m!1321253))

(assert (=> b!1431428 m!1321253))

(assert (=> b!1431215 d!153925))

(declare-fun b!1431444 () Bool)

(declare-fun e!808160 () Bool)

(declare-fun call!67472 () Bool)

(assert (=> b!1431444 (= e!808160 call!67472)))

(declare-fun b!1431445 () Bool)

(declare-fun e!808158 () Bool)

(assert (=> b!1431445 (= e!808158 e!808160)))

(declare-fun c!132532 () Bool)

(assert (=> b!1431445 (= c!132532 (validKeyInArray!0 (select (arr!47047 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153927 () Bool)

(declare-fun res!965374 () Bool)

(declare-fun e!808159 () Bool)

(assert (=> d!153927 (=> res!965374 e!808159)))

(assert (=> d!153927 (= res!965374 (bvsge #b00000000000000000000000000000000 (size!47597 a!2831)))))

(assert (=> d!153927 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33554) e!808159)))

(declare-fun bm!67469 () Bool)

(assert (=> bm!67469 (= call!67472 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132532 (Cons!33553 (select (arr!47047 a!2831) #b00000000000000000000000000000000) Nil!33554) Nil!33554)))))

(declare-fun b!1431446 () Bool)

(assert (=> b!1431446 (= e!808159 e!808158)))

(declare-fun res!965375 () Bool)

(assert (=> b!1431446 (=> (not res!965375) (not e!808158))))

(declare-fun e!808157 () Bool)

(assert (=> b!1431446 (= res!965375 (not e!808157))))

(declare-fun res!965376 () Bool)

(assert (=> b!1431446 (=> (not res!965376) (not e!808157))))

(assert (=> b!1431446 (= res!965376 (validKeyInArray!0 (select (arr!47047 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431447 () Bool)

(assert (=> b!1431447 (= e!808160 call!67472)))

(declare-fun b!1431448 () Bool)

(declare-fun contains!9866 (List!33557 (_ BitVec 64)) Bool)

(assert (=> b!1431448 (= e!808157 (contains!9866 Nil!33554 (select (arr!47047 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153927 (not res!965374)) b!1431446))

(assert (= (and b!1431446 res!965376) b!1431448))

(assert (= (and b!1431446 res!965375) b!1431445))

(assert (= (and b!1431445 c!132532) b!1431444))

(assert (= (and b!1431445 (not c!132532)) b!1431447))

(assert (= (or b!1431444 b!1431447) bm!67469))

(declare-fun m!1321259 () Bool)

(assert (=> b!1431445 m!1321259))

(assert (=> b!1431445 m!1321259))

(declare-fun m!1321261 () Bool)

(assert (=> b!1431445 m!1321261))

(assert (=> bm!67469 m!1321259))

(declare-fun m!1321263 () Bool)

(assert (=> bm!67469 m!1321263))

(assert (=> b!1431446 m!1321259))

(assert (=> b!1431446 m!1321259))

(assert (=> b!1431446 m!1321261))

(assert (=> b!1431448 m!1321259))

(assert (=> b!1431448 m!1321259))

(declare-fun m!1321265 () Bool)

(assert (=> b!1431448 m!1321265))

(assert (=> b!1431225 d!153927))

(declare-fun b!1431483 () Bool)

(declare-fun e!808179 () SeekEntryResult!11326)

(declare-fun lt!630192 () SeekEntryResult!11326)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97477 (_ BitVec 32)) SeekEntryResult!11326)

(assert (=> b!1431483 (= e!808179 (seekKeyOrZeroReturnVacant!0 (x!129338 lt!630192) (index!47698 lt!630192) (index!47698 lt!630192) (select (arr!47047 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431484 () Bool)

(declare-fun e!808180 () SeekEntryResult!11326)

(assert (=> b!1431484 (= e!808180 (Found!11326 (index!47698 lt!630192)))))

(declare-fun d!153933 () Bool)

(declare-fun lt!630193 () SeekEntryResult!11326)

(assert (=> d!153933 (and (or (is-Undefined!11326 lt!630193) (not (is-Found!11326 lt!630193)) (and (bvsge (index!47697 lt!630193) #b00000000000000000000000000000000) (bvslt (index!47697 lt!630193) (size!47597 a!2831)))) (or (is-Undefined!11326 lt!630193) (is-Found!11326 lt!630193) (not (is-MissingZero!11326 lt!630193)) (and (bvsge (index!47696 lt!630193) #b00000000000000000000000000000000) (bvslt (index!47696 lt!630193) (size!47597 a!2831)))) (or (is-Undefined!11326 lt!630193) (is-Found!11326 lt!630193) (is-MissingZero!11326 lt!630193) (not (is-MissingVacant!11326 lt!630193)) (and (bvsge (index!47699 lt!630193) #b00000000000000000000000000000000) (bvslt (index!47699 lt!630193) (size!47597 a!2831)))) (or (is-Undefined!11326 lt!630193) (ite (is-Found!11326 lt!630193) (= (select (arr!47047 a!2831) (index!47697 lt!630193)) (select (arr!47047 a!2831) j!81)) (ite (is-MissingZero!11326 lt!630193) (= (select (arr!47047 a!2831) (index!47696 lt!630193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11326 lt!630193) (= (select (arr!47047 a!2831) (index!47699 lt!630193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!808181 () SeekEntryResult!11326)

(assert (=> d!153933 (= lt!630193 e!808181)))

(declare-fun c!132551 () Bool)

(assert (=> d!153933 (= c!132551 (and (is-Intermediate!11326 lt!630192) (undefined!12138 lt!630192)))))

(assert (=> d!153933 (= lt!630192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153933 (validMask!0 mask!2608)))

(assert (=> d!153933 (= (seekEntryOrOpen!0 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630193)))

(declare-fun b!1431485 () Bool)

(assert (=> b!1431485 (= e!808179 (MissingZero!11326 (index!47698 lt!630192)))))

(declare-fun b!1431486 () Bool)

(declare-fun c!132550 () Bool)

(declare-fun lt!630191 () (_ BitVec 64))

(assert (=> b!1431486 (= c!132550 (= lt!630191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431486 (= e!808180 e!808179)))

(declare-fun b!1431487 () Bool)

(assert (=> b!1431487 (= e!808181 e!808180)))

(assert (=> b!1431487 (= lt!630191 (select (arr!47047 a!2831) (index!47698 lt!630192)))))

(declare-fun c!132549 () Bool)

(assert (=> b!1431487 (= c!132549 (= lt!630191 (select (arr!47047 a!2831) j!81)))))

(declare-fun b!1431488 () Bool)

(assert (=> b!1431488 (= e!808181 Undefined!11326)))

(assert (= (and d!153933 c!132551) b!1431488))

(assert (= (and d!153933 (not c!132551)) b!1431487))

(assert (= (and b!1431487 c!132549) b!1431484))

(assert (= (and b!1431487 (not c!132549)) b!1431486))

(assert (= (and b!1431486 c!132550) b!1431485))

(assert (= (and b!1431486 (not c!132550)) b!1431483))

(assert (=> b!1431483 m!1321103))

(declare-fun m!1321289 () Bool)

(assert (=> b!1431483 m!1321289))

(assert (=> d!153933 m!1321115))

(assert (=> d!153933 m!1321131))

(assert (=> d!153933 m!1321103))

(assert (=> d!153933 m!1321133))

(declare-fun m!1321291 () Bool)

(assert (=> d!153933 m!1321291))

(assert (=> d!153933 m!1321103))

(assert (=> d!153933 m!1321131))

(declare-fun m!1321293 () Bool)

(assert (=> d!153933 m!1321293))

(declare-fun m!1321295 () Bool)

(assert (=> d!153933 m!1321295))

(declare-fun m!1321297 () Bool)

(assert (=> b!1431487 m!1321297))

(assert (=> b!1431214 d!153933))

(declare-fun d!153941 () Bool)

(assert (=> d!153941 (= (validKeyInArray!0 (select (arr!47047 a!2831) j!81)) (and (not (= (select (arr!47047 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47047 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431219 d!153941))

(declare-fun b!1431489 () Bool)

(declare-fun e!808186 () Bool)

(declare-fun e!808182 () Bool)

(assert (=> b!1431489 (= e!808186 e!808182)))

(declare-fun res!965381 () Bool)

(declare-fun lt!630195 () SeekEntryResult!11326)

(assert (=> b!1431489 (= res!965381 (and (is-Intermediate!11326 lt!630195) (not (undefined!12138 lt!630195)) (bvslt (x!129338 lt!630195) #b01111111111111111111111111111110) (bvsge (x!129338 lt!630195) #b00000000000000000000000000000000) (bvsge (x!129338 lt!630195) x!605)))))

(assert (=> b!1431489 (=> (not res!965381) (not e!808182))))

(declare-fun b!1431490 () Bool)

(assert (=> b!1431490 (= e!808186 (bvsge (x!129338 lt!630195) #b01111111111111111111111111111110))))

(declare-fun e!808185 () SeekEntryResult!11326)

(declare-fun b!1431491 () Bool)

(assert (=> b!1431491 (= e!808185 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630069 lt!630068 mask!2608))))

(declare-fun b!1431492 () Bool)

(assert (=> b!1431492 (and (bvsge (index!47698 lt!630195) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630195) (size!47597 lt!630068)))))

(declare-fun res!965379 () Bool)

(assert (=> b!1431492 (= res!965379 (= (select (arr!47047 lt!630068) (index!47698 lt!630195)) lt!630069))))

(declare-fun e!808184 () Bool)

(assert (=> b!1431492 (=> res!965379 e!808184)))

(assert (=> b!1431492 (= e!808182 e!808184)))

(declare-fun b!1431493 () Bool)

(assert (=> b!1431493 (and (bvsge (index!47698 lt!630195) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630195) (size!47597 lt!630068)))))

(declare-fun res!965380 () Bool)

(assert (=> b!1431493 (= res!965380 (= (select (arr!47047 lt!630068) (index!47698 lt!630195)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431493 (=> res!965380 e!808184)))

(declare-fun b!1431494 () Bool)

(assert (=> b!1431494 (and (bvsge (index!47698 lt!630195) #b00000000000000000000000000000000) (bvslt (index!47698 lt!630195) (size!47597 lt!630068)))))

(assert (=> b!1431494 (= e!808184 (= (select (arr!47047 lt!630068) (index!47698 lt!630195)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431495 () Bool)

(declare-fun e!808183 () SeekEntryResult!11326)

(assert (=> b!1431495 (= e!808183 e!808185)))

(declare-fun c!132554 () Bool)

(declare-fun lt!630194 () (_ BitVec 64))

(assert (=> b!1431495 (= c!132554 (or (= lt!630194 lt!630069) (= (bvadd lt!630194 lt!630194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153943 () Bool)

(assert (=> d!153943 e!808186))

(declare-fun c!132552 () Bool)

(assert (=> d!153943 (= c!132552 (and (is-Intermediate!11326 lt!630195) (undefined!12138 lt!630195)))))

(assert (=> d!153943 (= lt!630195 e!808183)))

(declare-fun c!132553 () Bool)

(assert (=> d!153943 (= c!132553 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153943 (= lt!630194 (select (arr!47047 lt!630068) index!585))))

(assert (=> d!153943 (validMask!0 mask!2608)))

(assert (=> d!153943 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630069 lt!630068 mask!2608) lt!630195)))

(declare-fun b!1431496 () Bool)

(assert (=> b!1431496 (= e!808183 (Intermediate!11326 true index!585 x!605))))

(declare-fun b!1431497 () Bool)

(assert (=> b!1431497 (= e!808185 (Intermediate!11326 false index!585 x!605))))

(assert (= (and d!153943 c!132553) b!1431496))

(assert (= (and d!153943 (not c!132553)) b!1431495))

(assert (= (and b!1431495 c!132554) b!1431497))

(assert (= (and b!1431495 (not c!132554)) b!1431491))

(assert (= (and d!153943 c!132552) b!1431490))

(assert (= (and d!153943 (not c!132552)) b!1431489))

(assert (= (and b!1431489 res!965381) b!1431492))

(assert (= (and b!1431492 (not res!965379)) b!1431493))

(assert (= (and b!1431493 (not res!965380)) b!1431494))

(declare-fun m!1321299 () Bool)

(assert (=> b!1431494 m!1321299))

(declare-fun m!1321301 () Bool)

(assert (=> d!153943 m!1321301))

(assert (=> d!153943 m!1321115))

(assert (=> b!1431491 m!1321255))

(assert (=> b!1431491 m!1321255))

(declare-fun m!1321303 () Bool)

(assert (=> b!1431491 m!1321303))

(assert (=> b!1431493 m!1321299))

(assert (=> b!1431492 m!1321299))

(assert (=> b!1431224 d!153943))

(declare-fun d!153945 () Bool)

(assert (=> d!153945 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123454 d!153945))

(declare-fun d!153955 () Bool)

(assert (=> d!153955 (= (array_inv!36075 a!2831) (bvsge (size!47597 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123454 d!153955))

(declare-fun d!153957 () Bool)

(assert (=> d!153957 (= (validKeyInArray!0 (select (arr!47047 a!2831) i!982)) (and (not (= (select (arr!47047 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47047 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431223 d!153957))

(declare-fun b!1431531 () Bool)

(declare-fun e!808210 () Bool)

(declare-fun e!808209 () Bool)

(assert (=> b!1431531 (= e!808210 e!808209)))

(declare-fun c!132564 () Bool)

(assert (=> b!1431531 (= c!132564 (validKeyInArray!0 (select (arr!47047 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67474 () Bool)

(declare-fun call!67477 () Bool)

(assert (=> bm!67474 (= call!67477 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431532 () Bool)

(assert (=> b!1431532 (= e!808209 call!67477)))

(declare-fun d!153959 () Bool)

(declare-fun res!965397 () Bool)

(assert (=> d!153959 (=> res!965397 e!808210)))

(assert (=> d!153959 (= res!965397 (bvsge #b00000000000000000000000000000000 (size!47597 a!2831)))))

(assert (=> d!153959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808210)))

(declare-fun b!1431533 () Bool)

(declare-fun e!808211 () Bool)

(assert (=> b!1431533 (= e!808209 e!808211)))

(declare-fun lt!630203 () (_ BitVec 64))

(assert (=> b!1431533 (= lt!630203 (select (arr!47047 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630202 () Unit!48398)

(assert (=> b!1431533 (= lt!630202 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630203 #b00000000000000000000000000000000))))

(assert (=> b!1431533 (arrayContainsKey!0 a!2831 lt!630203 #b00000000000000000000000000000000)))

(declare-fun lt!630204 () Unit!48398)

(assert (=> b!1431533 (= lt!630204 lt!630202)))

(declare-fun res!965398 () Bool)

(assert (=> b!1431533 (= res!965398 (= (seekEntryOrOpen!0 (select (arr!47047 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11326 #b00000000000000000000000000000000)))))

