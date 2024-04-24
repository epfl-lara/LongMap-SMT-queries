; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125136 () Bool)

(assert start!125136)

(declare-fun b!1452759 () Bool)

(declare-fun e!818058 () Bool)

(assert (=> b!1452759 (= e!818058 (not true))))

(declare-fun e!818052 () Bool)

(assert (=> b!1452759 e!818052))

(declare-fun res!983176 () Bool)

(assert (=> b!1452759 (=> (not res!983176) (not e!818052))))

(declare-datatypes ((array!98479 0))(
  ( (array!98480 (arr!47524 (Array (_ BitVec 32) (_ BitVec 64))) (size!48075 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98479)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98479 (_ BitVec 32)) Bool)

(assert (=> b!1452759 (= res!983176 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48875 0))(
  ( (Unit!48876) )
))
(declare-fun lt!637131 () Unit!48875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48875)

(assert (=> b!1452759 (= lt!637131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-datatypes ((SeekEntryResult!11673 0))(
  ( (MissingZero!11673 (index!49084 (_ BitVec 32))) (Found!11673 (index!49085 (_ BitVec 32))) (Intermediate!11673 (undefined!12485 Bool) (index!49086 (_ BitVec 32)) (x!130914 (_ BitVec 32))) (Undefined!11673) (MissingVacant!11673 (index!49087 (_ BitVec 32))) )
))
(declare-fun lt!637132 () SeekEntryResult!11673)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1452760 () Bool)

(declare-fun e!818054 () Bool)

(declare-fun lt!637129 () array!98479)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637130 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98479 (_ BitVec 32)) SeekEntryResult!11673)

(assert (=> b!1452760 (= e!818054 (= lt!637132 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637130 lt!637129 mask!2687)))))

(declare-fun b!1452761 () Bool)

(declare-fun res!983180 () Bool)

(assert (=> b!1452761 (=> (not res!983180) (not e!818052))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98479 (_ BitVec 32)) SeekEntryResult!11673)

(assert (=> b!1452761 (= res!983180 (= (seekEntryOrOpen!0 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) (Found!11673 j!93)))))

(declare-fun b!1452762 () Bool)

(declare-fun res!983182 () Bool)

(declare-fun e!818053 () Bool)

(assert (=> b!1452762 (=> (not res!983182) (not e!818053))))

(declare-datatypes ((List!34012 0))(
  ( (Nil!34009) (Cons!34008 (h!35369 (_ BitVec 64)) (t!48698 List!34012)) )
))
(declare-fun arrayNoDuplicates!0 (array!98479 (_ BitVec 32) List!34012) Bool)

(assert (=> b!1452762 (= res!983182 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34009))))

(declare-fun b!1452763 () Bool)

(declare-fun e!818055 () Bool)

(assert (=> b!1452763 (= e!818053 e!818055)))

(declare-fun res!983179 () Bool)

