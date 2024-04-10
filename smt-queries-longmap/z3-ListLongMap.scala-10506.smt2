; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123734 () Bool)

(assert start!123734)

(declare-fun b!1434370 () Bool)

(declare-fun e!809546 () Bool)

(declare-fun e!809548 () Bool)

(assert (=> b!1434370 (= e!809546 (not e!809548))))

(declare-fun res!967833 () Bool)

(assert (=> b!1434370 (=> res!967833 e!809548)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97592 0))(
  ( (array!97593 (arr!47100 (Array (_ BitVec 32) (_ BitVec 64))) (size!47650 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97592)

(assert (=> b!1434370 (= res!967833 (or (= (select (arr!47100 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47100 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47100 a!2831) index!585) (select (arr!47100 a!2831) j!81)) (= (select (store (arr!47100 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809547 () Bool)

(assert (=> b!1434370 e!809547))

(declare-fun res!967835 () Bool)

(assert (=> b!1434370 (=> (not res!967835) (not e!809547))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97592 (_ BitVec 32)) Bool)

(assert (=> b!1434370 (= res!967835 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48504 0))(
  ( (Unit!48505) )
))
(declare-fun lt!631437 () Unit!48504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48504)

(assert (=> b!1434370 (= lt!631437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434371 () Bool)

(declare-fun res!967836 () Bool)

(declare-fun e!809545 () Bool)

(assert (=> b!1434371 (=> (not res!967836) (not e!809545))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1434371 (= res!967836 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47650 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47650 a!2831))))))

(declare-fun e!809544 () Bool)

(declare-fun b!1434372 () Bool)

(declare-datatypes ((SeekEntryResult!11379 0))(
  ( (MissingZero!11379 (index!47908 (_ BitVec 32))) (Found!11379 (index!47909 (_ BitVec 32))) (Intermediate!11379 (undefined!12191 Bool) (index!47910 (_ BitVec 32)) (x!129559 (_ BitVec 32))) (Undefined!11379) (MissingVacant!11379 (index!47911 (_ BitVec 32))) )
))
(declare-fun lt!631438 () SeekEntryResult!11379)

(declare-fun lt!631436 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97592 (_ BitVec 32)) SeekEntryResult!11379)

(assert (=> b!1434372 (= e!809544 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631436 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631438))))

(declare-fun b!1434373 () Bool)

(declare-fun res!967837 () Bool)

(assert (=> b!1434373 (=> (not res!967837) (not e!809545))))

(declare-datatypes ((List!33610 0))(
  ( (Nil!33607) (Cons!33606 (h!34935 (_ BitVec 64)) (t!48304 List!33610)) )
))
(declare-fun arrayNoDuplicates!0 (array!97592 (_ BitVec 32) List!33610) Bool)

(assert (=> b!1434373 (= res!967837 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33607))))

(declare-fun b!1434374 () Bool)

(assert (=> b!1434374 (= e!809548 e!809544)))

(declare-fun res!967838 () Bool)

(assert (=> b!1434374 (=> res!967838 e!809544)))

(assert (=> b!1434374 (= res!967838 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631436 #b00000000000000000000000000000000) (bvsge lt!631436 (size!47650 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434374 (= lt!631436 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!967845 () Bool)

(assert (=> start!123734 (=> (not res!967845) (not e!809545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123734 (= res!967845 (validMask!0 mask!2608))))

(assert (=> start!123734 e!809545))

(assert (=> start!123734 true))

(declare-fun array_inv!36128 (array!97592) Bool)

(assert (=> start!123734 (array_inv!36128 a!2831)))

(declare-fun b!1434375 () Bool)

(declare-fun e!809543 () Bool)

(assert (=> b!1434375 (= e!809545 e!809543)))

(declare-fun res!967844 () Bool)

(assert (=> b!1434375 (=> (not res!967844) (not e!809543))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434375 (= res!967844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631438))))

(assert (=> b!1434375 (= lt!631438 (Intermediate!11379 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434376 () Bool)

(declare-fun res!967843 () Bool)

(assert (=> b!1434376 (=> (not res!967843) (not e!809546))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1434376 (= res!967843 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434377 () Bool)

(declare-fun res!967840 () Bool)

(assert (=> b!1434377 (=> (not res!967840) (not e!809546))))

(assert (=> b!1434377 (= res!967840 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631438))))

(declare-fun b!1434378 () Bool)

(assert (=> b!1434378 (= e!809543 e!809546)))

(declare-fun res!967842 () Bool)

(assert (=> b!1434378 (=> (not res!967842) (not e!809546))))

(declare-fun lt!631439 () SeekEntryResult!11379)

(declare-fun lt!631435 () (_ BitVec 64))

(declare-fun lt!631440 () array!97592)

(assert (=> b!1434378 (= res!967842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631435 mask!2608) lt!631435 lt!631440 mask!2608) lt!631439))))

(assert (=> b!1434378 (= lt!631439 (Intermediate!11379 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434378 (= lt!631435 (select (store (arr!47100 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434378 (= lt!631440 (array!97593 (store (arr!47100 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47650 a!2831)))))

(declare-fun b!1434379 () Bool)

(declare-fun res!967832 () Bool)

(assert (=> b!1434379 (=> (not res!967832) (not e!809545))))

(assert (=> b!1434379 (= res!967832 (and (= (size!47650 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47650 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47650 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434380 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97592 (_ BitVec 32)) SeekEntryResult!11379)

(assert (=> b!1434380 (= e!809547 (= (seekEntryOrOpen!0 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) (Found!11379 j!81)))))

(declare-fun b!1434381 () Bool)

(declare-fun res!967846 () Bool)

(assert (=> b!1434381 (=> (not res!967846) (not e!809545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434381 (= res!967846 (validKeyInArray!0 (select (arr!47100 a!2831) j!81)))))

(declare-fun b!1434382 () Bool)

(declare-fun res!967834 () Bool)

(assert (=> b!1434382 (=> (not res!967834) (not e!809546))))

(assert (=> b!1434382 (= res!967834 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631435 lt!631440 mask!2608) lt!631439))))

(declare-fun b!1434383 () Bool)

(declare-fun res!967839 () Bool)

(assert (=> b!1434383 (=> (not res!967839) (not e!809545))))

(assert (=> b!1434383 (= res!967839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434384 () Bool)

(declare-fun res!967841 () Bool)

(assert (=> b!1434384 (=> (not res!967841) (not e!809545))))

(assert (=> b!1434384 (= res!967841 (validKeyInArray!0 (select (arr!47100 a!2831) i!982)))))

(assert (= (and start!123734 res!967845) b!1434379))

(assert (= (and b!1434379 res!967832) b!1434384))

(assert (= (and b!1434384 res!967841) b!1434381))

(assert (= (and b!1434381 res!967846) b!1434383))

(assert (= (and b!1434383 res!967839) b!1434373))

(assert (= (and b!1434373 res!967837) b!1434371))

(assert (= (and b!1434371 res!967836) b!1434375))

(assert (= (and b!1434375 res!967844) b!1434378))

(assert (= (and b!1434378 res!967842) b!1434377))

(assert (= (and b!1434377 res!967840) b!1434382))

(assert (= (and b!1434382 res!967834) b!1434376))

(assert (= (and b!1434376 res!967843) b!1434370))

(assert (= (and b!1434370 res!967835) b!1434380))

(assert (= (and b!1434370 (not res!967833)) b!1434374))

(assert (= (and b!1434374 (not res!967838)) b!1434372))

(declare-fun m!1323991 () Bool)

(assert (=> b!1434381 m!1323991))

(assert (=> b!1434381 m!1323991))

(declare-fun m!1323993 () Bool)

(assert (=> b!1434381 m!1323993))

(declare-fun m!1323995 () Bool)

(assert (=> b!1434383 m!1323995))

(declare-fun m!1323997 () Bool)

(assert (=> b!1434374 m!1323997))

(declare-fun m!1323999 () Bool)

(assert (=> b!1434378 m!1323999))

(assert (=> b!1434378 m!1323999))

(declare-fun m!1324001 () Bool)

(assert (=> b!1434378 m!1324001))

(declare-fun m!1324003 () Bool)

(assert (=> b!1434378 m!1324003))

(declare-fun m!1324005 () Bool)

(assert (=> b!1434378 m!1324005))

(assert (=> b!1434372 m!1323991))

(assert (=> b!1434372 m!1323991))

(declare-fun m!1324007 () Bool)

(assert (=> b!1434372 m!1324007))

(declare-fun m!1324009 () Bool)

(assert (=> b!1434373 m!1324009))

(declare-fun m!1324011 () Bool)

(assert (=> b!1434382 m!1324011))

(assert (=> b!1434370 m!1324003))

(declare-fun m!1324013 () Bool)

(assert (=> b!1434370 m!1324013))

(declare-fun m!1324015 () Bool)

(assert (=> b!1434370 m!1324015))

(declare-fun m!1324017 () Bool)

(assert (=> b!1434370 m!1324017))

(assert (=> b!1434370 m!1323991))

(declare-fun m!1324019 () Bool)

(assert (=> b!1434370 m!1324019))

(declare-fun m!1324021 () Bool)

(assert (=> start!123734 m!1324021))

(declare-fun m!1324023 () Bool)

(assert (=> start!123734 m!1324023))

(declare-fun m!1324025 () Bool)

(assert (=> b!1434384 m!1324025))

(assert (=> b!1434384 m!1324025))

(declare-fun m!1324027 () Bool)

(assert (=> b!1434384 m!1324027))

(assert (=> b!1434380 m!1323991))

(assert (=> b!1434380 m!1323991))

(declare-fun m!1324029 () Bool)

(assert (=> b!1434380 m!1324029))

(assert (=> b!1434375 m!1323991))

(assert (=> b!1434375 m!1323991))

(declare-fun m!1324031 () Bool)

(assert (=> b!1434375 m!1324031))

(assert (=> b!1434375 m!1324031))

(assert (=> b!1434375 m!1323991))

(declare-fun m!1324033 () Bool)

(assert (=> b!1434375 m!1324033))

(assert (=> b!1434377 m!1323991))

(assert (=> b!1434377 m!1323991))

(declare-fun m!1324035 () Bool)

(assert (=> b!1434377 m!1324035))

(check-sat (not b!1434370) (not b!1434373) (not b!1434380) (not b!1434377) (not b!1434378) (not b!1434382) (not b!1434383) (not b!1434381) (not b!1434372) (not b!1434374) (not b!1434384) (not start!123734) (not b!1434375))
(check-sat)
(get-model)

(declare-fun e!809582 () SeekEntryResult!11379)

(declare-fun b!1434448 () Bool)

(assert (=> b!1434448 (= e!809582 (Intermediate!11379 false (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434449 () Bool)

(assert (=> b!1434449 (= e!809582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47100 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434450 () Bool)

(declare-fun e!809584 () SeekEntryResult!11379)

(assert (=> b!1434450 (= e!809584 e!809582)))

(declare-fun c!132777 () Bool)

(declare-fun lt!631463 () (_ BitVec 64))

(assert (=> b!1434450 (= c!132777 (or (= lt!631463 (select (arr!47100 a!2831) j!81)) (= (bvadd lt!631463 lt!631463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434452 () Bool)

(declare-fun lt!631464 () SeekEntryResult!11379)

(assert (=> b!1434452 (and (bvsge (index!47910 lt!631464) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631464) (size!47650 a!2831)))))

(declare-fun e!809583 () Bool)

(assert (=> b!1434452 (= e!809583 (= (select (arr!47100 a!2831) (index!47910 lt!631464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434453 () Bool)

(assert (=> b!1434453 (= e!809584 (Intermediate!11379 true (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434454 () Bool)

(declare-fun e!809585 () Bool)

(declare-fun e!809581 () Bool)

(assert (=> b!1434454 (= e!809585 e!809581)))

(declare-fun res!967899 () Bool)

(get-info :version)

(assert (=> b!1434454 (= res!967899 (and ((_ is Intermediate!11379) lt!631464) (not (undefined!12191 lt!631464)) (bvslt (x!129559 lt!631464) #b01111111111111111111111111111110) (bvsge (x!129559 lt!631464) #b00000000000000000000000000000000) (bvsge (x!129559 lt!631464) #b00000000000000000000000000000000)))))

(assert (=> b!1434454 (=> (not res!967899) (not e!809581))))

(declare-fun b!1434455 () Bool)

(assert (=> b!1434455 (= e!809585 (bvsge (x!129559 lt!631464) #b01111111111111111111111111111110))))

(declare-fun b!1434456 () Bool)

(assert (=> b!1434456 (and (bvsge (index!47910 lt!631464) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631464) (size!47650 a!2831)))))

(declare-fun res!967898 () Bool)

(assert (=> b!1434456 (= res!967898 (= (select (arr!47100 a!2831) (index!47910 lt!631464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434456 (=> res!967898 e!809583)))

(declare-fun b!1434451 () Bool)

(assert (=> b!1434451 (and (bvsge (index!47910 lt!631464) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631464) (size!47650 a!2831)))))

(declare-fun res!967900 () Bool)

(assert (=> b!1434451 (= res!967900 (= (select (arr!47100 a!2831) (index!47910 lt!631464)) (select (arr!47100 a!2831) j!81)))))

(assert (=> b!1434451 (=> res!967900 e!809583)))

(assert (=> b!1434451 (= e!809581 e!809583)))

(declare-fun d!154189 () Bool)

(assert (=> d!154189 e!809585))

(declare-fun c!132776 () Bool)

(assert (=> d!154189 (= c!132776 (and ((_ is Intermediate!11379) lt!631464) (undefined!12191 lt!631464)))))

(assert (=> d!154189 (= lt!631464 e!809584)))

(declare-fun c!132775 () Bool)

(assert (=> d!154189 (= c!132775 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154189 (= lt!631463 (select (arr!47100 a!2831) (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608)))))

(assert (=> d!154189 (validMask!0 mask!2608)))

(assert (=> d!154189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631464)))

(assert (= (and d!154189 c!132775) b!1434453))

(assert (= (and d!154189 (not c!132775)) b!1434450))

(assert (= (and b!1434450 c!132777) b!1434448))

(assert (= (and b!1434450 (not c!132777)) b!1434449))

(assert (= (and d!154189 c!132776) b!1434455))

(assert (= (and d!154189 (not c!132776)) b!1434454))

(assert (= (and b!1434454 res!967899) b!1434451))

(assert (= (and b!1434451 (not res!967900)) b!1434456))

(assert (= (and b!1434456 (not res!967898)) b!1434452))

(declare-fun m!1324083 () Bool)

(assert (=> b!1434452 m!1324083))

(assert (=> b!1434449 m!1324031))

(declare-fun m!1324085 () Bool)

(assert (=> b!1434449 m!1324085))

(assert (=> b!1434449 m!1324085))

(assert (=> b!1434449 m!1323991))

(declare-fun m!1324087 () Bool)

(assert (=> b!1434449 m!1324087))

(assert (=> d!154189 m!1324031))

(declare-fun m!1324089 () Bool)

(assert (=> d!154189 m!1324089))

(assert (=> d!154189 m!1324021))

(assert (=> b!1434456 m!1324083))

(assert (=> b!1434451 m!1324083))

(assert (=> b!1434375 d!154189))

(declare-fun d!154191 () Bool)

(declare-fun lt!631470 () (_ BitVec 32))

(declare-fun lt!631469 () (_ BitVec 32))

(assert (=> d!154191 (= lt!631470 (bvmul (bvxor lt!631469 (bvlshr lt!631469 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154191 (= lt!631469 ((_ extract 31 0) (bvand (bvxor (select (arr!47100 a!2831) j!81) (bvlshr (select (arr!47100 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154191 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967901 (let ((h!34937 ((_ extract 31 0) (bvand (bvxor (select (arr!47100 a!2831) j!81) (bvlshr (select (arr!47100 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129562 (bvmul (bvxor h!34937 (bvlshr h!34937 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129562 (bvlshr x!129562 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967901 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967901 #b00000000000000000000000000000000))))))

(assert (=> d!154191 (= (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) (bvand (bvxor lt!631470 (bvlshr lt!631470 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434375 d!154191))

(declare-fun d!154193 () Bool)

(declare-fun lt!631473 () (_ BitVec 32))

(assert (=> d!154193 (and (bvsge lt!631473 #b00000000000000000000000000000000) (bvslt lt!631473 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154193 (= lt!631473 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154193 (validMask!0 mask!2608)))

(assert (=> d!154193 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631473)))

(declare-fun bs!41762 () Bool)

(assert (= bs!41762 d!154193))

(declare-fun m!1324091 () Bool)

(assert (=> bs!41762 m!1324091))

(assert (=> bs!41762 m!1324021))

(assert (=> b!1434374 d!154193))

(declare-fun d!154195 () Bool)

(assert (=> d!154195 (= (validKeyInArray!0 (select (arr!47100 a!2831) i!982)) (and (not (= (select (arr!47100 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47100 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434384 d!154195))

(declare-fun d!154197 () Bool)

(declare-fun res!967908 () Bool)

(declare-fun e!809595 () Bool)

(assert (=> d!154197 (=> res!967908 e!809595)))

(assert (=> d!154197 (= res!967908 (bvsge #b00000000000000000000000000000000 (size!47650 a!2831)))))

(assert (=> d!154197 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33607) e!809595)))

(declare-fun bm!67519 () Bool)

(declare-fun call!67522 () Bool)

(declare-fun c!132780 () Bool)

(assert (=> bm!67519 (= call!67522 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132780 (Cons!33606 (select (arr!47100 a!2831) #b00000000000000000000000000000000) Nil!33607) Nil!33607)))))

(declare-fun b!1434467 () Bool)

(declare-fun e!809597 () Bool)

(assert (=> b!1434467 (= e!809595 e!809597)))

(declare-fun res!967910 () Bool)

(assert (=> b!1434467 (=> (not res!967910) (not e!809597))))

(declare-fun e!809596 () Bool)

(assert (=> b!1434467 (= res!967910 (not e!809596))))

(declare-fun res!967909 () Bool)

(assert (=> b!1434467 (=> (not res!967909) (not e!809596))))

(assert (=> b!1434467 (= res!967909 (validKeyInArray!0 (select (arr!47100 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434468 () Bool)

(declare-fun contains!9872 (List!33610 (_ BitVec 64)) Bool)

(assert (=> b!1434468 (= e!809596 (contains!9872 Nil!33607 (select (arr!47100 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434469 () Bool)

(declare-fun e!809594 () Bool)

(assert (=> b!1434469 (= e!809594 call!67522)))

(declare-fun b!1434470 () Bool)

(assert (=> b!1434470 (= e!809594 call!67522)))

(declare-fun b!1434471 () Bool)

(assert (=> b!1434471 (= e!809597 e!809594)))

(assert (=> b!1434471 (= c!132780 (validKeyInArray!0 (select (arr!47100 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154197 (not res!967908)) b!1434467))

(assert (= (and b!1434467 res!967909) b!1434468))

(assert (= (and b!1434467 res!967910) b!1434471))

(assert (= (and b!1434471 c!132780) b!1434470))

(assert (= (and b!1434471 (not c!132780)) b!1434469))

(assert (= (or b!1434470 b!1434469) bm!67519))

(declare-fun m!1324093 () Bool)

(assert (=> bm!67519 m!1324093))

(declare-fun m!1324095 () Bool)

(assert (=> bm!67519 m!1324095))

(assert (=> b!1434467 m!1324093))

(assert (=> b!1434467 m!1324093))

(declare-fun m!1324097 () Bool)

(assert (=> b!1434467 m!1324097))

(assert (=> b!1434468 m!1324093))

(assert (=> b!1434468 m!1324093))

(declare-fun m!1324099 () Bool)

(assert (=> b!1434468 m!1324099))

(assert (=> b!1434471 m!1324093))

(assert (=> b!1434471 m!1324093))

(assert (=> b!1434471 m!1324097))

(assert (=> b!1434373 d!154197))

(declare-fun d!154199 () Bool)

(assert (=> d!154199 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123734 d!154199))

(declare-fun d!154201 () Bool)

(assert (=> d!154201 (= (array_inv!36128 a!2831) (bvsge (size!47650 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123734 d!154201))

(declare-fun b!1434488 () Bool)

(declare-fun e!809611 () Bool)

(declare-fun call!67527 () Bool)

(assert (=> b!1434488 (= e!809611 call!67527)))

(declare-fun bm!67524 () Bool)

(assert (=> bm!67524 (= call!67527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434490 () Bool)

(declare-fun e!809610 () Bool)

(assert (=> b!1434490 (= e!809610 e!809611)))

(declare-fun lt!631489 () (_ BitVec 64))

(assert (=> b!1434490 (= lt!631489 (select (arr!47100 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631491 () Unit!48504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97592 (_ BitVec 64) (_ BitVec 32)) Unit!48504)

(assert (=> b!1434490 (= lt!631491 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631489 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434490 (arrayContainsKey!0 a!2831 lt!631489 #b00000000000000000000000000000000)))

(declare-fun lt!631490 () Unit!48504)

(assert (=> b!1434490 (= lt!631490 lt!631491)))

(declare-fun res!967919 () Bool)

(assert (=> b!1434490 (= res!967919 (= (seekEntryOrOpen!0 (select (arr!47100 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11379 #b00000000000000000000000000000000)))))

(assert (=> b!1434490 (=> (not res!967919) (not e!809611))))

(declare-fun b!1434491 () Bool)

(assert (=> b!1434491 (= e!809610 call!67527)))

(declare-fun d!154203 () Bool)

(declare-fun res!967920 () Bool)

(declare-fun e!809612 () Bool)

(assert (=> d!154203 (=> res!967920 e!809612)))

(assert (=> d!154203 (= res!967920 (bvsge #b00000000000000000000000000000000 (size!47650 a!2831)))))

(assert (=> d!154203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809612)))

(declare-fun b!1434489 () Bool)

(assert (=> b!1434489 (= e!809612 e!809610)))

(declare-fun c!132785 () Bool)

(assert (=> b!1434489 (= c!132785 (validKeyInArray!0 (select (arr!47100 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154203 (not res!967920)) b!1434489))

(assert (= (and b!1434489 c!132785) b!1434490))

(assert (= (and b!1434489 (not c!132785)) b!1434491))

(assert (= (and b!1434490 res!967919) b!1434488))

(assert (= (or b!1434488 b!1434491) bm!67524))

(declare-fun m!1324103 () Bool)

(assert (=> bm!67524 m!1324103))

(assert (=> b!1434490 m!1324093))

(declare-fun m!1324105 () Bool)

(assert (=> b!1434490 m!1324105))

(declare-fun m!1324107 () Bool)

(assert (=> b!1434490 m!1324107))

(assert (=> b!1434490 m!1324093))

(declare-fun m!1324109 () Bool)

(assert (=> b!1434490 m!1324109))

(assert (=> b!1434489 m!1324093))

(assert (=> b!1434489 m!1324093))

(assert (=> b!1434489 m!1324097))

(assert (=> b!1434383 d!154203))

(declare-fun b!1434492 () Bool)

(declare-fun e!809614 () SeekEntryResult!11379)

(assert (=> b!1434492 (= e!809614 (Intermediate!11379 false lt!631436 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434493 () Bool)

(assert (=> b!1434493 (= e!809614 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631436 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47100 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434494 () Bool)

(declare-fun e!809616 () SeekEntryResult!11379)

(assert (=> b!1434494 (= e!809616 e!809614)))

(declare-fun lt!631492 () (_ BitVec 64))

(declare-fun c!132788 () Bool)

(assert (=> b!1434494 (= c!132788 (or (= lt!631492 (select (arr!47100 a!2831) j!81)) (= (bvadd lt!631492 lt!631492) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434496 () Bool)

(declare-fun lt!631493 () SeekEntryResult!11379)

(assert (=> b!1434496 (and (bvsge (index!47910 lt!631493) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631493) (size!47650 a!2831)))))

(declare-fun e!809615 () Bool)

(assert (=> b!1434496 (= e!809615 (= (select (arr!47100 a!2831) (index!47910 lt!631493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434497 () Bool)

(assert (=> b!1434497 (= e!809616 (Intermediate!11379 true lt!631436 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434498 () Bool)

(declare-fun e!809617 () Bool)

(declare-fun e!809613 () Bool)

(assert (=> b!1434498 (= e!809617 e!809613)))

(declare-fun res!967922 () Bool)

(assert (=> b!1434498 (= res!967922 (and ((_ is Intermediate!11379) lt!631493) (not (undefined!12191 lt!631493)) (bvslt (x!129559 lt!631493) #b01111111111111111111111111111110) (bvsge (x!129559 lt!631493) #b00000000000000000000000000000000) (bvsge (x!129559 lt!631493) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1434498 (=> (not res!967922) (not e!809613))))

(declare-fun b!1434499 () Bool)

(assert (=> b!1434499 (= e!809617 (bvsge (x!129559 lt!631493) #b01111111111111111111111111111110))))

(declare-fun b!1434500 () Bool)

(assert (=> b!1434500 (and (bvsge (index!47910 lt!631493) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631493) (size!47650 a!2831)))))

(declare-fun res!967921 () Bool)

(assert (=> b!1434500 (= res!967921 (= (select (arr!47100 a!2831) (index!47910 lt!631493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434500 (=> res!967921 e!809615)))

(declare-fun b!1434495 () Bool)

(assert (=> b!1434495 (and (bvsge (index!47910 lt!631493) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631493) (size!47650 a!2831)))))

(declare-fun res!967923 () Bool)

(assert (=> b!1434495 (= res!967923 (= (select (arr!47100 a!2831) (index!47910 lt!631493)) (select (arr!47100 a!2831) j!81)))))

(assert (=> b!1434495 (=> res!967923 e!809615)))

(assert (=> b!1434495 (= e!809613 e!809615)))

(declare-fun d!154215 () Bool)

(assert (=> d!154215 e!809617))

(declare-fun c!132787 () Bool)

(assert (=> d!154215 (= c!132787 (and ((_ is Intermediate!11379) lt!631493) (undefined!12191 lt!631493)))))

(assert (=> d!154215 (= lt!631493 e!809616)))

(declare-fun c!132786 () Bool)

(assert (=> d!154215 (= c!132786 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154215 (= lt!631492 (select (arr!47100 a!2831) lt!631436))))

(assert (=> d!154215 (validMask!0 mask!2608)))

(assert (=> d!154215 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631436 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631493)))

(assert (= (and d!154215 c!132786) b!1434497))

(assert (= (and d!154215 (not c!132786)) b!1434494))

(assert (= (and b!1434494 c!132788) b!1434492))

(assert (= (and b!1434494 (not c!132788)) b!1434493))

(assert (= (and d!154215 c!132787) b!1434499))

(assert (= (and d!154215 (not c!132787)) b!1434498))

(assert (= (and b!1434498 res!967922) b!1434495))

(assert (= (and b!1434495 (not res!967923)) b!1434500))

(assert (= (and b!1434500 (not res!967921)) b!1434496))

(declare-fun m!1324111 () Bool)

(assert (=> b!1434496 m!1324111))

(declare-fun m!1324115 () Bool)

(assert (=> b!1434493 m!1324115))

(assert (=> b!1434493 m!1324115))

(assert (=> b!1434493 m!1323991))

(declare-fun m!1324119 () Bool)

(assert (=> b!1434493 m!1324119))

(declare-fun m!1324123 () Bool)

(assert (=> d!154215 m!1324123))

(assert (=> d!154215 m!1324021))

(assert (=> b!1434500 m!1324111))

(assert (=> b!1434495 m!1324111))

(assert (=> b!1434372 d!154215))

(declare-fun b!1434505 () Bool)

(declare-fun e!809622 () SeekEntryResult!11379)

(assert (=> b!1434505 (= e!809622 (Intermediate!11379 false index!585 x!605))))

(declare-fun b!1434506 () Bool)

(assert (=> b!1434506 (= e!809622 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631435 lt!631440 mask!2608))))

(declare-fun b!1434507 () Bool)

(declare-fun e!809624 () SeekEntryResult!11379)

(assert (=> b!1434507 (= e!809624 e!809622)))

(declare-fun c!132792 () Bool)

(declare-fun lt!631497 () (_ BitVec 64))

(assert (=> b!1434507 (= c!132792 (or (= lt!631497 lt!631435) (= (bvadd lt!631497 lt!631497) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434509 () Bool)

(declare-fun lt!631498 () SeekEntryResult!11379)

(assert (=> b!1434509 (and (bvsge (index!47910 lt!631498) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631498) (size!47650 lt!631440)))))

(declare-fun e!809623 () Bool)

(assert (=> b!1434509 (= e!809623 (= (select (arr!47100 lt!631440) (index!47910 lt!631498)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434510 () Bool)

(assert (=> b!1434510 (= e!809624 (Intermediate!11379 true index!585 x!605))))

(declare-fun b!1434511 () Bool)

(declare-fun e!809625 () Bool)

(declare-fun e!809621 () Bool)

(assert (=> b!1434511 (= e!809625 e!809621)))

(declare-fun res!967927 () Bool)

(assert (=> b!1434511 (= res!967927 (and ((_ is Intermediate!11379) lt!631498) (not (undefined!12191 lt!631498)) (bvslt (x!129559 lt!631498) #b01111111111111111111111111111110) (bvsge (x!129559 lt!631498) #b00000000000000000000000000000000) (bvsge (x!129559 lt!631498) x!605)))))

(assert (=> b!1434511 (=> (not res!967927) (not e!809621))))

(declare-fun b!1434512 () Bool)

(assert (=> b!1434512 (= e!809625 (bvsge (x!129559 lt!631498) #b01111111111111111111111111111110))))

(declare-fun b!1434513 () Bool)

(assert (=> b!1434513 (and (bvsge (index!47910 lt!631498) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631498) (size!47650 lt!631440)))))

(declare-fun res!967926 () Bool)

(assert (=> b!1434513 (= res!967926 (= (select (arr!47100 lt!631440) (index!47910 lt!631498)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434513 (=> res!967926 e!809623)))

(declare-fun b!1434508 () Bool)

(assert (=> b!1434508 (and (bvsge (index!47910 lt!631498) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631498) (size!47650 lt!631440)))))

(declare-fun res!967928 () Bool)

(assert (=> b!1434508 (= res!967928 (= (select (arr!47100 lt!631440) (index!47910 lt!631498)) lt!631435))))

(assert (=> b!1434508 (=> res!967928 e!809623)))

(assert (=> b!1434508 (= e!809621 e!809623)))

(declare-fun d!154219 () Bool)

(assert (=> d!154219 e!809625))

(declare-fun c!132791 () Bool)

(assert (=> d!154219 (= c!132791 (and ((_ is Intermediate!11379) lt!631498) (undefined!12191 lt!631498)))))

(assert (=> d!154219 (= lt!631498 e!809624)))

(declare-fun c!132790 () Bool)

(assert (=> d!154219 (= c!132790 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154219 (= lt!631497 (select (arr!47100 lt!631440) index!585))))

(assert (=> d!154219 (validMask!0 mask!2608)))

(assert (=> d!154219 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631435 lt!631440 mask!2608) lt!631498)))

(assert (= (and d!154219 c!132790) b!1434510))

(assert (= (and d!154219 (not c!132790)) b!1434507))

(assert (= (and b!1434507 c!132792) b!1434505))

(assert (= (and b!1434507 (not c!132792)) b!1434506))

(assert (= (and d!154219 c!132791) b!1434512))

(assert (= (and d!154219 (not c!132791)) b!1434511))

(assert (= (and b!1434511 res!967927) b!1434508))

(assert (= (and b!1434508 (not res!967928)) b!1434513))

(assert (= (and b!1434513 (not res!967926)) b!1434509))

(declare-fun m!1324125 () Bool)

(assert (=> b!1434509 m!1324125))

(assert (=> b!1434506 m!1323997))

(assert (=> b!1434506 m!1323997))

(declare-fun m!1324127 () Bool)

(assert (=> b!1434506 m!1324127))

(declare-fun m!1324129 () Bool)

(assert (=> d!154219 m!1324129))

(assert (=> d!154219 m!1324021))

(assert (=> b!1434513 m!1324125))

(assert (=> b!1434508 m!1324125))

(assert (=> b!1434382 d!154219))

(declare-fun d!154221 () Bool)

(assert (=> d!154221 (= (validKeyInArray!0 (select (arr!47100 a!2831) j!81)) (and (not (= (select (arr!47100 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47100 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434381 d!154221))

(declare-fun b!1434514 () Bool)

(declare-fun e!809627 () Bool)

(declare-fun call!67529 () Bool)

(assert (=> b!1434514 (= e!809627 call!67529)))

(declare-fun bm!67526 () Bool)

(assert (=> bm!67526 (= call!67529 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434516 () Bool)

(declare-fun e!809626 () Bool)

(assert (=> b!1434516 (= e!809626 e!809627)))

(declare-fun lt!631499 () (_ BitVec 64))

(assert (=> b!1434516 (= lt!631499 (select (arr!47100 a!2831) j!81))))

(declare-fun lt!631501 () Unit!48504)

(assert (=> b!1434516 (= lt!631501 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631499 j!81))))

(assert (=> b!1434516 (arrayContainsKey!0 a!2831 lt!631499 #b00000000000000000000000000000000)))

(declare-fun lt!631500 () Unit!48504)

(assert (=> b!1434516 (= lt!631500 lt!631501)))

(declare-fun res!967929 () Bool)

(assert (=> b!1434516 (= res!967929 (= (seekEntryOrOpen!0 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) (Found!11379 j!81)))))

(assert (=> b!1434516 (=> (not res!967929) (not e!809627))))

(declare-fun b!1434517 () Bool)

(assert (=> b!1434517 (= e!809626 call!67529)))

(declare-fun d!154223 () Bool)

(declare-fun res!967930 () Bool)

(declare-fun e!809628 () Bool)

(assert (=> d!154223 (=> res!967930 e!809628)))

(assert (=> d!154223 (= res!967930 (bvsge j!81 (size!47650 a!2831)))))

(assert (=> d!154223 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809628)))

(declare-fun b!1434515 () Bool)

(assert (=> b!1434515 (= e!809628 e!809626)))

(declare-fun c!132793 () Bool)

(assert (=> b!1434515 (= c!132793 (validKeyInArray!0 (select (arr!47100 a!2831) j!81)))))

(assert (= (and d!154223 (not res!967930)) b!1434515))

(assert (= (and b!1434515 c!132793) b!1434516))

(assert (= (and b!1434515 (not c!132793)) b!1434517))

(assert (= (and b!1434516 res!967929) b!1434514))

(assert (= (or b!1434514 b!1434517) bm!67526))

(declare-fun m!1324131 () Bool)

(assert (=> bm!67526 m!1324131))

(assert (=> b!1434516 m!1323991))

(declare-fun m!1324133 () Bool)

(assert (=> b!1434516 m!1324133))

(declare-fun m!1324135 () Bool)

(assert (=> b!1434516 m!1324135))

(assert (=> b!1434516 m!1323991))

(assert (=> b!1434516 m!1324029))

(assert (=> b!1434515 m!1323991))

(assert (=> b!1434515 m!1323991))

(assert (=> b!1434515 m!1323993))

(assert (=> b!1434370 d!154223))

(declare-fun d!154225 () Bool)

(assert (=> d!154225 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631507 () Unit!48504)

(declare-fun choose!38 (array!97592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48504)

(assert (=> d!154225 (= lt!631507 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154225 (validMask!0 mask!2608)))

(assert (=> d!154225 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631507)))

(declare-fun bs!41765 () Bool)

(assert (= bs!41765 d!154225))

(assert (=> bs!41765 m!1324017))

(declare-fun m!1324139 () Bool)

(assert (=> bs!41765 m!1324139))

(assert (=> bs!41765 m!1324021))

(assert (=> b!1434370 d!154225))

(declare-fun b!1434611 () Bool)

(declare-fun e!809681 () SeekEntryResult!11379)

(declare-fun lt!631538 () SeekEntryResult!11379)

(assert (=> b!1434611 (= e!809681 (Found!11379 (index!47910 lt!631538)))))

(declare-fun b!1434612 () Bool)

(declare-fun e!809682 () SeekEntryResult!11379)

(assert (=> b!1434612 (= e!809682 (MissingZero!11379 (index!47910 lt!631538)))))

(declare-fun b!1434613 () Bool)

(declare-fun e!809680 () SeekEntryResult!11379)

(assert (=> b!1434613 (= e!809680 Undefined!11379)))

(declare-fun d!154229 () Bool)

(declare-fun lt!631540 () SeekEntryResult!11379)

(assert (=> d!154229 (and (or ((_ is Undefined!11379) lt!631540) (not ((_ is Found!11379) lt!631540)) (and (bvsge (index!47909 lt!631540) #b00000000000000000000000000000000) (bvslt (index!47909 lt!631540) (size!47650 a!2831)))) (or ((_ is Undefined!11379) lt!631540) ((_ is Found!11379) lt!631540) (not ((_ is MissingZero!11379) lt!631540)) (and (bvsge (index!47908 lt!631540) #b00000000000000000000000000000000) (bvslt (index!47908 lt!631540) (size!47650 a!2831)))) (or ((_ is Undefined!11379) lt!631540) ((_ is Found!11379) lt!631540) ((_ is MissingZero!11379) lt!631540) (not ((_ is MissingVacant!11379) lt!631540)) (and (bvsge (index!47911 lt!631540) #b00000000000000000000000000000000) (bvslt (index!47911 lt!631540) (size!47650 a!2831)))) (or ((_ is Undefined!11379) lt!631540) (ite ((_ is Found!11379) lt!631540) (= (select (arr!47100 a!2831) (index!47909 lt!631540)) (select (arr!47100 a!2831) j!81)) (ite ((_ is MissingZero!11379) lt!631540) (= (select (arr!47100 a!2831) (index!47908 lt!631540)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11379) lt!631540) (= (select (arr!47100 a!2831) (index!47911 lt!631540)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154229 (= lt!631540 e!809680)))

(declare-fun c!132827 () Bool)

(assert (=> d!154229 (= c!132827 (and ((_ is Intermediate!11379) lt!631538) (undefined!12191 lt!631538)))))

(assert (=> d!154229 (= lt!631538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47100 a!2831) j!81) mask!2608) (select (arr!47100 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154229 (validMask!0 mask!2608)))

(assert (=> d!154229 (= (seekEntryOrOpen!0 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631540)))

(declare-fun b!1434614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97592 (_ BitVec 32)) SeekEntryResult!11379)

(assert (=> b!1434614 (= e!809682 (seekKeyOrZeroReturnVacant!0 (x!129559 lt!631538) (index!47910 lt!631538) (index!47910 lt!631538) (select (arr!47100 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434615 () Bool)

(assert (=> b!1434615 (= e!809680 e!809681)))

(declare-fun lt!631539 () (_ BitVec 64))

(assert (=> b!1434615 (= lt!631539 (select (arr!47100 a!2831) (index!47910 lt!631538)))))

(declare-fun c!132829 () Bool)

(assert (=> b!1434615 (= c!132829 (= lt!631539 (select (arr!47100 a!2831) j!81)))))

(declare-fun b!1434616 () Bool)

(declare-fun c!132828 () Bool)

(assert (=> b!1434616 (= c!132828 (= lt!631539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434616 (= e!809681 e!809682)))

(assert (= (and d!154229 c!132827) b!1434613))

(assert (= (and d!154229 (not c!132827)) b!1434615))

(assert (= (and b!1434615 c!132829) b!1434611))

(assert (= (and b!1434615 (not c!132829)) b!1434616))

(assert (= (and b!1434616 c!132828) b!1434612))

(assert (= (and b!1434616 (not c!132828)) b!1434614))

(assert (=> d!154229 m!1324031))

(assert (=> d!154229 m!1323991))

(assert (=> d!154229 m!1324033))

(declare-fun m!1324175 () Bool)

(assert (=> d!154229 m!1324175))

(declare-fun m!1324177 () Bool)

(assert (=> d!154229 m!1324177))

(declare-fun m!1324179 () Bool)

(assert (=> d!154229 m!1324179))

(assert (=> d!154229 m!1323991))

(assert (=> d!154229 m!1324031))

(assert (=> d!154229 m!1324021))

(assert (=> b!1434614 m!1323991))

(declare-fun m!1324181 () Bool)

(assert (=> b!1434614 m!1324181))

(declare-fun m!1324183 () Bool)

(assert (=> b!1434615 m!1324183))

(assert (=> b!1434380 d!154229))

(declare-fun b!1434627 () Bool)

(declare-fun e!809692 () SeekEntryResult!11379)

(assert (=> b!1434627 (= e!809692 (Intermediate!11379 false (toIndex!0 lt!631435 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434628 () Bool)

(assert (=> b!1434628 (= e!809692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631435 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631435 lt!631440 mask!2608))))

(declare-fun b!1434629 () Bool)

(declare-fun e!809694 () SeekEntryResult!11379)

(assert (=> b!1434629 (= e!809694 e!809692)))

(declare-fun c!132834 () Bool)

(declare-fun lt!631541 () (_ BitVec 64))

(assert (=> b!1434629 (= c!132834 (or (= lt!631541 lt!631435) (= (bvadd lt!631541 lt!631541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434631 () Bool)

(declare-fun lt!631542 () SeekEntryResult!11379)

(assert (=> b!1434631 (and (bvsge (index!47910 lt!631542) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631542) (size!47650 lt!631440)))))

(declare-fun e!809693 () Bool)

(assert (=> b!1434631 (= e!809693 (= (select (arr!47100 lt!631440) (index!47910 lt!631542)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434632 () Bool)

(assert (=> b!1434632 (= e!809694 (Intermediate!11379 true (toIndex!0 lt!631435 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434633 () Bool)

(declare-fun e!809695 () Bool)

(declare-fun e!809691 () Bool)

(assert (=> b!1434633 (= e!809695 e!809691)))

(declare-fun res!967967 () Bool)

(assert (=> b!1434633 (= res!967967 (and ((_ is Intermediate!11379) lt!631542) (not (undefined!12191 lt!631542)) (bvslt (x!129559 lt!631542) #b01111111111111111111111111111110) (bvsge (x!129559 lt!631542) #b00000000000000000000000000000000) (bvsge (x!129559 lt!631542) #b00000000000000000000000000000000)))))

(assert (=> b!1434633 (=> (not res!967967) (not e!809691))))

(declare-fun b!1434634 () Bool)

(assert (=> b!1434634 (= e!809695 (bvsge (x!129559 lt!631542) #b01111111111111111111111111111110))))

(declare-fun b!1434635 () Bool)

(assert (=> b!1434635 (and (bvsge (index!47910 lt!631542) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631542) (size!47650 lt!631440)))))

(declare-fun res!967966 () Bool)

(assert (=> b!1434635 (= res!967966 (= (select (arr!47100 lt!631440) (index!47910 lt!631542)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434635 (=> res!967966 e!809693)))

(declare-fun b!1434630 () Bool)

(assert (=> b!1434630 (and (bvsge (index!47910 lt!631542) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631542) (size!47650 lt!631440)))))

(declare-fun res!967968 () Bool)

(assert (=> b!1434630 (= res!967968 (= (select (arr!47100 lt!631440) (index!47910 lt!631542)) lt!631435))))

(assert (=> b!1434630 (=> res!967968 e!809693)))

(assert (=> b!1434630 (= e!809691 e!809693)))

(declare-fun d!154245 () Bool)

(assert (=> d!154245 e!809695))

(declare-fun c!132833 () Bool)

(assert (=> d!154245 (= c!132833 (and ((_ is Intermediate!11379) lt!631542) (undefined!12191 lt!631542)))))

(assert (=> d!154245 (= lt!631542 e!809694)))

(declare-fun c!132832 () Bool)

(assert (=> d!154245 (= c!132832 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154245 (= lt!631541 (select (arr!47100 lt!631440) (toIndex!0 lt!631435 mask!2608)))))

(assert (=> d!154245 (validMask!0 mask!2608)))

(assert (=> d!154245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631435 mask!2608) lt!631435 lt!631440 mask!2608) lt!631542)))

(assert (= (and d!154245 c!132832) b!1434632))

(assert (= (and d!154245 (not c!132832)) b!1434629))

(assert (= (and b!1434629 c!132834) b!1434627))

(assert (= (and b!1434629 (not c!132834)) b!1434628))

(assert (= (and d!154245 c!132833) b!1434634))

(assert (= (and d!154245 (not c!132833)) b!1434633))

(assert (= (and b!1434633 res!967967) b!1434630))

(assert (= (and b!1434630 (not res!967968)) b!1434635))

(assert (= (and b!1434635 (not res!967966)) b!1434631))

(declare-fun m!1324185 () Bool)

(assert (=> b!1434631 m!1324185))

(assert (=> b!1434628 m!1323999))

(declare-fun m!1324187 () Bool)

(assert (=> b!1434628 m!1324187))

(assert (=> b!1434628 m!1324187))

(declare-fun m!1324189 () Bool)

(assert (=> b!1434628 m!1324189))

(assert (=> d!154245 m!1323999))

(declare-fun m!1324191 () Bool)

(assert (=> d!154245 m!1324191))

(assert (=> d!154245 m!1324021))

(assert (=> b!1434635 m!1324185))

(assert (=> b!1434630 m!1324185))

(assert (=> b!1434378 d!154245))

(declare-fun d!154247 () Bool)

(declare-fun lt!631544 () (_ BitVec 32))

(declare-fun lt!631543 () (_ BitVec 32))

(assert (=> d!154247 (= lt!631544 (bvmul (bvxor lt!631543 (bvlshr lt!631543 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154247 (= lt!631543 ((_ extract 31 0) (bvand (bvxor lt!631435 (bvlshr lt!631435 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154247 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967901 (let ((h!34937 ((_ extract 31 0) (bvand (bvxor lt!631435 (bvlshr lt!631435 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129562 (bvmul (bvxor h!34937 (bvlshr h!34937 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129562 (bvlshr x!129562 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967901 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967901 #b00000000000000000000000000000000))))))

(assert (=> d!154247 (= (toIndex!0 lt!631435 mask!2608) (bvand (bvxor lt!631544 (bvlshr lt!631544 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434378 d!154247))

(declare-fun b!1434636 () Bool)

(declare-fun e!809697 () SeekEntryResult!11379)

(assert (=> b!1434636 (= e!809697 (Intermediate!11379 false index!585 x!605))))

(declare-fun b!1434637 () Bool)

(assert (=> b!1434637 (= e!809697 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47100 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434638 () Bool)

(declare-fun e!809699 () SeekEntryResult!11379)

(assert (=> b!1434638 (= e!809699 e!809697)))

(declare-fun lt!631545 () (_ BitVec 64))

(declare-fun c!132837 () Bool)

(assert (=> b!1434638 (= c!132837 (or (= lt!631545 (select (arr!47100 a!2831) j!81)) (= (bvadd lt!631545 lt!631545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434640 () Bool)

(declare-fun lt!631546 () SeekEntryResult!11379)

(assert (=> b!1434640 (and (bvsge (index!47910 lt!631546) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631546) (size!47650 a!2831)))))

(declare-fun e!809698 () Bool)

(assert (=> b!1434640 (= e!809698 (= (select (arr!47100 a!2831) (index!47910 lt!631546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434641 () Bool)

(assert (=> b!1434641 (= e!809699 (Intermediate!11379 true index!585 x!605))))

(declare-fun b!1434642 () Bool)

(declare-fun e!809700 () Bool)

(declare-fun e!809696 () Bool)

(assert (=> b!1434642 (= e!809700 e!809696)))

(declare-fun res!967970 () Bool)

(assert (=> b!1434642 (= res!967970 (and ((_ is Intermediate!11379) lt!631546) (not (undefined!12191 lt!631546)) (bvslt (x!129559 lt!631546) #b01111111111111111111111111111110) (bvsge (x!129559 lt!631546) #b00000000000000000000000000000000) (bvsge (x!129559 lt!631546) x!605)))))

(assert (=> b!1434642 (=> (not res!967970) (not e!809696))))

(declare-fun b!1434643 () Bool)

(assert (=> b!1434643 (= e!809700 (bvsge (x!129559 lt!631546) #b01111111111111111111111111111110))))

(declare-fun b!1434644 () Bool)

(assert (=> b!1434644 (and (bvsge (index!47910 lt!631546) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631546) (size!47650 a!2831)))))

(declare-fun res!967969 () Bool)

(assert (=> b!1434644 (= res!967969 (= (select (arr!47100 a!2831) (index!47910 lt!631546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434644 (=> res!967969 e!809698)))

(declare-fun b!1434639 () Bool)

(assert (=> b!1434639 (and (bvsge (index!47910 lt!631546) #b00000000000000000000000000000000) (bvslt (index!47910 lt!631546) (size!47650 a!2831)))))

(declare-fun res!967971 () Bool)

(assert (=> b!1434639 (= res!967971 (= (select (arr!47100 a!2831) (index!47910 lt!631546)) (select (arr!47100 a!2831) j!81)))))

(assert (=> b!1434639 (=> res!967971 e!809698)))

(assert (=> b!1434639 (= e!809696 e!809698)))

(declare-fun d!154249 () Bool)

(assert (=> d!154249 e!809700))

(declare-fun c!132836 () Bool)

(assert (=> d!154249 (= c!132836 (and ((_ is Intermediate!11379) lt!631546) (undefined!12191 lt!631546)))))

(assert (=> d!154249 (= lt!631546 e!809699)))

(declare-fun c!132835 () Bool)

(assert (=> d!154249 (= c!132835 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154249 (= lt!631545 (select (arr!47100 a!2831) index!585))))

(assert (=> d!154249 (validMask!0 mask!2608)))

(assert (=> d!154249 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47100 a!2831) j!81) a!2831 mask!2608) lt!631546)))

(assert (= (and d!154249 c!132835) b!1434641))

(assert (= (and d!154249 (not c!132835)) b!1434638))

(assert (= (and b!1434638 c!132837) b!1434636))

(assert (= (and b!1434638 (not c!132837)) b!1434637))

(assert (= (and d!154249 c!132836) b!1434643))

(assert (= (and d!154249 (not c!132836)) b!1434642))

(assert (= (and b!1434642 res!967970) b!1434639))

(assert (= (and b!1434639 (not res!967971)) b!1434644))

(assert (= (and b!1434644 (not res!967969)) b!1434640))

(declare-fun m!1324193 () Bool)

(assert (=> b!1434640 m!1324193))

(assert (=> b!1434637 m!1323997))

(assert (=> b!1434637 m!1323997))

(assert (=> b!1434637 m!1323991))

(declare-fun m!1324195 () Bool)

(assert (=> b!1434637 m!1324195))

(assert (=> d!154249 m!1324015))

(assert (=> d!154249 m!1324021))

(assert (=> b!1434644 m!1324193))

(assert (=> b!1434639 m!1324193))

(assert (=> b!1434377 d!154249))

(check-sat (not d!154219) (not d!154189) (not d!154229) (not d!154245) (not b!1434468) (not bm!67519) (not b!1434614) (not b!1434489) (not d!154215) (not b!1434490) (not d!154225) (not b!1434467) (not b!1434493) (not d!154249) (not b!1434628) (not b!1434506) (not bm!67526) (not b!1434516) (not bm!67524) (not b!1434449) (not b!1434637) (not b!1434471) (not d!154193) (not b!1434515))
(check-sat)
