; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122828 () Bool)

(assert start!122828)

(declare-fun b!1424511 () Bool)

(declare-fun res!959958 () Bool)

(declare-fun e!805052 () Bool)

(assert (=> b!1424511 (=> (not res!959958) (not e!805052))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424511 (= res!959958 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424512 () Bool)

(declare-fun res!959948 () Bool)

(declare-fun e!805050 () Bool)

(assert (=> b!1424512 (=> (not res!959948) (not e!805050))))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97193 0))(
  ( (array!97194 (arr!46914 (Array (_ BitVec 32) (_ BitVec 64))) (size!47464 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97193)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424512 (= res!959948 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47464 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47464 a!2831))))))

(declare-fun b!1424514 () Bool)

(declare-fun e!805048 () Bool)

(assert (=> b!1424514 (= e!805048 true)))

(declare-fun lt!627584 () (_ BitVec 32))

(declare-fun lt!627587 () array!97193)

(declare-datatypes ((SeekEntryResult!11199 0))(
  ( (MissingZero!11199 (index!47188 (_ BitVec 32))) (Found!11199 (index!47189 (_ BitVec 32))) (Intermediate!11199 (undefined!12011 Bool) (index!47190 (_ BitVec 32)) (x!128817 (_ BitVec 32))) (Undefined!11199) (MissingVacant!11199 (index!47191 (_ BitVec 32))) )
))
(declare-fun lt!627585 () SeekEntryResult!11199)

(declare-fun lt!627586 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97193 (_ BitVec 32)) SeekEntryResult!11199)

(assert (=> b!1424514 (= lt!627585 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627584 lt!627586 lt!627587 mask!2608))))

(declare-fun b!1424515 () Bool)

(declare-fun res!959954 () Bool)

