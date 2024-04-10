; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123356 () Bool)

(assert start!123356)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun e!807603 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97466 0))(
  ( (array!97467 (arr!47043 (Array (_ BitVec 32) (_ BitVec 64))) (size!47593 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97466)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun b!1430474 () Bool)

(assert (=> b!1430474 (= e!807603 (not (or (= (select (arr!47043 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47043 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47043 a!2831) index!585) (select (arr!47043 a!2831) j!81)) (not (= (select (store (arr!47043 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))))

(declare-fun e!807604 () Bool)

(assert (=> b!1430474 e!807604))

(declare-fun res!964904 () Bool)

(assert (=> b!1430474 (=> (not res!964904) (not e!807604))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97466 (_ BitVec 32)) Bool)

(assert (=> b!1430474 (= res!964904 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48390 0))(
  ( (Unit!48391) )
))
(declare-fun lt!629774 () Unit!48390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48390)

(assert (=> b!1430474 (= lt!629774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430475 () Bool)

(declare-fun e!807601 () Bool)

(declare-fun e!807602 () Bool)

(assert (=> b!1430475 (= e!807601 e!807602)))

(declare-fun res!964910 () Bool)

(assert (=> b!1430475 (=> (not res!964910) (not e!807602))))

(declare-datatypes ((SeekEntryResult!11322 0))(
  ( (MissingZero!11322 (index!47680 (_ BitVec 32))) (Found!11322 (index!47681 (_ BitVec 32))) (Intermediate!11322 (undefined!12134 Bool) (index!47682 (_ BitVec 32)) (x!129314 (_ BitVec 32))) (Undefined!11322) (MissingVacant!11322 (index!47683 (_ BitVec 32))) )
))
(declare-fun lt!629773 () SeekEntryResult!11322)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97466 (_ BitVec 32)) SeekEntryResult!11322)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430475 (= res!964910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629773))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1430475 (= lt!629773 (Intermediate!11322 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430477 () Bool)

(assert (=> b!1430477 (= e!807602 e!807603)))

(declare-fun res!964906 () Bool)

(assert (=> b!1430477 (=> (not res!964906) (not e!807603))))

(declare-fun lt!629772 () array!97466)

(declare-fun lt!629775 () SeekEntryResult!11322)

(declare-fun lt!629771 () (_ BitVec 64))

(assert (=> b!1430477 (= res!964906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629771 mask!2608) lt!629771 lt!629772 mask!2608) lt!629775))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430477 (= lt!629775 (Intermediate!11322 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430477 (= lt!629771 (select (store (arr!47043 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430477 (= lt!629772 (array!97467 (store (arr!47043 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47593 a!2831)))))

(declare-fun b!1430478 () Bool)

(declare-fun res!964907 () Bool)

(assert (=> b!1430478 (=> (not res!964907) (not e!807601))))

(assert (=> b!1430478 (= res!964907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430479 () Bool)

(declare-fun res!964914 () Bool)

(assert (=> b!1430479 (=> (not res!964914) (not e!807601))))

(declare-datatypes ((List!33553 0))(
  ( (Nil!33550) (Cons!33549 (h!34866 (_ BitVec 64)) (t!48247 List!33553)) )
))
(declare-fun arrayNoDuplicates!0 (array!97466 (_ BitVec 32) List!33553) Bool)

(assert (=> b!1430479 (= res!964914 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33550))))

(declare-fun b!1430480 () Bool)

(declare-fun res!964903 () Bool)

(assert (=> b!1430480 (=> (not res!964903) (not e!807603))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1430480 (= res!964903 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629771 lt!629772 mask!2608) lt!629775))))

(declare-fun b!1430481 () Bool)

(declare-fun res!964909 () Bool)

(assert (=> b!1430481 (=> (not res!964909) (not e!807603))))

(assert (=> b!1430481 (= res!964909 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629773))))

(declare-fun b!1430482 () Bool)

(declare-fun res!964902 () Bool)

(assert (=> b!1430482 (=> (not res!964902) (not e!807601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430482 (= res!964902 (validKeyInArray!0 (select (arr!47043 a!2831) j!81)))))

(declare-fun b!1430483 () Bool)

(declare-fun res!964911 () Bool)

(assert (=> b!1430483 (=> (not res!964911) (not e!807603))))

(assert (=> b!1430483 (= res!964911 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430484 () Bool)

(declare-fun res!964913 () Bool)

(assert (=> b!1430484 (=> (not res!964913) (not e!807604))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97466 (_ BitVec 32)) SeekEntryResult!11322)

(assert (=> b!1430484 (= res!964913 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) j!81) a!2831 mask!2608) (Found!11322 j!81)))))

(declare-fun res!964905 () Bool)

(assert (=> start!123356 (=> (not res!964905) (not e!807601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123356 (= res!964905 (validMask!0 mask!2608))))

(assert (=> start!123356 e!807601))

(assert (=> start!123356 true))

(declare-fun array_inv!36071 (array!97466) Bool)

(assert (=> start!123356 (array_inv!36071 a!2831)))

(declare-fun b!1430476 () Bool)

(declare-fun res!964912 () Bool)

(assert (=> b!1430476 (=> (not res!964912) (not e!807601))))

(assert (=> b!1430476 (= res!964912 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47593 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47593 a!2831))))))

(declare-fun b!1430485 () Bool)

(declare-fun res!964915 () Bool)

(assert (=> b!1430485 (=> (not res!964915) (not e!807601))))

(assert (=> b!1430485 (= res!964915 (and (= (size!47593 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47593 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47593 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430486 () Bool)

(declare-fun res!964908 () Bool)

(assert (=> b!1430486 (=> (not res!964908) (not e!807601))))

(assert (=> b!1430486 (= res!964908 (validKeyInArray!0 (select (arr!47043 a!2831) i!982)))))

(declare-fun b!1430487 () Bool)

(assert (=> b!1430487 (= e!807604 (or (= (select (arr!47043 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47043 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47043 a!2831) index!585) (select (arr!47043 a!2831) j!81)) (not (= (select (store (arr!47043 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(assert (= (and start!123356 res!964905) b!1430485))

(assert (= (and b!1430485 res!964915) b!1430486))

(assert (= (and b!1430486 res!964908) b!1430482))

(assert (= (and b!1430482 res!964902) b!1430478))

(assert (= (and b!1430478 res!964907) b!1430479))

(assert (= (and b!1430479 res!964914) b!1430476))

(assert (= (and b!1430476 res!964912) b!1430475))

(assert (= (and b!1430475 res!964910) b!1430477))

(assert (= (and b!1430477 res!964906) b!1430481))

(assert (= (and b!1430481 res!964909) b!1430480))

(assert (= (and b!1430480 res!964903) b!1430483))

(assert (= (and b!1430483 res!964911) b!1430474))

(assert (= (and b!1430474 res!964904) b!1430484))

(assert (= (and b!1430484 res!964913) b!1430487))

(declare-fun m!1320447 () Bool)

(assert (=> b!1430484 m!1320447))

(assert (=> b!1430484 m!1320447))

(declare-fun m!1320449 () Bool)

(assert (=> b!1430484 m!1320449))

(declare-fun m!1320451 () Bool)

(assert (=> b!1430474 m!1320451))

(declare-fun m!1320453 () Bool)

(assert (=> b!1430474 m!1320453))

(declare-fun m!1320455 () Bool)

(assert (=> b!1430474 m!1320455))

(declare-fun m!1320457 () Bool)

(assert (=> b!1430474 m!1320457))

(assert (=> b!1430474 m!1320447))

(declare-fun m!1320459 () Bool)

(assert (=> b!1430474 m!1320459))

(declare-fun m!1320461 () Bool)

(assert (=> b!1430479 m!1320461))

(declare-fun m!1320463 () Bool)

(assert (=> b!1430477 m!1320463))

(assert (=> b!1430477 m!1320463))

(declare-fun m!1320465 () Bool)

(assert (=> b!1430477 m!1320465))

(assert (=> b!1430477 m!1320451))

(declare-fun m!1320467 () Bool)

(assert (=> b!1430477 m!1320467))

(declare-fun m!1320469 () Bool)

(assert (=> b!1430478 m!1320469))

(declare-fun m!1320471 () Bool)

(assert (=> start!123356 m!1320471))

(declare-fun m!1320473 () Bool)

(assert (=> start!123356 m!1320473))

(assert (=> b!1430481 m!1320447))

(assert (=> b!1430481 m!1320447))

(declare-fun m!1320475 () Bool)

(assert (=> b!1430481 m!1320475))

(assert (=> b!1430475 m!1320447))

(assert (=> b!1430475 m!1320447))

(declare-fun m!1320477 () Bool)

(assert (=> b!1430475 m!1320477))

(assert (=> b!1430475 m!1320477))

(assert (=> b!1430475 m!1320447))

(declare-fun m!1320479 () Bool)

(assert (=> b!1430475 m!1320479))

(declare-fun m!1320481 () Bool)

(assert (=> b!1430486 m!1320481))

(assert (=> b!1430486 m!1320481))

(declare-fun m!1320483 () Bool)

(assert (=> b!1430486 m!1320483))

(assert (=> b!1430487 m!1320455))

(assert (=> b!1430487 m!1320447))

(assert (=> b!1430487 m!1320451))

(assert (=> b!1430487 m!1320453))

(declare-fun m!1320485 () Bool)

(assert (=> b!1430480 m!1320485))

(assert (=> b!1430482 m!1320447))

(assert (=> b!1430482 m!1320447))

(declare-fun m!1320487 () Bool)

(assert (=> b!1430482 m!1320487))

(check-sat (not b!1430477) (not b!1430484) (not start!123356) (not b!1430486) (not b!1430482) (not b!1430479) (not b!1430475) (not b!1430478) (not b!1430481) (not b!1430480) (not b!1430474))
(check-sat)
(get-model)

(declare-fun bm!67426 () Bool)

(declare-fun call!67429 () Bool)

(assert (=> bm!67426 (= call!67429 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153665 () Bool)

(declare-fun res!964963 () Bool)

(declare-fun e!807629 () Bool)

(assert (=> d!153665 (=> res!964963 e!807629)))

(assert (=> d!153665 (= res!964963 (bvsge j!81 (size!47593 a!2831)))))

(assert (=> d!153665 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807629)))

(declare-fun b!1430538 () Bool)

(declare-fun e!807628 () Bool)

(declare-fun e!807627 () Bool)

(assert (=> b!1430538 (= e!807628 e!807627)))

(declare-fun lt!629799 () (_ BitVec 64))

(assert (=> b!1430538 (= lt!629799 (select (arr!47043 a!2831) j!81))))

(declare-fun lt!629798 () Unit!48390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97466 (_ BitVec 64) (_ BitVec 32)) Unit!48390)

(assert (=> b!1430538 (= lt!629798 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629799 j!81))))

(declare-fun arrayContainsKey!0 (array!97466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1430538 (arrayContainsKey!0 a!2831 lt!629799 #b00000000000000000000000000000000)))

(declare-fun lt!629797 () Unit!48390)

(assert (=> b!1430538 (= lt!629797 lt!629798)))

(declare-fun res!964962 () Bool)

(assert (=> b!1430538 (= res!964962 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) j!81) a!2831 mask!2608) (Found!11322 j!81)))))

(assert (=> b!1430538 (=> (not res!964962) (not e!807627))))

(declare-fun b!1430539 () Bool)

(assert (=> b!1430539 (= e!807629 e!807628)))

(declare-fun c!132282 () Bool)

(assert (=> b!1430539 (= c!132282 (validKeyInArray!0 (select (arr!47043 a!2831) j!81)))))

(declare-fun b!1430540 () Bool)

(assert (=> b!1430540 (= e!807627 call!67429)))

(declare-fun b!1430541 () Bool)

(assert (=> b!1430541 (= e!807628 call!67429)))

(assert (= (and d!153665 (not res!964963)) b!1430539))

(assert (= (and b!1430539 c!132282) b!1430538))

(assert (= (and b!1430539 (not c!132282)) b!1430541))

(assert (= (and b!1430538 res!964962) b!1430540))

(assert (= (or b!1430540 b!1430541) bm!67426))

(declare-fun m!1320531 () Bool)

(assert (=> bm!67426 m!1320531))

(assert (=> b!1430538 m!1320447))

(declare-fun m!1320533 () Bool)

(assert (=> b!1430538 m!1320533))

(declare-fun m!1320535 () Bool)

(assert (=> b!1430538 m!1320535))

(assert (=> b!1430538 m!1320447))

(assert (=> b!1430538 m!1320449))

(assert (=> b!1430539 m!1320447))

(assert (=> b!1430539 m!1320447))

(assert (=> b!1430539 m!1320487))

(assert (=> b!1430474 d!153665))

(declare-fun d!153667 () Bool)

(assert (=> d!153667 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629802 () Unit!48390)

(declare-fun choose!38 (array!97466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48390)

(assert (=> d!153667 (= lt!629802 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153667 (validMask!0 mask!2608)))

(assert (=> d!153667 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629802)))

(declare-fun bs!41669 () Bool)

(assert (= bs!41669 d!153667))

(assert (=> bs!41669 m!1320457))

(declare-fun m!1320537 () Bool)

(assert (=> bs!41669 m!1320537))

(assert (=> bs!41669 m!1320471))

(assert (=> b!1430474 d!153667))

(declare-fun lt!629811 () SeekEntryResult!11322)

(declare-fun e!807636 () SeekEntryResult!11322)

(declare-fun b!1430554 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97466 (_ BitVec 32)) SeekEntryResult!11322)

(assert (=> b!1430554 (= e!807636 (seekKeyOrZeroReturnVacant!0 (x!129314 lt!629811) (index!47682 lt!629811) (index!47682 lt!629811) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430555 () Bool)

(declare-fun e!807638 () SeekEntryResult!11322)

(assert (=> b!1430555 (= e!807638 Undefined!11322)))

(declare-fun d!153669 () Bool)

(declare-fun lt!629809 () SeekEntryResult!11322)

(get-info :version)

(assert (=> d!153669 (and (or ((_ is Undefined!11322) lt!629809) (not ((_ is Found!11322) lt!629809)) (and (bvsge (index!47681 lt!629809) #b00000000000000000000000000000000) (bvslt (index!47681 lt!629809) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!629809) ((_ is Found!11322) lt!629809) (not ((_ is MissingZero!11322) lt!629809)) (and (bvsge (index!47680 lt!629809) #b00000000000000000000000000000000) (bvslt (index!47680 lt!629809) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!629809) ((_ is Found!11322) lt!629809) ((_ is MissingZero!11322) lt!629809) (not ((_ is MissingVacant!11322) lt!629809)) (and (bvsge (index!47683 lt!629809) #b00000000000000000000000000000000) (bvslt (index!47683 lt!629809) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!629809) (ite ((_ is Found!11322) lt!629809) (= (select (arr!47043 a!2831) (index!47681 lt!629809)) (select (arr!47043 a!2831) j!81)) (ite ((_ is MissingZero!11322) lt!629809) (= (select (arr!47043 a!2831) (index!47680 lt!629809)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11322) lt!629809) (= (select (arr!47043 a!2831) (index!47683 lt!629809)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153669 (= lt!629809 e!807638)))

(declare-fun c!132291 () Bool)

(assert (=> d!153669 (= c!132291 (and ((_ is Intermediate!11322) lt!629811) (undefined!12134 lt!629811)))))

(assert (=> d!153669 (= lt!629811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153669 (validMask!0 mask!2608)))

(assert (=> d!153669 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629809)))

(declare-fun b!1430556 () Bool)

(declare-fun e!807637 () SeekEntryResult!11322)

(assert (=> b!1430556 (= e!807637 (Found!11322 (index!47682 lt!629811)))))

(declare-fun b!1430557 () Bool)

(assert (=> b!1430557 (= e!807636 (MissingZero!11322 (index!47682 lt!629811)))))

(declare-fun b!1430558 () Bool)

(declare-fun c!132290 () Bool)

(declare-fun lt!629810 () (_ BitVec 64))

(assert (=> b!1430558 (= c!132290 (= lt!629810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430558 (= e!807637 e!807636)))

(declare-fun b!1430559 () Bool)

(assert (=> b!1430559 (= e!807638 e!807637)))

(assert (=> b!1430559 (= lt!629810 (select (arr!47043 a!2831) (index!47682 lt!629811)))))

(declare-fun c!132289 () Bool)

(assert (=> b!1430559 (= c!132289 (= lt!629810 (select (arr!47043 a!2831) j!81)))))

(assert (= (and d!153669 c!132291) b!1430555))

(assert (= (and d!153669 (not c!132291)) b!1430559))

(assert (= (and b!1430559 c!132289) b!1430556))

(assert (= (and b!1430559 (not c!132289)) b!1430558))

(assert (= (and b!1430558 c!132290) b!1430557))

(assert (= (and b!1430558 (not c!132290)) b!1430554))

(assert (=> b!1430554 m!1320447))

(declare-fun m!1320539 () Bool)

(assert (=> b!1430554 m!1320539))

(assert (=> d!153669 m!1320477))

(assert (=> d!153669 m!1320447))

(assert (=> d!153669 m!1320479))

(declare-fun m!1320541 () Bool)

(assert (=> d!153669 m!1320541))

(assert (=> d!153669 m!1320471))

(assert (=> d!153669 m!1320447))

(assert (=> d!153669 m!1320477))

(declare-fun m!1320543 () Bool)

(assert (=> d!153669 m!1320543))

(declare-fun m!1320545 () Bool)

(assert (=> d!153669 m!1320545))

(declare-fun m!1320547 () Bool)

(assert (=> b!1430559 m!1320547))

(assert (=> b!1430484 d!153669))

(declare-fun e!807666 () SeekEntryResult!11322)

(declare-fun b!1430598 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430598 (= e!807666 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(declare-fun e!807663 () SeekEntryResult!11322)

(declare-fun b!1430599 () Bool)

(assert (=> b!1430599 (= e!807663 (Intermediate!11322 true (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430600 () Bool)

(declare-fun lt!629829 () SeekEntryResult!11322)

(assert (=> b!1430600 (and (bvsge (index!47682 lt!629829) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629829) (size!47593 a!2831)))))

(declare-fun res!964977 () Bool)

(assert (=> b!1430600 (= res!964977 (= (select (arr!47043 a!2831) (index!47682 lt!629829)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807662 () Bool)

(assert (=> b!1430600 (=> res!964977 e!807662)))

(declare-fun b!1430601 () Bool)

(assert (=> b!1430601 (and (bvsge (index!47682 lt!629829) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629829) (size!47593 a!2831)))))

(declare-fun res!964978 () Bool)

(assert (=> b!1430601 (= res!964978 (= (select (arr!47043 a!2831) (index!47682 lt!629829)) (select (arr!47043 a!2831) j!81)))))

(assert (=> b!1430601 (=> res!964978 e!807662)))

(declare-fun e!807664 () Bool)

(assert (=> b!1430601 (= e!807664 e!807662)))

(declare-fun b!1430602 () Bool)

(declare-fun e!807665 () Bool)

(assert (=> b!1430602 (= e!807665 (bvsge (x!129314 lt!629829) #b01111111111111111111111111111110))))

(declare-fun d!153671 () Bool)

(assert (=> d!153671 e!807665))

(declare-fun c!132305 () Bool)

(assert (=> d!153671 (= c!132305 (and ((_ is Intermediate!11322) lt!629829) (undefined!12134 lt!629829)))))

(assert (=> d!153671 (= lt!629829 e!807663)))

(declare-fun c!132307 () Bool)

(assert (=> d!153671 (= c!132307 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629830 () (_ BitVec 64))

(assert (=> d!153671 (= lt!629830 (select (arr!47043 a!2831) (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608)))))

(assert (=> d!153671 (validMask!0 mask!2608)))

(assert (=> d!153671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629829)))

(declare-fun b!1430603 () Bool)

(assert (=> b!1430603 (= e!807665 e!807664)))

(declare-fun res!964976 () Bool)

(assert (=> b!1430603 (= res!964976 (and ((_ is Intermediate!11322) lt!629829) (not (undefined!12134 lt!629829)) (bvslt (x!129314 lt!629829) #b01111111111111111111111111111110) (bvsge (x!129314 lt!629829) #b00000000000000000000000000000000) (bvsge (x!129314 lt!629829) #b00000000000000000000000000000000)))))

(assert (=> b!1430603 (=> (not res!964976) (not e!807664))))

(declare-fun b!1430604 () Bool)

(assert (=> b!1430604 (= e!807666 (Intermediate!11322 false (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430605 () Bool)

(assert (=> b!1430605 (and (bvsge (index!47682 lt!629829) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629829) (size!47593 a!2831)))))

(assert (=> b!1430605 (= e!807662 (= (select (arr!47043 a!2831) (index!47682 lt!629829)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430606 () Bool)

(assert (=> b!1430606 (= e!807663 e!807666)))

(declare-fun c!132306 () Bool)

(assert (=> b!1430606 (= c!132306 (or (= lt!629830 (select (arr!47043 a!2831) j!81)) (= (bvadd lt!629830 lt!629830) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153671 c!132307) b!1430599))

(assert (= (and d!153671 (not c!132307)) b!1430606))

(assert (= (and b!1430606 c!132306) b!1430604))

(assert (= (and b!1430606 (not c!132306)) b!1430598))

(assert (= (and d!153671 c!132305) b!1430602))

(assert (= (and d!153671 (not c!132305)) b!1430603))

(assert (= (and b!1430603 res!964976) b!1430601))

(assert (= (and b!1430601 (not res!964978)) b!1430600))

(assert (= (and b!1430600 (not res!964977)) b!1430605))

(declare-fun m!1320561 () Bool)

(assert (=> b!1430600 m!1320561))

(assert (=> b!1430601 m!1320561))

(assert (=> b!1430605 m!1320561))

(assert (=> d!153671 m!1320477))

(declare-fun m!1320563 () Bool)

(assert (=> d!153671 m!1320563))

(assert (=> d!153671 m!1320471))

(assert (=> b!1430598 m!1320477))

(declare-fun m!1320565 () Bool)

(assert (=> b!1430598 m!1320565))

(assert (=> b!1430598 m!1320565))

(assert (=> b!1430598 m!1320447))

(declare-fun m!1320567 () Bool)

(assert (=> b!1430598 m!1320567))

(assert (=> b!1430475 d!153671))

(declare-fun d!153681 () Bool)

(declare-fun lt!629838 () (_ BitVec 32))

(declare-fun lt!629837 () (_ BitVec 32))

(assert (=> d!153681 (= lt!629838 (bvmul (bvxor lt!629837 (bvlshr lt!629837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153681 (= lt!629837 ((_ extract 31 0) (bvand (bvxor (select (arr!47043 a!2831) j!81) (bvlshr (select (arr!47043 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153681 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964985 (let ((h!34868 ((_ extract 31 0) (bvand (bvxor (select (arr!47043 a!2831) j!81) (bvlshr (select (arr!47043 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129318 (bvmul (bvxor h!34868 (bvlshr h!34868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129318 (bvlshr x!129318 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964985 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964985 #b00000000000000000000000000000000))))))

(assert (=> d!153681 (= (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) (bvand (bvxor lt!629838 (bvlshr lt!629838 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430475 d!153681))

(declare-fun d!153685 () Bool)

(assert (=> d!153685 (= (validKeyInArray!0 (select (arr!47043 a!2831) i!982)) (and (not (= (select (arr!47043 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47043 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430486 d!153685))

(declare-fun bm!67430 () Bool)

(declare-fun call!67433 () Bool)

(assert (=> bm!67430 (= call!67433 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153687 () Bool)

(declare-fun res!964991 () Bool)

(declare-fun e!807680 () Bool)

(assert (=> d!153687 (=> res!964991 e!807680)))

(assert (=> d!153687 (= res!964991 (bvsge #b00000000000000000000000000000000 (size!47593 a!2831)))))

(assert (=> d!153687 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807680)))

(declare-fun b!1430626 () Bool)

(declare-fun e!807679 () Bool)

(declare-fun e!807678 () Bool)

(assert (=> b!1430626 (= e!807679 e!807678)))

(declare-fun lt!629841 () (_ BitVec 64))

(assert (=> b!1430626 (= lt!629841 (select (arr!47043 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629840 () Unit!48390)

(assert (=> b!1430626 (= lt!629840 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629841 #b00000000000000000000000000000000))))

(assert (=> b!1430626 (arrayContainsKey!0 a!2831 lt!629841 #b00000000000000000000000000000000)))

(declare-fun lt!629839 () Unit!48390)

(assert (=> b!1430626 (= lt!629839 lt!629840)))

(declare-fun res!964990 () Bool)

(assert (=> b!1430626 (= res!964990 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11322 #b00000000000000000000000000000000)))))

(assert (=> b!1430626 (=> (not res!964990) (not e!807678))))

(declare-fun b!1430627 () Bool)

(assert (=> b!1430627 (= e!807680 e!807679)))

(declare-fun c!132313 () Bool)

(assert (=> b!1430627 (= c!132313 (validKeyInArray!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430628 () Bool)

(assert (=> b!1430628 (= e!807678 call!67433)))

(declare-fun b!1430629 () Bool)

(assert (=> b!1430629 (= e!807679 call!67433)))

(assert (= (and d!153687 (not res!964991)) b!1430627))

(assert (= (and b!1430627 c!132313) b!1430626))

(assert (= (and b!1430627 (not c!132313)) b!1430629))

(assert (= (and b!1430626 res!964990) b!1430628))

(assert (= (or b!1430628 b!1430629) bm!67430))

(declare-fun m!1320577 () Bool)

(assert (=> bm!67430 m!1320577))

(declare-fun m!1320579 () Bool)

(assert (=> b!1430626 m!1320579))

(declare-fun m!1320581 () Bool)

(assert (=> b!1430626 m!1320581))

(declare-fun m!1320583 () Bool)

(assert (=> b!1430626 m!1320583))

(assert (=> b!1430626 m!1320579))

(declare-fun m!1320585 () Bool)

(assert (=> b!1430626 m!1320585))

(assert (=> b!1430627 m!1320579))

(assert (=> b!1430627 m!1320579))

(declare-fun m!1320587 () Bool)

(assert (=> b!1430627 m!1320587))

(assert (=> b!1430478 d!153687))

(declare-fun b!1430630 () Bool)

(declare-fun e!807685 () SeekEntryResult!11322)

(assert (=> b!1430630 (= e!807685 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629771 lt!629772 mask!2608))))

(declare-fun b!1430631 () Bool)

(declare-fun e!807682 () SeekEntryResult!11322)

(assert (=> b!1430631 (= e!807682 (Intermediate!11322 true (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430632 () Bool)

(declare-fun lt!629842 () SeekEntryResult!11322)

(assert (=> b!1430632 (and (bvsge (index!47682 lt!629842) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629842) (size!47593 lt!629772)))))

(declare-fun res!964993 () Bool)

(assert (=> b!1430632 (= res!964993 (= (select (arr!47043 lt!629772) (index!47682 lt!629842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807681 () Bool)

(assert (=> b!1430632 (=> res!964993 e!807681)))

(declare-fun b!1430633 () Bool)

(assert (=> b!1430633 (and (bvsge (index!47682 lt!629842) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629842) (size!47593 lt!629772)))))

(declare-fun res!964994 () Bool)

(assert (=> b!1430633 (= res!964994 (= (select (arr!47043 lt!629772) (index!47682 lt!629842)) lt!629771))))

(assert (=> b!1430633 (=> res!964994 e!807681)))

(declare-fun e!807683 () Bool)

(assert (=> b!1430633 (= e!807683 e!807681)))

(declare-fun b!1430634 () Bool)

(declare-fun e!807684 () Bool)

(assert (=> b!1430634 (= e!807684 (bvsge (x!129314 lt!629842) #b01111111111111111111111111111110))))

(declare-fun d!153689 () Bool)

(assert (=> d!153689 e!807684))

(declare-fun c!132314 () Bool)

(assert (=> d!153689 (= c!132314 (and ((_ is Intermediate!11322) lt!629842) (undefined!12134 lt!629842)))))

(assert (=> d!153689 (= lt!629842 e!807682)))

(declare-fun c!132316 () Bool)

(assert (=> d!153689 (= c!132316 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629843 () (_ BitVec 64))

(assert (=> d!153689 (= lt!629843 (select (arr!47043 lt!629772) (toIndex!0 lt!629771 mask!2608)))))

(assert (=> d!153689 (validMask!0 mask!2608)))

(assert (=> d!153689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629771 mask!2608) lt!629771 lt!629772 mask!2608) lt!629842)))

(declare-fun b!1430635 () Bool)

(assert (=> b!1430635 (= e!807684 e!807683)))

(declare-fun res!964992 () Bool)

(assert (=> b!1430635 (= res!964992 (and ((_ is Intermediate!11322) lt!629842) (not (undefined!12134 lt!629842)) (bvslt (x!129314 lt!629842) #b01111111111111111111111111111110) (bvsge (x!129314 lt!629842) #b00000000000000000000000000000000) (bvsge (x!129314 lt!629842) #b00000000000000000000000000000000)))))

(assert (=> b!1430635 (=> (not res!964992) (not e!807683))))

(declare-fun b!1430636 () Bool)

(assert (=> b!1430636 (= e!807685 (Intermediate!11322 false (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430637 () Bool)

(assert (=> b!1430637 (and (bvsge (index!47682 lt!629842) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629842) (size!47593 lt!629772)))))

(assert (=> b!1430637 (= e!807681 (= (select (arr!47043 lt!629772) (index!47682 lt!629842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430638 () Bool)

(assert (=> b!1430638 (= e!807682 e!807685)))

(declare-fun c!132315 () Bool)

(assert (=> b!1430638 (= c!132315 (or (= lt!629843 lt!629771) (= (bvadd lt!629843 lt!629843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153689 c!132316) b!1430631))

(assert (= (and d!153689 (not c!132316)) b!1430638))

(assert (= (and b!1430638 c!132315) b!1430636))

(assert (= (and b!1430638 (not c!132315)) b!1430630))

(assert (= (and d!153689 c!132314) b!1430634))

(assert (= (and d!153689 (not c!132314)) b!1430635))

(assert (= (and b!1430635 res!964992) b!1430633))

(assert (= (and b!1430633 (not res!964994)) b!1430632))

(assert (= (and b!1430632 (not res!964993)) b!1430637))

(declare-fun m!1320589 () Bool)

(assert (=> b!1430632 m!1320589))

(assert (=> b!1430633 m!1320589))

(assert (=> b!1430637 m!1320589))

(assert (=> d!153689 m!1320463))

(declare-fun m!1320591 () Bool)

(assert (=> d!153689 m!1320591))

(assert (=> d!153689 m!1320471))

(assert (=> b!1430630 m!1320463))

(declare-fun m!1320593 () Bool)

(assert (=> b!1430630 m!1320593))

(assert (=> b!1430630 m!1320593))

(declare-fun m!1320595 () Bool)

(assert (=> b!1430630 m!1320595))

(assert (=> b!1430477 d!153689))

(declare-fun d!153691 () Bool)

(declare-fun lt!629845 () (_ BitVec 32))

(declare-fun lt!629844 () (_ BitVec 32))

(assert (=> d!153691 (= lt!629845 (bvmul (bvxor lt!629844 (bvlshr lt!629844 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153691 (= lt!629844 ((_ extract 31 0) (bvand (bvxor lt!629771 (bvlshr lt!629771 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153691 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964985 (let ((h!34868 ((_ extract 31 0) (bvand (bvxor lt!629771 (bvlshr lt!629771 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129318 (bvmul (bvxor h!34868 (bvlshr h!34868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129318 (bvlshr x!129318 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964985 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964985 #b00000000000000000000000000000000))))))

(assert (=> d!153691 (= (toIndex!0 lt!629771 mask!2608) (bvand (bvxor lt!629845 (bvlshr lt!629845 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430477 d!153691))

(declare-fun d!153693 () Bool)

(declare-fun res!965010 () Bool)

(declare-fun e!807711 () Bool)

(assert (=> d!153693 (=> res!965010 e!807711)))

(assert (=> d!153693 (= res!965010 (bvsge #b00000000000000000000000000000000 (size!47593 a!2831)))))

(assert (=> d!153693 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33550) e!807711)))

(declare-fun b!1430676 () Bool)

(declare-fun e!807709 () Bool)

(assert (=> b!1430676 (= e!807711 e!807709)))

(declare-fun res!965011 () Bool)

(assert (=> b!1430676 (=> (not res!965011) (not e!807709))))

(declare-fun e!807712 () Bool)

(assert (=> b!1430676 (= res!965011 (not e!807712))))

(declare-fun res!965012 () Bool)

(assert (=> b!1430676 (=> (not res!965012) (not e!807712))))

(assert (=> b!1430676 (= res!965012 (validKeyInArray!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67433 () Bool)

(declare-fun call!67436 () Bool)

(declare-fun c!132328 () Bool)

(assert (=> bm!67433 (= call!67436 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132328 (Cons!33549 (select (arr!47043 a!2831) #b00000000000000000000000000000000) Nil!33550) Nil!33550)))))

(declare-fun b!1430677 () Bool)

(declare-fun e!807710 () Bool)

(assert (=> b!1430677 (= e!807709 e!807710)))

(assert (=> b!1430677 (= c!132328 (validKeyInArray!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430678 () Bool)

(assert (=> b!1430678 (= e!807710 call!67436)))

(declare-fun b!1430679 () Bool)

(assert (=> b!1430679 (= e!807710 call!67436)))

(declare-fun b!1430680 () Bool)

(declare-fun contains!9861 (List!33553 (_ BitVec 64)) Bool)

(assert (=> b!1430680 (= e!807712 (contains!9861 Nil!33550 (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153693 (not res!965010)) b!1430676))

(assert (= (and b!1430676 res!965012) b!1430680))

(assert (= (and b!1430676 res!965011) b!1430677))

(assert (= (and b!1430677 c!132328) b!1430678))

(assert (= (and b!1430677 (not c!132328)) b!1430679))

(assert (= (or b!1430678 b!1430679) bm!67433))

(assert (=> b!1430676 m!1320579))

(assert (=> b!1430676 m!1320579))

(assert (=> b!1430676 m!1320587))

(assert (=> bm!67433 m!1320579))

(declare-fun m!1320597 () Bool)

(assert (=> bm!67433 m!1320597))

(assert (=> b!1430677 m!1320579))

(assert (=> b!1430677 m!1320579))

(assert (=> b!1430677 m!1320587))

(assert (=> b!1430680 m!1320579))

(assert (=> b!1430680 m!1320579))

(declare-fun m!1320605 () Bool)

(assert (=> b!1430680 m!1320605))

(assert (=> b!1430479 d!153693))

(declare-fun d!153697 () Bool)

(assert (=> d!153697 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123356 d!153697))

(declare-fun d!153705 () Bool)

(assert (=> d!153705 (= (array_inv!36071 a!2831) (bvsge (size!47593 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123356 d!153705))

(declare-fun b!1430717 () Bool)

(declare-fun e!807740 () SeekEntryResult!11322)

(assert (=> b!1430717 (= e!807740 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629771 lt!629772 mask!2608))))

(declare-fun b!1430718 () Bool)

(declare-fun e!807737 () SeekEntryResult!11322)

(assert (=> b!1430718 (= e!807737 (Intermediate!11322 true index!585 x!605))))

(declare-fun b!1430719 () Bool)

(declare-fun lt!629866 () SeekEntryResult!11322)

(assert (=> b!1430719 (and (bvsge (index!47682 lt!629866) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629866) (size!47593 lt!629772)))))

(declare-fun res!965027 () Bool)

(assert (=> b!1430719 (= res!965027 (= (select (arr!47043 lt!629772) (index!47682 lt!629866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807736 () Bool)

(assert (=> b!1430719 (=> res!965027 e!807736)))

(declare-fun b!1430720 () Bool)

(assert (=> b!1430720 (and (bvsge (index!47682 lt!629866) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629866) (size!47593 lt!629772)))))

(declare-fun res!965028 () Bool)

(assert (=> b!1430720 (= res!965028 (= (select (arr!47043 lt!629772) (index!47682 lt!629866)) lt!629771))))

(assert (=> b!1430720 (=> res!965028 e!807736)))

(declare-fun e!807738 () Bool)

(assert (=> b!1430720 (= e!807738 e!807736)))

(declare-fun b!1430721 () Bool)

(declare-fun e!807739 () Bool)

(assert (=> b!1430721 (= e!807739 (bvsge (x!129314 lt!629866) #b01111111111111111111111111111110))))

(declare-fun d!153707 () Bool)

(assert (=> d!153707 e!807739))

(declare-fun c!132341 () Bool)

(assert (=> d!153707 (= c!132341 (and ((_ is Intermediate!11322) lt!629866) (undefined!12134 lt!629866)))))

(assert (=> d!153707 (= lt!629866 e!807737)))

(declare-fun c!132343 () Bool)

(assert (=> d!153707 (= c!132343 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629867 () (_ BitVec 64))

(assert (=> d!153707 (= lt!629867 (select (arr!47043 lt!629772) index!585))))

(assert (=> d!153707 (validMask!0 mask!2608)))

(assert (=> d!153707 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629771 lt!629772 mask!2608) lt!629866)))

(declare-fun b!1430722 () Bool)

(assert (=> b!1430722 (= e!807739 e!807738)))

(declare-fun res!965026 () Bool)

(assert (=> b!1430722 (= res!965026 (and ((_ is Intermediate!11322) lt!629866) (not (undefined!12134 lt!629866)) (bvslt (x!129314 lt!629866) #b01111111111111111111111111111110) (bvsge (x!129314 lt!629866) #b00000000000000000000000000000000) (bvsge (x!129314 lt!629866) x!605)))))

(assert (=> b!1430722 (=> (not res!965026) (not e!807738))))

(declare-fun b!1430723 () Bool)

(assert (=> b!1430723 (= e!807740 (Intermediate!11322 false index!585 x!605))))

(declare-fun b!1430724 () Bool)

(assert (=> b!1430724 (and (bvsge (index!47682 lt!629866) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629866) (size!47593 lt!629772)))))

(assert (=> b!1430724 (= e!807736 (= (select (arr!47043 lt!629772) (index!47682 lt!629866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430725 () Bool)

(assert (=> b!1430725 (= e!807737 e!807740)))

(declare-fun c!132342 () Bool)

(assert (=> b!1430725 (= c!132342 (or (= lt!629867 lt!629771) (= (bvadd lt!629867 lt!629867) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153707 c!132343) b!1430718))

(assert (= (and d!153707 (not c!132343)) b!1430725))

(assert (= (and b!1430725 c!132342) b!1430723))

(assert (= (and b!1430725 (not c!132342)) b!1430717))

(assert (= (and d!153707 c!132341) b!1430721))

(assert (= (and d!153707 (not c!132341)) b!1430722))

(assert (= (and b!1430722 res!965026) b!1430720))

(assert (= (and b!1430720 (not res!965028)) b!1430719))

(assert (= (and b!1430719 (not res!965027)) b!1430724))

(declare-fun m!1320621 () Bool)

(assert (=> b!1430719 m!1320621))

(assert (=> b!1430720 m!1320621))

(assert (=> b!1430724 m!1320621))

(declare-fun m!1320623 () Bool)

(assert (=> d!153707 m!1320623))

(assert (=> d!153707 m!1320471))

(declare-fun m!1320625 () Bool)

(assert (=> b!1430717 m!1320625))

(assert (=> b!1430717 m!1320625))

(declare-fun m!1320627 () Bool)

(assert (=> b!1430717 m!1320627))

(assert (=> b!1430480 d!153707))

(declare-fun d!153709 () Bool)

(assert (=> d!153709 (= (validKeyInArray!0 (select (arr!47043 a!2831) j!81)) (and (not (= (select (arr!47043 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47043 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430482 d!153709))

(declare-fun e!807745 () SeekEntryResult!11322)

(declare-fun b!1430726 () Bool)

(assert (=> b!1430726 (= e!807745 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430727 () Bool)

(declare-fun e!807742 () SeekEntryResult!11322)

(assert (=> b!1430727 (= e!807742 (Intermediate!11322 true index!585 x!605))))

(declare-fun b!1430728 () Bool)

(declare-fun lt!629868 () SeekEntryResult!11322)

(assert (=> b!1430728 (and (bvsge (index!47682 lt!629868) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629868) (size!47593 a!2831)))))

(declare-fun res!965030 () Bool)

(assert (=> b!1430728 (= res!965030 (= (select (arr!47043 a!2831) (index!47682 lt!629868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807741 () Bool)

(assert (=> b!1430728 (=> res!965030 e!807741)))

(declare-fun b!1430729 () Bool)

(assert (=> b!1430729 (and (bvsge (index!47682 lt!629868) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629868) (size!47593 a!2831)))))

(declare-fun res!965031 () Bool)

(assert (=> b!1430729 (= res!965031 (= (select (arr!47043 a!2831) (index!47682 lt!629868)) (select (arr!47043 a!2831) j!81)))))

(assert (=> b!1430729 (=> res!965031 e!807741)))

(declare-fun e!807743 () Bool)

(assert (=> b!1430729 (= e!807743 e!807741)))

(declare-fun b!1430730 () Bool)

(declare-fun e!807744 () Bool)

(assert (=> b!1430730 (= e!807744 (bvsge (x!129314 lt!629868) #b01111111111111111111111111111110))))

(declare-fun d!153711 () Bool)

(assert (=> d!153711 e!807744))

(declare-fun c!132344 () Bool)

(assert (=> d!153711 (= c!132344 (and ((_ is Intermediate!11322) lt!629868) (undefined!12134 lt!629868)))))

(assert (=> d!153711 (= lt!629868 e!807742)))

(declare-fun c!132346 () Bool)

(assert (=> d!153711 (= c!132346 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629869 () (_ BitVec 64))

(assert (=> d!153711 (= lt!629869 (select (arr!47043 a!2831) index!585))))

(assert (=> d!153711 (validMask!0 mask!2608)))

(assert (=> d!153711 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629868)))

(declare-fun b!1430731 () Bool)

(assert (=> b!1430731 (= e!807744 e!807743)))

(declare-fun res!965029 () Bool)

(assert (=> b!1430731 (= res!965029 (and ((_ is Intermediate!11322) lt!629868) (not (undefined!12134 lt!629868)) (bvslt (x!129314 lt!629868) #b01111111111111111111111111111110) (bvsge (x!129314 lt!629868) #b00000000000000000000000000000000) (bvsge (x!129314 lt!629868) x!605)))))

(assert (=> b!1430731 (=> (not res!965029) (not e!807743))))

(declare-fun b!1430732 () Bool)

(assert (=> b!1430732 (= e!807745 (Intermediate!11322 false index!585 x!605))))

(declare-fun b!1430733 () Bool)

(assert (=> b!1430733 (and (bvsge (index!47682 lt!629868) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629868) (size!47593 a!2831)))))

(assert (=> b!1430733 (= e!807741 (= (select (arr!47043 a!2831) (index!47682 lt!629868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430734 () Bool)

(assert (=> b!1430734 (= e!807742 e!807745)))

(declare-fun c!132345 () Bool)

(assert (=> b!1430734 (= c!132345 (or (= lt!629869 (select (arr!47043 a!2831) j!81)) (= (bvadd lt!629869 lt!629869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153711 c!132346) b!1430727))

(assert (= (and d!153711 (not c!132346)) b!1430734))

(assert (= (and b!1430734 c!132345) b!1430732))

(assert (= (and b!1430734 (not c!132345)) b!1430726))

(assert (= (and d!153711 c!132344) b!1430730))

(assert (= (and d!153711 (not c!132344)) b!1430731))

(assert (= (and b!1430731 res!965029) b!1430729))

(assert (= (and b!1430729 (not res!965031)) b!1430728))

(assert (= (and b!1430728 (not res!965030)) b!1430733))

(declare-fun m!1320629 () Bool)

(assert (=> b!1430728 m!1320629))

(assert (=> b!1430729 m!1320629))

(assert (=> b!1430733 m!1320629))

(assert (=> d!153711 m!1320455))

(assert (=> d!153711 m!1320471))

(assert (=> b!1430726 m!1320625))

(assert (=> b!1430726 m!1320625))

(assert (=> b!1430726 m!1320447))

(declare-fun m!1320631 () Bool)

(assert (=> b!1430726 m!1320631))

(assert (=> b!1430481 d!153711))

(check-sat (not b!1430676) (not b!1430538) (not bm!67426) (not d!153707) (not bm!67430) (not d!153689) (not b!1430539) (not d!153711) (not d!153667) (not b!1430626) (not b!1430627) (not b!1430726) (not b!1430717) (not d!153669) (not b!1430598) (not d!153671) (not b!1430677) (not b!1430554) (not bm!67433) (not b!1430630) (not b!1430680))
(check-sat)
(get-model)

(declare-fun d!153813 () Bool)

(assert (=> d!153813 (= (validKeyInArray!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000)) (and (not (= (select (arr!47043 a!2831) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47043 a!2831) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430677 d!153813))

(assert (=> d!153689 d!153697))

(declare-fun b!1430977 () Bool)

(declare-fun e!807906 () SeekEntryResult!11322)

(assert (=> b!1430977 (= e!807906 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430978 () Bool)

(declare-fun e!807903 () SeekEntryResult!11322)

(assert (=> b!1430978 (= e!807903 (Intermediate!11322 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430979 () Bool)

(declare-fun lt!629980 () SeekEntryResult!11322)

(assert (=> b!1430979 (and (bvsge (index!47682 lt!629980) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629980) (size!47593 a!2831)))))

(declare-fun res!965121 () Bool)

(assert (=> b!1430979 (= res!965121 (= (select (arr!47043 a!2831) (index!47682 lt!629980)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807902 () Bool)

(assert (=> b!1430979 (=> res!965121 e!807902)))

(declare-fun b!1430980 () Bool)

(assert (=> b!1430980 (and (bvsge (index!47682 lt!629980) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629980) (size!47593 a!2831)))))

(declare-fun res!965122 () Bool)

(assert (=> b!1430980 (= res!965122 (= (select (arr!47043 a!2831) (index!47682 lt!629980)) (select (arr!47043 a!2831) j!81)))))

(assert (=> b!1430980 (=> res!965122 e!807902)))

(declare-fun e!807904 () Bool)

(assert (=> b!1430980 (= e!807904 e!807902)))

(declare-fun b!1430981 () Bool)

(declare-fun e!807905 () Bool)

(assert (=> b!1430981 (= e!807905 (bvsge (x!129314 lt!629980) #b01111111111111111111111111111110))))

(declare-fun d!153817 () Bool)

(assert (=> d!153817 e!807905))

(declare-fun c!132424 () Bool)

(assert (=> d!153817 (= c!132424 (and ((_ is Intermediate!11322) lt!629980) (undefined!12134 lt!629980)))))

(assert (=> d!153817 (= lt!629980 e!807903)))

(declare-fun c!132426 () Bool)

(assert (=> d!153817 (= c!132426 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629981 () (_ BitVec 64))

(assert (=> d!153817 (= lt!629981 (select (arr!47043 a!2831) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153817 (validMask!0 mask!2608)))

(assert (=> d!153817 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629980)))

(declare-fun b!1430982 () Bool)

(assert (=> b!1430982 (= e!807905 e!807904)))

(declare-fun res!965120 () Bool)

(assert (=> b!1430982 (= res!965120 (and ((_ is Intermediate!11322) lt!629980) (not (undefined!12134 lt!629980)) (bvslt (x!129314 lt!629980) #b01111111111111111111111111111110) (bvsge (x!129314 lt!629980) #b00000000000000000000000000000000) (bvsge (x!129314 lt!629980) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1430982 (=> (not res!965120) (not e!807904))))

(declare-fun b!1430983 () Bool)

(assert (=> b!1430983 (= e!807906 (Intermediate!11322 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430984 () Bool)

(assert (=> b!1430984 (and (bvsge (index!47682 lt!629980) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629980) (size!47593 a!2831)))))

(assert (=> b!1430984 (= e!807902 (= (select (arr!47043 a!2831) (index!47682 lt!629980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430985 () Bool)

(assert (=> b!1430985 (= e!807903 e!807906)))

(declare-fun c!132425 () Bool)

(assert (=> b!1430985 (= c!132425 (or (= lt!629981 (select (arr!47043 a!2831) j!81)) (= (bvadd lt!629981 lt!629981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153817 c!132426) b!1430978))

(assert (= (and d!153817 (not c!132426)) b!1430985))

(assert (= (and b!1430985 c!132425) b!1430983))

(assert (= (and b!1430985 (not c!132425)) b!1430977))

(assert (= (and d!153817 c!132424) b!1430981))

(assert (= (and d!153817 (not c!132424)) b!1430982))

(assert (= (and b!1430982 res!965120) b!1430980))

(assert (= (and b!1430980 (not res!965122)) b!1430979))

(assert (= (and b!1430979 (not res!965121)) b!1430984))

(declare-fun m!1320881 () Bool)

(assert (=> b!1430979 m!1320881))

(assert (=> b!1430980 m!1320881))

(assert (=> b!1430984 m!1320881))

(assert (=> d!153817 m!1320625))

(declare-fun m!1320883 () Bool)

(assert (=> d!153817 m!1320883))

(assert (=> d!153817 m!1320471))

(assert (=> b!1430977 m!1320625))

(declare-fun m!1320885 () Bool)

(assert (=> b!1430977 m!1320885))

(assert (=> b!1430977 m!1320885))

(assert (=> b!1430977 m!1320447))

(declare-fun m!1320887 () Bool)

(assert (=> b!1430977 m!1320887))

(assert (=> b!1430726 d!153817))

(declare-fun d!153821 () Bool)

(declare-fun lt!629986 () (_ BitVec 32))

(assert (=> d!153821 (and (bvsge lt!629986 #b00000000000000000000000000000000) (bvslt lt!629986 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!153821 (= lt!629986 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!153821 (validMask!0 mask!2608)))

(assert (=> d!153821 (= (nextIndex!0 index!585 x!605 mask!2608) lt!629986)))

(declare-fun bs!41680 () Bool)

(assert (= bs!41680 d!153821))

(declare-fun m!1320897 () Bool)

(assert (=> bs!41680 m!1320897))

(assert (=> bs!41680 m!1320471))

(assert (=> b!1430726 d!153821))

(declare-fun bm!67451 () Bool)

(declare-fun call!67454 () Bool)

(assert (=> bm!67451 (= call!67454 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153825 () Bool)

(declare-fun res!965127 () Bool)

(declare-fun e!807914 () Bool)

(assert (=> d!153825 (=> res!965127 e!807914)))

(assert (=> d!153825 (= res!965127 (bvsge (bvadd j!81 #b00000000000000000000000000000001) (size!47593 a!2831)))))

(assert (=> d!153825 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608) e!807914)))

(declare-fun b!1430995 () Bool)

(declare-fun e!807913 () Bool)

(declare-fun e!807912 () Bool)

(assert (=> b!1430995 (= e!807913 e!807912)))

(declare-fun lt!629991 () (_ BitVec 64))

(assert (=> b!1430995 (= lt!629991 (select (arr!47043 a!2831) (bvadd j!81 #b00000000000000000000000000000001)))))

(declare-fun lt!629990 () Unit!48390)

(assert (=> b!1430995 (= lt!629990 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629991 (bvadd j!81 #b00000000000000000000000000000001)))))

(assert (=> b!1430995 (arrayContainsKey!0 a!2831 lt!629991 #b00000000000000000000000000000000)))

(declare-fun lt!629989 () Unit!48390)

(assert (=> b!1430995 (= lt!629989 lt!629990)))

(declare-fun res!965126 () Bool)

(assert (=> b!1430995 (= res!965126 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) (bvadd j!81 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11322 (bvadd j!81 #b00000000000000000000000000000001))))))

(assert (=> b!1430995 (=> (not res!965126) (not e!807912))))

(declare-fun b!1430996 () Bool)

(assert (=> b!1430996 (= e!807914 e!807913)))

(declare-fun c!132430 () Bool)

(assert (=> b!1430996 (= c!132430 (validKeyInArray!0 (select (arr!47043 a!2831) (bvadd j!81 #b00000000000000000000000000000001))))))

(declare-fun b!1430997 () Bool)

(assert (=> b!1430997 (= e!807912 call!67454)))

(declare-fun b!1430998 () Bool)

(assert (=> b!1430998 (= e!807913 call!67454)))

(assert (= (and d!153825 (not res!965127)) b!1430996))

(assert (= (and b!1430996 c!132430) b!1430995))

(assert (= (and b!1430996 (not c!132430)) b!1430998))

(assert (= (and b!1430995 res!965126) b!1430997))

(assert (= (or b!1430997 b!1430998) bm!67451))

(declare-fun m!1320899 () Bool)

(assert (=> bm!67451 m!1320899))

(declare-fun m!1320901 () Bool)

(assert (=> b!1430995 m!1320901))

(declare-fun m!1320903 () Bool)

(assert (=> b!1430995 m!1320903))

(declare-fun m!1320905 () Bool)

(assert (=> b!1430995 m!1320905))

(assert (=> b!1430995 m!1320901))

(declare-fun m!1320909 () Bool)

(assert (=> b!1430995 m!1320909))

(assert (=> b!1430996 m!1320901))

(assert (=> b!1430996 m!1320901))

(declare-fun m!1320911 () Bool)

(assert (=> b!1430996 m!1320911))

(assert (=> bm!67426 d!153825))

(declare-fun b!1431008 () Bool)

(declare-fun e!807924 () SeekEntryResult!11322)

(assert (=> b!1431008 (= e!807924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431009 () Bool)

(declare-fun e!807921 () SeekEntryResult!11322)

(assert (=> b!1431009 (= e!807921 (Intermediate!11322 true (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431010 () Bool)

(declare-fun lt!629995 () SeekEntryResult!11322)

(assert (=> b!1431010 (and (bvsge (index!47682 lt!629995) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629995) (size!47593 a!2831)))))

(declare-fun res!965132 () Bool)

(assert (=> b!1431010 (= res!965132 (= (select (arr!47043 a!2831) (index!47682 lt!629995)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807920 () Bool)

(assert (=> b!1431010 (=> res!965132 e!807920)))

(declare-fun b!1431011 () Bool)

(assert (=> b!1431011 (and (bvsge (index!47682 lt!629995) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629995) (size!47593 a!2831)))))

(declare-fun res!965133 () Bool)

(assert (=> b!1431011 (= res!965133 (= (select (arr!47043 a!2831) (index!47682 lt!629995)) (select (arr!47043 a!2831) j!81)))))

(assert (=> b!1431011 (=> res!965133 e!807920)))

(declare-fun e!807922 () Bool)

(assert (=> b!1431011 (= e!807922 e!807920)))

(declare-fun b!1431012 () Bool)

(declare-fun e!807923 () Bool)

(assert (=> b!1431012 (= e!807923 (bvsge (x!129314 lt!629995) #b01111111111111111111111111111110))))

(declare-fun d!153829 () Bool)

(assert (=> d!153829 e!807923))

(declare-fun c!132434 () Bool)

(assert (=> d!153829 (= c!132434 (and ((_ is Intermediate!11322) lt!629995) (undefined!12134 lt!629995)))))

(assert (=> d!153829 (= lt!629995 e!807921)))

(declare-fun c!132436 () Bool)

(assert (=> d!153829 (= c!132436 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629996 () (_ BitVec 64))

(assert (=> d!153829 (= lt!629996 (select (arr!47043 a!2831) (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153829 (validMask!0 mask!2608)))

(assert (=> d!153829 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!629995)))

(declare-fun b!1431013 () Bool)

(assert (=> b!1431013 (= e!807923 e!807922)))

(declare-fun res!965131 () Bool)

(assert (=> b!1431013 (= res!965131 (and ((_ is Intermediate!11322) lt!629995) (not (undefined!12134 lt!629995)) (bvslt (x!129314 lt!629995) #b01111111111111111111111111111110) (bvsge (x!129314 lt!629995) #b00000000000000000000000000000000) (bvsge (x!129314 lt!629995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1431013 (=> (not res!965131) (not e!807922))))

(declare-fun b!1431014 () Bool)

(assert (=> b!1431014 (= e!807924 (Intermediate!11322 false (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431015 () Bool)

(assert (=> b!1431015 (and (bvsge (index!47682 lt!629995) #b00000000000000000000000000000000) (bvslt (index!47682 lt!629995) (size!47593 a!2831)))))

(assert (=> b!1431015 (= e!807920 (= (select (arr!47043 a!2831) (index!47682 lt!629995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431016 () Bool)

(assert (=> b!1431016 (= e!807921 e!807924)))

(declare-fun c!132435 () Bool)

(assert (=> b!1431016 (= c!132435 (or (= lt!629996 (select (arr!47043 a!2831) j!81)) (= (bvadd lt!629996 lt!629996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153829 c!132436) b!1431009))

(assert (= (and d!153829 (not c!132436)) b!1431016))

(assert (= (and b!1431016 c!132435) b!1431014))

(assert (= (and b!1431016 (not c!132435)) b!1431008))

(assert (= (and d!153829 c!132434) b!1431012))

(assert (= (and d!153829 (not c!132434)) b!1431013))

(assert (= (and b!1431013 res!965131) b!1431011))

(assert (= (and b!1431011 (not res!965133)) b!1431010))

(assert (= (and b!1431010 (not res!965132)) b!1431015))

(declare-fun m!1320917 () Bool)

(assert (=> b!1431010 m!1320917))

(assert (=> b!1431011 m!1320917))

(assert (=> b!1431015 m!1320917))

(assert (=> d!153829 m!1320565))

(declare-fun m!1320921 () Bool)

(assert (=> d!153829 m!1320921))

(assert (=> d!153829 m!1320471))

(assert (=> b!1431008 m!1320565))

(declare-fun m!1320925 () Bool)

(assert (=> b!1431008 m!1320925))

(assert (=> b!1431008 m!1320925))

(assert (=> b!1431008 m!1320447))

(declare-fun m!1320927 () Bool)

(assert (=> b!1431008 m!1320927))

(assert (=> b!1430598 d!153829))

(declare-fun d!153833 () Bool)

(declare-fun lt!629998 () (_ BitVec 32))

(assert (=> d!153833 (and (bvsge lt!629998 #b00000000000000000000000000000000) (bvslt lt!629998 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153833 (= lt!629998 (choose!52 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153833 (validMask!0 mask!2608)))

(assert (=> d!153833 (= (nextIndex!0 (toIndex!0 (select (arr!47043 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629998)))

(declare-fun bs!41683 () Bool)

(assert (= bs!41683 d!153833))

(assert (=> bs!41683 m!1320477))

(declare-fun m!1320931 () Bool)

(assert (=> bs!41683 m!1320931))

(assert (=> bs!41683 m!1320471))

(assert (=> b!1430598 d!153833))

(declare-fun b!1431047 () Bool)

(declare-fun e!807942 () SeekEntryResult!11322)

(declare-fun e!807941 () SeekEntryResult!11322)

(assert (=> b!1431047 (= e!807942 e!807941)))

(declare-fun lt!630008 () (_ BitVec 64))

(declare-fun c!132451 () Bool)

(assert (=> b!1431047 (= c!132451 (= lt!630008 (select (arr!47043 a!2831) j!81)))))

(declare-fun lt!630009 () SeekEntryResult!11322)

(declare-fun d!153837 () Bool)

(assert (=> d!153837 (and (or ((_ is Undefined!11322) lt!630009) (not ((_ is Found!11322) lt!630009)) (and (bvsge (index!47681 lt!630009) #b00000000000000000000000000000000) (bvslt (index!47681 lt!630009) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!630009) ((_ is Found!11322) lt!630009) (not ((_ is MissingVacant!11322) lt!630009)) (not (= (index!47683 lt!630009) (index!47682 lt!629811))) (and (bvsge (index!47683 lt!630009) #b00000000000000000000000000000000) (bvslt (index!47683 lt!630009) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!630009) (ite ((_ is Found!11322) lt!630009) (= (select (arr!47043 a!2831) (index!47681 lt!630009)) (select (arr!47043 a!2831) j!81)) (and ((_ is MissingVacant!11322) lt!630009) (= (index!47683 lt!630009) (index!47682 lt!629811)) (= (select (arr!47043 a!2831) (index!47683 lt!630009)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!153837 (= lt!630009 e!807942)))

(declare-fun c!132449 () Bool)

(assert (=> d!153837 (= c!132449 (bvsge (x!129314 lt!629811) #b01111111111111111111111111111110))))

(assert (=> d!153837 (= lt!630008 (select (arr!47043 a!2831) (index!47682 lt!629811)))))

(assert (=> d!153837 (validMask!0 mask!2608)))

(assert (=> d!153837 (= (seekKeyOrZeroReturnVacant!0 (x!129314 lt!629811) (index!47682 lt!629811) (index!47682 lt!629811) (select (arr!47043 a!2831) j!81) a!2831 mask!2608) lt!630009)))

(declare-fun b!1431048 () Bool)

(declare-fun e!807943 () SeekEntryResult!11322)

(assert (=> b!1431048 (= e!807943 (MissingVacant!11322 (index!47682 lt!629811)))))

(declare-fun b!1431049 () Bool)

(assert (=> b!1431049 (= e!807941 (Found!11322 (index!47682 lt!629811)))))

(declare-fun b!1431050 () Bool)

(declare-fun c!132450 () Bool)

(assert (=> b!1431050 (= c!132450 (= lt!630008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431050 (= e!807941 e!807943)))

(declare-fun b!1431051 () Bool)

(assert (=> b!1431051 (= e!807943 (seekKeyOrZeroReturnVacant!0 (bvadd (x!129314 lt!629811) #b00000000000000000000000000000001) (nextIndex!0 (index!47682 lt!629811) (x!129314 lt!629811) mask!2608) (index!47682 lt!629811) (select (arr!47043 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431052 () Bool)

(assert (=> b!1431052 (= e!807942 Undefined!11322)))

(assert (= (and d!153837 c!132449) b!1431052))

(assert (= (and d!153837 (not c!132449)) b!1431047))

(assert (= (and b!1431047 c!132451) b!1431049))

(assert (= (and b!1431047 (not c!132451)) b!1431050))

(assert (= (and b!1431050 c!132450) b!1431048))

(assert (= (and b!1431050 (not c!132450)) b!1431051))

(declare-fun m!1320949 () Bool)

(assert (=> d!153837 m!1320949))

(declare-fun m!1320951 () Bool)

(assert (=> d!153837 m!1320951))

(assert (=> d!153837 m!1320547))

(assert (=> d!153837 m!1320471))

(declare-fun m!1320953 () Bool)

(assert (=> b!1431051 m!1320953))

(assert (=> b!1431051 m!1320953))

(assert (=> b!1431051 m!1320447))

(declare-fun m!1320955 () Bool)

(assert (=> b!1431051 m!1320955))

(assert (=> b!1430554 d!153837))

(assert (=> d!153667 d!153665))

(declare-fun d!153845 () Bool)

(assert (=> d!153845 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(assert (=> d!153845 true))

(declare-fun _$72!152 () Unit!48390)

(assert (=> d!153845 (= (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) _$72!152)))

(declare-fun bs!41686 () Bool)

(assert (= bs!41686 d!153845))

(assert (=> bs!41686 m!1320457))

(assert (=> d!153667 d!153845))

(assert (=> d!153667 d!153697))

(declare-fun d!153847 () Bool)

(assert (=> d!153847 (arrayContainsKey!0 a!2831 lt!629799 #b00000000000000000000000000000000)))

(declare-fun lt!630012 () Unit!48390)

(declare-fun choose!13 (array!97466 (_ BitVec 64) (_ BitVec 32)) Unit!48390)

(assert (=> d!153847 (= lt!630012 (choose!13 a!2831 lt!629799 j!81))))

(assert (=> d!153847 (bvsge j!81 #b00000000000000000000000000000000)))

(assert (=> d!153847 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629799 j!81) lt!630012)))

(declare-fun bs!41687 () Bool)

(assert (= bs!41687 d!153847))

(assert (=> bs!41687 m!1320535))

(declare-fun m!1320957 () Bool)

(assert (=> bs!41687 m!1320957))

(assert (=> b!1430538 d!153847))

(declare-fun d!153849 () Bool)

(declare-fun res!965144 () Bool)

(declare-fun e!807948 () Bool)

(assert (=> d!153849 (=> res!965144 e!807948)))

(assert (=> d!153849 (= res!965144 (= (select (arr!47043 a!2831) #b00000000000000000000000000000000) lt!629799))))

(assert (=> d!153849 (= (arrayContainsKey!0 a!2831 lt!629799 #b00000000000000000000000000000000) e!807948)))

(declare-fun b!1431057 () Bool)

(declare-fun e!807949 () Bool)

(assert (=> b!1431057 (= e!807948 e!807949)))

(declare-fun res!965145 () Bool)

(assert (=> b!1431057 (=> (not res!965145) (not e!807949))))

(assert (=> b!1431057 (= res!965145 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47593 a!2831)))))

(declare-fun b!1431058 () Bool)

(assert (=> b!1431058 (= e!807949 (arrayContainsKey!0 a!2831 lt!629799 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153849 (not res!965144)) b!1431057))

(assert (= (and b!1431057 res!965145) b!1431058))

(assert (=> d!153849 m!1320579))

(declare-fun m!1320959 () Bool)

(assert (=> b!1431058 m!1320959))

(assert (=> b!1430538 d!153849))

(assert (=> b!1430538 d!153669))

(declare-fun b!1431059 () Bool)

(declare-fun e!807954 () SeekEntryResult!11322)

(assert (=> b!1431059 (= e!807954 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!629771 lt!629772 mask!2608))))

(declare-fun b!1431060 () Bool)

(declare-fun e!807951 () SeekEntryResult!11322)

(assert (=> b!1431060 (= e!807951 (Intermediate!11322 true (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431061 () Bool)

(declare-fun lt!630013 () SeekEntryResult!11322)

(assert (=> b!1431061 (and (bvsge (index!47682 lt!630013) #b00000000000000000000000000000000) (bvslt (index!47682 lt!630013) (size!47593 lt!629772)))))

(declare-fun res!965147 () Bool)

(assert (=> b!1431061 (= res!965147 (= (select (arr!47043 lt!629772) (index!47682 lt!630013)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807950 () Bool)

(assert (=> b!1431061 (=> res!965147 e!807950)))

(declare-fun b!1431062 () Bool)

(assert (=> b!1431062 (and (bvsge (index!47682 lt!630013) #b00000000000000000000000000000000) (bvslt (index!47682 lt!630013) (size!47593 lt!629772)))))

(declare-fun res!965148 () Bool)

(assert (=> b!1431062 (= res!965148 (= (select (arr!47043 lt!629772) (index!47682 lt!630013)) lt!629771))))

(assert (=> b!1431062 (=> res!965148 e!807950)))

(declare-fun e!807952 () Bool)

(assert (=> b!1431062 (= e!807952 e!807950)))

(declare-fun b!1431063 () Bool)

(declare-fun e!807953 () Bool)

(assert (=> b!1431063 (= e!807953 (bvsge (x!129314 lt!630013) #b01111111111111111111111111111110))))

(declare-fun d!153851 () Bool)

(assert (=> d!153851 e!807953))

(declare-fun c!132452 () Bool)

(assert (=> d!153851 (= c!132452 (and ((_ is Intermediate!11322) lt!630013) (undefined!12134 lt!630013)))))

(assert (=> d!153851 (= lt!630013 e!807951)))

(declare-fun c!132454 () Bool)

(assert (=> d!153851 (= c!132454 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!630014 () (_ BitVec 64))

(assert (=> d!153851 (= lt!630014 (select (arr!47043 lt!629772) (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153851 (validMask!0 mask!2608)))

(assert (=> d!153851 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629771 lt!629772 mask!2608) lt!630013)))

(declare-fun b!1431064 () Bool)

(assert (=> b!1431064 (= e!807953 e!807952)))

(declare-fun res!965146 () Bool)

(assert (=> b!1431064 (= res!965146 (and ((_ is Intermediate!11322) lt!630013) (not (undefined!12134 lt!630013)) (bvslt (x!129314 lt!630013) #b01111111111111111111111111111110) (bvsge (x!129314 lt!630013) #b00000000000000000000000000000000) (bvsge (x!129314 lt!630013) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1431064 (=> (not res!965146) (not e!807952))))

(declare-fun b!1431065 () Bool)

(assert (=> b!1431065 (= e!807954 (Intermediate!11322 false (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431066 () Bool)

(assert (=> b!1431066 (and (bvsge (index!47682 lt!630013) #b00000000000000000000000000000000) (bvslt (index!47682 lt!630013) (size!47593 lt!629772)))))

(assert (=> b!1431066 (= e!807950 (= (select (arr!47043 lt!629772) (index!47682 lt!630013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431067 () Bool)

(assert (=> b!1431067 (= e!807951 e!807954)))

(declare-fun c!132453 () Bool)

(assert (=> b!1431067 (= c!132453 (or (= lt!630014 lt!629771) (= (bvadd lt!630014 lt!630014) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153851 c!132454) b!1431060))

(assert (= (and d!153851 (not c!132454)) b!1431067))

(assert (= (and b!1431067 c!132453) b!1431065))

(assert (= (and b!1431067 (not c!132453)) b!1431059))

(assert (= (and d!153851 c!132452) b!1431063))

(assert (= (and d!153851 (not c!132452)) b!1431064))

(assert (= (and b!1431064 res!965146) b!1431062))

(assert (= (and b!1431062 (not res!965148)) b!1431061))

(assert (= (and b!1431061 (not res!965147)) b!1431066))

(declare-fun m!1320961 () Bool)

(assert (=> b!1431061 m!1320961))

(assert (=> b!1431062 m!1320961))

(assert (=> b!1431066 m!1320961))

(assert (=> d!153851 m!1320593))

(declare-fun m!1320963 () Bool)

(assert (=> d!153851 m!1320963))

(assert (=> d!153851 m!1320471))

(assert (=> b!1431059 m!1320593))

(declare-fun m!1320965 () Bool)

(assert (=> b!1431059 m!1320965))

(assert (=> b!1431059 m!1320965))

(declare-fun m!1320967 () Bool)

(assert (=> b!1431059 m!1320967))

(assert (=> b!1430630 d!153851))

(declare-fun d!153853 () Bool)

(declare-fun lt!630015 () (_ BitVec 32))

(assert (=> d!153853 (and (bvsge lt!630015 #b00000000000000000000000000000000) (bvslt lt!630015 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153853 (= lt!630015 (choose!52 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153853 (validMask!0 mask!2608)))

(assert (=> d!153853 (= (nextIndex!0 (toIndex!0 lt!629771 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630015)))

(declare-fun bs!41688 () Bool)

(assert (= bs!41688 d!153853))

(assert (=> bs!41688 m!1320463))

(declare-fun m!1320969 () Bool)

(assert (=> bs!41688 m!1320969))

(assert (=> bs!41688 m!1320471))

(assert (=> b!1430630 d!153853))

(declare-fun bm!67452 () Bool)

(declare-fun call!67455 () Bool)

(assert (=> bm!67452 (= call!67455 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153855 () Bool)

(declare-fun res!965150 () Bool)

(declare-fun e!807957 () Bool)

(assert (=> d!153855 (=> res!965150 e!807957)))

(assert (=> d!153855 (= res!965150 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47593 a!2831)))))

(assert (=> d!153855 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608) e!807957)))

(declare-fun b!1431068 () Bool)

(declare-fun e!807956 () Bool)

(declare-fun e!807955 () Bool)

(assert (=> b!1431068 (= e!807956 e!807955)))

(declare-fun lt!630018 () (_ BitVec 64))

(assert (=> b!1431068 (= lt!630018 (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!630017 () Unit!48390)

(assert (=> b!1431068 (= lt!630017 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630018 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1431068 (arrayContainsKey!0 a!2831 lt!630018 #b00000000000000000000000000000000)))

(declare-fun lt!630016 () Unit!48390)

(assert (=> b!1431068 (= lt!630016 lt!630017)))

(declare-fun res!965149 () Bool)

(assert (=> b!1431068 (= res!965149 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11322 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1431068 (=> (not res!965149) (not e!807955))))

(declare-fun b!1431069 () Bool)

(assert (=> b!1431069 (= e!807957 e!807956)))

(declare-fun c!132455 () Bool)

(assert (=> b!1431069 (= c!132455 (validKeyInArray!0 (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1431070 () Bool)

(assert (=> b!1431070 (= e!807955 call!67455)))

(declare-fun b!1431071 () Bool)

(assert (=> b!1431071 (= e!807956 call!67455)))

(assert (= (and d!153855 (not res!965150)) b!1431069))

(assert (= (and b!1431069 c!132455) b!1431068))

(assert (= (and b!1431069 (not c!132455)) b!1431071))

(assert (= (and b!1431068 res!965149) b!1431070))

(assert (= (or b!1431070 b!1431071) bm!67452))

(declare-fun m!1320971 () Bool)

(assert (=> bm!67452 m!1320971))

(declare-fun m!1320973 () Bool)

(assert (=> b!1431068 m!1320973))

(declare-fun m!1320975 () Bool)

(assert (=> b!1431068 m!1320975))

(declare-fun m!1320977 () Bool)

(assert (=> b!1431068 m!1320977))

(assert (=> b!1431068 m!1320973))

(declare-fun m!1320979 () Bool)

(assert (=> b!1431068 m!1320979))

(assert (=> b!1431069 m!1320973))

(assert (=> b!1431069 m!1320973))

(declare-fun m!1320981 () Bool)

(assert (=> b!1431069 m!1320981))

(assert (=> bm!67430 d!153855))

(declare-fun d!153857 () Bool)

(declare-fun lt!630021 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!774 (List!33553) (InoxSet (_ BitVec 64)))

(assert (=> d!153857 (= lt!630021 (select (content!774 Nil!33550) (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(declare-fun e!807963 () Bool)

(assert (=> d!153857 (= lt!630021 e!807963)))

(declare-fun res!965155 () Bool)

(assert (=> d!153857 (=> (not res!965155) (not e!807963))))

(assert (=> d!153857 (= res!965155 ((_ is Cons!33549) Nil!33550))))

(assert (=> d!153857 (= (contains!9861 Nil!33550 (select (arr!47043 a!2831) #b00000000000000000000000000000000)) lt!630021)))

(declare-fun b!1431076 () Bool)

(declare-fun e!807962 () Bool)

(assert (=> b!1431076 (= e!807963 e!807962)))

(declare-fun res!965156 () Bool)

(assert (=> b!1431076 (=> res!965156 e!807962)))

(assert (=> b!1431076 (= res!965156 (= (h!34866 Nil!33550) (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431077 () Bool)

(assert (=> b!1431077 (= e!807962 (contains!9861 (t!48247 Nil!33550) (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153857 res!965155) b!1431076))

(assert (= (and b!1431076 (not res!965156)) b!1431077))

(declare-fun m!1320983 () Bool)

(assert (=> d!153857 m!1320983))

(assert (=> d!153857 m!1320579))

(declare-fun m!1320985 () Bool)

(assert (=> d!153857 m!1320985))

(assert (=> b!1431077 m!1320579))

(declare-fun m!1320987 () Bool)

(assert (=> b!1431077 m!1320987))

(assert (=> b!1430680 d!153857))

(declare-fun d!153859 () Bool)

(assert (=> d!153859 (arrayContainsKey!0 a!2831 lt!629841 #b00000000000000000000000000000000)))

(declare-fun lt!630022 () Unit!48390)

(assert (=> d!153859 (= lt!630022 (choose!13 a!2831 lt!629841 #b00000000000000000000000000000000))))

(assert (=> d!153859 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!153859 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629841 #b00000000000000000000000000000000) lt!630022)))

(declare-fun bs!41689 () Bool)

(assert (= bs!41689 d!153859))

(assert (=> bs!41689 m!1320583))

(declare-fun m!1320989 () Bool)

(assert (=> bs!41689 m!1320989))

(assert (=> b!1430626 d!153859))

(declare-fun d!153861 () Bool)

(declare-fun res!965157 () Bool)

(declare-fun e!807964 () Bool)

(assert (=> d!153861 (=> res!965157 e!807964)))

(assert (=> d!153861 (= res!965157 (= (select (arr!47043 a!2831) #b00000000000000000000000000000000) lt!629841))))

(assert (=> d!153861 (= (arrayContainsKey!0 a!2831 lt!629841 #b00000000000000000000000000000000) e!807964)))

(declare-fun b!1431078 () Bool)

(declare-fun e!807965 () Bool)

(assert (=> b!1431078 (= e!807964 e!807965)))

(declare-fun res!965158 () Bool)

(assert (=> b!1431078 (=> (not res!965158) (not e!807965))))

(assert (=> b!1431078 (= res!965158 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47593 a!2831)))))

(declare-fun b!1431079 () Bool)

(assert (=> b!1431079 (= e!807965 (arrayContainsKey!0 a!2831 lt!629841 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153861 (not res!965157)) b!1431078))

(assert (= (and b!1431078 res!965158) b!1431079))

(assert (=> d!153861 m!1320579))

(declare-fun m!1320991 () Bool)

(assert (=> b!1431079 m!1320991))

(assert (=> b!1430626 d!153861))

(declare-fun lt!630025 () SeekEntryResult!11322)

(declare-fun b!1431080 () Bool)

(declare-fun e!807966 () SeekEntryResult!11322)

(assert (=> b!1431080 (= e!807966 (seekKeyOrZeroReturnVacant!0 (x!129314 lt!630025) (index!47682 lt!630025) (index!47682 lt!630025) (select (arr!47043 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(declare-fun b!1431081 () Bool)

(declare-fun e!807968 () SeekEntryResult!11322)

(assert (=> b!1431081 (= e!807968 Undefined!11322)))

(declare-fun d!153863 () Bool)

(declare-fun lt!630023 () SeekEntryResult!11322)

(assert (=> d!153863 (and (or ((_ is Undefined!11322) lt!630023) (not ((_ is Found!11322) lt!630023)) (and (bvsge (index!47681 lt!630023) #b00000000000000000000000000000000) (bvslt (index!47681 lt!630023) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!630023) ((_ is Found!11322) lt!630023) (not ((_ is MissingZero!11322) lt!630023)) (and (bvsge (index!47680 lt!630023) #b00000000000000000000000000000000) (bvslt (index!47680 lt!630023) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!630023) ((_ is Found!11322) lt!630023) ((_ is MissingZero!11322) lt!630023) (not ((_ is MissingVacant!11322) lt!630023)) (and (bvsge (index!47683 lt!630023) #b00000000000000000000000000000000) (bvslt (index!47683 lt!630023) (size!47593 a!2831)))) (or ((_ is Undefined!11322) lt!630023) (ite ((_ is Found!11322) lt!630023) (= (select (arr!47043 a!2831) (index!47681 lt!630023)) (select (arr!47043 a!2831) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!11322) lt!630023) (= (select (arr!47043 a!2831) (index!47680 lt!630023)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11322) lt!630023) (= (select (arr!47043 a!2831) (index!47683 lt!630023)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153863 (= lt!630023 e!807968)))

(declare-fun c!132458 () Bool)

(assert (=> d!153863 (= c!132458 (and ((_ is Intermediate!11322) lt!630025) (undefined!12134 lt!630025)))))

(assert (=> d!153863 (= lt!630025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000) mask!2608) (select (arr!47043 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(assert (=> d!153863 (validMask!0 mask!2608)))

(assert (=> d!153863 (= (seekEntryOrOpen!0 (select (arr!47043 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) lt!630023)))

(declare-fun b!1431082 () Bool)

(declare-fun e!807967 () SeekEntryResult!11322)

(assert (=> b!1431082 (= e!807967 (Found!11322 (index!47682 lt!630025)))))

(declare-fun b!1431083 () Bool)

(assert (=> b!1431083 (= e!807966 (MissingZero!11322 (index!47682 lt!630025)))))

(declare-fun b!1431084 () Bool)

(declare-fun c!132457 () Bool)

(declare-fun lt!630024 () (_ BitVec 64))

(assert (=> b!1431084 (= c!132457 (= lt!630024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431084 (= e!807967 e!807966)))

(declare-fun b!1431085 () Bool)

(assert (=> b!1431085 (= e!807968 e!807967)))

(assert (=> b!1431085 (= lt!630024 (select (arr!47043 a!2831) (index!47682 lt!630025)))))

(declare-fun c!132456 () Bool)

(assert (=> b!1431085 (= c!132456 (= lt!630024 (select (arr!47043 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153863 c!132458) b!1431081))

(assert (= (and d!153863 (not c!132458)) b!1431085))

(assert (= (and b!1431085 c!132456) b!1431082))

(assert (= (and b!1431085 (not c!132456)) b!1431084))

(assert (= (and b!1431084 c!132457) b!1431083))

(assert (= (and b!1431084 (not c!132457)) b!1431080))

(assert (=> b!1431080 m!1320579))

(declare-fun m!1320993 () Bool)

(assert (=> b!1431080 m!1320993))

(declare-fun m!1320995 () Bool)

(assert (=> d!153863 m!1320995))

(assert (=> d!153863 m!1320579))

(declare-fun m!1320997 () Bool)

(assert (=> d!153863 m!1320997))

(declare-fun m!1320999 () Bool)

(assert (=> d!153863 m!1320999))

(assert (=> d!153863 m!1320471))

(assert (=> d!153863 m!1320579))

(assert (=> d!153863 m!1320995))

(declare-fun m!1321001 () Bool)

(assert (=> d!153863 m!1321001))

(declare-fun m!1321003 () Bool)

(assert (=> d!153863 m!1321003))

(declare-fun m!1321005 () Bool)

(assert (=> b!1431085 m!1321005))

(assert (=> b!1430626 d!153863))

(assert (=> b!1430539 d!153709))

(assert (=> b!1430627 d!153813))

(assert (=> d!153707 d!153697))

(assert (=> d!153671 d!153697))

(assert (=> d!153669 d!153671))

(assert (=> d!153669 d!153681))

(assert (=> d!153669 d!153697))

(assert (=> d!153711 d!153697))

(assert (=> b!1430676 d!153813))

(declare-fun b!1431086 () Bool)

(declare-fun e!807973 () SeekEntryResult!11322)

(assert (=> b!1431086 (= e!807973 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!629771 lt!629772 mask!2608))))

(declare-fun e!807970 () SeekEntryResult!11322)

(declare-fun b!1431087 () Bool)

(assert (=> b!1431087 (= e!807970 (Intermediate!11322 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1431088 () Bool)

(declare-fun lt!630026 () SeekEntryResult!11322)

(assert (=> b!1431088 (and (bvsge (index!47682 lt!630026) #b00000000000000000000000000000000) (bvslt (index!47682 lt!630026) (size!47593 lt!629772)))))

(declare-fun res!965160 () Bool)

(assert (=> b!1431088 (= res!965160 (= (select (arr!47043 lt!629772) (index!47682 lt!630026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807969 () Bool)

(assert (=> b!1431088 (=> res!965160 e!807969)))

(declare-fun b!1431089 () Bool)

(assert (=> b!1431089 (and (bvsge (index!47682 lt!630026) #b00000000000000000000000000000000) (bvslt (index!47682 lt!630026) (size!47593 lt!629772)))))

(declare-fun res!965161 () Bool)

(assert (=> b!1431089 (= res!965161 (= (select (arr!47043 lt!629772) (index!47682 lt!630026)) lt!629771))))

(assert (=> b!1431089 (=> res!965161 e!807969)))

(declare-fun e!807971 () Bool)

(assert (=> b!1431089 (= e!807971 e!807969)))

(declare-fun b!1431090 () Bool)

(declare-fun e!807972 () Bool)

(assert (=> b!1431090 (= e!807972 (bvsge (x!129314 lt!630026) #b01111111111111111111111111111110))))

(declare-fun d!153865 () Bool)

(assert (=> d!153865 e!807972))

(declare-fun c!132459 () Bool)

(assert (=> d!153865 (= c!132459 (and ((_ is Intermediate!11322) lt!630026) (undefined!12134 lt!630026)))))

(assert (=> d!153865 (= lt!630026 e!807970)))

(declare-fun c!132461 () Bool)

(assert (=> d!153865 (= c!132461 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!630027 () (_ BitVec 64))

(assert (=> d!153865 (= lt!630027 (select (arr!47043 lt!629772) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153865 (validMask!0 mask!2608)))

(assert (=> d!153865 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629771 lt!629772 mask!2608) lt!630026)))

(declare-fun b!1431091 () Bool)

(assert (=> b!1431091 (= e!807972 e!807971)))

(declare-fun res!965159 () Bool)

(assert (=> b!1431091 (= res!965159 (and ((_ is Intermediate!11322) lt!630026) (not (undefined!12134 lt!630026)) (bvslt (x!129314 lt!630026) #b01111111111111111111111111111110) (bvsge (x!129314 lt!630026) #b00000000000000000000000000000000) (bvsge (x!129314 lt!630026) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1431091 (=> (not res!965159) (not e!807971))))

(declare-fun b!1431092 () Bool)

(assert (=> b!1431092 (= e!807973 (Intermediate!11322 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1431093 () Bool)

(assert (=> b!1431093 (and (bvsge (index!47682 lt!630026) #b00000000000000000000000000000000) (bvslt (index!47682 lt!630026) (size!47593 lt!629772)))))

(assert (=> b!1431093 (= e!807969 (= (select (arr!47043 lt!629772) (index!47682 lt!630026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431094 () Bool)

(assert (=> b!1431094 (= e!807970 e!807973)))

(declare-fun c!132460 () Bool)

(assert (=> b!1431094 (= c!132460 (or (= lt!630027 lt!629771) (= (bvadd lt!630027 lt!630027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153865 c!132461) b!1431087))

(assert (= (and d!153865 (not c!132461)) b!1431094))

(assert (= (and b!1431094 c!132460) b!1431092))

(assert (= (and b!1431094 (not c!132460)) b!1431086))

(assert (= (and d!153865 c!132459) b!1431090))

(assert (= (and d!153865 (not c!132459)) b!1431091))

(assert (= (and b!1431091 res!965159) b!1431089))

(assert (= (and b!1431089 (not res!965161)) b!1431088))

(assert (= (and b!1431088 (not res!965160)) b!1431093))

(declare-fun m!1321007 () Bool)

(assert (=> b!1431088 m!1321007))

(assert (=> b!1431089 m!1321007))

(assert (=> b!1431093 m!1321007))

(assert (=> d!153865 m!1320625))

(declare-fun m!1321009 () Bool)

(assert (=> d!153865 m!1321009))

(assert (=> d!153865 m!1320471))

(assert (=> b!1431086 m!1320625))

(assert (=> b!1431086 m!1320885))

(assert (=> b!1431086 m!1320885))

(declare-fun m!1321011 () Bool)

(assert (=> b!1431086 m!1321011))

(assert (=> b!1430717 d!153865))

(assert (=> b!1430717 d!153821))

(declare-fun d!153867 () Bool)

(declare-fun res!965162 () Bool)

(declare-fun e!807976 () Bool)

(assert (=> d!153867 (=> res!965162 e!807976)))

(assert (=> d!153867 (= res!965162 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47593 a!2831)))))

(assert (=> d!153867 (= (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132328 (Cons!33549 (select (arr!47043 a!2831) #b00000000000000000000000000000000) Nil!33550) Nil!33550)) e!807976)))

(declare-fun b!1431095 () Bool)

(declare-fun e!807974 () Bool)

(assert (=> b!1431095 (= e!807976 e!807974)))

(declare-fun res!965163 () Bool)

(assert (=> b!1431095 (=> (not res!965163) (not e!807974))))

(declare-fun e!807977 () Bool)

(assert (=> b!1431095 (= res!965163 (not e!807977))))

(declare-fun res!965164 () Bool)

(assert (=> b!1431095 (=> (not res!965164) (not e!807977))))

(assert (=> b!1431095 (= res!965164 (validKeyInArray!0 (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!67453 () Bool)

(declare-fun c!132462 () Bool)

(declare-fun call!67456 () Bool)

(assert (=> bm!67453 (= call!67456 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!132462 (Cons!33549 (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!132328 (Cons!33549 (select (arr!47043 a!2831) #b00000000000000000000000000000000) Nil!33550) Nil!33550)) (ite c!132328 (Cons!33549 (select (arr!47043 a!2831) #b00000000000000000000000000000000) Nil!33550) Nil!33550))))))

(declare-fun b!1431096 () Bool)

(declare-fun e!807975 () Bool)

(assert (=> b!1431096 (= e!807974 e!807975)))

(assert (=> b!1431096 (= c!132462 (validKeyInArray!0 (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1431097 () Bool)

(assert (=> b!1431097 (= e!807975 call!67456)))

(declare-fun b!1431098 () Bool)

(assert (=> b!1431098 (= e!807975 call!67456)))

(declare-fun b!1431099 () Bool)

(assert (=> b!1431099 (= e!807977 (contains!9861 (ite c!132328 (Cons!33549 (select (arr!47043 a!2831) #b00000000000000000000000000000000) Nil!33550) Nil!33550) (select (arr!47043 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!153867 (not res!965162)) b!1431095))

(assert (= (and b!1431095 res!965164) b!1431099))

(assert (= (and b!1431095 res!965163) b!1431096))

(assert (= (and b!1431096 c!132462) b!1431097))

(assert (= (and b!1431096 (not c!132462)) b!1431098))

(assert (= (or b!1431097 b!1431098) bm!67453))

(assert (=> b!1431095 m!1320973))

(assert (=> b!1431095 m!1320973))

(assert (=> b!1431095 m!1320981))

(assert (=> bm!67453 m!1320973))

(declare-fun m!1321013 () Bool)

(assert (=> bm!67453 m!1321013))

(assert (=> b!1431096 m!1320973))

(assert (=> b!1431096 m!1320973))

(assert (=> b!1431096 m!1320981))

(assert (=> b!1431099 m!1320973))

(assert (=> b!1431099 m!1320973))

(declare-fun m!1321015 () Bool)

(assert (=> b!1431099 m!1321015))

(assert (=> bm!67433 d!153867))

(check-sat (not b!1431096) (not b!1431068) (not d!153851) (not b!1431059) (not d!153821) (not d!153859) (not b!1431008) (not b!1430995) (not b!1431099) (not b!1431051) (not d!153865) (not d!153845) (not b!1431077) (not b!1430977) (not b!1431079) (not b!1431095) (not b!1430996) (not b!1431086) (not bm!67451) (not d!153817) (not d!153833) (not bm!67453) (not d!153847) (not b!1431058) (not b!1431069) (not d!153857) (not bm!67452) (not d!153829) (not d!153837) (not b!1431080) (not d!153853) (not d!153863))
(check-sat)
