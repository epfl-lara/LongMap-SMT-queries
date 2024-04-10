; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122518 () Bool)

(assert start!122518)

(declare-fun b!1419338 () Bool)

(declare-fun res!954862 () Bool)

(declare-fun e!803038 () Bool)

(assert (=> b!1419338 (=> (not res!954862) (not e!803038))))

(declare-datatypes ((array!96922 0))(
  ( (array!96923 (arr!46780 (Array (_ BitVec 32) (_ BitVec 64))) (size!47330 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96922)

(declare-datatypes ((List!33290 0))(
  ( (Nil!33287) (Cons!33286 (h!34585 (_ BitVec 64)) (t!47984 List!33290)) )
))
(declare-fun arrayNoDuplicates!0 (array!96922 (_ BitVec 32) List!33290) Bool)

(assert (=> b!1419338 (= res!954862 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33287))))

(declare-fun b!1419339 () Bool)

(declare-fun res!954858 () Bool)

(assert (=> b!1419339 (=> (not res!954858) (not e!803038))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11065 0))(
  ( (MissingZero!11065 (index!46652 (_ BitVec 32))) (Found!11065 (index!46653 (_ BitVec 32))) (Intermediate!11065 (undefined!11877 Bool) (index!46654 (_ BitVec 32)) (x!128317 (_ BitVec 32))) (Undefined!11065) (MissingVacant!11065 (index!46655 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96922 (_ BitVec 32)) SeekEntryResult!11065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419339 (= res!954858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608) (select (arr!46780 a!2831) j!81) a!2831 mask!2608) (Intermediate!11065 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419340 () Bool)

(declare-fun res!954865 () Bool)

(assert (=> b!1419340 (=> (not res!954865) (not e!803038))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419340 (= res!954865 (validKeyInArray!0 (select (arr!46780 a!2831) i!982)))))

(declare-fun b!1419341 () Bool)

(declare-fun res!954864 () Bool)

(assert (=> b!1419341 (=> (not res!954864) (not e!803038))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419341 (= res!954864 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47330 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47330 a!2831))))))

(declare-fun b!1419342 () Bool)

(declare-fun res!954859 () Bool)

(assert (=> b!1419342 (=> (not res!954859) (not e!803038))))

(assert (=> b!1419342 (= res!954859 (validKeyInArray!0 (select (arr!46780 a!2831) j!81)))))

(declare-fun res!954860 () Bool)

(assert (=> start!122518 (=> (not res!954860) (not e!803038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122518 (= res!954860 (validMask!0 mask!2608))))

(assert (=> start!122518 e!803038))

(assert (=> start!122518 true))

(declare-fun array_inv!35808 (array!96922) Bool)

(assert (=> start!122518 (array_inv!35808 a!2831)))

(declare-fun b!1419343 () Bool)

(declare-fun lt!625758 () (_ BitVec 32))

(assert (=> b!1419343 (= e!803038 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625758 #b00000000000000000000000000000000) (bvsge lt!625758 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(assert (=> b!1419343 (= lt!625758 (toIndex!0 (select (store (arr!46780 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419344 () Bool)

(declare-fun res!954863 () Bool)

(assert (=> b!1419344 (=> (not res!954863) (not e!803038))))

(assert (=> b!1419344 (= res!954863 (and (= (size!47330 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47330 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47330 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419345 () Bool)

(declare-fun res!954861 () Bool)

(assert (=> b!1419345 (=> (not res!954861) (not e!803038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96922 (_ BitVec 32)) Bool)

(assert (=> b!1419345 (= res!954861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122518 res!954860) b!1419344))

(assert (= (and b!1419344 res!954863) b!1419340))

(assert (= (and b!1419340 res!954865) b!1419342))

(assert (= (and b!1419342 res!954859) b!1419345))

(assert (= (and b!1419345 res!954861) b!1419338))

(assert (= (and b!1419338 res!954862) b!1419341))

(assert (= (and b!1419341 res!954864) b!1419339))

(assert (= (and b!1419339 res!954858) b!1419343))

(declare-fun m!1309861 () Bool)

(assert (=> b!1419338 m!1309861))

(declare-fun m!1309863 () Bool)

(assert (=> b!1419342 m!1309863))

(assert (=> b!1419342 m!1309863))

(declare-fun m!1309865 () Bool)

(assert (=> b!1419342 m!1309865))

(declare-fun m!1309867 () Bool)

(assert (=> b!1419343 m!1309867))

(declare-fun m!1309869 () Bool)

(assert (=> b!1419343 m!1309869))

(assert (=> b!1419343 m!1309869))

(declare-fun m!1309871 () Bool)

(assert (=> b!1419343 m!1309871))

(assert (=> b!1419339 m!1309863))

(assert (=> b!1419339 m!1309863))

(declare-fun m!1309873 () Bool)

(assert (=> b!1419339 m!1309873))

(assert (=> b!1419339 m!1309873))

(assert (=> b!1419339 m!1309863))

(declare-fun m!1309875 () Bool)

(assert (=> b!1419339 m!1309875))

(declare-fun m!1309877 () Bool)

(assert (=> b!1419345 m!1309877))

(declare-fun m!1309879 () Bool)

(assert (=> start!122518 m!1309879))

(declare-fun m!1309881 () Bool)

(assert (=> start!122518 m!1309881))

(declare-fun m!1309883 () Bool)

(assert (=> b!1419340 m!1309883))

(assert (=> b!1419340 m!1309883))

(declare-fun m!1309885 () Bool)

(assert (=> b!1419340 m!1309885))

(push 1)

(assert (not b!1419343))

(assert (not b!1419339))

(assert (not b!1419345))

(assert (not start!122518))

(assert (not b!1419342))

(assert (not b!1419340))

(assert (not b!1419338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152995 () Bool)

(assert (=> d!152995 (= (validKeyInArray!0 (select (arr!46780 a!2831) j!81)) (and (not (= (select (arr!46780 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46780 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419342 d!152995))

(declare-fun d!152999 () Bool)

(assert (=> d!152999 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122518 d!152999))

(declare-fun d!153005 () Bool)

(assert (=> d!153005 (= (array_inv!35808 a!2831) (bvsge (size!47330 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122518 d!153005))

(declare-fun b!1419398 () Bool)

(declare-fun e!803083 () Bool)

(declare-fun call!67315 () Bool)

(assert (=> b!1419398 (= e!803083 call!67315)))

(declare-fun b!1419399 () Bool)

(declare-fun e!803082 () Bool)

(declare-fun e!803084 () Bool)

(assert (=> b!1419399 (= e!803082 e!803084)))

(declare-fun res!954899 () Bool)

(assert (=> b!1419399 (=> (not res!954899) (not e!803084))))

(declare-fun e!803081 () Bool)

(assert (=> b!1419399 (= res!954899 (not e!803081))))

(declare-fun res!954900 () Bool)

(assert (=> b!1419399 (=> (not res!954900) (not e!803081))))

(assert (=> b!1419399 (= res!954900 (validKeyInArray!0 (select (arr!46780 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419400 () Bool)

(assert (=> b!1419400 (= e!803083 call!67315)))

(declare-fun d!153007 () Bool)

(declare-fun res!954898 () Bool)

(assert (=> d!153007 (=> res!954898 e!803082)))

(assert (=> d!153007 (= res!954898 (bvsge #b00000000000000000000000000000000 (size!47330 a!2831)))))

(assert (=> d!153007 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33287) e!803082)))

(declare-fun bm!67312 () Bool)

(declare-fun c!131736 () Bool)

(assert (=> bm!67312 (= call!67315 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131736 (Cons!33286 (select (arr!46780 a!2831) #b00000000000000000000000000000000) Nil!33287) Nil!33287)))))

(declare-fun b!1419401 () Bool)

(declare-fun contains!9846 (List!33290 (_ BitVec 64)) Bool)

(assert (=> b!1419401 (= e!803081 (contains!9846 Nil!33287 (select (arr!46780 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419402 () Bool)

(assert (=> b!1419402 (= e!803084 e!803083)))

(assert (=> b!1419402 (= c!131736 (validKeyInArray!0 (select (arr!46780 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153007 (not res!954898)) b!1419399))

(assert (= (and b!1419399 res!954900) b!1419401))

(assert (= (and b!1419399 res!954899) b!1419402))

(assert (= (and b!1419402 c!131736) b!1419400))

(assert (= (and b!1419402 (not c!131736)) b!1419398))

(assert (= (or b!1419400 b!1419398) bm!67312))

(declare-fun m!1309911 () Bool)

(assert (=> b!1419399 m!1309911))

(assert (=> b!1419399 m!1309911))

(declare-fun m!1309913 () Bool)

(assert (=> b!1419399 m!1309913))

(assert (=> bm!67312 m!1309911))

(declare-fun m!1309915 () Bool)

(assert (=> bm!67312 m!1309915))

(assert (=> b!1419401 m!1309911))

(assert (=> b!1419401 m!1309911))

(declare-fun m!1309917 () Bool)

(assert (=> b!1419401 m!1309917))

(assert (=> b!1419402 m!1309911))

(assert (=> b!1419402 m!1309911))

(assert (=> b!1419402 m!1309913))

(assert (=> b!1419338 d!153007))

(declare-fun d!153013 () Bool)

(declare-fun lt!625789 () (_ BitVec 32))

(declare-fun lt!625788 () (_ BitVec 32))

(assert (=> d!153013 (= lt!625789 (bvmul (bvxor lt!625788 (bvlshr lt!625788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153013 (= lt!625788 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46780 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46780 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153013 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954901 (let ((h!34588 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46780 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46780 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128320 (bvmul (bvxor h!34588 (bvlshr h!34588 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128320 (bvlshr x!128320 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954901 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954901 #b00000000000000000000000000000000))))))

(assert (=> d!153013 (= (toIndex!0 (select (store (arr!46780 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (bvand (bvxor lt!625789 (bvlshr lt!625789 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419343 d!153013))

(declare-fun b!1419475 () Bool)

(declare-fun e!803128 () Bool)

(declare-fun lt!625807 () SeekEntryResult!11065)

(assert (=> b!1419475 (= e!803128 (bvsge (x!128317 lt!625807) #b01111111111111111111111111111110))))

(declare-fun e!803126 () SeekEntryResult!11065)

(declare-fun b!1419476 () Bool)

(assert (=> b!1419476 (= e!803126 (Intermediate!11065 false (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419477 () Bool)

(assert (=> b!1419477 (and (bvsge (index!46654 lt!625807) #b00000000000000000000000000000000) (bvslt (index!46654 lt!625807) (size!47330 a!2831)))))

(declare-fun e!803129 () Bool)

(assert (=> b!1419477 (= e!803129 (= (select (arr!46780 a!2831) (index!46654 lt!625807)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419478 () Bool)

(assert (=> b!1419478 (and (bvsge (index!46654 lt!625807) #b00000000000000000000000000000000) (bvslt (index!46654 lt!625807) (size!47330 a!2831)))))

(declare-fun res!954926 () Bool)

(assert (=> b!1419478 (= res!954926 (= (select (arr!46780 a!2831) (index!46654 lt!625807)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1419478 (=> res!954926 e!803129)))

(declare-fun d!153015 () Bool)

(assert (=> d!153015 e!803128))

(declare-fun c!131763 () Bool)

(assert (=> d!153015 (= c!131763 (and (is-Intermediate!11065 lt!625807) (undefined!11877 lt!625807)))))

(declare-fun e!803127 () SeekEntryResult!11065)

(assert (=> d!153015 (= lt!625807 e!803127)))

(declare-fun c!131761 () Bool)

(assert (=> d!153015 (= c!131761 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625806 () (_ BitVec 64))

(assert (=> d!153015 (= lt!625806 (select (arr!46780 a!2831) (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608)))))

(assert (=> d!153015 (validMask!0 mask!2608)))

(assert (=> d!153015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608) (select (arr!46780 a!2831) j!81) a!2831 mask!2608) lt!625807)))

(declare-fun b!1419479 () Bool)

(assert (=> b!1419479 (= e!803127 (Intermediate!11065 true (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419480 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419480 (= e!803126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46780 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1419481 () Bool)

(declare-fun e!803125 () Bool)

(assert (=> b!1419481 (= e!803128 e!803125)))

(declare-fun res!954927 () Bool)

(assert (=> b!1419481 (= res!954927 (and (is-Intermediate!11065 lt!625807) (not (undefined!11877 lt!625807)) (bvslt (x!128317 lt!625807) #b01111111111111111111111111111110) (bvsge (x!128317 lt!625807) #b00000000000000000000000000000000) (bvsge (x!128317 lt!625807) #b00000000000000000000000000000000)))))

(assert (=> b!1419481 (=> (not res!954927) (not e!803125))))

(declare-fun b!1419482 () Bool)

(assert (=> b!1419482 (= e!803127 e!803126)))

(declare-fun c!131762 () Bool)

(assert (=> b!1419482 (= c!131762 (or (= lt!625806 (select (arr!46780 a!2831) j!81)) (= (bvadd lt!625806 lt!625806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1419483 () Bool)

(assert (=> b!1419483 (and (bvsge (index!46654 lt!625807) #b00000000000000000000000000000000) (bvslt (index!46654 lt!625807) (size!47330 a!2831)))))

(declare-fun res!954928 () Bool)

(assert (=> b!1419483 (= res!954928 (= (select (arr!46780 a!2831) (index!46654 lt!625807)) (select (arr!46780 a!2831) j!81)))))

(assert (=> b!1419483 (=> res!954928 e!803129)))

(assert (=> b!1419483 (= e!803125 e!803129)))

(assert (= (and d!153015 c!131761) b!1419479))

(assert (= (and d!153015 (not c!131761)) b!1419482))

(assert (= (and b!1419482 c!131762) b!1419476))

(assert (= (and b!1419482 (not c!131762)) b!1419480))

(assert (= (and d!153015 c!131763) b!1419475))

(assert (= (and d!153015 (not c!131763)) b!1419481))

(assert (= (and b!1419481 res!954927) b!1419483))

(assert (= (and b!1419483 (not res!954928)) b!1419478))

(assert (= (and b!1419478 (not res!954926)) b!1419477))

(declare-fun m!1309935 () Bool)

(assert (=> b!1419477 m!1309935))

(assert (=> b!1419480 m!1309873))

(declare-fun m!1309937 () Bool)

(assert (=> b!1419480 m!1309937))

(assert (=> b!1419480 m!1309937))

(assert (=> b!1419480 m!1309863))

(declare-fun m!1309939 () Bool)

(assert (=> b!1419480 m!1309939))

(assert (=> b!1419483 m!1309935))

(assert (=> b!1419478 m!1309935))

(assert (=> d!153015 m!1309873))

(declare-fun m!1309941 () Bool)

(assert (=> d!153015 m!1309941))

(assert (=> d!153015 m!1309879))

(assert (=> b!1419339 d!153015))

(declare-fun d!153029 () Bool)

(declare-fun lt!625809 () (_ BitVec 32))

(declare-fun lt!625808 () (_ BitVec 32))

(assert (=> d!153029 (= lt!625809 (bvmul (bvxor lt!625808 (bvlshr lt!625808 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153029 (= lt!625808 ((_ extract 31 0) (bvand (bvxor (select (arr!46780 a!2831) j!81) (bvlshr (select (arr!46780 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153029 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954901 (let ((h!34588 ((_ extract 31 0) (bvand (bvxor (select (arr!46780 a!2831) j!81) (bvlshr (select (arr!46780 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128320 (bvmul (bvxor h!34588 (bvlshr h!34588 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128320 (bvlshr x!128320 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954901 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954901 #b00000000000000000000000000000000))))))

(assert (=> d!153029 (= (toIndex!0 (select (arr!46780 a!2831) j!81) mask!2608) (bvand (bvxor lt!625809 (bvlshr lt!625809 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419339 d!153029))

(declare-fun d!153031 () Bool)

(assert (=> d!153031 (= (validKeyInArray!0 (select (arr!46780 a!2831) i!982)) (and (not (= (select (arr!46780 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46780 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419340 d!153031))

(declare-fun b!1419504 () Bool)

(declare-fun e!803147 () Bool)

(declare-fun call!67321 () Bool)

(assert (=> b!1419504 (= e!803147 call!67321)))

(declare-fun d!153033 () Bool)

(declare-fun res!954939 () Bool)

(declare-fun e!803145 () Bool)

(assert (=> d!153033 (=> res!954939 e!803145)))

(assert (=> d!153033 (= res!954939 (bvsge #b00000000000000000000000000000000 (size!47330 a!2831)))))

(assert (=> d!153033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803145)))

(declare-fun b!1419505 () Bool)

(declare-fun e!803146 () Bool)

(assert (=> b!1419505 (= e!803146 call!67321)))

(declare-fun b!1419506 () Bool)

(assert (=> b!1419506 (= e!803146 e!803147)))

(declare-fun lt!625827 () (_ BitVec 64))

(assert (=> b!1419506 (= lt!625827 (select (arr!46780 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48080 0))(
  ( (Unit!48081) )
))
(declare-fun lt!625826 () Unit!48080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96922 (_ BitVec 64) (_ BitVec 32)) Unit!48080)

(assert (=> b!1419506 (= lt!625826 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625827 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419506 (arrayContainsKey!0 a!2831 lt!625827 #b00000000000000000000000000000000)))

(declare-fun lt!625825 () Unit!48080)

(assert (=> b!1419506 (= lt!625825 lt!625826)))

(declare-fun res!954940 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96922 (_ BitVec 32)) SeekEntryResult!11065)

(assert (=> b!1419506 (= res!954940 (= (seekEntryOrOpen!0 (select (arr!46780 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11065 #b00000000000000000000000000000000)))))

(assert (=> b!1419506 (=> (not res!954940) (not e!803147))))

(declare-fun b!1419507 () Bool)

(assert (=> b!1419507 (= e!803145 e!803146)))

(declare-fun c!131769 () Bool)

(assert (=> b!1419507 (= c!131769 (validKeyInArray!0 (select (arr!46780 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67318 () Bool)

(assert (=> bm!67318 (= call!67321 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153033 (not res!954939)) b!1419507))

(assert (= (and b!1419507 c!131769) b!1419506))

(assert (= (and b!1419507 (not c!131769)) b!1419505))

(assert (= (and b!1419506 res!954940) b!1419504))

(assert (= (or b!1419504 b!1419505) bm!67318))

(assert (=> b!1419506 m!1309911))

(declare-fun m!1309951 () Bool)

(assert (=> b!1419506 m!1309951))

(declare-fun m!1309953 () Bool)

(assert (=> b!1419506 m!1309953))

(assert (=> b!1419506 m!1309911))

(declare-fun m!1309955 () Bool)

(assert (=> b!1419506 m!1309955))

(assert (=> b!1419507 m!1309911))

(assert (=> b!1419507 m!1309911))

(assert (=> b!1419507 m!1309913))

(declare-fun m!1309957 () Bool)

(assert (=> bm!67318 m!1309957))

(assert (=> b!1419345 d!153033))

(push 1)

(assert (not b!1419399))

(assert (not b!1419507))

(assert (not b!1419506))

(assert (not bm!67318))

(assert (not d!153015))

(assert (not b!1419480))

(assert (not bm!67312))

(assert (not b!1419402))

(assert (not b!1419401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

