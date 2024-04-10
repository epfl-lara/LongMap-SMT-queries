; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123168 () Bool)

(assert start!123168)

(declare-fun b!1428282 () Bool)

(declare-fun res!963112 () Bool)

(declare-fun e!806624 () Bool)

(assert (=> b!1428282 (=> (not res!963112) (not e!806624))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97380 0))(
  ( (array!97381 (arr!47003 (Array (_ BitVec 32) (_ BitVec 64))) (size!47553 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97380)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428282 (= res!963112 (and (= (size!47553 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47553 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47553 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428283 () Bool)

(declare-fun res!963114 () Bool)

(assert (=> b!1428283 (=> (not res!963114) (not e!806624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428283 (= res!963114 (validKeyInArray!0 (select (arr!47003 a!2831) j!81)))))

(declare-fun b!1428284 () Bool)

(declare-fun e!806625 () Bool)

(declare-fun e!806623 () Bool)

(assert (=> b!1428284 (= e!806625 e!806623)))

(declare-fun res!963115 () Bool)

(assert (=> b!1428284 (=> (not res!963115) (not e!806623))))

(declare-datatypes ((SeekEntryResult!11282 0))(
  ( (MissingZero!11282 (index!47520 (_ BitVec 32))) (Found!11282 (index!47521 (_ BitVec 32))) (Intermediate!11282 (undefined!12094 Bool) (index!47522 (_ BitVec 32)) (x!129158 (_ BitVec 32))) (Undefined!11282) (MissingVacant!11282 (index!47523 (_ BitVec 32))) )
))
(declare-fun lt!628910 () SeekEntryResult!11282)

(declare-fun lt!628907 () array!97380)

(declare-fun lt!628908 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97380 (_ BitVec 32)) SeekEntryResult!11282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428284 (= res!963115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628908 mask!2608) lt!628908 lt!628907 mask!2608) lt!628910))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428284 (= lt!628910 (Intermediate!11282 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428284 (= lt!628908 (select (store (arr!47003 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428284 (= lt!628907 (array!97381 (store (arr!47003 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47553 a!2831)))))

(declare-fun b!1428285 () Bool)

(declare-fun res!963119 () Bool)

(assert (=> b!1428285 (=> (not res!963119) (not e!806624))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428285 (= res!963119 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47553 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47553 a!2831))))))

(declare-fun b!1428286 () Bool)

(declare-fun res!963121 () Bool)

(assert (=> b!1428286 (=> (not res!963121) (not e!806624))))

(declare-datatypes ((List!33513 0))(
  ( (Nil!33510) (Cons!33509 (h!34820 (_ BitVec 64)) (t!48207 List!33513)) )
))
(declare-fun arrayNoDuplicates!0 (array!97380 (_ BitVec 32) List!33513) Bool)

(assert (=> b!1428286 (= res!963121 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33510))))

(declare-fun b!1428287 () Bool)

(declare-fun res!963124 () Bool)

(assert (=> b!1428287 (=> (not res!963124) (not e!806624))))

(assert (=> b!1428287 (= res!963124 (validKeyInArray!0 (select (arr!47003 a!2831) i!982)))))

(declare-fun b!1428288 () Bool)

(assert (=> b!1428288 (= e!806623 (not (or (= (select (arr!47003 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47003 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!47003 a!2831) index!585) (select (arr!47003 a!2831) j!81))))))))

(declare-fun e!806626 () Bool)

(assert (=> b!1428288 e!806626))

(declare-fun res!963116 () Bool)

(assert (=> b!1428288 (=> (not res!963116) (not e!806626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97380 (_ BitVec 32)) Bool)

(assert (=> b!1428288 (= res!963116 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48310 0))(
  ( (Unit!48311) )
))
(declare-fun lt!628909 () Unit!48310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48310)

(assert (=> b!1428288 (= lt!628909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428289 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97380 (_ BitVec 32)) SeekEntryResult!11282)

(assert (=> b!1428289 (= e!806626 (= (seekEntryOrOpen!0 (select (arr!47003 a!2831) j!81) a!2831 mask!2608) (Found!11282 j!81)))))

(declare-fun b!1428291 () Bool)

(declare-fun res!963118 () Bool)

(assert (=> b!1428291 (=> (not res!963118) (not e!806623))))

(assert (=> b!1428291 (= res!963118 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628908 lt!628907 mask!2608) lt!628910))))

(declare-fun b!1428292 () Bool)

(assert (=> b!1428292 (= e!806624 e!806625)))

(declare-fun res!963117 () Bool)

(assert (=> b!1428292 (=> (not res!963117) (not e!806625))))

(declare-fun lt!628911 () SeekEntryResult!11282)

(assert (=> b!1428292 (= res!963117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) (select (arr!47003 a!2831) j!81) a!2831 mask!2608) lt!628911))))

(assert (=> b!1428292 (= lt!628911 (Intermediate!11282 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428293 () Bool)

(declare-fun res!963123 () Bool)

(assert (=> b!1428293 (=> (not res!963123) (not e!806624))))

(assert (=> b!1428293 (= res!963123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428294 () Bool)

(declare-fun res!963120 () Bool)

(assert (=> b!1428294 (=> (not res!963120) (not e!806623))))

(assert (=> b!1428294 (= res!963120 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47003 a!2831) j!81) a!2831 mask!2608) lt!628911))))

(declare-fun res!963122 () Bool)

(assert (=> start!123168 (=> (not res!963122) (not e!806624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123168 (= res!963122 (validMask!0 mask!2608))))

(assert (=> start!123168 e!806624))

(assert (=> start!123168 true))

(declare-fun array_inv!36031 (array!97380) Bool)

(assert (=> start!123168 (array_inv!36031 a!2831)))

(declare-fun b!1428290 () Bool)

(declare-fun res!963113 () Bool)

(assert (=> b!1428290 (=> (not res!963113) (not e!806623))))

(assert (=> b!1428290 (= res!963113 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123168 res!963122) b!1428282))

(assert (= (and b!1428282 res!963112) b!1428287))

(assert (= (and b!1428287 res!963124) b!1428283))

(assert (= (and b!1428283 res!963114) b!1428293))

(assert (= (and b!1428293 res!963123) b!1428286))

(assert (= (and b!1428286 res!963121) b!1428285))

(assert (= (and b!1428285 res!963119) b!1428292))

(assert (= (and b!1428292 res!963117) b!1428284))

(assert (= (and b!1428284 res!963115) b!1428294))

(assert (= (and b!1428294 res!963120) b!1428291))

(assert (= (and b!1428291 res!963118) b!1428290))

(assert (= (and b!1428290 res!963113) b!1428288))

(assert (= (and b!1428288 res!963116) b!1428289))

(declare-fun m!1318521 () Bool)

(assert (=> b!1428294 m!1318521))

(assert (=> b!1428294 m!1318521))

(declare-fun m!1318523 () Bool)

(assert (=> b!1428294 m!1318523))

(declare-fun m!1318525 () Bool)

(assert (=> b!1428286 m!1318525))

(assert (=> b!1428283 m!1318521))

(assert (=> b!1428283 m!1318521))

(declare-fun m!1318527 () Bool)

(assert (=> b!1428283 m!1318527))

(declare-fun m!1318529 () Bool)

(assert (=> b!1428293 m!1318529))

(declare-fun m!1318531 () Bool)

(assert (=> b!1428288 m!1318531))

(assert (=> b!1428288 m!1318521))

(declare-fun m!1318533 () Bool)

(assert (=> b!1428288 m!1318533))

(declare-fun m!1318535 () Bool)

(assert (=> b!1428288 m!1318535))

(declare-fun m!1318537 () Bool)

(assert (=> b!1428284 m!1318537))

(assert (=> b!1428284 m!1318537))

(declare-fun m!1318539 () Bool)

(assert (=> b!1428284 m!1318539))

(declare-fun m!1318541 () Bool)

(assert (=> b!1428284 m!1318541))

(declare-fun m!1318543 () Bool)

(assert (=> b!1428284 m!1318543))

(assert (=> b!1428292 m!1318521))

(assert (=> b!1428292 m!1318521))

(declare-fun m!1318545 () Bool)

(assert (=> b!1428292 m!1318545))

(assert (=> b!1428292 m!1318545))

(assert (=> b!1428292 m!1318521))

(declare-fun m!1318547 () Bool)

(assert (=> b!1428292 m!1318547))

(assert (=> b!1428289 m!1318521))

(assert (=> b!1428289 m!1318521))

(declare-fun m!1318549 () Bool)

(assert (=> b!1428289 m!1318549))

(declare-fun m!1318551 () Bool)

(assert (=> b!1428291 m!1318551))

(declare-fun m!1318553 () Bool)

(assert (=> b!1428287 m!1318553))

(assert (=> b!1428287 m!1318553))

(declare-fun m!1318555 () Bool)

(assert (=> b!1428287 m!1318555))

(declare-fun m!1318557 () Bool)

(assert (=> start!123168 m!1318557))

(declare-fun m!1318559 () Bool)

(assert (=> start!123168 m!1318559))

(push 1)

(assert (not b!1428294))

(assert (not b!1428291))

(assert (not start!123168))

(assert (not b!1428292))

(assert (not b!1428283))

(assert (not b!1428288))

(assert (not b!1428289))

(assert (not b!1428284))

(assert (not b!1428293))

(assert (not b!1428286))

(assert (not b!1428287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153465 () Bool)

(assert (=> d!153465 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123168 d!153465))

(declare-fun d!153473 () Bool)

(assert (=> d!153473 (= (array_inv!36031 a!2831) (bvsge (size!47553 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123168 d!153473))

(declare-fun d!153475 () Bool)

(assert (=> d!153475 (= (validKeyInArray!0 (select (arr!47003 a!2831) i!982)) (and (not (= (select (arr!47003 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47003 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428287 d!153475))

(declare-fun b!1428447 () Bool)

(declare-fun e!806705 () Bool)

(declare-fun e!806704 () Bool)

(assert (=> b!1428447 (= e!806705 e!806704)))

(declare-fun c!132099 () Bool)

(assert (=> b!1428447 (= c!132099 (validKeyInArray!0 (select (arr!47003 a!2831) j!81)))))

(declare-fun b!1428448 () Bool)

(declare-fun e!806703 () Bool)

(declare-fun call!67390 () Bool)

(assert (=> b!1428448 (= e!806703 call!67390)))

(declare-fun b!1428449 () Bool)

(assert (=> b!1428449 (= e!806704 e!806703)))

(declare-fun lt!628971 () (_ BitVec 64))

(assert (=> b!1428449 (= lt!628971 (select (arr!47003 a!2831) j!81))))

(declare-fun lt!628969 () Unit!48310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97380 (_ BitVec 64) (_ BitVec 32)) Unit!48310)

(assert (=> b!1428449 (= lt!628969 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628971 j!81))))

(declare-fun arrayContainsKey!0 (array!97380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1428449 (arrayContainsKey!0 a!2831 lt!628971 #b00000000000000000000000000000000)))

(declare-fun lt!628970 () Unit!48310)

(assert (=> b!1428449 (= lt!628970 lt!628969)))

(declare-fun res!963232 () Bool)

(assert (=> b!1428449 (= res!963232 (= (seekEntryOrOpen!0 (select (arr!47003 a!2831) j!81) a!2831 mask!2608) (Found!11282 j!81)))))

(assert (=> b!1428449 (=> (not res!963232) (not e!806703))))

(declare-fun d!153477 () Bool)

(declare-fun res!963231 () Bool)

(assert (=> d!153477 (=> res!963231 e!806705)))

(assert (=> d!153477 (= res!963231 (bvsge j!81 (size!47553 a!2831)))))

(assert (=> d!153477 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806705)))

(declare-fun b!1428450 () Bool)

(assert (=> b!1428450 (= e!806704 call!67390)))

(declare-fun bm!67387 () Bool)

(assert (=> bm!67387 (= call!67390 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153477 (not res!963231)) b!1428447))

(assert (= (and b!1428447 c!132099) b!1428449))

(assert (= (and b!1428447 (not c!132099)) b!1428450))

(assert (= (and b!1428449 res!963232) b!1428448))

(assert (= (or b!1428448 b!1428450) bm!67387))

(assert (=> b!1428447 m!1318521))

(assert (=> b!1428447 m!1318521))

(assert (=> b!1428447 m!1318527))

(assert (=> b!1428449 m!1318521))

(declare-fun m!1318665 () Bool)

(assert (=> b!1428449 m!1318665))

(declare-fun m!1318667 () Bool)

(assert (=> b!1428449 m!1318667))

(assert (=> b!1428449 m!1318521))

(assert (=> b!1428449 m!1318549))

(declare-fun m!1318669 () Bool)

(assert (=> bm!67387 m!1318669))

(assert (=> b!1428288 d!153477))

(declare-fun d!153483 () Bool)

(assert (=> d!153483 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628978 () Unit!48310)

(declare-fun choose!38 (array!97380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48310)

(assert (=> d!153483 (= lt!628978 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153483 (validMask!0 mask!2608)))

(assert (=> d!153483 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628978)))

(declare-fun bs!41624 () Bool)

(assert (= bs!41624 d!153483))

(assert (=> bs!41624 m!1318533))

(declare-fun m!1318683 () Bool)

(assert (=> bs!41624 m!1318683))

(assert (=> bs!41624 m!1318557))

(assert (=> b!1428288 d!153483))

(declare-fun b!1428469 () Bool)

(declare-fun e!806718 () Bool)

(declare-fun e!806717 () Bool)

(assert (=> b!1428469 (= e!806718 e!806717)))

(declare-fun c!132106 () Bool)

(assert (=> b!1428469 (= c!132106 (validKeyInArray!0 (select (arr!47003 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428470 () Bool)

(declare-fun e!806716 () Bool)

(declare-fun call!67391 () Bool)

(assert (=> b!1428470 (= e!806716 call!67391)))

(declare-fun b!1428471 () Bool)

(assert (=> b!1428471 (= e!806717 e!806716)))

(declare-fun lt!628981 () (_ BitVec 64))

(assert (=> b!1428471 (= lt!628981 (select (arr!47003 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628979 () Unit!48310)

(assert (=> b!1428471 (= lt!628979 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628981 #b00000000000000000000000000000000))))

(assert (=> b!1428471 (arrayContainsKey!0 a!2831 lt!628981 #b00000000000000000000000000000000)))

(declare-fun lt!628980 () Unit!48310)

(assert (=> b!1428471 (= lt!628980 lt!628979)))

(declare-fun res!963240 () Bool)

(assert (=> b!1428471 (= res!963240 (= (seekEntryOrOpen!0 (select (arr!47003 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11282 #b00000000000000000000000000000000)))))

(assert (=> b!1428471 (=> (not res!963240) (not e!806716))))

(declare-fun d!153489 () Bool)

(declare-fun res!963239 () Bool)

(assert (=> d!153489 (=> res!963239 e!806718)))

(assert (=> d!153489 (= res!963239 (bvsge #b00000000000000000000000000000000 (size!47553 a!2831)))))

(assert (=> d!153489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806718)))

(declare-fun b!1428472 () Bool)

(assert (=> b!1428472 (= e!806717 call!67391)))

(declare-fun bm!67388 () Bool)

(assert (=> bm!67388 (= call!67391 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153489 (not res!963239)) b!1428469))

(assert (= (and b!1428469 c!132106) b!1428471))

(assert (= (and b!1428469 (not c!132106)) b!1428472))

(assert (= (and b!1428471 res!963240) b!1428470))

(assert (= (or b!1428470 b!1428472) bm!67388))

(declare-fun m!1318685 () Bool)

(assert (=> b!1428469 m!1318685))

(assert (=> b!1428469 m!1318685))

(declare-fun m!1318687 () Bool)

(assert (=> b!1428469 m!1318687))

(assert (=> b!1428471 m!1318685))

(declare-fun m!1318689 () Bool)

(assert (=> b!1428471 m!1318689))

(declare-fun m!1318691 () Bool)

(assert (=> b!1428471 m!1318691))

(assert (=> b!1428471 m!1318685))

(declare-fun m!1318693 () Bool)

(assert (=> b!1428471 m!1318693))

(declare-fun m!1318695 () Bool)

(assert (=> bm!67388 m!1318695))

(assert (=> b!1428293 d!153489))

(declare-fun d!153491 () Bool)

(declare-fun res!963257 () Bool)

(declare-fun e!806747 () Bool)

(assert (=> d!153491 (=> res!963257 e!806747)))

(assert (=> d!153491 (= res!963257 (bvsge #b00000000000000000000000000000000 (size!47553 a!2831)))))

(assert (=> d!153491 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33510) e!806747)))

(declare-fun b!1428510 () Bool)

(declare-fun e!806745 () Bool)

(declare-fun call!67397 () Bool)

(assert (=> b!1428510 (= e!806745 call!67397)))

(declare-fun b!1428511 () Bool)

(declare-fun e!806746 () Bool)

(assert (=> b!1428511 (= e!806747 e!806746)))

(declare-fun res!963258 () Bool)

(assert (=> b!1428511 (=> (not res!963258) (not e!806746))))

(declare-fun e!806748 () Bool)

(assert (=> b!1428511 (= res!963258 (not e!806748))))

(declare-fun res!963256 () Bool)

(assert (=> b!1428511 (=> (not res!963256) (not e!806748))))

(assert (=> b!1428511 (= res!963256 (validKeyInArray!0 (select (arr!47003 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428512 () Bool)

(assert (=> b!1428512 (= e!806745 call!67397)))

(declare-fun b!1428513 () Bool)

(declare-fun contains!9856 (List!33513 (_ BitVec 64)) Bool)

(assert (=> b!1428513 (= e!806748 (contains!9856 Nil!33510 (select (arr!47003 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67394 () Bool)

(declare-fun c!132118 () Bool)

(assert (=> bm!67394 (= call!67397 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132118 (Cons!33509 (select (arr!47003 a!2831) #b00000000000000000000000000000000) Nil!33510) Nil!33510)))))

(declare-fun b!1428514 () Bool)

(assert (=> b!1428514 (= e!806746 e!806745)))

(assert (=> b!1428514 (= c!132118 (validKeyInArray!0 (select (arr!47003 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153491 (not res!963257)) b!1428511))

(assert (= (and b!1428511 res!963256) b!1428513))

(assert (= (and b!1428511 res!963258) b!1428514))

(assert (= (and b!1428514 c!132118) b!1428510))

(assert (= (and b!1428514 (not c!132118)) b!1428512))

(assert (= (or b!1428510 b!1428512) bm!67394))

(assert (=> b!1428511 m!1318685))

(assert (=> b!1428511 m!1318685))

(assert (=> b!1428511 m!1318687))

(assert (=> b!1428513 m!1318685))

(assert (=> b!1428513 m!1318685))

(declare-fun m!1318705 () Bool)

(assert (=> b!1428513 m!1318705))

(assert (=> bm!67394 m!1318685))

(declare-fun m!1318707 () Bool)

(assert (=> bm!67394 m!1318707))

(assert (=> b!1428514 m!1318685))

(assert (=> b!1428514 m!1318685))

(assert (=> b!1428514 m!1318687))

(assert (=> b!1428286 d!153491))

(declare-fun b!1428601 () Bool)

(declare-fun e!806806 () SeekEntryResult!11282)

(assert (=> b!1428601 (= e!806806 (Intermediate!11282 false index!585 x!605))))

(declare-fun b!1428602 () Bool)

(declare-fun e!806805 () Bool)

(declare-fun e!806807 () Bool)

(assert (=> b!1428602 (= e!806805 e!806807)))

(declare-fun res!963297 () Bool)

(declare-fun lt!629035 () SeekEntryResult!11282)

(assert (=> b!1428602 (= res!963297 (and (is-Intermediate!11282 lt!629035) (not (undefined!12094 lt!629035)) (bvslt (x!129158 lt!629035) #b01111111111111111111111111111110) (bvsge (x!129158 lt!629035) #b00000000000000000000000000000000) (bvsge (x!129158 lt!629035) x!605)))))

(assert (=> b!1428602 (=> (not res!963297) (not e!806807))))

(declare-fun b!1428603 () Bool)

(assert (=> b!1428603 (= e!806805 (bvsge (x!129158 lt!629035) #b01111111111111111111111111111110))))

(declare-fun b!1428604 () Bool)

(declare-fun e!806804 () SeekEntryResult!11282)

(assert (=> b!1428604 (= e!806804 (Intermediate!11282 true index!585 x!605))))

(declare-fun b!1428605 () Bool)

(assert (=> b!1428605 (= e!806804 e!806806)))

(declare-fun c!132147 () Bool)

(declare-fun lt!629034 () (_ BitVec 64))

(assert (=> b!1428605 (= c!132147 (or (= lt!629034 lt!628908) (= (bvadd lt!629034 lt!629034) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153495 () Bool)

(assert (=> d!153495 e!806805))

(declare-fun c!132145 () Bool)

(assert (=> d!153495 (= c!132145 (and (is-Intermediate!11282 lt!629035) (undefined!12094 lt!629035)))))

(assert (=> d!153495 (= lt!629035 e!806804)))

(declare-fun c!132146 () Bool)

(assert (=> d!153495 (= c!132146 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153495 (= lt!629034 (select (arr!47003 lt!628907) index!585))))

(assert (=> d!153495 (validMask!0 mask!2608)))

(assert (=> d!153495 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628908 lt!628907 mask!2608) lt!629035)))

(declare-fun b!1428606 () Bool)

(assert (=> b!1428606 (and (bvsge (index!47522 lt!629035) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629035) (size!47553 lt!628907)))))

(declare-fun res!963295 () Bool)

(assert (=> b!1428606 (= res!963295 (= (select (arr!47003 lt!628907) (index!47522 lt!629035)) lt!628908))))

(declare-fun e!806808 () Bool)

(assert (=> b!1428606 (=> res!963295 e!806808)))

(assert (=> b!1428606 (= e!806807 e!806808)))

(declare-fun b!1428607 () Bool)

(assert (=> b!1428607 (and (bvsge (index!47522 lt!629035) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629035) (size!47553 lt!628907)))))

(declare-fun res!963296 () Bool)

(assert (=> b!1428607 (= res!963296 (= (select (arr!47003 lt!628907) (index!47522 lt!629035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428607 (=> res!963296 e!806808)))

(declare-fun b!1428608 () Bool)

(assert (=> b!1428608 (and (bvsge (index!47522 lt!629035) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629035) (size!47553 lt!628907)))))

(assert (=> b!1428608 (= e!806808 (= (select (arr!47003 lt!628907) (index!47522 lt!629035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428609 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428609 (= e!806806 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628908 lt!628907 mask!2608))))

(assert (= (and d!153495 c!132146) b!1428604))

(assert (= (and d!153495 (not c!132146)) b!1428605))

(assert (= (and b!1428605 c!132147) b!1428601))

(assert (= (and b!1428605 (not c!132147)) b!1428609))

(assert (= (and d!153495 c!132145) b!1428603))

(assert (= (and d!153495 (not c!132145)) b!1428602))

(assert (= (and b!1428602 res!963297) b!1428606))

(assert (= (and b!1428606 (not res!963295)) b!1428607))

(assert (= (and b!1428607 (not res!963296)) b!1428608))

(declare-fun m!1318771 () Bool)

(assert (=> b!1428606 m!1318771))

(declare-fun m!1318773 () Bool)

(assert (=> d!153495 m!1318773))

(assert (=> d!153495 m!1318557))

(declare-fun m!1318775 () Bool)

(assert (=> b!1428609 m!1318775))

(assert (=> b!1428609 m!1318775))

(declare-fun m!1318777 () Bool)

(assert (=> b!1428609 m!1318777))

(assert (=> b!1428607 m!1318771))

(assert (=> b!1428608 m!1318771))

(assert (=> b!1428291 d!153495))

(declare-fun b!1428610 () Bool)

(declare-fun e!806811 () SeekEntryResult!11282)

(assert (=> b!1428610 (= e!806811 (Intermediate!11282 false (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428611 () Bool)

(declare-fun e!806810 () Bool)

(declare-fun e!806812 () Bool)

(assert (=> b!1428611 (= e!806810 e!806812)))

(declare-fun res!963300 () Bool)

(declare-fun lt!629039 () SeekEntryResult!11282)

(assert (=> b!1428611 (= res!963300 (and (is-Intermediate!11282 lt!629039) (not (undefined!12094 lt!629039)) (bvslt (x!129158 lt!629039) #b01111111111111111111111111111110) (bvsge (x!129158 lt!629039) #b00000000000000000000000000000000) (bvsge (x!129158 lt!629039) #b00000000000000000000000000000000)))))

(assert (=> b!1428611 (=> (not res!963300) (not e!806812))))

(declare-fun b!1428612 () Bool)

(assert (=> b!1428612 (= e!806810 (bvsge (x!129158 lt!629039) #b01111111111111111111111111111110))))

(declare-fun e!806809 () SeekEntryResult!11282)

(declare-fun b!1428613 () Bool)

(assert (=> b!1428613 (= e!806809 (Intermediate!11282 true (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428614 () Bool)

(assert (=> b!1428614 (= e!806809 e!806811)))

(declare-fun lt!629038 () (_ BitVec 64))

(declare-fun c!132150 () Bool)

(assert (=> b!1428614 (= c!132150 (or (= lt!629038 (select (arr!47003 a!2831) j!81)) (= (bvadd lt!629038 lt!629038) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153523 () Bool)

(assert (=> d!153523 e!806810))

(declare-fun c!132148 () Bool)

(assert (=> d!153523 (= c!132148 (and (is-Intermediate!11282 lt!629039) (undefined!12094 lt!629039)))))

(assert (=> d!153523 (= lt!629039 e!806809)))

(declare-fun c!132149 () Bool)

(assert (=> d!153523 (= c!132149 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153523 (= lt!629038 (select (arr!47003 a!2831) (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608)))))

(assert (=> d!153523 (validMask!0 mask!2608)))

(assert (=> d!153523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) (select (arr!47003 a!2831) j!81) a!2831 mask!2608) lt!629039)))

(declare-fun b!1428615 () Bool)

(assert (=> b!1428615 (and (bvsge (index!47522 lt!629039) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629039) (size!47553 a!2831)))))

(declare-fun res!963298 () Bool)

(assert (=> b!1428615 (= res!963298 (= (select (arr!47003 a!2831) (index!47522 lt!629039)) (select (arr!47003 a!2831) j!81)))))

(declare-fun e!806813 () Bool)

(assert (=> b!1428615 (=> res!963298 e!806813)))

(assert (=> b!1428615 (= e!806812 e!806813)))

(declare-fun b!1428616 () Bool)

(assert (=> b!1428616 (and (bvsge (index!47522 lt!629039) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629039) (size!47553 a!2831)))))

(declare-fun res!963299 () Bool)

(assert (=> b!1428616 (= res!963299 (= (select (arr!47003 a!2831) (index!47522 lt!629039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428616 (=> res!963299 e!806813)))

(declare-fun b!1428617 () Bool)

(assert (=> b!1428617 (and (bvsge (index!47522 lt!629039) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629039) (size!47553 a!2831)))))

(assert (=> b!1428617 (= e!806813 (= (select (arr!47003 a!2831) (index!47522 lt!629039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428618 () Bool)

(assert (=> b!1428618 (= e!806811 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47003 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153523 c!132149) b!1428613))

(assert (= (and d!153523 (not c!132149)) b!1428614))

(assert (= (and b!1428614 c!132150) b!1428610))

(assert (= (and b!1428614 (not c!132150)) b!1428618))

(assert (= (and d!153523 c!132148) b!1428612))

(assert (= (and d!153523 (not c!132148)) b!1428611))

(assert (= (and b!1428611 res!963300) b!1428615))

(assert (= (and b!1428615 (not res!963298)) b!1428616))

(assert (= (and b!1428616 (not res!963299)) b!1428617))

(declare-fun m!1318779 () Bool)

(assert (=> b!1428615 m!1318779))

(assert (=> d!153523 m!1318545))

(declare-fun m!1318781 () Bool)

(assert (=> d!153523 m!1318781))

(assert (=> d!153523 m!1318557))

(assert (=> b!1428618 m!1318545))

(declare-fun m!1318783 () Bool)

(assert (=> b!1428618 m!1318783))

(assert (=> b!1428618 m!1318783))

(assert (=> b!1428618 m!1318521))

(declare-fun m!1318785 () Bool)

(assert (=> b!1428618 m!1318785))

(assert (=> b!1428616 m!1318779))

(assert (=> b!1428617 m!1318779))

(assert (=> b!1428292 d!153523))

(declare-fun d!153525 () Bool)

(declare-fun lt!629045 () (_ BitVec 32))

(declare-fun lt!629044 () (_ BitVec 32))

(assert (=> d!153525 (= lt!629045 (bvmul (bvxor lt!629044 (bvlshr lt!629044 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153525 (= lt!629044 ((_ extract 31 0) (bvand (bvxor (select (arr!47003 a!2831) j!81) (bvlshr (select (arr!47003 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153525 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963301 (let ((h!34825 ((_ extract 31 0) (bvand (bvxor (select (arr!47003 a!2831) j!81) (bvlshr (select (arr!47003 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129166 (bvmul (bvxor h!34825 (bvlshr h!34825 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129166 (bvlshr x!129166 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963301 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963301 #b00000000000000000000000000000000))))))

(assert (=> d!153525 (= (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) (bvand (bvxor lt!629045 (bvlshr lt!629045 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428292 d!153525))

(declare-fun b!1428619 () Bool)

(declare-fun e!806816 () SeekEntryResult!11282)

(assert (=> b!1428619 (= e!806816 (Intermediate!11282 false index!585 x!605))))

(declare-fun b!1428620 () Bool)

(declare-fun e!806815 () Bool)

(declare-fun e!806817 () Bool)

(assert (=> b!1428620 (= e!806815 e!806817)))

(declare-fun res!963304 () Bool)

(declare-fun lt!629047 () SeekEntryResult!11282)

(assert (=> b!1428620 (= res!963304 (and (is-Intermediate!11282 lt!629047) (not (undefined!12094 lt!629047)) (bvslt (x!129158 lt!629047) #b01111111111111111111111111111110) (bvsge (x!129158 lt!629047) #b00000000000000000000000000000000) (bvsge (x!129158 lt!629047) x!605)))))

(assert (=> b!1428620 (=> (not res!963304) (not e!806817))))

(declare-fun b!1428621 () Bool)

(assert (=> b!1428621 (= e!806815 (bvsge (x!129158 lt!629047) #b01111111111111111111111111111110))))

(declare-fun b!1428622 () Bool)

(declare-fun e!806814 () SeekEntryResult!11282)

(assert (=> b!1428622 (= e!806814 (Intermediate!11282 true index!585 x!605))))

(declare-fun b!1428623 () Bool)

(assert (=> b!1428623 (= e!806814 e!806816)))

(declare-fun c!132153 () Bool)

(declare-fun lt!629046 () (_ BitVec 64))

(assert (=> b!1428623 (= c!132153 (or (= lt!629046 (select (arr!47003 a!2831) j!81)) (= (bvadd lt!629046 lt!629046) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153527 () Bool)

(assert (=> d!153527 e!806815))

(declare-fun c!132151 () Bool)

(assert (=> d!153527 (= c!132151 (and (is-Intermediate!11282 lt!629047) (undefined!12094 lt!629047)))))

(assert (=> d!153527 (= lt!629047 e!806814)))

(declare-fun c!132152 () Bool)

(assert (=> d!153527 (= c!132152 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153527 (= lt!629046 (select (arr!47003 a!2831) index!585))))

(assert (=> d!153527 (validMask!0 mask!2608)))

(assert (=> d!153527 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47003 a!2831) j!81) a!2831 mask!2608) lt!629047)))

(declare-fun b!1428624 () Bool)

(assert (=> b!1428624 (and (bvsge (index!47522 lt!629047) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629047) (size!47553 a!2831)))))

(declare-fun res!963302 () Bool)

(assert (=> b!1428624 (= res!963302 (= (select (arr!47003 a!2831) (index!47522 lt!629047)) (select (arr!47003 a!2831) j!81)))))

(declare-fun e!806818 () Bool)

(assert (=> b!1428624 (=> res!963302 e!806818)))

(assert (=> b!1428624 (= e!806817 e!806818)))

(declare-fun b!1428625 () Bool)

(assert (=> b!1428625 (and (bvsge (index!47522 lt!629047) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629047) (size!47553 a!2831)))))

(declare-fun res!963303 () Bool)

(assert (=> b!1428625 (= res!963303 (= (select (arr!47003 a!2831) (index!47522 lt!629047)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428625 (=> res!963303 e!806818)))

(declare-fun b!1428626 () Bool)

(assert (=> b!1428626 (and (bvsge (index!47522 lt!629047) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629047) (size!47553 a!2831)))))

(assert (=> b!1428626 (= e!806818 (= (select (arr!47003 a!2831) (index!47522 lt!629047)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428627 () Bool)

(assert (=> b!1428627 (= e!806816 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47003 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153527 c!132152) b!1428622))

(assert (= (and d!153527 (not c!132152)) b!1428623))

(assert (= (and b!1428623 c!132153) b!1428619))

(assert (= (and b!1428623 (not c!132153)) b!1428627))

(assert (= (and d!153527 c!132151) b!1428621))

(assert (= (and d!153527 (not c!132151)) b!1428620))

(assert (= (and b!1428620 res!963304) b!1428624))

(assert (= (and b!1428624 (not res!963302)) b!1428625))

(assert (= (and b!1428625 (not res!963303)) b!1428626))

(declare-fun m!1318787 () Bool)

(assert (=> b!1428624 m!1318787))

(assert (=> d!153527 m!1318531))

(assert (=> d!153527 m!1318557))

(assert (=> b!1428627 m!1318775))

(assert (=> b!1428627 m!1318775))

(assert (=> b!1428627 m!1318521))

(declare-fun m!1318789 () Bool)

(assert (=> b!1428627 m!1318789))

(assert (=> b!1428625 m!1318787))

(assert (=> b!1428626 m!1318787))

(assert (=> b!1428294 d!153527))

(declare-fun d!153529 () Bool)

(assert (=> d!153529 (= (validKeyInArray!0 (select (arr!47003 a!2831) j!81)) (and (not (= (select (arr!47003 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47003 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428283 d!153529))

(declare-fun b!1428628 () Bool)

(declare-fun e!806821 () SeekEntryResult!11282)

(assert (=> b!1428628 (= e!806821 (Intermediate!11282 false (toIndex!0 lt!628908 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428629 () Bool)

(declare-fun e!806820 () Bool)

(declare-fun e!806822 () Bool)

(assert (=> b!1428629 (= e!806820 e!806822)))

(declare-fun res!963307 () Bool)

(declare-fun lt!629049 () SeekEntryResult!11282)

(assert (=> b!1428629 (= res!963307 (and (is-Intermediate!11282 lt!629049) (not (undefined!12094 lt!629049)) (bvslt (x!129158 lt!629049) #b01111111111111111111111111111110) (bvsge (x!129158 lt!629049) #b00000000000000000000000000000000) (bvsge (x!129158 lt!629049) #b00000000000000000000000000000000)))))

(assert (=> b!1428629 (=> (not res!963307) (not e!806822))))

(declare-fun b!1428630 () Bool)

(assert (=> b!1428630 (= e!806820 (bvsge (x!129158 lt!629049) #b01111111111111111111111111111110))))

(declare-fun b!1428631 () Bool)

(declare-fun e!806819 () SeekEntryResult!11282)

(assert (=> b!1428631 (= e!806819 (Intermediate!11282 true (toIndex!0 lt!628908 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428632 () Bool)

(assert (=> b!1428632 (= e!806819 e!806821)))

(declare-fun c!132156 () Bool)

(declare-fun lt!629048 () (_ BitVec 64))

(assert (=> b!1428632 (= c!132156 (or (= lt!629048 lt!628908) (= (bvadd lt!629048 lt!629048) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153531 () Bool)

(assert (=> d!153531 e!806820))

(declare-fun c!132154 () Bool)

(assert (=> d!153531 (= c!132154 (and (is-Intermediate!11282 lt!629049) (undefined!12094 lt!629049)))))

(assert (=> d!153531 (= lt!629049 e!806819)))

(declare-fun c!132155 () Bool)

(assert (=> d!153531 (= c!132155 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153531 (= lt!629048 (select (arr!47003 lt!628907) (toIndex!0 lt!628908 mask!2608)))))

(assert (=> d!153531 (validMask!0 mask!2608)))

(assert (=> d!153531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628908 mask!2608) lt!628908 lt!628907 mask!2608) lt!629049)))

(declare-fun b!1428633 () Bool)

(assert (=> b!1428633 (and (bvsge (index!47522 lt!629049) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629049) (size!47553 lt!628907)))))

(declare-fun res!963305 () Bool)

(assert (=> b!1428633 (= res!963305 (= (select (arr!47003 lt!628907) (index!47522 lt!629049)) lt!628908))))

(declare-fun e!806823 () Bool)

(assert (=> b!1428633 (=> res!963305 e!806823)))

(assert (=> b!1428633 (= e!806822 e!806823)))

(declare-fun b!1428634 () Bool)

(assert (=> b!1428634 (and (bvsge (index!47522 lt!629049) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629049) (size!47553 lt!628907)))))

(declare-fun res!963306 () Bool)

(assert (=> b!1428634 (= res!963306 (= (select (arr!47003 lt!628907) (index!47522 lt!629049)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428634 (=> res!963306 e!806823)))

(declare-fun b!1428635 () Bool)

(assert (=> b!1428635 (and (bvsge (index!47522 lt!629049) #b00000000000000000000000000000000) (bvslt (index!47522 lt!629049) (size!47553 lt!628907)))))

(assert (=> b!1428635 (= e!806823 (= (select (arr!47003 lt!628907) (index!47522 lt!629049)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428636 () Bool)

(assert (=> b!1428636 (= e!806821 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628908 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628908 lt!628907 mask!2608))))

(assert (= (and d!153531 c!132155) b!1428631))

(assert (= (and d!153531 (not c!132155)) b!1428632))

(assert (= (and b!1428632 c!132156) b!1428628))

(assert (= (and b!1428632 (not c!132156)) b!1428636))

(assert (= (and d!153531 c!132154) b!1428630))

(assert (= (and d!153531 (not c!132154)) b!1428629))

(assert (= (and b!1428629 res!963307) b!1428633))

(assert (= (and b!1428633 (not res!963305)) b!1428634))

(assert (= (and b!1428634 (not res!963306)) b!1428635))

(declare-fun m!1318791 () Bool)

(assert (=> b!1428633 m!1318791))

(assert (=> d!153531 m!1318537))

(declare-fun m!1318793 () Bool)

(assert (=> d!153531 m!1318793))

(assert (=> d!153531 m!1318557))

(assert (=> b!1428636 m!1318537))

(declare-fun m!1318795 () Bool)

(assert (=> b!1428636 m!1318795))

(assert (=> b!1428636 m!1318795))

(declare-fun m!1318797 () Bool)

(assert (=> b!1428636 m!1318797))

(assert (=> b!1428634 m!1318791))

(assert (=> b!1428635 m!1318791))

(assert (=> b!1428284 d!153531))

(declare-fun d!153533 () Bool)

(declare-fun lt!629051 () (_ BitVec 32))

(declare-fun lt!629050 () (_ BitVec 32))

(assert (=> d!153533 (= lt!629051 (bvmul (bvxor lt!629050 (bvlshr lt!629050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153533 (= lt!629050 ((_ extract 31 0) (bvand (bvxor lt!628908 (bvlshr lt!628908 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153533 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963301 (let ((h!34825 ((_ extract 31 0) (bvand (bvxor lt!628908 (bvlshr lt!628908 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129166 (bvmul (bvxor h!34825 (bvlshr h!34825 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129166 (bvlshr x!129166 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963301 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963301 #b00000000000000000000000000000000))))))

(assert (=> d!153533 (= (toIndex!0 lt!628908 mask!2608) (bvand (bvxor lt!629051 (bvlshr lt!629051 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428284 d!153533))

(declare-fun b!1428676 () Bool)

(declare-fun e!806844 () SeekEntryResult!11282)

(declare-fun lt!629071 () SeekEntryResult!11282)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97380 (_ BitVec 32)) SeekEntryResult!11282)

(assert (=> b!1428676 (= e!806844 (seekKeyOrZeroReturnVacant!0 (x!129158 lt!629071) (index!47522 lt!629071) (index!47522 lt!629071) (select (arr!47003 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428677 () Bool)

(declare-fun e!806845 () SeekEntryResult!11282)

(declare-fun e!806846 () SeekEntryResult!11282)

(assert (=> b!1428677 (= e!806845 e!806846)))

(declare-fun lt!629072 () (_ BitVec 64))

(assert (=> b!1428677 (= lt!629072 (select (arr!47003 a!2831) (index!47522 lt!629071)))))

(declare-fun c!132177 () Bool)

(assert (=> b!1428677 (= c!132177 (= lt!629072 (select (arr!47003 a!2831) j!81)))))

(declare-fun b!1428678 () Bool)

(assert (=> b!1428678 (= e!806846 (Found!11282 (index!47522 lt!629071)))))

(declare-fun b!1428679 () Bool)

(declare-fun c!132176 () Bool)

(assert (=> b!1428679 (= c!132176 (= lt!629072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428679 (= e!806846 e!806844)))

(declare-fun b!1428680 () Bool)

(assert (=> b!1428680 (= e!806844 (MissingZero!11282 (index!47522 lt!629071)))))

(declare-fun b!1428681 () Bool)

(assert (=> b!1428681 (= e!806845 Undefined!11282)))

(declare-fun d!153535 () Bool)

(declare-fun lt!629073 () SeekEntryResult!11282)

(assert (=> d!153535 (and (or (is-Undefined!11282 lt!629073) (not (is-Found!11282 lt!629073)) (and (bvsge (index!47521 lt!629073) #b00000000000000000000000000000000) (bvslt (index!47521 lt!629073) (size!47553 a!2831)))) (or (is-Undefined!11282 lt!629073) (is-Found!11282 lt!629073) (not (is-MissingZero!11282 lt!629073)) (and (bvsge (index!47520 lt!629073) #b00000000000000000000000000000000) (bvslt (index!47520 lt!629073) (size!47553 a!2831)))) (or (is-Undefined!11282 lt!629073) (is-Found!11282 lt!629073) (is-MissingZero!11282 lt!629073) (not (is-MissingVacant!11282 lt!629073)) (and (bvsge (index!47523 lt!629073) #b00000000000000000000000000000000) (bvslt (index!47523 lt!629073) (size!47553 a!2831)))) (or (is-Undefined!11282 lt!629073) (ite (is-Found!11282 lt!629073) (= (select (arr!47003 a!2831) (index!47521 lt!629073)) (select (arr!47003 a!2831) j!81)) (ite (is-MissingZero!11282 lt!629073) (= (select (arr!47003 a!2831) (index!47520 lt!629073)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11282 lt!629073) (= (select (arr!47003 a!2831) (index!47523 lt!629073)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153535 (= lt!629073 e!806845)))

(declare-fun c!132175 () Bool)

(assert (=> d!153535 (= c!132175 (and (is-Intermediate!11282 lt!629071) (undefined!12094 lt!629071)))))

(assert (=> d!153535 (= lt!629071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) (select (arr!47003 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153535 (validMask!0 mask!2608)))

(assert (=> d!153535 (= (seekEntryOrOpen!0 (select (arr!47003 a!2831) j!81) a!2831 mask!2608) lt!629073)))

(assert (= (and d!153535 c!132175) b!1428681))

(assert (= (and d!153535 (not c!132175)) b!1428677))

(assert (= (and b!1428677 c!132177) b!1428678))

(assert (= (and b!1428677 (not c!132177)) b!1428679))

(assert (= (and b!1428679 c!132176) b!1428680))

(assert (= (and b!1428679 (not c!132176)) b!1428676))

(assert (=> b!1428676 m!1318521))

(declare-fun m!1318817 () Bool)

(assert (=> b!1428676 m!1318817))

(declare-fun m!1318819 () Bool)

(assert (=> b!1428677 m!1318819))

(assert (=> d!153535 m!1318521))

(assert (=> d!153535 m!1318545))

(declare-fun m!1318821 () Bool)

(assert (=> d!153535 m!1318821))

(assert (=> d!153535 m!1318545))

(assert (=> d!153535 m!1318521))

(assert (=> d!153535 m!1318547))

(declare-fun m!1318823 () Bool)

(assert (=> d!153535 m!1318823))

(assert (=> d!153535 m!1318557))

(declare-fun m!1318825 () Bool)

(assert (=> d!153535 m!1318825))

(assert (=> b!1428289 d!153535))

(push 1)

(assert (not d!153523))

(assert (not d!153495))

(assert (not b!1428513))

(assert (not d!153535))

(assert (not b!1428618))

(assert (not b!1428449))

(assert (not b!1428447))

(assert (not b!1428609))

(assert (not d!153531))

(assert (not b!1428676))

(assert (not bm!67388))

(assert (not b!1428636))

(assert (not d!153527))

(assert (not b!1428511))

(assert (not bm!67394))

(assert (not bm!67387))

(assert (not b!1428469))

(assert (not d!153483))

(assert (not b!1428471))

(assert (not b!1428627))

(assert (not b!1428514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

