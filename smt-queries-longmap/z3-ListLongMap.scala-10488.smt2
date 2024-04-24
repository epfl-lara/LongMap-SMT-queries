; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123682 () Bool)

(assert start!123682)

(declare-fun b!1432499 () Bool)

(declare-fun res!965737 () Bool)

(declare-fun e!808867 () Bool)

(assert (=> b!1432499 (=> (not res!965737) (not e!808867))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97586 0))(
  ( (array!97587 (arr!47098 (Array (_ BitVec 32) (_ BitVec 64))) (size!47649 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97586)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11279 0))(
  ( (MissingZero!11279 (index!47508 (_ BitVec 32))) (Found!11279 (index!47509 (_ BitVec 32))) (Intermediate!11279 (undefined!12091 Bool) (index!47510 (_ BitVec 32)) (x!129315 (_ BitVec 32))) (Undefined!11279) (MissingVacant!11279 (index!47511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97586 (_ BitVec 32)) SeekEntryResult!11279)

(assert (=> b!1432499 (= res!965737 (= (seekEntryOrOpen!0 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) (Found!11279 j!81)))))

(declare-fun b!1432500 () Bool)

(declare-fun res!965732 () Bool)

(declare-fun e!808868 () Bool)

(assert (=> b!1432500 (=> (not res!965732) (not e!808868))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432500 (= res!965732 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432501 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432501 (= e!808867 (or (= (select (arr!47098 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47098 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47098 a!2831) index!585) (select (arr!47098 a!2831) j!81)) (not (= (select (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun res!965729 () Bool)

(declare-fun e!808864 () Bool)

(assert (=> start!123682 (=> (not res!965729) (not e!808864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123682 (= res!965729 (validMask!0 mask!2608))))

(assert (=> start!123682 e!808864))

(assert (=> start!123682 true))

(declare-fun array_inv!36379 (array!97586) Bool)

(assert (=> start!123682 (array_inv!36379 a!2831)))

(declare-fun b!1432502 () Bool)

(declare-fun e!808865 () Bool)

(assert (=> b!1432502 (= e!808865 e!808868)))

(declare-fun res!965731 () Bool)

(assert (=> b!1432502 (=> (not res!965731) (not e!808868))))

(declare-fun lt!630542 () (_ BitVec 64))

(declare-fun lt!630538 () SeekEntryResult!11279)

(declare-fun lt!630539 () array!97586)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97586 (_ BitVec 32)) SeekEntryResult!11279)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432502 (= res!965731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630542 mask!2608) lt!630542 lt!630539 mask!2608) lt!630538))))

(assert (=> b!1432502 (= lt!630538 (Intermediate!11279 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432502 (= lt!630542 (select (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432502 (= lt!630539 (array!97587 (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47649 a!2831)))))

(declare-fun b!1432503 () Bool)

(declare-fun res!965727 () Bool)

(assert (=> b!1432503 (=> (not res!965727) (not e!808864))))

(declare-datatypes ((List!33595 0))(
  ( (Nil!33592) (Cons!33591 (h!34922 (_ BitVec 64)) (t!48281 List!33595)) )
))
(declare-fun arrayNoDuplicates!0 (array!97586 (_ BitVec 32) List!33595) Bool)

(assert (=> b!1432503 (= res!965727 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33592))))

(declare-fun b!1432504 () Bool)

(declare-fun res!965740 () Bool)

(assert (=> b!1432504 (=> (not res!965740) (not e!808864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432504 (= res!965740 (validKeyInArray!0 (select (arr!47098 a!2831) i!982)))))

(declare-fun b!1432505 () Bool)

(declare-fun res!965728 () Bool)

(assert (=> b!1432505 (=> (not res!965728) (not e!808868))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1432505 (= res!965728 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630542 lt!630539 mask!2608) lt!630538))))

(declare-fun b!1432506 () Bool)

(declare-fun res!965730 () Bool)

(assert (=> b!1432506 (=> (not res!965730) (not e!808864))))

(assert (=> b!1432506 (= res!965730 (validKeyInArray!0 (select (arr!47098 a!2831) j!81)))))

(declare-fun b!1432507 () Bool)

(declare-fun res!965738 () Bool)

(assert (=> b!1432507 (=> (not res!965738) (not e!808868))))

(declare-fun lt!630540 () SeekEntryResult!11279)

(assert (=> b!1432507 (= res!965738 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!630540))))

(declare-fun b!1432508 () Bool)

(declare-fun res!965735 () Bool)

(assert (=> b!1432508 (=> (not res!965735) (not e!808864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97586 (_ BitVec 32)) Bool)

(assert (=> b!1432508 (= res!965735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432509 () Bool)

(assert (=> b!1432509 (= e!808864 e!808865)))

(declare-fun res!965736 () Bool)

(assert (=> b!1432509 (=> (not res!965736) (not e!808865))))

(assert (=> b!1432509 (= res!965736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!630540))))

(assert (=> b!1432509 (= lt!630540 (Intermediate!11279 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432510 () Bool)

(declare-fun res!965733 () Bool)

(assert (=> b!1432510 (=> (not res!965733) (not e!808864))))

(assert (=> b!1432510 (= res!965733 (and (= (size!47649 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47649 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47649 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432511 () Bool)

(assert (=> b!1432511 (= e!808868 (not (or (= (select (arr!47098 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47098 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47098 a!2831) index!585) (select (arr!47098 a!2831) j!81)) (not (= (select (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge intermediateAfterX!13 intermediateBeforeX!13) (not undefinedAfter!5))))))

(assert (=> b!1432511 e!808867))

(declare-fun res!965734 () Bool)

(assert (=> b!1432511 (=> (not res!965734) (not e!808867))))

(assert (=> b!1432511 (= res!965734 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48335 0))(
  ( (Unit!48336) )
))
(declare-fun lt!630541 () Unit!48335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48335)

(assert (=> b!1432511 (= lt!630541 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432512 () Bool)

(declare-fun res!965739 () Bool)

(assert (=> b!1432512 (=> (not res!965739) (not e!808864))))

(assert (=> b!1432512 (= res!965739 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47649 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47649 a!2831))))))

(assert (= (and start!123682 res!965729) b!1432510))

(assert (= (and b!1432510 res!965733) b!1432504))

(assert (= (and b!1432504 res!965740) b!1432506))

(assert (= (and b!1432506 res!965730) b!1432508))

(assert (= (and b!1432508 res!965735) b!1432503))

(assert (= (and b!1432503 res!965727) b!1432512))

(assert (= (and b!1432512 res!965739) b!1432509))

(assert (= (and b!1432509 res!965736) b!1432502))

(assert (= (and b!1432502 res!965731) b!1432507))

(assert (= (and b!1432507 res!965738) b!1432505))

(assert (= (and b!1432505 res!965728) b!1432500))

(assert (= (and b!1432500 res!965732) b!1432511))

(assert (= (and b!1432511 res!965734) b!1432499))

(assert (= (and b!1432499 res!965737) b!1432501))

(declare-fun m!1322491 () Bool)

(assert (=> b!1432505 m!1322491))

(declare-fun m!1322493 () Bool)

(assert (=> b!1432511 m!1322493))

(declare-fun m!1322495 () Bool)

(assert (=> b!1432511 m!1322495))

(declare-fun m!1322497 () Bool)

(assert (=> b!1432511 m!1322497))

(declare-fun m!1322499 () Bool)

(assert (=> b!1432511 m!1322499))

(declare-fun m!1322501 () Bool)

(assert (=> b!1432511 m!1322501))

(declare-fun m!1322503 () Bool)

(assert (=> b!1432511 m!1322503))

(assert (=> b!1432501 m!1322497))

(assert (=> b!1432501 m!1322501))

(assert (=> b!1432501 m!1322493))

(assert (=> b!1432501 m!1322495))

(declare-fun m!1322505 () Bool)

(assert (=> b!1432504 m!1322505))

(assert (=> b!1432504 m!1322505))

(declare-fun m!1322507 () Bool)

(assert (=> b!1432504 m!1322507))

(declare-fun m!1322509 () Bool)

(assert (=> b!1432508 m!1322509))

(declare-fun m!1322511 () Bool)

(assert (=> b!1432502 m!1322511))

(assert (=> b!1432502 m!1322511))

(declare-fun m!1322513 () Bool)

(assert (=> b!1432502 m!1322513))

(assert (=> b!1432502 m!1322493))

(declare-fun m!1322515 () Bool)

(assert (=> b!1432502 m!1322515))

(assert (=> b!1432509 m!1322501))

(assert (=> b!1432509 m!1322501))

(declare-fun m!1322517 () Bool)

(assert (=> b!1432509 m!1322517))

(assert (=> b!1432509 m!1322517))

(assert (=> b!1432509 m!1322501))

(declare-fun m!1322519 () Bool)

(assert (=> b!1432509 m!1322519))

(assert (=> b!1432499 m!1322501))

(assert (=> b!1432499 m!1322501))

(declare-fun m!1322521 () Bool)

(assert (=> b!1432499 m!1322521))

(declare-fun m!1322523 () Bool)

(assert (=> start!123682 m!1322523))

(declare-fun m!1322525 () Bool)

(assert (=> start!123682 m!1322525))

(declare-fun m!1322527 () Bool)

(assert (=> b!1432503 m!1322527))

(assert (=> b!1432507 m!1322501))

(assert (=> b!1432507 m!1322501))

(declare-fun m!1322529 () Bool)

(assert (=> b!1432507 m!1322529))

(assert (=> b!1432506 m!1322501))

(assert (=> b!1432506 m!1322501))

(declare-fun m!1322531 () Bool)

(assert (=> b!1432506 m!1322531))

(check-sat (not b!1432505) (not b!1432508) (not b!1432511) (not b!1432503) (not b!1432499) (not b!1432502) (not b!1432506) (not b!1432507) (not b!1432504) (not b!1432509) (not start!123682))
(check-sat)
(get-model)

(declare-fun d!154273 () Bool)

(assert (=> d!154273 (= (validKeyInArray!0 (select (arr!47098 a!2831) j!81)) (and (not (= (select (arr!47098 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47098 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432506 d!154273))

(declare-fun b!1432605 () Bool)

(declare-fun e!808905 () Bool)

(declare-fun e!808906 () Bool)

(assert (=> b!1432605 (= e!808905 e!808906)))

(declare-fun lt!630579 () (_ BitVec 64))

(assert (=> b!1432605 (= lt!630579 (select (arr!47098 a!2831) j!81))))

(declare-fun lt!630581 () Unit!48335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97586 (_ BitVec 64) (_ BitVec 32)) Unit!48335)

(assert (=> b!1432605 (= lt!630581 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630579 j!81))))

(declare-fun arrayContainsKey!0 (array!97586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1432605 (arrayContainsKey!0 a!2831 lt!630579 #b00000000000000000000000000000000)))

(declare-fun lt!630580 () Unit!48335)

(assert (=> b!1432605 (= lt!630580 lt!630581)))

(declare-fun res!965829 () Bool)

(assert (=> b!1432605 (= res!965829 (= (seekEntryOrOpen!0 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) (Found!11279 j!81)))))

(assert (=> b!1432605 (=> (not res!965829) (not e!808906))))

(declare-fun b!1432606 () Bool)

(declare-fun call!67536 () Bool)

(assert (=> b!1432606 (= e!808905 call!67536)))

(declare-fun b!1432607 () Bool)

(declare-fun e!808907 () Bool)

(assert (=> b!1432607 (= e!808907 e!808905)))

(declare-fun c!132892 () Bool)

(assert (=> b!1432607 (= c!132892 (validKeyInArray!0 (select (arr!47098 a!2831) j!81)))))

(declare-fun d!154275 () Bool)

(declare-fun res!965830 () Bool)

(assert (=> d!154275 (=> res!965830 e!808907)))

(assert (=> d!154275 (= res!965830 (bvsge j!81 (size!47649 a!2831)))))

(assert (=> d!154275 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808907)))

(declare-fun bm!67533 () Bool)

(assert (=> bm!67533 (= call!67536 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432608 () Bool)

(assert (=> b!1432608 (= e!808906 call!67536)))

(assert (= (and d!154275 (not res!965830)) b!1432607))

(assert (= (and b!1432607 c!132892) b!1432605))

(assert (= (and b!1432607 (not c!132892)) b!1432606))

(assert (= (and b!1432605 res!965829) b!1432608))

(assert (= (or b!1432608 b!1432606) bm!67533))

(assert (=> b!1432605 m!1322501))

(declare-fun m!1322617 () Bool)

(assert (=> b!1432605 m!1322617))

(declare-fun m!1322619 () Bool)

(assert (=> b!1432605 m!1322619))

(assert (=> b!1432605 m!1322501))

(assert (=> b!1432605 m!1322521))

(assert (=> b!1432607 m!1322501))

(assert (=> b!1432607 m!1322501))

(assert (=> b!1432607 m!1322531))

(declare-fun m!1322621 () Bool)

(assert (=> bm!67533 m!1322621))

(assert (=> b!1432511 d!154275))

(declare-fun d!154277 () Bool)

(assert (=> d!154277 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630584 () Unit!48335)

(declare-fun choose!38 (array!97586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48335)

(assert (=> d!154277 (= lt!630584 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154277 (validMask!0 mask!2608)))

(assert (=> d!154277 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630584)))

(declare-fun bs!41695 () Bool)

(assert (= bs!41695 d!154277))

(assert (=> bs!41695 m!1322499))

(declare-fun m!1322623 () Bool)

(assert (=> bs!41695 m!1322623))

(assert (=> bs!41695 m!1322523))

(assert (=> b!1432511 d!154277))

(declare-fun b!1432627 () Bool)

(declare-fun e!808920 () Bool)

(declare-fun e!808918 () Bool)

(assert (=> b!1432627 (= e!808920 e!808918)))

(declare-fun res!965839 () Bool)

(declare-fun lt!630590 () SeekEntryResult!11279)

(get-info :version)

(assert (=> b!1432627 (= res!965839 (and ((_ is Intermediate!11279) lt!630590) (not (undefined!12091 lt!630590)) (bvslt (x!129315 lt!630590) #b01111111111111111111111111111110) (bvsge (x!129315 lt!630590) #b00000000000000000000000000000000) (bvsge (x!129315 lt!630590) #b00000000000000000000000000000000)))))

(assert (=> b!1432627 (=> (not res!965839) (not e!808918))))

(declare-fun e!808922 () SeekEntryResult!11279)

(declare-fun b!1432628 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432628 (= e!808922 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630542 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!630542 lt!630539 mask!2608))))

(declare-fun b!1432629 () Bool)

(declare-fun e!808921 () SeekEntryResult!11279)

(assert (=> b!1432629 (= e!808921 e!808922)))

(declare-fun c!132901 () Bool)

(declare-fun lt!630589 () (_ BitVec 64))

(assert (=> b!1432629 (= c!132901 (or (= lt!630589 lt!630542) (= (bvadd lt!630589 lt!630589) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432630 () Bool)

(assert (=> b!1432630 (= e!808920 (bvsge (x!129315 lt!630590) #b01111111111111111111111111111110))))

(declare-fun b!1432631 () Bool)

(assert (=> b!1432631 (= e!808922 (Intermediate!11279 false (toIndex!0 lt!630542 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432632 () Bool)

(assert (=> b!1432632 (and (bvsge (index!47510 lt!630590) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630590) (size!47649 lt!630539)))))

(declare-fun e!808919 () Bool)

(assert (=> b!1432632 (= e!808919 (= (select (arr!47098 lt!630539) (index!47510 lt!630590)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432633 () Bool)

(assert (=> b!1432633 (and (bvsge (index!47510 lt!630590) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630590) (size!47649 lt!630539)))))

(declare-fun res!965838 () Bool)

(assert (=> b!1432633 (= res!965838 (= (select (arr!47098 lt!630539) (index!47510 lt!630590)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432633 (=> res!965838 e!808919)))

(declare-fun b!1432634 () Bool)

(assert (=> b!1432634 (= e!808921 (Intermediate!11279 true (toIndex!0 lt!630542 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432635 () Bool)

(assert (=> b!1432635 (and (bvsge (index!47510 lt!630590) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630590) (size!47649 lt!630539)))))

(declare-fun res!965837 () Bool)

(assert (=> b!1432635 (= res!965837 (= (select (arr!47098 lt!630539) (index!47510 lt!630590)) lt!630542))))

(assert (=> b!1432635 (=> res!965837 e!808919)))

(assert (=> b!1432635 (= e!808918 e!808919)))

(declare-fun d!154279 () Bool)

(assert (=> d!154279 e!808920))

(declare-fun c!132899 () Bool)

(assert (=> d!154279 (= c!132899 (and ((_ is Intermediate!11279) lt!630590) (undefined!12091 lt!630590)))))

(assert (=> d!154279 (= lt!630590 e!808921)))

(declare-fun c!132900 () Bool)

(assert (=> d!154279 (= c!132900 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154279 (= lt!630589 (select (arr!47098 lt!630539) (toIndex!0 lt!630542 mask!2608)))))

(assert (=> d!154279 (validMask!0 mask!2608)))

(assert (=> d!154279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630542 mask!2608) lt!630542 lt!630539 mask!2608) lt!630590)))

(assert (= (and d!154279 c!132900) b!1432634))

(assert (= (and d!154279 (not c!132900)) b!1432629))

(assert (= (and b!1432629 c!132901) b!1432631))

(assert (= (and b!1432629 (not c!132901)) b!1432628))

(assert (= (and d!154279 c!132899) b!1432630))

(assert (= (and d!154279 (not c!132899)) b!1432627))

(assert (= (and b!1432627 res!965839) b!1432635))

(assert (= (and b!1432635 (not res!965837)) b!1432633))

(assert (= (and b!1432633 (not res!965838)) b!1432632))

(assert (=> b!1432628 m!1322511))

(declare-fun m!1322625 () Bool)

(assert (=> b!1432628 m!1322625))

(assert (=> b!1432628 m!1322625))

(declare-fun m!1322627 () Bool)

(assert (=> b!1432628 m!1322627))

(assert (=> d!154279 m!1322511))

(declare-fun m!1322629 () Bool)

(assert (=> d!154279 m!1322629))

(assert (=> d!154279 m!1322523))

(declare-fun m!1322631 () Bool)

(assert (=> b!1432635 m!1322631))

(assert (=> b!1432632 m!1322631))

(assert (=> b!1432633 m!1322631))

(assert (=> b!1432502 d!154279))

(declare-fun d!154281 () Bool)

(declare-fun lt!630596 () (_ BitVec 32))

(declare-fun lt!630595 () (_ BitVec 32))

(assert (=> d!154281 (= lt!630596 (bvmul (bvxor lt!630595 (bvlshr lt!630595 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154281 (= lt!630595 ((_ extract 31 0) (bvand (bvxor lt!630542 (bvlshr lt!630542 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154281 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965840 (let ((h!34925 ((_ extract 31 0) (bvand (bvxor lt!630542 (bvlshr lt!630542 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129319 (bvmul (bvxor h!34925 (bvlshr h!34925 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129319 (bvlshr x!129319 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965840 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965840 #b00000000000000000000000000000000))))))

(assert (=> d!154281 (= (toIndex!0 lt!630542 mask!2608) (bvand (bvxor lt!630596 (bvlshr lt!630596 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432502 d!154281))

(declare-fun b!1432636 () Bool)

(declare-fun e!808925 () Bool)

(declare-fun e!808923 () Bool)

(assert (=> b!1432636 (= e!808925 e!808923)))

(declare-fun res!965843 () Bool)

(declare-fun lt!630598 () SeekEntryResult!11279)

(assert (=> b!1432636 (= res!965843 (and ((_ is Intermediate!11279) lt!630598) (not (undefined!12091 lt!630598)) (bvslt (x!129315 lt!630598) #b01111111111111111111111111111110) (bvsge (x!129315 lt!630598) #b00000000000000000000000000000000) (bvsge (x!129315 lt!630598) x!605)))))

(assert (=> b!1432636 (=> (not res!965843) (not e!808923))))

(declare-fun b!1432637 () Bool)

(declare-fun e!808927 () SeekEntryResult!11279)

(assert (=> b!1432637 (= e!808927 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47098 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1432638 () Bool)

(declare-fun e!808926 () SeekEntryResult!11279)

(assert (=> b!1432638 (= e!808926 e!808927)))

(declare-fun lt!630597 () (_ BitVec 64))

(declare-fun c!132904 () Bool)

(assert (=> b!1432638 (= c!132904 (or (= lt!630597 (select (arr!47098 a!2831) j!81)) (= (bvadd lt!630597 lt!630597) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432639 () Bool)

(assert (=> b!1432639 (= e!808925 (bvsge (x!129315 lt!630598) #b01111111111111111111111111111110))))

(declare-fun b!1432640 () Bool)

(assert (=> b!1432640 (= e!808927 (Intermediate!11279 false index!585 x!605))))

(declare-fun b!1432641 () Bool)

(assert (=> b!1432641 (and (bvsge (index!47510 lt!630598) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630598) (size!47649 a!2831)))))

(declare-fun e!808924 () Bool)

(assert (=> b!1432641 (= e!808924 (= (select (arr!47098 a!2831) (index!47510 lt!630598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432642 () Bool)

(assert (=> b!1432642 (and (bvsge (index!47510 lt!630598) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630598) (size!47649 a!2831)))))

(declare-fun res!965842 () Bool)

(assert (=> b!1432642 (= res!965842 (= (select (arr!47098 a!2831) (index!47510 lt!630598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432642 (=> res!965842 e!808924)))

(declare-fun b!1432643 () Bool)

(assert (=> b!1432643 (= e!808926 (Intermediate!11279 true index!585 x!605))))

(declare-fun b!1432644 () Bool)

(assert (=> b!1432644 (and (bvsge (index!47510 lt!630598) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630598) (size!47649 a!2831)))))

(declare-fun res!965841 () Bool)

(assert (=> b!1432644 (= res!965841 (= (select (arr!47098 a!2831) (index!47510 lt!630598)) (select (arr!47098 a!2831) j!81)))))

(assert (=> b!1432644 (=> res!965841 e!808924)))

(assert (=> b!1432644 (= e!808923 e!808924)))

(declare-fun d!154283 () Bool)

(assert (=> d!154283 e!808925))

(declare-fun c!132902 () Bool)

(assert (=> d!154283 (= c!132902 (and ((_ is Intermediate!11279) lt!630598) (undefined!12091 lt!630598)))))

(assert (=> d!154283 (= lt!630598 e!808926)))

(declare-fun c!132903 () Bool)

(assert (=> d!154283 (= c!132903 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154283 (= lt!630597 (select (arr!47098 a!2831) index!585))))

(assert (=> d!154283 (validMask!0 mask!2608)))

(assert (=> d!154283 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!630598)))

(assert (= (and d!154283 c!132903) b!1432643))

(assert (= (and d!154283 (not c!132903)) b!1432638))

(assert (= (and b!1432638 c!132904) b!1432640))

(assert (= (and b!1432638 (not c!132904)) b!1432637))

(assert (= (and d!154283 c!132902) b!1432639))

(assert (= (and d!154283 (not c!132902)) b!1432636))

(assert (= (and b!1432636 res!965843) b!1432644))

(assert (= (and b!1432644 (not res!965841)) b!1432642))

(assert (= (and b!1432642 (not res!965842)) b!1432641))

(declare-fun m!1322633 () Bool)

(assert (=> b!1432637 m!1322633))

(assert (=> b!1432637 m!1322633))

(assert (=> b!1432637 m!1322501))

(declare-fun m!1322635 () Bool)

(assert (=> b!1432637 m!1322635))

(assert (=> d!154283 m!1322497))

(assert (=> d!154283 m!1322523))

(declare-fun m!1322637 () Bool)

(assert (=> b!1432644 m!1322637))

(assert (=> b!1432641 m!1322637))

(assert (=> b!1432642 m!1322637))

(assert (=> b!1432507 d!154283))

(declare-fun b!1432645 () Bool)

(declare-fun e!808928 () Bool)

(declare-fun e!808929 () Bool)

(assert (=> b!1432645 (= e!808928 e!808929)))

(declare-fun lt!630599 () (_ BitVec 64))

(assert (=> b!1432645 (= lt!630599 (select (arr!47098 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630601 () Unit!48335)

(assert (=> b!1432645 (= lt!630601 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630599 #b00000000000000000000000000000000))))

(assert (=> b!1432645 (arrayContainsKey!0 a!2831 lt!630599 #b00000000000000000000000000000000)))

(declare-fun lt!630600 () Unit!48335)

(assert (=> b!1432645 (= lt!630600 lt!630601)))

(declare-fun res!965844 () Bool)

(assert (=> b!1432645 (= res!965844 (= (seekEntryOrOpen!0 (select (arr!47098 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11279 #b00000000000000000000000000000000)))))

(assert (=> b!1432645 (=> (not res!965844) (not e!808929))))

(declare-fun b!1432646 () Bool)

(declare-fun call!67537 () Bool)

(assert (=> b!1432646 (= e!808928 call!67537)))

(declare-fun b!1432647 () Bool)

(declare-fun e!808930 () Bool)

(assert (=> b!1432647 (= e!808930 e!808928)))

(declare-fun c!132905 () Bool)

(assert (=> b!1432647 (= c!132905 (validKeyInArray!0 (select (arr!47098 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!154285 () Bool)

(declare-fun res!965845 () Bool)

(assert (=> d!154285 (=> res!965845 e!808930)))

(assert (=> d!154285 (= res!965845 (bvsge #b00000000000000000000000000000000 (size!47649 a!2831)))))

(assert (=> d!154285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808930)))

(declare-fun bm!67534 () Bool)

(assert (=> bm!67534 (= call!67537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432648 () Bool)

(assert (=> b!1432648 (= e!808929 call!67537)))

(assert (= (and d!154285 (not res!965845)) b!1432647))

(assert (= (and b!1432647 c!132905) b!1432645))

(assert (= (and b!1432647 (not c!132905)) b!1432646))

(assert (= (and b!1432645 res!965844) b!1432648))

(assert (= (or b!1432648 b!1432646) bm!67534))

(declare-fun m!1322639 () Bool)

(assert (=> b!1432645 m!1322639))

(declare-fun m!1322641 () Bool)

(assert (=> b!1432645 m!1322641))

(declare-fun m!1322643 () Bool)

(assert (=> b!1432645 m!1322643))

(assert (=> b!1432645 m!1322639))

(declare-fun m!1322645 () Bool)

(assert (=> b!1432645 m!1322645))

(assert (=> b!1432647 m!1322639))

(assert (=> b!1432647 m!1322639))

(declare-fun m!1322647 () Bool)

(assert (=> b!1432647 m!1322647))

(declare-fun m!1322649 () Bool)

(assert (=> bm!67534 m!1322649))

(assert (=> b!1432508 d!154285))

(declare-fun d!154287 () Bool)

(declare-fun res!965854 () Bool)

(declare-fun e!808941 () Bool)

(assert (=> d!154287 (=> res!965854 e!808941)))

(assert (=> d!154287 (= res!965854 (bvsge #b00000000000000000000000000000000 (size!47649 a!2831)))))

(assert (=> d!154287 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33592) e!808941)))

(declare-fun b!1432659 () Bool)

(declare-fun e!808939 () Bool)

(declare-fun call!67540 () Bool)

(assert (=> b!1432659 (= e!808939 call!67540)))

(declare-fun b!1432660 () Bool)

(declare-fun e!808942 () Bool)

(assert (=> b!1432660 (= e!808941 e!808942)))

(declare-fun res!965853 () Bool)

(assert (=> b!1432660 (=> (not res!965853) (not e!808942))))

(declare-fun e!808940 () Bool)

(assert (=> b!1432660 (= res!965853 (not e!808940))))

(declare-fun res!965852 () Bool)

(assert (=> b!1432660 (=> (not res!965852) (not e!808940))))

(assert (=> b!1432660 (= res!965852 (validKeyInArray!0 (select (arr!47098 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432661 () Bool)

(declare-fun contains!9910 (List!33595 (_ BitVec 64)) Bool)

(assert (=> b!1432661 (= e!808940 (contains!9910 Nil!33592 (select (arr!47098 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432662 () Bool)

(assert (=> b!1432662 (= e!808942 e!808939)))

(declare-fun c!132908 () Bool)

(assert (=> b!1432662 (= c!132908 (validKeyInArray!0 (select (arr!47098 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432663 () Bool)

(assert (=> b!1432663 (= e!808939 call!67540)))

(declare-fun bm!67537 () Bool)

(assert (=> bm!67537 (= call!67540 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132908 (Cons!33591 (select (arr!47098 a!2831) #b00000000000000000000000000000000) Nil!33592) Nil!33592)))))

(assert (= (and d!154287 (not res!965854)) b!1432660))

(assert (= (and b!1432660 res!965852) b!1432661))

(assert (= (and b!1432660 res!965853) b!1432662))

(assert (= (and b!1432662 c!132908) b!1432663))

(assert (= (and b!1432662 (not c!132908)) b!1432659))

(assert (= (or b!1432663 b!1432659) bm!67537))

(assert (=> b!1432660 m!1322639))

(assert (=> b!1432660 m!1322639))

(assert (=> b!1432660 m!1322647))

(assert (=> b!1432661 m!1322639))

(assert (=> b!1432661 m!1322639))

(declare-fun m!1322651 () Bool)

(assert (=> b!1432661 m!1322651))

(assert (=> b!1432662 m!1322639))

(assert (=> b!1432662 m!1322639))

(assert (=> b!1432662 m!1322647))

(assert (=> bm!67537 m!1322639))

(declare-fun m!1322653 () Bool)

(assert (=> bm!67537 m!1322653))

(assert (=> b!1432503 d!154287))

(declare-fun d!154289 () Bool)

(assert (=> d!154289 (= (validKeyInArray!0 (select (arr!47098 a!2831) i!982)) (and (not (= (select (arr!47098 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47098 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432504 d!154289))

(declare-fun b!1432664 () Bool)

(declare-fun e!808945 () Bool)

(declare-fun e!808943 () Bool)

(assert (=> b!1432664 (= e!808945 e!808943)))

(declare-fun res!965857 () Bool)

(declare-fun lt!630603 () SeekEntryResult!11279)

(assert (=> b!1432664 (= res!965857 (and ((_ is Intermediate!11279) lt!630603) (not (undefined!12091 lt!630603)) (bvslt (x!129315 lt!630603) #b01111111111111111111111111111110) (bvsge (x!129315 lt!630603) #b00000000000000000000000000000000) (bvsge (x!129315 lt!630603) #b00000000000000000000000000000000)))))

(assert (=> b!1432664 (=> (not res!965857) (not e!808943))))

(declare-fun b!1432665 () Bool)

(declare-fun e!808947 () SeekEntryResult!11279)

(assert (=> b!1432665 (= e!808947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47098 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1432666 () Bool)

(declare-fun e!808946 () SeekEntryResult!11279)

(assert (=> b!1432666 (= e!808946 e!808947)))

(declare-fun c!132911 () Bool)

(declare-fun lt!630602 () (_ BitVec 64))

(assert (=> b!1432666 (= c!132911 (or (= lt!630602 (select (arr!47098 a!2831) j!81)) (= (bvadd lt!630602 lt!630602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432667 () Bool)

(assert (=> b!1432667 (= e!808945 (bvsge (x!129315 lt!630603) #b01111111111111111111111111111110))))

(declare-fun b!1432668 () Bool)

(assert (=> b!1432668 (= e!808947 (Intermediate!11279 false (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432669 () Bool)

(assert (=> b!1432669 (and (bvsge (index!47510 lt!630603) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630603) (size!47649 a!2831)))))

(declare-fun e!808944 () Bool)

(assert (=> b!1432669 (= e!808944 (= (select (arr!47098 a!2831) (index!47510 lt!630603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432670 () Bool)

(assert (=> b!1432670 (and (bvsge (index!47510 lt!630603) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630603) (size!47649 a!2831)))))

(declare-fun res!965856 () Bool)

(assert (=> b!1432670 (= res!965856 (= (select (arr!47098 a!2831) (index!47510 lt!630603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432670 (=> res!965856 e!808944)))

(declare-fun b!1432671 () Bool)

(assert (=> b!1432671 (= e!808946 (Intermediate!11279 true (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432672 () Bool)

(assert (=> b!1432672 (and (bvsge (index!47510 lt!630603) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630603) (size!47649 a!2831)))))

(declare-fun res!965855 () Bool)

(assert (=> b!1432672 (= res!965855 (= (select (arr!47098 a!2831) (index!47510 lt!630603)) (select (arr!47098 a!2831) j!81)))))

(assert (=> b!1432672 (=> res!965855 e!808944)))

(assert (=> b!1432672 (= e!808943 e!808944)))

(declare-fun d!154291 () Bool)

(assert (=> d!154291 e!808945))

(declare-fun c!132909 () Bool)

(assert (=> d!154291 (= c!132909 (and ((_ is Intermediate!11279) lt!630603) (undefined!12091 lt!630603)))))

(assert (=> d!154291 (= lt!630603 e!808946)))

(declare-fun c!132910 () Bool)

(assert (=> d!154291 (= c!132910 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154291 (= lt!630602 (select (arr!47098 a!2831) (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608)))))

(assert (=> d!154291 (validMask!0 mask!2608)))

(assert (=> d!154291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!630603)))

(assert (= (and d!154291 c!132910) b!1432671))

(assert (= (and d!154291 (not c!132910)) b!1432666))

(assert (= (and b!1432666 c!132911) b!1432668))

(assert (= (and b!1432666 (not c!132911)) b!1432665))

(assert (= (and d!154291 c!132909) b!1432667))

(assert (= (and d!154291 (not c!132909)) b!1432664))

(assert (= (and b!1432664 res!965857) b!1432672))

(assert (= (and b!1432672 (not res!965855)) b!1432670))

(assert (= (and b!1432670 (not res!965856)) b!1432669))

(assert (=> b!1432665 m!1322517))

(declare-fun m!1322655 () Bool)

(assert (=> b!1432665 m!1322655))

(assert (=> b!1432665 m!1322655))

(assert (=> b!1432665 m!1322501))

(declare-fun m!1322657 () Bool)

(assert (=> b!1432665 m!1322657))

(assert (=> d!154291 m!1322517))

(declare-fun m!1322659 () Bool)

(assert (=> d!154291 m!1322659))

(assert (=> d!154291 m!1322523))

(declare-fun m!1322661 () Bool)

(assert (=> b!1432672 m!1322661))

(assert (=> b!1432669 m!1322661))

(assert (=> b!1432670 m!1322661))

(assert (=> b!1432509 d!154291))

(declare-fun d!154293 () Bool)

(declare-fun lt!630605 () (_ BitVec 32))

(declare-fun lt!630604 () (_ BitVec 32))

(assert (=> d!154293 (= lt!630605 (bvmul (bvxor lt!630604 (bvlshr lt!630604 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154293 (= lt!630604 ((_ extract 31 0) (bvand (bvxor (select (arr!47098 a!2831) j!81) (bvlshr (select (arr!47098 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154293 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965840 (let ((h!34925 ((_ extract 31 0) (bvand (bvxor (select (arr!47098 a!2831) j!81) (bvlshr (select (arr!47098 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129319 (bvmul (bvxor h!34925 (bvlshr h!34925 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129319 (bvlshr x!129319 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965840 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965840 #b00000000000000000000000000000000))))))

(assert (=> d!154293 (= (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) (bvand (bvxor lt!630605 (bvlshr lt!630605 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432509 d!154293))

(declare-fun d!154295 () Bool)

(assert (=> d!154295 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123682 d!154295))

(declare-fun d!154299 () Bool)

(assert (=> d!154299 (= (array_inv!36379 a!2831) (bvsge (size!47649 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123682 d!154299))

(declare-fun b!1432712 () Bool)

(declare-fun e!808971 () SeekEntryResult!11279)

(declare-fun lt!630618 () SeekEntryResult!11279)

(assert (=> b!1432712 (= e!808971 (MissingZero!11279 (index!47510 lt!630618)))))

(declare-fun d!154301 () Bool)

(declare-fun lt!630620 () SeekEntryResult!11279)

(assert (=> d!154301 (and (or ((_ is Undefined!11279) lt!630620) (not ((_ is Found!11279) lt!630620)) (and (bvsge (index!47509 lt!630620) #b00000000000000000000000000000000) (bvslt (index!47509 lt!630620) (size!47649 a!2831)))) (or ((_ is Undefined!11279) lt!630620) ((_ is Found!11279) lt!630620) (not ((_ is MissingZero!11279) lt!630620)) (and (bvsge (index!47508 lt!630620) #b00000000000000000000000000000000) (bvslt (index!47508 lt!630620) (size!47649 a!2831)))) (or ((_ is Undefined!11279) lt!630620) ((_ is Found!11279) lt!630620) ((_ is MissingZero!11279) lt!630620) (not ((_ is MissingVacant!11279) lt!630620)) (and (bvsge (index!47511 lt!630620) #b00000000000000000000000000000000) (bvslt (index!47511 lt!630620) (size!47649 a!2831)))) (or ((_ is Undefined!11279) lt!630620) (ite ((_ is Found!11279) lt!630620) (= (select (arr!47098 a!2831) (index!47509 lt!630620)) (select (arr!47098 a!2831) j!81)) (ite ((_ is MissingZero!11279) lt!630620) (= (select (arr!47098 a!2831) (index!47508 lt!630620)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11279) lt!630620) (= (select (arr!47098 a!2831) (index!47511 lt!630620)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!808970 () SeekEntryResult!11279)

(assert (=> d!154301 (= lt!630620 e!808970)))

(declare-fun c!132928 () Bool)

(assert (=> d!154301 (= c!132928 (and ((_ is Intermediate!11279) lt!630618) (undefined!12091 lt!630618)))))

(assert (=> d!154301 (= lt!630618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) (select (arr!47098 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154301 (validMask!0 mask!2608)))

(assert (=> d!154301 (= (seekEntryOrOpen!0 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!630620)))

(declare-fun b!1432713 () Bool)

(declare-fun e!808969 () SeekEntryResult!11279)

(assert (=> b!1432713 (= e!808970 e!808969)))

(declare-fun lt!630619 () (_ BitVec 64))

(assert (=> b!1432713 (= lt!630619 (select (arr!47098 a!2831) (index!47510 lt!630618)))))

(declare-fun c!132927 () Bool)

(assert (=> b!1432713 (= c!132927 (= lt!630619 (select (arr!47098 a!2831) j!81)))))

(declare-fun b!1432714 () Bool)

(assert (=> b!1432714 (= e!808970 Undefined!11279)))

(declare-fun b!1432715 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97586 (_ BitVec 32)) SeekEntryResult!11279)

(assert (=> b!1432715 (= e!808971 (seekKeyOrZeroReturnVacant!0 (x!129315 lt!630618) (index!47510 lt!630618) (index!47510 lt!630618) (select (arr!47098 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1432716 () Bool)

(declare-fun c!132929 () Bool)

(assert (=> b!1432716 (= c!132929 (= lt!630619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432716 (= e!808969 e!808971)))

(declare-fun b!1432717 () Bool)

(assert (=> b!1432717 (= e!808969 (Found!11279 (index!47510 lt!630618)))))

(assert (= (and d!154301 c!132928) b!1432714))

(assert (= (and d!154301 (not c!132928)) b!1432713))

(assert (= (and b!1432713 c!132927) b!1432717))

(assert (= (and b!1432713 (not c!132927)) b!1432716))

(assert (= (and b!1432716 c!132929) b!1432712))

(assert (= (and b!1432716 (not c!132929)) b!1432715))

(declare-fun m!1322671 () Bool)

(assert (=> d!154301 m!1322671))

(assert (=> d!154301 m!1322517))

(assert (=> d!154301 m!1322501))

(assert (=> d!154301 m!1322519))

(assert (=> d!154301 m!1322501))

(assert (=> d!154301 m!1322517))

(assert (=> d!154301 m!1322523))

(declare-fun m!1322673 () Bool)

(assert (=> d!154301 m!1322673))

(declare-fun m!1322675 () Bool)

(assert (=> d!154301 m!1322675))

(declare-fun m!1322677 () Bool)

(assert (=> b!1432713 m!1322677))

(assert (=> b!1432715 m!1322501))

(declare-fun m!1322679 () Bool)

(assert (=> b!1432715 m!1322679))

(assert (=> b!1432499 d!154301))

(declare-fun b!1432718 () Bool)

(declare-fun e!808974 () Bool)

(declare-fun e!808972 () Bool)

(assert (=> b!1432718 (= e!808974 e!808972)))

(declare-fun res!965870 () Bool)

(declare-fun lt!630622 () SeekEntryResult!11279)

(assert (=> b!1432718 (= res!965870 (and ((_ is Intermediate!11279) lt!630622) (not (undefined!12091 lt!630622)) (bvslt (x!129315 lt!630622) #b01111111111111111111111111111110) (bvsge (x!129315 lt!630622) #b00000000000000000000000000000000) (bvsge (x!129315 lt!630622) x!605)))))

(assert (=> b!1432718 (=> (not res!965870) (not e!808972))))

(declare-fun b!1432719 () Bool)

(declare-fun e!808976 () SeekEntryResult!11279)

(assert (=> b!1432719 (= e!808976 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!630542 lt!630539 mask!2608))))

(declare-fun b!1432720 () Bool)

(declare-fun e!808975 () SeekEntryResult!11279)

(assert (=> b!1432720 (= e!808975 e!808976)))

(declare-fun c!132932 () Bool)

(declare-fun lt!630621 () (_ BitVec 64))

(assert (=> b!1432720 (= c!132932 (or (= lt!630621 lt!630542) (= (bvadd lt!630621 lt!630621) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432721 () Bool)

(assert (=> b!1432721 (= e!808974 (bvsge (x!129315 lt!630622) #b01111111111111111111111111111110))))

(declare-fun b!1432722 () Bool)

(assert (=> b!1432722 (= e!808976 (Intermediate!11279 false index!585 x!605))))

(declare-fun b!1432723 () Bool)

(assert (=> b!1432723 (and (bvsge (index!47510 lt!630622) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630622) (size!47649 lt!630539)))))

(declare-fun e!808973 () Bool)

(assert (=> b!1432723 (= e!808973 (= (select (arr!47098 lt!630539) (index!47510 lt!630622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432724 () Bool)

(assert (=> b!1432724 (and (bvsge (index!47510 lt!630622) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630622) (size!47649 lt!630539)))))

(declare-fun res!965869 () Bool)

(assert (=> b!1432724 (= res!965869 (= (select (arr!47098 lt!630539) (index!47510 lt!630622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432724 (=> res!965869 e!808973)))

(declare-fun b!1432725 () Bool)

(assert (=> b!1432725 (= e!808975 (Intermediate!11279 true index!585 x!605))))

(declare-fun b!1432726 () Bool)

(assert (=> b!1432726 (and (bvsge (index!47510 lt!630622) #b00000000000000000000000000000000) (bvslt (index!47510 lt!630622) (size!47649 lt!630539)))))

(declare-fun res!965868 () Bool)

(assert (=> b!1432726 (= res!965868 (= (select (arr!47098 lt!630539) (index!47510 lt!630622)) lt!630542))))

(assert (=> b!1432726 (=> res!965868 e!808973)))

(assert (=> b!1432726 (= e!808972 e!808973)))

(declare-fun d!154307 () Bool)

(assert (=> d!154307 e!808974))

(declare-fun c!132930 () Bool)

(assert (=> d!154307 (= c!132930 (and ((_ is Intermediate!11279) lt!630622) (undefined!12091 lt!630622)))))

(assert (=> d!154307 (= lt!630622 e!808975)))

(declare-fun c!132931 () Bool)

(assert (=> d!154307 (= c!132931 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154307 (= lt!630621 (select (arr!47098 lt!630539) index!585))))

(assert (=> d!154307 (validMask!0 mask!2608)))

(assert (=> d!154307 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630542 lt!630539 mask!2608) lt!630622)))

(assert (= (and d!154307 c!132931) b!1432725))

(assert (= (and d!154307 (not c!132931)) b!1432720))

(assert (= (and b!1432720 c!132932) b!1432722))

(assert (= (and b!1432720 (not c!132932)) b!1432719))

(assert (= (and d!154307 c!132930) b!1432721))

(assert (= (and d!154307 (not c!132930)) b!1432718))

(assert (= (and b!1432718 res!965870) b!1432726))

(assert (= (and b!1432726 (not res!965868)) b!1432724))

(assert (= (and b!1432724 (not res!965869)) b!1432723))

(assert (=> b!1432719 m!1322633))

(assert (=> b!1432719 m!1322633))

(declare-fun m!1322681 () Bool)

(assert (=> b!1432719 m!1322681))

(declare-fun m!1322683 () Bool)

(assert (=> d!154307 m!1322683))

(assert (=> d!154307 m!1322523))

(declare-fun m!1322685 () Bool)

(assert (=> b!1432726 m!1322685))

(assert (=> b!1432723 m!1322685))

(assert (=> b!1432724 m!1322685))

(assert (=> b!1432505 d!154307))

(check-sat (not d!154279) (not d!154291) (not b!1432662) (not d!154307) (not bm!67534) (not d!154283) (not bm!67533) (not d!154277) (not b!1432719) (not b!1432605) (not b!1432645) (not b!1432660) (not b!1432647) (not b!1432661) (not b!1432665) (not d!154301) (not bm!67537) (not b!1432637) (not b!1432607) (not b!1432715) (not b!1432628))
(check-sat)
