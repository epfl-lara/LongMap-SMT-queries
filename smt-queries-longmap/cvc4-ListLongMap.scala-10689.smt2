; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125276 () Bool)

(assert start!125276)

(declare-fun lt!640497 () (_ BitVec 64))

(declare-fun b!1462581 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98724 0))(
  ( (array!98725 (arr!47650 (Array (_ BitVec 32) (_ BitVec 64))) (size!48200 (_ BitVec 32))) )
))
(declare-fun lt!640496 () array!98724)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!822137 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11902 0))(
  ( (MissingZero!11902 (index!50000 (_ BitVec 32))) (Found!11902 (index!50001 (_ BitVec 32))) (Intermediate!11902 (undefined!12714 Bool) (index!50002 (_ BitVec 32)) (x!131591 (_ BitVec 32))) (Undefined!11902) (MissingVacant!11902 (index!50003 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98724 (_ BitVec 32)) SeekEntryResult!11902)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98724 (_ BitVec 32)) SeekEntryResult!11902)

(assert (=> b!1462581 (= e!822137 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640497 lt!640496 mask!2687) (seekEntryOrOpen!0 lt!640497 lt!640496 mask!2687)))))

(declare-fun b!1462582 () Bool)

(declare-fun res!992004 () Bool)

(declare-fun e!822136 () Bool)

(assert (=> b!1462582 (=> (not res!992004) (not e!822136))))

(declare-fun a!2862 () array!98724)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462582 (= res!992004 (validKeyInArray!0 (select (arr!47650 a!2862) j!93)))))

(declare-fun res!991994 () Bool)

