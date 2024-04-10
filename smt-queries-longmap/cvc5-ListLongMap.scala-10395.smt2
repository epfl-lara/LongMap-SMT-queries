; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122448 () Bool)

(assert start!122448)

(declare-fun b!1418840 () Bool)

(declare-fun res!954448 () Bool)

(declare-fun e!802847 () Bool)

(assert (=> b!1418840 (=> (not res!954448) (not e!802847))))

(declare-datatypes ((array!96891 0))(
  ( (array!96892 (arr!46766 (Array (_ BitVec 32) (_ BitVec 64))) (size!47316 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96891)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418840 (= res!954448 (validKeyInArray!0 (select (arr!46766 a!2831) j!81)))))

(declare-fun b!1418841 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418841 (= e!802847 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1418842 () Bool)

(declare-fun res!954453 () Bool)

(assert (=> b!1418842 (=> (not res!954453) (not e!802847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96891 (_ BitVec 32)) Bool)

(assert (=> b!1418842 (= res!954453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418843 () Bool)

(declare-fun res!954450 () Bool)

(assert (=> b!1418843 (=> (not res!954450) (not e!802847))))

(declare-datatypes ((List!33276 0))(
  ( (Nil!33273) (Cons!33272 (h!34568 (_ BitVec 64)) (t!47970 List!33276)) )
))
(declare-fun arrayNoDuplicates!0 (array!96891 (_ BitVec 32) List!33276) Bool)

(assert (=> b!1418843 (= res!954450 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33273))))

(declare-fun b!1418844 () Bool)

(declare-fun res!954452 () Bool)

(assert (=> b!1418844 (=> (not res!954452) (not e!802847))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1418844 (= res!954452 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47316 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47316 a!2831))))))

(declare-fun res!954449 () Bool)

(assert (=> start!122448 (=> (not res!954449) (not e!802847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122448 (= res!954449 (validMask!0 mask!2608))))

(assert (=> start!122448 e!802847))

(assert (=> start!122448 true))

(declare-fun array_inv!35794 (array!96891) Bool)

(assert (=> start!122448 (array_inv!35794 a!2831)))

(declare-fun b!1418845 () Bool)

(declare-fun res!954454 () Bool)

(assert (=> b!1418845 (=> (not res!954454) (not e!802847))))

(declare-datatypes ((SeekEntryResult!11051 0))(
  ( (MissingZero!11051 (index!46596 (_ BitVec 32))) (Found!11051 (index!46597 (_ BitVec 32))) (Intermediate!11051 (undefined!11863 Bool) (index!46598 (_ BitVec 32)) (x!128265 (_ BitVec 32))) (Undefined!11051) (MissingVacant!11051 (index!46599 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96891 (_ BitVec 32)) SeekEntryResult!11051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418845 (= res!954454 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608) (select (arr!46766 a!2831) j!81) a!2831 mask!2608) (Intermediate!11051 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418846 () Bool)

(declare-fun res!954447 () Bool)

(assert (=> b!1418846 (=> (not res!954447) (not e!802847))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418846 (= res!954447 (and (= (size!47316 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47316 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47316 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418847 () Bool)

(declare-fun res!954451 () Bool)

(assert (=> b!1418847 (=> (not res!954451) (not e!802847))))

(assert (=> b!1418847 (= res!954451 (validKeyInArray!0 (select (arr!46766 a!2831) i!982)))))

(assert (= (and start!122448 res!954449) b!1418846))

(assert (= (and b!1418846 res!954447) b!1418847))

(assert (= (and b!1418847 res!954451) b!1418840))

(assert (= (and b!1418840 res!954448) b!1418842))

(assert (= (and b!1418842 res!954453) b!1418843))

(assert (= (and b!1418843 res!954450) b!1418844))

(assert (= (and b!1418844 res!954452) b!1418845))

(assert (= (and b!1418845 res!954454) b!1418841))

(declare-fun m!1309443 () Bool)

(assert (=> b!1418847 m!1309443))

(assert (=> b!1418847 m!1309443))

(declare-fun m!1309445 () Bool)

(assert (=> b!1418847 m!1309445))

(declare-fun m!1309447 () Bool)

(assert (=> start!122448 m!1309447))

(declare-fun m!1309449 () Bool)

(assert (=> start!122448 m!1309449))

(declare-fun m!1309451 () Bool)

(assert (=> b!1418840 m!1309451))

(assert (=> b!1418840 m!1309451))

(declare-fun m!1309453 () Bool)

(assert (=> b!1418840 m!1309453))

(assert (=> b!1418845 m!1309451))

(assert (=> b!1418845 m!1309451))

(declare-fun m!1309455 () Bool)

(assert (=> b!1418845 m!1309455))

(assert (=> b!1418845 m!1309455))

(assert (=> b!1418845 m!1309451))

(declare-fun m!1309457 () Bool)

(assert (=> b!1418845 m!1309457))

(declare-fun m!1309459 () Bool)

(assert (=> b!1418843 m!1309459))

(declare-fun m!1309461 () Bool)

(assert (=> b!1418842 m!1309461))

(push 1)

(assert (not b!1418845))

(assert (not start!122448))

(assert (not b!1418847))

(assert (not b!1418843))

(assert (not b!1418840))

(assert (not b!1418842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152935 () Bool)

(assert (=> d!152935 (= (validKeyInArray!0 (select (arr!46766 a!2831) i!982)) (and (not (= (select (arr!46766 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46766 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418847 d!152935))

(declare-fun b!1418934 () Bool)

(declare-fun e!802892 () Bool)

(declare-fun e!802891 () Bool)

(assert (=> b!1418934 (= e!802892 e!802891)))

(declare-fun lt!625666 () (_ BitVec 64))

(assert (=> b!1418934 (= lt!625666 (select (arr!46766 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48070 0))(
  ( (Unit!48071) )
))
(declare-fun lt!625668 () Unit!48070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96891 (_ BitVec 64) (_ BitVec 32)) Unit!48070)

(assert (=> b!1418934 (= lt!625668 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625666 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418934 (arrayContainsKey!0 a!2831 lt!625666 #b00000000000000000000000000000000)))

(declare-fun lt!625667 () Unit!48070)

(assert (=> b!1418934 (= lt!625667 lt!625668)))

(declare-fun res!954526 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96891 (_ BitVec 32)) SeekEntryResult!11051)

(assert (=> b!1418934 (= res!954526 (= (seekEntryOrOpen!0 (select (arr!46766 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11051 #b00000000000000000000000000000000)))))

(assert (=> b!1418934 (=> (not res!954526) (not e!802891))))

(declare-fun b!1418935 () Bool)

(declare-fun call!67294 () Bool)

(assert (=> b!1418935 (= e!802891 call!67294)))

(declare-fun bm!67291 () Bool)

(assert (=> bm!67291 (= call!67294 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418936 () Bool)

(assert (=> b!1418936 (= e!802892 call!67294)))

(declare-fun d!152937 () Bool)

(declare-fun res!954525 () Bool)

(declare-fun e!802890 () Bool)

(assert (=> d!152937 (=> res!954525 e!802890)))

(assert (=> d!152937 (= res!954525 (bvsge #b00000000000000000000000000000000 (size!47316 a!2831)))))

(assert (=> d!152937 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802890)))

(declare-fun b!1418937 () Bool)

(assert (=> b!1418937 (= e!802890 e!802892)))

(declare-fun c!131688 () Bool)

(assert (=> b!1418937 (= c!131688 (validKeyInArray!0 (select (arr!46766 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152937 (not res!954525)) b!1418937))

(assert (= (and b!1418937 c!131688) b!1418934))

(assert (= (and b!1418937 (not c!131688)) b!1418936))

(assert (= (and b!1418934 res!954526) b!1418935))

(assert (= (or b!1418935 b!1418936) bm!67291))

(declare-fun m!1309519 () Bool)

(assert (=> b!1418934 m!1309519))

(declare-fun m!1309521 () Bool)

(assert (=> b!1418934 m!1309521))

(declare-fun m!1309523 () Bool)

(assert (=> b!1418934 m!1309523))

(assert (=> b!1418934 m!1309519))

(declare-fun m!1309525 () Bool)

(assert (=> b!1418934 m!1309525))

(declare-fun m!1309527 () Bool)

(assert (=> bm!67291 m!1309527))

(assert (=> b!1418937 m!1309519))

(assert (=> b!1418937 m!1309519))

(declare-fun m!1309529 () Bool)

(assert (=> b!1418937 m!1309529))

(assert (=> b!1418842 d!152937))

(declare-fun d!152943 () Bool)

(assert (=> d!152943 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122448 d!152943))

(declare-fun d!152951 () Bool)

(assert (=> d!152951 (= (array_inv!35794 a!2831) (bvsge (size!47316 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122448 d!152951))

(declare-fun d!152953 () Bool)

(declare-fun e!802937 () Bool)

(assert (=> d!152953 e!802937))

(declare-fun c!131711 () Bool)

(declare-fun lt!625704 () SeekEntryResult!11051)

(assert (=> d!152953 (= c!131711 (and (is-Intermediate!11051 lt!625704) (undefined!11863 lt!625704)))))

(declare-fun e!802938 () SeekEntryResult!11051)

(assert (=> d!152953 (= lt!625704 e!802938)))

(declare-fun c!131712 () Bool)

(assert (=> d!152953 (= c!131712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625703 () (_ BitVec 64))

(assert (=> d!152953 (= lt!625703 (select (arr!46766 a!2831) (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608)))))

(assert (=> d!152953 (validMask!0 mask!2608)))

(assert (=> d!152953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608) (select (arr!46766 a!2831) j!81) a!2831 mask!2608) lt!625704)))

(declare-fun b!1419007 () Bool)

(assert (=> b!1419007 (and (bvsge (index!46598 lt!625704) #b00000000000000000000000000000000) (bvslt (index!46598 lt!625704) (size!47316 a!2831)))))

(declare-fun res!954555 () Bool)

(assert (=> b!1419007 (= res!954555 (= (select (arr!46766 a!2831) (index!46598 lt!625704)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802939 () Bool)

(assert (=> b!1419007 (=> res!954555 e!802939)))

(declare-fun b!1419008 () Bool)

(declare-fun e!802940 () SeekEntryResult!11051)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419008 (= e!802940 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46766 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1419009 () Bool)

(assert (=> b!1419009 (= e!802938 (Intermediate!11051 true (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419010 () Bool)

(assert (=> b!1419010 (= e!802938 e!802940)))

(declare-fun c!131710 () Bool)

(assert (=> b!1419010 (= c!131710 (or (= lt!625703 (select (arr!46766 a!2831) j!81)) (= (bvadd lt!625703 lt!625703) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1419011 () Bool)

(assert (=> b!1419011 (and (bvsge (index!46598 lt!625704) #b00000000000000000000000000000000) (bvslt (index!46598 lt!625704) (size!47316 a!2831)))))

(assert (=> b!1419011 (= e!802939 (= (select (arr!46766 a!2831) (index!46598 lt!625704)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419012 () Bool)

(assert (=> b!1419012 (and (bvsge (index!46598 lt!625704) #b00000000000000000000000000000000) (bvslt (index!46598 lt!625704) (size!47316 a!2831)))))

(declare-fun res!954557 () Bool)

(assert (=> b!1419012 (= res!954557 (= (select (arr!46766 a!2831) (index!46598 lt!625704)) (select (arr!46766 a!2831) j!81)))))

(assert (=> b!1419012 (=> res!954557 e!802939)))

(declare-fun e!802936 () Bool)

(assert (=> b!1419012 (= e!802936 e!802939)))

(declare-fun b!1419013 () Bool)

(assert (=> b!1419013 (= e!802940 (Intermediate!11051 false (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419014 () Bool)

(assert (=> b!1419014 (= e!802937 (bvsge (x!128265 lt!625704) #b01111111111111111111111111111110))))

(declare-fun b!1419015 () Bool)

(assert (=> b!1419015 (= e!802937 e!802936)))

(declare-fun res!954556 () Bool)

(assert (=> b!1419015 (= res!954556 (and (is-Intermediate!11051 lt!625704) (not (undefined!11863 lt!625704)) (bvslt (x!128265 lt!625704) #b01111111111111111111111111111110) (bvsge (x!128265 lt!625704) #b00000000000000000000000000000000) (bvsge (x!128265 lt!625704) #b00000000000000000000000000000000)))))

(assert (=> b!1419015 (=> (not res!954556) (not e!802936))))

(assert (= (and d!152953 c!131712) b!1419009))

(assert (= (and d!152953 (not c!131712)) b!1419010))

(assert (= (and b!1419010 c!131710) b!1419013))

(assert (= (and b!1419010 (not c!131710)) b!1419008))

(assert (= (and d!152953 c!131711) b!1419014))

(assert (= (and d!152953 (not c!131711)) b!1419015))

(assert (= (and b!1419015 res!954556) b!1419012))

(assert (= (and b!1419012 (not res!954557)) b!1419007))

(assert (= (and b!1419007 (not res!954555)) b!1419011))

(declare-fun m!1309555 () Bool)

(assert (=> b!1419012 m!1309555))

(assert (=> b!1419011 m!1309555))

(assert (=> d!152953 m!1309455))

(declare-fun m!1309557 () Bool)

(assert (=> d!152953 m!1309557))

(assert (=> d!152953 m!1309447))

(assert (=> b!1419008 m!1309455))

(declare-fun m!1309559 () Bool)

(assert (=> b!1419008 m!1309559))

(assert (=> b!1419008 m!1309559))

(assert (=> b!1419008 m!1309451))

(declare-fun m!1309561 () Bool)

(assert (=> b!1419008 m!1309561))

(assert (=> b!1419007 m!1309555))

(assert (=> b!1418845 d!152953))

(declare-fun d!152963 () Bool)

(declare-fun lt!625714 () (_ BitVec 32))

(declare-fun lt!625713 () (_ BitVec 32))

(assert (=> d!152963 (= lt!625714 (bvmul (bvxor lt!625713 (bvlshr lt!625713 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152963 (= lt!625713 ((_ extract 31 0) (bvand (bvxor (select (arr!46766 a!2831) j!81) (bvlshr (select (arr!46766 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152963 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954558 (let ((h!34572 ((_ extract 31 0) (bvand (bvxor (select (arr!46766 a!2831) j!81) (bvlshr (select (arr!46766 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128272 (bvmul (bvxor h!34572 (bvlshr h!34572 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128272 (bvlshr x!128272 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954558 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954558 #b00000000000000000000000000000000))))))

(assert (=> d!152963 (= (toIndex!0 (select (arr!46766 a!2831) j!81) mask!2608) (bvand (bvxor lt!625714 (bvlshr lt!625714 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418845 d!152963))

(declare-fun d!152967 () Bool)

(assert (=> d!152967 (= (validKeyInArray!0 (select (arr!46766 a!2831) j!81)) (and (not (= (select (arr!46766 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46766 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418840 d!152967))

(declare-fun b!1419053 () Bool)

(declare-fun e!802964 () Bool)

(declare-fun e!802966 () Bool)

(assert (=> b!1419053 (= e!802964 e!802966)))

(declare-fun res!954577 () Bool)

(assert (=> b!1419053 (=> (not res!954577) (not e!802966))))

(declare-fun e!802965 () Bool)

(assert (=> b!1419053 (= res!954577 (not e!802965))))

(declare-fun res!954575 () Bool)

(assert (=> b!1419053 (=> (not res!954575) (not e!802965))))

(assert (=> b!1419053 (= res!954575 (validKeyInArray!0 (select (arr!46766 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419054 () Bool)

(declare-fun e!802967 () Bool)

(declare-fun call!67303 () Bool)

(assert (=> b!1419054 (= e!802967 call!67303)))

(declare-fun b!1419055 () Bool)

(declare-fun contains!9843 (List!33276 (_ BitVec 64)) Bool)

(assert (=> b!1419055 (= e!802965 (contains!9843 Nil!33273 (select (arr!46766 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419056 () Bool)

(assert (=> b!1419056 (= e!802967 call!67303)))

(declare-fun b!1419057 () Bool)

(assert (=> b!1419057 (= e!802966 e!802967)))

(declare-fun c!131724 () Bool)

(assert (=> b!1419057 (= c!131724 (validKeyInArray!0 (select (arr!46766 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152969 () Bool)

(declare-fun res!954576 () Bool)

(assert (=> d!152969 (=> res!954576 e!802964)))

(assert (=> d!152969 (= res!954576 (bvsge #b00000000000000000000000000000000 (size!47316 a!2831)))))

(assert (=> d!152969 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33273) e!802964)))

(declare-fun bm!67300 () Bool)

(assert (=> bm!67300 (= call!67303 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131724 (Cons!33272 (select (arr!46766 a!2831) #b00000000000000000000000000000000) Nil!33273) Nil!33273)))))

(assert (= (and d!152969 (not res!954576)) b!1419053))

(assert (= (and b!1419053 res!954575) b!1419055))

(assert (= (and b!1419053 res!954577) b!1419057))

(assert (= (and b!1419057 c!131724) b!1419054))

(assert (= (and b!1419057 (not c!131724)) b!1419056))

(assert (= (or b!1419054 b!1419056) bm!67300))

(assert (=> b!1419053 m!1309519))

(assert (=> b!1419053 m!1309519))

(assert (=> b!1419053 m!1309529))

(assert (=> b!1419055 m!1309519))

(assert (=> b!1419055 m!1309519))

(declare-fun m!1309571 () Bool)

(assert (=> b!1419055 m!1309571))

(assert (=> b!1419057 m!1309519))

(assert (=> b!1419057 m!1309519))

(assert (=> b!1419057 m!1309529))

(assert (=> bm!67300 m!1309519))

(declare-fun m!1309573 () Bool)

(assert (=> bm!67300 m!1309573))

(assert (=> b!1418843 d!152969))

(push 1)

