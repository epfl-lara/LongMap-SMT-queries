; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123530 () Bool)

(assert start!123530)

(declare-fun b!1431327 () Bool)

(declare-fun res!965072 () Bool)

(declare-fun e!808234 () Bool)

(assert (=> b!1431327 (=> (not res!965072) (not e!808234))))

(declare-datatypes ((SeekEntryResult!11270 0))(
  ( (MissingZero!11270 (index!47472 (_ BitVec 32))) (Found!11270 (index!47473 (_ BitVec 32))) (Intermediate!11270 (undefined!12082 Bool) (index!47474 (_ BitVec 32)) (x!129265 (_ BitVec 32))) (Undefined!11270) (MissingVacant!11270 (index!47475 (_ BitVec 32))) )
))
(declare-fun lt!630066 () SeekEntryResult!11270)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97562 0))(
  ( (array!97563 (arr!47089 (Array (_ BitVec 32) (_ BitVec 64))) (size!47640 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97562)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97562 (_ BitVec 32)) SeekEntryResult!11270)

(assert (=> b!1431327 (= res!965072 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!630066))))

(declare-fun b!1431328 () Bool)

(declare-fun res!965071 () Bool)

(declare-fun e!808238 () Bool)

(assert (=> b!1431328 (=> (not res!965071) (not e!808238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431328 (= res!965071 (validKeyInArray!0 (select (arr!47089 a!2831) j!81)))))

(declare-fun b!1431329 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431329 (= e!808234 (not (or (= (select (arr!47089 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47089 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47089 a!2831) index!585) (select (arr!47089 a!2831) j!81)) (not (= (select (store (arr!47089 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13))))))

(declare-fun e!808236 () Bool)

(assert (=> b!1431329 e!808236))

(declare-fun res!965074 () Bool)

(assert (=> b!1431329 (=> (not res!965074) (not e!808236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97562 (_ BitVec 32)) Bool)

(assert (=> b!1431329 (= res!965074 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48317 0))(
  ( (Unit!48318) )
))
(declare-fun lt!630068 () Unit!48317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48317)

(assert (=> b!1431329 (= lt!630068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431330 () Bool)

(declare-fun e!808237 () Bool)

(assert (=> b!1431330 (= e!808237 e!808234)))

(declare-fun res!965075 () Bool)

(assert (=> b!1431330 (=> (not res!965075) (not e!808234))))

(declare-fun lt!630067 () array!97562)

(declare-fun lt!630065 () (_ BitVec 64))

(declare-fun lt!630064 () SeekEntryResult!11270)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431330 (= res!965075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630065 mask!2608) lt!630065 lt!630067 mask!2608) lt!630064))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431330 (= lt!630064 (Intermediate!11270 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431330 (= lt!630065 (select (store (arr!47089 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431330 (= lt!630067 (array!97563 (store (arr!47089 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47640 a!2831)))))

(declare-fun b!1431331 () Bool)

(declare-fun res!965082 () Bool)

(assert (=> b!1431331 (=> (not res!965082) (not e!808234))))

(assert (=> b!1431331 (= res!965082 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630065 lt!630067 mask!2608) lt!630064))))

(declare-fun b!1431332 () Bool)

(declare-fun res!965077 () Bool)

(assert (=> b!1431332 (=> (not res!965077) (not e!808238))))

(assert (=> b!1431332 (= res!965077 (and (= (size!47640 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47640 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47640 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431333 () Bool)

(declare-fun res!965079 () Bool)

(assert (=> b!1431333 (=> (not res!965079) (not e!808234))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1431333 (= res!965079 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431334 () Bool)

(assert (=> b!1431334 (= e!808238 e!808237)))

(declare-fun res!965083 () Bool)

(assert (=> b!1431334 (=> (not res!965083) (not e!808237))))

(assert (=> b!1431334 (= res!965083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!630066))))

(assert (=> b!1431334 (= lt!630066 (Intermediate!11270 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431335 () Bool)

(declare-fun res!965081 () Bool)

(assert (=> b!1431335 (=> (not res!965081) (not e!808238))))

(declare-datatypes ((List!33586 0))(
  ( (Nil!33583) (Cons!33582 (h!34907 (_ BitVec 64)) (t!48272 List!33586)) )
))
(declare-fun arrayNoDuplicates!0 (array!97562 (_ BitVec 32) List!33586) Bool)

(assert (=> b!1431335 (= res!965081 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33583))))

(declare-fun b!1431336 () Bool)

(declare-fun res!965076 () Bool)

(assert (=> b!1431336 (=> (not res!965076) (not e!808238))))

(assert (=> b!1431336 (= res!965076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!965073 () Bool)

(assert (=> start!123530 (=> (not res!965073) (not e!808238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123530 (= res!965073 (validMask!0 mask!2608))))

(assert (=> start!123530 e!808238))

(assert (=> start!123530 true))

(declare-fun array_inv!36370 (array!97562) Bool)

(assert (=> start!123530 (array_inv!36370 a!2831)))

(declare-fun b!1431337 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97562 (_ BitVec 32)) SeekEntryResult!11270)

(assert (=> b!1431337 (= e!808236 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) (Found!11270 j!81)))))

(declare-fun b!1431338 () Bool)

(declare-fun res!965080 () Bool)

(assert (=> b!1431338 (=> (not res!965080) (not e!808238))))

(assert (=> b!1431338 (= res!965080 (validKeyInArray!0 (select (arr!47089 a!2831) i!982)))))

(declare-fun b!1431339 () Bool)

(declare-fun res!965078 () Bool)

(assert (=> b!1431339 (=> (not res!965078) (not e!808238))))

(assert (=> b!1431339 (= res!965078 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47640 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47640 a!2831))))))

(assert (= (and start!123530 res!965073) b!1431332))

(assert (= (and b!1431332 res!965077) b!1431338))

(assert (= (and b!1431338 res!965080) b!1431328))

(assert (= (and b!1431328 res!965071) b!1431336))

(assert (= (and b!1431336 res!965076) b!1431335))

(assert (= (and b!1431335 res!965081) b!1431339))

(assert (= (and b!1431339 res!965078) b!1431334))

(assert (= (and b!1431334 res!965083) b!1431330))

(assert (= (and b!1431330 res!965075) b!1431327))

(assert (= (and b!1431327 res!965072) b!1431331))

(assert (= (and b!1431331 res!965082) b!1431333))

(assert (= (and b!1431333 res!965079) b!1431329))

(assert (= (and b!1431329 res!965074) b!1431337))

(declare-fun m!1321533 () Bool)

(assert (=> b!1431337 m!1321533))

(assert (=> b!1431337 m!1321533))

(declare-fun m!1321535 () Bool)

(assert (=> b!1431337 m!1321535))

(assert (=> b!1431328 m!1321533))

(assert (=> b!1431328 m!1321533))

(declare-fun m!1321537 () Bool)

(assert (=> b!1431328 m!1321537))

(declare-fun m!1321539 () Bool)

(assert (=> b!1431330 m!1321539))

(assert (=> b!1431330 m!1321539))

(declare-fun m!1321541 () Bool)

(assert (=> b!1431330 m!1321541))

(declare-fun m!1321543 () Bool)

(assert (=> b!1431330 m!1321543))

(declare-fun m!1321545 () Bool)

(assert (=> b!1431330 m!1321545))

(declare-fun m!1321547 () Bool)

(assert (=> b!1431336 m!1321547))

(assert (=> b!1431327 m!1321533))

(assert (=> b!1431327 m!1321533))

(declare-fun m!1321549 () Bool)

(assert (=> b!1431327 m!1321549))

(declare-fun m!1321551 () Bool)

(assert (=> b!1431335 m!1321551))

(declare-fun m!1321553 () Bool)

(assert (=> b!1431331 m!1321553))

(assert (=> b!1431329 m!1321543))

(declare-fun m!1321555 () Bool)

(assert (=> b!1431329 m!1321555))

(declare-fun m!1321557 () Bool)

(assert (=> b!1431329 m!1321557))

(declare-fun m!1321559 () Bool)

(assert (=> b!1431329 m!1321559))

(assert (=> b!1431329 m!1321533))

(declare-fun m!1321561 () Bool)

(assert (=> b!1431329 m!1321561))

(declare-fun m!1321563 () Bool)

(assert (=> start!123530 m!1321563))

(declare-fun m!1321565 () Bool)

(assert (=> start!123530 m!1321565))

(declare-fun m!1321567 () Bool)

(assert (=> b!1431338 m!1321567))

(assert (=> b!1431338 m!1321567))

(declare-fun m!1321569 () Bool)

(assert (=> b!1431338 m!1321569))

(assert (=> b!1431334 m!1321533))

(assert (=> b!1431334 m!1321533))

(declare-fun m!1321571 () Bool)

(assert (=> b!1431334 m!1321571))

(assert (=> b!1431334 m!1321571))

(assert (=> b!1431334 m!1321533))

(declare-fun m!1321573 () Bool)

(assert (=> b!1431334 m!1321573))

(check-sat (not b!1431336) (not b!1431330) (not b!1431329) (not start!123530) (not b!1431327) (not b!1431335) (not b!1431331) (not b!1431334) (not b!1431328) (not b!1431337) (not b!1431338))
(check-sat)
(get-model)

(declare-fun b!1431426 () Bool)

(declare-fun e!808276 () Bool)

(declare-fun call!67488 () Bool)

(assert (=> b!1431426 (= e!808276 call!67488)))

(declare-fun b!1431427 () Bool)

(declare-fun e!808275 () Bool)

(assert (=> b!1431427 (= e!808276 e!808275)))

(declare-fun lt!630107 () (_ BitVec 64))

(assert (=> b!1431427 (= lt!630107 (select (arr!47089 a!2831) j!81))))

(declare-fun lt!630105 () Unit!48317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97562 (_ BitVec 64) (_ BitVec 32)) Unit!48317)

(assert (=> b!1431427 (= lt!630105 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630107 j!81))))

(declare-fun arrayContainsKey!0 (array!97562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1431427 (arrayContainsKey!0 a!2831 lt!630107 #b00000000000000000000000000000000)))

(declare-fun lt!630106 () Unit!48317)

(assert (=> b!1431427 (= lt!630106 lt!630105)))

(declare-fun res!965166 () Bool)

(assert (=> b!1431427 (= res!965166 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) (Found!11270 j!81)))))

(assert (=> b!1431427 (=> (not res!965166) (not e!808275))))

(declare-fun b!1431428 () Bool)

(assert (=> b!1431428 (= e!808275 call!67488)))

(declare-fun bm!67485 () Bool)

(assert (=> bm!67485 (= call!67488 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154005 () Bool)

(declare-fun res!965167 () Bool)

(declare-fun e!808277 () Bool)

(assert (=> d!154005 (=> res!965167 e!808277)))

(assert (=> d!154005 (= res!965167 (bvsge j!81 (size!47640 a!2831)))))

(assert (=> d!154005 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808277)))

(declare-fun b!1431429 () Bool)

(assert (=> b!1431429 (= e!808277 e!808276)))

(declare-fun c!132631 () Bool)

(assert (=> b!1431429 (= c!132631 (validKeyInArray!0 (select (arr!47089 a!2831) j!81)))))

(assert (= (and d!154005 (not res!965167)) b!1431429))

(assert (= (and b!1431429 c!132631) b!1431427))

(assert (= (and b!1431429 (not c!132631)) b!1431426))

(assert (= (and b!1431427 res!965166) b!1431428))

(assert (= (or b!1431428 b!1431426) bm!67485))

(assert (=> b!1431427 m!1321533))

(declare-fun m!1321659 () Bool)

(assert (=> b!1431427 m!1321659))

(declare-fun m!1321661 () Bool)

(assert (=> b!1431427 m!1321661))

(assert (=> b!1431427 m!1321533))

(assert (=> b!1431427 m!1321535))

(declare-fun m!1321663 () Bool)

(assert (=> bm!67485 m!1321663))

(assert (=> b!1431429 m!1321533))

(assert (=> b!1431429 m!1321533))

(assert (=> b!1431429 m!1321537))

(assert (=> b!1431329 d!154005))

(declare-fun d!154007 () Bool)

(assert (=> d!154007 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630110 () Unit!48317)

(declare-fun choose!38 (array!97562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48317)

(assert (=> d!154007 (= lt!630110 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154007 (validMask!0 mask!2608)))

(assert (=> d!154007 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630110)))

(declare-fun bs!41668 () Bool)

(assert (= bs!41668 d!154007))

(assert (=> bs!41668 m!1321559))

(declare-fun m!1321665 () Bool)

(assert (=> bs!41668 m!1321665))

(assert (=> bs!41668 m!1321563))

(assert (=> b!1431329 d!154007))

(declare-fun b!1431481 () Bool)

(declare-fun e!808314 () Bool)

(declare-fun lt!630119 () SeekEntryResult!11270)

(assert (=> b!1431481 (= e!808314 (bvsge (x!129265 lt!630119) #b01111111111111111111111111111110))))

(declare-fun b!1431482 () Bool)

(declare-fun e!808310 () SeekEntryResult!11270)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431482 (= e!808310 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(declare-fun e!808312 () SeekEntryResult!11270)

(declare-fun b!1431483 () Bool)

(assert (=> b!1431483 (= e!808312 (Intermediate!11270 true (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431484 () Bool)

(declare-fun e!808311 () Bool)

(assert (=> b!1431484 (= e!808314 e!808311)))

(declare-fun res!965190 () Bool)

(get-info :version)

(assert (=> b!1431484 (= res!965190 (and ((_ is Intermediate!11270) lt!630119) (not (undefined!12082 lt!630119)) (bvslt (x!129265 lt!630119) #b01111111111111111111111111111110) (bvsge (x!129265 lt!630119) #b00000000000000000000000000000000) (bvsge (x!129265 lt!630119) #b00000000000000000000000000000000)))))

(assert (=> b!1431484 (=> (not res!965190) (not e!808311))))

(declare-fun b!1431485 () Bool)

(assert (=> b!1431485 (= e!808312 e!808310)))

(declare-fun lt!630120 () (_ BitVec 64))

(declare-fun c!132648 () Bool)

(assert (=> b!1431485 (= c!132648 (or (= lt!630120 (select (arr!47089 a!2831) j!81)) (= (bvadd lt!630120 lt!630120) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431486 () Bool)

(assert (=> b!1431486 (and (bvsge (index!47474 lt!630119) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630119) (size!47640 a!2831)))))

(declare-fun res!965191 () Bool)

(assert (=> b!1431486 (= res!965191 (= (select (arr!47089 a!2831) (index!47474 lt!630119)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808313 () Bool)

(assert (=> b!1431486 (=> res!965191 e!808313)))

(declare-fun b!1431487 () Bool)

(assert (=> b!1431487 (= e!808310 (Intermediate!11270 false (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154009 () Bool)

(assert (=> d!154009 e!808314))

(declare-fun c!132649 () Bool)

(assert (=> d!154009 (= c!132649 (and ((_ is Intermediate!11270) lt!630119) (undefined!12082 lt!630119)))))

(assert (=> d!154009 (= lt!630119 e!808312)))

(declare-fun c!132647 () Bool)

(assert (=> d!154009 (= c!132647 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154009 (= lt!630120 (select (arr!47089 a!2831) (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608)))))

(assert (=> d!154009 (validMask!0 mask!2608)))

(assert (=> d!154009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!630119)))

(declare-fun b!1431488 () Bool)

(assert (=> b!1431488 (and (bvsge (index!47474 lt!630119) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630119) (size!47640 a!2831)))))

(declare-fun res!965189 () Bool)

(assert (=> b!1431488 (= res!965189 (= (select (arr!47089 a!2831) (index!47474 lt!630119)) (select (arr!47089 a!2831) j!81)))))

(assert (=> b!1431488 (=> res!965189 e!808313)))

(assert (=> b!1431488 (= e!808311 e!808313)))

(declare-fun b!1431489 () Bool)

(assert (=> b!1431489 (and (bvsge (index!47474 lt!630119) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630119) (size!47640 a!2831)))))

(assert (=> b!1431489 (= e!808313 (= (select (arr!47089 a!2831) (index!47474 lt!630119)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154009 c!132647) b!1431483))

(assert (= (and d!154009 (not c!132647)) b!1431485))

(assert (= (and b!1431485 c!132648) b!1431487))

(assert (= (and b!1431485 (not c!132648)) b!1431482))

(assert (= (and d!154009 c!132649) b!1431481))

(assert (= (and d!154009 (not c!132649)) b!1431484))

(assert (= (and b!1431484 res!965190) b!1431488))

(assert (= (and b!1431488 (not res!965189)) b!1431486))

(assert (= (and b!1431486 (not res!965191)) b!1431489))

(declare-fun m!1321675 () Bool)

(assert (=> b!1431488 m!1321675))

(assert (=> b!1431489 m!1321675))

(assert (=> d!154009 m!1321571))

(declare-fun m!1321677 () Bool)

(assert (=> d!154009 m!1321677))

(assert (=> d!154009 m!1321563))

(assert (=> b!1431482 m!1321571))

(declare-fun m!1321679 () Bool)

(assert (=> b!1431482 m!1321679))

(assert (=> b!1431482 m!1321679))

(assert (=> b!1431482 m!1321533))

(declare-fun m!1321681 () Bool)

(assert (=> b!1431482 m!1321681))

(assert (=> b!1431486 m!1321675))

(assert (=> b!1431334 d!154009))

(declare-fun d!154019 () Bool)

(declare-fun lt!630128 () (_ BitVec 32))

(declare-fun lt!630127 () (_ BitVec 32))

(assert (=> d!154019 (= lt!630128 (bvmul (bvxor lt!630127 (bvlshr lt!630127 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154019 (= lt!630127 ((_ extract 31 0) (bvand (bvxor (select (arr!47089 a!2831) j!81) (bvlshr (select (arr!47089 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154019 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965192 (let ((h!34910 ((_ extract 31 0) (bvand (bvxor (select (arr!47089 a!2831) j!81) (bvlshr (select (arr!47089 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129270 (bvmul (bvxor h!34910 (bvlshr h!34910 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129270 (bvlshr x!129270 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965192 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965192 #b00000000000000000000000000000000))))))

(assert (=> d!154019 (= (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (bvand (bvxor lt!630128 (bvlshr lt!630128 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431334 d!154019))

(declare-fun d!154023 () Bool)

(assert (=> d!154023 (= (validKeyInArray!0 (select (arr!47089 a!2831) j!81)) (and (not (= (select (arr!47089 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47089 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431328 d!154023))

(declare-fun d!154025 () Bool)

(assert (=> d!154025 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123530 d!154025))

(declare-fun d!154029 () Bool)

(assert (=> d!154029 (= (array_inv!36370 a!2831) (bvsge (size!47640 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123530 d!154029))

(declare-fun b!1431523 () Bool)

(declare-fun e!808339 () Bool)

(declare-fun lt!630150 () SeekEntryResult!11270)

(assert (=> b!1431523 (= e!808339 (bvsge (x!129265 lt!630150) #b01111111111111111111111111111110))))

(declare-fun b!1431524 () Bool)

(declare-fun e!808335 () SeekEntryResult!11270)

(assert (=> b!1431524 (= e!808335 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431525 () Bool)

(declare-fun e!808337 () SeekEntryResult!11270)

(assert (=> b!1431525 (= e!808337 (Intermediate!11270 true index!585 x!605))))

(declare-fun b!1431526 () Bool)

(declare-fun e!808336 () Bool)

(assert (=> b!1431526 (= e!808339 e!808336)))

(declare-fun res!965204 () Bool)

(assert (=> b!1431526 (= res!965204 (and ((_ is Intermediate!11270) lt!630150) (not (undefined!12082 lt!630150)) (bvslt (x!129265 lt!630150) #b01111111111111111111111111111110) (bvsge (x!129265 lt!630150) #b00000000000000000000000000000000) (bvsge (x!129265 lt!630150) x!605)))))

(assert (=> b!1431526 (=> (not res!965204) (not e!808336))))

(declare-fun b!1431527 () Bool)

(assert (=> b!1431527 (= e!808337 e!808335)))

(declare-fun lt!630151 () (_ BitVec 64))

(declare-fun c!132663 () Bool)

(assert (=> b!1431527 (= c!132663 (or (= lt!630151 (select (arr!47089 a!2831) j!81)) (= (bvadd lt!630151 lt!630151) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431528 () Bool)

(assert (=> b!1431528 (and (bvsge (index!47474 lt!630150) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630150) (size!47640 a!2831)))))

(declare-fun res!965205 () Bool)

(assert (=> b!1431528 (= res!965205 (= (select (arr!47089 a!2831) (index!47474 lt!630150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808338 () Bool)

(assert (=> b!1431528 (=> res!965205 e!808338)))

(declare-fun b!1431529 () Bool)

(assert (=> b!1431529 (= e!808335 (Intermediate!11270 false index!585 x!605))))

(declare-fun d!154031 () Bool)

(assert (=> d!154031 e!808339))

(declare-fun c!132664 () Bool)

(assert (=> d!154031 (= c!132664 (and ((_ is Intermediate!11270) lt!630150) (undefined!12082 lt!630150)))))

(assert (=> d!154031 (= lt!630150 e!808337)))

(declare-fun c!132662 () Bool)

(assert (=> d!154031 (= c!132662 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154031 (= lt!630151 (select (arr!47089 a!2831) index!585))))

(assert (=> d!154031 (validMask!0 mask!2608)))

(assert (=> d!154031 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!630150)))

(declare-fun b!1431530 () Bool)

(assert (=> b!1431530 (and (bvsge (index!47474 lt!630150) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630150) (size!47640 a!2831)))))

(declare-fun res!965203 () Bool)

(assert (=> b!1431530 (= res!965203 (= (select (arr!47089 a!2831) (index!47474 lt!630150)) (select (arr!47089 a!2831) j!81)))))

(assert (=> b!1431530 (=> res!965203 e!808338)))

(assert (=> b!1431530 (= e!808336 e!808338)))

(declare-fun b!1431531 () Bool)

(assert (=> b!1431531 (and (bvsge (index!47474 lt!630150) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630150) (size!47640 a!2831)))))

(assert (=> b!1431531 (= e!808338 (= (select (arr!47089 a!2831) (index!47474 lt!630150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154031 c!132662) b!1431525))

(assert (= (and d!154031 (not c!132662)) b!1431527))

(assert (= (and b!1431527 c!132663) b!1431529))

(assert (= (and b!1431527 (not c!132663)) b!1431524))

(assert (= (and d!154031 c!132664) b!1431523))

(assert (= (and d!154031 (not c!132664)) b!1431526))

(assert (= (and b!1431526 res!965204) b!1431530))

(assert (= (and b!1431530 (not res!965203)) b!1431528))

(assert (= (and b!1431528 (not res!965205)) b!1431531))

(declare-fun m!1321697 () Bool)

(assert (=> b!1431530 m!1321697))

(assert (=> b!1431531 m!1321697))

(assert (=> d!154031 m!1321557))

(assert (=> d!154031 m!1321563))

(declare-fun m!1321699 () Bool)

(assert (=> b!1431524 m!1321699))

(assert (=> b!1431524 m!1321699))

(assert (=> b!1431524 m!1321533))

(declare-fun m!1321701 () Bool)

(assert (=> b!1431524 m!1321701))

(assert (=> b!1431528 m!1321697))

(assert (=> b!1431327 d!154031))

(declare-fun d!154035 () Bool)

(assert (=> d!154035 (= (validKeyInArray!0 (select (arr!47089 a!2831) i!982)) (and (not (= (select (arr!47089 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47089 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431338 d!154035))

(declare-fun d!154037 () Bool)

(declare-fun lt!630180 () SeekEntryResult!11270)

(assert (=> d!154037 (and (or ((_ is Undefined!11270) lt!630180) (not ((_ is Found!11270) lt!630180)) (and (bvsge (index!47473 lt!630180) #b00000000000000000000000000000000) (bvslt (index!47473 lt!630180) (size!47640 a!2831)))) (or ((_ is Undefined!11270) lt!630180) ((_ is Found!11270) lt!630180) (not ((_ is MissingZero!11270) lt!630180)) (and (bvsge (index!47472 lt!630180) #b00000000000000000000000000000000) (bvslt (index!47472 lt!630180) (size!47640 a!2831)))) (or ((_ is Undefined!11270) lt!630180) ((_ is Found!11270) lt!630180) ((_ is MissingZero!11270) lt!630180) (not ((_ is MissingVacant!11270) lt!630180)) (and (bvsge (index!47475 lt!630180) #b00000000000000000000000000000000) (bvslt (index!47475 lt!630180) (size!47640 a!2831)))) (or ((_ is Undefined!11270) lt!630180) (ite ((_ is Found!11270) lt!630180) (= (select (arr!47089 a!2831) (index!47473 lt!630180)) (select (arr!47089 a!2831) j!81)) (ite ((_ is MissingZero!11270) lt!630180) (= (select (arr!47089 a!2831) (index!47472 lt!630180)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11270) lt!630180) (= (select (arr!47089 a!2831) (index!47475 lt!630180)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!808377 () SeekEntryResult!11270)

(assert (=> d!154037 (= lt!630180 e!808377)))

(declare-fun c!132691 () Bool)

(declare-fun lt!630181 () SeekEntryResult!11270)

(assert (=> d!154037 (= c!132691 (and ((_ is Intermediate!11270) lt!630181) (undefined!12082 lt!630181)))))

(assert (=> d!154037 (= lt!630181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47089 a!2831) j!81) mask!2608) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154037 (validMask!0 mask!2608)))

(assert (=> d!154037 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) j!81) a!2831 mask!2608) lt!630180)))

(declare-fun b!1431593 () Bool)

(declare-fun e!808376 () SeekEntryResult!11270)

(assert (=> b!1431593 (= e!808377 e!808376)))

(declare-fun lt!630179 () (_ BitVec 64))

(assert (=> b!1431593 (= lt!630179 (select (arr!47089 a!2831) (index!47474 lt!630181)))))

(declare-fun c!132692 () Bool)

(assert (=> b!1431593 (= c!132692 (= lt!630179 (select (arr!47089 a!2831) j!81)))))

(declare-fun b!1431594 () Bool)

(declare-fun e!808375 () SeekEntryResult!11270)

(assert (=> b!1431594 (= e!808375 (MissingZero!11270 (index!47474 lt!630181)))))

(declare-fun b!1431595 () Bool)

(declare-fun c!132690 () Bool)

(assert (=> b!1431595 (= c!132690 (= lt!630179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431595 (= e!808376 e!808375)))

(declare-fun b!1431596 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97562 (_ BitVec 32)) SeekEntryResult!11270)

(assert (=> b!1431596 (= e!808375 (seekKeyOrZeroReturnVacant!0 (x!129265 lt!630181) (index!47474 lt!630181) (index!47474 lt!630181) (select (arr!47089 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431597 () Bool)

(assert (=> b!1431597 (= e!808376 (Found!11270 (index!47474 lt!630181)))))

(declare-fun b!1431598 () Bool)

(assert (=> b!1431598 (= e!808377 Undefined!11270)))

(assert (= (and d!154037 c!132691) b!1431598))

(assert (= (and d!154037 (not c!132691)) b!1431593))

(assert (= (and b!1431593 c!132692) b!1431597))

(assert (= (and b!1431593 (not c!132692)) b!1431595))

(assert (= (and b!1431595 c!132690) b!1431594))

(assert (= (and b!1431595 (not c!132690)) b!1431596))

(declare-fun m!1321743 () Bool)

(assert (=> d!154037 m!1321743))

(declare-fun m!1321745 () Bool)

(assert (=> d!154037 m!1321745))

(declare-fun m!1321747 () Bool)

(assert (=> d!154037 m!1321747))

(assert (=> d!154037 m!1321533))

(assert (=> d!154037 m!1321571))

(assert (=> d!154037 m!1321571))

(assert (=> d!154037 m!1321533))

(assert (=> d!154037 m!1321573))

(assert (=> d!154037 m!1321563))

(declare-fun m!1321749 () Bool)

(assert (=> b!1431593 m!1321749))

(assert (=> b!1431596 m!1321533))

(declare-fun m!1321751 () Bool)

(assert (=> b!1431596 m!1321751))

(assert (=> b!1431337 d!154037))

(declare-fun b!1431605 () Bool)

(declare-fun e!808384 () Bool)

(declare-fun lt!630182 () SeekEntryResult!11270)

(assert (=> b!1431605 (= e!808384 (bvsge (x!129265 lt!630182) #b01111111111111111111111111111110))))

(declare-fun e!808380 () SeekEntryResult!11270)

(declare-fun b!1431606 () Bool)

(assert (=> b!1431606 (= e!808380 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!630065 lt!630067 mask!2608))))

(declare-fun b!1431607 () Bool)

(declare-fun e!808382 () SeekEntryResult!11270)

(assert (=> b!1431607 (= e!808382 (Intermediate!11270 true index!585 x!605))))

(declare-fun b!1431608 () Bool)

(declare-fun e!808381 () Bool)

(assert (=> b!1431608 (= e!808384 e!808381)))

(declare-fun res!965224 () Bool)

(assert (=> b!1431608 (= res!965224 (and ((_ is Intermediate!11270) lt!630182) (not (undefined!12082 lt!630182)) (bvslt (x!129265 lt!630182) #b01111111111111111111111111111110) (bvsge (x!129265 lt!630182) #b00000000000000000000000000000000) (bvsge (x!129265 lt!630182) x!605)))))

(assert (=> b!1431608 (=> (not res!965224) (not e!808381))))

(declare-fun b!1431609 () Bool)

(assert (=> b!1431609 (= e!808382 e!808380)))

(declare-fun c!132694 () Bool)

(declare-fun lt!630183 () (_ BitVec 64))

(assert (=> b!1431609 (= c!132694 (or (= lt!630183 lt!630065) (= (bvadd lt!630183 lt!630183) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431610 () Bool)

(assert (=> b!1431610 (and (bvsge (index!47474 lt!630182) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630182) (size!47640 lt!630067)))))

(declare-fun res!965225 () Bool)

(assert (=> b!1431610 (= res!965225 (= (select (arr!47089 lt!630067) (index!47474 lt!630182)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808383 () Bool)

(assert (=> b!1431610 (=> res!965225 e!808383)))

(declare-fun b!1431611 () Bool)

(assert (=> b!1431611 (= e!808380 (Intermediate!11270 false index!585 x!605))))

(declare-fun d!154061 () Bool)

(assert (=> d!154061 e!808384))

(declare-fun c!132695 () Bool)

(assert (=> d!154061 (= c!132695 (and ((_ is Intermediate!11270) lt!630182) (undefined!12082 lt!630182)))))

(assert (=> d!154061 (= lt!630182 e!808382)))

(declare-fun c!132693 () Bool)

(assert (=> d!154061 (= c!132693 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154061 (= lt!630183 (select (arr!47089 lt!630067) index!585))))

(assert (=> d!154061 (validMask!0 mask!2608)))

(assert (=> d!154061 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630065 lt!630067 mask!2608) lt!630182)))

(declare-fun b!1431612 () Bool)

(assert (=> b!1431612 (and (bvsge (index!47474 lt!630182) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630182) (size!47640 lt!630067)))))

(declare-fun res!965223 () Bool)

(assert (=> b!1431612 (= res!965223 (= (select (arr!47089 lt!630067) (index!47474 lt!630182)) lt!630065))))

(assert (=> b!1431612 (=> res!965223 e!808383)))

(assert (=> b!1431612 (= e!808381 e!808383)))

(declare-fun b!1431613 () Bool)

(assert (=> b!1431613 (and (bvsge (index!47474 lt!630182) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630182) (size!47640 lt!630067)))))

(assert (=> b!1431613 (= e!808383 (= (select (arr!47089 lt!630067) (index!47474 lt!630182)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154061 c!132693) b!1431607))

(assert (= (and d!154061 (not c!132693)) b!1431609))

(assert (= (and b!1431609 c!132694) b!1431611))

(assert (= (and b!1431609 (not c!132694)) b!1431606))

(assert (= (and d!154061 c!132695) b!1431605))

(assert (= (and d!154061 (not c!132695)) b!1431608))

(assert (= (and b!1431608 res!965224) b!1431612))

(assert (= (and b!1431612 (not res!965223)) b!1431610))

(assert (= (and b!1431610 (not res!965225)) b!1431613))

(declare-fun m!1321753 () Bool)

(assert (=> b!1431612 m!1321753))

(assert (=> b!1431613 m!1321753))

(declare-fun m!1321755 () Bool)

(assert (=> d!154061 m!1321755))

(assert (=> d!154061 m!1321563))

(assert (=> b!1431606 m!1321699))

(assert (=> b!1431606 m!1321699))

(declare-fun m!1321757 () Bool)

(assert (=> b!1431606 m!1321757))

(assert (=> b!1431610 m!1321753))

(assert (=> b!1431331 d!154061))

(declare-fun b!1431614 () Bool)

(declare-fun e!808386 () Bool)

(declare-fun call!67496 () Bool)

(assert (=> b!1431614 (= e!808386 call!67496)))

(declare-fun b!1431615 () Bool)

(declare-fun e!808385 () Bool)

(assert (=> b!1431615 (= e!808386 e!808385)))

(declare-fun lt!630186 () (_ BitVec 64))

(assert (=> b!1431615 (= lt!630186 (select (arr!47089 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630184 () Unit!48317)

(assert (=> b!1431615 (= lt!630184 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630186 #b00000000000000000000000000000000))))

(assert (=> b!1431615 (arrayContainsKey!0 a!2831 lt!630186 #b00000000000000000000000000000000)))

(declare-fun lt!630185 () Unit!48317)

(assert (=> b!1431615 (= lt!630185 lt!630184)))

(declare-fun res!965226 () Bool)

(assert (=> b!1431615 (= res!965226 (= (seekEntryOrOpen!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11270 #b00000000000000000000000000000000)))))

(assert (=> b!1431615 (=> (not res!965226) (not e!808385))))

(declare-fun b!1431616 () Bool)

(assert (=> b!1431616 (= e!808385 call!67496)))

(declare-fun bm!67493 () Bool)

(assert (=> bm!67493 (= call!67496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154063 () Bool)

(declare-fun res!965227 () Bool)

(declare-fun e!808387 () Bool)

(assert (=> d!154063 (=> res!965227 e!808387)))

(assert (=> d!154063 (= res!965227 (bvsge #b00000000000000000000000000000000 (size!47640 a!2831)))))

(assert (=> d!154063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808387)))

(declare-fun b!1431617 () Bool)

(assert (=> b!1431617 (= e!808387 e!808386)))

(declare-fun c!132696 () Bool)

(assert (=> b!1431617 (= c!132696 (validKeyInArray!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154063 (not res!965227)) b!1431617))

(assert (= (and b!1431617 c!132696) b!1431615))

(assert (= (and b!1431617 (not c!132696)) b!1431614))

(assert (= (and b!1431615 res!965226) b!1431616))

(assert (= (or b!1431616 b!1431614) bm!67493))

(declare-fun m!1321759 () Bool)

(assert (=> b!1431615 m!1321759))

(declare-fun m!1321761 () Bool)

(assert (=> b!1431615 m!1321761))

(declare-fun m!1321763 () Bool)

(assert (=> b!1431615 m!1321763))

(assert (=> b!1431615 m!1321759))

(declare-fun m!1321765 () Bool)

(assert (=> b!1431615 m!1321765))

(declare-fun m!1321767 () Bool)

(assert (=> bm!67493 m!1321767))

(assert (=> b!1431617 m!1321759))

(assert (=> b!1431617 m!1321759))

(declare-fun m!1321769 () Bool)

(assert (=> b!1431617 m!1321769))

(assert (=> b!1431336 d!154063))

(declare-fun b!1431637 () Bool)

(declare-fun e!808404 () Bool)

(declare-fun contains!9905 (List!33586 (_ BitVec 64)) Bool)

(assert (=> b!1431637 (= e!808404 (contains!9905 Nil!33583 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!154065 () Bool)

(declare-fun res!965240 () Bool)

(declare-fun e!808402 () Bool)

(assert (=> d!154065 (=> res!965240 e!808402)))

(assert (=> d!154065 (= res!965240 (bvsge #b00000000000000000000000000000000 (size!47640 a!2831)))))

(assert (=> d!154065 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33583) e!808402)))

(declare-fun b!1431638 () Bool)

(declare-fun e!808401 () Bool)

(declare-fun call!67499 () Bool)

(assert (=> b!1431638 (= e!808401 call!67499)))

(declare-fun b!1431639 () Bool)

(declare-fun e!808403 () Bool)

(assert (=> b!1431639 (= e!808403 e!808401)))

(declare-fun c!132702 () Bool)

(assert (=> b!1431639 (= c!132702 (validKeyInArray!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431640 () Bool)

(assert (=> b!1431640 (= e!808402 e!808403)))

(declare-fun res!965239 () Bool)

(assert (=> b!1431640 (=> (not res!965239) (not e!808403))))

(assert (=> b!1431640 (= res!965239 (not e!808404))))

(declare-fun res!965238 () Bool)

(assert (=> b!1431640 (=> (not res!965238) (not e!808404))))

(assert (=> b!1431640 (= res!965238 (validKeyInArray!0 (select (arr!47089 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67496 () Bool)

(assert (=> bm!67496 (= call!67499 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132702 (Cons!33582 (select (arr!47089 a!2831) #b00000000000000000000000000000000) Nil!33583) Nil!33583)))))

(declare-fun b!1431641 () Bool)

(assert (=> b!1431641 (= e!808401 call!67499)))

(assert (= (and d!154065 (not res!965240)) b!1431640))

(assert (= (and b!1431640 res!965238) b!1431637))

(assert (= (and b!1431640 res!965239) b!1431639))

(assert (= (and b!1431639 c!132702) b!1431638))

(assert (= (and b!1431639 (not c!132702)) b!1431641))

(assert (= (or b!1431638 b!1431641) bm!67496))

(assert (=> b!1431637 m!1321759))

(assert (=> b!1431637 m!1321759))

(declare-fun m!1321779 () Bool)

(assert (=> b!1431637 m!1321779))

(assert (=> b!1431639 m!1321759))

(assert (=> b!1431639 m!1321759))

(assert (=> b!1431639 m!1321769))

(assert (=> b!1431640 m!1321759))

(assert (=> b!1431640 m!1321759))

(assert (=> b!1431640 m!1321769))

(assert (=> bm!67496 m!1321759))

(declare-fun m!1321781 () Bool)

(assert (=> bm!67496 m!1321781))

(assert (=> b!1431335 d!154065))

(declare-fun b!1431642 () Bool)

(declare-fun e!808409 () Bool)

(declare-fun lt!630195 () SeekEntryResult!11270)

(assert (=> b!1431642 (= e!808409 (bvsge (x!129265 lt!630195) #b01111111111111111111111111111110))))

(declare-fun e!808405 () SeekEntryResult!11270)

(declare-fun b!1431643 () Bool)

(assert (=> b!1431643 (= e!808405 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630065 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!630065 lt!630067 mask!2608))))

(declare-fun b!1431644 () Bool)

(declare-fun e!808407 () SeekEntryResult!11270)

(assert (=> b!1431644 (= e!808407 (Intermediate!11270 true (toIndex!0 lt!630065 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431645 () Bool)

(declare-fun e!808406 () Bool)

(assert (=> b!1431645 (= e!808409 e!808406)))

(declare-fun res!965242 () Bool)

(assert (=> b!1431645 (= res!965242 (and ((_ is Intermediate!11270) lt!630195) (not (undefined!12082 lt!630195)) (bvslt (x!129265 lt!630195) #b01111111111111111111111111111110) (bvsge (x!129265 lt!630195) #b00000000000000000000000000000000) (bvsge (x!129265 lt!630195) #b00000000000000000000000000000000)))))

(assert (=> b!1431645 (=> (not res!965242) (not e!808406))))

(declare-fun b!1431646 () Bool)

(assert (=> b!1431646 (= e!808407 e!808405)))

(declare-fun c!132704 () Bool)

(declare-fun lt!630196 () (_ BitVec 64))

(assert (=> b!1431646 (= c!132704 (or (= lt!630196 lt!630065) (= (bvadd lt!630196 lt!630196) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431647 () Bool)

(assert (=> b!1431647 (and (bvsge (index!47474 lt!630195) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630195) (size!47640 lt!630067)))))

(declare-fun res!965243 () Bool)

(assert (=> b!1431647 (= res!965243 (= (select (arr!47089 lt!630067) (index!47474 lt!630195)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808408 () Bool)

(assert (=> b!1431647 (=> res!965243 e!808408)))

(declare-fun b!1431648 () Bool)

(assert (=> b!1431648 (= e!808405 (Intermediate!11270 false (toIndex!0 lt!630065 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154069 () Bool)

(assert (=> d!154069 e!808409))

(declare-fun c!132705 () Bool)

(assert (=> d!154069 (= c!132705 (and ((_ is Intermediate!11270) lt!630195) (undefined!12082 lt!630195)))))

(assert (=> d!154069 (= lt!630195 e!808407)))

(declare-fun c!132703 () Bool)

(assert (=> d!154069 (= c!132703 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154069 (= lt!630196 (select (arr!47089 lt!630067) (toIndex!0 lt!630065 mask!2608)))))

(assert (=> d!154069 (validMask!0 mask!2608)))

(assert (=> d!154069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630065 mask!2608) lt!630065 lt!630067 mask!2608) lt!630195)))

(declare-fun b!1431649 () Bool)

(assert (=> b!1431649 (and (bvsge (index!47474 lt!630195) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630195) (size!47640 lt!630067)))))

(declare-fun res!965241 () Bool)

(assert (=> b!1431649 (= res!965241 (= (select (arr!47089 lt!630067) (index!47474 lt!630195)) lt!630065))))

(assert (=> b!1431649 (=> res!965241 e!808408)))

(assert (=> b!1431649 (= e!808406 e!808408)))

(declare-fun b!1431650 () Bool)

(assert (=> b!1431650 (and (bvsge (index!47474 lt!630195) #b00000000000000000000000000000000) (bvslt (index!47474 lt!630195) (size!47640 lt!630067)))))

(assert (=> b!1431650 (= e!808408 (= (select (arr!47089 lt!630067) (index!47474 lt!630195)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154069 c!132703) b!1431644))

(assert (= (and d!154069 (not c!132703)) b!1431646))

(assert (= (and b!1431646 c!132704) b!1431648))

(assert (= (and b!1431646 (not c!132704)) b!1431643))

(assert (= (and d!154069 c!132705) b!1431642))

(assert (= (and d!154069 (not c!132705)) b!1431645))

(assert (= (and b!1431645 res!965242) b!1431649))

(assert (= (and b!1431649 (not res!965241)) b!1431647))

(assert (= (and b!1431647 (not res!965243)) b!1431650))

(declare-fun m!1321783 () Bool)

(assert (=> b!1431649 m!1321783))

(assert (=> b!1431650 m!1321783))

(assert (=> d!154069 m!1321539))

(declare-fun m!1321785 () Bool)

(assert (=> d!154069 m!1321785))

(assert (=> d!154069 m!1321563))

(assert (=> b!1431643 m!1321539))

(declare-fun m!1321787 () Bool)

(assert (=> b!1431643 m!1321787))

(assert (=> b!1431643 m!1321787))

(declare-fun m!1321789 () Bool)

(assert (=> b!1431643 m!1321789))

(assert (=> b!1431647 m!1321783))

(assert (=> b!1431330 d!154069))

(declare-fun d!154073 () Bool)

(declare-fun lt!630198 () (_ BitVec 32))

(declare-fun lt!630197 () (_ BitVec 32))

(assert (=> d!154073 (= lt!630198 (bvmul (bvxor lt!630197 (bvlshr lt!630197 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154073 (= lt!630197 ((_ extract 31 0) (bvand (bvxor lt!630065 (bvlshr lt!630065 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154073 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965192 (let ((h!34910 ((_ extract 31 0) (bvand (bvxor lt!630065 (bvlshr lt!630065 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129270 (bvmul (bvxor h!34910 (bvlshr h!34910 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129270 (bvlshr x!129270 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965192 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965192 #b00000000000000000000000000000000))))))

(assert (=> d!154073 (= (toIndex!0 lt!630065 mask!2608) (bvand (bvxor lt!630198 (bvlshr lt!630198 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431330 d!154073))

(check-sat (not b!1431429) (not b!1431606) (not b!1431427) (not d!154037) (not bm!67496) (not b!1431640) (not b!1431617) (not b!1431524) (not b!1431639) (not bm!67493) (not d!154061) (not b!1431643) (not b!1431482) (not b!1431637) (not d!154031) (not b!1431615) (not d!154007) (not d!154069) (not b!1431596) (not d!154009) (not bm!67485))
(check-sat)
