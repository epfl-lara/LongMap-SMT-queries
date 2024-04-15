; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126488 () Bool)

(assert start!126488)

(declare-fun b!1484368 () Bool)

(declare-fun res!1009348 () Bool)

(declare-fun e!832192 () Bool)

(assert (=> b!1484368 (=> (not res!1009348) (not e!832192))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99448 0))(
  ( (array!99449 (arr!48001 (Array (_ BitVec 32) (_ BitVec 64))) (size!48553 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99448)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1484368 (= res!1009348 (or (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) (select (arr!48001 a!2862) j!93))))))

(declare-fun b!1484370 () Bool)

(declare-fun res!1009355 () Bool)

(declare-fun e!832193 () Bool)

(assert (=> b!1484370 (=> (not res!1009355) (not e!832193))))

(declare-datatypes ((List!34580 0))(
  ( (Nil!34577) (Cons!34576 (h!35950 (_ BitVec 64)) (t!49266 List!34580)) )
))
(declare-fun arrayNoDuplicates!0 (array!99448 (_ BitVec 32) List!34580) Bool)

(assert (=> b!1484370 (= res!1009355 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34577))))

(declare-fun b!1484371 () Bool)

(declare-fun e!832191 () Bool)

(declare-fun e!832197 () Bool)

(assert (=> b!1484371 (= e!832191 e!832197)))

(declare-fun res!1009352 () Bool)

