; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123050 () Bool)

(assert start!123050)

(declare-fun b!1425480 () Bool)

(declare-fun res!960038 () Bool)

(declare-fun e!805763 () Bool)

(assert (=> b!1425480 (=> (not res!960038) (not e!805763))))

(declare-datatypes ((array!97286 0))(
  ( (array!97287 (arr!46957 (Array (_ BitVec 32) (_ BitVec 64))) (size!47508 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97286)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425480 (= res!960038 (and (= (size!47508 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47508 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47508 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960039 () Bool)

(assert (=> start!123050 (=> (not res!960039) (not e!805763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123050 (= res!960039 (validMask!0 mask!2608))))

(assert (=> start!123050 e!805763))

(assert (=> start!123050 true))

(declare-fun array_inv!36238 (array!97286) Bool)

(assert (=> start!123050 (array_inv!36238 a!2831)))

(declare-fun b!1425481 () Bool)

(declare-fun e!805764 () Bool)

(declare-fun e!805767 () Bool)

(assert (=> b!1425481 (= e!805764 e!805767)))

(declare-fun res!960041 () Bool)

(assert (=> b!1425481 (=> (not res!960041) (not e!805767))))

(declare-fun lt!627904 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11144 0))(
  ( (MissingZero!11144 (index!46968 (_ BitVec 32))) (Found!11144 (index!46969 (_ BitVec 32))) (Intermediate!11144 (undefined!11956 Bool) (index!46970 (_ BitVec 32)) (x!128763 (_ BitVec 32))) (Undefined!11144) (MissingVacant!11144 (index!46971 (_ BitVec 32))) )
))
(declare-fun lt!627905 () SeekEntryResult!11144)

(declare-fun lt!627907 () array!97286)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97286 (_ BitVec 32)) SeekEntryResult!11144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425481 (= res!960041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627904 mask!2608) lt!627904 lt!627907 mask!2608) lt!627905))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425481 (= lt!627905 (Intermediate!11144 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425481 (= lt!627904 (select (store (arr!46957 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425481 (= lt!627907 (array!97287 (store (arr!46957 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47508 a!2831)))))

(declare-fun b!1425482 () Bool)

(declare-fun e!805766 () Bool)

(assert (=> b!1425482 (= e!805766 true)))

(declare-fun lt!627902 () (_ BitVec 32))

(declare-fun lt!627903 () SeekEntryResult!11144)

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1425482 (= lt!627903 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627902 lt!627904 lt!627907 mask!2608))))

(declare-fun b!1425483 () Bool)

(assert (=> b!1425483 (= e!805763 e!805764)))

(declare-fun res!960042 () Bool)

(assert (=> b!1425483 (=> (not res!960042) (not e!805764))))

(declare-fun lt!627908 () SeekEntryResult!11144)

(assert (=> b!1425483 (= res!960042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46957 a!2831) j!81) mask!2608) (select (arr!46957 a!2831) j!81) a!2831 mask!2608) lt!627908))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425483 (= lt!627908 (Intermediate!11144 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425484 () Bool)

(declare-fun e!805769 () Bool)

(assert (=> b!1425484 (= e!805767 (not e!805769))))

(declare-fun res!960032 () Bool)

(assert (=> b!1425484 (=> res!960032 e!805769)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425484 (= res!960032 (or (= (select (arr!46957 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46957 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46957 a!2831) index!585) (select (arr!46957 a!2831) j!81)) (= (select (store (arr!46957 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805765 () Bool)

(assert (=> b!1425484 e!805765))

(declare-fun res!960035 () Bool)

(assert (=> b!1425484 (=> (not res!960035) (not e!805765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97286 (_ BitVec 32)) Bool)

(assert (=> b!1425484 (= res!960035 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48155 0))(
  ( (Unit!48156) )
))
(declare-fun lt!627906 () Unit!48155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48155)

(assert (=> b!1425484 (= lt!627906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425485 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97286 (_ BitVec 32)) SeekEntryResult!11144)

(assert (=> b!1425485 (= e!805765 (= (seekEntryOrOpen!0 (select (arr!46957 a!2831) j!81) a!2831 mask!2608) (Found!11144 j!81)))))

(declare-fun b!1425486 () Bool)

(declare-fun res!960034 () Bool)

(assert (=> b!1425486 (=> (not res!960034) (not e!805763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425486 (= res!960034 (validKeyInArray!0 (select (arr!46957 a!2831) i!982)))))

(declare-fun b!1425487 () Bool)

(declare-fun res!960030 () Bool)

(assert (=> b!1425487 (=> (not res!960030) (not e!805763))))

(declare-datatypes ((List!33454 0))(
  ( (Nil!33451) (Cons!33450 (h!34763 (_ BitVec 64)) (t!48140 List!33454)) )
))
(declare-fun arrayNoDuplicates!0 (array!97286 (_ BitVec 32) List!33454) Bool)

(assert (=> b!1425487 (= res!960030 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33451))))

(declare-fun b!1425488 () Bool)

(declare-fun res!960028 () Bool)

(assert (=> b!1425488 (=> (not res!960028) (not e!805763))))

(assert (=> b!1425488 (= res!960028 (validKeyInArray!0 (select (arr!46957 a!2831) j!81)))))

(declare-fun b!1425489 () Bool)

(assert (=> b!1425489 (= e!805769 e!805766)))

(declare-fun res!960031 () Bool)

(assert (=> b!1425489 (=> res!960031 e!805766)))

(assert (=> b!1425489 (= res!960031 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627902 #b00000000000000000000000000000000) (bvsge lt!627902 (size!47508 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425489 (= lt!627902 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425490 () Bool)

(declare-fun res!960043 () Bool)

(assert (=> b!1425490 (=> (not res!960043) (not e!805763))))

(assert (=> b!1425490 (= res!960043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425491 () Bool)

(declare-fun res!960036 () Bool)

(assert (=> b!1425491 (=> (not res!960036) (not e!805767))))

(assert (=> b!1425491 (= res!960036 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46957 a!2831) j!81) a!2831 mask!2608) lt!627908))))

(declare-fun b!1425492 () Bool)

(declare-fun res!960037 () Bool)

(assert (=> b!1425492 (=> (not res!960037) (not e!805767))))

(assert (=> b!1425492 (= res!960037 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627904 lt!627907 mask!2608) lt!627905))))

(declare-fun b!1425493 () Bool)

(declare-fun res!960033 () Bool)

(assert (=> b!1425493 (=> res!960033 e!805766)))

(assert (=> b!1425493 (= res!960033 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627902 (select (arr!46957 a!2831) j!81) a!2831 mask!2608) lt!627908)))))

(declare-fun b!1425494 () Bool)

(declare-fun res!960040 () Bool)

(assert (=> b!1425494 (=> (not res!960040) (not e!805763))))

(assert (=> b!1425494 (= res!960040 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47508 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47508 a!2831))))))

(declare-fun b!1425495 () Bool)

(declare-fun res!960029 () Bool)

(assert (=> b!1425495 (=> (not res!960029) (not e!805767))))

(assert (=> b!1425495 (= res!960029 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123050 res!960039) b!1425480))

(assert (= (and b!1425480 res!960038) b!1425486))

(assert (= (and b!1425486 res!960034) b!1425488))

(assert (= (and b!1425488 res!960028) b!1425490))

(assert (= (and b!1425490 res!960043) b!1425487))

(assert (= (and b!1425487 res!960030) b!1425494))

(assert (= (and b!1425494 res!960040) b!1425483))

(assert (= (and b!1425483 res!960042) b!1425481))

(assert (= (and b!1425481 res!960041) b!1425491))

(assert (= (and b!1425491 res!960036) b!1425492))

(assert (= (and b!1425492 res!960037) b!1425495))

(assert (= (and b!1425495 res!960029) b!1425484))

(assert (= (and b!1425484 res!960035) b!1425485))

(assert (= (and b!1425484 (not res!960032)) b!1425489))

(assert (= (and b!1425489 (not res!960031)) b!1425493))

(assert (= (and b!1425493 (not res!960033)) b!1425482))

(declare-fun m!1316145 () Bool)

(assert (=> b!1425488 m!1316145))

(assert (=> b!1425488 m!1316145))

(declare-fun m!1316147 () Bool)

(assert (=> b!1425488 m!1316147))

(assert (=> b!1425493 m!1316145))

(assert (=> b!1425493 m!1316145))

(declare-fun m!1316149 () Bool)

(assert (=> b!1425493 m!1316149))

(declare-fun m!1316151 () Bool)

(assert (=> b!1425490 m!1316151))

(declare-fun m!1316153 () Bool)

(assert (=> b!1425486 m!1316153))

(assert (=> b!1425486 m!1316153))

(declare-fun m!1316155 () Bool)

(assert (=> b!1425486 m!1316155))

(declare-fun m!1316157 () Bool)

(assert (=> b!1425489 m!1316157))

(declare-fun m!1316159 () Bool)

(assert (=> start!123050 m!1316159))

(declare-fun m!1316161 () Bool)

(assert (=> start!123050 m!1316161))

(declare-fun m!1316163 () Bool)

(assert (=> b!1425492 m!1316163))

(assert (=> b!1425485 m!1316145))

(assert (=> b!1425485 m!1316145))

(declare-fun m!1316165 () Bool)

(assert (=> b!1425485 m!1316165))

(assert (=> b!1425491 m!1316145))

(assert (=> b!1425491 m!1316145))

(declare-fun m!1316167 () Bool)

(assert (=> b!1425491 m!1316167))

(declare-fun m!1316169 () Bool)

(assert (=> b!1425482 m!1316169))

(assert (=> b!1425483 m!1316145))

(assert (=> b!1425483 m!1316145))

(declare-fun m!1316171 () Bool)

(assert (=> b!1425483 m!1316171))

(assert (=> b!1425483 m!1316171))

(assert (=> b!1425483 m!1316145))

(declare-fun m!1316173 () Bool)

(assert (=> b!1425483 m!1316173))

(declare-fun m!1316175 () Bool)

(assert (=> b!1425481 m!1316175))

(assert (=> b!1425481 m!1316175))

(declare-fun m!1316177 () Bool)

(assert (=> b!1425481 m!1316177))

(declare-fun m!1316179 () Bool)

(assert (=> b!1425481 m!1316179))

(declare-fun m!1316181 () Bool)

(assert (=> b!1425481 m!1316181))

(declare-fun m!1316183 () Bool)

(assert (=> b!1425487 m!1316183))

(assert (=> b!1425484 m!1316179))

(declare-fun m!1316185 () Bool)

(assert (=> b!1425484 m!1316185))

(declare-fun m!1316187 () Bool)

(assert (=> b!1425484 m!1316187))

(declare-fun m!1316189 () Bool)

(assert (=> b!1425484 m!1316189))

(assert (=> b!1425484 m!1316145))

(declare-fun m!1316191 () Bool)

(assert (=> b!1425484 m!1316191))

(check-sat (not b!1425482) (not b!1425492) (not b!1425490) (not b!1425486) (not b!1425488) (not b!1425491) (not b!1425489) (not start!123050) (not b!1425481) (not b!1425484) (not b!1425485) (not b!1425483) (not b!1425493) (not b!1425487))
(check-sat)
