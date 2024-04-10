; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125554 () Bool)

(assert start!125554)

(declare-fun b!1468993 () Bool)

(declare-fun res!997539 () Bool)

(declare-fun e!824766 () Bool)

(assert (=> b!1468993 (=> (not res!997539) (not e!824766))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99002 0))(
  ( (array!99003 (arr!47789 (Array (_ BitVec 32) (_ BitVec 64))) (size!48339 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99002)

(assert (=> b!1468993 (= res!997539 (and (= (size!48339 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48339 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48339 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468994 () Bool)

(declare-fun res!997535 () Bool)

(declare-fun e!824767 () Bool)

(assert (=> b!1468994 (=> (not res!997535) (not e!824767))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12029 0))(
  ( (MissingZero!12029 (index!50508 (_ BitVec 32))) (Found!12029 (index!50509 (_ BitVec 32))) (Intermediate!12029 (undefined!12841 Bool) (index!50510 (_ BitVec 32)) (x!132094 (_ BitVec 32))) (Undefined!12029) (MissingVacant!12029 (index!50511 (_ BitVec 32))) )
))
(declare-fun lt!642413 () SeekEntryResult!12029)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99002 (_ BitVec 32)) SeekEntryResult!12029)

(assert (=> b!1468994 (= res!997535 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47789 a!2862) j!93) a!2862 mask!2687) lt!642413))))

(declare-fun b!1468995 () Bool)

(declare-fun res!997538 () Bool)

(assert (=> b!1468995 (=> (not res!997538) (not e!824766))))

(declare-datatypes ((List!34290 0))(
  ( (Nil!34287) (Cons!34286 (h!35636 (_ BitVec 64)) (t!48984 List!34290)) )
))
(declare-fun arrayNoDuplicates!0 (array!99002 (_ BitVec 32) List!34290) Bool)

(assert (=> b!1468995 (= res!997538 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34287))))

(declare-fun b!1468996 () Bool)

(declare-fun res!997536 () Bool)

(assert (=> b!1468996 (=> (not res!997536) (not e!824766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468996 (= res!997536 (validKeyInArray!0 (select (arr!47789 a!2862) j!93)))))

(declare-fun b!1468997 () Bool)

(assert (=> b!1468997 (= e!824767 false)))

(declare-fun lt!642414 () SeekEntryResult!12029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468997 (= lt!642414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47789 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47789 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99003 (store (arr!47789 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48339 a!2862)) mask!2687))))

(declare-fun b!1468998 () Bool)

(assert (=> b!1468998 (= e!824766 e!824767)))

(declare-fun res!997532 () Bool)

(assert (=> b!1468998 (=> (not res!997532) (not e!824767))))

(assert (=> b!1468998 (= res!997532 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47789 a!2862) j!93) mask!2687) (select (arr!47789 a!2862) j!93) a!2862 mask!2687) lt!642413))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468998 (= lt!642413 (Intermediate!12029 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468999 () Bool)

(declare-fun res!997540 () Bool)

(assert (=> b!1468999 (=> (not res!997540) (not e!824766))))

(assert (=> b!1468999 (= res!997540 (validKeyInArray!0 (select (arr!47789 a!2862) i!1006)))))

(declare-fun res!997537 () Bool)

(assert (=> start!125554 (=> (not res!997537) (not e!824766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125554 (= res!997537 (validMask!0 mask!2687))))

(assert (=> start!125554 e!824766))

(assert (=> start!125554 true))

(declare-fun array_inv!36817 (array!99002) Bool)

(assert (=> start!125554 (array_inv!36817 a!2862)))

(declare-fun b!1469000 () Bool)

(declare-fun res!997533 () Bool)

(assert (=> b!1469000 (=> (not res!997533) (not e!824766))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469000 (= res!997533 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48339 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48339 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48339 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47789 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469001 () Bool)

(declare-fun res!997534 () Bool)

(assert (=> b!1469001 (=> (not res!997534) (not e!824766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99002 (_ BitVec 32)) Bool)

(assert (=> b!1469001 (= res!997534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125554 res!997537) b!1468993))

(assert (= (and b!1468993 res!997539) b!1468999))

(assert (= (and b!1468999 res!997540) b!1468996))

(assert (= (and b!1468996 res!997536) b!1469001))

(assert (= (and b!1469001 res!997534) b!1468995))

(assert (= (and b!1468995 res!997538) b!1469000))

(assert (= (and b!1469000 res!997533) b!1468998))

(assert (= (and b!1468998 res!997532) b!1468994))

(assert (= (and b!1468994 res!997535) b!1468997))

(declare-fun m!1356157 () Bool)

(assert (=> b!1468994 m!1356157))

(assert (=> b!1468994 m!1356157))

(declare-fun m!1356159 () Bool)

(assert (=> b!1468994 m!1356159))

(declare-fun m!1356161 () Bool)

(assert (=> b!1468995 m!1356161))

(declare-fun m!1356163 () Bool)

(assert (=> b!1469001 m!1356163))

(declare-fun m!1356165 () Bool)

(assert (=> start!125554 m!1356165))

(declare-fun m!1356167 () Bool)

(assert (=> start!125554 m!1356167))

(assert (=> b!1468996 m!1356157))

(assert (=> b!1468996 m!1356157))

(declare-fun m!1356169 () Bool)

(assert (=> b!1468996 m!1356169))

(declare-fun m!1356171 () Bool)

(assert (=> b!1468999 m!1356171))

(assert (=> b!1468999 m!1356171))

(declare-fun m!1356173 () Bool)

(assert (=> b!1468999 m!1356173))

(declare-fun m!1356175 () Bool)

(assert (=> b!1469000 m!1356175))

(declare-fun m!1356177 () Bool)

(assert (=> b!1469000 m!1356177))

(assert (=> b!1468998 m!1356157))

(assert (=> b!1468998 m!1356157))

(declare-fun m!1356179 () Bool)

(assert (=> b!1468998 m!1356179))

(assert (=> b!1468998 m!1356179))

(assert (=> b!1468998 m!1356157))

(declare-fun m!1356181 () Bool)

(assert (=> b!1468998 m!1356181))

(assert (=> b!1468997 m!1356175))

(declare-fun m!1356183 () Bool)

(assert (=> b!1468997 m!1356183))

(assert (=> b!1468997 m!1356183))

(declare-fun m!1356185 () Bool)

(assert (=> b!1468997 m!1356185))

(assert (=> b!1468997 m!1356185))

(assert (=> b!1468997 m!1356183))

(declare-fun m!1356187 () Bool)

(assert (=> b!1468997 m!1356187))

(push 1)

