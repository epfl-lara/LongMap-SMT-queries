; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123710 () Bool)

(assert start!123710)

(declare-fun res!967597 () Bool)

(declare-fun e!809372 () Bool)

(assert (=> start!123710 (=> (not res!967597) (not e!809372))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123710 (= res!967597 (validMask!0 mask!2608))))

(assert (=> start!123710 e!809372))

(assert (=> start!123710 true))

(declare-datatypes ((array!97533 0))(
  ( (array!97534 (arr!47071 (Array (_ BitVec 32) (_ BitVec 64))) (size!47623 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97533)

(declare-fun array_inv!36304 (array!97533) Bool)

(assert (=> start!123710 (array_inv!36304 a!2831)))

(declare-fun b!1434029 () Bool)

(declare-fun res!967599 () Bool)

(assert (=> b!1434029 (=> (not res!967599) (not e!809372))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434029 (= res!967599 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47623 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47623 a!2831))))))

(declare-fun b!1434030 () Bool)

(declare-fun res!967609 () Bool)

(declare-fun e!809376 () Bool)

(assert (=> b!1434030 (=> (not res!967609) (not e!809376))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434030 (= res!967609 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434031 () Bool)

(declare-fun e!809375 () Bool)

(assert (=> b!1434031 (= e!809372 e!809375)))

(declare-fun res!967604 () Bool)

(assert (=> b!1434031 (=> (not res!967604) (not e!809375))))

(declare-datatypes ((SeekEntryResult!11377 0))(
  ( (MissingZero!11377 (index!47900 (_ BitVec 32))) (Found!11377 (index!47901 (_ BitVec 32))) (Intermediate!11377 (undefined!12189 Bool) (index!47902 (_ BitVec 32)) (x!129544 (_ BitVec 32))) (Undefined!11377) (MissingVacant!11377 (index!47903 (_ BitVec 32))) )
))
(declare-fun lt!631139 () SeekEntryResult!11377)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97533 (_ BitVec 32)) SeekEntryResult!11377)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434031 (= res!967604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47071 a!2831) j!81) mask!2608) (select (arr!47071 a!2831) j!81) a!2831 mask!2608) lt!631139))))

