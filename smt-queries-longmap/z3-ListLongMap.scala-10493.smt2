; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123536 () Bool)

(assert start!123536)

(declare-fun b!1432109 () Bool)

(declare-fun e!808461 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97508 0))(
  ( (array!97509 (arr!47061 (Array (_ BitVec 32) (_ BitVec 64))) (size!47611 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97508)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11340 0))(
  ( (MissingZero!11340 (index!47752 (_ BitVec 32))) (Found!11340 (index!47753 (_ BitVec 32))) (Intermediate!11340 (undefined!12152 Bool) (index!47754 (_ BitVec 32)) (x!129398 (_ BitVec 32))) (Undefined!11340) (MissingVacant!11340 (index!47755 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97508 (_ BitVec 32)) SeekEntryResult!11340)

(assert (=> b!1432109 (= e!808461 (= (seekEntryOrOpen!0 (select (arr!47061 a!2831) j!81) a!2831 mask!2608) (Found!11340 j!81)))))

(declare-fun b!1432110 () Bool)

(declare-fun res!965974 () Bool)

(declare-fun e!808462 () Bool)

(assert (=> b!1432110 (=> (not res!965974) (not e!808462))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!630451 () SeekEntryResult!11340)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97508 (_ BitVec 32)) SeekEntryResult!11340)

(assert (=> b!1432110 (= res!965974 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47061 a!2831) j!81) a!2831 mask!2608) lt!630451))))

(declare-fun b!1432111 () Bool)

(declare-fun res!965979 () Bool)

(declare-fun e!808463 () Bool)

(assert (=> b!1432111 (=> (not res!965979) (not e!808463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432111 (= res!965979 (validKeyInArray!0 (select (arr!47061 a!2831) j!81)))))

(declare-fun b!1432112 () Bool)

(declare-fun res!965984 () Bool)

(assert (=> b!1432112 (=> (not res!965984) (not e!808463))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432112 (= res!965984 (validKeyInArray!0 (select (arr!47061 a!2831) i!982)))))

(declare-fun b!1432113 () Bool)

(declare-fun res!965986 () Bool)

(assert (=> b!1432113 (=> (not res!965986) (not e!808462))))

(declare-fun lt!630453 () array!97508)

(declare-fun lt!630456 () (_ BitVec 64))

(declare-fun lt!630454 () SeekEntryResult!11340)

(assert (=> b!1432113 (= res!965986 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630456 lt!630453 mask!2608) lt!630454))))

(declare-fun b!1432114 () Bool)

(declare-fun e!808458 () Bool)

(assert (=> b!1432114 (= e!808463 e!808458)))

(declare-fun res!965975 () Bool)

