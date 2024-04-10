; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123090 () Bool)

(assert start!123090)

(declare-fun b!1427505 () Bool)

(declare-fun res!962539 () Bool)

(declare-fun e!806256 () Bool)

(assert (=> b!1427505 (=> (not res!962539) (not e!806256))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97353 0))(
  ( (array!97354 (arr!46991 (Array (_ BitVec 32) (_ BitVec 64))) (size!47541 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97353)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427505 (= res!962539 (and (= (size!47541 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47541 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47541 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427506 () Bool)

(declare-fun res!962546 () Bool)

(declare-fun e!806258 () Bool)

(assert (=> b!1427506 (=> (not res!962546) (not e!806258))))

(declare-fun lt!628599 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!628597 () array!97353)

(declare-datatypes ((SeekEntryResult!11270 0))(
  ( (MissingZero!11270 (index!47472 (_ BitVec 32))) (Found!11270 (index!47473 (_ BitVec 32))) (Intermediate!11270 (undefined!12082 Bool) (index!47474 (_ BitVec 32)) (x!129108 (_ BitVec 32))) (Undefined!11270) (MissingVacant!11270 (index!47475 (_ BitVec 32))) )
))
(declare-fun lt!628596 () SeekEntryResult!11270)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97353 (_ BitVec 32)) SeekEntryResult!11270)

(assert (=> b!1427506 (= res!962546 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628599 lt!628597 mask!2608) lt!628596))))

(declare-fun b!1427507 () Bool)

(declare-fun res!962543 () Bool)

(assert (=> b!1427507 (=> (not res!962543) (not e!806258))))

(declare-fun lt!628595 () SeekEntryResult!11270)

(assert (=> b!1427507 (= res!962543 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46991 a!2831) j!81) a!2831 mask!2608) lt!628595))))

(declare-fun b!1427508 () Bool)

(declare-fun res!962548 () Bool)

(assert (=> b!1427508 (=> (not res!962548) (not e!806256))))

(declare-datatypes ((List!33501 0))(
  ( (Nil!33498) (Cons!33497 (h!34805 (_ BitVec 64)) (t!48195 List!33501)) )
))
(declare-fun arrayNoDuplicates!0 (array!97353 (_ BitVec 32) List!33501) Bool)

(assert (=> b!1427508 (= res!962548 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33498))))

(declare-fun b!1427509 () Bool)

(declare-fun e!806257 () Bool)

(assert (=> b!1427509 (= e!806257 e!806258)))

(declare-fun res!962537 () Bool)

