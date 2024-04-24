; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123254 () Bool)

(assert start!123254)

(declare-fun res!962527 () Bool)

(declare-fun e!806816 () Bool)

(assert (=> start!123254 (=> (not res!962527) (not e!806816))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123254 (= res!962527 (validMask!0 mask!2608))))

(assert (=> start!123254 e!806816))

(assert (=> start!123254 true))

(declare-datatypes ((array!97439 0))(
  ( (array!97440 (arr!47032 (Array (_ BitVec 32) (_ BitVec 64))) (size!47583 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97439)

(declare-fun array_inv!36313 (array!97439) Bool)

(assert (=> start!123254 (array_inv!36313 a!2831)))

(declare-fun b!1428177 () Bool)

(declare-fun e!806815 () Bool)

(assert (=> b!1428177 (= e!806816 e!806815)))

(declare-fun res!962535 () Bool)

(assert (=> b!1428177 (=> (not res!962535) (not e!806815))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11213 0))(
  ( (MissingZero!11213 (index!47244 (_ BitVec 32))) (Found!11213 (index!47245 (_ BitVec 32))) (Intermediate!11213 (undefined!12025 Bool) (index!47246 (_ BitVec 32)) (x!129038 (_ BitVec 32))) (Undefined!11213) (MissingVacant!11213 (index!47247 (_ BitVec 32))) )
))
(declare-fun lt!628816 () SeekEntryResult!11213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97439 (_ BitVec 32)) SeekEntryResult!11213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428177 (= res!962535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47032 a!2831) j!81) mask!2608) (select (arr!47032 a!2831) j!81) a!2831 mask!2608) lt!628816))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428177 (= lt!628816 (Intermediate!11213 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428178 () Bool)

(declare-fun res!962534 () Bool)

(declare-fun e!806812 () Bool)

(assert (=> b!1428178 (=> (not res!962534) (not e!806812))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428178 (= res!962534 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47032 a!2831) j!81) a!2831 mask!2608) lt!628816))))

(declare-fun b!1428179 () Bool)

(declare-fun res!962524 () Bool)

(assert (=> b!1428179 (=> (not res!962524) (not e!806816))))

(declare-datatypes ((List!33529 0))(
  ( (Nil!33526) (Cons!33525 (h!34841 (_ BitVec 64)) (t!48215 List!33529)) )
))
(declare-fun arrayNoDuplicates!0 (array!97439 (_ BitVec 32) List!33529) Bool)

(assert (=> b!1428179 (= res!962524 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33526))))

(declare-fun b!1428180 () Bool)

(declare-fun res!962532 () Bool)

(assert (=> b!1428180 (=> (not res!962532) (not e!806812))))

(declare-fun lt!628814 () SeekEntryResult!11213)

(declare-fun lt!628813 () (_ BitVec 64))

(declare-fun lt!628817 () array!97439)

(assert (=> b!1428180 (= res!962532 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628813 lt!628817 mask!2608) lt!628814))))

(declare-fun b!1428181 () Bool)

(declare-fun res!962525 () Bool)

(assert (=> b!1428181 (=> (not res!962525) (not e!806816))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428181 (= res!962525 (validKeyInArray!0 (select (arr!47032 a!2831) i!982)))))

(declare-fun b!1428182 () Bool)

(declare-fun res!962530 () Bool)

