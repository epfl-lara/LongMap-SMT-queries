; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126540 () Bool)

(assert start!126540)

(declare-fun b!1484800 () Bool)

(declare-fun e!832455 () Bool)

(assert (=> b!1484800 (= e!832455 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647883 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484800 (= lt!647883 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484801 () Bool)

(declare-fun res!1009561 () Bool)

(declare-fun e!832456 () Bool)

(assert (=> b!1484801 (=> (not res!1009561) (not e!832456))))

(declare-datatypes ((array!99502 0))(
  ( (array!99503 (arr!48027 (Array (_ BitVec 32) (_ BitVec 64))) (size!48577 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99502)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484801 (= res!1009561 (validKeyInArray!0 (select (arr!48027 a!2862) i!1006)))))

(declare-fun b!1484802 () Bool)

(declare-fun res!1009556 () Bool)

(declare-fun e!832451 () Bool)

(assert (=> b!1484802 (=> (not res!1009556) (not e!832451))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12267 0))(
  ( (MissingZero!12267 (index!51460 (_ BitVec 32))) (Found!12267 (index!51461 (_ BitVec 32))) (Intermediate!12267 (undefined!13079 Bool) (index!51462 (_ BitVec 32)) (x!133039 (_ BitVec 32))) (Undefined!12267) (MissingVacant!12267 (index!51463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99502 (_ BitVec 32)) SeekEntryResult!12267)

(assert (=> b!1484802 (= res!1009556 (= (seekEntryOrOpen!0 (select (arr!48027 a!2862) j!93) a!2862 mask!2687) (Found!12267 j!93)))))

(declare-fun b!1484803 () Bool)

(declare-fun e!832448 () Bool)

(assert (=> b!1484803 (= e!832456 e!832448)))

(declare-fun res!1009552 () Bool)

(assert (=> b!1484803 (=> (not res!1009552) (not e!832448))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484803 (= res!1009552 (= (select (store (arr!48027 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647885 () array!99502)

(assert (=> b!1484803 (= lt!647885 (array!99503 (store (arr!48027 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48577 a!2862)))))

(declare-fun lt!647886 () SeekEntryResult!12267)

(declare-fun b!1484804 () Bool)

(declare-fun e!832457 () Bool)

(declare-fun lt!647882 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99502 (_ BitVec 32)) SeekEntryResult!12267)

(assert (=> b!1484804 (= e!832457 (= lt!647886 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647882 lt!647885 mask!2687)))))

(declare-fun b!1484805 () Bool)

(declare-fun e!832454 () Bool)

(assert (=> b!1484805 (= e!832451 e!832454)))

(declare-fun res!1009548 () Bool)

(assert (=> b!1484805 (=> res!1009548 e!832454)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!647881 () (_ BitVec 64))

(assert (=> b!1484805 (= res!1009548 (or (and (= (select (arr!48027 a!2862) index!646) lt!647881) (= (select (arr!48027 a!2862) index!646) (select (arr!48027 a!2862) j!93))) (= (select (arr!48027 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484805 (= lt!647881 (select (store (arr!48027 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484806 () Bool)

(declare-fun e!832452 () Bool)

(assert (=> b!1484806 (= e!832454 e!832452)))

(declare-fun res!1009559 () Bool)

(assert (=> b!1484806 (=> (not res!1009559) (not e!832452))))

(assert (=> b!1484806 (= res!1009559 (and (= index!646 intermediateAfterIndex!19) (= lt!647881 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484807 () Bool)

(declare-fun res!1009551 () Bool)

(assert (=> b!1484807 (=> (not res!1009551) (not e!832456))))

(assert (=> b!1484807 (= res!1009551 (validKeyInArray!0 (select (arr!48027 a!2862) j!93)))))

(declare-fun b!1484808 () Bool)

(declare-fun e!832453 () Bool)

(declare-fun e!832450 () Bool)

(assert (=> b!1484808 (= e!832453 e!832450)))

(declare-fun res!1009546 () Bool)

(assert (=> b!1484808 (=> (not res!1009546) (not e!832450))))

(assert (=> b!1484808 (= res!1009546 (= lt!647886 (Intermediate!12267 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484808 (= lt!647886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647882 mask!2687) lt!647882 lt!647885 mask!2687))))

(assert (=> b!1484808 (= lt!647882 (select (store (arr!48027 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484809 () Bool)

(assert (=> b!1484809 (= e!832448 e!832453)))

(declare-fun res!1009547 () Bool)

(assert (=> b!1484809 (=> (not res!1009547) (not e!832453))))

(declare-fun lt!647884 () SeekEntryResult!12267)

(assert (=> b!1484809 (= res!1009547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48027 a!2862) j!93) mask!2687) (select (arr!48027 a!2862) j!93) a!2862 mask!2687) lt!647884))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484809 (= lt!647884 (Intermediate!12267 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484810 () Bool)

(declare-fun res!1009555 () Bool)

(assert (=> b!1484810 (=> (not res!1009555) (not e!832456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99502 (_ BitVec 32)) Bool)

(assert (=> b!1484810 (= res!1009555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484812 () Bool)

(declare-fun res!1009543 () Bool)

(assert (=> b!1484812 (=> (not res!1009543) (not e!832456))))

(declare-datatypes ((List!34528 0))(
  ( (Nil!34525) (Cons!34524 (h!35898 (_ BitVec 64)) (t!49222 List!34528)) )
))
(declare-fun arrayNoDuplicates!0 (array!99502 (_ BitVec 32) List!34528) Bool)

(assert (=> b!1484812 (= res!1009543 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34525))))

(declare-fun b!1484813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99502 (_ BitVec 32)) SeekEntryResult!12267)

(assert (=> b!1484813 (= e!832457 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647882 lt!647885 mask!2687) (seekEntryOrOpen!0 lt!647882 lt!647885 mask!2687)))))

(declare-fun b!1484814 () Bool)

(assert (=> b!1484814 (= e!832452 (= (seekEntryOrOpen!0 lt!647882 lt!647885 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647882 lt!647885 mask!2687)))))

(declare-fun b!1484815 () Bool)

(declare-fun res!1009558 () Bool)

(assert (=> b!1484815 (=> (not res!1009558) (not e!832451))))

(assert (=> b!1484815 (= res!1009558 (or (= (select (arr!48027 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48027 a!2862) intermediateBeforeIndex!19) (select (arr!48027 a!2862) j!93))))))

(declare-fun b!1484816 () Bool)

(declare-fun res!1009545 () Bool)

(assert (=> b!1484816 (=> (not res!1009545) (not e!832450))))

(assert (=> b!1484816 (= res!1009545 e!832457)))

(declare-fun c!137151 () Bool)

(assert (=> b!1484816 (= c!137151 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484817 () Bool)

(declare-fun res!1009550 () Bool)

(assert (=> b!1484817 (=> (not res!1009550) (not e!832453))))

(assert (=> b!1484817 (= res!1009550 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48027 a!2862) j!93) a!2862 mask!2687) lt!647884))))

(declare-fun b!1484818 () Bool)

(assert (=> b!1484818 (= e!832450 (not e!832455))))

(declare-fun res!1009544 () Bool)

(assert (=> b!1484818 (=> res!1009544 e!832455)))

(assert (=> b!1484818 (= res!1009544 (or (and (= (select (arr!48027 a!2862) index!646) (select (store (arr!48027 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48027 a!2862) index!646) (select (arr!48027 a!2862) j!93))) (= (select (arr!48027 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484818 e!832451))

(declare-fun res!1009549 () Bool)

(assert (=> b!1484818 (=> (not res!1009549) (not e!832451))))

(assert (=> b!1484818 (= res!1009549 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49874 0))(
  ( (Unit!49875) )
))
(declare-fun lt!647880 () Unit!49874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49874)

(assert (=> b!1484818 (= lt!647880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484819 () Bool)

(declare-fun res!1009557 () Bool)

(assert (=> b!1484819 (=> (not res!1009557) (not e!832450))))

(assert (=> b!1484819 (= res!1009557 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484820 () Bool)

(declare-fun res!1009554 () Bool)

(assert (=> b!1484820 (=> (not res!1009554) (not e!832456))))

(assert (=> b!1484820 (= res!1009554 (and (= (size!48577 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48577 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48577 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1009560 () Bool)

(assert (=> start!126540 (=> (not res!1009560) (not e!832456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126540 (= res!1009560 (validMask!0 mask!2687))))

(assert (=> start!126540 e!832456))

(assert (=> start!126540 true))

(declare-fun array_inv!37055 (array!99502) Bool)

(assert (=> start!126540 (array_inv!37055 a!2862)))

(declare-fun b!1484811 () Bool)

(declare-fun res!1009553 () Bool)

(assert (=> b!1484811 (=> (not res!1009553) (not e!832456))))

(assert (=> b!1484811 (= res!1009553 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48577 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48577 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48577 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126540 res!1009560) b!1484820))

(assert (= (and b!1484820 res!1009554) b!1484801))

(assert (= (and b!1484801 res!1009561) b!1484807))

(assert (= (and b!1484807 res!1009551) b!1484810))

(assert (= (and b!1484810 res!1009555) b!1484812))

(assert (= (and b!1484812 res!1009543) b!1484811))

(assert (= (and b!1484811 res!1009553) b!1484803))

(assert (= (and b!1484803 res!1009552) b!1484809))

(assert (= (and b!1484809 res!1009547) b!1484817))

(assert (= (and b!1484817 res!1009550) b!1484808))

(assert (= (and b!1484808 res!1009546) b!1484816))

(assert (= (and b!1484816 c!137151) b!1484804))

(assert (= (and b!1484816 (not c!137151)) b!1484813))

(assert (= (and b!1484816 res!1009545) b!1484819))

(assert (= (and b!1484819 res!1009557) b!1484818))

(assert (= (and b!1484818 res!1009549) b!1484802))

(assert (= (and b!1484802 res!1009556) b!1484815))

(assert (= (and b!1484815 res!1009558) b!1484805))

(assert (= (and b!1484805 (not res!1009548)) b!1484806))

(assert (= (and b!1484806 res!1009559) b!1484814))

(assert (= (and b!1484818 (not res!1009544)) b!1484800))

(declare-fun m!1370045 () Bool)

(assert (=> b!1484817 m!1370045))

(assert (=> b!1484817 m!1370045))

(declare-fun m!1370047 () Bool)

(assert (=> b!1484817 m!1370047))

(declare-fun m!1370049 () Bool)

(assert (=> b!1484812 m!1370049))

(declare-fun m!1370051 () Bool)

(assert (=> b!1484803 m!1370051))

(declare-fun m!1370053 () Bool)

(assert (=> b!1484803 m!1370053))

(declare-fun m!1370055 () Bool)

(assert (=> start!126540 m!1370055))

(declare-fun m!1370057 () Bool)

(assert (=> start!126540 m!1370057))

(declare-fun m!1370059 () Bool)

(assert (=> b!1484810 m!1370059))

(declare-fun m!1370061 () Bool)

(assert (=> b!1484805 m!1370061))

(assert (=> b!1484805 m!1370045))

(assert (=> b!1484805 m!1370051))

(declare-fun m!1370063 () Bool)

(assert (=> b!1484805 m!1370063))

(declare-fun m!1370065 () Bool)

(assert (=> b!1484813 m!1370065))

(declare-fun m!1370067 () Bool)

(assert (=> b!1484813 m!1370067))

(declare-fun m!1370069 () Bool)

(assert (=> b!1484804 m!1370069))

(assert (=> b!1484814 m!1370067))

(assert (=> b!1484814 m!1370065))

(declare-fun m!1370071 () Bool)

(assert (=> b!1484815 m!1370071))

(assert (=> b!1484815 m!1370045))

(assert (=> b!1484802 m!1370045))

(assert (=> b!1484802 m!1370045))

(declare-fun m!1370073 () Bool)

(assert (=> b!1484802 m!1370073))

(declare-fun m!1370075 () Bool)

(assert (=> b!1484818 m!1370075))

(assert (=> b!1484818 m!1370051))

(assert (=> b!1484818 m!1370063))

(assert (=> b!1484818 m!1370061))

(declare-fun m!1370077 () Bool)

(assert (=> b!1484818 m!1370077))

(assert (=> b!1484818 m!1370045))

(declare-fun m!1370079 () Bool)

(assert (=> b!1484801 m!1370079))

(assert (=> b!1484801 m!1370079))

(declare-fun m!1370081 () Bool)

(assert (=> b!1484801 m!1370081))

(declare-fun m!1370083 () Bool)

(assert (=> b!1484808 m!1370083))

(assert (=> b!1484808 m!1370083))

(declare-fun m!1370085 () Bool)

(assert (=> b!1484808 m!1370085))

(assert (=> b!1484808 m!1370051))

(declare-fun m!1370087 () Bool)

(assert (=> b!1484808 m!1370087))

(assert (=> b!1484807 m!1370045))

(assert (=> b!1484807 m!1370045))

(declare-fun m!1370089 () Bool)

(assert (=> b!1484807 m!1370089))

(assert (=> b!1484809 m!1370045))

(assert (=> b!1484809 m!1370045))

(declare-fun m!1370091 () Bool)

(assert (=> b!1484809 m!1370091))

(assert (=> b!1484809 m!1370091))

(assert (=> b!1484809 m!1370045))

(declare-fun m!1370093 () Bool)

(assert (=> b!1484809 m!1370093))

(declare-fun m!1370095 () Bool)

(assert (=> b!1484800 m!1370095))

(check-sat (not b!1484812) (not b!1484808) (not b!1484801) (not b!1484810) (not b!1484818) (not b!1484814) (not start!126540) (not b!1484809) (not b!1484817) (not b!1484800) (not b!1484807) (not b!1484804) (not b!1484813) (not b!1484802))
(check-sat)