(assert (=> b!1427509 (=> (not res!962537) (not e!806258))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427509 (= res!962537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628599 mask!2608) lt!628599 lt!628597 mask!2608) lt!628596))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427509 (= lt!628596 (Intermediate!11270 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427509 (= lt!628599 (select (store (arr!46991 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427509 (= lt!628597 (array!97354 (store (arr!46991 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47541 a!2831)))))

(declare-fun b!1427510 () Bool)

(assert (=> b!1427510 (= e!806256 e!806257)))

(declare-fun res!962541 () Bool)

(assert (=> b!1427510 (=> (not res!962541) (not e!806257))))

(assert (=> b!1427510 (= res!962541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) (select (arr!46991 a!2831) j!81) a!2831 mask!2608) lt!628595))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427510 (= lt!628595 (Intermediate!11270 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427511 () Bool)

(declare-fun res!962542 () Bool)

(assert (=> b!1427511 (=> (not res!962542) (not e!806258))))

(assert (=> b!1427511 (= res!962542 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427512 () Bool)

(declare-fun res!962547 () Bool)

(assert (=> b!1427512 (=> (not res!962547) (not e!806256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97353 (_ BitVec 32)) Bool)

(assert (=> b!1427512 (= res!962547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427513 () Bool)

(declare-fun e!806255 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97353 (_ BitVec 32)) SeekEntryResult!11270)

(assert (=> b!1427513 (= e!806255 (= (seekEntryOrOpen!0 (select (arr!46991 a!2831) j!81) a!2831 mask!2608) (Found!11270 j!81)))))

(declare-fun b!1427514 () Bool)

(declare-fun res!962544 () Bool)

(assert (=> b!1427514 (=> (not res!962544) (not e!806256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427514 (= res!962544 (validKeyInArray!0 (select (arr!46991 a!2831) i!982)))))

(declare-fun b!1427516 () Bool)

(declare-fun res!962545 () Bool)

(assert (=> b!1427516 (=> (not res!962545) (not e!806256))))

(assert (=> b!1427516 (= res!962545 (validKeyInArray!0 (select (arr!46991 a!2831) j!81)))))

(declare-fun b!1427517 () Bool)

(declare-fun res!962538 () Bool)

(assert (=> b!1427517 (=> (not res!962538) (not e!806256))))

(assert (=> b!1427517 (= res!962538 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47541 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47541 a!2831))))))

(declare-fun res!962540 () Bool)

(assert (=> start!123090 (=> (not res!962540) (not e!806256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123090 (= res!962540 (validMask!0 mask!2608))))

(assert (=> start!123090 e!806256))

(assert (=> start!123090 true))

(declare-fun array_inv!36019 (array!97353) Bool)

(assert (=> start!123090 (array_inv!36019 a!2831)))

(declare-fun b!1427515 () Bool)

(assert (=> b!1427515 (= e!806258 (not (or (= (select (arr!46991 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!46991 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1427515 e!806255))

(declare-fun res!962536 () Bool)

(assert (=> b!1427515 (=> (not res!962536) (not e!806255))))

(assert (=> b!1427515 (= res!962536 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48286 0))(
  ( (Unit!48287) )
))
(declare-fun lt!628598 () Unit!48286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48286)

(assert (=> b!1427515 (= lt!628598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123090 res!962540) b!1427505))

(assert (= (and b!1427505 res!962539) b!1427514))

(assert (= (and b!1427514 res!962544) b!1427516))

(assert (= (and b!1427516 res!962545) b!1427512))

(assert (= (and b!1427512 res!962547) b!1427508))

(assert (= (and b!1427508 res!962548) b!1427517))

(assert (= (and b!1427517 res!962538) b!1427510))

(assert (= (and b!1427510 res!962541) b!1427509))

(assert (= (and b!1427509 res!962537) b!1427507))

(assert (= (and b!1427507 res!962543) b!1427506))

(assert (= (and b!1427506 res!962546) b!1427511))

(assert (= (and b!1427511 res!962542) b!1427515))

(assert (= (and b!1427515 res!962536) b!1427513))

(declare-fun m!1317873 () Bool)

(assert (=> b!1427512 m!1317873))

(declare-fun m!1317875 () Bool)

(assert (=> b!1427506 m!1317875))

(declare-fun m!1317877 () Bool)

(assert (=> b!1427507 m!1317877))

(assert (=> b!1427507 m!1317877))

(declare-fun m!1317879 () Bool)

(assert (=> b!1427507 m!1317879))

(declare-fun m!1317881 () Bool)

(assert (=> b!1427509 m!1317881))

(assert (=> b!1427509 m!1317881))

(declare-fun m!1317883 () Bool)

(assert (=> b!1427509 m!1317883))

(declare-fun m!1317885 () Bool)

(assert (=> b!1427509 m!1317885))

(declare-fun m!1317887 () Bool)

(assert (=> b!1427509 m!1317887))

(declare-fun m!1317889 () Bool)

(assert (=> b!1427515 m!1317889))

(declare-fun m!1317891 () Bool)

(assert (=> b!1427515 m!1317891))

(declare-fun m!1317893 () Bool)

(assert (=> b!1427515 m!1317893))

(assert (=> b!1427513 m!1317877))

(assert (=> b!1427513 m!1317877))

(declare-fun m!1317895 () Bool)

(assert (=> b!1427513 m!1317895))

(declare-fun m!1317897 () Bool)

(assert (=> start!123090 m!1317897))

(declare-fun m!1317899 () Bool)

(assert (=> start!123090 m!1317899))

(assert (=> b!1427510 m!1317877))

(assert (=> b!1427510 m!1317877))

(declare-fun m!1317901 () Bool)

(assert (=> b!1427510 m!1317901))

(assert (=> b!1427510 m!1317901))

(assert (=> b!1427510 m!1317877))

(declare-fun m!1317903 () Bool)

(assert (=> b!1427510 m!1317903))

(declare-fun m!1317905 () Bool)

(assert (=> b!1427508 m!1317905))

(assert (=> b!1427516 m!1317877))

(assert (=> b!1427516 m!1317877))

(declare-fun m!1317907 () Bool)

(assert (=> b!1427516 m!1317907))

(declare-fun m!1317909 () Bool)

(assert (=> b!1427514 m!1317909))

(assert (=> b!1427514 m!1317909))

(declare-fun m!1317911 () Bool)

(assert (=> b!1427514 m!1317911))

(push 1)

(assert (not b!1427510))

(assert (not b!1427512))

(assert (not start!123090))

(assert (not b!1427506))

(assert (not b!1427516))

(assert (not b!1427515))

(assert (not b!1427513))

(assert (not b!1427508))

(assert (not b!1427514))

(assert (not b!1427509))

(assert (not b!1427507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153371 () Bool)

(assert (=> d!153371 (= (validKeyInArray!0 (select (arr!46991 a!2831) i!982)) (and (not (= (select (arr!46991 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46991 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427514 d!153371))

(declare-fun e!806349 () SeekEntryResult!11270)

(declare-fun b!1427693 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427693 (= e!806349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628599 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628599 lt!628597 mask!2608))))

(declare-fun b!1427694 () Bool)

(declare-fun lt!628670 () SeekEntryResult!11270)

(assert (=> b!1427694 (and (bvsge (index!47474 lt!628670) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628670) (size!47541 lt!628597)))))

(declare-fun res!962666 () Bool)

(assert (=> b!1427694 (= res!962666 (= (select (arr!46991 lt!628597) (index!47474 lt!628670)) lt!628599))))

(declare-fun e!806348 () Bool)

(assert (=> b!1427694 (=> res!962666 e!806348)))

(declare-fun e!806346 () Bool)

(assert (=> b!1427694 (= e!806346 e!806348)))

(declare-fun d!153373 () Bool)

(declare-fun e!806350 () Bool)

(assert (=> d!153373 e!806350))

(declare-fun c!132006 () Bool)

(assert (=> d!153373 (= c!132006 (and (is-Intermediate!11270 lt!628670) (undefined!12082 lt!628670)))))

(declare-fun e!806347 () SeekEntryResult!11270)

(assert (=> d!153373 (= lt!628670 e!806347)))

(declare-fun c!132007 () Bool)

(assert (=> d!153373 (= c!132007 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628669 () (_ BitVec 64))

(assert (=> d!153373 (= lt!628669 (select (arr!46991 lt!628597) (toIndex!0 lt!628599 mask!2608)))))

(assert (=> d!153373 (validMask!0 mask!2608)))

(assert (=> d!153373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628599 mask!2608) lt!628599 lt!628597 mask!2608) lt!628670)))

(declare-fun b!1427695 () Bool)

(assert (=> b!1427695 (= e!806350 e!806346)))

(declare-fun res!962663 () Bool)

(assert (=> b!1427695 (= res!962663 (and (is-Intermediate!11270 lt!628670) (not (undefined!12082 lt!628670)) (bvslt (x!129108 lt!628670) #b01111111111111111111111111111110) (bvsge (x!129108 lt!628670) #b00000000000000000000000000000000) (bvsge (x!129108 lt!628670) #b00000000000000000000000000000000)))))

(assert (=> b!1427695 (=> (not res!962663) (not e!806346))))

(declare-fun b!1427696 () Bool)

(assert (=> b!1427696 (and (bvsge (index!47474 lt!628670) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628670) (size!47541 lt!628597)))))

(declare-fun res!962665 () Bool)

(assert (=> b!1427696 (= res!962665 (= (select (arr!46991 lt!628597) (index!47474 lt!628670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427696 (=> res!962665 e!806348)))

(declare-fun b!1427697 () Bool)

(assert (=> b!1427697 (and (bvsge (index!47474 lt!628670) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628670) (size!47541 lt!628597)))))

(assert (=> b!1427697 (= e!806348 (= (select (arr!46991 lt!628597) (index!47474 lt!628670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427698 () Bool)

(assert (=> b!1427698 (= e!806347 e!806349)))

(declare-fun c!132005 () Bool)

(assert (=> b!1427698 (= c!132005 (or (= lt!628669 lt!628599) (= (bvadd lt!628669 lt!628669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427699 () Bool)

(assert (=> b!1427699 (= e!806347 (Intermediate!11270 true (toIndex!0 lt!628599 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427700 () Bool)

(assert (=> b!1427700 (= e!806350 (bvsge (x!129108 lt!628670) #b01111111111111111111111111111110))))

(declare-fun b!1427701 () Bool)

(assert (=> b!1427701 (= e!806349 (Intermediate!11270 false (toIndex!0 lt!628599 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153373 c!132007) b!1427699))

(assert (= (and d!153373 (not c!132007)) b!1427698))

(assert (= (and b!1427698 c!132005) b!1427701))

(assert (= (and b!1427698 (not c!132005)) b!1427693))

(assert (= (and d!153373 c!132006) b!1427700))

(assert (= (and d!153373 (not c!132006)) b!1427695))

(assert (= (and b!1427695 res!962663) b!1427694))

(assert (= (and b!1427694 (not res!962666)) b!1427696))

(assert (= (and b!1427696 (not res!962665)) b!1427697))

(assert (=> d!153373 m!1317881))

(declare-fun m!1318035 () Bool)

(assert (=> d!153373 m!1318035))

(assert (=> d!153373 m!1317897))

(assert (=> b!1427693 m!1317881))

(declare-fun m!1318037 () Bool)

(assert (=> b!1427693 m!1318037))

(assert (=> b!1427693 m!1318037))

(declare-fun m!1318039 () Bool)

(assert (=> b!1427693 m!1318039))

(declare-fun m!1318041 () Bool)

(assert (=> b!1427697 m!1318041))

(assert (=> b!1427694 m!1318041))

(assert (=> b!1427696 m!1318041))

(assert (=> b!1427509 d!153373))

(declare-fun d!153385 () Bool)

(declare-fun lt!628684 () (_ BitVec 32))

(declare-fun lt!628683 () (_ BitVec 32))

(assert (=> d!153385 (= lt!628684 (bvmul (bvxor lt!628683 (bvlshr lt!628683 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153385 (= lt!628683 ((_ extract 31 0) (bvand (bvxor lt!628599 (bvlshr lt!628599 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153385 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962667 (let ((h!34810 ((_ extract 31 0) (bvand (bvxor lt!628599 (bvlshr lt!628599 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129116 (bvmul (bvxor h!34810 (bvlshr h!34810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129116 (bvlshr x!129116 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962667 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962667 #b00000000000000000000000000000000))))))

(assert (=> d!153385 (= (toIndex!0 lt!628599 mask!2608) (bvand (bvxor lt!628684 (bvlshr lt!628684 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427509 d!153385))

(declare-fun b!1427746 () Bool)

(declare-fun e!806378 () Bool)

(declare-fun call!67370 () Bool)

(assert (=> b!1427746 (= e!806378 call!67370)))

(declare-fun b!1427747 () Bool)

(declare-fun e!806377 () Bool)

(assert (=> b!1427747 (= e!806378 e!806377)))

(declare-fun lt!628702 () (_ BitVec 64))

(assert (=> b!1427747 (= lt!628702 (select (arr!46991 a!2831) j!81))))

(declare-fun lt!628704 () Unit!48286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97353 (_ BitVec 64) (_ BitVec 32)) Unit!48286)

(assert (=> b!1427747 (= lt!628704 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628702 j!81))))

(declare-fun arrayContainsKey!0 (array!97353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427747 (arrayContainsKey!0 a!2831 lt!628702 #b00000000000000000000000000000000)))

(declare-fun lt!628703 () Unit!48286)

(assert (=> b!1427747 (= lt!628703 lt!628704)))

(declare-fun res!962679 () Bool)

(assert (=> b!1427747 (= res!962679 (= (seekEntryOrOpen!0 (select (arr!46991 a!2831) j!81) a!2831 mask!2608) (Found!11270 j!81)))))

(assert (=> b!1427747 (=> (not res!962679) (not e!806377))))

(declare-fun bm!67367 () Bool)

(assert (=> bm!67367 (= call!67370 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153391 () Bool)

(declare-fun res!962678 () Bool)

(declare-fun e!806376 () Bool)

(assert (=> d!153391 (=> res!962678 e!806376)))

(assert (=> d!153391 (= res!962678 (bvsge j!81 (size!47541 a!2831)))))

(assert (=> d!153391 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806376)))

(declare-fun b!1427748 () Bool)

(assert (=> b!1427748 (= e!806376 e!806378)))

(declare-fun c!132025 () Bool)

(assert (=> b!1427748 (= c!132025 (validKeyInArray!0 (select (arr!46991 a!2831) j!81)))))

(declare-fun b!1427749 () Bool)

(assert (=> b!1427749 (= e!806377 call!67370)))

(assert (= (and d!153391 (not res!962678)) b!1427748))

(assert (= (and b!1427748 c!132025) b!1427747))

(assert (= (and b!1427748 (not c!132025)) b!1427746))

(assert (= (and b!1427747 res!962679) b!1427749))

(assert (= (or b!1427749 b!1427746) bm!67367))

(assert (=> b!1427747 m!1317877))

(declare-fun m!1318067 () Bool)

(assert (=> b!1427747 m!1318067))

(declare-fun m!1318069 () Bool)

(assert (=> b!1427747 m!1318069))

(assert (=> b!1427747 m!1317877))

(assert (=> b!1427747 m!1317895))

(declare-fun m!1318071 () Bool)

(assert (=> bm!67367 m!1318071))

(assert (=> b!1427748 m!1317877))

(assert (=> b!1427748 m!1317877))

(assert (=> b!1427748 m!1317907))

(assert (=> b!1427515 d!153391))

(declare-fun d!153399 () Bool)

(assert (=> d!153399 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628707 () Unit!48286)

(declare-fun choose!38 (array!97353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48286)

(assert (=> d!153399 (= lt!628707 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153399 (validMask!0 mask!2608)))

(assert (=> d!153399 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628707)))

(declare-fun bs!41610 () Bool)

(assert (= bs!41610 d!153399))

(assert (=> bs!41610 m!1317891))

(declare-fun m!1318073 () Bool)

(assert (=> bs!41610 m!1318073))

(assert (=> bs!41610 m!1317897))

(assert (=> b!1427515 d!153399))

(declare-fun b!1427760 () Bool)

(declare-fun e!806390 () SeekEntryResult!11270)

(assert (=> b!1427760 (= e!806390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46991 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427761 () Bool)

(declare-fun lt!628709 () SeekEntryResult!11270)

(assert (=> b!1427761 (and (bvsge (index!47474 lt!628709) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628709) (size!47541 a!2831)))))

(declare-fun res!962688 () Bool)

(assert (=> b!1427761 (= res!962688 (= (select (arr!46991 a!2831) (index!47474 lt!628709)) (select (arr!46991 a!2831) j!81)))))

(declare-fun e!806389 () Bool)

(assert (=> b!1427761 (=> res!962688 e!806389)))

(declare-fun e!806387 () Bool)

(assert (=> b!1427761 (= e!806387 e!806389)))

(declare-fun d!153403 () Bool)

(declare-fun e!806391 () Bool)

(assert (=> d!153403 e!806391))

(declare-fun c!132029 () Bool)

(assert (=> d!153403 (= c!132029 (and (is-Intermediate!11270 lt!628709) (undefined!12082 lt!628709)))))

(declare-fun e!806388 () SeekEntryResult!11270)

(assert (=> d!153403 (= lt!628709 e!806388)))

(declare-fun c!132030 () Bool)

(assert (=> d!153403 (= c!132030 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628708 () (_ BitVec 64))

(assert (=> d!153403 (= lt!628708 (select (arr!46991 a!2831) (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608)))))

(assert (=> d!153403 (validMask!0 mask!2608)))

(assert (=> d!153403 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) (select (arr!46991 a!2831) j!81) a!2831 mask!2608) lt!628709)))

(declare-fun b!1427762 () Bool)

(assert (=> b!1427762 (= e!806391 e!806387)))

(declare-fun res!962686 () Bool)

(assert (=> b!1427762 (= res!962686 (and (is-Intermediate!11270 lt!628709) (not (undefined!12082 lt!628709)) (bvslt (x!129108 lt!628709) #b01111111111111111111111111111110) (bvsge (x!129108 lt!628709) #b00000000000000000000000000000000) (bvsge (x!129108 lt!628709) #b00000000000000000000000000000000)))))

(assert (=> b!1427762 (=> (not res!962686) (not e!806387))))

(declare-fun b!1427763 () Bool)

(assert (=> b!1427763 (and (bvsge (index!47474 lt!628709) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628709) (size!47541 a!2831)))))

(declare-fun res!962687 () Bool)

(assert (=> b!1427763 (= res!962687 (= (select (arr!46991 a!2831) (index!47474 lt!628709)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427763 (=> res!962687 e!806389)))

(declare-fun b!1427764 () Bool)

(assert (=> b!1427764 (and (bvsge (index!47474 lt!628709) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628709) (size!47541 a!2831)))))

(assert (=> b!1427764 (= e!806389 (= (select (arr!46991 a!2831) (index!47474 lt!628709)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427765 () Bool)

(assert (=> b!1427765 (= e!806388 e!806390)))

(declare-fun c!132028 () Bool)

(assert (=> b!1427765 (= c!132028 (or (= lt!628708 (select (arr!46991 a!2831) j!81)) (= (bvadd lt!628708 lt!628708) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427766 () Bool)

(assert (=> b!1427766 (= e!806388 (Intermediate!11270 true (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427767 () Bool)

(assert (=> b!1427767 (= e!806391 (bvsge (x!129108 lt!628709) #b01111111111111111111111111111110))))

(declare-fun b!1427768 () Bool)

(assert (=> b!1427768 (= e!806390 (Intermediate!11270 false (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153403 c!132030) b!1427766))

(assert (= (and d!153403 (not c!132030)) b!1427765))

(assert (= (and b!1427765 c!132028) b!1427768))

(assert (= (and b!1427765 (not c!132028)) b!1427760))

(assert (= (and d!153403 c!132029) b!1427767))

(assert (= (and d!153403 (not c!132029)) b!1427762))

(assert (= (and b!1427762 res!962686) b!1427761))

(assert (= (and b!1427761 (not res!962688)) b!1427763))

(assert (= (and b!1427763 (not res!962687)) b!1427764))

(assert (=> d!153403 m!1317901))

(declare-fun m!1318075 () Bool)

(assert (=> d!153403 m!1318075))

(assert (=> d!153403 m!1317897))

(assert (=> b!1427760 m!1317901))

(declare-fun m!1318077 () Bool)

(assert (=> b!1427760 m!1318077))

(assert (=> b!1427760 m!1318077))

(assert (=> b!1427760 m!1317877))

(declare-fun m!1318081 () Bool)

(assert (=> b!1427760 m!1318081))

(declare-fun m!1318083 () Bool)

(assert (=> b!1427764 m!1318083))

(assert (=> b!1427761 m!1318083))

(assert (=> b!1427763 m!1318083))

(assert (=> b!1427510 d!153403))

(declare-fun d!153405 () Bool)

(declare-fun lt!628711 () (_ BitVec 32))

(declare-fun lt!628710 () (_ BitVec 32))

(assert (=> d!153405 (= lt!628711 (bvmul (bvxor lt!628710 (bvlshr lt!628710 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153405 (= lt!628710 ((_ extract 31 0) (bvand (bvxor (select (arr!46991 a!2831) j!81) (bvlshr (select (arr!46991 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153405 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962667 (let ((h!34810 ((_ extract 31 0) (bvand (bvxor (select (arr!46991 a!2831) j!81) (bvlshr (select (arr!46991 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129116 (bvmul (bvxor h!34810 (bvlshr h!34810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129116 (bvlshr x!129116 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962667 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962667 #b00000000000000000000000000000000))))))

(assert (=> d!153405 (= (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) (bvand (bvxor lt!628711 (bvlshr lt!628711 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1427510 d!153405))

(declare-fun d!153409 () Bool)

(assert (=> d!153409 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123090 d!153409))

(declare-fun d!153415 () Bool)

(assert (=> d!153415 (= (array_inv!36019 a!2831) (bvsge (size!47541 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123090 d!153415))

(declare-fun d!153417 () Bool)

(assert (=> d!153417 (= (validKeyInArray!0 (select (arr!46991 a!2831) j!81)) (and (not (= (select (arr!46991 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46991 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1427516 d!153417))

(declare-fun b!1427795 () Bool)

(declare-fun e!806410 () SeekEntryResult!11270)

(assert (=> b!1427795 (= e!806410 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628599 lt!628597 mask!2608))))

(declare-fun b!1427796 () Bool)

(declare-fun lt!628723 () SeekEntryResult!11270)

(assert (=> b!1427796 (and (bvsge (index!47474 lt!628723) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628723) (size!47541 lt!628597)))))

(declare-fun res!962697 () Bool)

(assert (=> b!1427796 (= res!962697 (= (select (arr!46991 lt!628597) (index!47474 lt!628723)) lt!628599))))

(declare-fun e!806409 () Bool)

(assert (=> b!1427796 (=> res!962697 e!806409)))

(declare-fun e!806407 () Bool)

(assert (=> b!1427796 (= e!806407 e!806409)))

(declare-fun d!153419 () Bool)

(declare-fun e!806411 () Bool)

(assert (=> d!153419 e!806411))

(declare-fun c!132042 () Bool)

(assert (=> d!153419 (= c!132042 (and (is-Intermediate!11270 lt!628723) (undefined!12082 lt!628723)))))

(declare-fun e!806408 () SeekEntryResult!11270)

(assert (=> d!153419 (= lt!628723 e!806408)))

(declare-fun c!132043 () Bool)

(assert (=> d!153419 (= c!132043 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628722 () (_ BitVec 64))

(assert (=> d!153419 (= lt!628722 (select (arr!46991 lt!628597) index!585))))

(assert (=> d!153419 (validMask!0 mask!2608)))

(assert (=> d!153419 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628599 lt!628597 mask!2608) lt!628723)))

(declare-fun b!1427797 () Bool)

(assert (=> b!1427797 (= e!806411 e!806407)))

(declare-fun res!962695 () Bool)

(assert (=> b!1427797 (= res!962695 (and (is-Intermediate!11270 lt!628723) (not (undefined!12082 lt!628723)) (bvslt (x!129108 lt!628723) #b01111111111111111111111111111110) (bvsge (x!129108 lt!628723) #b00000000000000000000000000000000) (bvsge (x!129108 lt!628723) x!605)))))

(assert (=> b!1427797 (=> (not res!962695) (not e!806407))))

(declare-fun b!1427798 () Bool)

(assert (=> b!1427798 (and (bvsge (index!47474 lt!628723) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628723) (size!47541 lt!628597)))))

(declare-fun res!962696 () Bool)

(assert (=> b!1427798 (= res!962696 (= (select (arr!46991 lt!628597) (index!47474 lt!628723)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427798 (=> res!962696 e!806409)))

(declare-fun b!1427799 () Bool)

(assert (=> b!1427799 (and (bvsge (index!47474 lt!628723) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628723) (size!47541 lt!628597)))))

(assert (=> b!1427799 (= e!806409 (= (select (arr!46991 lt!628597) (index!47474 lt!628723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427800 () Bool)

(assert (=> b!1427800 (= e!806408 e!806410)))

(declare-fun c!132041 () Bool)

(assert (=> b!1427800 (= c!132041 (or (= lt!628722 lt!628599) (= (bvadd lt!628722 lt!628722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427801 () Bool)

(assert (=> b!1427801 (= e!806408 (Intermediate!11270 true index!585 x!605))))

(declare-fun b!1427802 () Bool)

(assert (=> b!1427802 (= e!806411 (bvsge (x!129108 lt!628723) #b01111111111111111111111111111110))))

(declare-fun b!1427803 () Bool)

(assert (=> b!1427803 (= e!806410 (Intermediate!11270 false index!585 x!605))))

(assert (= (and d!153419 c!132043) b!1427801))

(assert (= (and d!153419 (not c!132043)) b!1427800))

(assert (= (and b!1427800 c!132041) b!1427803))

(assert (= (and b!1427800 (not c!132041)) b!1427795))

(assert (= (and d!153419 c!132042) b!1427802))

(assert (= (and d!153419 (not c!132042)) b!1427797))

(assert (= (and b!1427797 res!962695) b!1427796))

(assert (= (and b!1427796 (not res!962697)) b!1427798))

(assert (= (and b!1427798 (not res!962696)) b!1427799))

(declare-fun m!1318095 () Bool)

(assert (=> d!153419 m!1318095))

(assert (=> d!153419 m!1317897))

(declare-fun m!1318097 () Bool)

(assert (=> b!1427795 m!1318097))

(assert (=> b!1427795 m!1318097))

(declare-fun m!1318099 () Bool)

(assert (=> b!1427795 m!1318099))

(declare-fun m!1318101 () Bool)

(assert (=> b!1427799 m!1318101))

(assert (=> b!1427796 m!1318101))

(assert (=> b!1427798 m!1318101))

(assert (=> b!1427506 d!153419))

(declare-fun b!1427804 () Bool)

(declare-fun e!806414 () Bool)

(declare-fun call!67374 () Bool)

(assert (=> b!1427804 (= e!806414 call!67374)))

(declare-fun b!1427805 () Bool)

(declare-fun e!806413 () Bool)

(assert (=> b!1427805 (= e!806414 e!806413)))

(declare-fun lt!628724 () (_ BitVec 64))

(assert (=> b!1427805 (= lt!628724 (select (arr!46991 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628726 () Unit!48286)

(assert (=> b!1427805 (= lt!628726 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628724 #b00000000000000000000000000000000))))

(assert (=> b!1427805 (arrayContainsKey!0 a!2831 lt!628724 #b00000000000000000000000000000000)))

(declare-fun lt!628725 () Unit!48286)

(assert (=> b!1427805 (= lt!628725 lt!628726)))

(declare-fun res!962699 () Bool)

(assert (=> b!1427805 (= res!962699 (= (seekEntryOrOpen!0 (select (arr!46991 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11270 #b00000000000000000000000000000000)))))

(assert (=> b!1427805 (=> (not res!962699) (not e!806413))))

(declare-fun bm!67371 () Bool)

(assert (=> bm!67371 (= call!67374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153423 () Bool)

(declare-fun res!962698 () Bool)

(declare-fun e!806412 () Bool)

(assert (=> d!153423 (=> res!962698 e!806412)))

(assert (=> d!153423 (= res!962698 (bvsge #b00000000000000000000000000000000 (size!47541 a!2831)))))

(assert (=> d!153423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806412)))

(declare-fun b!1427806 () Bool)

(assert (=> b!1427806 (= e!806412 e!806414)))

(declare-fun c!132044 () Bool)

(assert (=> b!1427806 (= c!132044 (validKeyInArray!0 (select (arr!46991 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427807 () Bool)

(assert (=> b!1427807 (= e!806413 call!67374)))

(assert (= (and d!153423 (not res!962698)) b!1427806))

(assert (= (and b!1427806 c!132044) b!1427805))

(assert (= (and b!1427806 (not c!132044)) b!1427804))

(assert (= (and b!1427805 res!962699) b!1427807))

(assert (= (or b!1427807 b!1427804) bm!67371))

(declare-fun m!1318103 () Bool)

(assert (=> b!1427805 m!1318103))

(declare-fun m!1318105 () Bool)

(assert (=> b!1427805 m!1318105))

(declare-fun m!1318107 () Bool)

(assert (=> b!1427805 m!1318107))

(assert (=> b!1427805 m!1318103))

(declare-fun m!1318109 () Bool)

(assert (=> b!1427805 m!1318109))

(declare-fun m!1318111 () Bool)

(assert (=> bm!67371 m!1318111))

(assert (=> b!1427806 m!1318103))

(assert (=> b!1427806 m!1318103))

(declare-fun m!1318113 () Bool)

(assert (=> b!1427806 m!1318113))

(assert (=> b!1427512 d!153423))

(declare-fun e!806418 () SeekEntryResult!11270)

(declare-fun b!1427808 () Bool)

(assert (=> b!1427808 (= e!806418 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46991 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427809 () Bool)

(declare-fun lt!628728 () SeekEntryResult!11270)

(assert (=> b!1427809 (and (bvsge (index!47474 lt!628728) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628728) (size!47541 a!2831)))))

(declare-fun res!962702 () Bool)

(assert (=> b!1427809 (= res!962702 (= (select (arr!46991 a!2831) (index!47474 lt!628728)) (select (arr!46991 a!2831) j!81)))))

(declare-fun e!806417 () Bool)

(assert (=> b!1427809 (=> res!962702 e!806417)))

(declare-fun e!806415 () Bool)

(assert (=> b!1427809 (= e!806415 e!806417)))

(declare-fun d!153427 () Bool)

(declare-fun e!806419 () Bool)

(assert (=> d!153427 e!806419))

(declare-fun c!132046 () Bool)

(assert (=> d!153427 (= c!132046 (and (is-Intermediate!11270 lt!628728) (undefined!12082 lt!628728)))))

(declare-fun e!806416 () SeekEntryResult!11270)

(assert (=> d!153427 (= lt!628728 e!806416)))

(declare-fun c!132047 () Bool)

(assert (=> d!153427 (= c!132047 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628727 () (_ BitVec 64))

(assert (=> d!153427 (= lt!628727 (select (arr!46991 a!2831) index!585))))

(assert (=> d!153427 (validMask!0 mask!2608)))

(assert (=> d!153427 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46991 a!2831) j!81) a!2831 mask!2608) lt!628728)))

(declare-fun b!1427810 () Bool)

(assert (=> b!1427810 (= e!806419 e!806415)))

(declare-fun res!962700 () Bool)

(assert (=> b!1427810 (= res!962700 (and (is-Intermediate!11270 lt!628728) (not (undefined!12082 lt!628728)) (bvslt (x!129108 lt!628728) #b01111111111111111111111111111110) (bvsge (x!129108 lt!628728) #b00000000000000000000000000000000) (bvsge (x!129108 lt!628728) x!605)))))

(assert (=> b!1427810 (=> (not res!962700) (not e!806415))))

(declare-fun b!1427811 () Bool)

(assert (=> b!1427811 (and (bvsge (index!47474 lt!628728) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628728) (size!47541 a!2831)))))

(declare-fun res!962701 () Bool)

(assert (=> b!1427811 (= res!962701 (= (select (arr!46991 a!2831) (index!47474 lt!628728)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427811 (=> res!962701 e!806417)))

(declare-fun b!1427812 () Bool)

(assert (=> b!1427812 (and (bvsge (index!47474 lt!628728) #b00000000000000000000000000000000) (bvslt (index!47474 lt!628728) (size!47541 a!2831)))))

(assert (=> b!1427812 (= e!806417 (= (select (arr!46991 a!2831) (index!47474 lt!628728)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427813 () Bool)

(assert (=> b!1427813 (= e!806416 e!806418)))

(declare-fun c!132045 () Bool)

(assert (=> b!1427813 (= c!132045 (or (= lt!628727 (select (arr!46991 a!2831) j!81)) (= (bvadd lt!628727 lt!628727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427814 () Bool)

(assert (=> b!1427814 (= e!806416 (Intermediate!11270 true index!585 x!605))))

(declare-fun b!1427815 () Bool)

(assert (=> b!1427815 (= e!806419 (bvsge (x!129108 lt!628728) #b01111111111111111111111111111110))))

(declare-fun b!1427816 () Bool)

(assert (=> b!1427816 (= e!806418 (Intermediate!11270 false index!585 x!605))))

(assert (= (and d!153427 c!132047) b!1427814))

(assert (= (and d!153427 (not c!132047)) b!1427813))

(assert (= (and b!1427813 c!132045) b!1427816))

(assert (= (and b!1427813 (not c!132045)) b!1427808))

(assert (= (and d!153427 c!132046) b!1427815))

(assert (= (and d!153427 (not c!132046)) b!1427810))

(assert (= (and b!1427810 res!962700) b!1427809))

(assert (= (and b!1427809 (not res!962702)) b!1427811))

(assert (= (and b!1427811 (not res!962701)) b!1427812))

(assert (=> d!153427 m!1317889))

(assert (=> d!153427 m!1317897))

(assert (=> b!1427808 m!1318097))

(assert (=> b!1427808 m!1318097))

(assert (=> b!1427808 m!1317877))

(declare-fun m!1318115 () Bool)

(assert (=> b!1427808 m!1318115))

(declare-fun m!1318117 () Bool)

(assert (=> b!1427812 m!1318117))

(assert (=> b!1427809 m!1318117))

(assert (=> b!1427811 m!1318117))

(assert (=> b!1427507 d!153427))

(declare-fun b!1427869 () Bool)

(declare-fun e!806453 () SeekEntryResult!11270)

(declare-fun lt!628761 () SeekEntryResult!11270)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97353 (_ BitVec 32)) SeekEntryResult!11270)

(assert (=> b!1427869 (= e!806453 (seekKeyOrZeroReturnVacant!0 (x!129108 lt!628761) (index!47474 lt!628761) (index!47474 lt!628761) (select (arr!46991 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427870 () Bool)

(declare-fun e!806451 () SeekEntryResult!11270)

(assert (=> b!1427870 (= e!806451 (Found!11270 (index!47474 lt!628761)))))

(declare-fun b!1427871 () Bool)

(assert (=> b!1427871 (= e!806453 (MissingZero!11270 (index!47474 lt!628761)))))

(declare-fun b!1427872 () Bool)

(declare-fun e!806452 () SeekEntryResult!11270)

(assert (=> b!1427872 (= e!806452 Undefined!11270)))

(declare-fun b!1427873 () Bool)

(assert (=> b!1427873 (= e!806452 e!806451)))

(declare-fun lt!628759 () (_ BitVec 64))

(assert (=> b!1427873 (= lt!628759 (select (arr!46991 a!2831) (index!47474 lt!628761)))))

(declare-fun c!132067 () Bool)

(assert (=> b!1427873 (= c!132067 (= lt!628759 (select (arr!46991 a!2831) j!81)))))

(declare-fun d!153429 () Bool)

(declare-fun lt!628760 () SeekEntryResult!11270)

(assert (=> d!153429 (and (or (is-Undefined!11270 lt!628760) (not (is-Found!11270 lt!628760)) (and (bvsge (index!47473 lt!628760) #b00000000000000000000000000000000) (bvslt (index!47473 lt!628760) (size!47541 a!2831)))) (or (is-Undefined!11270 lt!628760) (is-Found!11270 lt!628760) (not (is-MissingZero!11270 lt!628760)) (and (bvsge (index!47472 lt!628760) #b00000000000000000000000000000000) (bvslt (index!47472 lt!628760) (size!47541 a!2831)))) (or (is-Undefined!11270 lt!628760) (is-Found!11270 lt!628760) (is-MissingZero!11270 lt!628760) (not (is-MissingVacant!11270 lt!628760)) (and (bvsge (index!47475 lt!628760) #b00000000000000000000000000000000) (bvslt (index!47475 lt!628760) (size!47541 a!2831)))) (or (is-Undefined!11270 lt!628760) (ite (is-Found!11270 lt!628760) (= (select (arr!46991 a!2831) (index!47473 lt!628760)) (select (arr!46991 a!2831) j!81)) (ite (is-MissingZero!11270 lt!628760) (= (select (arr!46991 a!2831) (index!47472 lt!628760)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11270 lt!628760) (= (select (arr!46991 a!2831) (index!47475 lt!628760)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153429 (= lt!628760 e!806452)))

(declare-fun c!132068 () Bool)

(assert (=> d!153429 (= c!132068 (and (is-Intermediate!11270 lt!628761) (undefined!12082 lt!628761)))))

(assert (=> d!153429 (= lt!628761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46991 a!2831) j!81) mask!2608) (select (arr!46991 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153429 (validMask!0 mask!2608)))

(assert (=> d!153429 (= (seekEntryOrOpen!0 (select (arr!46991 a!2831) j!81) a!2831 mask!2608) lt!628760)))

(declare-fun b!1427874 () Bool)

(declare-fun c!132069 () Bool)

(assert (=> b!1427874 (= c!132069 (= lt!628759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427874 (= e!806451 e!806453)))

(assert (= (and d!153429 c!132068) b!1427872))

(assert (= (and d!153429 (not c!132068)) b!1427873))

(assert (= (and b!1427873 c!132067) b!1427870))

(assert (= (and b!1427873 (not c!132067)) b!1427874))

(assert (= (and b!1427874 c!132069) b!1427871))

(assert (= (and b!1427874 (not c!132069)) b!1427869))

(assert (=> b!1427869 m!1317877))

(declare-fun m!1318161 () Bool)

(assert (=> b!1427869 m!1318161))

(declare-fun m!1318163 () Bool)

(assert (=> b!1427873 m!1318163))

(declare-fun m!1318165 () Bool)

(assert (=> d!153429 m!1318165))

(declare-fun m!1318167 () Bool)

(assert (=> d!153429 m!1318167))

(declare-fun m!1318169 () Bool)

(assert (=> d!153429 m!1318169))

(assert (=> d!153429 m!1317897))

(assert (=> d!153429 m!1317877))

(assert (=> d!153429 m!1317901))

(assert (=> d!153429 m!1317901))

(assert (=> d!153429 m!1317877))

(assert (=> d!153429 m!1317903))

(assert (=> b!1427513 d!153429))

(declare-fun b!1427900 () Bool)

(declare-fun e!806474 () Bool)

(declare-fun e!806476 () Bool)

(assert (=> b!1427900 (= e!806474 e!806476)))

(declare-fun c!132075 () Bool)

(assert (=> b!1427900 (= c!132075 (validKeyInArray!0 (select (arr!46991 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427901 () Bool)

(declare-fun call!67384 () Bool)

(assert (=> b!1427901 (= e!806476 call!67384)))

(declare-fun b!1427902 () Bool)

(declare-fun e!806475 () Bool)

(declare-fun contains!9853 (List!33501 (_ BitVec 64)) Bool)

(assert (=> b!1427902 (= e!806475 (contains!9853 Nil!33498 (select (arr!46991 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427903 () Bool)

(declare-fun e!806477 () Bool)

(assert (=> b!1427903 (= e!806477 e!806474)))

(declare-fun res!962733 () Bool)

(assert (=> b!1427903 (=> (not res!962733) (not e!806474))))

(assert (=> b!1427903 (= res!962733 (not e!806475))))

(declare-fun res!962732 () Bool)

(assert (=> b!1427903 (=> (not res!962732) (not e!806475))))

(assert (=> b!1427903 (= res!962732 (validKeyInArray!0 (select (arr!46991 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153449 () Bool)

(declare-fun res!962734 () Bool)

(assert (=> d!153449 (=> res!962734 e!806477)))

(assert (=> d!153449 (= res!962734 (bvsge #b00000000000000000000000000000000 (size!47541 a!2831)))))

(assert (=> d!153449 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33498) e!806477)))

(declare-fun bm!67381 () Bool)

(assert (=> bm!67381 (= call!67384 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132075 (Cons!33497 (select (arr!46991 a!2831) #b00000000000000000000000000000000) Nil!33498) Nil!33498)))))

(declare-fun b!1427904 () Bool)

(assert (=> b!1427904 (= e!806476 call!67384)))

(assert (= (and d!153449 (not res!962734)) b!1427903))

(assert (= (and b!1427903 res!962732) b!1427902))

(assert (= (and b!1427903 res!962733) b!1427900))

(assert (= (and b!1427900 c!132075) b!1427904))

(assert (= (and b!1427900 (not c!132075)) b!1427901))

(assert (= (or b!1427904 b!1427901) bm!67381))

(assert (=> b!1427900 m!1318103))

(assert (=> b!1427900 m!1318103))

(assert (=> b!1427900 m!1318113))

(assert (=> b!1427902 m!1318103))

(assert (=> b!1427902 m!1318103))

(declare-fun m!1318175 () Bool)

(assert (=> b!1427902 m!1318175))

(assert (=> b!1427903 m!1318103))

(assert (=> b!1427903 m!1318103))

(assert (=> b!1427903 m!1318113))

(assert (=> bm!67381 m!1318103))

(declare-fun m!1318177 () Bool)

(assert (=> bm!67381 m!1318177))

(assert (=> b!1427508 d!153449))

(push 1)

(assert (not b!1427902))

(assert (not bm!67381))

(assert (not b!1427869))

(assert (not d!153399))

(assert (not b!1427806))

(assert (not b!1427747))

(assert (not b!1427900))

(assert (not b!1427903))

(assert (not d!153429))

(assert (not b!1427760))

(assert (not bm!67367))

(assert (not b!1427795))

(assert (not b!1427808))

(assert (not d!153373))

(assert (not d!153419))

(assert (not b!1427693))

(assert (not bm!67371))

(assert (not b!1427805))

(assert (not b!1427748))

(assert (not d!153427))

(assert (not d!153403))

(check-sat)

