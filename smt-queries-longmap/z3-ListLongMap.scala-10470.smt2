; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123092 () Bool)

(assert start!123092)

(declare-fun b!1427544 () Bool)

(declare-fun res!962587 () Bool)

(declare-fun e!806273 () Bool)

(assert (=> b!1427544 (=> (not res!962587) (not e!806273))))

(declare-datatypes ((array!97355 0))(
  ( (array!97356 (arr!46992 (Array (_ BitVec 32) (_ BitVec 64))) (size!47542 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97355)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427544 (= res!962587 (validKeyInArray!0 (select (arr!46992 a!2831) j!81)))))

(declare-fun b!1427545 () Bool)

(declare-fun e!806270 () Bool)

(declare-fun e!806269 () Bool)

(assert (=> b!1427545 (= e!806270 e!806269)))

(declare-fun res!962579 () Bool)

(assert (=> b!1427545 (=> (not res!962579) (not e!806269))))

(declare-fun lt!628612 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11271 0))(
  ( (MissingZero!11271 (index!47476 (_ BitVec 32))) (Found!11271 (index!47477 (_ BitVec 32))) (Intermediate!11271 (undefined!12083 Bool) (index!47478 (_ BitVec 32)) (x!129109 (_ BitVec 32))) (Undefined!11271) (MissingVacant!11271 (index!47479 (_ BitVec 32))) )
))
(declare-fun lt!628613 () SeekEntryResult!11271)

(declare-fun lt!628611 () array!97355)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97355 (_ BitVec 32)) SeekEntryResult!11271)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427545 (= res!962579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628612 mask!2608) lt!628612 lt!628611 mask!2608) lt!628613))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427545 (= lt!628613 (Intermediate!11271 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427545 (= lt!628612 (select (store (arr!46992 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427545 (= lt!628611 (array!97356 (store (arr!46992 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47542 a!2831)))))

(declare-fun b!1427546 () Bool)

(declare-fun res!962582 () Bool)

(assert (=> b!1427546 (=> (not res!962582) (not e!806269))))

(declare-fun lt!628610 () SeekEntryResult!11271)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427546 (= res!962582 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46992 a!2831) j!81) a!2831 mask!2608) lt!628610))))

(declare-fun b!1427547 () Bool)

(declare-fun res!962584 () Bool)

(assert (=> b!1427547 (=> (not res!962584) (not e!806273))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427547 (= res!962584 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47542 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47542 a!2831))))))

(declare-fun b!1427548 () Bool)

(declare-fun res!962585 () Bool)

(assert (=> b!1427548 (=> (not res!962585) (not e!806269))))

(assert (=> b!1427548 (= res!962585 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628612 lt!628611 mask!2608) lt!628613))))

(declare-fun b!1427550 () Bool)

(declare-fun res!962586 () Bool)

(assert (=> b!1427550 (=> (not res!962586) (not e!806273))))

(assert (=> b!1427550 (= res!962586 (validKeyInArray!0 (select (arr!46992 a!2831) i!982)))))

(declare-fun b!1427551 () Bool)

(declare-fun res!962578 () Bool)

(assert (=> b!1427551 (=> (not res!962578) (not e!806273))))

