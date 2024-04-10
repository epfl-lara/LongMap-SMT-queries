; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125268 () Bool)

(assert start!125268)

(declare-fun b!1462317 () Bool)

(declare-fun e!822017 () Bool)

(declare-fun e!822019 () Bool)

(assert (=> b!1462317 (= e!822017 e!822019)))

(declare-fun res!991772 () Bool)

(assert (=> b!1462317 (=> (not res!991772) (not e!822019))))

(declare-datatypes ((array!98716 0))(
  ( (array!98717 (arr!47646 (Array (_ BitVec 32) (_ BitVec 64))) (size!48196 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98716)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11898 0))(
  ( (MissingZero!11898 (index!49984 (_ BitVec 32))) (Found!11898 (index!49985 (_ BitVec 32))) (Intermediate!11898 (undefined!12710 Bool) (index!49986 (_ BitVec 32)) (x!131579 (_ BitVec 32))) (Undefined!11898) (MissingVacant!11898 (index!49987 (_ BitVec 32))) )
))
(declare-fun lt!640413 () SeekEntryResult!11898)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98716 (_ BitVec 32)) SeekEntryResult!11898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462317 (= res!991772 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47646 a!2862) j!93) mask!2687) (select (arr!47646 a!2862) j!93) a!2862 mask!2687) lt!640413))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462317 (= lt!640413 (Intermediate!11898 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462318 () Bool)

(declare-fun res!991786 () Bool)

(declare-fun e!822011 () Bool)

(assert (=> b!1462318 (=> (not res!991786) (not e!822011))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462318 (= res!991786 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462319 () Bool)

(declare-fun e!822020 () Bool)

(assert (=> b!1462319 (= e!822020 true)))

(declare-fun lt!640411 () Bool)

(declare-fun e!822012 () Bool)

(assert (=> b!1462319 (= lt!640411 e!822012)))

(declare-fun c!134783 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462319 (= c!134783 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462321 () Bool)

(declare-fun e!822018 () Bool)

(assert (=> b!1462321 (= e!822011 (not e!822018))))

(declare-fun res!991784 () Bool)

(assert (=> b!1462321 (=> res!991784 e!822018)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1462321 (= res!991784 (or (and (= (select (arr!47646 a!2862) index!646) (select (store (arr!47646 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47646 a!2862) index!646) (select (arr!47646 a!2862) j!93))) (= (select (arr!47646 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822015 () Bool)

(assert (=> b!1462321 e!822015))

(declare-fun res!991773 () Bool)

(assert (=> b!1462321 (=> (not res!991773) (not e!822015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98716 (_ BitVec 32)) Bool)

(assert (=> b!1462321 (= res!991773 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49292 0))(
  ( (Unit!49293) )
))
(declare-fun lt!640416 () Unit!49292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49292)

(assert (=> b!1462321 (= lt!640416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!640412 () array!98716)

(declare-fun lt!640415 () (_ BitVec 64))

(declare-fun b!1462322 () Bool)

(declare-fun e!822014 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98716 (_ BitVec 32)) SeekEntryResult!11898)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98716 (_ BitVec 32)) SeekEntryResult!11898)

(assert (=> b!1462322 (= e!822014 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640415 lt!640412 mask!2687) (seekEntryOrOpen!0 lt!640415 lt!640412 mask!2687)))))

(declare-fun b!1462323 () Bool)

(declare-fun res!991783 () Bool)

(declare-fun e!822013 () Bool)

(assert (=> b!1462323 (=> (not res!991783) (not e!822013))))

(assert (=> b!1462323 (= res!991783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462324 () Bool)

(assert (=> b!1462324 (= e!822013 e!822017)))

(declare-fun res!991776 () Bool)

(assert (=> b!1462324 (=> (not res!991776) (not e!822017))))

(assert (=> b!1462324 (= res!991776 (= (select (store (arr!47646 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462324 (= lt!640412 (array!98717 (store (arr!47646 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48196 a!2862)))))

(declare-fun b!1462325 () Bool)

(declare-fun res!991780 () Bool)

(assert (=> b!1462325 (=> (not res!991780) (not e!822013))))

(assert (=> b!1462325 (= res!991780 (and (= (size!48196 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48196 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48196 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462326 () Bool)

(declare-fun lt!640410 () (_ BitVec 32))

(declare-fun lt!640414 () SeekEntryResult!11898)

(assert (=> b!1462326 (= e!822012 (not (= lt!640414 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640410 lt!640415 lt!640412 mask!2687))))))

(declare-fun b!1462327 () Bool)

(declare-fun res!991787 () Bool)

(assert (=> b!1462327 (=> (not res!991787) (not e!822013))))

(declare-datatypes ((List!34147 0))(
  ( (Nil!34144) (Cons!34143 (h!35493 (_ BitVec 64)) (t!48841 List!34147)) )
))
(declare-fun arrayNoDuplicates!0 (array!98716 (_ BitVec 32) List!34147) Bool)

(assert (=> b!1462327 (= res!991787 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34144))))

(declare-fun b!1462328 () Bool)

(assert (=> b!1462328 (= e!822018 e!822020)))

(declare-fun res!991778 () Bool)

(assert (=> b!1462328 (=> res!991778 e!822020)))

(assert (=> b!1462328 (= res!991778 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640410 #b00000000000000000000000000000000) (bvsge lt!640410 (size!48196 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462328 (= lt!640410 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462329 () Bool)

(declare-fun res!991777 () Bool)

(assert (=> b!1462329 (=> res!991777 e!822020)))

(assert (=> b!1462329 (= res!991777 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640410 (select (arr!47646 a!2862) j!93) a!2862 mask!2687) lt!640413)))))

(declare-fun b!1462330 () Bool)

(assert (=> b!1462330 (= e!822014 (= lt!640414 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640415 lt!640412 mask!2687)))))

(declare-fun b!1462331 () Bool)

(declare-fun res!991779 () Bool)

(assert (=> b!1462331 (=> (not res!991779) (not e!822011))))

(assert (=> b!1462331 (= res!991779 e!822014)))

(declare-fun c!134784 () Bool)

(assert (=> b!1462331 (= c!134784 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!991775 () Bool)

(assert (=> start!125268 (=> (not res!991775) (not e!822013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125268 (= res!991775 (validMask!0 mask!2687))))

(assert (=> start!125268 e!822013))

(assert (=> start!125268 true))

(declare-fun array_inv!36674 (array!98716) Bool)

(assert (=> start!125268 (array_inv!36674 a!2862)))

(declare-fun b!1462320 () Bool)

(declare-fun res!991774 () Bool)

(assert (=> b!1462320 (=> (not res!991774) (not e!822013))))

(assert (=> b!1462320 (= res!991774 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48196 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48196 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48196 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462332 () Bool)

(declare-fun res!991789 () Bool)

(assert (=> b!1462332 (=> (not res!991789) (not e!822019))))

(assert (=> b!1462332 (= res!991789 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47646 a!2862) j!93) a!2862 mask!2687) lt!640413))))

(declare-fun b!1462333 () Bool)

(assert (=> b!1462333 (= e!822015 (or (= (select (arr!47646 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47646 a!2862) intermediateBeforeIndex!19) (select (arr!47646 a!2862) j!93))))))

(declare-fun b!1462334 () Bool)

(assert (=> b!1462334 (= e!822019 e!822011)))

(declare-fun res!991785 () Bool)

(assert (=> b!1462334 (=> (not res!991785) (not e!822011))))

(assert (=> b!1462334 (= res!991785 (= lt!640414 (Intermediate!11898 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462334 (= lt!640414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640415 mask!2687) lt!640415 lt!640412 mask!2687))))

(assert (=> b!1462334 (= lt!640415 (select (store (arr!47646 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462335 () Bool)

(declare-fun res!991782 () Bool)

(assert (=> b!1462335 (=> (not res!991782) (not e!822015))))

(assert (=> b!1462335 (= res!991782 (= (seekEntryOrOpen!0 (select (arr!47646 a!2862) j!93) a!2862 mask!2687) (Found!11898 j!93)))))

(declare-fun b!1462336 () Bool)

(assert (=> b!1462336 (= e!822012 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640410 intermediateAfterIndex!19 lt!640415 lt!640412 mask!2687) (seekEntryOrOpen!0 lt!640415 lt!640412 mask!2687))))))

(declare-fun b!1462337 () Bool)

(declare-fun res!991788 () Bool)

(assert (=> b!1462337 (=> (not res!991788) (not e!822013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462337 (= res!991788 (validKeyInArray!0 (select (arr!47646 a!2862) j!93)))))

(declare-fun b!1462338 () Bool)

(declare-fun res!991781 () Bool)

(assert (=> b!1462338 (=> (not res!991781) (not e!822013))))

(assert (=> b!1462338 (= res!991781 (validKeyInArray!0 (select (arr!47646 a!2862) i!1006)))))

(assert (= (and start!125268 res!991775) b!1462325))

(assert (= (and b!1462325 res!991780) b!1462338))

(assert (= (and b!1462338 res!991781) b!1462337))

(assert (= (and b!1462337 res!991788) b!1462323))

(assert (= (and b!1462323 res!991783) b!1462327))

(assert (= (and b!1462327 res!991787) b!1462320))

(assert (= (and b!1462320 res!991774) b!1462324))

(assert (= (and b!1462324 res!991776) b!1462317))

(assert (= (and b!1462317 res!991772) b!1462332))

(assert (= (and b!1462332 res!991789) b!1462334))

(assert (= (and b!1462334 res!991785) b!1462331))

(assert (= (and b!1462331 c!134784) b!1462330))

(assert (= (and b!1462331 (not c!134784)) b!1462322))

(assert (= (and b!1462331 res!991779) b!1462318))

(assert (= (and b!1462318 res!991786) b!1462321))

(assert (= (and b!1462321 res!991773) b!1462335))

(assert (= (and b!1462335 res!991782) b!1462333))

(assert (= (and b!1462321 (not res!991784)) b!1462328))

(assert (= (and b!1462328 (not res!991778)) b!1462329))

(assert (= (and b!1462329 (not res!991777)) b!1462319))

(assert (= (and b!1462319 c!134783) b!1462326))

(assert (= (and b!1462319 (not c!134783)) b!1462336))

(declare-fun m!1349789 () Bool)

(assert (=> b!1462338 m!1349789))

(assert (=> b!1462338 m!1349789))

(declare-fun m!1349791 () Bool)

(assert (=> b!1462338 m!1349791))

(declare-fun m!1349793 () Bool)

(assert (=> b!1462321 m!1349793))

(declare-fun m!1349795 () Bool)

(assert (=> b!1462321 m!1349795))

(declare-fun m!1349797 () Bool)

(assert (=> b!1462321 m!1349797))

(declare-fun m!1349799 () Bool)

(assert (=> b!1462321 m!1349799))

(declare-fun m!1349801 () Bool)

(assert (=> b!1462321 m!1349801))

(declare-fun m!1349803 () Bool)

(assert (=> b!1462321 m!1349803))

(declare-fun m!1349805 () Bool)

(assert (=> b!1462326 m!1349805))

(declare-fun m!1349807 () Bool)

(assert (=> b!1462327 m!1349807))

(assert (=> b!1462329 m!1349803))

(assert (=> b!1462329 m!1349803))

(declare-fun m!1349809 () Bool)

(assert (=> b!1462329 m!1349809))

(declare-fun m!1349811 () Bool)

(assert (=> b!1462323 m!1349811))

(declare-fun m!1349813 () Bool)

(assert (=> b!1462322 m!1349813))

(declare-fun m!1349815 () Bool)

(assert (=> b!1462322 m!1349815))

(assert (=> b!1462317 m!1349803))

(assert (=> b!1462317 m!1349803))

(declare-fun m!1349817 () Bool)

(assert (=> b!1462317 m!1349817))

(assert (=> b!1462317 m!1349817))

(assert (=> b!1462317 m!1349803))

(declare-fun m!1349819 () Bool)

(assert (=> b!1462317 m!1349819))

(declare-fun m!1349821 () Bool)

(assert (=> b!1462334 m!1349821))

(assert (=> b!1462334 m!1349821))

(declare-fun m!1349823 () Bool)

(assert (=> b!1462334 m!1349823))

(assert (=> b!1462334 m!1349795))

(declare-fun m!1349825 () Bool)

(assert (=> b!1462334 m!1349825))

(assert (=> b!1462324 m!1349795))

(declare-fun m!1349827 () Bool)

(assert (=> b!1462324 m!1349827))

(declare-fun m!1349829 () Bool)

(assert (=> b!1462333 m!1349829))

(assert (=> b!1462333 m!1349803))

(declare-fun m!1349831 () Bool)

(assert (=> b!1462330 m!1349831))

(assert (=> b!1462337 m!1349803))

(assert (=> b!1462337 m!1349803))

(declare-fun m!1349833 () Bool)

(assert (=> b!1462337 m!1349833))

(declare-fun m!1349835 () Bool)

(assert (=> b!1462328 m!1349835))

(declare-fun m!1349837 () Bool)

(assert (=> start!125268 m!1349837))

(declare-fun m!1349839 () Bool)

(assert (=> start!125268 m!1349839))

(assert (=> b!1462332 m!1349803))

(assert (=> b!1462332 m!1349803))

(declare-fun m!1349841 () Bool)

(assert (=> b!1462332 m!1349841))

(assert (=> b!1462335 m!1349803))

(assert (=> b!1462335 m!1349803))

(declare-fun m!1349843 () Bool)

(assert (=> b!1462335 m!1349843))

(declare-fun m!1349845 () Bool)

(assert (=> b!1462336 m!1349845))

(assert (=> b!1462336 m!1349815))

(check-sat (not b!1462322) (not b!1462338) (not b!1462334) (not b!1462327) (not b!1462335) (not b!1462337) (not b!1462323) (not start!125268) (not b!1462328) (not b!1462317) (not b!1462330) (not b!1462336) (not b!1462332) (not b!1462329) (not b!1462326) (not b!1462321))
(check-sat)