(assert (=> b!1432114 (=> (not res!965975) (not e!808458))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432114 (= res!965975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47061 a!2831) j!81) mask!2608) (select (arr!47061 a!2831) j!81) a!2831 mask!2608) lt!630451))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432114 (= lt!630451 (Intermediate!11340 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432115 () Bool)

(declare-fun e!808460 () Bool)

(assert (=> b!1432115 (= e!808460 true)))

(declare-fun lt!630455 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432115 (= lt!630455 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432116 () Bool)

(assert (=> b!1432116 (= e!808462 (not e!808460))))

(declare-fun res!965982 () Bool)

(assert (=> b!1432116 (=> res!965982 e!808460)))

(assert (=> b!1432116 (= res!965982 (or (= (select (arr!47061 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47061 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47061 a!2831) index!585) (select (arr!47061 a!2831) j!81)) (= (select (store (arr!47061 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432116 e!808461))

(declare-fun res!965980 () Bool)

(assert (=> b!1432116 (=> (not res!965980) (not e!808461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97508 (_ BitVec 32)) Bool)

(assert (=> b!1432116 (= res!965980 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48426 0))(
  ( (Unit!48427) )
))
(declare-fun lt!630452 () Unit!48426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48426)

(assert (=> b!1432116 (= lt!630452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432117 () Bool)

(declare-fun res!965978 () Bool)

(assert (=> b!1432117 (=> (not res!965978) (not e!808463))))

(declare-datatypes ((List!33571 0))(
  ( (Nil!33568) (Cons!33567 (h!34890 (_ BitVec 64)) (t!48265 List!33571)) )
))
(declare-fun arrayNoDuplicates!0 (array!97508 (_ BitVec 32) List!33571) Bool)

(assert (=> b!1432117 (= res!965978 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33568))))

(declare-fun res!965983 () Bool)

(assert (=> start!123536 (=> (not res!965983) (not e!808463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123536 (= res!965983 (validMask!0 mask!2608))))

(assert (=> start!123536 e!808463))

(assert (=> start!123536 true))

(declare-fun array_inv!36089 (array!97508) Bool)

(assert (=> start!123536 (array_inv!36089 a!2831)))

(declare-fun b!1432118 () Bool)

(declare-fun res!965976 () Bool)

(assert (=> b!1432118 (=> (not res!965976) (not e!808463))))

(assert (=> b!1432118 (= res!965976 (and (= (size!47611 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47611 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47611 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432119 () Bool)

(assert (=> b!1432119 (= e!808458 e!808462)))

(declare-fun res!965977 () Bool)

(assert (=> b!1432119 (=> (not res!965977) (not e!808462))))

(assert (=> b!1432119 (= res!965977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630456 mask!2608) lt!630456 lt!630453 mask!2608) lt!630454))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432119 (= lt!630454 (Intermediate!11340 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432119 (= lt!630456 (select (store (arr!47061 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432119 (= lt!630453 (array!97509 (store (arr!47061 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47611 a!2831)))))

(declare-fun b!1432120 () Bool)

(declare-fun res!965985 () Bool)

(assert (=> b!1432120 (=> (not res!965985) (not e!808462))))

(assert (=> b!1432120 (= res!965985 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432121 () Bool)

(declare-fun res!965973 () Bool)

(assert (=> b!1432121 (=> (not res!965973) (not e!808463))))

(assert (=> b!1432121 (= res!965973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432122 () Bool)

(declare-fun res!965981 () Bool)

(assert (=> b!1432122 (=> (not res!965981) (not e!808463))))

(assert (=> b!1432122 (= res!965981 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47611 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47611 a!2831))))))

(assert (= (and start!123536 res!965983) b!1432118))

(assert (= (and b!1432118 res!965976) b!1432112))

(assert (= (and b!1432112 res!965984) b!1432111))

(assert (= (and b!1432111 res!965979) b!1432121))

(assert (= (and b!1432121 res!965973) b!1432117))

(assert (= (and b!1432117 res!965978) b!1432122))

(assert (= (and b!1432122 res!965981) b!1432114))

(assert (= (and b!1432114 res!965975) b!1432119))

(assert (= (and b!1432119 res!965977) b!1432110))

(assert (= (and b!1432110 res!965974) b!1432113))

(assert (= (and b!1432113 res!965986) b!1432120))

(assert (= (and b!1432120 res!965985) b!1432116))

(assert (= (and b!1432116 res!965980) b!1432109))

(assert (= (and b!1432116 (not res!965982)) b!1432115))

(declare-fun m!1321901 () Bool)

(assert (=> b!1432116 m!1321901))

(declare-fun m!1321903 () Bool)

(assert (=> b!1432116 m!1321903))

(declare-fun m!1321905 () Bool)

(assert (=> b!1432116 m!1321905))

(declare-fun m!1321907 () Bool)

(assert (=> b!1432116 m!1321907))

(declare-fun m!1321909 () Bool)

(assert (=> b!1432116 m!1321909))

(declare-fun m!1321911 () Bool)

(assert (=> b!1432116 m!1321911))

(declare-fun m!1321913 () Bool)

(assert (=> b!1432119 m!1321913))

(assert (=> b!1432119 m!1321913))

(declare-fun m!1321915 () Bool)

(assert (=> b!1432119 m!1321915))

(assert (=> b!1432119 m!1321901))

(declare-fun m!1321917 () Bool)

(assert (=> b!1432119 m!1321917))

(declare-fun m!1321919 () Bool)

(assert (=> b!1432121 m!1321919))

(assert (=> b!1432109 m!1321909))

(assert (=> b!1432109 m!1321909))

(declare-fun m!1321921 () Bool)

(assert (=> b!1432109 m!1321921))

(assert (=> b!1432111 m!1321909))

(assert (=> b!1432111 m!1321909))

(declare-fun m!1321923 () Bool)

(assert (=> b!1432111 m!1321923))

(assert (=> b!1432114 m!1321909))

(assert (=> b!1432114 m!1321909))

(declare-fun m!1321925 () Bool)

(assert (=> b!1432114 m!1321925))

(assert (=> b!1432114 m!1321925))

(assert (=> b!1432114 m!1321909))

(declare-fun m!1321927 () Bool)

(assert (=> b!1432114 m!1321927))

(declare-fun m!1321929 () Bool)

(assert (=> b!1432115 m!1321929))

(declare-fun m!1321931 () Bool)

(assert (=> b!1432117 m!1321931))

(assert (=> b!1432110 m!1321909))

(assert (=> b!1432110 m!1321909))

(declare-fun m!1321933 () Bool)

(assert (=> b!1432110 m!1321933))

(declare-fun m!1321935 () Bool)

(assert (=> b!1432113 m!1321935))

(declare-fun m!1321937 () Bool)

(assert (=> start!123536 m!1321937))

(declare-fun m!1321939 () Bool)

(assert (=> start!123536 m!1321939))

(declare-fun m!1321941 () Bool)

(assert (=> b!1432112 m!1321941))

(assert (=> b!1432112 m!1321941))

(declare-fun m!1321943 () Bool)

(assert (=> b!1432112 m!1321943))

(check-sat (not b!1432113) (not b!1432110) (not b!1432121) (not b!1432112) (not b!1432119) (not b!1432116) (not b!1432111) (not start!123536) (not b!1432109) (not b!1432117) (not b!1432114) (not b!1432115))
(check-sat)