(assert (=> b!1427551 (= res!962578 (and (= (size!47542 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47542 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47542 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427552 () Bool)

(declare-fun res!962576 () Bool)

(assert (=> b!1427552 (=> (not res!962576) (not e!806273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97355 (_ BitVec 32)) Bool)

(assert (=> b!1427552 (= res!962576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!806271 () Bool)

(declare-fun b!1427553 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97355 (_ BitVec 32)) SeekEntryResult!11271)

(assert (=> b!1427553 (= e!806271 (= (seekEntryOrOpen!0 (select (arr!46992 a!2831) j!81) a!2831 mask!2608) (Found!11271 j!81)))))

(declare-fun b!1427554 () Bool)

(declare-fun res!962581 () Bool)

(assert (=> b!1427554 (=> (not res!962581) (not e!806273))))

(declare-datatypes ((List!33502 0))(
  ( (Nil!33499) (Cons!33498 (h!34806 (_ BitVec 64)) (t!48196 List!33502)) )
))
(declare-fun arrayNoDuplicates!0 (array!97355 (_ BitVec 32) List!33502) Bool)

(assert (=> b!1427554 (= res!962581 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33499))))

(declare-fun b!1427555 () Bool)

(declare-fun res!962583 () Bool)

(assert (=> b!1427555 (=> (not res!962583) (not e!806269))))

(assert (=> b!1427555 (= res!962583 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427556 () Bool)

(assert (=> b!1427556 (= e!806269 (not (or (= (select (arr!46992 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!46992 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1427556 e!806271))

(declare-fun res!962577 () Bool)

(assert (=> b!1427556 (=> (not res!962577) (not e!806271))))

(assert (=> b!1427556 (= res!962577 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48288 0))(
  ( (Unit!48289) )
))
(declare-fun lt!628614 () Unit!48288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48288)

(assert (=> b!1427556 (= lt!628614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!962580 () Bool)

(assert (=> start!123092 (=> (not res!962580) (not e!806273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123092 (= res!962580 (validMask!0 mask!2608))))

(assert (=> start!123092 e!806273))

(assert (=> start!123092 true))

(declare-fun array_inv!36020 (array!97355) Bool)

(assert (=> start!123092 (array_inv!36020 a!2831)))

(declare-fun b!1427549 () Bool)

(assert (=> b!1427549 (= e!806273 e!806270)))

(declare-fun res!962575 () Bool)

(assert (=> b!1427549 (=> (not res!962575) (not e!806270))))

(assert (=> b!1427549 (= res!962575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) (select (arr!46992 a!2831) j!81) a!2831 mask!2608) lt!628610))))

(assert (=> b!1427549 (= lt!628610 (Intermediate!11271 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123092 res!962580) b!1427551))

(assert (= (and b!1427551 res!962578) b!1427550))

(assert (= (and b!1427550 res!962586) b!1427544))

(assert (= (and b!1427544 res!962587) b!1427552))

(assert (= (and b!1427552 res!962576) b!1427554))

(assert (= (and b!1427554 res!962581) b!1427547))

(assert (= (and b!1427547 res!962584) b!1427549))

(assert (= (and b!1427549 res!962575) b!1427545))

(assert (= (and b!1427545 res!962579) b!1427546))

(assert (= (and b!1427546 res!962582) b!1427548))

(assert (= (and b!1427548 res!962585) b!1427555))

(assert (= (and b!1427555 res!962583) b!1427556))

(assert (= (and b!1427556 res!962577) b!1427553))

(declare-fun m!1317913 () Bool)

(assert (=> b!1427545 m!1317913))

(assert (=> b!1427545 m!1317913))

(declare-fun m!1317915 () Bool)

(assert (=> b!1427545 m!1317915))

(declare-fun m!1317917 () Bool)

(assert (=> b!1427545 m!1317917))

(declare-fun m!1317919 () Bool)

(assert (=> b!1427545 m!1317919))

(declare-fun m!1317921 () Bool)

(assert (=> b!1427546 m!1317921))

(assert (=> b!1427546 m!1317921))

(declare-fun m!1317923 () Bool)

(assert (=> b!1427546 m!1317923))

(assert (=> b!1427549 m!1317921))

(assert (=> b!1427549 m!1317921))

(declare-fun m!1317925 () Bool)

(assert (=> b!1427549 m!1317925))

(assert (=> b!1427549 m!1317925))

(assert (=> b!1427549 m!1317921))

(declare-fun m!1317927 () Bool)

(assert (=> b!1427549 m!1317927))

(declare-fun m!1317929 () Bool)

(assert (=> b!1427548 m!1317929))

(declare-fun m!1317931 () Bool)

(assert (=> b!1427556 m!1317931))

(declare-fun m!1317933 () Bool)

(assert (=> b!1427556 m!1317933))

(declare-fun m!1317935 () Bool)

(assert (=> b!1427556 m!1317935))

(declare-fun m!1317937 () Bool)

(assert (=> start!123092 m!1317937))

(declare-fun m!1317939 () Bool)

(assert (=> start!123092 m!1317939))

(declare-fun m!1317941 () Bool)

(assert (=> b!1427550 m!1317941))

(assert (=> b!1427550 m!1317941))

(declare-fun m!1317943 () Bool)

(assert (=> b!1427550 m!1317943))

(declare-fun m!1317945 () Bool)

(assert (=> b!1427554 m!1317945))

(assert (=> b!1427553 m!1317921))

(assert (=> b!1427553 m!1317921))

(declare-fun m!1317947 () Bool)

(assert (=> b!1427553 m!1317947))

(assert (=> b!1427544 m!1317921))

(assert (=> b!1427544 m!1317921))

(declare-fun m!1317949 () Bool)

(assert (=> b!1427544 m!1317949))

(declare-fun m!1317951 () Bool)

(assert (=> b!1427552 m!1317951))

(check-sat (not b!1427550) (not b!1427548) (not b!1427554) (not b!1427549) (not b!1427552) (not b!1427546) (not b!1427545) (not start!123092) (not b!1427553) (not b!1427556) (not b!1427544))
(check-sat)
(get-model)

(declare-fun d!153361 () Bool)

(assert (=> d!153361 (= (validKeyInArray!0 (select (arr!46992 a!2831) i!982)) (and (not (= (select (arr!46992 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46992 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427550 d!153361))

(declare-fun b!1427614 () Bool)

(declare-fun e!806303 () Bool)

(declare-fun lt!628635 () SeekEntryResult!11271)

(assert (=> b!1427614 (= e!806303 (bvsge (x!129109 lt!628635) #b01111111111111111111111111111110))))

(declare-fun d!153363 () Bool)

(assert (=> d!153363 e!806303))

(declare-fun c!131980 () Bool)

(get-info :version)

(assert (=> d!153363 (= c!131980 (and ((_ is Intermediate!11271) lt!628635) (undefined!12083 lt!628635)))))

(declare-fun e!806302 () SeekEntryResult!11271)

(assert (=> d!153363 (= lt!628635 e!806302)))

(declare-fun c!131981 () Bool)

(assert (=> d!153363 (= c!131981 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628634 () (_ BitVec 64))

(assert (=> d!153363 (= lt!628634 (select (arr!46992 lt!628611) (toIndex!0 lt!628612 mask!2608)))))

(assert (=> d!153363 (validMask!0 mask!2608)))

(assert (=> d!153363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628612 mask!2608) lt!628612 lt!628611 mask!2608) lt!628635)))

(declare-fun e!806299 () SeekEntryResult!11271)

(declare-fun b!1427615 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427615 (= e!806299 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628612 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628612 lt!628611 mask!2608))))

(declare-fun b!1427616 () Bool)

(assert (=> b!1427616 (= e!806302 (Intermediate!11271 true (toIndex!0 lt!628612 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427617 () Bool)

(assert (=> b!1427617 (= e!806299 (Intermediate!11271 false (toIndex!0 lt!628612 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427618 () Bool)

(assert (=> b!1427618 (= e!806302 e!806299)))

(declare-fun c!131982 () Bool)

(assert (=> b!1427618 (= c!131982 (or (= lt!628634 lt!628612) (= (bvadd lt!628634 lt!628634) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427619 () Bool)

(declare-fun e!806300 () Bool)

(assert (=> b!1427619 (= e!806303 e!806300)))

(declare-fun res!962634 () Bool)

(assert (=> b!1427619 (= res!962634 (and ((_ is Intermediate!11271) lt!628635) (not (undefined!12083 lt!628635)) (bvslt (x!129109 lt!628635) #b01111111111111111111111111111110) (bvsge (x!129109 lt!628635) #b00000000000000000000000000000000) (bvsge (x!129109 lt!628635) #b00000000000000000000000000000000)))))

(assert (=> b!1427619 (=> (not res!962634) (not e!806300))))

(declare-fun b!1427620 () Bool)

(assert (=> b!1427620 (and (bvsge (index!47478 lt!628635) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628635) (size!47542 lt!628611)))))

(declare-fun res!962633 () Bool)

(assert (=> b!1427620 (= res!962633 (= (select (arr!46992 lt!628611) (index!47478 lt!628635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806301 () Bool)

(assert (=> b!1427620 (=> res!962633 e!806301)))

(declare-fun b!1427621 () Bool)

(assert (=> b!1427621 (and (bvsge (index!47478 lt!628635) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628635) (size!47542 lt!628611)))))

(assert (=> b!1427621 (= e!806301 (= (select (arr!46992 lt!628611) (index!47478 lt!628635)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427622 () Bool)

(assert (=> b!1427622 (and (bvsge (index!47478 lt!628635) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628635) (size!47542 lt!628611)))))

(declare-fun res!962635 () Bool)

(assert (=> b!1427622 (= res!962635 (= (select (arr!46992 lt!628611) (index!47478 lt!628635)) lt!628612))))

(assert (=> b!1427622 (=> res!962635 e!806301)))

(assert (=> b!1427622 (= e!806300 e!806301)))

(assert (= (and d!153363 c!131981) b!1427616))

(assert (= (and d!153363 (not c!131981)) b!1427618))

(assert (= (and b!1427618 c!131982) b!1427617))

(assert (= (and b!1427618 (not c!131982)) b!1427615))

(assert (= (and d!153363 c!131980) b!1427614))

(assert (= (and d!153363 (not c!131980)) b!1427619))

(assert (= (and b!1427619 res!962634) b!1427622))

(assert (= (and b!1427622 (not res!962635)) b!1427620))

(assert (= (and b!1427620 (not res!962633)) b!1427621))

(assert (=> b!1427615 m!1317913))

(declare-fun m!1317993 () Bool)

(assert (=> b!1427615 m!1317993))

(assert (=> b!1427615 m!1317993))

(declare-fun m!1317995 () Bool)

(assert (=> b!1427615 m!1317995))

(assert (=> d!153363 m!1317913))

(declare-fun m!1317997 () Bool)

(assert (=> d!153363 m!1317997))

(assert (=> d!153363 m!1317937))

(declare-fun m!1317999 () Bool)

(assert (=> b!1427621 m!1317999))

(assert (=> b!1427622 m!1317999))

(assert (=> b!1427620 m!1317999))

(assert (=> b!1427545 d!153363))

(declare-fun d!153365 () Bool)

(declare-fun lt!628641 () (_ BitVec 32))

(declare-fun lt!628640 () (_ BitVec 32))

(assert (=> d!153365 (= lt!628641 (bvmul (bvxor lt!628640 (bvlshr lt!628640 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153365 (= lt!628640 ((_ extract 31 0) (bvand (bvxor lt!628612 (bvlshr lt!628612 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153365 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962636 (let ((h!34808 ((_ extract 31 0) (bvand (bvxor lt!628612 (bvlshr lt!628612 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129112 (bvmul (bvxor h!34808 (bvlshr h!34808 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129112 (bvlshr x!129112 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962636 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962636 #b00000000000000000000000000000000))))))

(assert (=> d!153365 (= (toIndex!0 lt!628612 mask!2608) (bvand (bvxor lt!628641 (bvlshr lt!628641 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427545 d!153365))

(declare-fun b!1427631 () Bool)

(declare-fun e!806312 () Bool)

(declare-fun call!67366 () Bool)

(assert (=> b!1427631 (= e!806312 call!67366)))

(declare-fun b!1427632 () Bool)

(declare-fun e!806310 () Bool)

(assert (=> b!1427632 (= e!806310 e!806312)))

(declare-fun lt!628649 () (_ BitVec 64))

(assert (=> b!1427632 (= lt!628649 (select (arr!46992 a!2831) j!81))))

(declare-fun lt!628650 () Unit!48288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97355 (_ BitVec 64) (_ BitVec 32)) Unit!48288)

(assert (=> b!1427632 (= lt!628650 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628649 j!81))))

(declare-fun arrayContainsKey!0 (array!97355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427632 (arrayContainsKey!0 a!2831 lt!628649 #b00000000000000000000000000000000)))

(declare-fun lt!628648 () Unit!48288)

(assert (=> b!1427632 (= lt!628648 lt!628650)))

(declare-fun res!962642 () Bool)

(assert (=> b!1427632 (= res!962642 (= (seekEntryOrOpen!0 (select (arr!46992 a!2831) j!81) a!2831 mask!2608) (Found!11271 j!81)))))

(assert (=> b!1427632 (=> (not res!962642) (not e!806312))))

(declare-fun b!1427633 () Bool)

(declare-fun e!806311 () Bool)

(assert (=> b!1427633 (= e!806311 e!806310)))

(declare-fun c!131985 () Bool)

(assert (=> b!1427633 (= c!131985 (validKeyInArray!0 (select (arr!46992 a!2831) j!81)))))

(declare-fun d!153367 () Bool)

(declare-fun res!962641 () Bool)

(assert (=> d!153367 (=> res!962641 e!806311)))

(assert (=> d!153367 (= res!962641 (bvsge j!81 (size!47542 a!2831)))))

(assert (=> d!153367 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806311)))

(declare-fun b!1427634 () Bool)

(assert (=> b!1427634 (= e!806310 call!67366)))

(declare-fun bm!67363 () Bool)

(assert (=> bm!67363 (= call!67366 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153367 (not res!962641)) b!1427633))

(assert (= (and b!1427633 c!131985) b!1427632))

(assert (= (and b!1427633 (not c!131985)) b!1427634))

(assert (= (and b!1427632 res!962642) b!1427631))

(assert (= (or b!1427631 b!1427634) bm!67363))

(assert (=> b!1427632 m!1317921))

(declare-fun m!1318001 () Bool)

(assert (=> b!1427632 m!1318001))

(declare-fun m!1318003 () Bool)

(assert (=> b!1427632 m!1318003))

(assert (=> b!1427632 m!1317921))

(assert (=> b!1427632 m!1317947))

(assert (=> b!1427633 m!1317921))

(assert (=> b!1427633 m!1317921))

(assert (=> b!1427633 m!1317949))

(declare-fun m!1318005 () Bool)

(assert (=> bm!67363 m!1318005))

(assert (=> b!1427556 d!153367))

(declare-fun d!153375 () Bool)

(assert (=> d!153375 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628653 () Unit!48288)

(declare-fun choose!38 (array!97355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48288)

(assert (=> d!153375 (= lt!628653 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153375 (validMask!0 mask!2608)))

(assert (=> d!153375 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628653)))

(declare-fun bs!41609 () Bool)

(assert (= bs!41609 d!153375))

(assert (=> bs!41609 m!1317933))

(declare-fun m!1318007 () Bool)

(assert (=> bs!41609 m!1318007))

(assert (=> bs!41609 m!1317937))

(assert (=> b!1427556 d!153375))

(declare-fun b!1427635 () Bool)

(declare-fun e!806317 () Bool)

(declare-fun lt!628655 () SeekEntryResult!11271)

(assert (=> b!1427635 (= e!806317 (bvsge (x!129109 lt!628655) #b01111111111111111111111111111110))))

(declare-fun d!153377 () Bool)

(assert (=> d!153377 e!806317))

(declare-fun c!131986 () Bool)

(assert (=> d!153377 (= c!131986 (and ((_ is Intermediate!11271) lt!628655) (undefined!12083 lt!628655)))))

(declare-fun e!806316 () SeekEntryResult!11271)

(assert (=> d!153377 (= lt!628655 e!806316)))

(declare-fun c!131987 () Bool)

(assert (=> d!153377 (= c!131987 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628654 () (_ BitVec 64))

(assert (=> d!153377 (= lt!628654 (select (arr!46992 a!2831) index!585))))

(assert (=> d!153377 (validMask!0 mask!2608)))

(assert (=> d!153377 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46992 a!2831) j!81) a!2831 mask!2608) lt!628655)))

(declare-fun e!806313 () SeekEntryResult!11271)

(declare-fun b!1427636 () Bool)

(assert (=> b!1427636 (= e!806313 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46992 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427637 () Bool)

(assert (=> b!1427637 (= e!806316 (Intermediate!11271 true index!585 x!605))))

(declare-fun b!1427638 () Bool)

(assert (=> b!1427638 (= e!806313 (Intermediate!11271 false index!585 x!605))))

(declare-fun b!1427639 () Bool)

(assert (=> b!1427639 (= e!806316 e!806313)))

(declare-fun c!131988 () Bool)

(assert (=> b!1427639 (= c!131988 (or (= lt!628654 (select (arr!46992 a!2831) j!81)) (= (bvadd lt!628654 lt!628654) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427640 () Bool)

(declare-fun e!806314 () Bool)

(assert (=> b!1427640 (= e!806317 e!806314)))

(declare-fun res!962644 () Bool)

(assert (=> b!1427640 (= res!962644 (and ((_ is Intermediate!11271) lt!628655) (not (undefined!12083 lt!628655)) (bvslt (x!129109 lt!628655) #b01111111111111111111111111111110) (bvsge (x!129109 lt!628655) #b00000000000000000000000000000000) (bvsge (x!129109 lt!628655) x!605)))))

(assert (=> b!1427640 (=> (not res!962644) (not e!806314))))

(declare-fun b!1427641 () Bool)

(assert (=> b!1427641 (and (bvsge (index!47478 lt!628655) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628655) (size!47542 a!2831)))))

(declare-fun res!962643 () Bool)

(assert (=> b!1427641 (= res!962643 (= (select (arr!46992 a!2831) (index!47478 lt!628655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806315 () Bool)

(assert (=> b!1427641 (=> res!962643 e!806315)))

(declare-fun b!1427642 () Bool)

(assert (=> b!1427642 (and (bvsge (index!47478 lt!628655) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628655) (size!47542 a!2831)))))

(assert (=> b!1427642 (= e!806315 (= (select (arr!46992 a!2831) (index!47478 lt!628655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427643 () Bool)

(assert (=> b!1427643 (and (bvsge (index!47478 lt!628655) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628655) (size!47542 a!2831)))))

(declare-fun res!962645 () Bool)

(assert (=> b!1427643 (= res!962645 (= (select (arr!46992 a!2831) (index!47478 lt!628655)) (select (arr!46992 a!2831) j!81)))))

(assert (=> b!1427643 (=> res!962645 e!806315)))

(assert (=> b!1427643 (= e!806314 e!806315)))

(assert (= (and d!153377 c!131987) b!1427637))

(assert (= (and d!153377 (not c!131987)) b!1427639))

(assert (= (and b!1427639 c!131988) b!1427638))

(assert (= (and b!1427639 (not c!131988)) b!1427636))

(assert (= (and d!153377 c!131986) b!1427635))

(assert (= (and d!153377 (not c!131986)) b!1427640))

(assert (= (and b!1427640 res!962644) b!1427643))

(assert (= (and b!1427643 (not res!962645)) b!1427641))

(assert (= (and b!1427641 (not res!962643)) b!1427642))

(declare-fun m!1318009 () Bool)

(assert (=> b!1427636 m!1318009))

(assert (=> b!1427636 m!1318009))

(assert (=> b!1427636 m!1317921))

(declare-fun m!1318011 () Bool)

(assert (=> b!1427636 m!1318011))

(assert (=> d!153377 m!1317931))

(assert (=> d!153377 m!1317937))

(declare-fun m!1318013 () Bool)

(assert (=> b!1427642 m!1318013))

(assert (=> b!1427643 m!1318013))

(assert (=> b!1427641 m!1318013))

(assert (=> b!1427546 d!153377))

(declare-fun b!1427644 () Bool)

(declare-fun e!806320 () Bool)

(declare-fun call!67367 () Bool)

(assert (=> b!1427644 (= e!806320 call!67367)))

(declare-fun b!1427645 () Bool)

(declare-fun e!806318 () Bool)

(assert (=> b!1427645 (= e!806318 e!806320)))

(declare-fun lt!628657 () (_ BitVec 64))

(assert (=> b!1427645 (= lt!628657 (select (arr!46992 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628658 () Unit!48288)

(assert (=> b!1427645 (= lt!628658 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628657 #b00000000000000000000000000000000))))

(assert (=> b!1427645 (arrayContainsKey!0 a!2831 lt!628657 #b00000000000000000000000000000000)))

(declare-fun lt!628656 () Unit!48288)

(assert (=> b!1427645 (= lt!628656 lt!628658)))

(declare-fun res!962647 () Bool)

(assert (=> b!1427645 (= res!962647 (= (seekEntryOrOpen!0 (select (arr!46992 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11271 #b00000000000000000000000000000000)))))

(assert (=> b!1427645 (=> (not res!962647) (not e!806320))))

(declare-fun b!1427646 () Bool)

(declare-fun e!806319 () Bool)

(assert (=> b!1427646 (= e!806319 e!806318)))

(declare-fun c!131989 () Bool)

(assert (=> b!1427646 (= c!131989 (validKeyInArray!0 (select (arr!46992 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153379 () Bool)

(declare-fun res!962646 () Bool)

(assert (=> d!153379 (=> res!962646 e!806319)))

(assert (=> d!153379 (= res!962646 (bvsge #b00000000000000000000000000000000 (size!47542 a!2831)))))

(assert (=> d!153379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806319)))

(declare-fun b!1427647 () Bool)

(assert (=> b!1427647 (= e!806318 call!67367)))

(declare-fun bm!67364 () Bool)

(assert (=> bm!67364 (= call!67367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153379 (not res!962646)) b!1427646))

(assert (= (and b!1427646 c!131989) b!1427645))

(assert (= (and b!1427646 (not c!131989)) b!1427647))

(assert (= (and b!1427645 res!962647) b!1427644))

(assert (= (or b!1427644 b!1427647) bm!67364))

(declare-fun m!1318015 () Bool)

(assert (=> b!1427645 m!1318015))

(declare-fun m!1318017 () Bool)

(assert (=> b!1427645 m!1318017))

(declare-fun m!1318019 () Bool)

(assert (=> b!1427645 m!1318019))

(assert (=> b!1427645 m!1318015))

(declare-fun m!1318021 () Bool)

(assert (=> b!1427645 m!1318021))

(assert (=> b!1427646 m!1318015))

(assert (=> b!1427646 m!1318015))

(declare-fun m!1318023 () Bool)

(assert (=> b!1427646 m!1318023))

(declare-fun m!1318025 () Bool)

(assert (=> bm!67364 m!1318025))

(assert (=> b!1427552 d!153379))

(declare-fun b!1427731 () Bool)

(declare-fun c!132020 () Bool)

(declare-fun lt!628698 () (_ BitVec 64))

(assert (=> b!1427731 (= c!132020 (= lt!628698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806368 () SeekEntryResult!11271)

(declare-fun e!806370 () SeekEntryResult!11271)

(assert (=> b!1427731 (= e!806368 e!806370)))

(declare-fun b!1427732 () Bool)

(declare-fun e!806369 () SeekEntryResult!11271)

(assert (=> b!1427732 (= e!806369 e!806368)))

(declare-fun lt!628699 () SeekEntryResult!11271)

(assert (=> b!1427732 (= lt!628698 (select (arr!46992 a!2831) (index!47478 lt!628699)))))

(declare-fun c!132021 () Bool)

(assert (=> b!1427732 (= c!132021 (= lt!628698 (select (arr!46992 a!2831) j!81)))))

(declare-fun b!1427733 () Bool)

(assert (=> b!1427733 (= e!806370 (MissingZero!11271 (index!47478 lt!628699)))))

(declare-fun b!1427735 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97355 (_ BitVec 32)) SeekEntryResult!11271)

(assert (=> b!1427735 (= e!806370 (seekKeyOrZeroReturnVacant!0 (x!129109 lt!628699) (index!47478 lt!628699) (index!47478 lt!628699) (select (arr!46992 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427736 () Bool)

(assert (=> b!1427736 (= e!806368 (Found!11271 (index!47478 lt!628699)))))

(declare-fun d!153381 () Bool)

(declare-fun lt!628697 () SeekEntryResult!11271)

(assert (=> d!153381 (and (or ((_ is Undefined!11271) lt!628697) (not ((_ is Found!11271) lt!628697)) (and (bvsge (index!47477 lt!628697) #b00000000000000000000000000000000) (bvslt (index!47477 lt!628697) (size!47542 a!2831)))) (or ((_ is Undefined!11271) lt!628697) ((_ is Found!11271) lt!628697) (not ((_ is MissingZero!11271) lt!628697)) (and (bvsge (index!47476 lt!628697) #b00000000000000000000000000000000) (bvslt (index!47476 lt!628697) (size!47542 a!2831)))) (or ((_ is Undefined!11271) lt!628697) ((_ is Found!11271) lt!628697) ((_ is MissingZero!11271) lt!628697) (not ((_ is MissingVacant!11271) lt!628697)) (and (bvsge (index!47479 lt!628697) #b00000000000000000000000000000000) (bvslt (index!47479 lt!628697) (size!47542 a!2831)))) (or ((_ is Undefined!11271) lt!628697) (ite ((_ is Found!11271) lt!628697) (= (select (arr!46992 a!2831) (index!47477 lt!628697)) (select (arr!46992 a!2831) j!81)) (ite ((_ is MissingZero!11271) lt!628697) (= (select (arr!46992 a!2831) (index!47476 lt!628697)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11271) lt!628697) (= (select (arr!46992 a!2831) (index!47479 lt!628697)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153381 (= lt!628697 e!806369)))

(declare-fun c!132019 () Bool)

(assert (=> d!153381 (= c!132019 (and ((_ is Intermediate!11271) lt!628699) (undefined!12083 lt!628699)))))

(assert (=> d!153381 (= lt!628699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) (select (arr!46992 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153381 (validMask!0 mask!2608)))

(assert (=> d!153381 (= (seekEntryOrOpen!0 (select (arr!46992 a!2831) j!81) a!2831 mask!2608) lt!628697)))

(declare-fun b!1427734 () Bool)

(assert (=> b!1427734 (= e!806369 Undefined!11271)))

(assert (= (and d!153381 c!132019) b!1427734))

(assert (= (and d!153381 (not c!132019)) b!1427732))

(assert (= (and b!1427732 c!132021) b!1427736))

(assert (= (and b!1427732 (not c!132021)) b!1427731))

(assert (= (and b!1427731 c!132020) b!1427733))

(assert (= (and b!1427731 (not c!132020)) b!1427735))

(declare-fun m!1318051 () Bool)

(assert (=> b!1427732 m!1318051))

(assert (=> b!1427735 m!1317921))

(declare-fun m!1318053 () Bool)

(assert (=> b!1427735 m!1318053))

(declare-fun m!1318055 () Bool)

(assert (=> d!153381 m!1318055))

(assert (=> d!153381 m!1317921))

(assert (=> d!153381 m!1317925))

(declare-fun m!1318057 () Bool)

(assert (=> d!153381 m!1318057))

(assert (=> d!153381 m!1317937))

(declare-fun m!1318059 () Bool)

(assert (=> d!153381 m!1318059))

(assert (=> d!153381 m!1317925))

(assert (=> d!153381 m!1317921))

(assert (=> d!153381 m!1317927))

(assert (=> b!1427553 d!153381))

(declare-fun b!1427737 () Bool)

(declare-fun e!806375 () Bool)

(declare-fun lt!628701 () SeekEntryResult!11271)

(assert (=> b!1427737 (= e!806375 (bvsge (x!129109 lt!628701) #b01111111111111111111111111111110))))

(declare-fun d!153393 () Bool)

(assert (=> d!153393 e!806375))

(declare-fun c!132022 () Bool)

(assert (=> d!153393 (= c!132022 (and ((_ is Intermediate!11271) lt!628701) (undefined!12083 lt!628701)))))

(declare-fun e!806374 () SeekEntryResult!11271)

(assert (=> d!153393 (= lt!628701 e!806374)))

(declare-fun c!132023 () Bool)

(assert (=> d!153393 (= c!132023 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628700 () (_ BitVec 64))

(assert (=> d!153393 (= lt!628700 (select (arr!46992 lt!628611) index!585))))

(assert (=> d!153393 (validMask!0 mask!2608)))

(assert (=> d!153393 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628612 lt!628611 mask!2608) lt!628701)))

(declare-fun b!1427738 () Bool)

(declare-fun e!806371 () SeekEntryResult!11271)

(assert (=> b!1427738 (= e!806371 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628612 lt!628611 mask!2608))))

(declare-fun b!1427739 () Bool)

(assert (=> b!1427739 (= e!806374 (Intermediate!11271 true index!585 x!605))))

(declare-fun b!1427740 () Bool)

(assert (=> b!1427740 (= e!806371 (Intermediate!11271 false index!585 x!605))))

(declare-fun b!1427741 () Bool)

(assert (=> b!1427741 (= e!806374 e!806371)))

(declare-fun c!132024 () Bool)

(assert (=> b!1427741 (= c!132024 (or (= lt!628700 lt!628612) (= (bvadd lt!628700 lt!628700) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427742 () Bool)

(declare-fun e!806372 () Bool)

(assert (=> b!1427742 (= e!806375 e!806372)))

(declare-fun res!962676 () Bool)

(assert (=> b!1427742 (= res!962676 (and ((_ is Intermediate!11271) lt!628701) (not (undefined!12083 lt!628701)) (bvslt (x!129109 lt!628701) #b01111111111111111111111111111110) (bvsge (x!129109 lt!628701) #b00000000000000000000000000000000) (bvsge (x!129109 lt!628701) x!605)))))

(assert (=> b!1427742 (=> (not res!962676) (not e!806372))))

(declare-fun b!1427743 () Bool)

(assert (=> b!1427743 (and (bvsge (index!47478 lt!628701) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628701) (size!47542 lt!628611)))))

(declare-fun res!962675 () Bool)

(assert (=> b!1427743 (= res!962675 (= (select (arr!46992 lt!628611) (index!47478 lt!628701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806373 () Bool)

(assert (=> b!1427743 (=> res!962675 e!806373)))

(declare-fun b!1427744 () Bool)

(assert (=> b!1427744 (and (bvsge (index!47478 lt!628701) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628701) (size!47542 lt!628611)))))

(assert (=> b!1427744 (= e!806373 (= (select (arr!46992 lt!628611) (index!47478 lt!628701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427745 () Bool)

(assert (=> b!1427745 (and (bvsge (index!47478 lt!628701) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628701) (size!47542 lt!628611)))))

(declare-fun res!962677 () Bool)

(assert (=> b!1427745 (= res!962677 (= (select (arr!46992 lt!628611) (index!47478 lt!628701)) lt!628612))))

(assert (=> b!1427745 (=> res!962677 e!806373)))

(assert (=> b!1427745 (= e!806372 e!806373)))

(assert (= (and d!153393 c!132023) b!1427739))

(assert (= (and d!153393 (not c!132023)) b!1427741))

(assert (= (and b!1427741 c!132024) b!1427740))

(assert (= (and b!1427741 (not c!132024)) b!1427738))

(assert (= (and d!153393 c!132022) b!1427737))

(assert (= (and d!153393 (not c!132022)) b!1427742))

(assert (= (and b!1427742 res!962676) b!1427745))

(assert (= (and b!1427745 (not res!962677)) b!1427743))

(assert (= (and b!1427743 (not res!962675)) b!1427744))

(assert (=> b!1427738 m!1318009))

(assert (=> b!1427738 m!1318009))

(declare-fun m!1318061 () Bool)

(assert (=> b!1427738 m!1318061))

(declare-fun m!1318063 () Bool)

(assert (=> d!153393 m!1318063))

(assert (=> d!153393 m!1317937))

(declare-fun m!1318065 () Bool)

(assert (=> b!1427744 m!1318065))

(assert (=> b!1427745 m!1318065))

(assert (=> b!1427743 m!1318065))

(assert (=> b!1427548 d!153393))

(declare-fun b!1427769 () Bool)

(declare-fun e!806395 () Bool)

(declare-fun call!67373 () Bool)

(assert (=> b!1427769 (= e!806395 call!67373)))

(declare-fun b!1427770 () Bool)

(declare-fun e!806393 () Bool)

(assert (=> b!1427770 (= e!806393 e!806395)))

(declare-fun c!132031 () Bool)

(assert (=> b!1427770 (= c!132031 (validKeyInArray!0 (select (arr!46992 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427771 () Bool)

(declare-fun e!806394 () Bool)

(declare-fun contains!9852 (List!33502 (_ BitVec 64)) Bool)

(assert (=> b!1427771 (= e!806394 (contains!9852 Nil!33499 (select (arr!46992 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427772 () Bool)

(assert (=> b!1427772 (= e!806395 call!67373)))

(declare-fun b!1427773 () Bool)

(declare-fun e!806392 () Bool)

(assert (=> b!1427773 (= e!806392 e!806393)))

(declare-fun res!962689 () Bool)

(assert (=> b!1427773 (=> (not res!962689) (not e!806393))))

(assert (=> b!1427773 (= res!962689 (not e!806394))))

(declare-fun res!962690 () Bool)

(assert (=> b!1427773 (=> (not res!962690) (not e!806394))))

(assert (=> b!1427773 (= res!962690 (validKeyInArray!0 (select (arr!46992 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67370 () Bool)

(assert (=> bm!67370 (= call!67373 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132031 (Cons!33498 (select (arr!46992 a!2831) #b00000000000000000000000000000000) Nil!33499) Nil!33499)))))

(declare-fun d!153395 () Bool)

(declare-fun res!962691 () Bool)

(assert (=> d!153395 (=> res!962691 e!806392)))

(assert (=> d!153395 (= res!962691 (bvsge #b00000000000000000000000000000000 (size!47542 a!2831)))))

(assert (=> d!153395 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33499) e!806392)))

(assert (= (and d!153395 (not res!962691)) b!1427773))

(assert (= (and b!1427773 res!962690) b!1427771))

(assert (= (and b!1427773 res!962689) b!1427770))

(assert (= (and b!1427770 c!132031) b!1427769))

(assert (= (and b!1427770 (not c!132031)) b!1427772))

(assert (= (or b!1427769 b!1427772) bm!67370))

(assert (=> b!1427770 m!1318015))

(assert (=> b!1427770 m!1318015))

(assert (=> b!1427770 m!1318023))

(assert (=> b!1427771 m!1318015))

(assert (=> b!1427771 m!1318015))

(declare-fun m!1318079 () Bool)

(assert (=> b!1427771 m!1318079))

(assert (=> b!1427773 m!1318015))

(assert (=> b!1427773 m!1318015))

(assert (=> b!1427773 m!1318023))

(assert (=> bm!67370 m!1318015))

(declare-fun m!1318085 () Bool)

(assert (=> bm!67370 m!1318085))

(assert (=> b!1427554 d!153395))

(declare-fun b!1427774 () Bool)

(declare-fun e!806400 () Bool)

(declare-fun lt!628713 () SeekEntryResult!11271)

(assert (=> b!1427774 (= e!806400 (bvsge (x!129109 lt!628713) #b01111111111111111111111111111110))))

(declare-fun d!153407 () Bool)

(assert (=> d!153407 e!806400))

(declare-fun c!132032 () Bool)

(assert (=> d!153407 (= c!132032 (and ((_ is Intermediate!11271) lt!628713) (undefined!12083 lt!628713)))))

(declare-fun e!806399 () SeekEntryResult!11271)

(assert (=> d!153407 (= lt!628713 e!806399)))

(declare-fun c!132033 () Bool)

(assert (=> d!153407 (= c!132033 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628712 () (_ BitVec 64))

(assert (=> d!153407 (= lt!628712 (select (arr!46992 a!2831) (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608)))))

(assert (=> d!153407 (validMask!0 mask!2608)))

(assert (=> d!153407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) (select (arr!46992 a!2831) j!81) a!2831 mask!2608) lt!628713)))

(declare-fun e!806396 () SeekEntryResult!11271)

(declare-fun b!1427775 () Bool)

(assert (=> b!1427775 (= e!806396 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46992 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427776 () Bool)

(assert (=> b!1427776 (= e!806399 (Intermediate!11271 true (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427777 () Bool)

(assert (=> b!1427777 (= e!806396 (Intermediate!11271 false (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427778 () Bool)

(assert (=> b!1427778 (= e!806399 e!806396)))

(declare-fun c!132034 () Bool)

(assert (=> b!1427778 (= c!132034 (or (= lt!628712 (select (arr!46992 a!2831) j!81)) (= (bvadd lt!628712 lt!628712) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427779 () Bool)

(declare-fun e!806397 () Bool)

(assert (=> b!1427779 (= e!806400 e!806397)))

(declare-fun res!962693 () Bool)

(assert (=> b!1427779 (= res!962693 (and ((_ is Intermediate!11271) lt!628713) (not (undefined!12083 lt!628713)) (bvslt (x!129109 lt!628713) #b01111111111111111111111111111110) (bvsge (x!129109 lt!628713) #b00000000000000000000000000000000) (bvsge (x!129109 lt!628713) #b00000000000000000000000000000000)))))

(assert (=> b!1427779 (=> (not res!962693) (not e!806397))))

(declare-fun b!1427780 () Bool)

(assert (=> b!1427780 (and (bvsge (index!47478 lt!628713) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628713) (size!47542 a!2831)))))

(declare-fun res!962692 () Bool)

(assert (=> b!1427780 (= res!962692 (= (select (arr!46992 a!2831) (index!47478 lt!628713)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806398 () Bool)

(assert (=> b!1427780 (=> res!962692 e!806398)))

(declare-fun b!1427781 () Bool)

(assert (=> b!1427781 (and (bvsge (index!47478 lt!628713) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628713) (size!47542 a!2831)))))

(assert (=> b!1427781 (= e!806398 (= (select (arr!46992 a!2831) (index!47478 lt!628713)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427782 () Bool)

(assert (=> b!1427782 (and (bvsge (index!47478 lt!628713) #b00000000000000000000000000000000) (bvslt (index!47478 lt!628713) (size!47542 a!2831)))))

(declare-fun res!962694 () Bool)

(assert (=> b!1427782 (= res!962694 (= (select (arr!46992 a!2831) (index!47478 lt!628713)) (select (arr!46992 a!2831) j!81)))))

(assert (=> b!1427782 (=> res!962694 e!806398)))

(assert (=> b!1427782 (= e!806397 e!806398)))

(assert (= (and d!153407 c!132033) b!1427776))

(assert (= (and d!153407 (not c!132033)) b!1427778))

(assert (= (and b!1427778 c!132034) b!1427777))

(assert (= (and b!1427778 (not c!132034)) b!1427775))

(assert (= (and d!153407 c!132032) b!1427774))

(assert (= (and d!153407 (not c!132032)) b!1427779))

(assert (= (and b!1427779 res!962693) b!1427782))

(assert (= (and b!1427782 (not res!962694)) b!1427780))

(assert (= (and b!1427780 (not res!962692)) b!1427781))

(assert (=> b!1427775 m!1317925))

(declare-fun m!1318087 () Bool)

(assert (=> b!1427775 m!1318087))

(assert (=> b!1427775 m!1318087))

(assert (=> b!1427775 m!1317921))

(declare-fun m!1318089 () Bool)

(assert (=> b!1427775 m!1318089))

(assert (=> d!153407 m!1317925))

(declare-fun m!1318091 () Bool)

(assert (=> d!153407 m!1318091))

(assert (=> d!153407 m!1317937))

(declare-fun m!1318093 () Bool)

(assert (=> b!1427781 m!1318093))

(assert (=> b!1427782 m!1318093))

(assert (=> b!1427780 m!1318093))

(assert (=> b!1427549 d!153407))

(declare-fun d!153411 () Bool)

(declare-fun lt!628715 () (_ BitVec 32))

(declare-fun lt!628714 () (_ BitVec 32))

(assert (=> d!153411 (= lt!628715 (bvmul (bvxor lt!628714 (bvlshr lt!628714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153411 (= lt!628714 ((_ extract 31 0) (bvand (bvxor (select (arr!46992 a!2831) j!81) (bvlshr (select (arr!46992 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153411 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962636 (let ((h!34808 ((_ extract 31 0) (bvand (bvxor (select (arr!46992 a!2831) j!81) (bvlshr (select (arr!46992 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129112 (bvmul (bvxor h!34808 (bvlshr h!34808 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129112 (bvlshr x!129112 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962636 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962636 #b00000000000000000000000000000000))))))

(assert (=> d!153411 (= (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) (bvand (bvxor lt!628715 (bvlshr lt!628715 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427549 d!153411))

(declare-fun d!153413 () Bool)

(assert (=> d!153413 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123092 d!153413))

(declare-fun d!153421 () Bool)

(assert (=> d!153421 (= (array_inv!36020 a!2831) (bvsge (size!47542 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123092 d!153421))

(declare-fun d!153425 () Bool)

(assert (=> d!153425 (= (validKeyInArray!0 (select (arr!46992 a!2831) j!81)) (and (not (= (select (arr!46992 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46992 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427544 d!153425))

(check-sat (not b!1427773) (not b!1427645) (not b!1427646) (not b!1427775) (not d!153363) (not bm!67363) (not d!153407) (not d!153375) (not d!153381) (not bm!67364) (not b!1427735) (not d!153393) (not b!1427636) (not b!1427771) (not bm!67370) (not b!1427615) (not d!153377) (not b!1427632) (not b!1427770) (not b!1427738) (not b!1427633))
(check-sat)