(assert (=> b!1424515 (=> (not res!959954) (not e!805050))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424515 (= res!959954 (and (= (size!47464 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47464 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47464 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424516 () Bool)

(declare-fun res!959956 () Bool)

(assert (=> b!1424516 (=> (not res!959956) (not e!805050))))

(declare-datatypes ((List!33424 0))(
  ( (Nil!33421) (Cons!33420 (h!34722 (_ BitVec 64)) (t!48118 List!33424)) )
))
(declare-fun arrayNoDuplicates!0 (array!97193 (_ BitVec 32) List!33424) Bool)

(assert (=> b!1424516 (= res!959956 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33421))))

(declare-fun b!1424517 () Bool)

(declare-fun res!959947 () Bool)

(assert (=> b!1424517 (=> (not res!959947) (not e!805052))))

(declare-fun lt!627588 () SeekEntryResult!11199)

(assert (=> b!1424517 (= res!959947 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627586 lt!627587 mask!2608) lt!627588))))

(declare-fun b!1424518 () Bool)

(declare-fun e!805051 () Bool)

(assert (=> b!1424518 (= e!805052 (not e!805051))))

(declare-fun res!959955 () Bool)

(assert (=> b!1424518 (=> res!959955 e!805051)))

(assert (=> b!1424518 (= res!959955 (or (= (select (arr!46914 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46914 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46914 a!2831) index!585) (select (arr!46914 a!2831) j!81)) (= (select (store (arr!46914 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805046 () Bool)

(assert (=> b!1424518 e!805046))

(declare-fun res!959953 () Bool)

(assert (=> b!1424518 (=> (not res!959953) (not e!805046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97193 (_ BitVec 32)) Bool)

(assert (=> b!1424518 (= res!959953 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48234 0))(
  ( (Unit!48235) )
))
(declare-fun lt!627583 () Unit!48234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48234)

(assert (=> b!1424518 (= lt!627583 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424519 () Bool)

(declare-fun res!959946 () Bool)

(assert (=> b!1424519 (=> (not res!959946) (not e!805050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424519 (= res!959946 (validKeyInArray!0 (select (arr!46914 a!2831) i!982)))))

(declare-fun b!1424520 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97193 (_ BitVec 32)) SeekEntryResult!11199)

(assert (=> b!1424520 (= e!805046 (= (seekEntryOrOpen!0 (select (arr!46914 a!2831) j!81) a!2831 mask!2608) (Found!11199 j!81)))))

(declare-fun b!1424513 () Bool)

(declare-fun res!959949 () Bool)

(assert (=> b!1424513 (=> res!959949 e!805048)))

(declare-fun lt!627582 () SeekEntryResult!11199)

(assert (=> b!1424513 (= res!959949 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627584 (select (arr!46914 a!2831) j!81) a!2831 mask!2608) lt!627582)))))

(declare-fun res!959952 () Bool)

(assert (=> start!122828 (=> (not res!959952) (not e!805050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122828 (= res!959952 (validMask!0 mask!2608))))

(assert (=> start!122828 e!805050))

(assert (=> start!122828 true))

(declare-fun array_inv!35942 (array!97193) Bool)

(assert (=> start!122828 (array_inv!35942 a!2831)))

(declare-fun b!1424521 () Bool)

(declare-fun e!805049 () Bool)

(assert (=> b!1424521 (= e!805050 e!805049)))

(declare-fun res!959945 () Bool)

(assert (=> b!1424521 (=> (not res!959945) (not e!805049))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424521 (= res!959945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46914 a!2831) j!81) mask!2608) (select (arr!46914 a!2831) j!81) a!2831 mask!2608) lt!627582))))

(assert (=> b!1424521 (= lt!627582 (Intermediate!11199 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424522 () Bool)

(assert (=> b!1424522 (= e!805049 e!805052)))

(declare-fun res!959957 () Bool)

(assert (=> b!1424522 (=> (not res!959957) (not e!805052))))

(assert (=> b!1424522 (= res!959957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627586 mask!2608) lt!627586 lt!627587 mask!2608) lt!627588))))

(assert (=> b!1424522 (= lt!627588 (Intermediate!11199 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424522 (= lt!627586 (select (store (arr!46914 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424522 (= lt!627587 (array!97194 (store (arr!46914 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47464 a!2831)))))

(declare-fun b!1424523 () Bool)

(declare-fun res!959959 () Bool)

(assert (=> b!1424523 (=> (not res!959959) (not e!805052))))

(assert (=> b!1424523 (= res!959959 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46914 a!2831) j!81) a!2831 mask!2608) lt!627582))))

(declare-fun b!1424524 () Bool)

(declare-fun res!959950 () Bool)

(assert (=> b!1424524 (=> (not res!959950) (not e!805050))))

(assert (=> b!1424524 (= res!959950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424525 () Bool)

(assert (=> b!1424525 (= e!805051 e!805048)))

(declare-fun res!959944 () Bool)

(assert (=> b!1424525 (=> res!959944 e!805048)))

(assert (=> b!1424525 (= res!959944 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627584 #b00000000000000000000000000000000) (bvsge lt!627584 (size!47464 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424525 (= lt!627584 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424526 () Bool)

(declare-fun res!959951 () Bool)

(assert (=> b!1424526 (=> (not res!959951) (not e!805050))))

(assert (=> b!1424526 (= res!959951 (validKeyInArray!0 (select (arr!46914 a!2831) j!81)))))

(assert (= (and start!122828 res!959952) b!1424515))

(assert (= (and b!1424515 res!959954) b!1424519))

(assert (= (and b!1424519 res!959946) b!1424526))

(assert (= (and b!1424526 res!959951) b!1424524))

(assert (= (and b!1424524 res!959950) b!1424516))

(assert (= (and b!1424516 res!959956) b!1424512))

(assert (= (and b!1424512 res!959948) b!1424521))

(assert (= (and b!1424521 res!959945) b!1424522))

(assert (= (and b!1424522 res!959957) b!1424523))

(assert (= (and b!1424523 res!959959) b!1424517))

(assert (= (and b!1424517 res!959947) b!1424511))

(assert (= (and b!1424511 res!959958) b!1424518))

(assert (= (and b!1424518 res!959953) b!1424520))

(assert (= (and b!1424518 (not res!959955)) b!1424525))

(assert (= (and b!1424525 (not res!959944)) b!1424513))

(assert (= (and b!1424513 (not res!959949)) b!1424514))

(declare-fun m!1315059 () Bool)

(assert (=> b!1424519 m!1315059))

(assert (=> b!1424519 m!1315059))

(declare-fun m!1315061 () Bool)

(assert (=> b!1424519 m!1315061))

(declare-fun m!1315063 () Bool)

(assert (=> b!1424514 m!1315063))

(declare-fun m!1315065 () Bool)

(assert (=> b!1424526 m!1315065))

(assert (=> b!1424526 m!1315065))

(declare-fun m!1315067 () Bool)

(assert (=> b!1424526 m!1315067))

(assert (=> b!1424521 m!1315065))

(assert (=> b!1424521 m!1315065))

(declare-fun m!1315069 () Bool)

(assert (=> b!1424521 m!1315069))

(assert (=> b!1424521 m!1315069))

(assert (=> b!1424521 m!1315065))

(declare-fun m!1315071 () Bool)

(assert (=> b!1424521 m!1315071))

(declare-fun m!1315073 () Bool)

(assert (=> start!122828 m!1315073))

(declare-fun m!1315075 () Bool)

(assert (=> start!122828 m!1315075))

(assert (=> b!1424513 m!1315065))

(assert (=> b!1424513 m!1315065))

(declare-fun m!1315077 () Bool)

(assert (=> b!1424513 m!1315077))

(assert (=> b!1424523 m!1315065))

(assert (=> b!1424523 m!1315065))

(declare-fun m!1315079 () Bool)

(assert (=> b!1424523 m!1315079))

(declare-fun m!1315081 () Bool)

(assert (=> b!1424517 m!1315081))

(assert (=> b!1424520 m!1315065))

(assert (=> b!1424520 m!1315065))

(declare-fun m!1315083 () Bool)

(assert (=> b!1424520 m!1315083))

(declare-fun m!1315085 () Bool)

(assert (=> b!1424516 m!1315085))

(declare-fun m!1315087 () Bool)

(assert (=> b!1424524 m!1315087))

(declare-fun m!1315089 () Bool)

(assert (=> b!1424518 m!1315089))

(declare-fun m!1315091 () Bool)

(assert (=> b!1424518 m!1315091))

(declare-fun m!1315093 () Bool)

(assert (=> b!1424518 m!1315093))

(declare-fun m!1315095 () Bool)

(assert (=> b!1424518 m!1315095))

(assert (=> b!1424518 m!1315065))

(declare-fun m!1315097 () Bool)

(assert (=> b!1424518 m!1315097))

(declare-fun m!1315099 () Bool)

(assert (=> b!1424525 m!1315099))

(declare-fun m!1315101 () Bool)

(assert (=> b!1424522 m!1315101))

(assert (=> b!1424522 m!1315101))

(declare-fun m!1315103 () Bool)

(assert (=> b!1424522 m!1315103))

(assert (=> b!1424522 m!1315089))

(declare-fun m!1315105 () Bool)

(assert (=> b!1424522 m!1315105))

(check-sat (not b!1424518) (not b!1424522) (not start!122828) (not b!1424523) (not b!1424526) (not b!1424516) (not b!1424517) (not b!1424521) (not b!1424525) (not b!1424513) (not b!1424514) (not b!1424524) (not b!1424519) (not b!1424520))
(check-sat)
