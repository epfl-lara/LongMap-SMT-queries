; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123290 () Bool)

(assert start!123290)

(declare-fun res!964551 () Bool)

(declare-fun e!807326 () Bool)

(assert (=> start!123290 (=> (not res!964551) (not e!807326))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123290 (= res!964551 (validMask!0 mask!2608))))

(assert (=> start!123290 e!807326))

(assert (=> start!123290 true))

(declare-datatypes ((array!97451 0))(
  ( (array!97452 (arr!47037 (Array (_ BitVec 32) (_ BitVec 64))) (size!47587 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97451)

(declare-fun array_inv!36065 (array!97451) Bool)

(assert (=> start!123290 (array_inv!36065 a!2831)))

(declare-fun b!1429917 () Bool)

(declare-fun res!964556 () Bool)

(assert (=> b!1429917 (=> (not res!964556) (not e!807326))))

(declare-datatypes ((List!33547 0))(
  ( (Nil!33544) (Cons!33543 (h!34857 (_ BitVec 64)) (t!48241 List!33547)) )
))
(declare-fun arrayNoDuplicates!0 (array!97451 (_ BitVec 32) List!33547) Bool)

(assert (=> b!1429917 (= res!964556 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33544))))

(declare-fun b!1429918 () Bool)

(declare-fun res!964555 () Bool)

(assert (=> b!1429918 (=> (not res!964555) (not e!807326))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429918 (= res!964555 (and (= (size!47587 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47587 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47587 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429919 () Bool)

(declare-fun res!964550 () Bool)

(assert (=> b!1429919 (=> (not res!964550) (not e!807326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97451 (_ BitVec 32)) Bool)

(assert (=> b!1429919 (= res!964550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429920 () Bool)

(declare-fun res!964547 () Bool)

(declare-fun e!807323 () Bool)

(assert (=> b!1429920 (=> (not res!964547) (not e!807323))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!629551 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11316 0))(
  ( (MissingZero!11316 (index!47656 (_ BitVec 32))) (Found!11316 (index!47657 (_ BitVec 32))) (Intermediate!11316 (undefined!12128 Bool) (index!47658 (_ BitVec 32)) (x!129286 (_ BitVec 32))) (Undefined!11316) (MissingVacant!11316 (index!47659 (_ BitVec 32))) )
))
(declare-fun lt!629550 () SeekEntryResult!11316)

(declare-fun lt!629553 () array!97451)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97451 (_ BitVec 32)) SeekEntryResult!11316)

(assert (=> b!1429920 (= res!964547 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629551 lt!629553 mask!2608) lt!629550))))

(declare-fun b!1429921 () Bool)

(declare-fun e!807324 () Bool)

(assert (=> b!1429921 (= e!807326 e!807324)))

(declare-fun res!964552 () Bool)

(assert (=> b!1429921 (=> (not res!964552) (not e!807324))))

(declare-fun lt!629552 () SeekEntryResult!11316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429921 (= res!964552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) (select (arr!47037 a!2831) j!81) a!2831 mask!2608) lt!629552))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429921 (= lt!629552 (Intermediate!11316 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429922 () Bool)

(declare-fun res!964557 () Bool)

(assert (=> b!1429922 (=> (not res!964557) (not e!807326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429922 (= res!964557 (validKeyInArray!0 (select (arr!47037 a!2831) i!982)))))

(declare-fun e!807325 () Bool)

(declare-fun b!1429923 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97451 (_ BitVec 32)) SeekEntryResult!11316)

(assert (=> b!1429923 (= e!807325 (= (seekEntryOrOpen!0 (select (arr!47037 a!2831) j!81) a!2831 mask!2608) (Found!11316 j!81)))))

(declare-fun b!1429924 () Bool)

(declare-fun res!964546 () Bool)

(assert (=> b!1429924 (=> (not res!964546) (not e!807326))))

(assert (=> b!1429924 (= res!964546 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47587 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47587 a!2831))))))

(declare-fun b!1429925 () Bool)

(assert (=> b!1429925 (= e!807324 e!807323)))

(declare-fun res!964558 () Bool)

(assert (=> b!1429925 (=> (not res!964558) (not e!807323))))

(assert (=> b!1429925 (= res!964558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629551 mask!2608) lt!629551 lt!629553 mask!2608) lt!629550))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429925 (= lt!629550 (Intermediate!11316 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429925 (= lt!629551 (select (store (arr!47037 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429925 (= lt!629553 (array!97452 (store (arr!47037 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47587 a!2831)))))

(declare-fun b!1429926 () Bool)

(declare-fun res!964553 () Bool)

(assert (=> b!1429926 (=> (not res!964553) (not e!807323))))

(assert (=> b!1429926 (= res!964553 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47037 a!2831) j!81) a!2831 mask!2608) lt!629552))))

(declare-fun b!1429927 () Bool)

(declare-fun res!964548 () Bool)

(assert (=> b!1429927 (=> (not res!964548) (not e!807326))))

(assert (=> b!1429927 (= res!964548 (validKeyInArray!0 (select (arr!47037 a!2831) j!81)))))

(declare-fun b!1429928 () Bool)

(assert (=> b!1429928 (= e!807323 (not (or (= (select (arr!47037 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47037 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47037 a!2831) index!585) (select (arr!47037 a!2831) j!81)) (not (= (select (store (arr!47037 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13))))))

(assert (=> b!1429928 e!807325))

(declare-fun res!964549 () Bool)

(assert (=> b!1429928 (=> (not res!964549) (not e!807325))))

(assert (=> b!1429928 (= res!964549 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48378 0))(
  ( (Unit!48379) )
))
(declare-fun lt!629549 () Unit!48378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48378)

(assert (=> b!1429928 (= lt!629549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429929 () Bool)

(declare-fun res!964554 () Bool)

(assert (=> b!1429929 (=> (not res!964554) (not e!807323))))

(assert (=> b!1429929 (= res!964554 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123290 res!964551) b!1429918))

(assert (= (and b!1429918 res!964555) b!1429922))

(assert (= (and b!1429922 res!964557) b!1429927))

(assert (= (and b!1429927 res!964548) b!1429919))

(assert (= (and b!1429919 res!964550) b!1429917))

(assert (= (and b!1429917 res!964556) b!1429924))

(assert (= (and b!1429924 res!964546) b!1429921))

(assert (= (and b!1429921 res!964552) b!1429925))

(assert (= (and b!1429925 res!964558) b!1429926))

(assert (= (and b!1429926 res!964553) b!1429920))

(assert (= (and b!1429920 res!964547) b!1429929))

(assert (= (and b!1429929 res!964554) b!1429928))

(assert (= (and b!1429928 res!964549) b!1429923))

(declare-fun m!1320009 () Bool)

(assert (=> b!1429925 m!1320009))

(assert (=> b!1429925 m!1320009))

(declare-fun m!1320011 () Bool)

(assert (=> b!1429925 m!1320011))

(declare-fun m!1320013 () Bool)

(assert (=> b!1429925 m!1320013))

(declare-fun m!1320015 () Bool)

(assert (=> b!1429925 m!1320015))

(declare-fun m!1320017 () Bool)

(assert (=> b!1429921 m!1320017))

(assert (=> b!1429921 m!1320017))

(declare-fun m!1320019 () Bool)

(assert (=> b!1429921 m!1320019))

(assert (=> b!1429921 m!1320019))

(assert (=> b!1429921 m!1320017))

(declare-fun m!1320021 () Bool)

(assert (=> b!1429921 m!1320021))

(assert (=> b!1429928 m!1320013))

(declare-fun m!1320023 () Bool)

(assert (=> b!1429928 m!1320023))

(declare-fun m!1320025 () Bool)

(assert (=> b!1429928 m!1320025))

(declare-fun m!1320027 () Bool)

(assert (=> b!1429928 m!1320027))

(assert (=> b!1429928 m!1320017))

(declare-fun m!1320029 () Bool)

(assert (=> b!1429928 m!1320029))

(assert (=> b!1429927 m!1320017))

(assert (=> b!1429927 m!1320017))

(declare-fun m!1320031 () Bool)

(assert (=> b!1429927 m!1320031))

(declare-fun m!1320033 () Bool)

(assert (=> b!1429922 m!1320033))

(assert (=> b!1429922 m!1320033))

(declare-fun m!1320035 () Bool)

(assert (=> b!1429922 m!1320035))

(assert (=> b!1429923 m!1320017))

(assert (=> b!1429923 m!1320017))

(declare-fun m!1320037 () Bool)

(assert (=> b!1429923 m!1320037))

(declare-fun m!1320039 () Bool)

(assert (=> start!123290 m!1320039))

(declare-fun m!1320041 () Bool)

(assert (=> start!123290 m!1320041))

(assert (=> b!1429926 m!1320017))

(assert (=> b!1429926 m!1320017))

(declare-fun m!1320043 () Bool)

(assert (=> b!1429926 m!1320043))

(declare-fun m!1320045 () Bool)

(assert (=> b!1429919 m!1320045))

(declare-fun m!1320047 () Bool)

(assert (=> b!1429920 m!1320047))

(declare-fun m!1320049 () Bool)

(assert (=> b!1429917 m!1320049))

(check-sat (not start!123290) (not b!1429928) (not b!1429922) (not b!1429926) (not b!1429927) (not b!1429917) (not b!1429919) (not b!1429925) (not b!1429921) (not b!1429920) (not b!1429923))
(check-sat)
(get-model)

(declare-fun b!1429977 () Bool)

(declare-fun e!807348 () Bool)

(declare-fun e!807349 () Bool)

(assert (=> b!1429977 (= e!807348 e!807349)))

(declare-fun lt!629576 () (_ BitVec 64))

(assert (=> b!1429977 (= lt!629576 (select (arr!47037 a!2831) j!81))))

(declare-fun lt!629577 () Unit!48378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97451 (_ BitVec 64) (_ BitVec 32)) Unit!48378)

(assert (=> b!1429977 (= lt!629577 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629576 j!81))))

(declare-fun arrayContainsKey!0 (array!97451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1429977 (arrayContainsKey!0 a!2831 lt!629576 #b00000000000000000000000000000000)))

(declare-fun lt!629575 () Unit!48378)

(assert (=> b!1429977 (= lt!629575 lt!629577)))

(declare-fun res!964602 () Bool)

(assert (=> b!1429977 (= res!964602 (= (seekEntryOrOpen!0 (select (arr!47037 a!2831) j!81) a!2831 mask!2608) (Found!11316 j!81)))))

(assert (=> b!1429977 (=> (not res!964602) (not e!807349))))

(declare-fun d!153571 () Bool)

(declare-fun res!964603 () Bool)

(declare-fun e!807350 () Bool)

(assert (=> d!153571 (=> res!964603 e!807350)))

(assert (=> d!153571 (= res!964603 (bvsge j!81 (size!47587 a!2831)))))

(assert (=> d!153571 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807350)))

(declare-fun b!1429978 () Bool)

(declare-fun call!67408 () Bool)

(assert (=> b!1429978 (= e!807349 call!67408)))

(declare-fun b!1429979 () Bool)

(assert (=> b!1429979 (= e!807350 e!807348)))

(declare-fun c!132180 () Bool)

(assert (=> b!1429979 (= c!132180 (validKeyInArray!0 (select (arr!47037 a!2831) j!81)))))

(declare-fun bm!67405 () Bool)

(assert (=> bm!67405 (= call!67408 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1429980 () Bool)

(assert (=> b!1429980 (= e!807348 call!67408)))

(assert (= (and d!153571 (not res!964603)) b!1429979))

(assert (= (and b!1429979 c!132180) b!1429977))

(assert (= (and b!1429979 (not c!132180)) b!1429980))

(assert (= (and b!1429977 res!964602) b!1429978))

(assert (= (or b!1429978 b!1429980) bm!67405))

(assert (=> b!1429977 m!1320017))

(declare-fun m!1320093 () Bool)

(assert (=> b!1429977 m!1320093))

(declare-fun m!1320095 () Bool)

(assert (=> b!1429977 m!1320095))

(assert (=> b!1429977 m!1320017))

(assert (=> b!1429977 m!1320037))

(assert (=> b!1429979 m!1320017))

(assert (=> b!1429979 m!1320017))

(assert (=> b!1429979 m!1320031))

(declare-fun m!1320097 () Bool)

(assert (=> bm!67405 m!1320097))

(assert (=> b!1429928 d!153571))

(declare-fun d!153573 () Bool)

(assert (=> d!153573 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629580 () Unit!48378)

(declare-fun choose!38 (array!97451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48378)

(assert (=> d!153573 (= lt!629580 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153573 (validMask!0 mask!2608)))

(assert (=> d!153573 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629580)))

(declare-fun bs!41660 () Bool)

(assert (= bs!41660 d!153573))

(assert (=> bs!41660 m!1320027))

(declare-fun m!1320099 () Bool)

(assert (=> bs!41660 m!1320099))

(assert (=> bs!41660 m!1320039))

(assert (=> b!1429928 d!153573))

(declare-fun d!153575 () Bool)

(assert (=> d!153575 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123290 d!153575))

(declare-fun d!153577 () Bool)

(assert (=> d!153577 (= (array_inv!36065 a!2831) (bvsge (size!47587 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123290 d!153577))

(declare-fun b!1429991 () Bool)

(declare-fun e!807362 () Bool)

(declare-fun e!807360 () Bool)

(assert (=> b!1429991 (= e!807362 e!807360)))

(declare-fun res!964611 () Bool)

(assert (=> b!1429991 (=> (not res!964611) (not e!807360))))

(declare-fun e!807359 () Bool)

(assert (=> b!1429991 (= res!964611 (not e!807359))))

(declare-fun res!964612 () Bool)

(assert (=> b!1429991 (=> (not res!964612) (not e!807359))))

(assert (=> b!1429991 (= res!964612 (validKeyInArray!0 (select (arr!47037 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429992 () Bool)

(declare-fun contains!9858 (List!33547 (_ BitVec 64)) Bool)

(assert (=> b!1429992 (= e!807359 (contains!9858 Nil!33544 (select (arr!47037 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429993 () Bool)

(declare-fun e!807361 () Bool)

(declare-fun call!67411 () Bool)

(assert (=> b!1429993 (= e!807361 call!67411)))

(declare-fun d!153579 () Bool)

(declare-fun res!964610 () Bool)

(assert (=> d!153579 (=> res!964610 e!807362)))

(assert (=> d!153579 (= res!964610 (bvsge #b00000000000000000000000000000000 (size!47587 a!2831)))))

(assert (=> d!153579 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33544) e!807362)))

(declare-fun bm!67408 () Bool)

(declare-fun c!132183 () Bool)

(assert (=> bm!67408 (= call!67411 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132183 (Cons!33543 (select (arr!47037 a!2831) #b00000000000000000000000000000000) Nil!33544) Nil!33544)))))

(declare-fun b!1429994 () Bool)

(assert (=> b!1429994 (= e!807360 e!807361)))

(assert (=> b!1429994 (= c!132183 (validKeyInArray!0 (select (arr!47037 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429995 () Bool)

(assert (=> b!1429995 (= e!807361 call!67411)))

(assert (= (and d!153579 (not res!964610)) b!1429991))

(assert (= (and b!1429991 res!964612) b!1429992))

(assert (= (and b!1429991 res!964611) b!1429994))

(assert (= (and b!1429994 c!132183) b!1429995))

(assert (= (and b!1429994 (not c!132183)) b!1429993))

(assert (= (or b!1429995 b!1429993) bm!67408))

(declare-fun m!1320101 () Bool)

(assert (=> b!1429991 m!1320101))

(assert (=> b!1429991 m!1320101))

(declare-fun m!1320103 () Bool)

(assert (=> b!1429991 m!1320103))

(assert (=> b!1429992 m!1320101))

(assert (=> b!1429992 m!1320101))

(declare-fun m!1320105 () Bool)

(assert (=> b!1429992 m!1320105))

(assert (=> bm!67408 m!1320101))

(declare-fun m!1320107 () Bool)

(assert (=> bm!67408 m!1320107))

(assert (=> b!1429994 m!1320101))

(assert (=> b!1429994 m!1320101))

(assert (=> b!1429994 m!1320103))

(assert (=> b!1429917 d!153579))

(declare-fun b!1430040 () Bool)

(declare-fun e!807388 () SeekEntryResult!11316)

(declare-fun lt!629595 () SeekEntryResult!11316)

(assert (=> b!1430040 (= e!807388 (Found!11316 (index!47658 lt!629595)))))

(declare-fun d!153581 () Bool)

(declare-fun lt!629597 () SeekEntryResult!11316)

(get-info :version)

(assert (=> d!153581 (and (or ((_ is Undefined!11316) lt!629597) (not ((_ is Found!11316) lt!629597)) (and (bvsge (index!47657 lt!629597) #b00000000000000000000000000000000) (bvslt (index!47657 lt!629597) (size!47587 a!2831)))) (or ((_ is Undefined!11316) lt!629597) ((_ is Found!11316) lt!629597) (not ((_ is MissingZero!11316) lt!629597)) (and (bvsge (index!47656 lt!629597) #b00000000000000000000000000000000) (bvslt (index!47656 lt!629597) (size!47587 a!2831)))) (or ((_ is Undefined!11316) lt!629597) ((_ is Found!11316) lt!629597) ((_ is MissingZero!11316) lt!629597) (not ((_ is MissingVacant!11316) lt!629597)) (and (bvsge (index!47659 lt!629597) #b00000000000000000000000000000000) (bvslt (index!47659 lt!629597) (size!47587 a!2831)))) (or ((_ is Undefined!11316) lt!629597) (ite ((_ is Found!11316) lt!629597) (= (select (arr!47037 a!2831) (index!47657 lt!629597)) (select (arr!47037 a!2831) j!81)) (ite ((_ is MissingZero!11316) lt!629597) (= (select (arr!47037 a!2831) (index!47656 lt!629597)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11316) lt!629597) (= (select (arr!47037 a!2831) (index!47659 lt!629597)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!807389 () SeekEntryResult!11316)

(assert (=> d!153581 (= lt!629597 e!807389)))

(declare-fun c!132202 () Bool)

(assert (=> d!153581 (= c!132202 (and ((_ is Intermediate!11316) lt!629595) (undefined!12128 lt!629595)))))

(assert (=> d!153581 (= lt!629595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) (select (arr!47037 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153581 (validMask!0 mask!2608)))

(assert (=> d!153581 (= (seekEntryOrOpen!0 (select (arr!47037 a!2831) j!81) a!2831 mask!2608) lt!629597)))

(declare-fun b!1430041 () Bool)

(assert (=> b!1430041 (= e!807389 Undefined!11316)))

(declare-fun b!1430042 () Bool)

(declare-fun c!132203 () Bool)

(declare-fun lt!629596 () (_ BitVec 64))

(assert (=> b!1430042 (= c!132203 (= lt!629596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807387 () SeekEntryResult!11316)

(assert (=> b!1430042 (= e!807388 e!807387)))

(declare-fun b!1430043 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97451 (_ BitVec 32)) SeekEntryResult!11316)

(assert (=> b!1430043 (= e!807387 (seekKeyOrZeroReturnVacant!0 (x!129286 lt!629595) (index!47658 lt!629595) (index!47658 lt!629595) (select (arr!47037 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430044 () Bool)

(assert (=> b!1430044 (= e!807387 (MissingZero!11316 (index!47658 lt!629595)))))

(declare-fun b!1430045 () Bool)

(assert (=> b!1430045 (= e!807389 e!807388)))

(assert (=> b!1430045 (= lt!629596 (select (arr!47037 a!2831) (index!47658 lt!629595)))))

(declare-fun c!132204 () Bool)

(assert (=> b!1430045 (= c!132204 (= lt!629596 (select (arr!47037 a!2831) j!81)))))

(assert (= (and d!153581 c!132202) b!1430041))

(assert (= (and d!153581 (not c!132202)) b!1430045))

(assert (= (and b!1430045 c!132204) b!1430040))

(assert (= (and b!1430045 (not c!132204)) b!1430042))

(assert (= (and b!1430042 c!132203) b!1430044))

(assert (= (and b!1430042 (not c!132203)) b!1430043))

(assert (=> d!153581 m!1320017))

(assert (=> d!153581 m!1320019))

(declare-fun m!1320109 () Bool)

(assert (=> d!153581 m!1320109))

(declare-fun m!1320111 () Bool)

(assert (=> d!153581 m!1320111))

(assert (=> d!153581 m!1320039))

(assert (=> d!153581 m!1320019))

(assert (=> d!153581 m!1320017))

(assert (=> d!153581 m!1320021))

(declare-fun m!1320113 () Bool)

(assert (=> d!153581 m!1320113))

(assert (=> b!1430043 m!1320017))

(declare-fun m!1320115 () Bool)

(assert (=> b!1430043 m!1320115))

(declare-fun m!1320117 () Bool)

(assert (=> b!1430045 m!1320117))

(assert (=> b!1429923 d!153581))

(declare-fun e!807413 () SeekEntryResult!11316)

(declare-fun b!1430086 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430086 (= e!807413 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47037 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430087 () Bool)

(declare-fun lt!629612 () SeekEntryResult!11316)

(assert (=> b!1430087 (and (bvsge (index!47658 lt!629612) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629612) (size!47587 a!2831)))))

(declare-fun res!964640 () Bool)

(assert (=> b!1430087 (= res!964640 (= (select (arr!47037 a!2831) (index!47658 lt!629612)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807412 () Bool)

(assert (=> b!1430087 (=> res!964640 e!807412)))

(declare-fun b!1430089 () Bool)

(assert (=> b!1430089 (and (bvsge (index!47658 lt!629612) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629612) (size!47587 a!2831)))))

(declare-fun res!964639 () Bool)

(assert (=> b!1430089 (= res!964639 (= (select (arr!47037 a!2831) (index!47658 lt!629612)) (select (arr!47037 a!2831) j!81)))))

(assert (=> b!1430089 (=> res!964639 e!807412)))

(declare-fun e!807415 () Bool)

(assert (=> b!1430089 (= e!807415 e!807412)))

(declare-fun b!1430090 () Bool)

(assert (=> b!1430090 (= e!807413 (Intermediate!11316 false (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430091 () Bool)

(declare-fun e!807414 () SeekEntryResult!11316)

(assert (=> b!1430091 (= e!807414 e!807413)))

(declare-fun lt!629613 () (_ BitVec 64))

(declare-fun c!132218 () Bool)

(assert (=> b!1430091 (= c!132218 (or (= lt!629613 (select (arr!47037 a!2831) j!81)) (= (bvadd lt!629613 lt!629613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430092 () Bool)

(assert (=> b!1430092 (and (bvsge (index!47658 lt!629612) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629612) (size!47587 a!2831)))))

(assert (=> b!1430092 (= e!807412 (= (select (arr!47037 a!2831) (index!47658 lt!629612)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430088 () Bool)

(declare-fun e!807416 () Bool)

(assert (=> b!1430088 (= e!807416 e!807415)))

(declare-fun res!964638 () Bool)

(assert (=> b!1430088 (= res!964638 (and ((_ is Intermediate!11316) lt!629612) (not (undefined!12128 lt!629612)) (bvslt (x!129286 lt!629612) #b01111111111111111111111111111110) (bvsge (x!129286 lt!629612) #b00000000000000000000000000000000) (bvsge (x!129286 lt!629612) #b00000000000000000000000000000000)))))

(assert (=> b!1430088 (=> (not res!964638) (not e!807415))))

(declare-fun d!153587 () Bool)

(assert (=> d!153587 e!807416))

(declare-fun c!132219 () Bool)

(assert (=> d!153587 (= c!132219 (and ((_ is Intermediate!11316) lt!629612) (undefined!12128 lt!629612)))))

(assert (=> d!153587 (= lt!629612 e!807414)))

(declare-fun c!132217 () Bool)

(assert (=> d!153587 (= c!132217 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153587 (= lt!629613 (select (arr!47037 a!2831) (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608)))))

(assert (=> d!153587 (validMask!0 mask!2608)))

(assert (=> d!153587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) (select (arr!47037 a!2831) j!81) a!2831 mask!2608) lt!629612)))

(declare-fun b!1430093 () Bool)

(assert (=> b!1430093 (= e!807414 (Intermediate!11316 true (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430094 () Bool)

(assert (=> b!1430094 (= e!807416 (bvsge (x!129286 lt!629612) #b01111111111111111111111111111110))))

(assert (= (and d!153587 c!132217) b!1430093))

(assert (= (and d!153587 (not c!132217)) b!1430091))

(assert (= (and b!1430091 c!132218) b!1430090))

(assert (= (and b!1430091 (not c!132218)) b!1430086))

(assert (= (and d!153587 c!132219) b!1430094))

(assert (= (and d!153587 (not c!132219)) b!1430088))

(assert (= (and b!1430088 res!964638) b!1430089))

(assert (= (and b!1430089 (not res!964639)) b!1430087))

(assert (= (and b!1430087 (not res!964640)) b!1430092))

(assert (=> b!1430086 m!1320019))

(declare-fun m!1320135 () Bool)

(assert (=> b!1430086 m!1320135))

(assert (=> b!1430086 m!1320135))

(assert (=> b!1430086 m!1320017))

(declare-fun m!1320137 () Bool)

(assert (=> b!1430086 m!1320137))

(declare-fun m!1320139 () Bool)

(assert (=> b!1430087 m!1320139))

(assert (=> d!153587 m!1320019))

(declare-fun m!1320141 () Bool)

(assert (=> d!153587 m!1320141))

(assert (=> d!153587 m!1320039))

(assert (=> b!1430089 m!1320139))

(assert (=> b!1430092 m!1320139))

(assert (=> b!1429921 d!153587))

(declare-fun d!153603 () Bool)

(declare-fun lt!629625 () (_ BitVec 32))

(declare-fun lt!629624 () (_ BitVec 32))

(assert (=> d!153603 (= lt!629625 (bvmul (bvxor lt!629624 (bvlshr lt!629624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153603 (= lt!629624 ((_ extract 31 0) (bvand (bvxor (select (arr!47037 a!2831) j!81) (bvlshr (select (arr!47037 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153603 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964641 (let ((h!34860 ((_ extract 31 0) (bvand (bvxor (select (arr!47037 a!2831) j!81) (bvlshr (select (arr!47037 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129292 (bvmul (bvxor h!34860 (bvlshr h!34860 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129292 (bvlshr x!129292 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964641 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964641 #b00000000000000000000000000000000))))))

(assert (=> d!153603 (= (toIndex!0 (select (arr!47037 a!2831) j!81) mask!2608) (bvand (bvxor lt!629625 (bvlshr lt!629625 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429921 d!153603))

(declare-fun d!153605 () Bool)

(assert (=> d!153605 (= (validKeyInArray!0 (select (arr!47037 a!2831) i!982)) (and (not (= (select (arr!47037 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47037 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429922 d!153605))

(declare-fun d!153607 () Bool)

(assert (=> d!153607 (= (validKeyInArray!0 (select (arr!47037 a!2831) j!81)) (and (not (= (select (arr!47037 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47037 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429927 d!153607))

(declare-fun b!1430103 () Bool)

(declare-fun e!807424 () SeekEntryResult!11316)

(assert (=> b!1430103 (= e!807424 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629551 lt!629553 mask!2608))))

(declare-fun b!1430104 () Bool)

(declare-fun lt!629626 () SeekEntryResult!11316)

(assert (=> b!1430104 (and (bvsge (index!47658 lt!629626) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629626) (size!47587 lt!629553)))))

(declare-fun res!964648 () Bool)

(assert (=> b!1430104 (= res!964648 (= (select (arr!47037 lt!629553) (index!47658 lt!629626)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807423 () Bool)

(assert (=> b!1430104 (=> res!964648 e!807423)))

(declare-fun b!1430106 () Bool)

(assert (=> b!1430106 (and (bvsge (index!47658 lt!629626) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629626) (size!47587 lt!629553)))))

(declare-fun res!964647 () Bool)

(assert (=> b!1430106 (= res!964647 (= (select (arr!47037 lt!629553) (index!47658 lt!629626)) lt!629551))))

(assert (=> b!1430106 (=> res!964647 e!807423)))

(declare-fun e!807426 () Bool)

(assert (=> b!1430106 (= e!807426 e!807423)))

(declare-fun b!1430107 () Bool)

(assert (=> b!1430107 (= e!807424 (Intermediate!11316 false index!585 x!605))))

(declare-fun b!1430108 () Bool)

(declare-fun e!807425 () SeekEntryResult!11316)

(assert (=> b!1430108 (= e!807425 e!807424)))

(declare-fun c!132223 () Bool)

(declare-fun lt!629627 () (_ BitVec 64))

(assert (=> b!1430108 (= c!132223 (or (= lt!629627 lt!629551) (= (bvadd lt!629627 lt!629627) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430109 () Bool)

(assert (=> b!1430109 (and (bvsge (index!47658 lt!629626) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629626) (size!47587 lt!629553)))))

(assert (=> b!1430109 (= e!807423 (= (select (arr!47037 lt!629553) (index!47658 lt!629626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430105 () Bool)

(declare-fun e!807427 () Bool)

(assert (=> b!1430105 (= e!807427 e!807426)))

(declare-fun res!964646 () Bool)

(assert (=> b!1430105 (= res!964646 (and ((_ is Intermediate!11316) lt!629626) (not (undefined!12128 lt!629626)) (bvslt (x!129286 lt!629626) #b01111111111111111111111111111110) (bvsge (x!129286 lt!629626) #b00000000000000000000000000000000) (bvsge (x!129286 lt!629626) x!605)))))

(assert (=> b!1430105 (=> (not res!964646) (not e!807426))))

(declare-fun d!153609 () Bool)

(assert (=> d!153609 e!807427))

(declare-fun c!132224 () Bool)

(assert (=> d!153609 (= c!132224 (and ((_ is Intermediate!11316) lt!629626) (undefined!12128 lt!629626)))))

(assert (=> d!153609 (= lt!629626 e!807425)))

(declare-fun c!132222 () Bool)

(assert (=> d!153609 (= c!132222 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153609 (= lt!629627 (select (arr!47037 lt!629553) index!585))))

(assert (=> d!153609 (validMask!0 mask!2608)))

(assert (=> d!153609 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629551 lt!629553 mask!2608) lt!629626)))

(declare-fun b!1430110 () Bool)

(assert (=> b!1430110 (= e!807425 (Intermediate!11316 true index!585 x!605))))

(declare-fun b!1430111 () Bool)

(assert (=> b!1430111 (= e!807427 (bvsge (x!129286 lt!629626) #b01111111111111111111111111111110))))

(assert (= (and d!153609 c!132222) b!1430110))

(assert (= (and d!153609 (not c!132222)) b!1430108))

(assert (= (and b!1430108 c!132223) b!1430107))

(assert (= (and b!1430108 (not c!132223)) b!1430103))

(assert (= (and d!153609 c!132224) b!1430111))

(assert (= (and d!153609 (not c!132224)) b!1430105))

(assert (= (and b!1430105 res!964646) b!1430106))

(assert (= (and b!1430106 (not res!964647)) b!1430104))

(assert (= (and b!1430104 (not res!964648)) b!1430109))

(declare-fun m!1320147 () Bool)

(assert (=> b!1430103 m!1320147))

(assert (=> b!1430103 m!1320147))

(declare-fun m!1320151 () Bool)

(assert (=> b!1430103 m!1320151))

(declare-fun m!1320153 () Bool)

(assert (=> b!1430104 m!1320153))

(declare-fun m!1320155 () Bool)

(assert (=> d!153609 m!1320155))

(assert (=> d!153609 m!1320039))

(assert (=> b!1430106 m!1320153))

(assert (=> b!1430109 m!1320153))

(assert (=> b!1429920 d!153609))

(declare-fun e!807432 () SeekEntryResult!11316)

(declare-fun b!1430116 () Bool)

(assert (=> b!1430116 (= e!807432 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629551 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629551 lt!629553 mask!2608))))

(declare-fun b!1430117 () Bool)

(declare-fun lt!629631 () SeekEntryResult!11316)

(assert (=> b!1430117 (and (bvsge (index!47658 lt!629631) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629631) (size!47587 lt!629553)))))

(declare-fun res!964653 () Bool)

(assert (=> b!1430117 (= res!964653 (= (select (arr!47037 lt!629553) (index!47658 lt!629631)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807431 () Bool)

(assert (=> b!1430117 (=> res!964653 e!807431)))

(declare-fun b!1430119 () Bool)

(assert (=> b!1430119 (and (bvsge (index!47658 lt!629631) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629631) (size!47587 lt!629553)))))

(declare-fun res!964652 () Bool)

(assert (=> b!1430119 (= res!964652 (= (select (arr!47037 lt!629553) (index!47658 lt!629631)) lt!629551))))

(assert (=> b!1430119 (=> res!964652 e!807431)))

(declare-fun e!807434 () Bool)

(assert (=> b!1430119 (= e!807434 e!807431)))

(declare-fun b!1430120 () Bool)

(assert (=> b!1430120 (= e!807432 (Intermediate!11316 false (toIndex!0 lt!629551 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430121 () Bool)

(declare-fun e!807433 () SeekEntryResult!11316)

(assert (=> b!1430121 (= e!807433 e!807432)))

(declare-fun c!132227 () Bool)

(declare-fun lt!629632 () (_ BitVec 64))

(assert (=> b!1430121 (= c!132227 (or (= lt!629632 lt!629551) (= (bvadd lt!629632 lt!629632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430122 () Bool)

(assert (=> b!1430122 (and (bvsge (index!47658 lt!629631) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629631) (size!47587 lt!629553)))))

(assert (=> b!1430122 (= e!807431 (= (select (arr!47037 lt!629553) (index!47658 lt!629631)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430118 () Bool)

(declare-fun e!807435 () Bool)

(assert (=> b!1430118 (= e!807435 e!807434)))

(declare-fun res!964651 () Bool)

(assert (=> b!1430118 (= res!964651 (and ((_ is Intermediate!11316) lt!629631) (not (undefined!12128 lt!629631)) (bvslt (x!129286 lt!629631) #b01111111111111111111111111111110) (bvsge (x!129286 lt!629631) #b00000000000000000000000000000000) (bvsge (x!129286 lt!629631) #b00000000000000000000000000000000)))))

(assert (=> b!1430118 (=> (not res!964651) (not e!807434))))

(declare-fun d!153613 () Bool)

(assert (=> d!153613 e!807435))

(declare-fun c!132228 () Bool)

(assert (=> d!153613 (= c!132228 (and ((_ is Intermediate!11316) lt!629631) (undefined!12128 lt!629631)))))

(assert (=> d!153613 (= lt!629631 e!807433)))

(declare-fun c!132226 () Bool)

(assert (=> d!153613 (= c!132226 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153613 (= lt!629632 (select (arr!47037 lt!629553) (toIndex!0 lt!629551 mask!2608)))))

(assert (=> d!153613 (validMask!0 mask!2608)))

(assert (=> d!153613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629551 mask!2608) lt!629551 lt!629553 mask!2608) lt!629631)))

(declare-fun b!1430123 () Bool)

(assert (=> b!1430123 (= e!807433 (Intermediate!11316 true (toIndex!0 lt!629551 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430124 () Bool)

(assert (=> b!1430124 (= e!807435 (bvsge (x!129286 lt!629631) #b01111111111111111111111111111110))))

(assert (= (and d!153613 c!132226) b!1430123))

(assert (= (and d!153613 (not c!132226)) b!1430121))

(assert (= (and b!1430121 c!132227) b!1430120))

(assert (= (and b!1430121 (not c!132227)) b!1430116))

(assert (= (and d!153613 c!132228) b!1430124))

(assert (= (and d!153613 (not c!132228)) b!1430118))

(assert (= (and b!1430118 res!964651) b!1430119))

(assert (= (and b!1430119 (not res!964652)) b!1430117))

(assert (= (and b!1430117 (not res!964653)) b!1430122))

(assert (=> b!1430116 m!1320009))

(declare-fun m!1320157 () Bool)

(assert (=> b!1430116 m!1320157))

(assert (=> b!1430116 m!1320157))

(declare-fun m!1320159 () Bool)

(assert (=> b!1430116 m!1320159))

(declare-fun m!1320161 () Bool)

(assert (=> b!1430117 m!1320161))

(assert (=> d!153613 m!1320009))

(declare-fun m!1320163 () Bool)

(assert (=> d!153613 m!1320163))

(assert (=> d!153613 m!1320039))

(assert (=> b!1430119 m!1320161))

(assert (=> b!1430122 m!1320161))

(assert (=> b!1429925 d!153613))

(declare-fun d!153615 () Bool)

(declare-fun lt!629638 () (_ BitVec 32))

(declare-fun lt!629637 () (_ BitVec 32))

(assert (=> d!153615 (= lt!629638 (bvmul (bvxor lt!629637 (bvlshr lt!629637 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153615 (= lt!629637 ((_ extract 31 0) (bvand (bvxor lt!629551 (bvlshr lt!629551 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153615 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964641 (let ((h!34860 ((_ extract 31 0) (bvand (bvxor lt!629551 (bvlshr lt!629551 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129292 (bvmul (bvxor h!34860 (bvlshr h!34860 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129292 (bvlshr x!129292 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964641 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964641 #b00000000000000000000000000000000))))))

(assert (=> d!153615 (= (toIndex!0 lt!629551 mask!2608) (bvand (bvxor lt!629638 (bvlshr lt!629638 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429925 d!153615))

(declare-fun e!807439 () SeekEntryResult!11316)

(declare-fun b!1430129 () Bool)

(assert (=> b!1430129 (= e!807439 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47037 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430130 () Bool)

(declare-fun lt!629641 () SeekEntryResult!11316)

(assert (=> b!1430130 (and (bvsge (index!47658 lt!629641) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629641) (size!47587 a!2831)))))

(declare-fun res!964656 () Bool)

(assert (=> b!1430130 (= res!964656 (= (select (arr!47037 a!2831) (index!47658 lt!629641)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807438 () Bool)

(assert (=> b!1430130 (=> res!964656 e!807438)))

(declare-fun b!1430132 () Bool)

(assert (=> b!1430132 (and (bvsge (index!47658 lt!629641) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629641) (size!47587 a!2831)))))

(declare-fun res!964655 () Bool)

(assert (=> b!1430132 (= res!964655 (= (select (arr!47037 a!2831) (index!47658 lt!629641)) (select (arr!47037 a!2831) j!81)))))

(assert (=> b!1430132 (=> res!964655 e!807438)))

(declare-fun e!807441 () Bool)

(assert (=> b!1430132 (= e!807441 e!807438)))

(declare-fun b!1430133 () Bool)

(assert (=> b!1430133 (= e!807439 (Intermediate!11316 false index!585 x!605))))

(declare-fun b!1430134 () Bool)

(declare-fun e!807440 () SeekEntryResult!11316)

(assert (=> b!1430134 (= e!807440 e!807439)))

(declare-fun lt!629642 () (_ BitVec 64))

(declare-fun c!132232 () Bool)

(assert (=> b!1430134 (= c!132232 (or (= lt!629642 (select (arr!47037 a!2831) j!81)) (= (bvadd lt!629642 lt!629642) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430135 () Bool)

(assert (=> b!1430135 (and (bvsge (index!47658 lt!629641) #b00000000000000000000000000000000) (bvslt (index!47658 lt!629641) (size!47587 a!2831)))))

(assert (=> b!1430135 (= e!807438 (= (select (arr!47037 a!2831) (index!47658 lt!629641)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430131 () Bool)

(declare-fun e!807442 () Bool)

(assert (=> b!1430131 (= e!807442 e!807441)))

(declare-fun res!964654 () Bool)

(assert (=> b!1430131 (= res!964654 (and ((_ is Intermediate!11316) lt!629641) (not (undefined!12128 lt!629641)) (bvslt (x!129286 lt!629641) #b01111111111111111111111111111110) (bvsge (x!129286 lt!629641) #b00000000000000000000000000000000) (bvsge (x!129286 lt!629641) x!605)))))

(assert (=> b!1430131 (=> (not res!964654) (not e!807441))))

(declare-fun d!153617 () Bool)

(assert (=> d!153617 e!807442))

(declare-fun c!132233 () Bool)

(assert (=> d!153617 (= c!132233 (and ((_ is Intermediate!11316) lt!629641) (undefined!12128 lt!629641)))))

(assert (=> d!153617 (= lt!629641 e!807440)))

(declare-fun c!132231 () Bool)

(assert (=> d!153617 (= c!132231 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153617 (= lt!629642 (select (arr!47037 a!2831) index!585))))

(assert (=> d!153617 (validMask!0 mask!2608)))

(assert (=> d!153617 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47037 a!2831) j!81) a!2831 mask!2608) lt!629641)))

(declare-fun b!1430136 () Bool)

(assert (=> b!1430136 (= e!807440 (Intermediate!11316 true index!585 x!605))))

(declare-fun b!1430137 () Bool)

(assert (=> b!1430137 (= e!807442 (bvsge (x!129286 lt!629641) #b01111111111111111111111111111110))))

(assert (= (and d!153617 c!132231) b!1430136))

(assert (= (and d!153617 (not c!132231)) b!1430134))

(assert (= (and b!1430134 c!132232) b!1430133))

(assert (= (and b!1430134 (not c!132232)) b!1430129))

(assert (= (and d!153617 c!132233) b!1430137))

(assert (= (and d!153617 (not c!132233)) b!1430131))

(assert (= (and b!1430131 res!964654) b!1430132))

(assert (= (and b!1430132 (not res!964655)) b!1430130))

(assert (= (and b!1430130 (not res!964656)) b!1430135))

(assert (=> b!1430129 m!1320147))

(assert (=> b!1430129 m!1320147))

(assert (=> b!1430129 m!1320017))

(declare-fun m!1320165 () Bool)

(assert (=> b!1430129 m!1320165))

(declare-fun m!1320167 () Bool)

(assert (=> b!1430130 m!1320167))

(assert (=> d!153617 m!1320025))

(assert (=> d!153617 m!1320039))

(assert (=> b!1430132 m!1320167))

(assert (=> b!1430135 m!1320167))

(assert (=> b!1429926 d!153617))

(declare-fun b!1430146 () Bool)

(declare-fun e!807447 () Bool)

(declare-fun e!807448 () Bool)

(assert (=> b!1430146 (= e!807447 e!807448)))

(declare-fun lt!629644 () (_ BitVec 64))

(assert (=> b!1430146 (= lt!629644 (select (arr!47037 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629645 () Unit!48378)

(assert (=> b!1430146 (= lt!629645 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629644 #b00000000000000000000000000000000))))

(assert (=> b!1430146 (arrayContainsKey!0 a!2831 lt!629644 #b00000000000000000000000000000000)))

(declare-fun lt!629643 () Unit!48378)

(assert (=> b!1430146 (= lt!629643 lt!629645)))

(declare-fun res!964657 () Bool)

(assert (=> b!1430146 (= res!964657 (= (seekEntryOrOpen!0 (select (arr!47037 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11316 #b00000000000000000000000000000000)))))

(assert (=> b!1430146 (=> (not res!964657) (not e!807448))))

(declare-fun d!153619 () Bool)

(declare-fun res!964658 () Bool)

(declare-fun e!807449 () Bool)

(assert (=> d!153619 (=> res!964658 e!807449)))

(assert (=> d!153619 (= res!964658 (bvsge #b00000000000000000000000000000000 (size!47587 a!2831)))))

(assert (=> d!153619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807449)))

(declare-fun b!1430147 () Bool)

(declare-fun call!67415 () Bool)

(assert (=> b!1430147 (= e!807448 call!67415)))

(declare-fun b!1430148 () Bool)

(assert (=> b!1430148 (= e!807449 e!807447)))

(declare-fun c!132238 () Bool)

(assert (=> b!1430148 (= c!132238 (validKeyInArray!0 (select (arr!47037 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67412 () Bool)

(assert (=> bm!67412 (= call!67415 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430149 () Bool)

(assert (=> b!1430149 (= e!807447 call!67415)))

(assert (= (and d!153619 (not res!964658)) b!1430148))

(assert (= (and b!1430148 c!132238) b!1430146))

(assert (= (and b!1430148 (not c!132238)) b!1430149))

(assert (= (and b!1430146 res!964657) b!1430147))

(assert (= (or b!1430147 b!1430149) bm!67412))

(assert (=> b!1430146 m!1320101))

(declare-fun m!1320169 () Bool)

(assert (=> b!1430146 m!1320169))

(declare-fun m!1320171 () Bool)

(assert (=> b!1430146 m!1320171))

(assert (=> b!1430146 m!1320101))

(declare-fun m!1320173 () Bool)

(assert (=> b!1430146 m!1320173))

(assert (=> b!1430148 m!1320101))

(assert (=> b!1430148 m!1320101))

(assert (=> b!1430148 m!1320103))

(declare-fun m!1320175 () Bool)

(assert (=> bm!67412 m!1320175))

(assert (=> b!1429919 d!153619))

(check-sat (not d!153581) (not d!153609) (not d!153617) (not d!153573) (not d!153587) (not b!1430146) (not b!1430116) (not b!1429991) (not b!1429977) (not b!1430043) (not d!153613) (not bm!67412) (not bm!67408) (not b!1430129) (not b!1429994) (not b!1430148) (not bm!67405) (not b!1429992) (not b!1430086) (not b!1430103) (not b!1429979))
(check-sat)
