; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123596 () Bool)

(assert start!123596)

(declare-fun b!1431881 () Bool)

(declare-fun res!965426 () Bool)

(declare-fun e!808513 () Bool)

(assert (=> b!1431881 (=> (not res!965426) (not e!808513))))

(declare-datatypes ((array!97577 0))(
  ( (array!97578 (arr!47095 (Array (_ BitVec 32) (_ BitVec 64))) (size!47646 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97577)

(declare-datatypes ((List!33592 0))(
  ( (Nil!33589) (Cons!33588 (h!34916 (_ BitVec 64)) (t!48278 List!33592)) )
))
(declare-fun arrayNoDuplicates!0 (array!97577 (_ BitVec 32) List!33592) Bool)

(assert (=> b!1431881 (= res!965426 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33589))))

(declare-fun res!965431 () Bool)

(assert (=> start!123596 (=> (not res!965431) (not e!808513))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123596 (= res!965431 (validMask!0 mask!2608))))

(assert (=> start!123596 e!808513))

(assert (=> start!123596 true))

(declare-fun array_inv!36376 (array!97577) Bool)

(assert (=> start!123596 (array_inv!36376 a!2831)))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun e!808514 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun b!1431882 () Bool)

(assert (=> b!1431882 (= e!808514 (not (or (= (select (arr!47095 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47095 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47095 a!2831) index!585) (select (arr!47095 a!2831) j!81)) (not (= (select (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))))

(declare-fun e!808517 () Bool)

(assert (=> b!1431882 e!808517))

(declare-fun res!965432 () Bool)

(assert (=> b!1431882 (=> (not res!965432) (not e!808517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97577 (_ BitVec 32)) Bool)

(assert (=> b!1431882 (= res!965432 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48329 0))(
  ( (Unit!48330) )
))
(declare-fun lt!630289 () Unit!48329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48329)

(assert (=> b!1431882 (= lt!630289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431883 () Bool)

(declare-fun res!965424 () Bool)

(assert (=> b!1431883 (=> (not res!965424) (not e!808514))))

(declare-fun lt!630286 () (_ BitVec 64))

(declare-fun lt!630290 () array!97577)

(declare-datatypes ((SeekEntryResult!11276 0))(
  ( (MissingZero!11276 (index!47496 (_ BitVec 32))) (Found!11276 (index!47497 (_ BitVec 32))) (Intermediate!11276 (undefined!12088 Bool) (index!47498 (_ BitVec 32)) (x!129293 (_ BitVec 32))) (Undefined!11276) (MissingVacant!11276 (index!47499 (_ BitVec 32))) )
))
(declare-fun lt!630288 () SeekEntryResult!11276)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97577 (_ BitVec 32)) SeekEntryResult!11276)

(assert (=> b!1431883 (= res!965424 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630286 lt!630290 mask!2608) lt!630288))))

(declare-fun b!1431884 () Bool)

(declare-fun res!965435 () Bool)

(assert (=> b!1431884 (=> (not res!965435) (not e!808514))))

(declare-fun lt!630287 () SeekEntryResult!11276)

(assert (=> b!1431884 (= res!965435 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630287))))

(declare-fun b!1431885 () Bool)

(declare-fun res!965434 () Bool)

(assert (=> b!1431885 (=> (not res!965434) (not e!808513))))

(assert (=> b!1431885 (= res!965434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431886 () Bool)

(declare-fun res!965437 () Bool)

(assert (=> b!1431886 (=> (not res!965437) (not e!808514))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431886 (= res!965437 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431887 () Bool)

(declare-fun res!965427 () Bool)

(assert (=> b!1431887 (=> (not res!965427) (not e!808517))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97577 (_ BitVec 32)) SeekEntryResult!11276)

(assert (=> b!1431887 (= res!965427 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) (Found!11276 j!81)))))

(declare-fun b!1431888 () Bool)

(assert (=> b!1431888 (= e!808517 (or (= (select (arr!47095 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47095 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47095 a!2831) index!585) (select (arr!47095 a!2831) j!81)) (not (= (select (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1431889 () Bool)

(declare-fun e!808515 () Bool)

(assert (=> b!1431889 (= e!808515 e!808514)))

(declare-fun res!965436 () Bool)

(assert (=> b!1431889 (=> (not res!965436) (not e!808514))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431889 (= res!965436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630286 mask!2608) lt!630286 lt!630290 mask!2608) lt!630288))))

(assert (=> b!1431889 (= lt!630288 (Intermediate!11276 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431889 (= lt!630286 (select (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431889 (= lt!630290 (array!97578 (store (arr!47095 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47646 a!2831)))))

(declare-fun b!1431890 () Bool)

(declare-fun res!965429 () Bool)

(assert (=> b!1431890 (=> (not res!965429) (not e!808513))))

(assert (=> b!1431890 (= res!965429 (and (= (size!47646 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47646 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47646 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431891 () Bool)

(declare-fun res!965430 () Bool)

(assert (=> b!1431891 (=> (not res!965430) (not e!808513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431891 (= res!965430 (validKeyInArray!0 (select (arr!47095 a!2831) j!81)))))

(declare-fun b!1431892 () Bool)

(declare-fun res!965433 () Bool)

(assert (=> b!1431892 (=> (not res!965433) (not e!808513))))

(assert (=> b!1431892 (= res!965433 (validKeyInArray!0 (select (arr!47095 a!2831) i!982)))))

(declare-fun b!1431893 () Bool)

(assert (=> b!1431893 (= e!808513 e!808515)))

(declare-fun res!965425 () Bool)

(assert (=> b!1431893 (=> (not res!965425) (not e!808515))))

(assert (=> b!1431893 (= res!965425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630287))))

(assert (=> b!1431893 (= lt!630287 (Intermediate!11276 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431894 () Bool)

(declare-fun res!965428 () Bool)

(assert (=> b!1431894 (=> (not res!965428) (not e!808513))))

(assert (=> b!1431894 (= res!965428 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47646 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47646 a!2831))))))

(assert (= (and start!123596 res!965431) b!1431890))

(assert (= (and b!1431890 res!965429) b!1431892))

(assert (= (and b!1431892 res!965433) b!1431891))

(assert (= (and b!1431891 res!965430) b!1431885))

(assert (= (and b!1431885 res!965434) b!1431881))

(assert (= (and b!1431881 res!965426) b!1431894))

(assert (= (and b!1431894 res!965428) b!1431893))

(assert (= (and b!1431893 res!965425) b!1431889))

(assert (= (and b!1431889 res!965436) b!1431884))

(assert (= (and b!1431884 res!965435) b!1431883))

(assert (= (and b!1431883 res!965424) b!1431886))

(assert (= (and b!1431886 res!965437) b!1431882))

(assert (= (and b!1431882 res!965432) b!1431887))

(assert (= (and b!1431887 res!965427) b!1431888))

(declare-fun m!1321971 () Bool)

(assert (=> b!1431888 m!1321971))

(declare-fun m!1321973 () Bool)

(assert (=> b!1431888 m!1321973))

(declare-fun m!1321975 () Bool)

(assert (=> b!1431888 m!1321975))

(declare-fun m!1321977 () Bool)

(assert (=> b!1431888 m!1321977))

(declare-fun m!1321979 () Bool)

(assert (=> b!1431889 m!1321979))

(assert (=> b!1431889 m!1321979))

(declare-fun m!1321981 () Bool)

(assert (=> b!1431889 m!1321981))

(assert (=> b!1431889 m!1321975))

(declare-fun m!1321983 () Bool)

(assert (=> b!1431889 m!1321983))

(assert (=> b!1431887 m!1321973))

(assert (=> b!1431887 m!1321973))

(declare-fun m!1321985 () Bool)

(assert (=> b!1431887 m!1321985))

(declare-fun m!1321987 () Bool)

(assert (=> b!1431885 m!1321987))

(assert (=> b!1431893 m!1321973))

(assert (=> b!1431893 m!1321973))

(declare-fun m!1321989 () Bool)

(assert (=> b!1431893 m!1321989))

(assert (=> b!1431893 m!1321989))

(assert (=> b!1431893 m!1321973))

(declare-fun m!1321991 () Bool)

(assert (=> b!1431893 m!1321991))

(declare-fun m!1321993 () Bool)

(assert (=> b!1431883 m!1321993))

(declare-fun m!1321995 () Bool)

(assert (=> start!123596 m!1321995))

(declare-fun m!1321997 () Bool)

(assert (=> start!123596 m!1321997))

(assert (=> b!1431882 m!1321975))

(assert (=> b!1431882 m!1321977))

(assert (=> b!1431882 m!1321971))

(declare-fun m!1321999 () Bool)

(assert (=> b!1431882 m!1321999))

(assert (=> b!1431882 m!1321973))

(declare-fun m!1322001 () Bool)

(assert (=> b!1431882 m!1322001))

(declare-fun m!1322003 () Bool)

(assert (=> b!1431881 m!1322003))

(assert (=> b!1431891 m!1321973))

(assert (=> b!1431891 m!1321973))

(declare-fun m!1322005 () Bool)

(assert (=> b!1431891 m!1322005))

(assert (=> b!1431884 m!1321973))

(assert (=> b!1431884 m!1321973))

(declare-fun m!1322007 () Bool)

(assert (=> b!1431884 m!1322007))

(declare-fun m!1322009 () Bool)

(assert (=> b!1431892 m!1322009))

(assert (=> b!1431892 m!1322009))

(declare-fun m!1322011 () Bool)

(assert (=> b!1431892 m!1322011))

(check-sat (not b!1431891) (not b!1431883) (not b!1431892) (not b!1431882) (not b!1431881) (not b!1431889) (not b!1431884) (not b!1431893) (not b!1431885) (not b!1431887) (not start!123596))
(check-sat)
(get-model)

(declare-fun d!154099 () Bool)

(declare-fun res!965526 () Bool)

(declare-fun e!808555 () Bool)

(assert (=> d!154099 (=> res!965526 e!808555)))

(assert (=> d!154099 (= res!965526 (bvsge j!81 (size!47646 a!2831)))))

(assert (=> d!154099 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808555)))

(declare-fun b!1431987 () Bool)

(declare-fun e!808556 () Bool)

(declare-fun call!67509 () Bool)

(assert (=> b!1431987 (= e!808556 call!67509)))

(declare-fun bm!67506 () Bool)

(assert (=> bm!67506 (= call!67509 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431988 () Bool)

(declare-fun e!808554 () Bool)

(assert (=> b!1431988 (= e!808554 e!808556)))

(declare-fun lt!630327 () (_ BitVec 64))

(assert (=> b!1431988 (= lt!630327 (select (arr!47095 a!2831) j!81))))

(declare-fun lt!630329 () Unit!48329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97577 (_ BitVec 64) (_ BitVec 32)) Unit!48329)

(assert (=> b!1431988 (= lt!630329 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630327 j!81))))

(declare-fun arrayContainsKey!0 (array!97577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1431988 (arrayContainsKey!0 a!2831 lt!630327 #b00000000000000000000000000000000)))

(declare-fun lt!630328 () Unit!48329)

(assert (=> b!1431988 (= lt!630328 lt!630329)))

(declare-fun res!965527 () Bool)

(assert (=> b!1431988 (= res!965527 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) (Found!11276 j!81)))))

(assert (=> b!1431988 (=> (not res!965527) (not e!808556))))

(declare-fun b!1431989 () Bool)

(assert (=> b!1431989 (= e!808555 e!808554)))

(declare-fun c!132733 () Bool)

(assert (=> b!1431989 (= c!132733 (validKeyInArray!0 (select (arr!47095 a!2831) j!81)))))

(declare-fun b!1431990 () Bool)

(assert (=> b!1431990 (= e!808554 call!67509)))

(assert (= (and d!154099 (not res!965526)) b!1431989))

(assert (= (and b!1431989 c!132733) b!1431988))

(assert (= (and b!1431989 (not c!132733)) b!1431990))

(assert (= (and b!1431988 res!965527) b!1431987))

(assert (= (or b!1431987 b!1431990) bm!67506))

(declare-fun m!1322097 () Bool)

(assert (=> bm!67506 m!1322097))

(assert (=> b!1431988 m!1321973))

(declare-fun m!1322099 () Bool)

(assert (=> b!1431988 m!1322099))

(declare-fun m!1322101 () Bool)

(assert (=> b!1431988 m!1322101))

(assert (=> b!1431988 m!1321973))

(assert (=> b!1431988 m!1321985))

(assert (=> b!1431989 m!1321973))

(assert (=> b!1431989 m!1321973))

(assert (=> b!1431989 m!1322005))

(assert (=> b!1431882 d!154099))

(declare-fun d!154101 () Bool)

(assert (=> d!154101 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630332 () Unit!48329)

(declare-fun choose!38 (array!97577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48329)

(assert (=> d!154101 (= lt!630332 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154101 (validMask!0 mask!2608)))

(assert (=> d!154101 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630332)))

(declare-fun bs!41677 () Bool)

(assert (= bs!41677 d!154101))

(assert (=> bs!41677 m!1321999))

(declare-fun m!1322103 () Bool)

(assert (=> bs!41677 m!1322103))

(assert (=> bs!41677 m!1321995))

(assert (=> b!1431882 d!154101))

(declare-fun e!808571 () SeekEntryResult!11276)

(declare-fun b!1432009 () Bool)

(assert (=> b!1432009 (= e!808571 (Intermediate!11276 true (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432010 () Bool)

(declare-fun lt!630337 () SeekEntryResult!11276)

(assert (=> b!1432010 (and (bvsge (index!47498 lt!630337) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630337) (size!47646 a!2831)))))

(declare-fun e!808569 () Bool)

(assert (=> b!1432010 (= e!808569 (= (select (arr!47095 a!2831) (index!47498 lt!630337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432011 () Bool)

(declare-fun e!808570 () Bool)

(declare-fun e!808568 () Bool)

(assert (=> b!1432011 (= e!808570 e!808568)))

(declare-fun res!965536 () Bool)

(get-info :version)

(assert (=> b!1432011 (= res!965536 (and ((_ is Intermediate!11276) lt!630337) (not (undefined!12088 lt!630337)) (bvslt (x!129293 lt!630337) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630337) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630337) #b00000000000000000000000000000000)))))

(assert (=> b!1432011 (=> (not res!965536) (not e!808568))))

(declare-fun b!1432012 () Bool)

(declare-fun e!808567 () SeekEntryResult!11276)

(assert (=> b!1432012 (= e!808567 (Intermediate!11276 false (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154103 () Bool)

(assert (=> d!154103 e!808570))

(declare-fun c!132740 () Bool)

(assert (=> d!154103 (= c!132740 (and ((_ is Intermediate!11276) lt!630337) (undefined!12088 lt!630337)))))

(assert (=> d!154103 (= lt!630337 e!808571)))

(declare-fun c!132741 () Bool)

(assert (=> d!154103 (= c!132741 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!630338 () (_ BitVec 64))

(assert (=> d!154103 (= lt!630338 (select (arr!47095 a!2831) (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608)))))

(assert (=> d!154103 (validMask!0 mask!2608)))

(assert (=> d!154103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630337)))

(declare-fun b!1432013 () Bool)

(assert (=> b!1432013 (and (bvsge (index!47498 lt!630337) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630337) (size!47646 a!2831)))))

(declare-fun res!965535 () Bool)

(assert (=> b!1432013 (= res!965535 (= (select (arr!47095 a!2831) (index!47498 lt!630337)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432013 (=> res!965535 e!808569)))

(declare-fun b!1432014 () Bool)

(assert (=> b!1432014 (= e!808570 (bvsge (x!129293 lt!630337) #b01111111111111111111111111111110))))

(declare-fun b!1432015 () Bool)

(assert (=> b!1432015 (and (bvsge (index!47498 lt!630337) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630337) (size!47646 a!2831)))))

(declare-fun res!965534 () Bool)

(assert (=> b!1432015 (= res!965534 (= (select (arr!47095 a!2831) (index!47498 lt!630337)) (select (arr!47095 a!2831) j!81)))))

(assert (=> b!1432015 (=> res!965534 e!808569)))

(assert (=> b!1432015 (= e!808568 e!808569)))

(declare-fun b!1432016 () Bool)

(assert (=> b!1432016 (= e!808571 e!808567)))

(declare-fun c!132742 () Bool)

(assert (=> b!1432016 (= c!132742 (or (= lt!630338 (select (arr!47095 a!2831) j!81)) (= (bvadd lt!630338 lt!630338) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432017 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432017 (= e!808567 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154103 c!132741) b!1432009))

(assert (= (and d!154103 (not c!132741)) b!1432016))

(assert (= (and b!1432016 c!132742) b!1432012))

(assert (= (and b!1432016 (not c!132742)) b!1432017))

(assert (= (and d!154103 c!132740) b!1432014))

(assert (= (and d!154103 (not c!132740)) b!1432011))

(assert (= (and b!1432011 res!965536) b!1432015))

(assert (= (and b!1432015 (not res!965534)) b!1432013))

(assert (= (and b!1432013 (not res!965535)) b!1432010))

(declare-fun m!1322105 () Bool)

(assert (=> b!1432013 m!1322105))

(assert (=> b!1432015 m!1322105))

(assert (=> b!1432017 m!1321989))

(declare-fun m!1322107 () Bool)

(assert (=> b!1432017 m!1322107))

(assert (=> b!1432017 m!1322107))

(assert (=> b!1432017 m!1321973))

(declare-fun m!1322109 () Bool)

(assert (=> b!1432017 m!1322109))

(assert (=> d!154103 m!1321989))

(declare-fun m!1322111 () Bool)

(assert (=> d!154103 m!1322111))

(assert (=> d!154103 m!1321995))

(assert (=> b!1432010 m!1322105))

(assert (=> b!1431893 d!154103))

(declare-fun d!154105 () Bool)

(declare-fun lt!630344 () (_ BitVec 32))

(declare-fun lt!630343 () (_ BitVec 32))

(assert (=> d!154105 (= lt!630344 (bvmul (bvxor lt!630343 (bvlshr lt!630343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154105 (= lt!630343 ((_ extract 31 0) (bvand (bvxor (select (arr!47095 a!2831) j!81) (bvlshr (select (arr!47095 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154105 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965537 (let ((h!34919 ((_ extract 31 0) (bvand (bvxor (select (arr!47095 a!2831) j!81) (bvlshr (select (arr!47095 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129297 (bvmul (bvxor h!34919 (bvlshr h!34919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129297 (bvlshr x!129297 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965537 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965537 #b00000000000000000000000000000000))))))

(assert (=> d!154105 (= (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvand (bvxor lt!630344 (bvlshr lt!630344 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431893 d!154105))

(declare-fun b!1432018 () Bool)

(declare-fun e!808576 () SeekEntryResult!11276)

(assert (=> b!1432018 (= e!808576 (Intermediate!11276 true index!585 x!605))))

(declare-fun b!1432019 () Bool)

(declare-fun lt!630345 () SeekEntryResult!11276)

(assert (=> b!1432019 (and (bvsge (index!47498 lt!630345) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630345) (size!47646 lt!630290)))))

(declare-fun e!808574 () Bool)

(assert (=> b!1432019 (= e!808574 (= (select (arr!47095 lt!630290) (index!47498 lt!630345)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432020 () Bool)

(declare-fun e!808575 () Bool)

(declare-fun e!808573 () Bool)

(assert (=> b!1432020 (= e!808575 e!808573)))

(declare-fun res!965540 () Bool)

(assert (=> b!1432020 (= res!965540 (and ((_ is Intermediate!11276) lt!630345) (not (undefined!12088 lt!630345)) (bvslt (x!129293 lt!630345) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630345) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630345) x!605)))))

(assert (=> b!1432020 (=> (not res!965540) (not e!808573))))

(declare-fun b!1432021 () Bool)

(declare-fun e!808572 () SeekEntryResult!11276)

(assert (=> b!1432021 (= e!808572 (Intermediate!11276 false index!585 x!605))))

(declare-fun d!154111 () Bool)

(assert (=> d!154111 e!808575))

(declare-fun c!132743 () Bool)

(assert (=> d!154111 (= c!132743 (and ((_ is Intermediate!11276) lt!630345) (undefined!12088 lt!630345)))))

(assert (=> d!154111 (= lt!630345 e!808576)))

(declare-fun c!132744 () Bool)

(assert (=> d!154111 (= c!132744 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!630346 () (_ BitVec 64))

(assert (=> d!154111 (= lt!630346 (select (arr!47095 lt!630290) index!585))))

(assert (=> d!154111 (validMask!0 mask!2608)))

(assert (=> d!154111 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630286 lt!630290 mask!2608) lt!630345)))

(declare-fun b!1432022 () Bool)

(assert (=> b!1432022 (and (bvsge (index!47498 lt!630345) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630345) (size!47646 lt!630290)))))

(declare-fun res!965539 () Bool)

(assert (=> b!1432022 (= res!965539 (= (select (arr!47095 lt!630290) (index!47498 lt!630345)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432022 (=> res!965539 e!808574)))

(declare-fun b!1432023 () Bool)

(assert (=> b!1432023 (= e!808575 (bvsge (x!129293 lt!630345) #b01111111111111111111111111111110))))

(declare-fun b!1432024 () Bool)

(assert (=> b!1432024 (and (bvsge (index!47498 lt!630345) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630345) (size!47646 lt!630290)))))

(declare-fun res!965538 () Bool)

(assert (=> b!1432024 (= res!965538 (= (select (arr!47095 lt!630290) (index!47498 lt!630345)) lt!630286))))

(assert (=> b!1432024 (=> res!965538 e!808574)))

(assert (=> b!1432024 (= e!808573 e!808574)))

(declare-fun b!1432025 () Bool)

(assert (=> b!1432025 (= e!808576 e!808572)))

(declare-fun c!132745 () Bool)

(assert (=> b!1432025 (= c!132745 (or (= lt!630346 lt!630286) (= (bvadd lt!630346 lt!630346) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432026 () Bool)

(assert (=> b!1432026 (= e!808572 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!630286 lt!630290 mask!2608))))

(assert (= (and d!154111 c!132744) b!1432018))

(assert (= (and d!154111 (not c!132744)) b!1432025))

(assert (= (and b!1432025 c!132745) b!1432021))

(assert (= (and b!1432025 (not c!132745)) b!1432026))

(assert (= (and d!154111 c!132743) b!1432023))

(assert (= (and d!154111 (not c!132743)) b!1432020))

(assert (= (and b!1432020 res!965540) b!1432024))

(assert (= (and b!1432024 (not res!965538)) b!1432022))

(assert (= (and b!1432022 (not res!965539)) b!1432019))

(declare-fun m!1322113 () Bool)

(assert (=> b!1432022 m!1322113))

(assert (=> b!1432024 m!1322113))

(declare-fun m!1322115 () Bool)

(assert (=> b!1432026 m!1322115))

(assert (=> b!1432026 m!1322115))

(declare-fun m!1322117 () Bool)

(assert (=> b!1432026 m!1322117))

(declare-fun m!1322119 () Bool)

(assert (=> d!154111 m!1322119))

(assert (=> d!154111 m!1321995))

(assert (=> b!1432019 m!1322113))

(assert (=> b!1431883 d!154111))

(declare-fun b!1432049 () Bool)

(declare-fun e!808596 () Bool)

(declare-fun contains!9907 (List!33592 (_ BitVec 64)) Bool)

(assert (=> b!1432049 (= e!808596 (contains!9907 Nil!33589 (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432050 () Bool)

(declare-fun e!808597 () Bool)

(declare-fun e!808595 () Bool)

(assert (=> b!1432050 (= e!808597 e!808595)))

(declare-fun c!132751 () Bool)

(assert (=> b!1432050 (= c!132751 (validKeyInArray!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432051 () Bool)

(declare-fun call!67515 () Bool)

(assert (=> b!1432051 (= e!808595 call!67515)))

(declare-fun bm!67512 () Bool)

(assert (=> bm!67512 (= call!67515 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132751 (Cons!33588 (select (arr!47095 a!2831) #b00000000000000000000000000000000) Nil!33589) Nil!33589)))))

(declare-fun d!154113 () Bool)

(declare-fun res!965553 () Bool)

(declare-fun e!808594 () Bool)

(assert (=> d!154113 (=> res!965553 e!808594)))

(assert (=> d!154113 (= res!965553 (bvsge #b00000000000000000000000000000000 (size!47646 a!2831)))))

(assert (=> d!154113 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33589) e!808594)))

(declare-fun b!1432052 () Bool)

(assert (=> b!1432052 (= e!808594 e!808597)))

(declare-fun res!965554 () Bool)

(assert (=> b!1432052 (=> (not res!965554) (not e!808597))))

(assert (=> b!1432052 (= res!965554 (not e!808596))))

(declare-fun res!965555 () Bool)

(assert (=> b!1432052 (=> (not res!965555) (not e!808596))))

(assert (=> b!1432052 (= res!965555 (validKeyInArray!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432053 () Bool)

(assert (=> b!1432053 (= e!808595 call!67515)))

(assert (= (and d!154113 (not res!965553)) b!1432052))

(assert (= (and b!1432052 res!965555) b!1432049))

(assert (= (and b!1432052 res!965554) b!1432050))

(assert (= (and b!1432050 c!132751) b!1432053))

(assert (= (and b!1432050 (not c!132751)) b!1432051))

(assert (= (or b!1432053 b!1432051) bm!67512))

(declare-fun m!1322127 () Bool)

(assert (=> b!1432049 m!1322127))

(assert (=> b!1432049 m!1322127))

(declare-fun m!1322129 () Bool)

(assert (=> b!1432049 m!1322129))

(assert (=> b!1432050 m!1322127))

(assert (=> b!1432050 m!1322127))

(declare-fun m!1322131 () Bool)

(assert (=> b!1432050 m!1322131))

(assert (=> bm!67512 m!1322127))

(declare-fun m!1322133 () Bool)

(assert (=> bm!67512 m!1322133))

(assert (=> b!1432052 m!1322127))

(assert (=> b!1432052 m!1322127))

(assert (=> b!1432052 m!1322131))

(assert (=> b!1431881 d!154113))

(declare-fun d!154121 () Bool)

(assert (=> d!154121 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123596 d!154121))

(declare-fun d!154127 () Bool)

(assert (=> d!154127 (= (array_inv!36376 a!2831) (bvsge (size!47646 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123596 d!154127))

(declare-fun d!154129 () Bool)

(assert (=> d!154129 (= (validKeyInArray!0 (select (arr!47095 a!2831) i!982)) (and (not (= (select (arr!47095 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47095 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431892 d!154129))

(declare-fun b!1432153 () Bool)

(declare-fun e!808656 () SeekEntryResult!11276)

(assert (=> b!1432153 (= e!808656 Undefined!11276)))

(declare-fun lt!630389 () SeekEntryResult!11276)

(declare-fun b!1432154 () Bool)

(declare-fun e!808658 () SeekEntryResult!11276)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97577 (_ BitVec 32)) SeekEntryResult!11276)

(assert (=> b!1432154 (= e!808658 (seekKeyOrZeroReturnVacant!0 (x!129293 lt!630389) (index!47498 lt!630389) (index!47498 lt!630389) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154131 () Bool)

(declare-fun lt!630387 () SeekEntryResult!11276)

(assert (=> d!154131 (and (or ((_ is Undefined!11276) lt!630387) (not ((_ is Found!11276) lt!630387)) (and (bvsge (index!47497 lt!630387) #b00000000000000000000000000000000) (bvslt (index!47497 lt!630387) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630387) ((_ is Found!11276) lt!630387) (not ((_ is MissingZero!11276) lt!630387)) (and (bvsge (index!47496 lt!630387) #b00000000000000000000000000000000) (bvslt (index!47496 lt!630387) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630387) ((_ is Found!11276) lt!630387) ((_ is MissingZero!11276) lt!630387) (not ((_ is MissingVacant!11276) lt!630387)) (and (bvsge (index!47499 lt!630387) #b00000000000000000000000000000000) (bvslt (index!47499 lt!630387) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630387) (ite ((_ is Found!11276) lt!630387) (= (select (arr!47095 a!2831) (index!47497 lt!630387)) (select (arr!47095 a!2831) j!81)) (ite ((_ is MissingZero!11276) lt!630387) (= (select (arr!47095 a!2831) (index!47496 lt!630387)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11276) lt!630387) (= (select (arr!47095 a!2831) (index!47499 lt!630387)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154131 (= lt!630387 e!808656)))

(declare-fun c!132786 () Bool)

(assert (=> d!154131 (= c!132786 (and ((_ is Intermediate!11276) lt!630389) (undefined!12088 lt!630389)))))

(assert (=> d!154131 (= lt!630389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154131 (validMask!0 mask!2608)))

(assert (=> d!154131 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630387)))

(declare-fun b!1432155 () Bool)

(declare-fun e!808657 () SeekEntryResult!11276)

(assert (=> b!1432155 (= e!808657 (Found!11276 (index!47498 lt!630389)))))

(declare-fun b!1432156 () Bool)

(assert (=> b!1432156 (= e!808656 e!808657)))

(declare-fun lt!630388 () (_ BitVec 64))

(assert (=> b!1432156 (= lt!630388 (select (arr!47095 a!2831) (index!47498 lt!630389)))))

(declare-fun c!132785 () Bool)

(assert (=> b!1432156 (= c!132785 (= lt!630388 (select (arr!47095 a!2831) j!81)))))

(declare-fun b!1432157 () Bool)

(declare-fun c!132787 () Bool)

(assert (=> b!1432157 (= c!132787 (= lt!630388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432157 (= e!808657 e!808658)))

(declare-fun b!1432158 () Bool)

(assert (=> b!1432158 (= e!808658 (MissingZero!11276 (index!47498 lt!630389)))))

(assert (= (and d!154131 c!132786) b!1432153))

(assert (= (and d!154131 (not c!132786)) b!1432156))

(assert (= (and b!1432156 c!132785) b!1432155))

(assert (= (and b!1432156 (not c!132785)) b!1432157))

(assert (= (and b!1432157 c!132787) b!1432158))

(assert (= (and b!1432157 (not c!132787)) b!1432154))

(assert (=> b!1432154 m!1321973))

(declare-fun m!1322173 () Bool)

(assert (=> b!1432154 m!1322173))

(declare-fun m!1322175 () Bool)

(assert (=> d!154131 m!1322175))

(assert (=> d!154131 m!1321973))

(assert (=> d!154131 m!1321989))

(assert (=> d!154131 m!1321995))

(declare-fun m!1322177 () Bool)

(assert (=> d!154131 m!1322177))

(assert (=> d!154131 m!1321989))

(assert (=> d!154131 m!1321973))

(assert (=> d!154131 m!1321991))

(declare-fun m!1322179 () Bool)

(assert (=> d!154131 m!1322179))

(declare-fun m!1322181 () Bool)

(assert (=> b!1432156 m!1322181))

(assert (=> b!1431887 d!154131))

(declare-fun d!154145 () Bool)

(declare-fun res!965591 () Bool)

(declare-fun e!808660 () Bool)

(assert (=> d!154145 (=> res!965591 e!808660)))

(assert (=> d!154145 (= res!965591 (bvsge #b00000000000000000000000000000000 (size!47646 a!2831)))))

(assert (=> d!154145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808660)))

(declare-fun b!1432159 () Bool)

(declare-fun e!808661 () Bool)

(declare-fun call!67519 () Bool)

(assert (=> b!1432159 (= e!808661 call!67519)))

(declare-fun bm!67516 () Bool)

(assert (=> bm!67516 (= call!67519 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432160 () Bool)

(declare-fun e!808659 () Bool)

(assert (=> b!1432160 (= e!808659 e!808661)))

(declare-fun lt!630390 () (_ BitVec 64))

(assert (=> b!1432160 (= lt!630390 (select (arr!47095 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630392 () Unit!48329)

(assert (=> b!1432160 (= lt!630392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630390 #b00000000000000000000000000000000))))

(assert (=> b!1432160 (arrayContainsKey!0 a!2831 lt!630390 #b00000000000000000000000000000000)))

(declare-fun lt!630391 () Unit!48329)

(assert (=> b!1432160 (= lt!630391 lt!630392)))

(declare-fun res!965592 () Bool)

(assert (=> b!1432160 (= res!965592 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11276 #b00000000000000000000000000000000)))))

(assert (=> b!1432160 (=> (not res!965592) (not e!808661))))

(declare-fun b!1432161 () Bool)

(assert (=> b!1432161 (= e!808660 e!808659)))

(declare-fun c!132788 () Bool)

(assert (=> b!1432161 (= c!132788 (validKeyInArray!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432162 () Bool)

(assert (=> b!1432162 (= e!808659 call!67519)))

(assert (= (and d!154145 (not res!965591)) b!1432161))

(assert (= (and b!1432161 c!132788) b!1432160))

(assert (= (and b!1432161 (not c!132788)) b!1432162))

(assert (= (and b!1432160 res!965592) b!1432159))

(assert (= (or b!1432159 b!1432162) bm!67516))

(declare-fun m!1322183 () Bool)

(assert (=> bm!67516 m!1322183))

(assert (=> b!1432160 m!1322127))

(declare-fun m!1322185 () Bool)

(assert (=> b!1432160 m!1322185))

(declare-fun m!1322187 () Bool)

(assert (=> b!1432160 m!1322187))

(assert (=> b!1432160 m!1322127))

(declare-fun m!1322189 () Bool)

(assert (=> b!1432160 m!1322189))

(assert (=> b!1432161 m!1322127))

(assert (=> b!1432161 m!1322127))

(assert (=> b!1432161 m!1322131))

(assert (=> b!1431885 d!154145))

(declare-fun d!154147 () Bool)

(assert (=> d!154147 (= (validKeyInArray!0 (select (arr!47095 a!2831) j!81)) (and (not (= (select (arr!47095 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47095 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1431891 d!154147))

(declare-fun b!1432163 () Bool)

(declare-fun e!808666 () SeekEntryResult!11276)

(assert (=> b!1432163 (= e!808666 (Intermediate!11276 true (toIndex!0 lt!630286 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1432164 () Bool)

(declare-fun lt!630393 () SeekEntryResult!11276)

(assert (=> b!1432164 (and (bvsge (index!47498 lt!630393) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630393) (size!47646 lt!630290)))))

(declare-fun e!808664 () Bool)

(assert (=> b!1432164 (= e!808664 (= (select (arr!47095 lt!630290) (index!47498 lt!630393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432165 () Bool)

(declare-fun e!808665 () Bool)

(declare-fun e!808663 () Bool)

(assert (=> b!1432165 (= e!808665 e!808663)))

(declare-fun res!965595 () Bool)

(assert (=> b!1432165 (= res!965595 (and ((_ is Intermediate!11276) lt!630393) (not (undefined!12088 lt!630393)) (bvslt (x!129293 lt!630393) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630393) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630393) #b00000000000000000000000000000000)))))

(assert (=> b!1432165 (=> (not res!965595) (not e!808663))))

(declare-fun b!1432166 () Bool)

(declare-fun e!808662 () SeekEntryResult!11276)

(assert (=> b!1432166 (= e!808662 (Intermediate!11276 false (toIndex!0 lt!630286 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154149 () Bool)

(assert (=> d!154149 e!808665))

(declare-fun c!132789 () Bool)

(assert (=> d!154149 (= c!132789 (and ((_ is Intermediate!11276) lt!630393) (undefined!12088 lt!630393)))))

(assert (=> d!154149 (= lt!630393 e!808666)))

(declare-fun c!132790 () Bool)

(assert (=> d!154149 (= c!132790 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!630394 () (_ BitVec 64))

(assert (=> d!154149 (= lt!630394 (select (arr!47095 lt!630290) (toIndex!0 lt!630286 mask!2608)))))

(assert (=> d!154149 (validMask!0 mask!2608)))

(assert (=> d!154149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630286 mask!2608) lt!630286 lt!630290 mask!2608) lt!630393)))

(declare-fun b!1432167 () Bool)

(assert (=> b!1432167 (and (bvsge (index!47498 lt!630393) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630393) (size!47646 lt!630290)))))

(declare-fun res!965594 () Bool)

(assert (=> b!1432167 (= res!965594 (= (select (arr!47095 lt!630290) (index!47498 lt!630393)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432167 (=> res!965594 e!808664)))

(declare-fun b!1432168 () Bool)

(assert (=> b!1432168 (= e!808665 (bvsge (x!129293 lt!630393) #b01111111111111111111111111111110))))

(declare-fun b!1432169 () Bool)

(assert (=> b!1432169 (and (bvsge (index!47498 lt!630393) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630393) (size!47646 lt!630290)))))

(declare-fun res!965593 () Bool)

(assert (=> b!1432169 (= res!965593 (= (select (arr!47095 lt!630290) (index!47498 lt!630393)) lt!630286))))

(assert (=> b!1432169 (=> res!965593 e!808664)))

(assert (=> b!1432169 (= e!808663 e!808664)))

(declare-fun b!1432170 () Bool)

(assert (=> b!1432170 (= e!808666 e!808662)))

(declare-fun c!132791 () Bool)

(assert (=> b!1432170 (= c!132791 (or (= lt!630394 lt!630286) (= (bvadd lt!630394 lt!630394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432171 () Bool)

(assert (=> b!1432171 (= e!808662 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!630286 lt!630290 mask!2608))))

(assert (= (and d!154149 c!132790) b!1432163))

(assert (= (and d!154149 (not c!132790)) b!1432170))

(assert (= (and b!1432170 c!132791) b!1432166))

(assert (= (and b!1432170 (not c!132791)) b!1432171))

(assert (= (and d!154149 c!132789) b!1432168))

(assert (= (and d!154149 (not c!132789)) b!1432165))

(assert (= (and b!1432165 res!965595) b!1432169))

(assert (= (and b!1432169 (not res!965593)) b!1432167))

(assert (= (and b!1432167 (not res!965594)) b!1432164))

(declare-fun m!1322191 () Bool)

(assert (=> b!1432167 m!1322191))

(assert (=> b!1432169 m!1322191))

(assert (=> b!1432171 m!1321979))

(declare-fun m!1322193 () Bool)

(assert (=> b!1432171 m!1322193))

(assert (=> b!1432171 m!1322193))

(declare-fun m!1322195 () Bool)

(assert (=> b!1432171 m!1322195))

(assert (=> d!154149 m!1321979))

(declare-fun m!1322197 () Bool)

(assert (=> d!154149 m!1322197))

(assert (=> d!154149 m!1321995))

(assert (=> b!1432164 m!1322191))

(assert (=> b!1431889 d!154149))

(declare-fun d!154151 () Bool)

(declare-fun lt!630400 () (_ BitVec 32))

(declare-fun lt!630399 () (_ BitVec 32))

(assert (=> d!154151 (= lt!630400 (bvmul (bvxor lt!630399 (bvlshr lt!630399 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154151 (= lt!630399 ((_ extract 31 0) (bvand (bvxor lt!630286 (bvlshr lt!630286 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154151 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965537 (let ((h!34919 ((_ extract 31 0) (bvand (bvxor lt!630286 (bvlshr lt!630286 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129297 (bvmul (bvxor h!34919 (bvlshr h!34919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129297 (bvlshr x!129297 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965537 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965537 #b00000000000000000000000000000000))))))

(assert (=> d!154151 (= (toIndex!0 lt!630286 mask!2608) (bvand (bvxor lt!630400 (bvlshr lt!630400 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1431889 d!154151))

(declare-fun b!1432182 () Bool)

(declare-fun e!808679 () SeekEntryResult!11276)

(assert (=> b!1432182 (= e!808679 (Intermediate!11276 true index!585 x!605))))

(declare-fun b!1432183 () Bool)

(declare-fun lt!630401 () SeekEntryResult!11276)

(assert (=> b!1432183 (and (bvsge (index!47498 lt!630401) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630401) (size!47646 a!2831)))))

(declare-fun e!808677 () Bool)

(assert (=> b!1432183 (= e!808677 (= (select (arr!47095 a!2831) (index!47498 lt!630401)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432184 () Bool)

(declare-fun e!808678 () Bool)

(declare-fun e!808676 () Bool)

(assert (=> b!1432184 (= e!808678 e!808676)))

(declare-fun res!965604 () Bool)

(assert (=> b!1432184 (= res!965604 (and ((_ is Intermediate!11276) lt!630401) (not (undefined!12088 lt!630401)) (bvslt (x!129293 lt!630401) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630401) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630401) x!605)))))

(assert (=> b!1432184 (=> (not res!965604) (not e!808676))))

(declare-fun b!1432185 () Bool)

(declare-fun e!808675 () SeekEntryResult!11276)

(assert (=> b!1432185 (= e!808675 (Intermediate!11276 false index!585 x!605))))

(declare-fun d!154153 () Bool)

(assert (=> d!154153 e!808678))

(declare-fun c!132794 () Bool)

(assert (=> d!154153 (= c!132794 (and ((_ is Intermediate!11276) lt!630401) (undefined!12088 lt!630401)))))

(assert (=> d!154153 (= lt!630401 e!808679)))

(declare-fun c!132795 () Bool)

(assert (=> d!154153 (= c!132795 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!630402 () (_ BitVec 64))

(assert (=> d!154153 (= lt!630402 (select (arr!47095 a!2831) index!585))))

(assert (=> d!154153 (validMask!0 mask!2608)))

(assert (=> d!154153 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630401)))

(declare-fun b!1432186 () Bool)

(assert (=> b!1432186 (and (bvsge (index!47498 lt!630401) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630401) (size!47646 a!2831)))))

(declare-fun res!965603 () Bool)

(assert (=> b!1432186 (= res!965603 (= (select (arr!47095 a!2831) (index!47498 lt!630401)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432186 (=> res!965603 e!808677)))

(declare-fun b!1432187 () Bool)

(assert (=> b!1432187 (= e!808678 (bvsge (x!129293 lt!630401) #b01111111111111111111111111111110))))

(declare-fun b!1432188 () Bool)

(assert (=> b!1432188 (and (bvsge (index!47498 lt!630401) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630401) (size!47646 a!2831)))))

(declare-fun res!965602 () Bool)

(assert (=> b!1432188 (= res!965602 (= (select (arr!47095 a!2831) (index!47498 lt!630401)) (select (arr!47095 a!2831) j!81)))))

(assert (=> b!1432188 (=> res!965602 e!808677)))

(assert (=> b!1432188 (= e!808676 e!808677)))

(declare-fun b!1432189 () Bool)

(assert (=> b!1432189 (= e!808679 e!808675)))

(declare-fun c!132796 () Bool)

(assert (=> b!1432189 (= c!132796 (or (= lt!630402 (select (arr!47095 a!2831) j!81)) (= (bvadd lt!630402 lt!630402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432190 () Bool)

(assert (=> b!1432190 (= e!808675 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154153 c!132795) b!1432182))

(assert (= (and d!154153 (not c!132795)) b!1432189))

(assert (= (and b!1432189 c!132796) b!1432185))

(assert (= (and b!1432189 (not c!132796)) b!1432190))

(assert (= (and d!154153 c!132794) b!1432187))

(assert (= (and d!154153 (not c!132794)) b!1432184))

(assert (= (and b!1432184 res!965604) b!1432188))

(assert (= (and b!1432188 (not res!965602)) b!1432186))

(assert (= (and b!1432186 (not res!965603)) b!1432183))

(declare-fun m!1322199 () Bool)

(assert (=> b!1432186 m!1322199))

(assert (=> b!1432188 m!1322199))

(assert (=> b!1432190 m!1322115))

(assert (=> b!1432190 m!1322115))

(assert (=> b!1432190 m!1321973))

(declare-fun m!1322201 () Bool)

(assert (=> b!1432190 m!1322201))

(assert (=> d!154153 m!1321971))

(assert (=> d!154153 m!1321995))

(assert (=> b!1432183 m!1322199))

(assert (=> b!1431884 d!154153))

(check-sat (not b!1432017) (not d!154149) (not b!1431989) (not b!1432050) (not b!1432052) (not b!1432190) (not b!1432171) (not b!1432154) (not bm!67512) (not b!1432049) (not d!154131) (not bm!67506) (not b!1432160) (not d!154111) (not b!1432161) (not d!154153) (not b!1431988) (not b!1432026) (not d!154101) (not d!154103) (not bm!67516))
(check-sat)
(get-model)

(declare-fun b!1432288 () Bool)

(declare-fun e!808739 () Bool)

(assert (=> b!1432288 (= e!808739 (contains!9907 (ite c!132751 (Cons!33588 (select (arr!47095 a!2831) #b00000000000000000000000000000000) Nil!33589) Nil!33589) (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1432289 () Bool)

(declare-fun e!808740 () Bool)

(declare-fun e!808738 () Bool)

(assert (=> b!1432289 (= e!808740 e!808738)))

(declare-fun c!132833 () Bool)

(assert (=> b!1432289 (= c!132833 (validKeyInArray!0 (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1432290 () Bool)

(declare-fun call!67528 () Bool)

(assert (=> b!1432290 (= e!808738 call!67528)))

(declare-fun bm!67525 () Bool)

(assert (=> bm!67525 (= call!67528 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!132833 (Cons!33588 (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!132751 (Cons!33588 (select (arr!47095 a!2831) #b00000000000000000000000000000000) Nil!33589) Nil!33589)) (ite c!132751 (Cons!33588 (select (arr!47095 a!2831) #b00000000000000000000000000000000) Nil!33589) Nil!33589))))))

(declare-fun d!154189 () Bool)

(declare-fun res!965630 () Bool)

(declare-fun e!808737 () Bool)

(assert (=> d!154189 (=> res!965630 e!808737)))

(assert (=> d!154189 (= res!965630 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47646 a!2831)))))

(assert (=> d!154189 (= (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132751 (Cons!33588 (select (arr!47095 a!2831) #b00000000000000000000000000000000) Nil!33589) Nil!33589)) e!808737)))

(declare-fun b!1432291 () Bool)

(assert (=> b!1432291 (= e!808737 e!808740)))

(declare-fun res!965631 () Bool)

(assert (=> b!1432291 (=> (not res!965631) (not e!808740))))

(assert (=> b!1432291 (= res!965631 (not e!808739))))

(declare-fun res!965632 () Bool)

(assert (=> b!1432291 (=> (not res!965632) (not e!808739))))

(assert (=> b!1432291 (= res!965632 (validKeyInArray!0 (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1432292 () Bool)

(assert (=> b!1432292 (= e!808738 call!67528)))

(assert (= (and d!154189 (not res!965630)) b!1432291))

(assert (= (and b!1432291 res!965632) b!1432288))

(assert (= (and b!1432291 res!965631) b!1432289))

(assert (= (and b!1432289 c!132833) b!1432292))

(assert (= (and b!1432289 (not c!132833)) b!1432290))

(assert (= (or b!1432292 b!1432290) bm!67525))

(declare-fun m!1322283 () Bool)

(assert (=> b!1432288 m!1322283))

(assert (=> b!1432288 m!1322283))

(declare-fun m!1322285 () Bool)

(assert (=> b!1432288 m!1322285))

(assert (=> b!1432289 m!1322283))

(assert (=> b!1432289 m!1322283))

(declare-fun m!1322287 () Bool)

(assert (=> b!1432289 m!1322287))

(assert (=> bm!67525 m!1322283))

(declare-fun m!1322289 () Bool)

(assert (=> bm!67525 m!1322289))

(assert (=> b!1432291 m!1322283))

(assert (=> b!1432291 m!1322283))

(assert (=> b!1432291 m!1322287))

(assert (=> bm!67512 d!154189))

(declare-fun d!154191 () Bool)

(assert (=> d!154191 (arrayContainsKey!0 a!2831 lt!630390 #b00000000000000000000000000000000)))

(declare-fun lt!630455 () Unit!48329)

(declare-fun choose!13 (array!97577 (_ BitVec 64) (_ BitVec 32)) Unit!48329)

(assert (=> d!154191 (= lt!630455 (choose!13 a!2831 lt!630390 #b00000000000000000000000000000000))))

(assert (=> d!154191 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!154191 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630390 #b00000000000000000000000000000000) lt!630455)))

(declare-fun bs!41680 () Bool)

(assert (= bs!41680 d!154191))

(assert (=> bs!41680 m!1322187))

(declare-fun m!1322291 () Bool)

(assert (=> bs!41680 m!1322291))

(assert (=> b!1432160 d!154191))

(declare-fun d!154193 () Bool)

(declare-fun res!965637 () Bool)

(declare-fun e!808745 () Bool)

(assert (=> d!154193 (=> res!965637 e!808745)))

(assert (=> d!154193 (= res!965637 (= (select (arr!47095 a!2831) #b00000000000000000000000000000000) lt!630390))))

(assert (=> d!154193 (= (arrayContainsKey!0 a!2831 lt!630390 #b00000000000000000000000000000000) e!808745)))

(declare-fun b!1432297 () Bool)

(declare-fun e!808746 () Bool)

(assert (=> b!1432297 (= e!808745 e!808746)))

(declare-fun res!965638 () Bool)

(assert (=> b!1432297 (=> (not res!965638) (not e!808746))))

(assert (=> b!1432297 (= res!965638 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47646 a!2831)))))

(declare-fun b!1432298 () Bool)

(assert (=> b!1432298 (= e!808746 (arrayContainsKey!0 a!2831 lt!630390 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!154193 (not res!965637)) b!1432297))

(assert (= (and b!1432297 res!965638) b!1432298))

(assert (=> d!154193 m!1322127))

(declare-fun m!1322293 () Bool)

(assert (=> b!1432298 m!1322293))

(assert (=> b!1432160 d!154193))

(declare-fun b!1432299 () Bool)

(declare-fun e!808747 () SeekEntryResult!11276)

(assert (=> b!1432299 (= e!808747 Undefined!11276)))

(declare-fun e!808749 () SeekEntryResult!11276)

(declare-fun lt!630458 () SeekEntryResult!11276)

(declare-fun b!1432300 () Bool)

(assert (=> b!1432300 (= e!808749 (seekKeyOrZeroReturnVacant!0 (x!129293 lt!630458) (index!47498 lt!630458) (index!47498 lt!630458) (select (arr!47095 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(declare-fun d!154195 () Bool)

(declare-fun lt!630456 () SeekEntryResult!11276)

(assert (=> d!154195 (and (or ((_ is Undefined!11276) lt!630456) (not ((_ is Found!11276) lt!630456)) (and (bvsge (index!47497 lt!630456) #b00000000000000000000000000000000) (bvslt (index!47497 lt!630456) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630456) ((_ is Found!11276) lt!630456) (not ((_ is MissingZero!11276) lt!630456)) (and (bvsge (index!47496 lt!630456) #b00000000000000000000000000000000) (bvslt (index!47496 lt!630456) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630456) ((_ is Found!11276) lt!630456) ((_ is MissingZero!11276) lt!630456) (not ((_ is MissingVacant!11276) lt!630456)) (and (bvsge (index!47499 lt!630456) #b00000000000000000000000000000000) (bvslt (index!47499 lt!630456) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630456) (ite ((_ is Found!11276) lt!630456) (= (select (arr!47095 a!2831) (index!47497 lt!630456)) (select (arr!47095 a!2831) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!11276) lt!630456) (= (select (arr!47095 a!2831) (index!47496 lt!630456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11276) lt!630456) (= (select (arr!47095 a!2831) (index!47499 lt!630456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154195 (= lt!630456 e!808747)))

(declare-fun c!132835 () Bool)

(assert (=> d!154195 (= c!132835 (and ((_ is Intermediate!11276) lt!630458) (undefined!12088 lt!630458)))))

(assert (=> d!154195 (= lt!630458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000) mask!2608) (select (arr!47095 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(assert (=> d!154195 (validMask!0 mask!2608)))

(assert (=> d!154195 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) lt!630456)))

(declare-fun b!1432301 () Bool)

(declare-fun e!808748 () SeekEntryResult!11276)

(assert (=> b!1432301 (= e!808748 (Found!11276 (index!47498 lt!630458)))))

(declare-fun b!1432302 () Bool)

(assert (=> b!1432302 (= e!808747 e!808748)))

(declare-fun lt!630457 () (_ BitVec 64))

(assert (=> b!1432302 (= lt!630457 (select (arr!47095 a!2831) (index!47498 lt!630458)))))

(declare-fun c!132834 () Bool)

(assert (=> b!1432302 (= c!132834 (= lt!630457 (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432303 () Bool)

(declare-fun c!132836 () Bool)

(assert (=> b!1432303 (= c!132836 (= lt!630457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432303 (= e!808748 e!808749)))

(declare-fun b!1432304 () Bool)

(assert (=> b!1432304 (= e!808749 (MissingZero!11276 (index!47498 lt!630458)))))

(assert (= (and d!154195 c!132835) b!1432299))

(assert (= (and d!154195 (not c!132835)) b!1432302))

(assert (= (and b!1432302 c!132834) b!1432301))

(assert (= (and b!1432302 (not c!132834)) b!1432303))

(assert (= (and b!1432303 c!132836) b!1432304))

(assert (= (and b!1432303 (not c!132836)) b!1432300))

(assert (=> b!1432300 m!1322127))

(declare-fun m!1322295 () Bool)

(assert (=> b!1432300 m!1322295))

(declare-fun m!1322297 () Bool)

(assert (=> d!154195 m!1322297))

(assert (=> d!154195 m!1322127))

(declare-fun m!1322299 () Bool)

(assert (=> d!154195 m!1322299))

(assert (=> d!154195 m!1321995))

(declare-fun m!1322301 () Bool)

(assert (=> d!154195 m!1322301))

(assert (=> d!154195 m!1322299))

(assert (=> d!154195 m!1322127))

(declare-fun m!1322303 () Bool)

(assert (=> d!154195 m!1322303))

(declare-fun m!1322305 () Bool)

(assert (=> d!154195 m!1322305))

(declare-fun m!1322307 () Bool)

(assert (=> b!1432302 m!1322307))

(assert (=> b!1432160 d!154195))

(assert (=> d!154111 d!154121))

(assert (=> d!154101 d!154099))

(declare-fun d!154197 () Bool)

(assert (=> d!154197 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(assert (=> d!154197 true))

(declare-fun _$72!134 () Unit!48329)

(assert (=> d!154197 (= (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) _$72!134)))

(declare-fun bs!41681 () Bool)

(assert (= bs!41681 d!154197))

(assert (=> bs!41681 m!1321999))

(assert (=> d!154101 d!154197))

(assert (=> d!154101 d!154121))

(declare-fun d!154199 () Bool)

(assert (=> d!154199 (= (validKeyInArray!0 (select (arr!47095 a!2831) #b00000000000000000000000000000000)) (and (not (= (select (arr!47095 a!2831) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47095 a!2831) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432052 d!154199))

(declare-fun d!154201 () Bool)

(declare-fun res!965639 () Bool)

(declare-fun e!808751 () Bool)

(assert (=> d!154201 (=> res!965639 e!808751)))

(assert (=> d!154201 (= res!965639 (bvsge (bvadd j!81 #b00000000000000000000000000000001) (size!47646 a!2831)))))

(assert (=> d!154201 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608) e!808751)))

(declare-fun b!1432305 () Bool)

(declare-fun e!808752 () Bool)

(declare-fun call!67529 () Bool)

(assert (=> b!1432305 (= e!808752 call!67529)))

(declare-fun bm!67526 () Bool)

(assert (=> bm!67526 (= call!67529 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432306 () Bool)

(declare-fun e!808750 () Bool)

(assert (=> b!1432306 (= e!808750 e!808752)))

(declare-fun lt!630459 () (_ BitVec 64))

(assert (=> b!1432306 (= lt!630459 (select (arr!47095 a!2831) (bvadd j!81 #b00000000000000000000000000000001)))))

(declare-fun lt!630461 () Unit!48329)

(assert (=> b!1432306 (= lt!630461 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630459 (bvadd j!81 #b00000000000000000000000000000001)))))

(assert (=> b!1432306 (arrayContainsKey!0 a!2831 lt!630459 #b00000000000000000000000000000000)))

(declare-fun lt!630460 () Unit!48329)

(assert (=> b!1432306 (= lt!630460 lt!630461)))

(declare-fun res!965640 () Bool)

(assert (=> b!1432306 (= res!965640 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) (bvadd j!81 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11276 (bvadd j!81 #b00000000000000000000000000000001))))))

(assert (=> b!1432306 (=> (not res!965640) (not e!808752))))

(declare-fun b!1432307 () Bool)

(assert (=> b!1432307 (= e!808751 e!808750)))

(declare-fun c!132837 () Bool)

(assert (=> b!1432307 (= c!132837 (validKeyInArray!0 (select (arr!47095 a!2831) (bvadd j!81 #b00000000000000000000000000000001))))))

(declare-fun b!1432308 () Bool)

(assert (=> b!1432308 (= e!808750 call!67529)))

(assert (= (and d!154201 (not res!965639)) b!1432307))

(assert (= (and b!1432307 c!132837) b!1432306))

(assert (= (and b!1432307 (not c!132837)) b!1432308))

(assert (= (and b!1432306 res!965640) b!1432305))

(assert (= (or b!1432305 b!1432308) bm!67526))

(declare-fun m!1322309 () Bool)

(assert (=> bm!67526 m!1322309))

(declare-fun m!1322311 () Bool)

(assert (=> b!1432306 m!1322311))

(declare-fun m!1322313 () Bool)

(assert (=> b!1432306 m!1322313))

(declare-fun m!1322315 () Bool)

(assert (=> b!1432306 m!1322315))

(assert (=> b!1432306 m!1322311))

(declare-fun m!1322317 () Bool)

(assert (=> b!1432306 m!1322317))

(assert (=> b!1432307 m!1322311))

(assert (=> b!1432307 m!1322311))

(declare-fun m!1322319 () Bool)

(assert (=> b!1432307 m!1322319))

(assert (=> bm!67506 d!154201))

(declare-fun b!1432309 () Bool)

(declare-fun e!808757 () SeekEntryResult!11276)

(assert (=> b!1432309 (= e!808757 (Intermediate!11276 true (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1432310 () Bool)

(declare-fun lt!630462 () SeekEntryResult!11276)

(assert (=> b!1432310 (and (bvsge (index!47498 lt!630462) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630462) (size!47646 lt!630290)))))

(declare-fun e!808755 () Bool)

(assert (=> b!1432310 (= e!808755 (= (select (arr!47095 lt!630290) (index!47498 lt!630462)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432311 () Bool)

(declare-fun e!808756 () Bool)

(declare-fun e!808754 () Bool)

(assert (=> b!1432311 (= e!808756 e!808754)))

(declare-fun res!965643 () Bool)

(assert (=> b!1432311 (= res!965643 (and ((_ is Intermediate!11276) lt!630462) (not (undefined!12088 lt!630462)) (bvslt (x!129293 lt!630462) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630462) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630462) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1432311 (=> (not res!965643) (not e!808754))))

(declare-fun b!1432312 () Bool)

(declare-fun e!808753 () SeekEntryResult!11276)

(assert (=> b!1432312 (= e!808753 (Intermediate!11276 false (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun d!154203 () Bool)

(assert (=> d!154203 e!808756))

(declare-fun c!132838 () Bool)

(assert (=> d!154203 (= c!132838 (and ((_ is Intermediate!11276) lt!630462) (undefined!12088 lt!630462)))))

(assert (=> d!154203 (= lt!630462 e!808757)))

(declare-fun c!132839 () Bool)

(assert (=> d!154203 (= c!132839 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!630463 () (_ BitVec 64))

(assert (=> d!154203 (= lt!630463 (select (arr!47095 lt!630290) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608)))))

(assert (=> d!154203 (validMask!0 mask!2608)))

(assert (=> d!154203 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!630286 lt!630290 mask!2608) lt!630462)))

(declare-fun b!1432313 () Bool)

(assert (=> b!1432313 (and (bvsge (index!47498 lt!630462) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630462) (size!47646 lt!630290)))))

(declare-fun res!965642 () Bool)

(assert (=> b!1432313 (= res!965642 (= (select (arr!47095 lt!630290) (index!47498 lt!630462)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432313 (=> res!965642 e!808755)))

(declare-fun b!1432314 () Bool)

(assert (=> b!1432314 (= e!808756 (bvsge (x!129293 lt!630462) #b01111111111111111111111111111110))))

(declare-fun b!1432315 () Bool)

(assert (=> b!1432315 (and (bvsge (index!47498 lt!630462) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630462) (size!47646 lt!630290)))))

(declare-fun res!965641 () Bool)

(assert (=> b!1432315 (= res!965641 (= (select (arr!47095 lt!630290) (index!47498 lt!630462)) lt!630286))))

(assert (=> b!1432315 (=> res!965641 e!808755)))

(assert (=> b!1432315 (= e!808754 e!808755)))

(declare-fun b!1432316 () Bool)

(assert (=> b!1432316 (= e!808757 e!808753)))

(declare-fun c!132840 () Bool)

(assert (=> b!1432316 (= c!132840 (or (= lt!630463 lt!630286) (= (bvadd lt!630463 lt!630463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432317 () Bool)

(assert (=> b!1432317 (= e!808753 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2608) lt!630286 lt!630290 mask!2608))))

(assert (= (and d!154203 c!132839) b!1432309))

(assert (= (and d!154203 (not c!132839)) b!1432316))

(assert (= (and b!1432316 c!132840) b!1432312))

(assert (= (and b!1432316 (not c!132840)) b!1432317))

(assert (= (and d!154203 c!132838) b!1432314))

(assert (= (and d!154203 (not c!132838)) b!1432311))

(assert (= (and b!1432311 res!965643) b!1432315))

(assert (= (and b!1432315 (not res!965641)) b!1432313))

(assert (= (and b!1432313 (not res!965642)) b!1432310))

(declare-fun m!1322321 () Bool)

(assert (=> b!1432313 m!1322321))

(assert (=> b!1432315 m!1322321))

(assert (=> b!1432317 m!1322115))

(declare-fun m!1322323 () Bool)

(assert (=> b!1432317 m!1322323))

(assert (=> b!1432317 m!1322323))

(declare-fun m!1322325 () Bool)

(assert (=> b!1432317 m!1322325))

(assert (=> d!154203 m!1322115))

(declare-fun m!1322327 () Bool)

(assert (=> d!154203 m!1322327))

(assert (=> d!154203 m!1321995))

(assert (=> b!1432310 m!1322321))

(assert (=> b!1432026 d!154203))

(declare-fun d!154205 () Bool)

(declare-fun lt!630466 () (_ BitVec 32))

(assert (=> d!154205 (and (bvsge lt!630466 #b00000000000000000000000000000000) (bvslt lt!630466 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154205 (= lt!630466 (choose!52 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608))))

(assert (=> d!154205 (validMask!0 mask!2608)))

(assert (=> d!154205 (= (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!630466)))

(declare-fun bs!41682 () Bool)

(assert (= bs!41682 d!154205))

(declare-fun m!1322329 () Bool)

(assert (=> bs!41682 m!1322329))

(assert (=> bs!41682 m!1321995))

(assert (=> b!1432026 d!154205))

(assert (=> b!1432161 d!154199))

(declare-fun d!154207 () Bool)

(declare-fun lt!630469 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!764 (List!33592) (InoxSet (_ BitVec 64)))

(assert (=> d!154207 (= lt!630469 (select (content!764 Nil!33589) (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun e!808763 () Bool)

(assert (=> d!154207 (= lt!630469 e!808763)))

(declare-fun res!965648 () Bool)

(assert (=> d!154207 (=> (not res!965648) (not e!808763))))

(assert (=> d!154207 (= res!965648 ((_ is Cons!33588) Nil!33589))))

(assert (=> d!154207 (= (contains!9907 Nil!33589 (select (arr!47095 a!2831) #b00000000000000000000000000000000)) lt!630469)))

(declare-fun b!1432322 () Bool)

(declare-fun e!808762 () Bool)

(assert (=> b!1432322 (= e!808763 e!808762)))

(declare-fun res!965649 () Bool)

(assert (=> b!1432322 (=> res!965649 e!808762)))

(assert (=> b!1432322 (= res!965649 (= (h!34916 Nil!33589) (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1432323 () Bool)

(assert (=> b!1432323 (= e!808762 (contains!9907 (t!48278 Nil!33589) (select (arr!47095 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154207 res!965648) b!1432322))

(assert (= (and b!1432322 (not res!965649)) b!1432323))

(declare-fun m!1322331 () Bool)

(assert (=> d!154207 m!1322331))

(assert (=> d!154207 m!1322127))

(declare-fun m!1322333 () Bool)

(assert (=> d!154207 m!1322333))

(assert (=> b!1432323 m!1322127))

(declare-fun m!1322335 () Bool)

(assert (=> b!1432323 m!1322335))

(assert (=> b!1432049 d!154207))

(declare-fun d!154209 () Bool)

(declare-fun res!965650 () Bool)

(declare-fun e!808765 () Bool)

(assert (=> d!154209 (=> res!965650 e!808765)))

(assert (=> d!154209 (= res!965650 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47646 a!2831)))))

(assert (=> d!154209 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608) e!808765)))

(declare-fun b!1432324 () Bool)

(declare-fun e!808766 () Bool)

(declare-fun call!67530 () Bool)

(assert (=> b!1432324 (= e!808766 call!67530)))

(declare-fun bm!67527 () Bool)

(assert (=> bm!67527 (= call!67530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1432325 () Bool)

(declare-fun e!808764 () Bool)

(assert (=> b!1432325 (= e!808764 e!808766)))

(declare-fun lt!630470 () (_ BitVec 64))

(assert (=> b!1432325 (= lt!630470 (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!630472 () Unit!48329)

(assert (=> b!1432325 (= lt!630472 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630470 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1432325 (arrayContainsKey!0 a!2831 lt!630470 #b00000000000000000000000000000000)))

(declare-fun lt!630471 () Unit!48329)

(assert (=> b!1432325 (= lt!630471 lt!630472)))

(declare-fun res!965651 () Bool)

(assert (=> b!1432325 (= res!965651 (= (seekEntryOrOpen!0 (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11276 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1432325 (=> (not res!965651) (not e!808766))))

(declare-fun b!1432326 () Bool)

(assert (=> b!1432326 (= e!808765 e!808764)))

(declare-fun c!132841 () Bool)

(assert (=> b!1432326 (= c!132841 (validKeyInArray!0 (select (arr!47095 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1432327 () Bool)

(assert (=> b!1432327 (= e!808764 call!67530)))

(assert (= (and d!154209 (not res!965650)) b!1432326))

(assert (= (and b!1432326 c!132841) b!1432325))

(assert (= (and b!1432326 (not c!132841)) b!1432327))

(assert (= (and b!1432325 res!965651) b!1432324))

(assert (= (or b!1432324 b!1432327) bm!67527))

(declare-fun m!1322337 () Bool)

(assert (=> bm!67527 m!1322337))

(assert (=> b!1432325 m!1322283))

(declare-fun m!1322339 () Bool)

(assert (=> b!1432325 m!1322339))

(declare-fun m!1322341 () Bool)

(assert (=> b!1432325 m!1322341))

(assert (=> b!1432325 m!1322283))

(declare-fun m!1322343 () Bool)

(assert (=> b!1432325 m!1322343))

(assert (=> b!1432326 m!1322283))

(assert (=> b!1432326 m!1322283))

(assert (=> b!1432326 m!1322287))

(assert (=> bm!67516 d!154209))

(assert (=> b!1432050 d!154199))

(assert (=> d!154103 d!154121))

(declare-fun e!808771 () SeekEntryResult!11276)

(declare-fun b!1432328 () Bool)

(assert (=> b!1432328 (= e!808771 (Intermediate!11276 true (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1432329 () Bool)

(declare-fun lt!630473 () SeekEntryResult!11276)

(assert (=> b!1432329 (and (bvsge (index!47498 lt!630473) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630473) (size!47646 a!2831)))))

(declare-fun e!808769 () Bool)

(assert (=> b!1432329 (= e!808769 (= (select (arr!47095 a!2831) (index!47498 lt!630473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432330 () Bool)

(declare-fun e!808770 () Bool)

(declare-fun e!808768 () Bool)

(assert (=> b!1432330 (= e!808770 e!808768)))

(declare-fun res!965654 () Bool)

(assert (=> b!1432330 (= res!965654 (and ((_ is Intermediate!11276) lt!630473) (not (undefined!12088 lt!630473)) (bvslt (x!129293 lt!630473) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630473) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630473) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1432330 (=> (not res!965654) (not e!808768))))

(declare-fun e!808767 () SeekEntryResult!11276)

(declare-fun b!1432331 () Bool)

(assert (=> b!1432331 (= e!808767 (Intermediate!11276 false (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun d!154211 () Bool)

(assert (=> d!154211 e!808770))

(declare-fun c!132842 () Bool)

(assert (=> d!154211 (= c!132842 (and ((_ is Intermediate!11276) lt!630473) (undefined!12088 lt!630473)))))

(assert (=> d!154211 (= lt!630473 e!808771)))

(declare-fun c!132843 () Bool)

(assert (=> d!154211 (= c!132843 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!630474 () (_ BitVec 64))

(assert (=> d!154211 (= lt!630474 (select (arr!47095 a!2831) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608)))))

(assert (=> d!154211 (validMask!0 mask!2608)))

(assert (=> d!154211 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630473)))

(declare-fun b!1432332 () Bool)

(assert (=> b!1432332 (and (bvsge (index!47498 lt!630473) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630473) (size!47646 a!2831)))))

(declare-fun res!965653 () Bool)

(assert (=> b!1432332 (= res!965653 (= (select (arr!47095 a!2831) (index!47498 lt!630473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432332 (=> res!965653 e!808769)))

(declare-fun b!1432333 () Bool)

(assert (=> b!1432333 (= e!808770 (bvsge (x!129293 lt!630473) #b01111111111111111111111111111110))))

(declare-fun b!1432334 () Bool)

(assert (=> b!1432334 (and (bvsge (index!47498 lt!630473) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630473) (size!47646 a!2831)))))

(declare-fun res!965652 () Bool)

(assert (=> b!1432334 (= res!965652 (= (select (arr!47095 a!2831) (index!47498 lt!630473)) (select (arr!47095 a!2831) j!81)))))

(assert (=> b!1432334 (=> res!965652 e!808769)))

(assert (=> b!1432334 (= e!808768 e!808769)))

(declare-fun b!1432335 () Bool)

(assert (=> b!1432335 (= e!808771 e!808767)))

(declare-fun c!132844 () Bool)

(assert (=> b!1432335 (= c!132844 (or (= lt!630474 (select (arr!47095 a!2831) j!81)) (= (bvadd lt!630474 lt!630474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432336 () Bool)

(assert (=> b!1432336 (= e!808767 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154211 c!132843) b!1432328))

(assert (= (and d!154211 (not c!132843)) b!1432335))

(assert (= (and b!1432335 c!132844) b!1432331))

(assert (= (and b!1432335 (not c!132844)) b!1432336))

(assert (= (and d!154211 c!132842) b!1432333))

(assert (= (and d!154211 (not c!132842)) b!1432330))

(assert (= (and b!1432330 res!965654) b!1432334))

(assert (= (and b!1432334 (not res!965652)) b!1432332))

(assert (= (and b!1432332 (not res!965653)) b!1432329))

(declare-fun m!1322345 () Bool)

(assert (=> b!1432332 m!1322345))

(assert (=> b!1432334 m!1322345))

(assert (=> b!1432336 m!1322115))

(assert (=> b!1432336 m!1322323))

(assert (=> b!1432336 m!1322323))

(assert (=> b!1432336 m!1321973))

(declare-fun m!1322347 () Bool)

(assert (=> b!1432336 m!1322347))

(assert (=> d!154211 m!1322115))

(declare-fun m!1322349 () Bool)

(assert (=> d!154211 m!1322349))

(assert (=> d!154211 m!1321995))

(assert (=> b!1432329 m!1322345))

(assert (=> b!1432190 d!154211))

(assert (=> b!1432190 d!154205))

(assert (=> b!1431989 d!154147))

(declare-fun b!1432337 () Bool)

(declare-fun e!808776 () SeekEntryResult!11276)

(assert (=> b!1432337 (= e!808776 (Intermediate!11276 true (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1432338 () Bool)

(declare-fun lt!630475 () SeekEntryResult!11276)

(assert (=> b!1432338 (and (bvsge (index!47498 lt!630475) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630475) (size!47646 a!2831)))))

(declare-fun e!808774 () Bool)

(assert (=> b!1432338 (= e!808774 (= (select (arr!47095 a!2831) (index!47498 lt!630475)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432339 () Bool)

(declare-fun e!808775 () Bool)

(declare-fun e!808773 () Bool)

(assert (=> b!1432339 (= e!808775 e!808773)))

(declare-fun res!965657 () Bool)

(assert (=> b!1432339 (= res!965657 (and ((_ is Intermediate!11276) lt!630475) (not (undefined!12088 lt!630475)) (bvslt (x!129293 lt!630475) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630475) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630475) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1432339 (=> (not res!965657) (not e!808773))))

(declare-fun b!1432340 () Bool)

(declare-fun e!808772 () SeekEntryResult!11276)

(assert (=> b!1432340 (= e!808772 (Intermediate!11276 false (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!154213 () Bool)

(assert (=> d!154213 e!808775))

(declare-fun c!132845 () Bool)

(assert (=> d!154213 (= c!132845 (and ((_ is Intermediate!11276) lt!630475) (undefined!12088 lt!630475)))))

(assert (=> d!154213 (= lt!630475 e!808776)))

(declare-fun c!132846 () Bool)

(assert (=> d!154213 (= c!132846 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!630476 () (_ BitVec 64))

(assert (=> d!154213 (= lt!630476 (select (arr!47095 a!2831) (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608)))))

(assert (=> d!154213 (validMask!0 mask!2608)))

(assert (=> d!154213 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630475)))

(declare-fun b!1432341 () Bool)

(assert (=> b!1432341 (and (bvsge (index!47498 lt!630475) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630475) (size!47646 a!2831)))))

(declare-fun res!965656 () Bool)

(assert (=> b!1432341 (= res!965656 (= (select (arr!47095 a!2831) (index!47498 lt!630475)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432341 (=> res!965656 e!808774)))

(declare-fun b!1432342 () Bool)

(assert (=> b!1432342 (= e!808775 (bvsge (x!129293 lt!630475) #b01111111111111111111111111111110))))

(declare-fun b!1432343 () Bool)

(assert (=> b!1432343 (and (bvsge (index!47498 lt!630475) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630475) (size!47646 a!2831)))))

(declare-fun res!965655 () Bool)

(assert (=> b!1432343 (= res!965655 (= (select (arr!47095 a!2831) (index!47498 lt!630475)) (select (arr!47095 a!2831) j!81)))))

(assert (=> b!1432343 (=> res!965655 e!808774)))

(assert (=> b!1432343 (= e!808773 e!808774)))

(declare-fun b!1432344 () Bool)

(assert (=> b!1432344 (= e!808776 e!808772)))

(declare-fun c!132847 () Bool)

(assert (=> b!1432344 (= c!132847 (or (= lt!630476 (select (arr!47095 a!2831) j!81)) (= (bvadd lt!630476 lt!630476) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432345 () Bool)

(assert (=> b!1432345 (= e!808772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2608) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154213 c!132846) b!1432337))

(assert (= (and d!154213 (not c!132846)) b!1432344))

(assert (= (and b!1432344 c!132847) b!1432340))

(assert (= (and b!1432344 (not c!132847)) b!1432345))

(assert (= (and d!154213 c!132845) b!1432342))

(assert (= (and d!154213 (not c!132845)) b!1432339))

(assert (= (and b!1432339 res!965657) b!1432343))

(assert (= (and b!1432343 (not res!965655)) b!1432341))

(assert (= (and b!1432341 (not res!965656)) b!1432338))

(declare-fun m!1322351 () Bool)

(assert (=> b!1432341 m!1322351))

(assert (=> b!1432343 m!1322351))

(assert (=> b!1432345 m!1322107))

(declare-fun m!1322353 () Bool)

(assert (=> b!1432345 m!1322353))

(assert (=> b!1432345 m!1322353))

(assert (=> b!1432345 m!1321973))

(declare-fun m!1322355 () Bool)

(assert (=> b!1432345 m!1322355))

(assert (=> d!154213 m!1322107))

(declare-fun m!1322357 () Bool)

(assert (=> d!154213 m!1322357))

(assert (=> d!154213 m!1321995))

(assert (=> b!1432338 m!1322351))

(assert (=> b!1432017 d!154213))

(declare-fun d!154215 () Bool)

(declare-fun lt!630477 () (_ BitVec 32))

(assert (=> d!154215 (and (bvsge lt!630477 #b00000000000000000000000000000000) (bvslt lt!630477 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!154215 (= lt!630477 (choose!52 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608))))

(assert (=> d!154215 (validMask!0 mask!2608)))

(assert (=> d!154215 (= (nextIndex!0 (toIndex!0 (select (arr!47095 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!630477)))

(declare-fun bs!41683 () Bool)

(assert (= bs!41683 d!154215))

(assert (=> bs!41683 m!1321989))

(declare-fun m!1322359 () Bool)

(assert (=> bs!41683 m!1322359))

(assert (=> bs!41683 m!1321995))

(assert (=> b!1432017 d!154215))

(declare-fun b!1432382 () Bool)

(declare-fun c!132859 () Bool)

(declare-fun lt!630493 () (_ BitVec 64))

(assert (=> b!1432382 (= c!132859 (= lt!630493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808803 () SeekEntryResult!11276)

(declare-fun e!808801 () SeekEntryResult!11276)

(assert (=> b!1432382 (= e!808803 e!808801)))

(declare-fun b!1432383 () Bool)

(assert (=> b!1432383 (= e!808801 (seekKeyOrZeroReturnVacant!0 (bvadd (x!129293 lt!630389) #b00000000000000000000000000000001) (nextIndex!0 (index!47498 lt!630389) (bvadd (x!129293 lt!630389) #b00000000000000000000000000000001) mask!2608) (index!47498 lt!630389) (select (arr!47095 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1432384 () Bool)

(declare-fun e!808802 () SeekEntryResult!11276)

(assert (=> b!1432384 (= e!808802 Undefined!11276)))

(declare-fun d!154217 () Bool)

(declare-fun lt!630492 () SeekEntryResult!11276)

(assert (=> d!154217 (and (or ((_ is Undefined!11276) lt!630492) (not ((_ is Found!11276) lt!630492)) (and (bvsge (index!47497 lt!630492) #b00000000000000000000000000000000) (bvslt (index!47497 lt!630492) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630492) ((_ is Found!11276) lt!630492) (not ((_ is MissingVacant!11276) lt!630492)) (not (= (index!47499 lt!630492) (index!47498 lt!630389))) (and (bvsge (index!47499 lt!630492) #b00000000000000000000000000000000) (bvslt (index!47499 lt!630492) (size!47646 a!2831)))) (or ((_ is Undefined!11276) lt!630492) (ite ((_ is Found!11276) lt!630492) (= (select (arr!47095 a!2831) (index!47497 lt!630492)) (select (arr!47095 a!2831) j!81)) (and ((_ is MissingVacant!11276) lt!630492) (= (index!47499 lt!630492) (index!47498 lt!630389)) (= (select (arr!47095 a!2831) (index!47499 lt!630492)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!154217 (= lt!630492 e!808802)))

(declare-fun c!132860 () Bool)

(assert (=> d!154217 (= c!132860 (bvsge (x!129293 lt!630389) #b01111111111111111111111111111110))))

(assert (=> d!154217 (= lt!630493 (select (arr!47095 a!2831) (index!47498 lt!630389)))))

(assert (=> d!154217 (validMask!0 mask!2608)))

(assert (=> d!154217 (= (seekKeyOrZeroReturnVacant!0 (x!129293 lt!630389) (index!47498 lt!630389) (index!47498 lt!630389) (select (arr!47095 a!2831) j!81) a!2831 mask!2608) lt!630492)))

(declare-fun b!1432385 () Bool)

(assert (=> b!1432385 (= e!808803 (Found!11276 (index!47498 lt!630389)))))

(declare-fun b!1432386 () Bool)

(assert (=> b!1432386 (= e!808802 e!808803)))

(declare-fun c!132861 () Bool)

(assert (=> b!1432386 (= c!132861 (= lt!630493 (select (arr!47095 a!2831) j!81)))))

(declare-fun b!1432387 () Bool)

(assert (=> b!1432387 (= e!808801 (MissingVacant!11276 (index!47498 lt!630389)))))

(assert (= (and d!154217 c!132860) b!1432384))

(assert (= (and d!154217 (not c!132860)) b!1432386))

(assert (= (and b!1432386 c!132861) b!1432385))

(assert (= (and b!1432386 (not c!132861)) b!1432382))

(assert (= (and b!1432382 c!132859) b!1432387))

(assert (= (and b!1432382 (not c!132859)) b!1432383))

(declare-fun m!1322395 () Bool)

(assert (=> b!1432383 m!1322395))

(assert (=> b!1432383 m!1322395))

(assert (=> b!1432383 m!1321973))

(declare-fun m!1322397 () Bool)

(assert (=> b!1432383 m!1322397))

(declare-fun m!1322399 () Bool)

(assert (=> d!154217 m!1322399))

(declare-fun m!1322401 () Bool)

(assert (=> d!154217 m!1322401))

(assert (=> d!154217 m!1322181))

(assert (=> d!154217 m!1321995))

(assert (=> b!1432154 d!154217))

(declare-fun d!154233 () Bool)

(assert (=> d!154233 (arrayContainsKey!0 a!2831 lt!630327 #b00000000000000000000000000000000)))

(declare-fun lt!630495 () Unit!48329)

(assert (=> d!154233 (= lt!630495 (choose!13 a!2831 lt!630327 j!81))))

(assert (=> d!154233 (bvsge j!81 #b00000000000000000000000000000000)))

(assert (=> d!154233 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630327 j!81) lt!630495)))

(declare-fun bs!41686 () Bool)

(assert (= bs!41686 d!154233))

(assert (=> bs!41686 m!1322101))

(declare-fun m!1322403 () Bool)

(assert (=> bs!41686 m!1322403))

(assert (=> b!1431988 d!154233))

(declare-fun d!154235 () Bool)

(declare-fun res!965672 () Bool)

(declare-fun e!808804 () Bool)

(assert (=> d!154235 (=> res!965672 e!808804)))

(assert (=> d!154235 (= res!965672 (= (select (arr!47095 a!2831) #b00000000000000000000000000000000) lt!630327))))

(assert (=> d!154235 (= (arrayContainsKey!0 a!2831 lt!630327 #b00000000000000000000000000000000) e!808804)))

(declare-fun b!1432388 () Bool)

(declare-fun e!808805 () Bool)

(assert (=> b!1432388 (= e!808804 e!808805)))

(declare-fun res!965673 () Bool)

(assert (=> b!1432388 (=> (not res!965673) (not e!808805))))

(assert (=> b!1432388 (= res!965673 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47646 a!2831)))))

(declare-fun b!1432389 () Bool)

(assert (=> b!1432389 (= e!808805 (arrayContainsKey!0 a!2831 lt!630327 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!154235 (not res!965672)) b!1432388))

(assert (= (and b!1432388 res!965673) b!1432389))

(assert (=> d!154235 m!1322127))

(declare-fun m!1322405 () Bool)

(assert (=> b!1432389 m!1322405))

(assert (=> b!1431988 d!154235))

(assert (=> b!1431988 d!154131))

(declare-fun b!1432390 () Bool)

(declare-fun e!808810 () SeekEntryResult!11276)

(assert (=> b!1432390 (= e!808810 (Intermediate!11276 true (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1432391 () Bool)

(declare-fun lt!630496 () SeekEntryResult!11276)

(assert (=> b!1432391 (and (bvsge (index!47498 lt!630496) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630496) (size!47646 lt!630290)))))

(declare-fun e!808808 () Bool)

(assert (=> b!1432391 (= e!808808 (= (select (arr!47095 lt!630290) (index!47498 lt!630496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1432392 () Bool)

(declare-fun e!808809 () Bool)

(declare-fun e!808807 () Bool)

(assert (=> b!1432392 (= e!808809 e!808807)))

(declare-fun res!965676 () Bool)

(assert (=> b!1432392 (= res!965676 (and ((_ is Intermediate!11276) lt!630496) (not (undefined!12088 lt!630496)) (bvslt (x!129293 lt!630496) #b01111111111111111111111111111110) (bvsge (x!129293 lt!630496) #b00000000000000000000000000000000) (bvsge (x!129293 lt!630496) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1432392 (=> (not res!965676) (not e!808807))))

(declare-fun b!1432393 () Bool)

(declare-fun e!808806 () SeekEntryResult!11276)

(assert (=> b!1432393 (= e!808806 (Intermediate!11276 false (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!154237 () Bool)

(assert (=> d!154237 e!808809))

(declare-fun c!132862 () Bool)

(assert (=> d!154237 (= c!132862 (and ((_ is Intermediate!11276) lt!630496) (undefined!12088 lt!630496)))))

(assert (=> d!154237 (= lt!630496 e!808810)))

(declare-fun c!132863 () Bool)

(assert (=> d!154237 (= c!132863 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!630497 () (_ BitVec 64))

(assert (=> d!154237 (= lt!630497 (select (arr!47095 lt!630290) (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608)))))

(assert (=> d!154237 (validMask!0 mask!2608)))

(assert (=> d!154237 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!630286 lt!630290 mask!2608) lt!630496)))

(declare-fun b!1432394 () Bool)

(assert (=> b!1432394 (and (bvsge (index!47498 lt!630496) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630496) (size!47646 lt!630290)))))

(declare-fun res!965675 () Bool)

(assert (=> b!1432394 (= res!965675 (= (select (arr!47095 lt!630290) (index!47498 lt!630496)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1432394 (=> res!965675 e!808808)))

(declare-fun b!1432395 () Bool)

(assert (=> b!1432395 (= e!808809 (bvsge (x!129293 lt!630496) #b01111111111111111111111111111110))))

(declare-fun b!1432396 () Bool)

(assert (=> b!1432396 (and (bvsge (index!47498 lt!630496) #b00000000000000000000000000000000) (bvslt (index!47498 lt!630496) (size!47646 lt!630290)))))

(declare-fun res!965674 () Bool)

(assert (=> b!1432396 (= res!965674 (= (select (arr!47095 lt!630290) (index!47498 lt!630496)) lt!630286))))

(assert (=> b!1432396 (=> res!965674 e!808808)))

(assert (=> b!1432396 (= e!808807 e!808808)))

(declare-fun b!1432397 () Bool)

(assert (=> b!1432397 (= e!808810 e!808806)))

(declare-fun c!132864 () Bool)

(assert (=> b!1432397 (= c!132864 (or (= lt!630497 lt!630286) (= (bvadd lt!630497 lt!630497) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1432398 () Bool)

(assert (=> b!1432398 (= e!808806 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2608) lt!630286 lt!630290 mask!2608))))

(assert (= (and d!154237 c!132863) b!1432390))

(assert (= (and d!154237 (not c!132863)) b!1432397))

(assert (= (and b!1432397 c!132864) b!1432393))

(assert (= (and b!1432397 (not c!132864)) b!1432398))

(assert (= (and d!154237 c!132862) b!1432395))

(assert (= (and d!154237 (not c!132862)) b!1432392))

(assert (= (and b!1432392 res!965676) b!1432396))

(assert (= (and b!1432396 (not res!965674)) b!1432394))

(assert (= (and b!1432394 (not res!965675)) b!1432391))

(declare-fun m!1322407 () Bool)

(assert (=> b!1432394 m!1322407))

(assert (=> b!1432396 m!1322407))

(assert (=> b!1432398 m!1322193))

(declare-fun m!1322409 () Bool)

(assert (=> b!1432398 m!1322409))

(assert (=> b!1432398 m!1322409))

(declare-fun m!1322411 () Bool)

(assert (=> b!1432398 m!1322411))

(assert (=> d!154237 m!1322193))

(declare-fun m!1322413 () Bool)

(assert (=> d!154237 m!1322413))

(assert (=> d!154237 m!1321995))

(assert (=> b!1432391 m!1322407))

(assert (=> b!1432171 d!154237))

(declare-fun d!154239 () Bool)

(declare-fun lt!630498 () (_ BitVec 32))

(assert (=> d!154239 (and (bvsge lt!630498 #b00000000000000000000000000000000) (bvslt lt!630498 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!154239 (= lt!630498 (choose!52 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608))))

(assert (=> d!154239 (validMask!0 mask!2608)))

(assert (=> d!154239 (= (nextIndex!0 (toIndex!0 lt!630286 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!630498)))

(declare-fun bs!41688 () Bool)

(assert (= bs!41688 d!154239))

(assert (=> bs!41688 m!1321979))

(declare-fun m!1322415 () Bool)

(assert (=> bs!41688 m!1322415))

(assert (=> bs!41688 m!1321995))

(assert (=> b!1432171 d!154239))

(assert (=> d!154131 d!154103))

(assert (=> d!154131 d!154105))

(assert (=> d!154131 d!154121))

(assert (=> d!154149 d!154121))

(assert (=> d!154153 d!154121))

(check-sat (not bm!67527) (not b!1432289) (not b!1432326) (not d!154191) (not bm!67526) (not b!1432389) (not d!154211) (not d!154203) (not b!1432336) (not b!1432288) (not d!154195) (not b!1432307) (not d!154197) (not b!1432323) (not bm!67525) (not b!1432298) (not b!1432291) (not b!1432317) (not b!1432325) (not d!154217) (not b!1432345) (not b!1432383) (not b!1432398) (not d!154237) (not b!1432306) (not d!154233) (not d!154239) (not d!154215) (not d!154205) (not d!154213) (not d!154207) (not b!1432300))
(check-sat)
