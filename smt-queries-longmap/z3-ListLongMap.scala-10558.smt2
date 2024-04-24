; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124704 () Bool)

(assert start!124704)

(declare-fun b!1441736 () Bool)

(declare-fun res!973338 () Bool)

(declare-fun e!813015 () Bool)

(assert (=> b!1441736 (=> (not res!973338) (not e!813015))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98047 0))(
  ( (array!98048 (arr!47308 (Array (_ BitVec 32) (_ BitVec 64))) (size!47859 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98047)

(assert (=> b!1441736 (= res!973338 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47859 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47859 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47859 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441737 () Bool)

(declare-fun res!973341 () Bool)

(assert (=> b!1441737 (=> (not res!973341) (not e!813015))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98047 (_ BitVec 32)) Bool)

(assert (=> b!1441737 (= res!973341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441738 () Bool)

(declare-fun res!973346 () Bool)

(declare-fun e!813013 () Bool)

(assert (=> b!1441738 (=> (not res!973346) (not e!813013))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11457 0))(
  ( (MissingZero!11457 (index!48220 (_ BitVec 32))) (Found!11457 (index!48221 (_ BitVec 32))) (Intermediate!11457 (undefined!12269 Bool) (index!48222 (_ BitVec 32)) (x!130122 (_ BitVec 32))) (Undefined!11457) (MissingVacant!11457 (index!48223 (_ BitVec 32))) )
))
(declare-fun lt!633441 () SeekEntryResult!11457)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98047 (_ BitVec 32)) SeekEntryResult!11457)

(assert (=> b!1441738 (= res!973346 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47308 a!2862) j!93) a!2862 mask!2687) lt!633441))))

(declare-fun b!1441739 () Bool)

(assert (=> b!1441739 (= e!813015 e!813013)))

(declare-fun res!973343 () Bool)

(assert (=> b!1441739 (=> (not res!973343) (not e!813013))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441739 (= res!973343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47308 a!2862) j!93) mask!2687) (select (arr!47308 a!2862) j!93) a!2862 mask!2687) lt!633441))))

(assert (=> b!1441739 (= lt!633441 (Intermediate!11457 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441740 () Bool)

(declare-fun res!973339 () Bool)

(assert (=> b!1441740 (=> (not res!973339) (not e!813015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441740 (= res!973339 (validKeyInArray!0 (select (arr!47308 a!2862) i!1006)))))

(declare-fun res!973344 () Bool)

(assert (=> start!124704 (=> (not res!973344) (not e!813015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124704 (= res!973344 (validMask!0 mask!2687))))

(assert (=> start!124704 e!813015))

(assert (=> start!124704 true))

(declare-fun array_inv!36589 (array!98047) Bool)

(assert (=> start!124704 (array_inv!36589 a!2862)))

(declare-fun b!1441741 () Bool)

(declare-fun res!973342 () Bool)

(assert (=> b!1441741 (=> (not res!973342) (not e!813015))))

(declare-datatypes ((List!33796 0))(
  ( (Nil!33793) (Cons!33792 (h!35153 (_ BitVec 64)) (t!48482 List!33796)) )
))
(declare-fun arrayNoDuplicates!0 (array!98047 (_ BitVec 32) List!33796) Bool)

(assert (=> b!1441741 (= res!973342 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33793))))

(declare-fun b!1441742 () Bool)

(assert (=> b!1441742 (= e!813013 false)))

(declare-fun lt!633442 () SeekEntryResult!11457)

(assert (=> b!1441742 (= lt!633442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98048 (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47859 a!2862)) mask!2687))))

(declare-fun b!1441743 () Bool)

(declare-fun res!973345 () Bool)

(assert (=> b!1441743 (=> (not res!973345) (not e!813015))))

(assert (=> b!1441743 (= res!973345 (and (= (size!47859 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47859 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47859 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441744 () Bool)

(declare-fun res!973340 () Bool)

(assert (=> b!1441744 (=> (not res!973340) (not e!813015))))

(assert (=> b!1441744 (= res!973340 (validKeyInArray!0 (select (arr!47308 a!2862) j!93)))))

(assert (= (and start!124704 res!973344) b!1441743))

(assert (= (and b!1441743 res!973345) b!1441740))

(assert (= (and b!1441740 res!973339) b!1441744))

(assert (= (and b!1441744 res!973340) b!1441737))

(assert (= (and b!1441737 res!973341) b!1441741))

(assert (= (and b!1441741 res!973342) b!1441736))

(assert (= (and b!1441736 res!973338) b!1441739))

(assert (= (and b!1441739 res!973343) b!1441738))

(assert (= (and b!1441738 res!973346) b!1441742))

(declare-fun m!1331035 () Bool)

(assert (=> b!1441740 m!1331035))

(assert (=> b!1441740 m!1331035))

(declare-fun m!1331037 () Bool)

(assert (=> b!1441740 m!1331037))

(declare-fun m!1331039 () Bool)

(assert (=> b!1441737 m!1331039))

(declare-fun m!1331041 () Bool)

(assert (=> b!1441739 m!1331041))

(assert (=> b!1441739 m!1331041))

(declare-fun m!1331043 () Bool)

(assert (=> b!1441739 m!1331043))

(assert (=> b!1441739 m!1331043))

(assert (=> b!1441739 m!1331041))

(declare-fun m!1331045 () Bool)

(assert (=> b!1441739 m!1331045))

(declare-fun m!1331047 () Bool)

(assert (=> b!1441741 m!1331047))

(declare-fun m!1331049 () Bool)

(assert (=> b!1441736 m!1331049))

(declare-fun m!1331051 () Bool)

(assert (=> b!1441736 m!1331051))

(assert (=> b!1441742 m!1331049))

(declare-fun m!1331053 () Bool)

(assert (=> b!1441742 m!1331053))

(assert (=> b!1441742 m!1331053))

(declare-fun m!1331055 () Bool)

(assert (=> b!1441742 m!1331055))

(assert (=> b!1441742 m!1331055))

(assert (=> b!1441742 m!1331053))

(declare-fun m!1331057 () Bool)

(assert (=> b!1441742 m!1331057))

(assert (=> b!1441744 m!1331041))

(assert (=> b!1441744 m!1331041))

(declare-fun m!1331059 () Bool)

(assert (=> b!1441744 m!1331059))

(declare-fun m!1331061 () Bool)

(assert (=> start!124704 m!1331061))

(declare-fun m!1331063 () Bool)

(assert (=> start!124704 m!1331063))

(assert (=> b!1441738 m!1331041))

(assert (=> b!1441738 m!1331041))

(declare-fun m!1331065 () Bool)

(assert (=> b!1441738 m!1331065))

(check-sat (not b!1441737) (not b!1441742) (not start!124704) (not b!1441738) (not b!1441741) (not b!1441740) (not b!1441739) (not b!1441744))
(check-sat)
