; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123350 () Bool)

(assert start!123350)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1430351 () Bool)

(declare-fun e!807548 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97413 0))(
  ( (array!97414 (arr!47017 (Array (_ BitVec 32) (_ BitVec 64))) (size!47569 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97413)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1430351 (= e!807548 (not (or (= (select (arr!47017 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47017 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47017 a!2831) index!585) (select (arr!47017 a!2831) j!81)) (not (= (select (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))))

(declare-fun e!807551 () Bool)

(assert (=> b!1430351 e!807551))

(declare-fun res!964836 () Bool)

(assert (=> b!1430351 (=> (not res!964836) (not e!807551))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97413 (_ BitVec 32)) Bool)

(assert (=> b!1430351 (= res!964836 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48231 0))(
  ( (Unit!48232) )
))
(declare-fun lt!629567 () Unit!48231)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48231)

(assert (=> b!1430351 (= lt!629567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430353 () Bool)

(declare-fun res!964839 () Bool)

(assert (=> b!1430353 (=> (not res!964839) (not e!807548))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430353 (= res!964839 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430354 () Bool)

(declare-fun res!964831 () Bool)

(declare-fun e!807547 () Bool)

(assert (=> b!1430354 (=> (not res!964831) (not e!807547))))

(declare-datatypes ((List!33605 0))(
  ( (Nil!33602) (Cons!33601 (h!34918 (_ BitVec 64)) (t!48291 List!33605)) )
))
(declare-fun arrayNoDuplicates!0 (array!97413 (_ BitVec 32) List!33605) Bool)

(assert (=> b!1430354 (= res!964831 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33602))))

(declare-fun b!1430355 () Bool)

(declare-fun res!964841 () Bool)

(assert (=> b!1430355 (=> (not res!964841) (not e!807547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430355 (= res!964841 (validKeyInArray!0 (select (arr!47017 a!2831) j!81)))))

(declare-fun b!1430356 () Bool)

(declare-fun res!964832 () Bool)

(assert (=> b!1430356 (=> (not res!964832) (not e!807548))))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11323 0))(
  ( (MissingZero!11323 (index!47684 (_ BitVec 32))) (Found!11323 (index!47685 (_ BitVec 32))) (Intermediate!11323 (undefined!12135 Bool) (index!47686 (_ BitVec 32)) (x!129312 (_ BitVec 32))) (Undefined!11323) (MissingVacant!11323 (index!47687 (_ BitVec 32))) )
))
(declare-fun lt!629570 () SeekEntryResult!11323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97413 (_ BitVec 32)) SeekEntryResult!11323)

(assert (=> b!1430356 (= res!964832 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629570))))

(declare-fun b!1430357 () Bool)

(declare-fun e!807550 () Bool)

(assert (=> b!1430357 (= e!807547 e!807550)))

(declare-fun res!964842 () Bool)

(assert (=> b!1430357 (=> (not res!964842) (not e!807550))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430357 (= res!964842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629570))))

(assert (=> b!1430357 (= lt!629570 (Intermediate!11323 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430358 () Bool)

(assert (=> b!1430358 (= e!807551 (or (= (select (arr!47017 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47017 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47017 a!2831) index!585) (select (arr!47017 a!2831) j!81)) (not (= (select (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1430359 () Bool)

(assert (=> b!1430359 (= e!807550 e!807548)))

(declare-fun res!964833 () Bool)

(assert (=> b!1430359 (=> (not res!964833) (not e!807548))))

(declare-fun lt!629569 () array!97413)

(declare-fun lt!629566 () SeekEntryResult!11323)

(declare-fun lt!629568 () (_ BitVec 64))

(assert (=> b!1430359 (= res!964833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629568 mask!2608) lt!629568 lt!629569 mask!2608) lt!629566))))

(assert (=> b!1430359 (= lt!629566 (Intermediate!11323 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430359 (= lt!629568 (select (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430359 (= lt!629569 (array!97414 (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47569 a!2831)))))

(declare-fun b!1430360 () Bool)

(declare-fun res!964843 () Bool)

(assert (=> b!1430360 (=> (not res!964843) (not e!807547))))

(assert (=> b!1430360 (= res!964843 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47569 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47569 a!2831))))))

(declare-fun b!1430361 () Bool)

(declare-fun res!964834 () Bool)

(assert (=> b!1430361 (=> (not res!964834) (not e!807548))))

(assert (=> b!1430361 (= res!964834 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629568 lt!629569 mask!2608) lt!629566))))

(declare-fun b!1430362 () Bool)

(declare-fun res!964835 () Bool)

(assert (=> b!1430362 (=> (not res!964835) (not e!807547))))

(assert (=> b!1430362 (= res!964835 (and (= (size!47569 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47569 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47569 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!964830 () Bool)

(assert (=> start!123350 (=> (not res!964830) (not e!807547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123350 (= res!964830 (validMask!0 mask!2608))))

(assert (=> start!123350 e!807547))

(assert (=> start!123350 true))

(declare-fun array_inv!36250 (array!97413) Bool)

(assert (=> start!123350 (array_inv!36250 a!2831)))

(declare-fun b!1430352 () Bool)

(declare-fun res!964837 () Bool)

(assert (=> b!1430352 (=> (not res!964837) (not e!807547))))

(assert (=> b!1430352 (= res!964837 (validKeyInArray!0 (select (arr!47017 a!2831) i!982)))))

(declare-fun b!1430363 () Bool)

(declare-fun res!964838 () Bool)

(assert (=> b!1430363 (=> (not res!964838) (not e!807547))))

(assert (=> b!1430363 (= res!964838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430364 () Bool)

(declare-fun res!964840 () Bool)

(assert (=> b!1430364 (=> (not res!964840) (not e!807551))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97413 (_ BitVec 32)) SeekEntryResult!11323)

(assert (=> b!1430364 (= res!964840 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) (Found!11323 j!81)))))

(assert (= (and start!123350 res!964830) b!1430362))

(assert (= (and b!1430362 res!964835) b!1430352))

(assert (= (and b!1430352 res!964837) b!1430355))

(assert (= (and b!1430355 res!964841) b!1430363))

(assert (= (and b!1430363 res!964838) b!1430354))

(assert (= (and b!1430354 res!964831) b!1430360))

(assert (= (and b!1430360 res!964843) b!1430357))

(assert (= (and b!1430357 res!964842) b!1430359))

(assert (= (and b!1430359 res!964833) b!1430356))

(assert (= (and b!1430356 res!964832) b!1430361))

(assert (= (and b!1430361 res!964834) b!1430353))

(assert (= (and b!1430353 res!964839) b!1430351))

(assert (= (and b!1430351 res!964836) b!1430364))

(assert (= (and b!1430364 res!964840) b!1430358))

(declare-fun m!1319853 () Bool)

(assert (=> b!1430357 m!1319853))

(assert (=> b!1430357 m!1319853))

(declare-fun m!1319855 () Bool)

(assert (=> b!1430357 m!1319855))

(assert (=> b!1430357 m!1319855))

(assert (=> b!1430357 m!1319853))

(declare-fun m!1319857 () Bool)

(assert (=> b!1430357 m!1319857))

(declare-fun m!1319859 () Bool)

(assert (=> b!1430358 m!1319859))

(assert (=> b!1430358 m!1319853))

(declare-fun m!1319861 () Bool)

(assert (=> b!1430358 m!1319861))

(declare-fun m!1319863 () Bool)

(assert (=> b!1430358 m!1319863))

(declare-fun m!1319865 () Bool)

(assert (=> b!1430359 m!1319865))

(assert (=> b!1430359 m!1319865))

(declare-fun m!1319867 () Bool)

(assert (=> b!1430359 m!1319867))

(assert (=> b!1430359 m!1319861))

(declare-fun m!1319869 () Bool)

(assert (=> b!1430359 m!1319869))

(declare-fun m!1319871 () Bool)

(assert (=> b!1430352 m!1319871))

(assert (=> b!1430352 m!1319871))

(declare-fun m!1319873 () Bool)

(assert (=> b!1430352 m!1319873))

(declare-fun m!1319875 () Bool)

(assert (=> b!1430354 m!1319875))

(assert (=> b!1430355 m!1319853))

(assert (=> b!1430355 m!1319853))

(declare-fun m!1319877 () Bool)

(assert (=> b!1430355 m!1319877))

(assert (=> b!1430364 m!1319853))

(assert (=> b!1430364 m!1319853))

(declare-fun m!1319879 () Bool)

(assert (=> b!1430364 m!1319879))

(assert (=> b!1430351 m!1319861))

(assert (=> b!1430351 m!1319863))

(assert (=> b!1430351 m!1319859))

(declare-fun m!1319881 () Bool)

(assert (=> b!1430351 m!1319881))

(assert (=> b!1430351 m!1319853))

(declare-fun m!1319883 () Bool)

(assert (=> b!1430351 m!1319883))

(declare-fun m!1319885 () Bool)

(assert (=> b!1430363 m!1319885))

(declare-fun m!1319887 () Bool)

(assert (=> b!1430361 m!1319887))

(assert (=> b!1430356 m!1319853))

(assert (=> b!1430356 m!1319853))

(declare-fun m!1319889 () Bool)

(assert (=> b!1430356 m!1319889))

(declare-fun m!1319891 () Bool)

(assert (=> start!123350 m!1319891))

(declare-fun m!1319893 () Bool)

(assert (=> start!123350 m!1319893))

(check-sat (not b!1430352) (not b!1430359) (not b!1430364) (not b!1430363) (not b!1430361) (not b!1430351) (not b!1430355) (not b!1430356) (not b!1430357) (not b!1430354) (not start!123350))
(check-sat)
(get-model)

(declare-fun b!1430467 () Bool)

(declare-fun lt!629606 () SeekEntryResult!11323)

(assert (=> b!1430467 (and (bvsge (index!47686 lt!629606) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629606) (size!47569 lt!629569)))))

(declare-fun res!964935 () Bool)

(assert (=> b!1430467 (= res!964935 (= (select (arr!47017 lt!629569) (index!47686 lt!629606)) lt!629568))))

(declare-fun e!807593 () Bool)

(assert (=> b!1430467 (=> res!964935 e!807593)))

(declare-fun e!807595 () Bool)

(assert (=> b!1430467 (= e!807595 e!807593)))

(declare-fun b!1430468 () Bool)

(declare-fun e!807596 () SeekEntryResult!11323)

(assert (=> b!1430468 (= e!807596 (Intermediate!11323 true (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430469 () Bool)

(assert (=> b!1430469 (and (bvsge (index!47686 lt!629606) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629606) (size!47569 lt!629569)))))

(assert (=> b!1430469 (= e!807593 (= (select (arr!47017 lt!629569) (index!47686 lt!629606)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807592 () SeekEntryResult!11323)

(declare-fun b!1430470 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430470 (= e!807592 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629568 lt!629569 mask!2608))))

(declare-fun b!1430471 () Bool)

(assert (=> b!1430471 (= e!807592 (Intermediate!11323 false (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430473 () Bool)

(declare-fun e!807594 () Bool)

(assert (=> b!1430473 (= e!807594 (bvsge (x!129312 lt!629606) #b01111111111111111111111111111110))))

(declare-fun b!1430474 () Bool)

(assert (=> b!1430474 (and (bvsge (index!47686 lt!629606) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629606) (size!47569 lt!629569)))))

(declare-fun res!964936 () Bool)

(assert (=> b!1430474 (= res!964936 (= (select (arr!47017 lt!629569) (index!47686 lt!629606)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430474 (=> res!964936 e!807593)))

(declare-fun b!1430475 () Bool)

(assert (=> b!1430475 (= e!807594 e!807595)))

(declare-fun res!964934 () Bool)

(get-info :version)

(assert (=> b!1430475 (= res!964934 (and ((_ is Intermediate!11323) lt!629606) (not (undefined!12135 lt!629606)) (bvslt (x!129312 lt!629606) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629606) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629606) #b00000000000000000000000000000000)))))

(assert (=> b!1430475 (=> (not res!964934) (not e!807595))))

(declare-fun d!153537 () Bool)

(assert (=> d!153537 e!807594))

(declare-fun c!132263 () Bool)

(assert (=> d!153537 (= c!132263 (and ((_ is Intermediate!11323) lt!629606) (undefined!12135 lt!629606)))))

(assert (=> d!153537 (= lt!629606 e!807596)))

(declare-fun c!132265 () Bool)

(assert (=> d!153537 (= c!132265 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629605 () (_ BitVec 64))

(assert (=> d!153537 (= lt!629605 (select (arr!47017 lt!629569) (toIndex!0 lt!629568 mask!2608)))))

(assert (=> d!153537 (validMask!0 mask!2608)))

(assert (=> d!153537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629568 mask!2608) lt!629568 lt!629569 mask!2608) lt!629606)))

(declare-fun b!1430472 () Bool)

(assert (=> b!1430472 (= e!807596 e!807592)))

(declare-fun c!132264 () Bool)

(assert (=> b!1430472 (= c!132264 (or (= lt!629605 lt!629568) (= (bvadd lt!629605 lt!629605) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153537 c!132265) b!1430468))

(assert (= (and d!153537 (not c!132265)) b!1430472))

(assert (= (and b!1430472 c!132264) b!1430471))

(assert (= (and b!1430472 (not c!132264)) b!1430470))

(assert (= (and d!153537 c!132263) b!1430473))

(assert (= (and d!153537 (not c!132263)) b!1430475))

(assert (= (and b!1430475 res!964934) b!1430467))

(assert (= (and b!1430467 (not res!964935)) b!1430474))

(assert (= (and b!1430474 (not res!964936)) b!1430469))

(assert (=> d!153537 m!1319865))

(declare-fun m!1319979 () Bool)

(assert (=> d!153537 m!1319979))

(assert (=> d!153537 m!1319891))

(declare-fun m!1319981 () Bool)

(assert (=> b!1430474 m!1319981))

(assert (=> b!1430470 m!1319865))

(declare-fun m!1319983 () Bool)

(assert (=> b!1430470 m!1319983))

(assert (=> b!1430470 m!1319983))

(declare-fun m!1319985 () Bool)

(assert (=> b!1430470 m!1319985))

(assert (=> b!1430469 m!1319981))

(assert (=> b!1430467 m!1319981))

(assert (=> b!1430359 d!153537))

(declare-fun d!153539 () Bool)

(declare-fun lt!629612 () (_ BitVec 32))

(declare-fun lt!629611 () (_ BitVec 32))

(assert (=> d!153539 (= lt!629612 (bvmul (bvxor lt!629611 (bvlshr lt!629611 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153539 (= lt!629611 ((_ extract 31 0) (bvand (bvxor lt!629568 (bvlshr lt!629568 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153539 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964937 (let ((h!34921 ((_ extract 31 0) (bvand (bvxor lt!629568 (bvlshr lt!629568 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129316 (bvmul (bvxor h!34921 (bvlshr h!34921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129316 (bvlshr x!129316 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964937 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964937 #b00000000000000000000000000000000))))))

(assert (=> d!153539 (= (toIndex!0 lt!629568 mask!2608) (bvand (bvxor lt!629612 (bvlshr lt!629612 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430359 d!153539))

(declare-fun b!1430524 () Bool)

(declare-fun c!132285 () Bool)

(declare-fun lt!629628 () (_ BitVec 64))

(assert (=> b!1430524 (= c!132285 (= lt!629628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807623 () SeekEntryResult!11323)

(declare-fun e!807624 () SeekEntryResult!11323)

(assert (=> b!1430524 (= e!807623 e!807624)))

(declare-fun b!1430525 () Bool)

(declare-fun e!807625 () SeekEntryResult!11323)

(assert (=> b!1430525 (= e!807625 Undefined!11323)))

(declare-fun d!153543 () Bool)

(declare-fun lt!629627 () SeekEntryResult!11323)

(assert (=> d!153543 (and (or ((_ is Undefined!11323) lt!629627) (not ((_ is Found!11323) lt!629627)) (and (bvsge (index!47685 lt!629627) #b00000000000000000000000000000000) (bvslt (index!47685 lt!629627) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629627) ((_ is Found!11323) lt!629627) (not ((_ is MissingZero!11323) lt!629627)) (and (bvsge (index!47684 lt!629627) #b00000000000000000000000000000000) (bvslt (index!47684 lt!629627) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629627) ((_ is Found!11323) lt!629627) ((_ is MissingZero!11323) lt!629627) (not ((_ is MissingVacant!11323) lt!629627)) (and (bvsge (index!47687 lt!629627) #b00000000000000000000000000000000) (bvslt (index!47687 lt!629627) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629627) (ite ((_ is Found!11323) lt!629627) (= (select (arr!47017 a!2831) (index!47685 lt!629627)) (select (arr!47017 a!2831) j!81)) (ite ((_ is MissingZero!11323) lt!629627) (= (select (arr!47017 a!2831) (index!47684 lt!629627)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11323) lt!629627) (= (select (arr!47017 a!2831) (index!47687 lt!629627)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153543 (= lt!629627 e!807625)))

(declare-fun c!132284 () Bool)

(declare-fun lt!629629 () SeekEntryResult!11323)

(assert (=> d!153543 (= c!132284 (and ((_ is Intermediate!11323) lt!629629) (undefined!12135 lt!629629)))))

(assert (=> d!153543 (= lt!629629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153543 (validMask!0 mask!2608)))

(assert (=> d!153543 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629627)))

(declare-fun b!1430526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97413 (_ BitVec 32)) SeekEntryResult!11323)

(assert (=> b!1430526 (= e!807624 (seekKeyOrZeroReturnVacant!0 (x!129312 lt!629629) (index!47686 lt!629629) (index!47686 lt!629629) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430527 () Bool)

(assert (=> b!1430527 (= e!807623 (Found!11323 (index!47686 lt!629629)))))

(declare-fun b!1430528 () Bool)

(assert (=> b!1430528 (= e!807625 e!807623)))

(assert (=> b!1430528 (= lt!629628 (select (arr!47017 a!2831) (index!47686 lt!629629)))))

(declare-fun c!132286 () Bool)

(assert (=> b!1430528 (= c!132286 (= lt!629628 (select (arr!47017 a!2831) j!81)))))

(declare-fun b!1430529 () Bool)

(assert (=> b!1430529 (= e!807624 (MissingZero!11323 (index!47686 lt!629629)))))

(assert (= (and d!153543 c!132284) b!1430525))

(assert (= (and d!153543 (not c!132284)) b!1430528))

(assert (= (and b!1430528 c!132286) b!1430527))

(assert (= (and b!1430528 (not c!132286)) b!1430524))

(assert (= (and b!1430524 c!132285) b!1430529))

(assert (= (and b!1430524 (not c!132285)) b!1430526))

(declare-fun m!1320003 () Bool)

(assert (=> d!153543 m!1320003))

(declare-fun m!1320005 () Bool)

(assert (=> d!153543 m!1320005))

(declare-fun m!1320007 () Bool)

(assert (=> d!153543 m!1320007))

(assert (=> d!153543 m!1319853))

(assert (=> d!153543 m!1319855))

(assert (=> d!153543 m!1319891))

(assert (=> d!153543 m!1319855))

(assert (=> d!153543 m!1319853))

(assert (=> d!153543 m!1319857))

(assert (=> b!1430526 m!1319853))

(declare-fun m!1320009 () Bool)

(assert (=> b!1430526 m!1320009))

(declare-fun m!1320011 () Bool)

(assert (=> b!1430528 m!1320011))

(assert (=> b!1430364 d!153543))

(declare-fun d!153555 () Bool)

(assert (=> d!153555 (= (validKeyInArray!0 (select (arr!47017 a!2831) j!81)) (and (not (= (select (arr!47017 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47017 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430355 d!153555))

(declare-fun b!1430558 () Bool)

(declare-fun e!807646 () Bool)

(declare-fun call!67409 () Bool)

(assert (=> b!1430558 (= e!807646 call!67409)))

(declare-fun d!153557 () Bool)

(declare-fun res!964963 () Bool)

(declare-fun e!807644 () Bool)

(assert (=> d!153557 (=> res!964963 e!807644)))

(assert (=> d!153557 (= res!964963 (bvsge #b00000000000000000000000000000000 (size!47569 a!2831)))))

(assert (=> d!153557 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33602) e!807644)))

(declare-fun b!1430559 () Bool)

(assert (=> b!1430559 (= e!807646 call!67409)))

(declare-fun b!1430560 () Bool)

(declare-fun e!807645 () Bool)

(assert (=> b!1430560 (= e!807644 e!807645)))

(declare-fun res!964964 () Bool)

(assert (=> b!1430560 (=> (not res!964964) (not e!807645))))

(declare-fun e!807647 () Bool)

(assert (=> b!1430560 (= res!964964 (not e!807647))))

(declare-fun res!964965 () Bool)

(assert (=> b!1430560 (=> (not res!964965) (not e!807647))))

(assert (=> b!1430560 (= res!964965 (validKeyInArray!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430561 () Bool)

(assert (=> b!1430561 (= e!807645 e!807646)))

(declare-fun c!132295 () Bool)

(assert (=> b!1430561 (= c!132295 (validKeyInArray!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430562 () Bool)

(declare-fun contains!9821 (List!33605 (_ BitVec 64)) Bool)

(assert (=> b!1430562 (= e!807647 (contains!9821 Nil!33602 (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67406 () Bool)

(assert (=> bm!67406 (= call!67409 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132295 (Cons!33601 (select (arr!47017 a!2831) #b00000000000000000000000000000000) Nil!33602) Nil!33602)))))

(assert (= (and d!153557 (not res!964963)) b!1430560))

(assert (= (and b!1430560 res!964965) b!1430562))

(assert (= (and b!1430560 res!964964) b!1430561))

(assert (= (and b!1430561 c!132295) b!1430558))

(assert (= (and b!1430561 (not c!132295)) b!1430559))

(assert (= (or b!1430558 b!1430559) bm!67406))

(declare-fun m!1320013 () Bool)

(assert (=> b!1430560 m!1320013))

(assert (=> b!1430560 m!1320013))

(declare-fun m!1320015 () Bool)

(assert (=> b!1430560 m!1320015))

(assert (=> b!1430561 m!1320013))

(assert (=> b!1430561 m!1320013))

(assert (=> b!1430561 m!1320015))

(assert (=> b!1430562 m!1320013))

(assert (=> b!1430562 m!1320013))

(declare-fun m!1320017 () Bool)

(assert (=> b!1430562 m!1320017))

(assert (=> bm!67406 m!1320013))

(declare-fun m!1320019 () Bool)

(assert (=> bm!67406 m!1320019))

(assert (=> b!1430354 d!153557))

(declare-fun d!153561 () Bool)

(declare-fun res!964985 () Bool)

(declare-fun e!807677 () Bool)

(assert (=> d!153561 (=> res!964985 e!807677)))

(assert (=> d!153561 (= res!964985 (bvsge j!81 (size!47569 a!2831)))))

(assert (=> d!153561 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807677)))

(declare-fun b!1430608 () Bool)

(declare-fun e!807678 () Bool)

(declare-fun e!807679 () Bool)

(assert (=> b!1430608 (= e!807678 e!807679)))

(declare-fun lt!629656 () (_ BitVec 64))

(assert (=> b!1430608 (= lt!629656 (select (arr!47017 a!2831) j!81))))

(declare-fun lt!629655 () Unit!48231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97413 (_ BitVec 64) (_ BitVec 32)) Unit!48231)

(assert (=> b!1430608 (= lt!629655 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629656 j!81))))

(declare-fun arrayContainsKey!0 (array!97413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1430608 (arrayContainsKey!0 a!2831 lt!629656 #b00000000000000000000000000000000)))

(declare-fun lt!629654 () Unit!48231)

(assert (=> b!1430608 (= lt!629654 lt!629655)))

(declare-fun res!964986 () Bool)

(assert (=> b!1430608 (= res!964986 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) (Found!11323 j!81)))))

(assert (=> b!1430608 (=> (not res!964986) (not e!807679))))

(declare-fun b!1430609 () Bool)

(declare-fun call!67414 () Bool)

(assert (=> b!1430609 (= e!807679 call!67414)))

(declare-fun b!1430610 () Bool)

(assert (=> b!1430610 (= e!807677 e!807678)))

(declare-fun c!132309 () Bool)

(assert (=> b!1430610 (= c!132309 (validKeyInArray!0 (select (arr!47017 a!2831) j!81)))))

(declare-fun b!1430611 () Bool)

(assert (=> b!1430611 (= e!807678 call!67414)))

(declare-fun bm!67411 () Bool)

(assert (=> bm!67411 (= call!67414 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153561 (not res!964985)) b!1430610))

(assert (= (and b!1430610 c!132309) b!1430608))

(assert (= (and b!1430610 (not c!132309)) b!1430611))

(assert (= (and b!1430608 res!964986) b!1430609))

(assert (= (or b!1430609 b!1430611) bm!67411))

(assert (=> b!1430608 m!1319853))

(declare-fun m!1320039 () Bool)

(assert (=> b!1430608 m!1320039))

(declare-fun m!1320041 () Bool)

(assert (=> b!1430608 m!1320041))

(assert (=> b!1430608 m!1319853))

(assert (=> b!1430608 m!1319879))

(assert (=> b!1430610 m!1319853))

(assert (=> b!1430610 m!1319853))

(assert (=> b!1430610 m!1319877))

(declare-fun m!1320043 () Bool)

(assert (=> bm!67411 m!1320043))

(assert (=> b!1430351 d!153561))

(declare-fun d!153577 () Bool)

(assert (=> d!153577 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629661 () Unit!48231)

(declare-fun choose!38 (array!97413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48231)

(assert (=> d!153577 (= lt!629661 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153577 (validMask!0 mask!2608)))

(assert (=> d!153577 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629661)))

(declare-fun bs!41641 () Bool)

(assert (= bs!41641 d!153577))

(assert (=> bs!41641 m!1319881))

(declare-fun m!1320061 () Bool)

(assert (=> bs!41641 m!1320061))

(assert (=> bs!41641 m!1319891))

(assert (=> b!1430351 d!153577))

(declare-fun b!1430626 () Bool)

(declare-fun lt!629663 () SeekEntryResult!11323)

(assert (=> b!1430626 (and (bvsge (index!47686 lt!629663) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629663) (size!47569 a!2831)))))

(declare-fun res!964995 () Bool)

(assert (=> b!1430626 (= res!964995 (= (select (arr!47017 a!2831) (index!47686 lt!629663)) (select (arr!47017 a!2831) j!81)))))

(declare-fun e!807690 () Bool)

(assert (=> b!1430626 (=> res!964995 e!807690)))

(declare-fun e!807692 () Bool)

(assert (=> b!1430626 (= e!807692 e!807690)))

(declare-fun b!1430627 () Bool)

(declare-fun e!807693 () SeekEntryResult!11323)

(assert (=> b!1430627 (= e!807693 (Intermediate!11323 true index!585 x!605))))

(declare-fun b!1430628 () Bool)

(assert (=> b!1430628 (and (bvsge (index!47686 lt!629663) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629663) (size!47569 a!2831)))))

(assert (=> b!1430628 (= e!807690 (= (select (arr!47017 a!2831) (index!47686 lt!629663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807689 () SeekEntryResult!11323)

(declare-fun b!1430629 () Bool)

(assert (=> b!1430629 (= e!807689 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430630 () Bool)

(assert (=> b!1430630 (= e!807689 (Intermediate!11323 false index!585 x!605))))

(declare-fun b!1430632 () Bool)

(declare-fun e!807691 () Bool)

(assert (=> b!1430632 (= e!807691 (bvsge (x!129312 lt!629663) #b01111111111111111111111111111110))))

(declare-fun b!1430633 () Bool)

(assert (=> b!1430633 (and (bvsge (index!47686 lt!629663) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629663) (size!47569 a!2831)))))

(declare-fun res!964996 () Bool)

(assert (=> b!1430633 (= res!964996 (= (select (arr!47017 a!2831) (index!47686 lt!629663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430633 (=> res!964996 e!807690)))

(declare-fun b!1430634 () Bool)

(assert (=> b!1430634 (= e!807691 e!807692)))

(declare-fun res!964994 () Bool)

(assert (=> b!1430634 (= res!964994 (and ((_ is Intermediate!11323) lt!629663) (not (undefined!12135 lt!629663)) (bvslt (x!129312 lt!629663) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629663) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629663) x!605)))))

(assert (=> b!1430634 (=> (not res!964994) (not e!807692))))

(declare-fun d!153583 () Bool)

(assert (=> d!153583 e!807691))

(declare-fun c!132314 () Bool)

(assert (=> d!153583 (= c!132314 (and ((_ is Intermediate!11323) lt!629663) (undefined!12135 lt!629663)))))

(assert (=> d!153583 (= lt!629663 e!807693)))

(declare-fun c!132316 () Bool)

(assert (=> d!153583 (= c!132316 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629662 () (_ BitVec 64))

(assert (=> d!153583 (= lt!629662 (select (arr!47017 a!2831) index!585))))

(assert (=> d!153583 (validMask!0 mask!2608)))

(assert (=> d!153583 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629663)))

(declare-fun b!1430631 () Bool)

(assert (=> b!1430631 (= e!807693 e!807689)))

(declare-fun c!132315 () Bool)

(assert (=> b!1430631 (= c!132315 (or (= lt!629662 (select (arr!47017 a!2831) j!81)) (= (bvadd lt!629662 lt!629662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153583 c!132316) b!1430627))

(assert (= (and d!153583 (not c!132316)) b!1430631))

(assert (= (and b!1430631 c!132315) b!1430630))

(assert (= (and b!1430631 (not c!132315)) b!1430629))

(assert (= (and d!153583 c!132314) b!1430632))

(assert (= (and d!153583 (not c!132314)) b!1430634))

(assert (= (and b!1430634 res!964994) b!1430626))

(assert (= (and b!1430626 (not res!964995)) b!1430633))

(assert (= (and b!1430633 (not res!964996)) b!1430628))

(assert (=> d!153583 m!1319859))

(assert (=> d!153583 m!1319891))

(declare-fun m!1320063 () Bool)

(assert (=> b!1430633 m!1320063))

(declare-fun m!1320065 () Bool)

(assert (=> b!1430629 m!1320065))

(assert (=> b!1430629 m!1320065))

(assert (=> b!1430629 m!1319853))

(declare-fun m!1320067 () Bool)

(assert (=> b!1430629 m!1320067))

(assert (=> b!1430628 m!1320063))

(assert (=> b!1430626 m!1320063))

(assert (=> b!1430356 d!153583))

(declare-fun b!1430643 () Bool)

(declare-fun lt!629675 () SeekEntryResult!11323)

(assert (=> b!1430643 (and (bvsge (index!47686 lt!629675) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629675) (size!47569 lt!629569)))))

(declare-fun res!965002 () Bool)

(assert (=> b!1430643 (= res!965002 (= (select (arr!47017 lt!629569) (index!47686 lt!629675)) lt!629568))))

(declare-fun e!807701 () Bool)

(assert (=> b!1430643 (=> res!965002 e!807701)))

(declare-fun e!807703 () Bool)

(assert (=> b!1430643 (= e!807703 e!807701)))

(declare-fun b!1430644 () Bool)

(declare-fun e!807704 () SeekEntryResult!11323)

(assert (=> b!1430644 (= e!807704 (Intermediate!11323 true index!585 x!605))))

(declare-fun b!1430645 () Bool)

(assert (=> b!1430645 (and (bvsge (index!47686 lt!629675) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629675) (size!47569 lt!629569)))))

(assert (=> b!1430645 (= e!807701 (= (select (arr!47017 lt!629569) (index!47686 lt!629675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430646 () Bool)

(declare-fun e!807700 () SeekEntryResult!11323)

(assert (=> b!1430646 (= e!807700 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629568 lt!629569 mask!2608))))

(declare-fun b!1430647 () Bool)

(assert (=> b!1430647 (= e!807700 (Intermediate!11323 false index!585 x!605))))

(declare-fun b!1430649 () Bool)

(declare-fun e!807702 () Bool)

(assert (=> b!1430649 (= e!807702 (bvsge (x!129312 lt!629675) #b01111111111111111111111111111110))))

(declare-fun b!1430650 () Bool)

(assert (=> b!1430650 (and (bvsge (index!47686 lt!629675) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629675) (size!47569 lt!629569)))))

(declare-fun res!965003 () Bool)

(assert (=> b!1430650 (= res!965003 (= (select (arr!47017 lt!629569) (index!47686 lt!629675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430650 (=> res!965003 e!807701)))

(declare-fun b!1430651 () Bool)

(assert (=> b!1430651 (= e!807702 e!807703)))

(declare-fun res!965001 () Bool)

(assert (=> b!1430651 (= res!965001 (and ((_ is Intermediate!11323) lt!629675) (not (undefined!12135 lt!629675)) (bvslt (x!129312 lt!629675) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629675) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629675) x!605)))))

(assert (=> b!1430651 (=> (not res!965001) (not e!807703))))

(declare-fun d!153585 () Bool)

(assert (=> d!153585 e!807702))

(declare-fun c!132319 () Bool)

(assert (=> d!153585 (= c!132319 (and ((_ is Intermediate!11323) lt!629675) (undefined!12135 lt!629675)))))

(assert (=> d!153585 (= lt!629675 e!807704)))

(declare-fun c!132321 () Bool)

(assert (=> d!153585 (= c!132321 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629674 () (_ BitVec 64))

(assert (=> d!153585 (= lt!629674 (select (arr!47017 lt!629569) index!585))))

(assert (=> d!153585 (validMask!0 mask!2608)))

(assert (=> d!153585 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629568 lt!629569 mask!2608) lt!629675)))

(declare-fun b!1430648 () Bool)

(assert (=> b!1430648 (= e!807704 e!807700)))

(declare-fun c!132320 () Bool)

(assert (=> b!1430648 (= c!132320 (or (= lt!629674 lt!629568) (= (bvadd lt!629674 lt!629674) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153585 c!132321) b!1430644))

(assert (= (and d!153585 (not c!132321)) b!1430648))

(assert (= (and b!1430648 c!132320) b!1430647))

(assert (= (and b!1430648 (not c!132320)) b!1430646))

(assert (= (and d!153585 c!132319) b!1430649))

(assert (= (and d!153585 (not c!132319)) b!1430651))

(assert (= (and b!1430651 res!965001) b!1430643))

(assert (= (and b!1430643 (not res!965002)) b!1430650))

(assert (= (and b!1430650 (not res!965003)) b!1430645))

(declare-fun m!1320069 () Bool)

(assert (=> d!153585 m!1320069))

(assert (=> d!153585 m!1319891))

(declare-fun m!1320071 () Bool)

(assert (=> b!1430650 m!1320071))

(assert (=> b!1430646 m!1320065))

(assert (=> b!1430646 m!1320065))

(declare-fun m!1320073 () Bool)

(assert (=> b!1430646 m!1320073))

(assert (=> b!1430645 m!1320071))

(assert (=> b!1430643 m!1320071))

(assert (=> b!1430361 d!153585))

(declare-fun d!153589 () Bool)

(declare-fun res!965004 () Bool)

(declare-fun e!807705 () Bool)

(assert (=> d!153589 (=> res!965004 e!807705)))

(assert (=> d!153589 (= res!965004 (bvsge #b00000000000000000000000000000000 (size!47569 a!2831)))))

(assert (=> d!153589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807705)))

(declare-fun b!1430652 () Bool)

(declare-fun e!807706 () Bool)

(declare-fun e!807707 () Bool)

(assert (=> b!1430652 (= e!807706 e!807707)))

(declare-fun lt!629680 () (_ BitVec 64))

(assert (=> b!1430652 (= lt!629680 (select (arr!47017 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629679 () Unit!48231)

(assert (=> b!1430652 (= lt!629679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629680 #b00000000000000000000000000000000))))

(assert (=> b!1430652 (arrayContainsKey!0 a!2831 lt!629680 #b00000000000000000000000000000000)))

(declare-fun lt!629678 () Unit!48231)

(assert (=> b!1430652 (= lt!629678 lt!629679)))

(declare-fun res!965005 () Bool)

(assert (=> b!1430652 (= res!965005 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11323 #b00000000000000000000000000000000)))))

(assert (=> b!1430652 (=> (not res!965005) (not e!807707))))

(declare-fun b!1430653 () Bool)

(declare-fun call!67418 () Bool)

(assert (=> b!1430653 (= e!807707 call!67418)))

(declare-fun b!1430654 () Bool)

(assert (=> b!1430654 (= e!807705 e!807706)))

(declare-fun c!132322 () Bool)

(assert (=> b!1430654 (= c!132322 (validKeyInArray!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430655 () Bool)

(assert (=> b!1430655 (= e!807706 call!67418)))

(declare-fun bm!67415 () Bool)

(assert (=> bm!67415 (= call!67418 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153589 (not res!965004)) b!1430654))

(assert (= (and b!1430654 c!132322) b!1430652))

(assert (= (and b!1430654 (not c!132322)) b!1430655))

(assert (= (and b!1430652 res!965005) b!1430653))

(assert (= (or b!1430653 b!1430655) bm!67415))

(assert (=> b!1430652 m!1320013))

(declare-fun m!1320075 () Bool)

(assert (=> b!1430652 m!1320075))

(declare-fun m!1320077 () Bool)

(assert (=> b!1430652 m!1320077))

(assert (=> b!1430652 m!1320013))

(declare-fun m!1320079 () Bool)

(assert (=> b!1430652 m!1320079))

(assert (=> b!1430654 m!1320013))

(assert (=> b!1430654 m!1320013))

(assert (=> b!1430654 m!1320015))

(declare-fun m!1320081 () Bool)

(assert (=> bm!67415 m!1320081))

(assert (=> b!1430363 d!153589))

(declare-fun d!153591 () Bool)

(assert (=> d!153591 (= (validKeyInArray!0 (select (arr!47017 a!2831) i!982)) (and (not (= (select (arr!47017 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47017 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430352 d!153591))

(declare-fun b!1430656 () Bool)

(declare-fun lt!629682 () SeekEntryResult!11323)

(assert (=> b!1430656 (and (bvsge (index!47686 lt!629682) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629682) (size!47569 a!2831)))))

(declare-fun res!965007 () Bool)

(assert (=> b!1430656 (= res!965007 (= (select (arr!47017 a!2831) (index!47686 lt!629682)) (select (arr!47017 a!2831) j!81)))))

(declare-fun e!807709 () Bool)

(assert (=> b!1430656 (=> res!965007 e!807709)))

(declare-fun e!807711 () Bool)

(assert (=> b!1430656 (= e!807711 e!807709)))

(declare-fun b!1430657 () Bool)

(declare-fun e!807712 () SeekEntryResult!11323)

(assert (=> b!1430657 (= e!807712 (Intermediate!11323 true (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430658 () Bool)

(assert (=> b!1430658 (and (bvsge (index!47686 lt!629682) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629682) (size!47569 a!2831)))))

(assert (=> b!1430658 (= e!807709 (= (select (arr!47017 a!2831) (index!47686 lt!629682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807708 () SeekEntryResult!11323)

(declare-fun b!1430659 () Bool)

(assert (=> b!1430659 (= e!807708 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430660 () Bool)

(assert (=> b!1430660 (= e!807708 (Intermediate!11323 false (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430662 () Bool)

(declare-fun e!807710 () Bool)

(assert (=> b!1430662 (= e!807710 (bvsge (x!129312 lt!629682) #b01111111111111111111111111111110))))

(declare-fun b!1430663 () Bool)

(assert (=> b!1430663 (and (bvsge (index!47686 lt!629682) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629682) (size!47569 a!2831)))))

(declare-fun res!965008 () Bool)

(assert (=> b!1430663 (= res!965008 (= (select (arr!47017 a!2831) (index!47686 lt!629682)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430663 (=> res!965008 e!807709)))

(declare-fun b!1430664 () Bool)

(assert (=> b!1430664 (= e!807710 e!807711)))

(declare-fun res!965006 () Bool)

(assert (=> b!1430664 (= res!965006 (and ((_ is Intermediate!11323) lt!629682) (not (undefined!12135 lt!629682)) (bvslt (x!129312 lt!629682) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629682) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629682) #b00000000000000000000000000000000)))))

(assert (=> b!1430664 (=> (not res!965006) (not e!807711))))

(declare-fun d!153593 () Bool)

(assert (=> d!153593 e!807710))

(declare-fun c!132323 () Bool)

(assert (=> d!153593 (= c!132323 (and ((_ is Intermediate!11323) lt!629682) (undefined!12135 lt!629682)))))

(assert (=> d!153593 (= lt!629682 e!807712)))

(declare-fun c!132325 () Bool)

(assert (=> d!153593 (= c!132325 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629681 () (_ BitVec 64))

(assert (=> d!153593 (= lt!629681 (select (arr!47017 a!2831) (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608)))))

(assert (=> d!153593 (validMask!0 mask!2608)))

(assert (=> d!153593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629682)))

(declare-fun b!1430661 () Bool)

(assert (=> b!1430661 (= e!807712 e!807708)))

(declare-fun c!132324 () Bool)

(assert (=> b!1430661 (= c!132324 (or (= lt!629681 (select (arr!47017 a!2831) j!81)) (= (bvadd lt!629681 lt!629681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153593 c!132325) b!1430657))

(assert (= (and d!153593 (not c!132325)) b!1430661))

(assert (= (and b!1430661 c!132324) b!1430660))

(assert (= (and b!1430661 (not c!132324)) b!1430659))

(assert (= (and d!153593 c!132323) b!1430662))

(assert (= (and d!153593 (not c!132323)) b!1430664))

(assert (= (and b!1430664 res!965006) b!1430656))

(assert (= (and b!1430656 (not res!965007)) b!1430663))

(assert (= (and b!1430663 (not res!965008)) b!1430658))

(assert (=> d!153593 m!1319855))

(declare-fun m!1320083 () Bool)

(assert (=> d!153593 m!1320083))

(assert (=> d!153593 m!1319891))

(declare-fun m!1320085 () Bool)

(assert (=> b!1430663 m!1320085))

(assert (=> b!1430659 m!1319855))

(declare-fun m!1320087 () Bool)

(assert (=> b!1430659 m!1320087))

(assert (=> b!1430659 m!1320087))

(assert (=> b!1430659 m!1319853))

(declare-fun m!1320093 () Bool)

(assert (=> b!1430659 m!1320093))

(assert (=> b!1430658 m!1320085))

(assert (=> b!1430656 m!1320085))

(assert (=> b!1430357 d!153593))

(declare-fun d!153595 () Bool)

(declare-fun lt!629687 () (_ BitVec 32))

(declare-fun lt!629686 () (_ BitVec 32))

(assert (=> d!153595 (= lt!629687 (bvmul (bvxor lt!629686 (bvlshr lt!629686 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153595 (= lt!629686 ((_ extract 31 0) (bvand (bvxor (select (arr!47017 a!2831) j!81) (bvlshr (select (arr!47017 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153595 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964937 (let ((h!34921 ((_ extract 31 0) (bvand (bvxor (select (arr!47017 a!2831) j!81) (bvlshr (select (arr!47017 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129316 (bvmul (bvxor h!34921 (bvlshr h!34921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129316 (bvlshr x!129316 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964937 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964937 #b00000000000000000000000000000000))))))

(assert (=> d!153595 (= (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) (bvand (bvxor lt!629687 (bvlshr lt!629687 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430357 d!153595))

(declare-fun d!153599 () Bool)

(assert (=> d!153599 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123350 d!153599))

(declare-fun d!153605 () Bool)

(assert (=> d!153605 (= (array_inv!36250 a!2831) (bvsge (size!47569 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123350 d!153605))

(check-sat (not b!1430646) (not d!153583) (not bm!67411) (not b!1430562) (not d!153543) (not b!1430608) (not b!1430629) (not b!1430659) (not bm!67406) (not d!153593) (not d!153577) (not bm!67415) (not b!1430526) (not b!1430610) (not b!1430561) (not b!1430560) (not d!153585) (not b!1430652) (not d!153537) (not b!1430654) (not b!1430470))
(check-sat)
(get-model)

(declare-fun d!153627 () Bool)

(assert (=> d!153627 (= (validKeyInArray!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000)) (and (not (= (select (arr!47017 a!2831) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47017 a!2831) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430654 d!153627))

(declare-fun b!1430758 () Bool)

(declare-fun lt!629734 () SeekEntryResult!11323)

(assert (=> b!1430758 (and (bvsge (index!47686 lt!629734) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629734) (size!47569 lt!629569)))))

(declare-fun res!965037 () Bool)

(assert (=> b!1430758 (= res!965037 (= (select (arr!47017 lt!629569) (index!47686 lt!629734)) lt!629568))))

(declare-fun e!807772 () Bool)

(assert (=> b!1430758 (=> res!965037 e!807772)))

(declare-fun e!807774 () Bool)

(assert (=> b!1430758 (= e!807774 e!807772)))

(declare-fun b!1430759 () Bool)

(declare-fun e!807775 () SeekEntryResult!11323)

(assert (=> b!1430759 (= e!807775 (Intermediate!11323 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430760 () Bool)

(assert (=> b!1430760 (and (bvsge (index!47686 lt!629734) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629734) (size!47569 lt!629569)))))

(assert (=> b!1430760 (= e!807772 (= (select (arr!47017 lt!629569) (index!47686 lt!629734)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807771 () SeekEntryResult!11323)

(declare-fun b!1430761 () Bool)

(assert (=> b!1430761 (= e!807771 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!629568 lt!629569 mask!2608))))

(declare-fun b!1430762 () Bool)

(assert (=> b!1430762 (= e!807771 (Intermediate!11323 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430764 () Bool)

(declare-fun e!807773 () Bool)

(assert (=> b!1430764 (= e!807773 (bvsge (x!129312 lt!629734) #b01111111111111111111111111111110))))

(declare-fun b!1430765 () Bool)

(assert (=> b!1430765 (and (bvsge (index!47686 lt!629734) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629734) (size!47569 lt!629569)))))

(declare-fun res!965038 () Bool)

(assert (=> b!1430765 (= res!965038 (= (select (arr!47017 lt!629569) (index!47686 lt!629734)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430765 (=> res!965038 e!807772)))

(declare-fun b!1430766 () Bool)

(assert (=> b!1430766 (= e!807773 e!807774)))

(declare-fun res!965036 () Bool)

(assert (=> b!1430766 (= res!965036 (and ((_ is Intermediate!11323) lt!629734) (not (undefined!12135 lt!629734)) (bvslt (x!129312 lt!629734) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629734) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629734) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1430766 (=> (not res!965036) (not e!807774))))

(declare-fun d!153629 () Bool)

(assert (=> d!153629 e!807773))

(declare-fun c!132359 () Bool)

(assert (=> d!153629 (= c!132359 (and ((_ is Intermediate!11323) lt!629734) (undefined!12135 lt!629734)))))

(assert (=> d!153629 (= lt!629734 e!807775)))

(declare-fun c!132361 () Bool)

(assert (=> d!153629 (= c!132361 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629733 () (_ BitVec 64))

(assert (=> d!153629 (= lt!629733 (select (arr!47017 lt!629569) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153629 (validMask!0 mask!2608)))

(assert (=> d!153629 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629568 lt!629569 mask!2608) lt!629734)))

(declare-fun b!1430763 () Bool)

(assert (=> b!1430763 (= e!807775 e!807771)))

(declare-fun c!132360 () Bool)

(assert (=> b!1430763 (= c!132360 (or (= lt!629733 lt!629568) (= (bvadd lt!629733 lt!629733) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153629 c!132361) b!1430759))

(assert (= (and d!153629 (not c!132361)) b!1430763))

(assert (= (and b!1430763 c!132360) b!1430762))

(assert (= (and b!1430763 (not c!132360)) b!1430761))

(assert (= (and d!153629 c!132359) b!1430764))

(assert (= (and d!153629 (not c!132359)) b!1430766))

(assert (= (and b!1430766 res!965036) b!1430758))

(assert (= (and b!1430758 (not res!965037)) b!1430765))

(assert (= (and b!1430765 (not res!965038)) b!1430760))

(assert (=> d!153629 m!1320065))

(declare-fun m!1320165 () Bool)

(assert (=> d!153629 m!1320165))

(assert (=> d!153629 m!1319891))

(declare-fun m!1320167 () Bool)

(assert (=> b!1430765 m!1320167))

(assert (=> b!1430761 m!1320065))

(declare-fun m!1320169 () Bool)

(assert (=> b!1430761 m!1320169))

(assert (=> b!1430761 m!1320169))

(declare-fun m!1320171 () Bool)

(assert (=> b!1430761 m!1320171))

(assert (=> b!1430760 m!1320167))

(assert (=> b!1430758 m!1320167))

(assert (=> b!1430646 d!153629))

(declare-fun d!153631 () Bool)

(declare-fun lt!629737 () (_ BitVec 32))

(assert (=> d!153631 (and (bvsge lt!629737 #b00000000000000000000000000000000) (bvslt lt!629737 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!153631 (= lt!629737 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!153631 (validMask!0 mask!2608)))

(assert (=> d!153631 (= (nextIndex!0 index!585 x!605 mask!2608) lt!629737)))

(declare-fun bs!41644 () Bool)

(assert (= bs!41644 d!153631))

(declare-fun m!1320173 () Bool)

(assert (=> bs!41644 m!1320173))

(assert (=> bs!41644 m!1319891))

(assert (=> b!1430646 d!153631))

(assert (=> b!1430561 d!153627))

(assert (=> b!1430560 d!153627))

(declare-fun d!153633 () Bool)

(declare-fun lt!629740 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!767 (List!33605) (InoxSet (_ BitVec 64)))

(assert (=> d!153633 (= lt!629740 (select (content!767 Nil!33602) (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun e!807781 () Bool)

(assert (=> d!153633 (= lt!629740 e!807781)))

(declare-fun res!965044 () Bool)

(assert (=> d!153633 (=> (not res!965044) (not e!807781))))

(assert (=> d!153633 (= res!965044 ((_ is Cons!33601) Nil!33602))))

(assert (=> d!153633 (= (contains!9821 Nil!33602 (select (arr!47017 a!2831) #b00000000000000000000000000000000)) lt!629740)))

(declare-fun b!1430771 () Bool)

(declare-fun e!807780 () Bool)

(assert (=> b!1430771 (= e!807781 e!807780)))

(declare-fun res!965043 () Bool)

(assert (=> b!1430771 (=> res!965043 e!807780)))

(assert (=> b!1430771 (= res!965043 (= (h!34918 Nil!33602) (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430772 () Bool)

(assert (=> b!1430772 (= e!807780 (contains!9821 (t!48291 Nil!33602) (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153633 res!965044) b!1430771))

(assert (= (and b!1430771 (not res!965043)) b!1430772))

(declare-fun m!1320175 () Bool)

(assert (=> d!153633 m!1320175))

(assert (=> d!153633 m!1320013))

(declare-fun m!1320177 () Bool)

(assert (=> d!153633 m!1320177))

(assert (=> b!1430772 m!1320013))

(declare-fun m!1320179 () Bool)

(assert (=> b!1430772 m!1320179))

(assert (=> b!1430562 d!153633))

(declare-fun d!153635 () Bool)

(declare-fun res!965045 () Bool)

(declare-fun e!807782 () Bool)

(assert (=> d!153635 (=> res!965045 e!807782)))

(assert (=> d!153635 (= res!965045 (bvsge (bvadd j!81 #b00000000000000000000000000000001) (size!47569 a!2831)))))

(assert (=> d!153635 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608) e!807782)))

(declare-fun b!1430773 () Bool)

(declare-fun e!807783 () Bool)

(declare-fun e!807784 () Bool)

(assert (=> b!1430773 (= e!807783 e!807784)))

(declare-fun lt!629743 () (_ BitVec 64))

(assert (=> b!1430773 (= lt!629743 (select (arr!47017 a!2831) (bvadd j!81 #b00000000000000000000000000000001)))))

(declare-fun lt!629742 () Unit!48231)

(assert (=> b!1430773 (= lt!629742 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629743 (bvadd j!81 #b00000000000000000000000000000001)))))

(assert (=> b!1430773 (arrayContainsKey!0 a!2831 lt!629743 #b00000000000000000000000000000000)))

(declare-fun lt!629741 () Unit!48231)

(assert (=> b!1430773 (= lt!629741 lt!629742)))

(declare-fun res!965046 () Bool)

(assert (=> b!1430773 (= res!965046 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) (bvadd j!81 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11323 (bvadd j!81 #b00000000000000000000000000000001))))))

(assert (=> b!1430773 (=> (not res!965046) (not e!807784))))

(declare-fun b!1430774 () Bool)

(declare-fun call!67428 () Bool)

(assert (=> b!1430774 (= e!807784 call!67428)))

(declare-fun b!1430775 () Bool)

(assert (=> b!1430775 (= e!807782 e!807783)))

(declare-fun c!132362 () Bool)

(assert (=> b!1430775 (= c!132362 (validKeyInArray!0 (select (arr!47017 a!2831) (bvadd j!81 #b00000000000000000000000000000001))))))

(declare-fun b!1430776 () Bool)

(assert (=> b!1430776 (= e!807783 call!67428)))

(declare-fun bm!67425 () Bool)

(assert (=> bm!67425 (= call!67428 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153635 (not res!965045)) b!1430775))

(assert (= (and b!1430775 c!132362) b!1430773))

(assert (= (and b!1430775 (not c!132362)) b!1430776))

(assert (= (and b!1430773 res!965046) b!1430774))

(assert (= (or b!1430774 b!1430776) bm!67425))

(declare-fun m!1320181 () Bool)

(assert (=> b!1430773 m!1320181))

(declare-fun m!1320183 () Bool)

(assert (=> b!1430773 m!1320183))

(declare-fun m!1320185 () Bool)

(assert (=> b!1430773 m!1320185))

(assert (=> b!1430773 m!1320181))

(declare-fun m!1320187 () Bool)

(assert (=> b!1430773 m!1320187))

(assert (=> b!1430775 m!1320181))

(assert (=> b!1430775 m!1320181))

(declare-fun m!1320189 () Bool)

(assert (=> b!1430775 m!1320189))

(declare-fun m!1320191 () Bool)

(assert (=> bm!67425 m!1320191))

(assert (=> bm!67411 d!153635))

(declare-fun b!1430777 () Bool)

(declare-fun lt!629745 () SeekEntryResult!11323)

(assert (=> b!1430777 (and (bvsge (index!47686 lt!629745) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629745) (size!47569 a!2831)))))

(declare-fun res!965048 () Bool)

(assert (=> b!1430777 (= res!965048 (= (select (arr!47017 a!2831) (index!47686 lt!629745)) (select (arr!47017 a!2831) j!81)))))

(declare-fun e!807786 () Bool)

(assert (=> b!1430777 (=> res!965048 e!807786)))

(declare-fun e!807788 () Bool)

(assert (=> b!1430777 (= e!807788 e!807786)))

(declare-fun e!807789 () SeekEntryResult!11323)

(declare-fun b!1430778 () Bool)

(assert (=> b!1430778 (= e!807789 (Intermediate!11323 true (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430779 () Bool)

(assert (=> b!1430779 (and (bvsge (index!47686 lt!629745) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629745) (size!47569 a!2831)))))

(assert (=> b!1430779 (= e!807786 (= (select (arr!47017 a!2831) (index!47686 lt!629745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430780 () Bool)

(declare-fun e!807785 () SeekEntryResult!11323)

(assert (=> b!1430780 (= e!807785 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430781 () Bool)

(assert (=> b!1430781 (= e!807785 (Intermediate!11323 false (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430783 () Bool)

(declare-fun e!807787 () Bool)

(assert (=> b!1430783 (= e!807787 (bvsge (x!129312 lt!629745) #b01111111111111111111111111111110))))

(declare-fun b!1430784 () Bool)

(assert (=> b!1430784 (and (bvsge (index!47686 lt!629745) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629745) (size!47569 a!2831)))))

(declare-fun res!965049 () Bool)

(assert (=> b!1430784 (= res!965049 (= (select (arr!47017 a!2831) (index!47686 lt!629745)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430784 (=> res!965049 e!807786)))

(declare-fun b!1430785 () Bool)

(assert (=> b!1430785 (= e!807787 e!807788)))

(declare-fun res!965047 () Bool)

(assert (=> b!1430785 (= res!965047 (and ((_ is Intermediate!11323) lt!629745) (not (undefined!12135 lt!629745)) (bvslt (x!129312 lt!629745) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629745) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629745) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430785 (=> (not res!965047) (not e!807788))))

(declare-fun d!153637 () Bool)

(assert (=> d!153637 e!807787))

(declare-fun c!132363 () Bool)

(assert (=> d!153637 (= c!132363 (and ((_ is Intermediate!11323) lt!629745) (undefined!12135 lt!629745)))))

(assert (=> d!153637 (= lt!629745 e!807789)))

(declare-fun c!132365 () Bool)

(assert (=> d!153637 (= c!132365 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629744 () (_ BitVec 64))

(assert (=> d!153637 (= lt!629744 (select (arr!47017 a!2831) (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153637 (validMask!0 mask!2608)))

(assert (=> d!153637 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629745)))

(declare-fun b!1430782 () Bool)

(assert (=> b!1430782 (= e!807789 e!807785)))

(declare-fun c!132364 () Bool)

(assert (=> b!1430782 (= c!132364 (or (= lt!629744 (select (arr!47017 a!2831) j!81)) (= (bvadd lt!629744 lt!629744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153637 c!132365) b!1430778))

(assert (= (and d!153637 (not c!132365)) b!1430782))

(assert (= (and b!1430782 c!132364) b!1430781))

(assert (= (and b!1430782 (not c!132364)) b!1430780))

(assert (= (and d!153637 c!132363) b!1430783))

(assert (= (and d!153637 (not c!132363)) b!1430785))

(assert (= (and b!1430785 res!965047) b!1430777))

(assert (= (and b!1430777 (not res!965048)) b!1430784))

(assert (= (and b!1430784 (not res!965049)) b!1430779))

(assert (=> d!153637 m!1320087))

(declare-fun m!1320193 () Bool)

(assert (=> d!153637 m!1320193))

(assert (=> d!153637 m!1319891))

(declare-fun m!1320195 () Bool)

(assert (=> b!1430784 m!1320195))

(assert (=> b!1430780 m!1320087))

(declare-fun m!1320197 () Bool)

(assert (=> b!1430780 m!1320197))

(assert (=> b!1430780 m!1320197))

(assert (=> b!1430780 m!1319853))

(declare-fun m!1320199 () Bool)

(assert (=> b!1430780 m!1320199))

(assert (=> b!1430779 m!1320195))

(assert (=> b!1430777 m!1320195))

(assert (=> b!1430659 d!153637))

(declare-fun d!153639 () Bool)

(declare-fun lt!629746 () (_ BitVec 32))

(assert (=> d!153639 (and (bvsge lt!629746 #b00000000000000000000000000000000) (bvslt lt!629746 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153639 (= lt!629746 (choose!52 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153639 (validMask!0 mask!2608)))

(assert (=> d!153639 (= (nextIndex!0 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629746)))

(declare-fun bs!41645 () Bool)

(assert (= bs!41645 d!153639))

(assert (=> bs!41645 m!1319855))

(declare-fun m!1320201 () Bool)

(assert (=> bs!41645 m!1320201))

(assert (=> bs!41645 m!1319891))

(assert (=> b!1430659 d!153639))

(declare-fun d!153641 () Bool)

(declare-fun res!965050 () Bool)

(declare-fun e!807790 () Bool)

(assert (=> d!153641 (=> res!965050 e!807790)))

(assert (=> d!153641 (= res!965050 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47569 a!2831)))))

(assert (=> d!153641 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608) e!807790)))

(declare-fun b!1430786 () Bool)

(declare-fun e!807791 () Bool)

(declare-fun e!807792 () Bool)

(assert (=> b!1430786 (= e!807791 e!807792)))

(declare-fun lt!629749 () (_ BitVec 64))

(assert (=> b!1430786 (= lt!629749 (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!629748 () Unit!48231)

(assert (=> b!1430786 (= lt!629748 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629749 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1430786 (arrayContainsKey!0 a!2831 lt!629749 #b00000000000000000000000000000000)))

(declare-fun lt!629747 () Unit!48231)

(assert (=> b!1430786 (= lt!629747 lt!629748)))

(declare-fun res!965051 () Bool)

(assert (=> b!1430786 (= res!965051 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11323 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430786 (=> (not res!965051) (not e!807792))))

(declare-fun b!1430787 () Bool)

(declare-fun call!67429 () Bool)

(assert (=> b!1430787 (= e!807792 call!67429)))

(declare-fun b!1430788 () Bool)

(assert (=> b!1430788 (= e!807790 e!807791)))

(declare-fun c!132366 () Bool)

(assert (=> b!1430788 (= c!132366 (validKeyInArray!0 (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430789 () Bool)

(assert (=> b!1430789 (= e!807791 call!67429)))

(declare-fun bm!67426 () Bool)

(assert (=> bm!67426 (= call!67429 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153641 (not res!965050)) b!1430788))

(assert (= (and b!1430788 c!132366) b!1430786))

(assert (= (and b!1430788 (not c!132366)) b!1430789))

(assert (= (and b!1430786 res!965051) b!1430787))

(assert (= (or b!1430787 b!1430789) bm!67426))

(declare-fun m!1320203 () Bool)

(assert (=> b!1430786 m!1320203))

(declare-fun m!1320205 () Bool)

(assert (=> b!1430786 m!1320205))

(declare-fun m!1320207 () Bool)

(assert (=> b!1430786 m!1320207))

(assert (=> b!1430786 m!1320203))

(declare-fun m!1320209 () Bool)

(assert (=> b!1430786 m!1320209))

(assert (=> b!1430788 m!1320203))

(assert (=> b!1430788 m!1320203))

(declare-fun m!1320211 () Bool)

(assert (=> b!1430788 m!1320211))

(declare-fun m!1320213 () Bool)

(assert (=> bm!67426 m!1320213))

(assert (=> bm!67415 d!153641))

(declare-fun b!1430790 () Bool)

(declare-fun e!807795 () Bool)

(declare-fun call!67430 () Bool)

(assert (=> b!1430790 (= e!807795 call!67430)))

(declare-fun d!153643 () Bool)

(declare-fun res!965052 () Bool)

(declare-fun e!807793 () Bool)

(assert (=> d!153643 (=> res!965052 e!807793)))

(assert (=> d!153643 (= res!965052 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47569 a!2831)))))

(assert (=> d!153643 (= (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132295 (Cons!33601 (select (arr!47017 a!2831) #b00000000000000000000000000000000) Nil!33602) Nil!33602)) e!807793)))

(declare-fun b!1430791 () Bool)

(assert (=> b!1430791 (= e!807795 call!67430)))

(declare-fun b!1430792 () Bool)

(declare-fun e!807794 () Bool)

(assert (=> b!1430792 (= e!807793 e!807794)))

(declare-fun res!965053 () Bool)

(assert (=> b!1430792 (=> (not res!965053) (not e!807794))))

(declare-fun e!807796 () Bool)

(assert (=> b!1430792 (= res!965053 (not e!807796))))

(declare-fun res!965054 () Bool)

(assert (=> b!1430792 (=> (not res!965054) (not e!807796))))

(assert (=> b!1430792 (= res!965054 (validKeyInArray!0 (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430793 () Bool)

(assert (=> b!1430793 (= e!807794 e!807795)))

(declare-fun c!132367 () Bool)

(assert (=> b!1430793 (= c!132367 (validKeyInArray!0 (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430794 () Bool)

(assert (=> b!1430794 (= e!807796 (contains!9821 (ite c!132295 (Cons!33601 (select (arr!47017 a!2831) #b00000000000000000000000000000000) Nil!33602) Nil!33602) (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!67427 () Bool)

(assert (=> bm!67427 (= call!67430 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!132367 (Cons!33601 (select (arr!47017 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!132295 (Cons!33601 (select (arr!47017 a!2831) #b00000000000000000000000000000000) Nil!33602) Nil!33602)) (ite c!132295 (Cons!33601 (select (arr!47017 a!2831) #b00000000000000000000000000000000) Nil!33602) Nil!33602))))))

(assert (= (and d!153643 (not res!965052)) b!1430792))

(assert (= (and b!1430792 res!965054) b!1430794))

(assert (= (and b!1430792 res!965053) b!1430793))

(assert (= (and b!1430793 c!132367) b!1430790))

(assert (= (and b!1430793 (not c!132367)) b!1430791))

(assert (= (or b!1430790 b!1430791) bm!67427))

(assert (=> b!1430792 m!1320203))

(assert (=> b!1430792 m!1320203))

(assert (=> b!1430792 m!1320211))

(assert (=> b!1430793 m!1320203))

(assert (=> b!1430793 m!1320203))

(assert (=> b!1430793 m!1320211))

(assert (=> b!1430794 m!1320203))

(assert (=> b!1430794 m!1320203))

(declare-fun m!1320215 () Bool)

(assert (=> b!1430794 m!1320215))

(assert (=> bm!67427 m!1320203))

(declare-fun m!1320217 () Bool)

(assert (=> bm!67427 m!1320217))

(assert (=> bm!67406 d!153643))

(assert (=> d!153577 d!153561))

(declare-fun d!153645 () Bool)

(assert (=> d!153645 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(assert (=> d!153645 true))

(declare-fun _$72!143 () Unit!48231)

(assert (=> d!153645 (= (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) _$72!143)))

(declare-fun bs!41646 () Bool)

(assert (= bs!41646 d!153645))

(assert (=> bs!41646 m!1319881))

(assert (=> d!153577 d!153645))

(assert (=> d!153577 d!153599))

(assert (=> d!153585 d!153599))

(assert (=> d!153593 d!153599))

(declare-fun b!1430795 () Bool)

(declare-fun lt!629751 () SeekEntryResult!11323)

(assert (=> b!1430795 (and (bvsge (index!47686 lt!629751) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629751) (size!47569 a!2831)))))

(declare-fun res!965056 () Bool)

(assert (=> b!1430795 (= res!965056 (= (select (arr!47017 a!2831) (index!47686 lt!629751)) (select (arr!47017 a!2831) j!81)))))

(declare-fun e!807798 () Bool)

(assert (=> b!1430795 (=> res!965056 e!807798)))

(declare-fun e!807800 () Bool)

(assert (=> b!1430795 (= e!807800 e!807798)))

(declare-fun b!1430796 () Bool)

(declare-fun e!807801 () SeekEntryResult!11323)

(assert (=> b!1430796 (= e!807801 (Intermediate!11323 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430797 () Bool)

(assert (=> b!1430797 (and (bvsge (index!47686 lt!629751) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629751) (size!47569 a!2831)))))

(assert (=> b!1430797 (= e!807798 (= (select (arr!47017 a!2831) (index!47686 lt!629751)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430798 () Bool)

(declare-fun e!807797 () SeekEntryResult!11323)

(assert (=> b!1430798 (= e!807797 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430799 () Bool)

(assert (=> b!1430799 (= e!807797 (Intermediate!11323 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430801 () Bool)

(declare-fun e!807799 () Bool)

(assert (=> b!1430801 (= e!807799 (bvsge (x!129312 lt!629751) #b01111111111111111111111111111110))))

(declare-fun b!1430802 () Bool)

(assert (=> b!1430802 (and (bvsge (index!47686 lt!629751) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629751) (size!47569 a!2831)))))

(declare-fun res!965057 () Bool)

(assert (=> b!1430802 (= res!965057 (= (select (arr!47017 a!2831) (index!47686 lt!629751)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430802 (=> res!965057 e!807798)))

(declare-fun b!1430803 () Bool)

(assert (=> b!1430803 (= e!807799 e!807800)))

(declare-fun res!965055 () Bool)

(assert (=> b!1430803 (= res!965055 (and ((_ is Intermediate!11323) lt!629751) (not (undefined!12135 lt!629751)) (bvslt (x!129312 lt!629751) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629751) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629751) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1430803 (=> (not res!965055) (not e!807800))))

(declare-fun d!153647 () Bool)

(assert (=> d!153647 e!807799))

(declare-fun c!132368 () Bool)

(assert (=> d!153647 (= c!132368 (and ((_ is Intermediate!11323) lt!629751) (undefined!12135 lt!629751)))))

(assert (=> d!153647 (= lt!629751 e!807801)))

(declare-fun c!132370 () Bool)

(assert (=> d!153647 (= c!132370 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629750 () (_ BitVec 64))

(assert (=> d!153647 (= lt!629750 (select (arr!47017 a!2831) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153647 (validMask!0 mask!2608)))

(assert (=> d!153647 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629751)))

(declare-fun b!1430800 () Bool)

(assert (=> b!1430800 (= e!807801 e!807797)))

(declare-fun c!132369 () Bool)

(assert (=> b!1430800 (= c!132369 (or (= lt!629750 (select (arr!47017 a!2831) j!81)) (= (bvadd lt!629750 lt!629750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153647 c!132370) b!1430796))

(assert (= (and d!153647 (not c!132370)) b!1430800))

(assert (= (and b!1430800 c!132369) b!1430799))

(assert (= (and b!1430800 (not c!132369)) b!1430798))

(assert (= (and d!153647 c!132368) b!1430801))

(assert (= (and d!153647 (not c!132368)) b!1430803))

(assert (= (and b!1430803 res!965055) b!1430795))

(assert (= (and b!1430795 (not res!965056)) b!1430802))

(assert (= (and b!1430802 (not res!965057)) b!1430797))

(assert (=> d!153647 m!1320065))

(declare-fun m!1320219 () Bool)

(assert (=> d!153647 m!1320219))

(assert (=> d!153647 m!1319891))

(declare-fun m!1320221 () Bool)

(assert (=> b!1430802 m!1320221))

(assert (=> b!1430798 m!1320065))

(assert (=> b!1430798 m!1320169))

(assert (=> b!1430798 m!1320169))

(assert (=> b!1430798 m!1319853))

(declare-fun m!1320223 () Bool)

(assert (=> b!1430798 m!1320223))

(assert (=> b!1430797 m!1320221))

(assert (=> b!1430795 m!1320221))

(assert (=> b!1430629 d!153647))

(assert (=> b!1430629 d!153631))

(assert (=> d!153537 d!153599))

(declare-fun b!1430816 () Bool)

(declare-fun e!807808 () SeekEntryResult!11323)

(declare-fun e!807810 () SeekEntryResult!11323)

(assert (=> b!1430816 (= e!807808 e!807810)))

(declare-fun lt!629756 () (_ BitVec 64))

(declare-fun c!132378 () Bool)

(assert (=> b!1430816 (= c!132378 (= lt!629756 (select (arr!47017 a!2831) j!81)))))

(declare-fun b!1430817 () Bool)

(assert (=> b!1430817 (= e!807810 (Found!11323 (index!47686 lt!629629)))))

(declare-fun b!1430818 () Bool)

(declare-fun e!807809 () SeekEntryResult!11323)

(assert (=> b!1430818 (= e!807809 (seekKeyOrZeroReturnVacant!0 (bvadd (x!129312 lt!629629) #b00000000000000000000000000000001) (nextIndex!0 (index!47686 lt!629629) (x!129312 lt!629629) mask!2608) (index!47686 lt!629629) (select (arr!47017 a!2831) j!81) a!2831 mask!2608))))

(declare-fun lt!629757 () SeekEntryResult!11323)

(declare-fun d!153649 () Bool)

(assert (=> d!153649 (and (or ((_ is Undefined!11323) lt!629757) (not ((_ is Found!11323) lt!629757)) (and (bvsge (index!47685 lt!629757) #b00000000000000000000000000000000) (bvslt (index!47685 lt!629757) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629757) ((_ is Found!11323) lt!629757) (not ((_ is MissingVacant!11323) lt!629757)) (not (= (index!47687 lt!629757) (index!47686 lt!629629))) (and (bvsge (index!47687 lt!629757) #b00000000000000000000000000000000) (bvslt (index!47687 lt!629757) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629757) (ite ((_ is Found!11323) lt!629757) (= (select (arr!47017 a!2831) (index!47685 lt!629757)) (select (arr!47017 a!2831) j!81)) (and ((_ is MissingVacant!11323) lt!629757) (= (index!47687 lt!629757) (index!47686 lt!629629)) (= (select (arr!47017 a!2831) (index!47687 lt!629757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!153649 (= lt!629757 e!807808)))

(declare-fun c!132379 () Bool)

(assert (=> d!153649 (= c!132379 (bvsge (x!129312 lt!629629) #b01111111111111111111111111111110))))

(assert (=> d!153649 (= lt!629756 (select (arr!47017 a!2831) (index!47686 lt!629629)))))

(assert (=> d!153649 (validMask!0 mask!2608)))

(assert (=> d!153649 (= (seekKeyOrZeroReturnVacant!0 (x!129312 lt!629629) (index!47686 lt!629629) (index!47686 lt!629629) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629757)))

(declare-fun b!1430819 () Bool)

(assert (=> b!1430819 (= e!807809 (MissingVacant!11323 (index!47686 lt!629629)))))

(declare-fun b!1430820 () Bool)

(declare-fun c!132377 () Bool)

(assert (=> b!1430820 (= c!132377 (= lt!629756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430820 (= e!807810 e!807809)))

(declare-fun b!1430821 () Bool)

(assert (=> b!1430821 (= e!807808 Undefined!11323)))

(assert (= (and d!153649 c!132379) b!1430821))

(assert (= (and d!153649 (not c!132379)) b!1430816))

(assert (= (and b!1430816 c!132378) b!1430817))

(assert (= (and b!1430816 (not c!132378)) b!1430820))

(assert (= (and b!1430820 c!132377) b!1430819))

(assert (= (and b!1430820 (not c!132377)) b!1430818))

(declare-fun m!1320225 () Bool)

(assert (=> b!1430818 m!1320225))

(assert (=> b!1430818 m!1320225))

(assert (=> b!1430818 m!1319853))

(declare-fun m!1320227 () Bool)

(assert (=> b!1430818 m!1320227))

(declare-fun m!1320229 () Bool)

(assert (=> d!153649 m!1320229))

(declare-fun m!1320231 () Bool)

(assert (=> d!153649 m!1320231))

(assert (=> d!153649 m!1320011))

(assert (=> d!153649 m!1319891))

(assert (=> b!1430526 d!153649))

(assert (=> d!153583 d!153599))

(declare-fun d!153651 () Bool)

(assert (=> d!153651 (arrayContainsKey!0 a!2831 lt!629656 #b00000000000000000000000000000000)))

(declare-fun lt!629760 () Unit!48231)

(declare-fun choose!13 (array!97413 (_ BitVec 64) (_ BitVec 32)) Unit!48231)

(assert (=> d!153651 (= lt!629760 (choose!13 a!2831 lt!629656 j!81))))

(assert (=> d!153651 (bvsge j!81 #b00000000000000000000000000000000)))

(assert (=> d!153651 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629656 j!81) lt!629760)))

(declare-fun bs!41647 () Bool)

(assert (= bs!41647 d!153651))

(assert (=> bs!41647 m!1320041))

(declare-fun m!1320233 () Bool)

(assert (=> bs!41647 m!1320233))

(assert (=> b!1430608 d!153651))

(declare-fun d!153653 () Bool)

(declare-fun res!965062 () Bool)

(declare-fun e!807815 () Bool)

(assert (=> d!153653 (=> res!965062 e!807815)))

(assert (=> d!153653 (= res!965062 (= (select (arr!47017 a!2831) #b00000000000000000000000000000000) lt!629656))))

(assert (=> d!153653 (= (arrayContainsKey!0 a!2831 lt!629656 #b00000000000000000000000000000000) e!807815)))

(declare-fun b!1430826 () Bool)

(declare-fun e!807816 () Bool)

(assert (=> b!1430826 (= e!807815 e!807816)))

(declare-fun res!965063 () Bool)

(assert (=> b!1430826 (=> (not res!965063) (not e!807816))))

(assert (=> b!1430826 (= res!965063 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47569 a!2831)))))

(declare-fun b!1430827 () Bool)

(assert (=> b!1430827 (= e!807816 (arrayContainsKey!0 a!2831 lt!629656 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153653 (not res!965062)) b!1430826))

(assert (= (and b!1430826 res!965063) b!1430827))

(assert (=> d!153653 m!1320013))

(declare-fun m!1320235 () Bool)

(assert (=> b!1430827 m!1320235))

(assert (=> b!1430608 d!153653))

(assert (=> b!1430608 d!153543))

(assert (=> b!1430610 d!153555))

(declare-fun b!1430828 () Bool)

(declare-fun lt!629762 () SeekEntryResult!11323)

(assert (=> b!1430828 (and (bvsge (index!47686 lt!629762) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629762) (size!47569 lt!629569)))))

(declare-fun res!965065 () Bool)

(assert (=> b!1430828 (= res!965065 (= (select (arr!47017 lt!629569) (index!47686 lt!629762)) lt!629568))))

(declare-fun e!807818 () Bool)

(assert (=> b!1430828 (=> res!965065 e!807818)))

(declare-fun e!807820 () Bool)

(assert (=> b!1430828 (= e!807820 e!807818)))

(declare-fun b!1430829 () Bool)

(declare-fun e!807821 () SeekEntryResult!11323)

(assert (=> b!1430829 (= e!807821 (Intermediate!11323 true (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430830 () Bool)

(assert (=> b!1430830 (and (bvsge (index!47686 lt!629762) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629762) (size!47569 lt!629569)))))

(assert (=> b!1430830 (= e!807818 (= (select (arr!47017 lt!629569) (index!47686 lt!629762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430831 () Bool)

(declare-fun e!807817 () SeekEntryResult!11323)

(assert (=> b!1430831 (= e!807817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!629568 lt!629569 mask!2608))))

(declare-fun b!1430832 () Bool)

(assert (=> b!1430832 (= e!807817 (Intermediate!11323 false (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1430834 () Bool)

(declare-fun e!807819 () Bool)

(assert (=> b!1430834 (= e!807819 (bvsge (x!129312 lt!629762) #b01111111111111111111111111111110))))

(declare-fun b!1430835 () Bool)

(assert (=> b!1430835 (and (bvsge (index!47686 lt!629762) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629762) (size!47569 lt!629569)))))

(declare-fun res!965066 () Bool)

(assert (=> b!1430835 (= res!965066 (= (select (arr!47017 lt!629569) (index!47686 lt!629762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430835 (=> res!965066 e!807818)))

(declare-fun b!1430836 () Bool)

(assert (=> b!1430836 (= e!807819 e!807820)))

(declare-fun res!965064 () Bool)

(assert (=> b!1430836 (= res!965064 (and ((_ is Intermediate!11323) lt!629762) (not (undefined!12135 lt!629762)) (bvslt (x!129312 lt!629762) #b01111111111111111111111111111110) (bvsge (x!129312 lt!629762) #b00000000000000000000000000000000) (bvsge (x!129312 lt!629762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430836 (=> (not res!965064) (not e!807820))))

(declare-fun d!153655 () Bool)

(assert (=> d!153655 e!807819))

(declare-fun c!132380 () Bool)

(assert (=> d!153655 (= c!132380 (and ((_ is Intermediate!11323) lt!629762) (undefined!12135 lt!629762)))))

(assert (=> d!153655 (= lt!629762 e!807821)))

(declare-fun c!132382 () Bool)

(assert (=> d!153655 (= c!132382 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!629761 () (_ BitVec 64))

(assert (=> d!153655 (= lt!629761 (select (arr!47017 lt!629569) (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153655 (validMask!0 mask!2608)))

(assert (=> d!153655 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629568 lt!629569 mask!2608) lt!629762)))

(declare-fun b!1430833 () Bool)

(assert (=> b!1430833 (= e!807821 e!807817)))

(declare-fun c!132381 () Bool)

(assert (=> b!1430833 (= c!132381 (or (= lt!629761 lt!629568) (= (bvadd lt!629761 lt!629761) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153655 c!132382) b!1430829))

(assert (= (and d!153655 (not c!132382)) b!1430833))

(assert (= (and b!1430833 c!132381) b!1430832))

(assert (= (and b!1430833 (not c!132381)) b!1430831))

(assert (= (and d!153655 c!132380) b!1430834))

(assert (= (and d!153655 (not c!132380)) b!1430836))

(assert (= (and b!1430836 res!965064) b!1430828))

(assert (= (and b!1430828 (not res!965065)) b!1430835))

(assert (= (and b!1430835 (not res!965066)) b!1430830))

(assert (=> d!153655 m!1319983))

(declare-fun m!1320237 () Bool)

(assert (=> d!153655 m!1320237))

(assert (=> d!153655 m!1319891))

(declare-fun m!1320239 () Bool)

(assert (=> b!1430835 m!1320239))

(assert (=> b!1430831 m!1319983))

(declare-fun m!1320241 () Bool)

(assert (=> b!1430831 m!1320241))

(assert (=> b!1430831 m!1320241))

(declare-fun m!1320243 () Bool)

(assert (=> b!1430831 m!1320243))

(assert (=> b!1430830 m!1320239))

(assert (=> b!1430828 m!1320239))

(assert (=> b!1430470 d!153655))

(declare-fun d!153657 () Bool)

(declare-fun lt!629763 () (_ BitVec 32))

(assert (=> d!153657 (and (bvsge lt!629763 #b00000000000000000000000000000000) (bvslt lt!629763 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153657 (= lt!629763 (choose!52 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153657 (validMask!0 mask!2608)))

(assert (=> d!153657 (= (nextIndex!0 (toIndex!0 lt!629568 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629763)))

(declare-fun bs!41648 () Bool)

(assert (= bs!41648 d!153657))

(assert (=> bs!41648 m!1319865))

(declare-fun m!1320245 () Bool)

(assert (=> bs!41648 m!1320245))

(assert (=> bs!41648 m!1319891))

(assert (=> b!1430470 d!153657))

(assert (=> d!153543 d!153593))

(assert (=> d!153543 d!153595))

(assert (=> d!153543 d!153599))

(declare-fun d!153659 () Bool)

(assert (=> d!153659 (arrayContainsKey!0 a!2831 lt!629680 #b00000000000000000000000000000000)))

(declare-fun lt!629764 () Unit!48231)

(assert (=> d!153659 (= lt!629764 (choose!13 a!2831 lt!629680 #b00000000000000000000000000000000))))

(assert (=> d!153659 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!153659 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629680 #b00000000000000000000000000000000) lt!629764)))

(declare-fun bs!41649 () Bool)

(assert (= bs!41649 d!153659))

(assert (=> bs!41649 m!1320077))

(declare-fun m!1320247 () Bool)

(assert (=> bs!41649 m!1320247))

(assert (=> b!1430652 d!153659))

(declare-fun d!153661 () Bool)

(declare-fun res!965067 () Bool)

(declare-fun e!807822 () Bool)

(assert (=> d!153661 (=> res!965067 e!807822)))

(assert (=> d!153661 (= res!965067 (= (select (arr!47017 a!2831) #b00000000000000000000000000000000) lt!629680))))

(assert (=> d!153661 (= (arrayContainsKey!0 a!2831 lt!629680 #b00000000000000000000000000000000) e!807822)))

(declare-fun b!1430837 () Bool)

(declare-fun e!807823 () Bool)

(assert (=> b!1430837 (= e!807822 e!807823)))

(declare-fun res!965068 () Bool)

(assert (=> b!1430837 (=> (not res!965068) (not e!807823))))

(assert (=> b!1430837 (= res!965068 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47569 a!2831)))))

(declare-fun b!1430838 () Bool)

(assert (=> b!1430838 (= e!807823 (arrayContainsKey!0 a!2831 lt!629680 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153661 (not res!965067)) b!1430837))

(assert (= (and b!1430837 res!965068) b!1430838))

(assert (=> d!153661 m!1320013))

(declare-fun m!1320249 () Bool)

(assert (=> b!1430838 m!1320249))

(assert (=> b!1430652 d!153661))

(declare-fun b!1430839 () Bool)

(declare-fun c!132384 () Bool)

(declare-fun lt!629766 () (_ BitVec 64))

(assert (=> b!1430839 (= c!132384 (= lt!629766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807824 () SeekEntryResult!11323)

(declare-fun e!807825 () SeekEntryResult!11323)

(assert (=> b!1430839 (= e!807824 e!807825)))

(declare-fun b!1430840 () Bool)

(declare-fun e!807826 () SeekEntryResult!11323)

(assert (=> b!1430840 (= e!807826 Undefined!11323)))

(declare-fun d!153663 () Bool)

(declare-fun lt!629765 () SeekEntryResult!11323)

(assert (=> d!153663 (and (or ((_ is Undefined!11323) lt!629765) (not ((_ is Found!11323) lt!629765)) (and (bvsge (index!47685 lt!629765) #b00000000000000000000000000000000) (bvslt (index!47685 lt!629765) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629765) ((_ is Found!11323) lt!629765) (not ((_ is MissingZero!11323) lt!629765)) (and (bvsge (index!47684 lt!629765) #b00000000000000000000000000000000) (bvslt (index!47684 lt!629765) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629765) ((_ is Found!11323) lt!629765) ((_ is MissingZero!11323) lt!629765) (not ((_ is MissingVacant!11323) lt!629765)) (and (bvsge (index!47687 lt!629765) #b00000000000000000000000000000000) (bvslt (index!47687 lt!629765) (size!47569 a!2831)))) (or ((_ is Undefined!11323) lt!629765) (ite ((_ is Found!11323) lt!629765) (= (select (arr!47017 a!2831) (index!47685 lt!629765)) (select (arr!47017 a!2831) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!11323) lt!629765) (= (select (arr!47017 a!2831) (index!47684 lt!629765)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11323) lt!629765) (= (select (arr!47017 a!2831) (index!47687 lt!629765)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153663 (= lt!629765 e!807826)))

(declare-fun c!132383 () Bool)

(declare-fun lt!629767 () SeekEntryResult!11323)

(assert (=> d!153663 (= c!132383 (and ((_ is Intermediate!11323) lt!629767) (undefined!12135 lt!629767)))))

(assert (=> d!153663 (= lt!629767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000) mask!2608) (select (arr!47017 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(assert (=> d!153663 (validMask!0 mask!2608)))

(assert (=> d!153663 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) lt!629765)))

(declare-fun b!1430841 () Bool)

(assert (=> b!1430841 (= e!807825 (seekKeyOrZeroReturnVacant!0 (x!129312 lt!629767) (index!47686 lt!629767) (index!47686 lt!629767) (select (arr!47017 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(declare-fun b!1430842 () Bool)

(assert (=> b!1430842 (= e!807824 (Found!11323 (index!47686 lt!629767)))))

(declare-fun b!1430843 () Bool)

(assert (=> b!1430843 (= e!807826 e!807824)))

(assert (=> b!1430843 (= lt!629766 (select (arr!47017 a!2831) (index!47686 lt!629767)))))

(declare-fun c!132385 () Bool)

(assert (=> b!1430843 (= c!132385 (= lt!629766 (select (arr!47017 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430844 () Bool)

(assert (=> b!1430844 (= e!807825 (MissingZero!11323 (index!47686 lt!629767)))))

(assert (= (and d!153663 c!132383) b!1430840))

(assert (= (and d!153663 (not c!132383)) b!1430843))

(assert (= (and b!1430843 c!132385) b!1430842))

(assert (= (and b!1430843 (not c!132385)) b!1430839))

(assert (= (and b!1430839 c!132384) b!1430844))

(assert (= (and b!1430839 (not c!132384)) b!1430841))

(declare-fun m!1320251 () Bool)

(assert (=> d!153663 m!1320251))

(declare-fun m!1320253 () Bool)

(assert (=> d!153663 m!1320253))

(declare-fun m!1320255 () Bool)

(assert (=> d!153663 m!1320255))

(assert (=> d!153663 m!1320013))

(declare-fun m!1320257 () Bool)

(assert (=> d!153663 m!1320257))

(assert (=> d!153663 m!1319891))

(assert (=> d!153663 m!1320257))

(assert (=> d!153663 m!1320013))

(declare-fun m!1320259 () Bool)

(assert (=> d!153663 m!1320259))

(assert (=> b!1430841 m!1320013))

(declare-fun m!1320261 () Bool)

(assert (=> b!1430841 m!1320261))

(declare-fun m!1320263 () Bool)

(assert (=> b!1430843 m!1320263))

(assert (=> b!1430652 d!153663))

(check-sat (not d!153655) (not d!153659) (not b!1430780) (not bm!67426) (not b!1430793) (not d!153631) (not bm!67427) (not bm!67425) (not b!1430792) (not d!153629) (not b!1430788) (not b!1430798) (not d!153639) (not b!1430841) (not b!1430827) (not d!153645) (not b!1430773) (not d!153647) (not b!1430786) (not d!153651) (not b!1430772) (not d!153649) (not d!153657) (not b!1430838) (not b!1430818) (not d!153663) (not b!1430761) (not b!1430775) (not b!1430831) (not b!1430794) (not d!153633) (not d!153637))
(check-sat)