(assert (=> start!125276 (=> (not res!991994) (not e!822136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125276 (= res!991994 (validMask!0 mask!2687))))

(assert (=> start!125276 e!822136))

(assert (=> start!125276 true))

(declare-fun array_inv!36678 (array!98724) Bool)

(assert (=> start!125276 (array_inv!36678 a!2862)))

(declare-fun b!1462583 () Bool)

(declare-fun e!822139 () Bool)

(declare-fun e!822135 () Bool)

(assert (=> b!1462583 (= e!822139 (not e!822135))))

(declare-fun res!991989 () Bool)

(assert (=> b!1462583 (=> res!991989 e!822135)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462583 (= res!991989 (or (and (= (select (arr!47650 a!2862) index!646) (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47650 a!2862) index!646) (select (arr!47650 a!2862) j!93))) (= (select (arr!47650 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822140 () Bool)

(assert (=> b!1462583 e!822140))

(declare-fun res!991995 () Bool)

(assert (=> b!1462583 (=> (not res!991995) (not e!822140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98724 (_ BitVec 32)) Bool)

(assert (=> b!1462583 (= res!991995 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49300 0))(
  ( (Unit!49301) )
))
(declare-fun lt!640494 () Unit!49300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49300)

(assert (=> b!1462583 (= lt!640494 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462584 () Bool)

(declare-fun e!822132 () Bool)

(assert (=> b!1462584 (= e!822136 e!822132)))

(declare-fun res!992005 () Bool)

(assert (=> b!1462584 (=> (not res!992005) (not e!822132))))

(assert (=> b!1462584 (= res!992005 (= (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462584 (= lt!640496 (array!98725 (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48200 a!2862)))))

(declare-fun b!1462585 () Bool)

(declare-fun res!992002 () Bool)

(assert (=> b!1462585 (=> (not res!992002) (not e!822136))))

(declare-datatypes ((List!34151 0))(
  ( (Nil!34148) (Cons!34147 (h!35497 (_ BitVec 64)) (t!48845 List!34151)) )
))
(declare-fun arrayNoDuplicates!0 (array!98724 (_ BitVec 32) List!34151) Bool)

(assert (=> b!1462585 (= res!992002 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34148))))

(declare-fun lt!640495 () (_ BitVec 32))

(declare-fun e!822138 () Bool)

(declare-fun b!1462586 () Bool)

(declare-fun lt!640500 () SeekEntryResult!11902)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98724 (_ BitVec 32)) SeekEntryResult!11902)

(assert (=> b!1462586 (= e!822138 (not (= lt!640500 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640495 lt!640497 lt!640496 mask!2687))))))

(declare-fun b!1462587 () Bool)

(declare-fun res!991999 () Bool)

(assert (=> b!1462587 (=> (not res!991999) (not e!822136))))

(assert (=> b!1462587 (= res!991999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462588 () Bool)

(declare-fun e!822131 () Bool)

(assert (=> b!1462588 (= e!822135 e!822131)))

(declare-fun res!991998 () Bool)

(assert (=> b!1462588 (=> res!991998 e!822131)))

(assert (=> b!1462588 (= res!991998 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640495 #b00000000000000000000000000000000) (bvsge lt!640495 (size!48200 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462588 (= lt!640495 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462589 () Bool)

(declare-fun res!992000 () Bool)

(assert (=> b!1462589 (=> (not res!992000) (not e!822139))))

(assert (=> b!1462589 (= res!992000 e!822137)))

(declare-fun c!134808 () Bool)

(assert (=> b!1462589 (= c!134808 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462590 () Bool)

(declare-fun res!991996 () Bool)

(declare-fun e!822134 () Bool)

(assert (=> b!1462590 (=> (not res!991996) (not e!822134))))

(declare-fun lt!640498 () SeekEntryResult!11902)

(assert (=> b!1462590 (= res!991996 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!640498))))

(declare-fun b!1462591 () Bool)

(assert (=> b!1462591 (= e!822131 true)))

(declare-fun lt!640499 () Bool)

(assert (=> b!1462591 (= lt!640499 e!822138)))

(declare-fun c!134807 () Bool)

(assert (=> b!1462591 (= c!134807 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462592 () Bool)

(assert (=> b!1462592 (= e!822138 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640495 intermediateAfterIndex!19 lt!640497 lt!640496 mask!2687) (seekEntryOrOpen!0 lt!640497 lt!640496 mask!2687))))))

(declare-fun b!1462593 () Bool)

(assert (=> b!1462593 (= e!822134 e!822139)))

(declare-fun res!992001 () Bool)

(assert (=> b!1462593 (=> (not res!992001) (not e!822139))))

(assert (=> b!1462593 (= res!992001 (= lt!640500 (Intermediate!11902 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462593 (= lt!640500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640497 mask!2687) lt!640497 lt!640496 mask!2687))))

(assert (=> b!1462593 (= lt!640497 (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462594 () Bool)

(declare-fun res!991990 () Bool)

(assert (=> b!1462594 (=> (not res!991990) (not e!822140))))

(assert (=> b!1462594 (= res!991990 (= (seekEntryOrOpen!0 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) (Found!11902 j!93)))))

(declare-fun b!1462595 () Bool)

(declare-fun res!991991 () Bool)

(assert (=> b!1462595 (=> res!991991 e!822131)))

(assert (=> b!1462595 (= res!991991 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640495 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!640498)))))

(declare-fun b!1462596 () Bool)

(declare-fun res!992003 () Bool)

(assert (=> b!1462596 (=> (not res!992003) (not e!822136))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462596 (= res!992003 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48200 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48200 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48200 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462597 () Bool)

(declare-fun res!991997 () Bool)

(assert (=> b!1462597 (=> (not res!991997) (not e!822136))))

(assert (=> b!1462597 (= res!991997 (validKeyInArray!0 (select (arr!47650 a!2862) i!1006)))))

(declare-fun b!1462598 () Bool)

(declare-fun res!991988 () Bool)

(assert (=> b!1462598 (=> (not res!991988) (not e!822136))))

(assert (=> b!1462598 (= res!991988 (and (= (size!48200 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48200 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48200 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462599 () Bool)

(assert (=> b!1462599 (= e!822140 (or (= (select (arr!47650 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47650 a!2862) intermediateBeforeIndex!19) (select (arr!47650 a!2862) j!93))))))

(declare-fun b!1462600 () Bool)

(assert (=> b!1462600 (= e!822132 e!822134)))

(declare-fun res!991993 () Bool)

(assert (=> b!1462600 (=> (not res!991993) (not e!822134))))

(assert (=> b!1462600 (= res!991993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47650 a!2862) j!93) mask!2687) (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!640498))))

(assert (=> b!1462600 (= lt!640498 (Intermediate!11902 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462601 () Bool)

(assert (=> b!1462601 (= e!822137 (= lt!640500 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640497 lt!640496 mask!2687)))))

(declare-fun b!1462602 () Bool)

(declare-fun res!991992 () Bool)

(assert (=> b!1462602 (=> (not res!991992) (not e!822139))))

(assert (=> b!1462602 (= res!991992 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125276 res!991994) b!1462598))

(assert (= (and b!1462598 res!991988) b!1462597))

(assert (= (and b!1462597 res!991997) b!1462582))

(assert (= (and b!1462582 res!992004) b!1462587))

(assert (= (and b!1462587 res!991999) b!1462585))

(assert (= (and b!1462585 res!992002) b!1462596))

(assert (= (and b!1462596 res!992003) b!1462584))

(assert (= (and b!1462584 res!992005) b!1462600))

(assert (= (and b!1462600 res!991993) b!1462590))

(assert (= (and b!1462590 res!991996) b!1462593))

(assert (= (and b!1462593 res!992001) b!1462589))

(assert (= (and b!1462589 c!134808) b!1462601))

(assert (= (and b!1462589 (not c!134808)) b!1462581))

(assert (= (and b!1462589 res!992000) b!1462602))

(assert (= (and b!1462602 res!991992) b!1462583))

(assert (= (and b!1462583 res!991995) b!1462594))

(assert (= (and b!1462594 res!991990) b!1462599))

(assert (= (and b!1462583 (not res!991989)) b!1462588))

(assert (= (and b!1462588 (not res!991998)) b!1462595))

(assert (= (and b!1462595 (not res!991991)) b!1462591))

(assert (= (and b!1462591 c!134807) b!1462586))

(assert (= (and b!1462591 (not c!134807)) b!1462592))

(declare-fun m!1350021 () Bool)

(assert (=> b!1462582 m!1350021))

(assert (=> b!1462582 m!1350021))

(declare-fun m!1350023 () Bool)

(assert (=> b!1462582 m!1350023))

(assert (=> b!1462595 m!1350021))

(assert (=> b!1462595 m!1350021))

(declare-fun m!1350025 () Bool)

(assert (=> b!1462595 m!1350025))

(assert (=> b!1462594 m!1350021))

(assert (=> b!1462594 m!1350021))

(declare-fun m!1350027 () Bool)

(assert (=> b!1462594 m!1350027))

(declare-fun m!1350029 () Bool)

(assert (=> b!1462585 m!1350029))

(declare-fun m!1350031 () Bool)

(assert (=> b!1462583 m!1350031))

(declare-fun m!1350033 () Bool)

(assert (=> b!1462583 m!1350033))

(declare-fun m!1350035 () Bool)

(assert (=> b!1462583 m!1350035))

(declare-fun m!1350037 () Bool)

(assert (=> b!1462583 m!1350037))

(declare-fun m!1350039 () Bool)

(assert (=> b!1462583 m!1350039))

(assert (=> b!1462583 m!1350021))

(declare-fun m!1350041 () Bool)

(assert (=> b!1462581 m!1350041))

(declare-fun m!1350043 () Bool)

(assert (=> b!1462581 m!1350043))

(assert (=> b!1462590 m!1350021))

(assert (=> b!1462590 m!1350021))

(declare-fun m!1350045 () Bool)

(assert (=> b!1462590 m!1350045))

(declare-fun m!1350047 () Bool)

(assert (=> b!1462587 m!1350047))

(declare-fun m!1350049 () Bool)

(assert (=> b!1462586 m!1350049))

(declare-fun m!1350051 () Bool)

(assert (=> b!1462592 m!1350051))

(assert (=> b!1462592 m!1350043))

(declare-fun m!1350053 () Bool)

(assert (=> b!1462597 m!1350053))

(assert (=> b!1462597 m!1350053))

(declare-fun m!1350055 () Bool)

(assert (=> b!1462597 m!1350055))

(declare-fun m!1350057 () Bool)

(assert (=> b!1462599 m!1350057))

(assert (=> b!1462599 m!1350021))

(declare-fun m!1350059 () Bool)

(assert (=> start!125276 m!1350059))

(declare-fun m!1350061 () Bool)

(assert (=> start!125276 m!1350061))

(assert (=> b!1462600 m!1350021))

(assert (=> b!1462600 m!1350021))

(declare-fun m!1350063 () Bool)

(assert (=> b!1462600 m!1350063))

(assert (=> b!1462600 m!1350063))

(assert (=> b!1462600 m!1350021))

(declare-fun m!1350065 () Bool)

(assert (=> b!1462600 m!1350065))

(declare-fun m!1350067 () Bool)

(assert (=> b!1462601 m!1350067))

(assert (=> b!1462584 m!1350033))

(declare-fun m!1350069 () Bool)

(assert (=> b!1462584 m!1350069))

(declare-fun m!1350071 () Bool)

(assert (=> b!1462593 m!1350071))

(assert (=> b!1462593 m!1350071))

(declare-fun m!1350073 () Bool)

(assert (=> b!1462593 m!1350073))

(assert (=> b!1462593 m!1350033))

(declare-fun m!1350075 () Bool)

(assert (=> b!1462593 m!1350075))

(declare-fun m!1350077 () Bool)

(assert (=> b!1462588 m!1350077))

(push 1)