(assert (=> b!1428182 (=> (not res!962530) (not e!806816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97439 (_ BitVec 32)) Bool)

(assert (=> b!1428182 (= res!962530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428183 () Bool)

(assert (=> b!1428183 (= e!806815 e!806812)))

(declare-fun res!962533 () Bool)

(assert (=> b!1428183 (=> (not res!962533) (not e!806812))))

(assert (=> b!1428183 (= res!962533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628813 mask!2608) lt!628813 lt!628817 mask!2608) lt!628814))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428183 (= lt!628814 (Intermediate!11213 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428183 (= lt!628813 (select (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428183 (= lt!628817 (array!97440 (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47583 a!2831)))))

(declare-fun e!806813 () Bool)

(declare-fun b!1428184 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97439 (_ BitVec 32)) SeekEntryResult!11213)

(assert (=> b!1428184 (= e!806813 (= (seekEntryOrOpen!0 (select (arr!47032 a!2831) j!81) a!2831 mask!2608) (Found!11213 j!81)))))

(declare-fun b!1428185 () Bool)

(declare-fun res!962536 () Bool)

(assert (=> b!1428185 (=> (not res!962536) (not e!806812))))

(assert (=> b!1428185 (= res!962536 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428186 () Bool)

(declare-fun res!962526 () Bool)

(assert (=> b!1428186 (=> (not res!962526) (not e!806816))))

(assert (=> b!1428186 (= res!962526 (and (= (size!47583 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47583 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47583 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428187 () Bool)

(declare-fun res!962528 () Bool)

(assert (=> b!1428187 (=> (not res!962528) (not e!806816))))

(assert (=> b!1428187 (= res!962528 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47583 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47583 a!2831))))))

(declare-fun b!1428188 () Bool)

(declare-fun res!962529 () Bool)

(assert (=> b!1428188 (=> (not res!962529) (not e!806816))))

(assert (=> b!1428188 (= res!962529 (validKeyInArray!0 (select (arr!47032 a!2831) j!81)))))

(declare-fun b!1428189 () Bool)

(assert (=> b!1428189 (= e!806812 (not true))))

(assert (=> b!1428189 e!806813))

(declare-fun res!962531 () Bool)

(assert (=> b!1428189 (=> (not res!962531) (not e!806813))))

(assert (=> b!1428189 (= res!962531 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48203 0))(
  ( (Unit!48204) )
))
(declare-fun lt!628815 () Unit!48203)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48203)

(assert (=> b!1428189 (= lt!628815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123254 res!962527) b!1428186))

(assert (= (and b!1428186 res!962526) b!1428181))

(assert (= (and b!1428181 res!962525) b!1428188))

(assert (= (and b!1428188 res!962529) b!1428182))

(assert (= (and b!1428182 res!962530) b!1428179))

(assert (= (and b!1428179 res!962524) b!1428187))

(assert (= (and b!1428187 res!962528) b!1428177))

(assert (= (and b!1428177 res!962535) b!1428183))

(assert (= (and b!1428183 res!962533) b!1428178))

(assert (= (and b!1428178 res!962534) b!1428180))

(assert (= (and b!1428180 res!962532) b!1428185))

(assert (= (and b!1428185 res!962536) b!1428189))

(assert (= (and b!1428189 res!962531) b!1428184))

(declare-fun m!1318791 () Bool)

(assert (=> start!123254 m!1318791))

(declare-fun m!1318793 () Bool)

(assert (=> start!123254 m!1318793))

(declare-fun m!1318795 () Bool)

(assert (=> b!1428183 m!1318795))

(assert (=> b!1428183 m!1318795))

(declare-fun m!1318797 () Bool)

(assert (=> b!1428183 m!1318797))

(declare-fun m!1318799 () Bool)

(assert (=> b!1428183 m!1318799))

(declare-fun m!1318801 () Bool)

(assert (=> b!1428183 m!1318801))

(declare-fun m!1318803 () Bool)

(assert (=> b!1428184 m!1318803))

(assert (=> b!1428184 m!1318803))

(declare-fun m!1318805 () Bool)

(assert (=> b!1428184 m!1318805))

(assert (=> b!1428188 m!1318803))

(assert (=> b!1428188 m!1318803))

(declare-fun m!1318807 () Bool)

(assert (=> b!1428188 m!1318807))

(assert (=> b!1428177 m!1318803))

(assert (=> b!1428177 m!1318803))

(declare-fun m!1318809 () Bool)

(assert (=> b!1428177 m!1318809))

(assert (=> b!1428177 m!1318809))

(assert (=> b!1428177 m!1318803))

(declare-fun m!1318811 () Bool)

(assert (=> b!1428177 m!1318811))

(declare-fun m!1318813 () Bool)

(assert (=> b!1428189 m!1318813))

(declare-fun m!1318815 () Bool)

(assert (=> b!1428189 m!1318815))

(declare-fun m!1318817 () Bool)

(assert (=> b!1428180 m!1318817))

(declare-fun m!1318819 () Bool)

(assert (=> b!1428179 m!1318819))

(assert (=> b!1428178 m!1318803))

(assert (=> b!1428178 m!1318803))

(declare-fun m!1318821 () Bool)

(assert (=> b!1428178 m!1318821))

(declare-fun m!1318823 () Bool)

(assert (=> b!1428182 m!1318823))

(declare-fun m!1318825 () Bool)

(assert (=> b!1428181 m!1318825))

(assert (=> b!1428181 m!1318825))

(declare-fun m!1318827 () Bool)

(assert (=> b!1428181 m!1318827))

(check-sat (not b!1428188) (not b!1428177) (not b!1428184) (not b!1428180) (not b!1428181) (not b!1428178) (not start!123254) (not b!1428182) (not b!1428183) (not b!1428189) (not b!1428179))
(check-sat)