(assert (=> b!1434031 (= lt!631139 (Intermediate!11377 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434032 () Bool)

(declare-fun res!967601 () Bool)

(assert (=> b!1434032 (=> (not res!967601) (not e!809372))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434032 (= res!967601 (and (= (size!47623 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47623 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47623 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434033 () Bool)

(declare-fun res!967596 () Bool)

(assert (=> b!1434033 (=> (not res!967596) (not e!809376))))

(assert (=> b!1434033 (= res!967596 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47071 a!2831) j!81) a!2831 mask!2608) lt!631139))))

(declare-fun b!1434034 () Bool)

(declare-fun res!967602 () Bool)

(assert (=> b!1434034 (=> (not res!967602) (not e!809372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97533 (_ BitVec 32)) Bool)

(assert (=> b!1434034 (= res!967602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434035 () Bool)

(declare-fun res!967600 () Bool)

(assert (=> b!1434035 (=> (not res!967600) (not e!809376))))

(declare-fun lt!631140 () (_ BitVec 64))

(declare-fun lt!631141 () SeekEntryResult!11377)

(declare-fun lt!631142 () array!97533)

(assert (=> b!1434035 (= res!967600 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631140 lt!631142 mask!2608) lt!631141))))

(declare-fun b!1434036 () Bool)

(assert (=> b!1434036 (= e!809375 e!809376)))

(declare-fun res!967608 () Bool)

(assert (=> b!1434036 (=> (not res!967608) (not e!809376))))

(assert (=> b!1434036 (= res!967608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631140 mask!2608) lt!631140 lt!631142 mask!2608) lt!631141))))

(assert (=> b!1434036 (= lt!631141 (Intermediate!11377 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434036 (= lt!631140 (select (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434036 (= lt!631142 (array!97534 (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47623 a!2831)))))

(declare-fun b!1434037 () Bool)

(declare-fun res!967607 () Bool)

(assert (=> b!1434037 (=> (not res!967607) (not e!809372))))

(declare-datatypes ((List!33659 0))(
  ( (Nil!33656) (Cons!33655 (h!34984 (_ BitVec 64)) (t!48345 List!33659)) )
))
(declare-fun arrayNoDuplicates!0 (array!97533 (_ BitVec 32) List!33659) Bool)

(assert (=> b!1434037 (= res!967607 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33656))))

(declare-fun b!1434038 () Bool)

(declare-fun e!809373 () Bool)

(assert (=> b!1434038 (= e!809376 (not e!809373))))

(declare-fun res!967606 () Bool)

(assert (=> b!1434038 (=> res!967606 e!809373)))

(assert (=> b!1434038 (= res!967606 (or (= (select (arr!47071 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47071 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47071 a!2831) index!585) (select (arr!47071 a!2831) j!81)) (= (select (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809371 () Bool)

(assert (=> b!1434038 e!809371))

(declare-fun res!967605 () Bool)

(assert (=> b!1434038 (=> (not res!967605) (not e!809371))))

(assert (=> b!1434038 (= res!967605 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48339 0))(
  ( (Unit!48340) )
))
(declare-fun lt!631138 () Unit!48339)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48339)

(assert (=> b!1434038 (= lt!631138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434039 () Bool)

(declare-fun res!967598 () Bool)

(assert (=> b!1434039 (=> (not res!967598) (not e!809372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434039 (= res!967598 (validKeyInArray!0 (select (arr!47071 a!2831) i!982)))))

(declare-fun b!1434040 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97533 (_ BitVec 32)) SeekEntryResult!11377)

(assert (=> b!1434040 (= e!809371 (= (seekEntryOrOpen!0 (select (arr!47071 a!2831) j!81) a!2831 mask!2608) (Found!11377 j!81)))))

(declare-fun b!1434041 () Bool)

(declare-fun res!967603 () Bool)

(assert (=> b!1434041 (=> (not res!967603) (not e!809372))))

(assert (=> b!1434041 (= res!967603 (validKeyInArray!0 (select (arr!47071 a!2831) j!81)))))

(declare-fun b!1434042 () Bool)

(assert (=> b!1434042 (= e!809373 true)))

(declare-fun lt!631143 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434042 (= lt!631143 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123710 res!967597) b!1434032))

(assert (= (and b!1434032 res!967601) b!1434039))

(assert (= (and b!1434039 res!967598) b!1434041))

(assert (= (and b!1434041 res!967603) b!1434034))

(assert (= (and b!1434034 res!967602) b!1434037))

(assert (= (and b!1434037 res!967607) b!1434029))

(assert (= (and b!1434029 res!967599) b!1434031))

(assert (= (and b!1434031 res!967604) b!1434036))

(assert (= (and b!1434036 res!967608) b!1434033))

(assert (= (and b!1434033 res!967596) b!1434035))

(assert (= (and b!1434035 res!967600) b!1434030))

(assert (= (and b!1434030 res!967609) b!1434038))

(assert (= (and b!1434038 res!967605) b!1434040))

(assert (= (and b!1434038 (not res!967606)) b!1434042))

(declare-fun m!1323161 () Bool)

(assert (=> b!1434039 m!1323161))

(assert (=> b!1434039 m!1323161))

(declare-fun m!1323163 () Bool)

(assert (=> b!1434039 m!1323163))

(declare-fun m!1323165 () Bool)

(assert (=> b!1434038 m!1323165))

(declare-fun m!1323167 () Bool)

(assert (=> b!1434038 m!1323167))

(declare-fun m!1323169 () Bool)

(assert (=> b!1434038 m!1323169))

(declare-fun m!1323171 () Bool)

(assert (=> b!1434038 m!1323171))

(declare-fun m!1323173 () Bool)

(assert (=> b!1434038 m!1323173))

(declare-fun m!1323175 () Bool)

(assert (=> b!1434038 m!1323175))

(assert (=> b!1434041 m!1323173))

(assert (=> b!1434041 m!1323173))

(declare-fun m!1323177 () Bool)

(assert (=> b!1434041 m!1323177))

(declare-fun m!1323179 () Bool)

(assert (=> b!1434042 m!1323179))

(assert (=> b!1434033 m!1323173))

(assert (=> b!1434033 m!1323173))

(declare-fun m!1323181 () Bool)

(assert (=> b!1434033 m!1323181))

(assert (=> b!1434031 m!1323173))

(assert (=> b!1434031 m!1323173))

(declare-fun m!1323183 () Bool)

(assert (=> b!1434031 m!1323183))

(assert (=> b!1434031 m!1323183))

(assert (=> b!1434031 m!1323173))

(declare-fun m!1323185 () Bool)

(assert (=> b!1434031 m!1323185))

(declare-fun m!1323187 () Bool)

(assert (=> b!1434037 m!1323187))

(declare-fun m!1323189 () Bool)

(assert (=> start!123710 m!1323189))

(declare-fun m!1323191 () Bool)

(assert (=> start!123710 m!1323191))

(assert (=> b!1434040 m!1323173))

(assert (=> b!1434040 m!1323173))

(declare-fun m!1323193 () Bool)

(assert (=> b!1434040 m!1323193))

(declare-fun m!1323195 () Bool)

(assert (=> b!1434036 m!1323195))

(assert (=> b!1434036 m!1323195))

(declare-fun m!1323197 () Bool)

(assert (=> b!1434036 m!1323197))

(assert (=> b!1434036 m!1323165))

(declare-fun m!1323199 () Bool)

(assert (=> b!1434036 m!1323199))

(declare-fun m!1323201 () Bool)

(assert (=> b!1434035 m!1323201))

(declare-fun m!1323203 () Bool)

(assert (=> b!1434034 m!1323203))

(check-sat (not b!1434040) (not b!1434042) (not b!1434031) (not b!1434034) (not b!1434033) (not b!1434038) (not b!1434036) (not b!1434039) (not b!1434035) (not start!123710) (not b!1434041) (not b!1434037))
(check-sat)