(assert (=> b!1484371 (=> (not res!1009352) (not e!832197))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!647559 () (_ BitVec 64))

(assert (=> b!1484371 (= res!1009352 (and (= index!646 intermediateAfterIndex!19) (= lt!647559 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1484372 () Bool)

(declare-fun lt!647555 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12266 0))(
  ( (MissingZero!12266 (index!51456 (_ BitVec 32))) (Found!12266 (index!51457 (_ BitVec 32))) (Intermediate!12266 (undefined!13078 Bool) (index!51458 (_ BitVec 32)) (x!133031 (_ BitVec 32))) (Undefined!12266) (MissingVacant!12266 (index!51459 (_ BitVec 32))) )
))
(declare-fun lt!647558 () SeekEntryResult!12266)

(declare-fun e!832195 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!647557 () array!99448)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12266)

(assert (=> b!1484372 (= e!832195 (= lt!647558 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647555 lt!647557 mask!2687)))))

(declare-fun b!1484373 () Bool)

(assert (=> b!1484373 (= e!832192 e!832191)))

(declare-fun res!1009350 () Bool)

(assert (=> b!1484373 (=> res!1009350 e!832191)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484373 (= res!1009350 (or (and (= (select (arr!48001 a!2862) index!646) lt!647559) (= (select (arr!48001 a!2862) index!646) (select (arr!48001 a!2862) j!93))) (= (select (arr!48001 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484373 (= lt!647559 (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484374 () Bool)

(declare-fun res!1009359 () Bool)

(declare-fun e!832190 () Bool)

(assert (=> b!1484374 (=> (not res!1009359) (not e!832190))))

(assert (=> b!1484374 (= res!1009359 e!832195)))

(declare-fun c!137038 () Bool)

(assert (=> b!1484374 (= c!137038 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484375 () Bool)

(declare-fun res!1009344 () Bool)

(declare-fun e!832196 () Bool)

(assert (=> b!1484375 (=> (not res!1009344) (not e!832196))))

(declare-fun lt!647556 () SeekEntryResult!12266)

(assert (=> b!1484375 (= res!1009344 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!647556))))

(declare-fun b!1484376 () Bool)

(declare-fun e!832199 () Bool)

(assert (=> b!1484376 (= e!832199 e!832196)))

(declare-fun res!1009346 () Bool)

(assert (=> b!1484376 (=> (not res!1009346) (not e!832196))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484376 (= res!1009346 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48001 a!2862) j!93) mask!2687) (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!647556))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484376 (= lt!647556 (Intermediate!12266 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484377 () Bool)

(declare-fun res!1009345 () Bool)

(assert (=> b!1484377 (=> (not res!1009345) (not e!832193))))

(assert (=> b!1484377 (= res!1009345 (and (= (size!48553 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48553 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48553 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484378 () Bool)

(declare-fun res!1009358 () Bool)

(assert (=> b!1484378 (=> (not res!1009358) (not e!832193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99448 (_ BitVec 32)) Bool)

(assert (=> b!1484378 (= res!1009358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484379 () Bool)

(declare-fun res!1009360 () Bool)

(assert (=> b!1484379 (=> (not res!1009360) (not e!832190))))

(assert (=> b!1484379 (= res!1009360 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484380 () Bool)

(declare-fun res!1009342 () Bool)

(assert (=> b!1484380 (=> (not res!1009342) (not e!832192))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12266)

(assert (=> b!1484380 (= res!1009342 (= (seekEntryOrOpen!0 (select (arr!48001 a!2862) j!93) a!2862 mask!2687) (Found!12266 j!93)))))

(declare-fun b!1484381 () Bool)

(declare-fun e!832194 () Bool)

(assert (=> b!1484381 (= e!832194 true)))

(declare-fun lt!647561 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484381 (= lt!647561 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1009354 () Bool)

(assert (=> start!126488 (=> (not res!1009354) (not e!832193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126488 (= res!1009354 (validMask!0 mask!2687))))

(assert (=> start!126488 e!832193))

(assert (=> start!126488 true))

(declare-fun array_inv!37234 (array!99448) Bool)

(assert (=> start!126488 (array_inv!37234 a!2862)))

(declare-fun b!1484369 () Bool)

(declare-fun res!1009349 () Bool)

(assert (=> b!1484369 (=> (not res!1009349) (not e!832193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484369 (= res!1009349 (validKeyInArray!0 (select (arr!48001 a!2862) i!1006)))))

(declare-fun b!1484382 () Bool)

(assert (=> b!1484382 (= e!832193 e!832199)))

(declare-fun res!1009353 () Bool)

(assert (=> b!1484382 (=> (not res!1009353) (not e!832199))))

(assert (=> b!1484382 (= res!1009353 (= (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484382 (= lt!647557 (array!99449 (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48553 a!2862)))))

(declare-fun b!1484383 () Bool)

(declare-fun res!1009357 () Bool)

(assert (=> b!1484383 (=> (not res!1009357) (not e!832193))))

(assert (=> b!1484383 (= res!1009357 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48553 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48553 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48553 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484384 () Bool)

(declare-fun res!1009343 () Bool)

(assert (=> b!1484384 (=> (not res!1009343) (not e!832193))))

(assert (=> b!1484384 (= res!1009343 (validKeyInArray!0 (select (arr!48001 a!2862) j!93)))))

(declare-fun b!1484385 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12266)

(assert (=> b!1484385 (= e!832197 (= (seekEntryOrOpen!0 lt!647555 lt!647557 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647555 lt!647557 mask!2687)))))

(declare-fun b!1484386 () Bool)

(assert (=> b!1484386 (= e!832190 (not e!832194))))

(declare-fun res!1009347 () Bool)

(assert (=> b!1484386 (=> res!1009347 e!832194)))

(assert (=> b!1484386 (= res!1009347 (or (and (= (select (arr!48001 a!2862) index!646) (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48001 a!2862) index!646) (select (arr!48001 a!2862) j!93))) (= (select (arr!48001 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484386 e!832192))

(declare-fun res!1009351 () Bool)

(assert (=> b!1484386 (=> (not res!1009351) (not e!832192))))

(assert (=> b!1484386 (= res!1009351 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49713 0))(
  ( (Unit!49714) )
))
(declare-fun lt!647560 () Unit!49713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49713)

(assert (=> b!1484386 (= lt!647560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484387 () Bool)

(assert (=> b!1484387 (= e!832196 e!832190)))

(declare-fun res!1009356 () Bool)

(assert (=> b!1484387 (=> (not res!1009356) (not e!832190))))

(assert (=> b!1484387 (= res!1009356 (= lt!647558 (Intermediate!12266 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484387 (= lt!647558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647555 mask!2687) lt!647555 lt!647557 mask!2687))))

(assert (=> b!1484387 (= lt!647555 (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484388 () Bool)

(assert (=> b!1484388 (= e!832195 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647555 lt!647557 mask!2687) (seekEntryOrOpen!0 lt!647555 lt!647557 mask!2687)))))

(assert (= (and start!126488 res!1009354) b!1484377))

(assert (= (and b!1484377 res!1009345) b!1484369))

(assert (= (and b!1484369 res!1009349) b!1484384))

(assert (= (and b!1484384 res!1009343) b!1484378))

(assert (= (and b!1484378 res!1009358) b!1484370))

(assert (= (and b!1484370 res!1009355) b!1484383))

(assert (= (and b!1484383 res!1009357) b!1484382))

(assert (= (and b!1484382 res!1009353) b!1484376))

(assert (= (and b!1484376 res!1009346) b!1484375))

(assert (= (and b!1484375 res!1009344) b!1484387))

(assert (= (and b!1484387 res!1009356) b!1484374))

(assert (= (and b!1484374 c!137038) b!1484372))

(assert (= (and b!1484374 (not c!137038)) b!1484388))

(assert (= (and b!1484374 res!1009359) b!1484379))

(assert (= (and b!1484379 res!1009360) b!1484386))

(assert (= (and b!1484386 res!1009351) b!1484380))

(assert (= (and b!1484380 res!1009342) b!1484368))

(assert (= (and b!1484368 res!1009348) b!1484373))

(assert (= (and b!1484373 (not res!1009350)) b!1484371))

(assert (= (and b!1484371 res!1009352) b!1484385))

(assert (= (and b!1484386 (not res!1009347)) b!1484381))

(declare-fun m!1369089 () Bool)

(assert (=> b!1484375 m!1369089))

(assert (=> b!1484375 m!1369089))

(declare-fun m!1369091 () Bool)

(assert (=> b!1484375 m!1369091))

(declare-fun m!1369093 () Bool)

(assert (=> b!1484381 m!1369093))

(declare-fun m!1369095 () Bool)

(assert (=> b!1484369 m!1369095))

(assert (=> b!1484369 m!1369095))

(declare-fun m!1369097 () Bool)

(assert (=> b!1484369 m!1369097))

(assert (=> b!1484384 m!1369089))

(assert (=> b!1484384 m!1369089))

(declare-fun m!1369099 () Bool)

(assert (=> b!1484384 m!1369099))

(declare-fun m!1369101 () Bool)

(assert (=> b!1484386 m!1369101))

(declare-fun m!1369103 () Bool)

(assert (=> b!1484386 m!1369103))

(declare-fun m!1369105 () Bool)

(assert (=> b!1484386 m!1369105))

(declare-fun m!1369107 () Bool)

(assert (=> b!1484386 m!1369107))

(declare-fun m!1369109 () Bool)

(assert (=> b!1484386 m!1369109))

(assert (=> b!1484386 m!1369089))

(declare-fun m!1369111 () Bool)

(assert (=> b!1484387 m!1369111))

(assert (=> b!1484387 m!1369111))

(declare-fun m!1369113 () Bool)

(assert (=> b!1484387 m!1369113))

(assert (=> b!1484387 m!1369103))

(declare-fun m!1369115 () Bool)

(assert (=> b!1484387 m!1369115))

(declare-fun m!1369117 () Bool)

(assert (=> b!1484368 m!1369117))

(assert (=> b!1484368 m!1369089))

(assert (=> b!1484376 m!1369089))

(assert (=> b!1484376 m!1369089))

(declare-fun m!1369119 () Bool)

(assert (=> b!1484376 m!1369119))

(assert (=> b!1484376 m!1369119))

(assert (=> b!1484376 m!1369089))

(declare-fun m!1369121 () Bool)

(assert (=> b!1484376 m!1369121))

(assert (=> b!1484382 m!1369103))

(declare-fun m!1369123 () Bool)

(assert (=> b!1484382 m!1369123))

(declare-fun m!1369125 () Bool)

(assert (=> start!126488 m!1369125))

(declare-fun m!1369127 () Bool)

(assert (=> start!126488 m!1369127))

(declare-fun m!1369129 () Bool)

(assert (=> b!1484370 m!1369129))

(declare-fun m!1369131 () Bool)

(assert (=> b!1484378 m!1369131))

(declare-fun m!1369133 () Bool)

(assert (=> b!1484372 m!1369133))

(assert (=> b!1484373 m!1369107))

(assert (=> b!1484373 m!1369089))

(assert (=> b!1484373 m!1369103))

(assert (=> b!1484373 m!1369105))

(assert (=> b!1484380 m!1369089))

(assert (=> b!1484380 m!1369089))

(declare-fun m!1369135 () Bool)

(assert (=> b!1484380 m!1369135))

(declare-fun m!1369137 () Bool)

(assert (=> b!1484388 m!1369137))

(declare-fun m!1369139 () Bool)

(assert (=> b!1484388 m!1369139))

(assert (=> b!1484385 m!1369139))

(assert (=> b!1484385 m!1369137))

(check-sat (not b!1484369) (not b!1484381) (not b!1484378) (not b!1484376) (not start!126488) (not b!1484385) (not b!1484384) (not b!1484388) (not b!1484387) (not b!1484372) (not b!1484375) (not b!1484370) (not b!1484386) (not b!1484380))
(check-sat)