(assert (=> b!1452763 (=> (not res!983179) (not e!818055))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452763 (= res!983179 (= (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452763 (= lt!637129 (array!98480 (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48075 a!2862)))))

(declare-fun b!1452764 () Bool)

(declare-fun res!983178 () Bool)

(assert (=> b!1452764 (=> (not res!983178) (not e!818053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452764 (= res!983178 (validKeyInArray!0 (select (arr!47524 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1452765 () Bool)

(assert (=> b!1452765 (= e!818052 (and (or (= (select (arr!47524 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47524 a!2862) intermediateBeforeIndex!19) (select (arr!47524 a!2862) j!93))) (or (and (= (select (arr!47524 a!2862) index!646) (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47524 a!2862) index!646) (select (arr!47524 a!2862) j!93))) (= (select (arr!47524 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452766 () Bool)

(declare-fun e!818057 () Bool)

(assert (=> b!1452766 (= e!818055 e!818057)))

(declare-fun res!983177 () Bool)

(assert (=> b!1452766 (=> (not res!983177) (not e!818057))))

(declare-fun lt!637128 () SeekEntryResult!11673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452766 (= res!983177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47524 a!2862) j!93) mask!2687) (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637128))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452766 (= lt!637128 (Intermediate!11673 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452767 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98479 (_ BitVec 32)) SeekEntryResult!11673)

(assert (=> b!1452767 (= e!818054 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637130 lt!637129 mask!2687) (seekEntryOrOpen!0 lt!637130 lt!637129 mask!2687)))))

(declare-fun b!1452768 () Bool)

(assert (=> b!1452768 (= e!818057 e!818058)))

(declare-fun res!983169 () Bool)

(assert (=> b!1452768 (=> (not res!983169) (not e!818058))))

(assert (=> b!1452768 (= res!983169 (= lt!637132 (Intermediate!11673 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452768 (= lt!637132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637130 mask!2687) lt!637130 lt!637129 mask!2687))))

(assert (=> b!1452768 (= lt!637130 (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452769 () Bool)

(declare-fun res!983174 () Bool)

(assert (=> b!1452769 (=> (not res!983174) (not e!818053))))

(assert (=> b!1452769 (= res!983174 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48075 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48075 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48075 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!983172 () Bool)

(assert (=> start!125136 (=> (not res!983172) (not e!818053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125136 (= res!983172 (validMask!0 mask!2687))))

(assert (=> start!125136 e!818053))

(assert (=> start!125136 true))

(declare-fun array_inv!36805 (array!98479) Bool)

(assert (=> start!125136 (array_inv!36805 a!2862)))

(declare-fun b!1452770 () Bool)

(declare-fun res!983170 () Bool)

(assert (=> b!1452770 (=> (not res!983170) (not e!818053))))

(assert (=> b!1452770 (= res!983170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452771 () Bool)

(declare-fun res!983181 () Bool)

(assert (=> b!1452771 (=> (not res!983181) (not e!818058))))

(assert (=> b!1452771 (= res!983181 e!818054)))

(declare-fun c!134314 () Bool)

(assert (=> b!1452771 (= c!134314 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452772 () Bool)

(declare-fun res!983183 () Bool)

(assert (=> b!1452772 (=> (not res!983183) (not e!818053))))

(assert (=> b!1452772 (= res!983183 (validKeyInArray!0 (select (arr!47524 a!2862) i!1006)))))

(declare-fun b!1452773 () Bool)

(declare-fun res!983173 () Bool)

(assert (=> b!1452773 (=> (not res!983173) (not e!818057))))

(assert (=> b!1452773 (= res!983173 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637128))))

(declare-fun b!1452774 () Bool)

(declare-fun res!983171 () Bool)

(assert (=> b!1452774 (=> (not res!983171) (not e!818053))))

(assert (=> b!1452774 (= res!983171 (and (= (size!48075 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48075 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48075 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452775 () Bool)

(declare-fun res!983175 () Bool)

(assert (=> b!1452775 (=> (not res!983175) (not e!818058))))

(assert (=> b!1452775 (= res!983175 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125136 res!983172) b!1452774))

(assert (= (and b!1452774 res!983171) b!1452772))

(assert (= (and b!1452772 res!983183) b!1452764))

(assert (= (and b!1452764 res!983178) b!1452770))

(assert (= (and b!1452770 res!983170) b!1452762))

(assert (= (and b!1452762 res!983182) b!1452769))

(assert (= (and b!1452769 res!983174) b!1452763))

(assert (= (and b!1452763 res!983179) b!1452766))

(assert (= (and b!1452766 res!983177) b!1452773))

(assert (= (and b!1452773 res!983173) b!1452768))

(assert (= (and b!1452768 res!983169) b!1452771))

(assert (= (and b!1452771 c!134314) b!1452760))

(assert (= (and b!1452771 (not c!134314)) b!1452767))

(assert (= (and b!1452771 res!983181) b!1452775))

(assert (= (and b!1452775 res!983175) b!1452759))

(assert (= (and b!1452759 res!983176) b!1452761))

(assert (= (and b!1452761 res!983180) b!1452765))

(declare-fun m!1341469 () Bool)

(assert (=> b!1452767 m!1341469))

(declare-fun m!1341471 () Bool)

(assert (=> b!1452767 m!1341471))

(declare-fun m!1341473 () Bool)

(assert (=> b!1452760 m!1341473))

(declare-fun m!1341475 () Bool)

(assert (=> b!1452763 m!1341475))

(declare-fun m!1341477 () Bool)

(assert (=> b!1452763 m!1341477))

(assert (=> b!1452765 m!1341475))

(declare-fun m!1341479 () Bool)

(assert (=> b!1452765 m!1341479))

(declare-fun m!1341481 () Bool)

(assert (=> b!1452765 m!1341481))

(declare-fun m!1341483 () Bool)

(assert (=> b!1452765 m!1341483))

(declare-fun m!1341485 () Bool)

(assert (=> b!1452765 m!1341485))

(declare-fun m!1341487 () Bool)

(assert (=> b!1452762 m!1341487))

(declare-fun m!1341489 () Bool)

(assert (=> b!1452759 m!1341489))

(declare-fun m!1341491 () Bool)

(assert (=> b!1452759 m!1341491))

(declare-fun m!1341493 () Bool)

(assert (=> b!1452772 m!1341493))

(assert (=> b!1452772 m!1341493))

(declare-fun m!1341495 () Bool)

(assert (=> b!1452772 m!1341495))

(assert (=> b!1452764 m!1341485))

(assert (=> b!1452764 m!1341485))

(declare-fun m!1341497 () Bool)

(assert (=> b!1452764 m!1341497))

(assert (=> b!1452773 m!1341485))

(assert (=> b!1452773 m!1341485))

(declare-fun m!1341499 () Bool)

(assert (=> b!1452773 m!1341499))

(declare-fun m!1341501 () Bool)

(assert (=> b!1452770 m!1341501))

(declare-fun m!1341503 () Bool)

(assert (=> b!1452768 m!1341503))

(assert (=> b!1452768 m!1341503))

(declare-fun m!1341505 () Bool)

(assert (=> b!1452768 m!1341505))

(assert (=> b!1452768 m!1341475))

(declare-fun m!1341507 () Bool)

(assert (=> b!1452768 m!1341507))

(assert (=> b!1452761 m!1341485))

(assert (=> b!1452761 m!1341485))

(declare-fun m!1341509 () Bool)

(assert (=> b!1452761 m!1341509))

(assert (=> b!1452766 m!1341485))

(assert (=> b!1452766 m!1341485))

(declare-fun m!1341511 () Bool)

(assert (=> b!1452766 m!1341511))

(assert (=> b!1452766 m!1341511))

(assert (=> b!1452766 m!1341485))

(declare-fun m!1341513 () Bool)

(assert (=> b!1452766 m!1341513))

(declare-fun m!1341515 () Bool)

(assert (=> start!125136 m!1341515))

(declare-fun m!1341517 () Bool)

(assert (=> start!125136 m!1341517))

(check-sat (not b!1452768) (not b!1452764) (not b!1452759) (not b!1452770) (not b!1452767) (not b!1452773) (not b!1452762) (not b!1452761) (not b!1452766) (not start!125136) (not b!1452760) (not b!1452772))
(check-sat)
