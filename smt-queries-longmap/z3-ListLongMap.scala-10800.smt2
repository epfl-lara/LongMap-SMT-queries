; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126390 () Bool)

(assert start!126390)

(declare-fun b!1481772 () Bool)

(declare-fun res!1007059 () Bool)

(declare-fun e!831017 () Bool)

(assert (=> b!1481772 (=> (not res!1007059) (not e!831017))))

(declare-datatypes ((array!99409 0))(
  ( (array!99410 (arr!47982 (Array (_ BitVec 32) (_ BitVec 64))) (size!48532 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99409)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12222 0))(
  ( (MissingZero!12222 (index!51280 (_ BitVec 32))) (Found!12222 (index!51281 (_ BitVec 32))) (Intermediate!12222 (undefined!13034 Bool) (index!51282 (_ BitVec 32)) (x!132865 (_ BitVec 32))) (Undefined!12222) (MissingVacant!12222 (index!51283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99409 (_ BitVec 32)) SeekEntryResult!12222)

(assert (=> b!1481772 (= res!1007059 (= (seekEntryOrOpen!0 (select (arr!47982 a!2862) j!93) a!2862 mask!2687) (Found!12222 j!93)))))

(declare-fun b!1481773 () Bool)

(declare-fun e!831013 () Bool)

(declare-fun e!831015 () Bool)

(assert (=> b!1481773 (= e!831013 e!831015)))

(declare-fun res!1007068 () Bool)

(assert (=> b!1481773 (=> (not res!1007068) (not e!831015))))

(declare-fun lt!646878 () SeekEntryResult!12222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99409 (_ BitVec 32)) SeekEntryResult!12222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481773 (= res!1007068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47982 a!2862) j!93) mask!2687) (select (arr!47982 a!2862) j!93) a!2862 mask!2687) lt!646878))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481773 (= lt!646878 (Intermediate!12222 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481774 () Bool)

(declare-fun res!1007070 () Bool)

(declare-fun e!831011 () Bool)

(assert (=> b!1481774 (=> (not res!1007070) (not e!831011))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481774 (= res!1007070 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481775 () Bool)

(declare-fun e!831012 () Bool)

(assert (=> b!1481775 (= e!831012 e!831013)))

(declare-fun res!1007064 () Bool)

(assert (=> b!1481775 (=> (not res!1007064) (not e!831013))))

(assert (=> b!1481775 (= res!1007064 (= (select (store (arr!47982 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646876 () array!99409)

(assert (=> b!1481775 (= lt!646876 (array!99410 (store (arr!47982 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48532 a!2862)))))

(declare-fun b!1481776 () Bool)

(declare-fun res!1007061 () Bool)

(assert (=> b!1481776 (=> (not res!1007061) (not e!831012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99409 (_ BitVec 32)) Bool)

(assert (=> b!1481776 (= res!1007061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481777 () Bool)

(declare-fun res!1007065 () Bool)

(assert (=> b!1481777 (=> (not res!1007065) (not e!831012))))

(assert (=> b!1481777 (= res!1007065 (and (= (size!48532 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48532 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48532 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481778 () Bool)

(assert (=> b!1481778 (= e!831011 (not true))))

(assert (=> b!1481778 e!831017))

(declare-fun res!1007060 () Bool)

(assert (=> b!1481778 (=> (not res!1007060) (not e!831017))))

(assert (=> b!1481778 (= res!1007060 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49784 0))(
  ( (Unit!49785) )
))
(declare-fun lt!646874 () Unit!49784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49784)

(assert (=> b!1481778 (= lt!646874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1007066 () Bool)

(assert (=> start!126390 (=> (not res!1007066) (not e!831012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126390 (= res!1007066 (validMask!0 mask!2687))))

(assert (=> start!126390 e!831012))

(assert (=> start!126390 true))

(declare-fun array_inv!37010 (array!99409) Bool)

(assert (=> start!126390 (array_inv!37010 a!2862)))

(declare-fun b!1481771 () Bool)

(declare-fun res!1007071 () Bool)

(assert (=> b!1481771 (=> (not res!1007071) (not e!831012))))

(declare-datatypes ((List!34483 0))(
  ( (Nil!34480) (Cons!34479 (h!35850 (_ BitVec 64)) (t!49177 List!34483)) )
))
(declare-fun arrayNoDuplicates!0 (array!99409 (_ BitVec 32) List!34483) Bool)

(assert (=> b!1481771 (= res!1007071 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34480))))

(declare-fun b!1481779 () Bool)

(declare-fun res!1007069 () Bool)

(assert (=> b!1481779 (=> (not res!1007069) (not e!831012))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1481779 (= res!1007069 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48532 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48532 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48532 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481780 () Bool)

(assert (=> b!1481780 (= e!831017 (and (or (= (select (arr!47982 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47982 a!2862) intermediateBeforeIndex!19) (select (arr!47982 a!2862) j!93))) (or (and (= (select (arr!47982 a!2862) index!646) (select (store (arr!47982 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47982 a!2862) index!646) (select (arr!47982 a!2862) j!93))) (= (select (arr!47982 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47982 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481781 () Bool)

(declare-fun res!1007057 () Bool)

(assert (=> b!1481781 (=> (not res!1007057) (not e!831015))))

(assert (=> b!1481781 (= res!1007057 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47982 a!2862) j!93) a!2862 mask!2687) lt!646878))))

(declare-fun e!831016 () Bool)

(declare-fun b!1481782 () Bool)

(declare-fun lt!646877 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99409 (_ BitVec 32)) SeekEntryResult!12222)

(assert (=> b!1481782 (= e!831016 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646877 lt!646876 mask!2687) (seekEntryOrOpen!0 lt!646877 lt!646876 mask!2687)))))

(declare-fun b!1481783 () Bool)

(declare-fun res!1007058 () Bool)

(assert (=> b!1481783 (=> (not res!1007058) (not e!831012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481783 (= res!1007058 (validKeyInArray!0 (select (arr!47982 a!2862) i!1006)))))

(declare-fun b!1481784 () Bool)

(declare-fun res!1007063 () Bool)

(assert (=> b!1481784 (=> (not res!1007063) (not e!831012))))

(assert (=> b!1481784 (= res!1007063 (validKeyInArray!0 (select (arr!47982 a!2862) j!93)))))

(declare-fun b!1481785 () Bool)

(declare-fun res!1007067 () Bool)

(assert (=> b!1481785 (=> (not res!1007067) (not e!831011))))

(assert (=> b!1481785 (= res!1007067 e!831016)))

(declare-fun c!136878 () Bool)

(assert (=> b!1481785 (= c!136878 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!646875 () SeekEntryResult!12222)

(declare-fun b!1481786 () Bool)

(assert (=> b!1481786 (= e!831016 (= lt!646875 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646877 lt!646876 mask!2687)))))

(declare-fun b!1481787 () Bool)

(assert (=> b!1481787 (= e!831015 e!831011)))

(declare-fun res!1007062 () Bool)

(assert (=> b!1481787 (=> (not res!1007062) (not e!831011))))

(assert (=> b!1481787 (= res!1007062 (= lt!646875 (Intermediate!12222 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481787 (= lt!646875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646877 mask!2687) lt!646877 lt!646876 mask!2687))))

(assert (=> b!1481787 (= lt!646877 (select (store (arr!47982 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126390 res!1007066) b!1481777))

(assert (= (and b!1481777 res!1007065) b!1481783))

(assert (= (and b!1481783 res!1007058) b!1481784))

(assert (= (and b!1481784 res!1007063) b!1481776))

(assert (= (and b!1481776 res!1007061) b!1481771))

(assert (= (and b!1481771 res!1007071) b!1481779))

(assert (= (and b!1481779 res!1007069) b!1481775))

(assert (= (and b!1481775 res!1007064) b!1481773))

(assert (= (and b!1481773 res!1007068) b!1481781))

(assert (= (and b!1481781 res!1007057) b!1481787))

(assert (= (and b!1481787 res!1007062) b!1481785))

(assert (= (and b!1481785 c!136878) b!1481786))

(assert (= (and b!1481785 (not c!136878)) b!1481782))

(assert (= (and b!1481785 res!1007067) b!1481774))

(assert (= (and b!1481774 res!1007070) b!1481778))

(assert (= (and b!1481778 res!1007060) b!1481772))

(assert (= (and b!1481772 res!1007059) b!1481780))

(declare-fun m!1367505 () Bool)

(assert (=> b!1481775 m!1367505))

(declare-fun m!1367507 () Bool)

(assert (=> b!1481775 m!1367507))

(declare-fun m!1367509 () Bool)

(assert (=> b!1481782 m!1367509))

(declare-fun m!1367511 () Bool)

(assert (=> b!1481782 m!1367511))

(assert (=> b!1481780 m!1367505))

(declare-fun m!1367513 () Bool)

(assert (=> b!1481780 m!1367513))

(declare-fun m!1367515 () Bool)

(assert (=> b!1481780 m!1367515))

(declare-fun m!1367517 () Bool)

(assert (=> b!1481780 m!1367517))

(declare-fun m!1367519 () Bool)

(assert (=> b!1481780 m!1367519))

(assert (=> b!1481773 m!1367519))

(assert (=> b!1481773 m!1367519))

(declare-fun m!1367521 () Bool)

(assert (=> b!1481773 m!1367521))

(assert (=> b!1481773 m!1367521))

(assert (=> b!1481773 m!1367519))

(declare-fun m!1367523 () Bool)

(assert (=> b!1481773 m!1367523))

(assert (=> b!1481772 m!1367519))

(assert (=> b!1481772 m!1367519))

(declare-fun m!1367525 () Bool)

(assert (=> b!1481772 m!1367525))

(assert (=> b!1481784 m!1367519))

(assert (=> b!1481784 m!1367519))

(declare-fun m!1367527 () Bool)

(assert (=> b!1481784 m!1367527))

(declare-fun m!1367529 () Bool)

(assert (=> b!1481776 m!1367529))

(declare-fun m!1367531 () Bool)

(assert (=> b!1481771 m!1367531))

(assert (=> b!1481781 m!1367519))

(assert (=> b!1481781 m!1367519))

(declare-fun m!1367533 () Bool)

(assert (=> b!1481781 m!1367533))

(declare-fun m!1367535 () Bool)

(assert (=> start!126390 m!1367535))

(declare-fun m!1367537 () Bool)

(assert (=> start!126390 m!1367537))

(declare-fun m!1367539 () Bool)

(assert (=> b!1481786 m!1367539))

(declare-fun m!1367541 () Bool)

(assert (=> b!1481783 m!1367541))

(assert (=> b!1481783 m!1367541))

(declare-fun m!1367543 () Bool)

(assert (=> b!1481783 m!1367543))

(declare-fun m!1367545 () Bool)

(assert (=> b!1481787 m!1367545))

(assert (=> b!1481787 m!1367545))

(declare-fun m!1367547 () Bool)

(assert (=> b!1481787 m!1367547))

(assert (=> b!1481787 m!1367505))

(declare-fun m!1367549 () Bool)

(assert (=> b!1481787 m!1367549))

(declare-fun m!1367551 () Bool)

(assert (=> b!1481778 m!1367551))

(declare-fun m!1367553 () Bool)

(assert (=> b!1481778 m!1367553))

(check-sat (not b!1481783) (not b!1481786) (not b!1481784) (not b!1481782) (not b!1481771) (not b!1481772) (not start!126390) (not b!1481781) (not b!1481787) (not b!1481776) (not b!1481773) (not b!1481778))
(check-sat)
