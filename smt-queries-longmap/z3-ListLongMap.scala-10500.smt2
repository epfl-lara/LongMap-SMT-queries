; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123578 () Bool)

(assert start!123578)

(declare-fun b!1432991 () Bool)

(declare-fun e!808841 () Bool)

(declare-fun e!808839 () Bool)

(assert (=> b!1432991 (= e!808841 e!808839)))

(declare-fun res!966857 () Bool)

(assert (=> b!1432991 (=> (not res!966857) (not e!808839))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97550 0))(
  ( (array!97551 (arr!47082 (Array (_ BitVec 32) (_ BitVec 64))) (size!47632 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97550)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11361 0))(
  ( (MissingZero!11361 (index!47836 (_ BitVec 32))) (Found!11361 (index!47837 (_ BitVec 32))) (Intermediate!11361 (undefined!12173 Bool) (index!47838 (_ BitVec 32)) (x!129475 (_ BitVec 32))) (Undefined!11361) (MissingVacant!11361 (index!47839 (_ BitVec 32))) )
))
(declare-fun lt!630831 () SeekEntryResult!11361)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97550 (_ BitVec 32)) SeekEntryResult!11361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432991 (= res!966857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) (select (arr!47082 a!2831) j!81) a!2831 mask!2608) lt!630831))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432991 (= lt!630831 (Intermediate!11361 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432992 () Bool)

(declare-fun e!808838 () Bool)

(declare-fun e!808836 () Bool)

(assert (=> b!1432992 (= e!808838 (not e!808836))))

(declare-fun res!966859 () Bool)

(assert (=> b!1432992 (=> res!966859 e!808836)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432992 (= res!966859 (or (= (select (arr!47082 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47082 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47082 a!2831) index!585) (select (arr!47082 a!2831) j!81)) (= (select (store (arr!47082 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808837 () Bool)

(assert (=> b!1432992 e!808837))

(declare-fun res!966866 () Bool)

(assert (=> b!1432992 (=> (not res!966866) (not e!808837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97550 (_ BitVec 32)) Bool)

(assert (=> b!1432992 (= res!966866 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48468 0))(
  ( (Unit!48469) )
))
(declare-fun lt!630834 () Unit!48468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48468)

(assert (=> b!1432992 (= lt!630834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432993 () Bool)

(assert (=> b!1432993 (= e!808839 e!808838)))

(declare-fun res!966855 () Bool)

(assert (=> b!1432993 (=> (not res!966855) (not e!808838))))

(declare-fun lt!630829 () SeekEntryResult!11361)

(declare-fun lt!630830 () array!97550)

(declare-fun lt!630833 () (_ BitVec 64))

(assert (=> b!1432993 (= res!966855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630833 mask!2608) lt!630833 lt!630830 mask!2608) lt!630829))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1432993 (= lt!630829 (Intermediate!11361 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432993 (= lt!630833 (select (store (arr!47082 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432993 (= lt!630830 (array!97551 (store (arr!47082 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47632 a!2831)))))

(declare-fun b!1432994 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97550 (_ BitVec 32)) SeekEntryResult!11361)

(assert (=> b!1432994 (= e!808837 (= (seekEntryOrOpen!0 (select (arr!47082 a!2831) j!81) a!2831 mask!2608) (Found!11361 j!81)))))

(declare-fun b!1432995 () Bool)

(declare-fun res!966858 () Bool)

(assert (=> b!1432995 (=> (not res!966858) (not e!808841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432995 (= res!966858 (validKeyInArray!0 (select (arr!47082 a!2831) j!81)))))

(declare-fun b!1432996 () Bool)

(declare-fun res!966856 () Bool)

(assert (=> b!1432996 (=> (not res!966856) (not e!808841))))

(declare-datatypes ((List!33592 0))(
  ( (Nil!33589) (Cons!33588 (h!34911 (_ BitVec 64)) (t!48286 List!33592)) )
))
(declare-fun arrayNoDuplicates!0 (array!97550 (_ BitVec 32) List!33592) Bool)

(assert (=> b!1432996 (= res!966856 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33589))))

(declare-fun b!1432997 () Bool)

(declare-fun res!966868 () Bool)

(assert (=> b!1432997 (=> (not res!966868) (not e!808838))))

(assert (=> b!1432997 (= res!966868 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432998 () Bool)

(declare-fun res!966863 () Bool)

(assert (=> b!1432998 (=> (not res!966863) (not e!808841))))

(assert (=> b!1432998 (= res!966863 (validKeyInArray!0 (select (arr!47082 a!2831) i!982)))))

(declare-fun b!1432999 () Bool)

(declare-fun res!966865 () Bool)

(assert (=> b!1432999 (=> (not res!966865) (not e!808841))))

(assert (=> b!1432999 (= res!966865 (and (= (size!47632 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47632 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47632 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433000 () Bool)

(declare-fun res!966861 () Bool)

(assert (=> b!1433000 (=> (not res!966861) (not e!808838))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433000 (= res!966861 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630833 lt!630830 mask!2608) lt!630829))))

(declare-fun res!966860 () Bool)

(assert (=> start!123578 (=> (not res!966860) (not e!808841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123578 (= res!966860 (validMask!0 mask!2608))))

(assert (=> start!123578 e!808841))

(assert (=> start!123578 true))

(declare-fun array_inv!36110 (array!97550) Bool)

(assert (=> start!123578 (array_inv!36110 a!2831)))

(declare-fun b!1433001 () Bool)

(declare-fun res!966867 () Bool)

(assert (=> b!1433001 (=> (not res!966867) (not e!808841))))

(assert (=> b!1433001 (= res!966867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433002 () Bool)

(assert (=> b!1433002 (= e!808836 (and (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110)))))

(declare-fun lt!630832 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433002 (= lt!630832 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433003 () Bool)

(declare-fun res!966864 () Bool)

(assert (=> b!1433003 (=> (not res!966864) (not e!808841))))

(assert (=> b!1433003 (= res!966864 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47632 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47632 a!2831))))))

(declare-fun b!1433004 () Bool)

(declare-fun res!966862 () Bool)

(assert (=> b!1433004 (=> (not res!966862) (not e!808838))))

(assert (=> b!1433004 (= res!966862 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47082 a!2831) j!81) a!2831 mask!2608) lt!630831))))

(assert (= (and start!123578 res!966860) b!1432999))

(assert (= (and b!1432999 res!966865) b!1432998))

(assert (= (and b!1432998 res!966863) b!1432995))

(assert (= (and b!1432995 res!966858) b!1433001))

(assert (= (and b!1433001 res!966867) b!1432996))

(assert (= (and b!1432996 res!966856) b!1433003))

(assert (= (and b!1433003 res!966864) b!1432991))

(assert (= (and b!1432991 res!966857) b!1432993))

(assert (= (and b!1432993 res!966855) b!1433004))

(assert (= (and b!1433004 res!966862) b!1433000))

(assert (= (and b!1433000 res!966861) b!1432997))

(assert (= (and b!1432997 res!966868) b!1432992))

(assert (= (and b!1432992 res!966866) b!1432994))

(assert (= (and b!1432992 (not res!966859)) b!1433002))

(declare-fun m!1322825 () Bool)

(assert (=> b!1433001 m!1322825))

(declare-fun m!1322827 () Bool)

(assert (=> b!1432993 m!1322827))

(assert (=> b!1432993 m!1322827))

(declare-fun m!1322829 () Bool)

(assert (=> b!1432993 m!1322829))

(declare-fun m!1322831 () Bool)

(assert (=> b!1432993 m!1322831))

(declare-fun m!1322833 () Bool)

(assert (=> b!1432993 m!1322833))

(declare-fun m!1322835 () Bool)

(assert (=> b!1432991 m!1322835))

(assert (=> b!1432991 m!1322835))

(declare-fun m!1322837 () Bool)

(assert (=> b!1432991 m!1322837))

(assert (=> b!1432991 m!1322837))

(assert (=> b!1432991 m!1322835))

(declare-fun m!1322839 () Bool)

(assert (=> b!1432991 m!1322839))

(declare-fun m!1322841 () Bool)

(assert (=> b!1433002 m!1322841))

(declare-fun m!1322843 () Bool)

(assert (=> b!1432998 m!1322843))

(assert (=> b!1432998 m!1322843))

(declare-fun m!1322845 () Bool)

(assert (=> b!1432998 m!1322845))

(assert (=> b!1432995 m!1322835))

(assert (=> b!1432995 m!1322835))

(declare-fun m!1322847 () Bool)

(assert (=> b!1432995 m!1322847))

(declare-fun m!1322849 () Bool)

(assert (=> b!1433000 m!1322849))

(assert (=> b!1432994 m!1322835))

(assert (=> b!1432994 m!1322835))

(declare-fun m!1322851 () Bool)

(assert (=> b!1432994 m!1322851))

(declare-fun m!1322853 () Bool)

(assert (=> start!123578 m!1322853))

(declare-fun m!1322855 () Bool)

(assert (=> start!123578 m!1322855))

(assert (=> b!1433004 m!1322835))

(assert (=> b!1433004 m!1322835))

(declare-fun m!1322857 () Bool)

(assert (=> b!1433004 m!1322857))

(declare-fun m!1322859 () Bool)

(assert (=> b!1432996 m!1322859))

(assert (=> b!1432992 m!1322831))

(declare-fun m!1322861 () Bool)

(assert (=> b!1432992 m!1322861))

(declare-fun m!1322863 () Bool)

(assert (=> b!1432992 m!1322863))

(declare-fun m!1322865 () Bool)

(assert (=> b!1432992 m!1322865))

(assert (=> b!1432992 m!1322835))

(declare-fun m!1322867 () Bool)

(assert (=> b!1432992 m!1322867))

(check-sat (not b!1432995) (not b!1432994) (not b!1433004) (not b!1432991) (not b!1433000) (not b!1433002) (not b!1433001) (not b!1432993) (not b!1432998) (not start!123578) (not b!1432992) (not b!1432996))
(check-sat)
(get-model)

(declare-fun d!153985 () Bool)

(assert (=> d!153985 (= (validKeyInArray!0 (select (arr!47082 a!2831) j!81)) (and (not (= (select (arr!47082 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47082 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432995 d!153985))

(declare-fun b!1433059 () Bool)

(declare-fun e!808867 () SeekEntryResult!11361)

(declare-fun e!808868 () SeekEntryResult!11361)

(assert (=> b!1433059 (= e!808867 e!808868)))

(declare-fun lt!630861 () (_ BitVec 64))

(declare-fun lt!630860 () SeekEntryResult!11361)

(assert (=> b!1433059 (= lt!630861 (select (arr!47082 a!2831) (index!47838 lt!630860)))))

(declare-fun c!132571 () Bool)

(assert (=> b!1433059 (= c!132571 (= lt!630861 (select (arr!47082 a!2831) j!81)))))

(declare-fun b!1433060 () Bool)

(declare-fun e!808866 () SeekEntryResult!11361)

(assert (=> b!1433060 (= e!808866 (MissingZero!11361 (index!47838 lt!630860)))))

(declare-fun b!1433061 () Bool)

(assert (=> b!1433061 (= e!808868 (Found!11361 (index!47838 lt!630860)))))

(declare-fun b!1433063 () Bool)

(assert (=> b!1433063 (= e!808867 Undefined!11361)))

(declare-fun b!1433064 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97550 (_ BitVec 32)) SeekEntryResult!11361)

(assert (=> b!1433064 (= e!808866 (seekKeyOrZeroReturnVacant!0 (x!129475 lt!630860) (index!47838 lt!630860) (index!47838 lt!630860) (select (arr!47082 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153987 () Bool)

(declare-fun lt!630859 () SeekEntryResult!11361)

(get-info :version)

(assert (=> d!153987 (and (or ((_ is Undefined!11361) lt!630859) (not ((_ is Found!11361) lt!630859)) (and (bvsge (index!47837 lt!630859) #b00000000000000000000000000000000) (bvslt (index!47837 lt!630859) (size!47632 a!2831)))) (or ((_ is Undefined!11361) lt!630859) ((_ is Found!11361) lt!630859) (not ((_ is MissingZero!11361) lt!630859)) (and (bvsge (index!47836 lt!630859) #b00000000000000000000000000000000) (bvslt (index!47836 lt!630859) (size!47632 a!2831)))) (or ((_ is Undefined!11361) lt!630859) ((_ is Found!11361) lt!630859) ((_ is MissingZero!11361) lt!630859) (not ((_ is MissingVacant!11361) lt!630859)) (and (bvsge (index!47839 lt!630859) #b00000000000000000000000000000000) (bvslt (index!47839 lt!630859) (size!47632 a!2831)))) (or ((_ is Undefined!11361) lt!630859) (ite ((_ is Found!11361) lt!630859) (= (select (arr!47082 a!2831) (index!47837 lt!630859)) (select (arr!47082 a!2831) j!81)) (ite ((_ is MissingZero!11361) lt!630859) (= (select (arr!47082 a!2831) (index!47836 lt!630859)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11361) lt!630859) (= (select (arr!47082 a!2831) (index!47839 lt!630859)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153987 (= lt!630859 e!808867)))

(declare-fun c!132573 () Bool)

(assert (=> d!153987 (= c!132573 (and ((_ is Intermediate!11361) lt!630860) (undefined!12173 lt!630860)))))

(assert (=> d!153987 (= lt!630860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) (select (arr!47082 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153987 (validMask!0 mask!2608)))

(assert (=> d!153987 (= (seekEntryOrOpen!0 (select (arr!47082 a!2831) j!81) a!2831 mask!2608) lt!630859)))

(declare-fun b!1433062 () Bool)

(declare-fun c!132572 () Bool)

(assert (=> b!1433062 (= c!132572 (= lt!630861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433062 (= e!808868 e!808866)))

(assert (= (and d!153987 c!132573) b!1433063))

(assert (= (and d!153987 (not c!132573)) b!1433059))

(assert (= (and b!1433059 c!132571) b!1433061))

(assert (= (and b!1433059 (not c!132571)) b!1433062))

(assert (= (and b!1433062 c!132572) b!1433060))

(assert (= (and b!1433062 (not c!132572)) b!1433064))

(declare-fun m!1322913 () Bool)

(assert (=> b!1433059 m!1322913))

(assert (=> b!1433064 m!1322835))

(declare-fun m!1322915 () Bool)

(assert (=> b!1433064 m!1322915))

(assert (=> d!153987 m!1322837))

(assert (=> d!153987 m!1322835))

(assert (=> d!153987 m!1322839))

(declare-fun m!1322917 () Bool)

(assert (=> d!153987 m!1322917))

(declare-fun m!1322919 () Bool)

(assert (=> d!153987 m!1322919))

(declare-fun m!1322921 () Bool)

(assert (=> d!153987 m!1322921))

(assert (=> d!153987 m!1322853))

(assert (=> d!153987 m!1322835))

(assert (=> d!153987 m!1322837))

(assert (=> b!1432994 d!153987))

(declare-fun b!1433095 () Bool)

(declare-fun e!808888 () SeekEntryResult!11361)

(assert (=> b!1433095 (= e!808888 (Intermediate!11361 true index!585 x!605))))

(declare-fun b!1433096 () Bool)

(declare-fun lt!630878 () SeekEntryResult!11361)

(assert (=> b!1433096 (and (bvsge (index!47838 lt!630878) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630878) (size!47632 a!2831)))))

(declare-fun res!966923 () Bool)

(assert (=> b!1433096 (= res!966923 (= (select (arr!47082 a!2831) (index!47838 lt!630878)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808889 () Bool)

(assert (=> b!1433096 (=> res!966923 e!808889)))

(declare-fun b!1433097 () Bool)

(assert (=> b!1433097 (and (bvsge (index!47838 lt!630878) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630878) (size!47632 a!2831)))))

(declare-fun res!966924 () Bool)

(assert (=> b!1433097 (= res!966924 (= (select (arr!47082 a!2831) (index!47838 lt!630878)) (select (arr!47082 a!2831) j!81)))))

(assert (=> b!1433097 (=> res!966924 e!808889)))

(declare-fun e!808890 () Bool)

(assert (=> b!1433097 (= e!808890 e!808889)))

(declare-fun b!1433098 () Bool)

(declare-fun e!808892 () SeekEntryResult!11361)

(assert (=> b!1433098 (= e!808892 (Intermediate!11361 false index!585 x!605))))

(declare-fun b!1433099 () Bool)

(assert (=> b!1433099 (= e!808888 e!808892)))

(declare-fun lt!630877 () (_ BitVec 64))

(declare-fun c!132585 () Bool)

(assert (=> b!1433099 (= c!132585 (or (= lt!630877 (select (arr!47082 a!2831) j!81)) (= (bvadd lt!630877 lt!630877) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433101 () Bool)

(assert (=> b!1433101 (= e!808892 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47082 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433102 () Bool)

(declare-fun e!808891 () Bool)

(assert (=> b!1433102 (= e!808891 e!808890)))

(declare-fun res!966925 () Bool)

(assert (=> b!1433102 (= res!966925 (and ((_ is Intermediate!11361) lt!630878) (not (undefined!12173 lt!630878)) (bvslt (x!129475 lt!630878) #b01111111111111111111111111111110) (bvsge (x!129475 lt!630878) #b00000000000000000000000000000000) (bvsge (x!129475 lt!630878) x!605)))))

(assert (=> b!1433102 (=> (not res!966925) (not e!808890))))

(declare-fun b!1433103 () Bool)

(assert (=> b!1433103 (= e!808891 (bvsge (x!129475 lt!630878) #b01111111111111111111111111111110))))

(declare-fun d!153989 () Bool)

(assert (=> d!153989 e!808891))

(declare-fun c!132583 () Bool)

(assert (=> d!153989 (= c!132583 (and ((_ is Intermediate!11361) lt!630878) (undefined!12173 lt!630878)))))

(assert (=> d!153989 (= lt!630878 e!808888)))

(declare-fun c!132584 () Bool)

(assert (=> d!153989 (= c!132584 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153989 (= lt!630877 (select (arr!47082 a!2831) index!585))))

(assert (=> d!153989 (validMask!0 mask!2608)))

(assert (=> d!153989 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47082 a!2831) j!81) a!2831 mask!2608) lt!630878)))

(declare-fun b!1433100 () Bool)

(assert (=> b!1433100 (and (bvsge (index!47838 lt!630878) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630878) (size!47632 a!2831)))))

(assert (=> b!1433100 (= e!808889 (= (select (arr!47082 a!2831) (index!47838 lt!630878)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153989 c!132584) b!1433095))

(assert (= (and d!153989 (not c!132584)) b!1433099))

(assert (= (and b!1433099 c!132585) b!1433098))

(assert (= (and b!1433099 (not c!132585)) b!1433101))

(assert (= (and d!153989 c!132583) b!1433103))

(assert (= (and d!153989 (not c!132583)) b!1433102))

(assert (= (and b!1433102 res!966925) b!1433097))

(assert (= (and b!1433097 (not res!966924)) b!1433096))

(assert (= (and b!1433096 (not res!966923)) b!1433100))

(declare-fun m!1322931 () Bool)

(assert (=> b!1433096 m!1322931))

(assert (=> b!1433100 m!1322931))

(assert (=> b!1433101 m!1322841))

(assert (=> b!1433101 m!1322841))

(assert (=> b!1433101 m!1322835))

(declare-fun m!1322933 () Bool)

(assert (=> b!1433101 m!1322933))

(assert (=> b!1433097 m!1322931))

(assert (=> d!153989 m!1322863))

(assert (=> d!153989 m!1322853))

(assert (=> b!1433004 d!153989))

(declare-fun b!1433104 () Bool)

(declare-fun e!808893 () SeekEntryResult!11361)

(assert (=> b!1433104 (= e!808893 (Intermediate!11361 true (toIndex!0 lt!630833 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433105 () Bool)

(declare-fun lt!630881 () SeekEntryResult!11361)

(assert (=> b!1433105 (and (bvsge (index!47838 lt!630881) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630881) (size!47632 lt!630830)))))

(declare-fun res!966926 () Bool)

(assert (=> b!1433105 (= res!966926 (= (select (arr!47082 lt!630830) (index!47838 lt!630881)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808894 () Bool)

(assert (=> b!1433105 (=> res!966926 e!808894)))

(declare-fun b!1433106 () Bool)

(assert (=> b!1433106 (and (bvsge (index!47838 lt!630881) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630881) (size!47632 lt!630830)))))

(declare-fun res!966927 () Bool)

(assert (=> b!1433106 (= res!966927 (= (select (arr!47082 lt!630830) (index!47838 lt!630881)) lt!630833))))

(assert (=> b!1433106 (=> res!966927 e!808894)))

(declare-fun e!808895 () Bool)

(assert (=> b!1433106 (= e!808895 e!808894)))

(declare-fun b!1433107 () Bool)

(declare-fun e!808897 () SeekEntryResult!11361)

(assert (=> b!1433107 (= e!808897 (Intermediate!11361 false (toIndex!0 lt!630833 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433108 () Bool)

(assert (=> b!1433108 (= e!808893 e!808897)))

(declare-fun c!132588 () Bool)

(declare-fun lt!630880 () (_ BitVec 64))

(assert (=> b!1433108 (= c!132588 (or (= lt!630880 lt!630833) (= (bvadd lt!630880 lt!630880) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433110 () Bool)

(assert (=> b!1433110 (= e!808897 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630833 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630833 lt!630830 mask!2608))))

(declare-fun b!1433111 () Bool)

(declare-fun e!808896 () Bool)

(assert (=> b!1433111 (= e!808896 e!808895)))

(declare-fun res!966928 () Bool)

(assert (=> b!1433111 (= res!966928 (and ((_ is Intermediate!11361) lt!630881) (not (undefined!12173 lt!630881)) (bvslt (x!129475 lt!630881) #b01111111111111111111111111111110) (bvsge (x!129475 lt!630881) #b00000000000000000000000000000000) (bvsge (x!129475 lt!630881) #b00000000000000000000000000000000)))))

(assert (=> b!1433111 (=> (not res!966928) (not e!808895))))

(declare-fun b!1433112 () Bool)

(assert (=> b!1433112 (= e!808896 (bvsge (x!129475 lt!630881) #b01111111111111111111111111111110))))

(declare-fun d!154001 () Bool)

(assert (=> d!154001 e!808896))

(declare-fun c!132586 () Bool)

(assert (=> d!154001 (= c!132586 (and ((_ is Intermediate!11361) lt!630881) (undefined!12173 lt!630881)))))

(assert (=> d!154001 (= lt!630881 e!808893)))

(declare-fun c!132587 () Bool)

(assert (=> d!154001 (= c!132587 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154001 (= lt!630880 (select (arr!47082 lt!630830) (toIndex!0 lt!630833 mask!2608)))))

(assert (=> d!154001 (validMask!0 mask!2608)))

(assert (=> d!154001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630833 mask!2608) lt!630833 lt!630830 mask!2608) lt!630881)))

(declare-fun b!1433109 () Bool)

(assert (=> b!1433109 (and (bvsge (index!47838 lt!630881) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630881) (size!47632 lt!630830)))))

(assert (=> b!1433109 (= e!808894 (= (select (arr!47082 lt!630830) (index!47838 lt!630881)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154001 c!132587) b!1433104))

(assert (= (and d!154001 (not c!132587)) b!1433108))

(assert (= (and b!1433108 c!132588) b!1433107))

(assert (= (and b!1433108 (not c!132588)) b!1433110))

(assert (= (and d!154001 c!132586) b!1433112))

(assert (= (and d!154001 (not c!132586)) b!1433111))

(assert (= (and b!1433111 res!966928) b!1433106))

(assert (= (and b!1433106 (not res!966927)) b!1433105))

(assert (= (and b!1433105 (not res!966926)) b!1433109))

(declare-fun m!1322935 () Bool)

(assert (=> b!1433105 m!1322935))

(assert (=> b!1433109 m!1322935))

(assert (=> b!1433110 m!1322827))

(declare-fun m!1322937 () Bool)

(assert (=> b!1433110 m!1322937))

(assert (=> b!1433110 m!1322937))

(declare-fun m!1322939 () Bool)

(assert (=> b!1433110 m!1322939))

(assert (=> b!1433106 m!1322935))

(assert (=> d!154001 m!1322827))

(declare-fun m!1322941 () Bool)

(assert (=> d!154001 m!1322941))

(assert (=> d!154001 m!1322853))

(assert (=> b!1432993 d!154001))

(declare-fun d!154003 () Bool)

(declare-fun lt!630896 () (_ BitVec 32))

(declare-fun lt!630895 () (_ BitVec 32))

(assert (=> d!154003 (= lt!630896 (bvmul (bvxor lt!630895 (bvlshr lt!630895 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154003 (= lt!630895 ((_ extract 31 0) (bvand (bvxor lt!630833 (bvlshr lt!630833 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154003 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966933 (let ((h!34913 ((_ extract 31 0) (bvand (bvxor lt!630833 (bvlshr lt!630833 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129478 (bvmul (bvxor h!34913 (bvlshr h!34913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129478 (bvlshr x!129478 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966933 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966933 #b00000000000000000000000000000000))))))

(assert (=> d!154003 (= (toIndex!0 lt!630833 mask!2608) (bvand (bvxor lt!630896 (bvlshr lt!630896 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432993 d!154003))

(declare-fun d!154007 () Bool)

(declare-fun res!966943 () Bool)

(declare-fun e!808916 () Bool)

(assert (=> d!154007 (=> res!966943 e!808916)))

(assert (=> d!154007 (= res!966943 (bvsge #b00000000000000000000000000000000 (size!47632 a!2831)))))

(assert (=> d!154007 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33589) e!808916)))

(declare-fun b!1433135 () Bool)

(declare-fun e!808915 () Bool)

(declare-fun call!67486 () Bool)

(assert (=> b!1433135 (= e!808915 call!67486)))

(declare-fun b!1433136 () Bool)

(declare-fun e!808918 () Bool)

(declare-fun contains!9867 (List!33592 (_ BitVec 64)) Bool)

(assert (=> b!1433136 (= e!808918 (contains!9867 Nil!33589 (select (arr!47082 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433137 () Bool)

(declare-fun e!808917 () Bool)

(assert (=> b!1433137 (= e!808917 e!808915)))

(declare-fun c!132594 () Bool)

(assert (=> b!1433137 (= c!132594 (validKeyInArray!0 (select (arr!47082 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67483 () Bool)

(assert (=> bm!67483 (= call!67486 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132594 (Cons!33588 (select (arr!47082 a!2831) #b00000000000000000000000000000000) Nil!33589) Nil!33589)))))

(declare-fun b!1433138 () Bool)

(assert (=> b!1433138 (= e!808916 e!808917)))

(declare-fun res!966942 () Bool)

(assert (=> b!1433138 (=> (not res!966942) (not e!808917))))

(assert (=> b!1433138 (= res!966942 (not e!808918))))

(declare-fun res!966944 () Bool)

(assert (=> b!1433138 (=> (not res!966944) (not e!808918))))

(assert (=> b!1433138 (= res!966944 (validKeyInArray!0 (select (arr!47082 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433139 () Bool)

(assert (=> b!1433139 (= e!808915 call!67486)))

(assert (= (and d!154007 (not res!966943)) b!1433138))

(assert (= (and b!1433138 res!966944) b!1433136))

(assert (= (and b!1433138 res!966942) b!1433137))

(assert (= (and b!1433137 c!132594) b!1433139))

(assert (= (and b!1433137 (not c!132594)) b!1433135))

(assert (= (or b!1433139 b!1433135) bm!67483))

(declare-fun m!1322955 () Bool)

(assert (=> b!1433136 m!1322955))

(assert (=> b!1433136 m!1322955))

(declare-fun m!1322957 () Bool)

(assert (=> b!1433136 m!1322957))

(assert (=> b!1433137 m!1322955))

(assert (=> b!1433137 m!1322955))

(declare-fun m!1322959 () Bool)

(assert (=> b!1433137 m!1322959))

(assert (=> bm!67483 m!1322955))

(declare-fun m!1322961 () Bool)

(assert (=> bm!67483 m!1322961))

(assert (=> b!1433138 m!1322955))

(assert (=> b!1433138 m!1322955))

(assert (=> b!1433138 m!1322959))

(assert (=> b!1432996 d!154007))

(declare-fun b!1433140 () Bool)

(declare-fun e!808919 () SeekEntryResult!11361)

(assert (=> b!1433140 (= e!808919 (Intermediate!11361 true index!585 x!605))))

(declare-fun b!1433141 () Bool)

(declare-fun lt!630898 () SeekEntryResult!11361)

(assert (=> b!1433141 (and (bvsge (index!47838 lt!630898) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630898) (size!47632 lt!630830)))))

(declare-fun res!966945 () Bool)

(assert (=> b!1433141 (= res!966945 (= (select (arr!47082 lt!630830) (index!47838 lt!630898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808920 () Bool)

(assert (=> b!1433141 (=> res!966945 e!808920)))

(declare-fun b!1433142 () Bool)

(assert (=> b!1433142 (and (bvsge (index!47838 lt!630898) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630898) (size!47632 lt!630830)))))

(declare-fun res!966946 () Bool)

(assert (=> b!1433142 (= res!966946 (= (select (arr!47082 lt!630830) (index!47838 lt!630898)) lt!630833))))

(assert (=> b!1433142 (=> res!966946 e!808920)))

(declare-fun e!808921 () Bool)

(assert (=> b!1433142 (= e!808921 e!808920)))

(declare-fun b!1433143 () Bool)

(declare-fun e!808923 () SeekEntryResult!11361)

(assert (=> b!1433143 (= e!808923 (Intermediate!11361 false index!585 x!605))))

(declare-fun b!1433144 () Bool)

(assert (=> b!1433144 (= e!808919 e!808923)))

(declare-fun c!132597 () Bool)

(declare-fun lt!630897 () (_ BitVec 64))

(assert (=> b!1433144 (= c!132597 (or (= lt!630897 lt!630833) (= (bvadd lt!630897 lt!630897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433146 () Bool)

(assert (=> b!1433146 (= e!808923 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630833 lt!630830 mask!2608))))

(declare-fun b!1433147 () Bool)

(declare-fun e!808922 () Bool)

(assert (=> b!1433147 (= e!808922 e!808921)))

(declare-fun res!966947 () Bool)

(assert (=> b!1433147 (= res!966947 (and ((_ is Intermediate!11361) lt!630898) (not (undefined!12173 lt!630898)) (bvslt (x!129475 lt!630898) #b01111111111111111111111111111110) (bvsge (x!129475 lt!630898) #b00000000000000000000000000000000) (bvsge (x!129475 lt!630898) x!605)))))

(assert (=> b!1433147 (=> (not res!966947) (not e!808921))))

(declare-fun b!1433148 () Bool)

(assert (=> b!1433148 (= e!808922 (bvsge (x!129475 lt!630898) #b01111111111111111111111111111110))))

(declare-fun d!154009 () Bool)

(assert (=> d!154009 e!808922))

(declare-fun c!132595 () Bool)

(assert (=> d!154009 (= c!132595 (and ((_ is Intermediate!11361) lt!630898) (undefined!12173 lt!630898)))))

(assert (=> d!154009 (= lt!630898 e!808919)))

(declare-fun c!132596 () Bool)

(assert (=> d!154009 (= c!132596 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154009 (= lt!630897 (select (arr!47082 lt!630830) index!585))))

(assert (=> d!154009 (validMask!0 mask!2608)))

(assert (=> d!154009 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630833 lt!630830 mask!2608) lt!630898)))

(declare-fun b!1433145 () Bool)

(assert (=> b!1433145 (and (bvsge (index!47838 lt!630898) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630898) (size!47632 lt!630830)))))

(assert (=> b!1433145 (= e!808920 (= (select (arr!47082 lt!630830) (index!47838 lt!630898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154009 c!132596) b!1433140))

(assert (= (and d!154009 (not c!132596)) b!1433144))

(assert (= (and b!1433144 c!132597) b!1433143))

(assert (= (and b!1433144 (not c!132597)) b!1433146))

(assert (= (and d!154009 c!132595) b!1433148))

(assert (= (and d!154009 (not c!132595)) b!1433147))

(assert (= (and b!1433147 res!966947) b!1433142))

(assert (= (and b!1433142 (not res!966946)) b!1433141))

(assert (= (and b!1433141 (not res!966945)) b!1433145))

(declare-fun m!1322963 () Bool)

(assert (=> b!1433141 m!1322963))

(assert (=> b!1433145 m!1322963))

(assert (=> b!1433146 m!1322841))

(assert (=> b!1433146 m!1322841))

(declare-fun m!1322965 () Bool)

(assert (=> b!1433146 m!1322965))

(assert (=> b!1433142 m!1322963))

(declare-fun m!1322967 () Bool)

(assert (=> d!154009 m!1322967))

(assert (=> d!154009 m!1322853))

(assert (=> b!1433000 d!154009))

(declare-fun d!154011 () Bool)

(assert (=> d!154011 (= (validKeyInArray!0 (select (arr!47082 a!2831) i!982)) (and (not (= (select (arr!47082 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47082 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432998 d!154011))

(declare-fun b!1433202 () Bool)

(declare-fun e!808955 () Bool)

(declare-fun e!808956 () Bool)

(assert (=> b!1433202 (= e!808955 e!808956)))

(declare-fun lt!630915 () (_ BitVec 64))

(assert (=> b!1433202 (= lt!630915 (select (arr!47082 a!2831) j!81))))

(declare-fun lt!630916 () Unit!48468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97550 (_ BitVec 64) (_ BitVec 32)) Unit!48468)

(assert (=> b!1433202 (= lt!630916 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630915 j!81))))

(declare-fun arrayContainsKey!0 (array!97550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433202 (arrayContainsKey!0 a!2831 lt!630915 #b00000000000000000000000000000000)))

(declare-fun lt!630917 () Unit!48468)

(assert (=> b!1433202 (= lt!630917 lt!630916)))

(declare-fun res!966968 () Bool)

(assert (=> b!1433202 (= res!966968 (= (seekEntryOrOpen!0 (select (arr!47082 a!2831) j!81) a!2831 mask!2608) (Found!11361 j!81)))))

(assert (=> b!1433202 (=> (not res!966968) (not e!808956))))

(declare-fun d!154013 () Bool)

(declare-fun res!966969 () Bool)

(declare-fun e!808957 () Bool)

(assert (=> d!154013 (=> res!966969 e!808957)))

(assert (=> d!154013 (= res!966969 (bvsge j!81 (size!47632 a!2831)))))

(assert (=> d!154013 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808957)))

(declare-fun b!1433203 () Bool)

(declare-fun call!67489 () Bool)

(assert (=> b!1433203 (= e!808955 call!67489)))

(declare-fun b!1433204 () Bool)

(assert (=> b!1433204 (= e!808957 e!808955)))

(declare-fun c!132615 () Bool)

(assert (=> b!1433204 (= c!132615 (validKeyInArray!0 (select (arr!47082 a!2831) j!81)))))

(declare-fun b!1433205 () Bool)

(assert (=> b!1433205 (= e!808956 call!67489)))

(declare-fun bm!67486 () Bool)

(assert (=> bm!67486 (= call!67489 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!154013 (not res!966969)) b!1433204))

(assert (= (and b!1433204 c!132615) b!1433202))

(assert (= (and b!1433204 (not c!132615)) b!1433203))

(assert (= (and b!1433202 res!966968) b!1433205))

(assert (= (or b!1433205 b!1433203) bm!67486))

(assert (=> b!1433202 m!1322835))

(declare-fun m!1322977 () Bool)

(assert (=> b!1433202 m!1322977))

(declare-fun m!1322979 () Bool)

(assert (=> b!1433202 m!1322979))

(assert (=> b!1433202 m!1322835))

(assert (=> b!1433202 m!1322851))

(assert (=> b!1433204 m!1322835))

(assert (=> b!1433204 m!1322835))

(assert (=> b!1433204 m!1322847))

(declare-fun m!1322981 () Bool)

(assert (=> bm!67486 m!1322981))

(assert (=> b!1432992 d!154013))

(declare-fun d!154017 () Bool)

(assert (=> d!154017 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630928 () Unit!48468)

(declare-fun choose!38 (array!97550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48468)

(assert (=> d!154017 (= lt!630928 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154017 (validMask!0 mask!2608)))

(assert (=> d!154017 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630928)))

(declare-fun bs!41733 () Bool)

(assert (= bs!41733 d!154017))

(assert (=> bs!41733 m!1322865))

(declare-fun m!1322991 () Bool)

(assert (=> bs!41733 m!1322991))

(assert (=> bs!41733 m!1322853))

(assert (=> b!1432992 d!154017))

(declare-fun d!154023 () Bool)

(declare-fun lt!630937 () (_ BitVec 32))

(assert (=> d!154023 (and (bvsge lt!630937 #b00000000000000000000000000000000) (bvslt lt!630937 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154023 (= lt!630937 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154023 (validMask!0 mask!2608)))

(assert (=> d!154023 (= (nextIndex!0 index!585 x!605 mask!2608) lt!630937)))

(declare-fun bs!41734 () Bool)

(assert (= bs!41734 d!154023))

(declare-fun m!1322993 () Bool)

(assert (=> bs!41734 m!1322993))

(assert (=> bs!41734 m!1322853))

(assert (=> b!1433002 d!154023))

(declare-fun d!154027 () Bool)

(assert (=> d!154027 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123578 d!154027))

(declare-fun d!154037 () Bool)

(assert (=> d!154037 (= (array_inv!36110 a!2831) (bvsge (size!47632 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123578 d!154037))

(declare-fun e!808978 () SeekEntryResult!11361)

(declare-fun b!1433234 () Bool)

(assert (=> b!1433234 (= e!808978 (Intermediate!11361 true (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433235 () Bool)

(declare-fun lt!630945 () SeekEntryResult!11361)

(assert (=> b!1433235 (and (bvsge (index!47838 lt!630945) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630945) (size!47632 a!2831)))))

(declare-fun res!966985 () Bool)

(assert (=> b!1433235 (= res!966985 (= (select (arr!47082 a!2831) (index!47838 lt!630945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808979 () Bool)

(assert (=> b!1433235 (=> res!966985 e!808979)))

(declare-fun b!1433236 () Bool)

(assert (=> b!1433236 (and (bvsge (index!47838 lt!630945) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630945) (size!47632 a!2831)))))

(declare-fun res!966986 () Bool)

(assert (=> b!1433236 (= res!966986 (= (select (arr!47082 a!2831) (index!47838 lt!630945)) (select (arr!47082 a!2831) j!81)))))

(assert (=> b!1433236 (=> res!966986 e!808979)))

(declare-fun e!808980 () Bool)

(assert (=> b!1433236 (= e!808980 e!808979)))

(declare-fun e!808982 () SeekEntryResult!11361)

(declare-fun b!1433237 () Bool)

(assert (=> b!1433237 (= e!808982 (Intermediate!11361 false (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433238 () Bool)

(assert (=> b!1433238 (= e!808978 e!808982)))

(declare-fun lt!630944 () (_ BitVec 64))

(declare-fun c!132625 () Bool)

(assert (=> b!1433238 (= c!132625 (or (= lt!630944 (select (arr!47082 a!2831) j!81)) (= (bvadd lt!630944 lt!630944) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433240 () Bool)

(assert (=> b!1433240 (= e!808982 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47082 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433241 () Bool)

(declare-fun e!808981 () Bool)

(assert (=> b!1433241 (= e!808981 e!808980)))

(declare-fun res!966987 () Bool)

(assert (=> b!1433241 (= res!966987 (and ((_ is Intermediate!11361) lt!630945) (not (undefined!12173 lt!630945)) (bvslt (x!129475 lt!630945) #b01111111111111111111111111111110) (bvsge (x!129475 lt!630945) #b00000000000000000000000000000000) (bvsge (x!129475 lt!630945) #b00000000000000000000000000000000)))))

(assert (=> b!1433241 (=> (not res!966987) (not e!808980))))

(declare-fun b!1433242 () Bool)

(assert (=> b!1433242 (= e!808981 (bvsge (x!129475 lt!630945) #b01111111111111111111111111111110))))

(declare-fun d!154039 () Bool)

(assert (=> d!154039 e!808981))

(declare-fun c!132623 () Bool)

(assert (=> d!154039 (= c!132623 (and ((_ is Intermediate!11361) lt!630945) (undefined!12173 lt!630945)))))

(assert (=> d!154039 (= lt!630945 e!808978)))

(declare-fun c!132624 () Bool)

(assert (=> d!154039 (= c!132624 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154039 (= lt!630944 (select (arr!47082 a!2831) (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608)))))

(assert (=> d!154039 (validMask!0 mask!2608)))

(assert (=> d!154039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) (select (arr!47082 a!2831) j!81) a!2831 mask!2608) lt!630945)))

(declare-fun b!1433239 () Bool)

(assert (=> b!1433239 (and (bvsge (index!47838 lt!630945) #b00000000000000000000000000000000) (bvslt (index!47838 lt!630945) (size!47632 a!2831)))))

(assert (=> b!1433239 (= e!808979 (= (select (arr!47082 a!2831) (index!47838 lt!630945)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154039 c!132624) b!1433234))

(assert (= (and d!154039 (not c!132624)) b!1433238))

(assert (= (and b!1433238 c!132625) b!1433237))

(assert (= (and b!1433238 (not c!132625)) b!1433240))

(assert (= (and d!154039 c!132623) b!1433242))

(assert (= (and d!154039 (not c!132623)) b!1433241))

(assert (= (and b!1433241 res!966987) b!1433236))

(assert (= (and b!1433236 (not res!966986)) b!1433235))

(assert (= (and b!1433235 (not res!966985)) b!1433239))

(declare-fun m!1323011 () Bool)

(assert (=> b!1433235 m!1323011))

(assert (=> b!1433239 m!1323011))

(assert (=> b!1433240 m!1322837))

(declare-fun m!1323013 () Bool)

(assert (=> b!1433240 m!1323013))

(assert (=> b!1433240 m!1323013))

(assert (=> b!1433240 m!1322835))

(declare-fun m!1323015 () Bool)

(assert (=> b!1433240 m!1323015))

(assert (=> b!1433236 m!1323011))

(assert (=> d!154039 m!1322837))

(declare-fun m!1323017 () Bool)

(assert (=> d!154039 m!1323017))

(assert (=> d!154039 m!1322853))

(assert (=> b!1432991 d!154039))

(declare-fun d!154043 () Bool)

(declare-fun lt!630947 () (_ BitVec 32))

(declare-fun lt!630946 () (_ BitVec 32))

(assert (=> d!154043 (= lt!630947 (bvmul (bvxor lt!630946 (bvlshr lt!630946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154043 (= lt!630946 ((_ extract 31 0) (bvand (bvxor (select (arr!47082 a!2831) j!81) (bvlshr (select (arr!47082 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154043 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966933 (let ((h!34913 ((_ extract 31 0) (bvand (bvxor (select (arr!47082 a!2831) j!81) (bvlshr (select (arr!47082 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129478 (bvmul (bvxor h!34913 (bvlshr h!34913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129478 (bvlshr x!129478 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966933 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966933 #b00000000000000000000000000000000))))))

(assert (=> d!154043 (= (toIndex!0 (select (arr!47082 a!2831) j!81) mask!2608) (bvand (bvxor lt!630947 (bvlshr lt!630947 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432991 d!154043))

(declare-fun b!1433243 () Bool)

(declare-fun e!808983 () Bool)

(declare-fun e!808984 () Bool)

(assert (=> b!1433243 (= e!808983 e!808984)))

(declare-fun lt!630948 () (_ BitVec 64))

(assert (=> b!1433243 (= lt!630948 (select (arr!47082 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630949 () Unit!48468)

(assert (=> b!1433243 (= lt!630949 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630948 #b00000000000000000000000000000000))))

(assert (=> b!1433243 (arrayContainsKey!0 a!2831 lt!630948 #b00000000000000000000000000000000)))

(declare-fun lt!630950 () Unit!48468)

(assert (=> b!1433243 (= lt!630950 lt!630949)))

(declare-fun res!966988 () Bool)

(assert (=> b!1433243 (= res!966988 (= (seekEntryOrOpen!0 (select (arr!47082 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11361 #b00000000000000000000000000000000)))))

(assert (=> b!1433243 (=> (not res!966988) (not e!808984))))

(declare-fun d!154047 () Bool)

(declare-fun res!966989 () Bool)

(declare-fun e!808985 () Bool)

(assert (=> d!154047 (=> res!966989 e!808985)))

(assert (=> d!154047 (= res!966989 (bvsge #b00000000000000000000000000000000 (size!47632 a!2831)))))

(assert (=> d!154047 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808985)))

(declare-fun b!1433244 () Bool)

(declare-fun call!67494 () Bool)

(assert (=> b!1433244 (= e!808983 call!67494)))

(declare-fun b!1433245 () Bool)

(assert (=> b!1433245 (= e!808985 e!808983)))

(declare-fun c!132626 () Bool)

(assert (=> b!1433245 (= c!132626 (validKeyInArray!0 (select (arr!47082 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433246 () Bool)

(assert (=> b!1433246 (= e!808984 call!67494)))

(declare-fun bm!67491 () Bool)

(assert (=> bm!67491 (= call!67494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!154047 (not res!966989)) b!1433245))

(assert (= (and b!1433245 c!132626) b!1433243))

(assert (= (and b!1433245 (not c!132626)) b!1433244))

(assert (= (and b!1433243 res!966988) b!1433246))

(assert (= (or b!1433246 b!1433244) bm!67491))

(assert (=> b!1433243 m!1322955))

(declare-fun m!1323019 () Bool)

(assert (=> b!1433243 m!1323019))

(declare-fun m!1323021 () Bool)

(assert (=> b!1433243 m!1323021))

(assert (=> b!1433243 m!1322955))

(declare-fun m!1323023 () Bool)

(assert (=> b!1433243 m!1323023))

(assert (=> b!1433245 m!1322955))

(assert (=> b!1433245 m!1322955))

(assert (=> b!1433245 m!1322959))

(declare-fun m!1323025 () Bool)

(assert (=> bm!67491 m!1323025))

(assert (=> b!1433001 d!154047))

(check-sat (not d!154023) (not bm!67491) (not b!1433245) (not b!1433110) (not b!1433240) (not b!1433137) (not b!1433101) (not bm!67486) (not b!1433146) (not b!1433136) (not d!153989) (not d!154009) (not b!1433243) (not bm!67483) (not b!1433202) (not d!154001) (not b!1433064) (not d!154017) (not d!153987) (not b!1433204) (not b!1433138) (not d!154039))
(check-sat)
