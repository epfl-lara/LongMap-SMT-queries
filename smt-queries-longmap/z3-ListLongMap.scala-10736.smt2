; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125556 () Bool)

(assert start!125556)

(declare-fun b!1469020 () Bool)

(declare-fun e!824775 () Bool)

(declare-fun e!824777 () Bool)

(assert (=> b!1469020 (= e!824775 e!824777)))

(declare-fun res!997562 () Bool)

(assert (=> b!1469020 (=> (not res!997562) (not e!824777))))

(declare-datatypes ((SeekEntryResult!12030 0))(
  ( (MissingZero!12030 (index!50512 (_ BitVec 32))) (Found!12030 (index!50513 (_ BitVec 32))) (Intermediate!12030 (undefined!12842 Bool) (index!50514 (_ BitVec 32)) (x!132095 (_ BitVec 32))) (Undefined!12030) (MissingVacant!12030 (index!50515 (_ BitVec 32))) )
))
(declare-fun lt!642419 () SeekEntryResult!12030)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99004 0))(
  ( (array!99005 (arr!47790 (Array (_ BitVec 32) (_ BitVec 64))) (size!48340 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99004)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99004 (_ BitVec 32)) SeekEntryResult!12030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469020 (= res!997562 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47790 a!2862) j!93) mask!2687) (select (arr!47790 a!2862) j!93) a!2862 mask!2687) lt!642419))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469020 (= lt!642419 (Intermediate!12030 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469021 () Bool)

(declare-fun res!997559 () Bool)

(assert (=> b!1469021 (=> (not res!997559) (not e!824775))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469021 (= res!997559 (and (= (size!48340 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48340 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48340 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469022 () Bool)

(declare-fun res!997563 () Bool)

(assert (=> b!1469022 (=> (not res!997563) (not e!824775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469022 (= res!997563 (validKeyInArray!0 (select (arr!47790 a!2862) i!1006)))))

(declare-fun b!1469023 () Bool)

(assert (=> b!1469023 (= e!824777 false)))

(declare-fun lt!642420 () SeekEntryResult!12030)

(assert (=> b!1469023 (= lt!642420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47790 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47790 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99005 (store (arr!47790 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48340 a!2862)) mask!2687))))

(declare-fun b!1469024 () Bool)

(declare-fun res!997565 () Bool)

(assert (=> b!1469024 (=> (not res!997565) (not e!824775))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469024 (= res!997565 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48340 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48340 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48340 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47790 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!997567 () Bool)

(assert (=> start!125556 (=> (not res!997567) (not e!824775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125556 (= res!997567 (validMask!0 mask!2687))))

(assert (=> start!125556 e!824775))

(assert (=> start!125556 true))

(declare-fun array_inv!36818 (array!99004) Bool)

(assert (=> start!125556 (array_inv!36818 a!2862)))

(declare-fun b!1469025 () Bool)

(declare-fun res!997566 () Bool)

(assert (=> b!1469025 (=> (not res!997566) (not e!824777))))

(assert (=> b!1469025 (= res!997566 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47790 a!2862) j!93) a!2862 mask!2687) lt!642419))))

(declare-fun b!1469026 () Bool)

(declare-fun res!997564 () Bool)

(assert (=> b!1469026 (=> (not res!997564) (not e!824775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99004 (_ BitVec 32)) Bool)

(assert (=> b!1469026 (= res!997564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469027 () Bool)

(declare-fun res!997560 () Bool)

(assert (=> b!1469027 (=> (not res!997560) (not e!824775))))

(assert (=> b!1469027 (= res!997560 (validKeyInArray!0 (select (arr!47790 a!2862) j!93)))))

(declare-fun b!1469028 () Bool)

(declare-fun res!997561 () Bool)

(assert (=> b!1469028 (=> (not res!997561) (not e!824775))))

(declare-datatypes ((List!34291 0))(
  ( (Nil!34288) (Cons!34287 (h!35637 (_ BitVec 64)) (t!48985 List!34291)) )
))
(declare-fun arrayNoDuplicates!0 (array!99004 (_ BitVec 32) List!34291) Bool)

(assert (=> b!1469028 (= res!997561 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34288))))

(assert (= (and start!125556 res!997567) b!1469021))

(assert (= (and b!1469021 res!997559) b!1469022))

(assert (= (and b!1469022 res!997563) b!1469027))

(assert (= (and b!1469027 res!997560) b!1469026))

(assert (= (and b!1469026 res!997564) b!1469028))

(assert (= (and b!1469028 res!997561) b!1469024))

(assert (= (and b!1469024 res!997565) b!1469020))

(assert (= (and b!1469020 res!997562) b!1469025))

(assert (= (and b!1469025 res!997566) b!1469023))

(declare-fun m!1356189 () Bool)

(assert (=> b!1469023 m!1356189))

(declare-fun m!1356191 () Bool)

(assert (=> b!1469023 m!1356191))

(assert (=> b!1469023 m!1356191))

(declare-fun m!1356193 () Bool)

(assert (=> b!1469023 m!1356193))

(assert (=> b!1469023 m!1356193))

(assert (=> b!1469023 m!1356191))

(declare-fun m!1356195 () Bool)

(assert (=> b!1469023 m!1356195))

(assert (=> b!1469024 m!1356189))

(declare-fun m!1356197 () Bool)

(assert (=> b!1469024 m!1356197))

(declare-fun m!1356199 () Bool)

(assert (=> b!1469026 m!1356199))

(declare-fun m!1356201 () Bool)

(assert (=> b!1469027 m!1356201))

(assert (=> b!1469027 m!1356201))

(declare-fun m!1356203 () Bool)

(assert (=> b!1469027 m!1356203))

(assert (=> b!1469020 m!1356201))

(assert (=> b!1469020 m!1356201))

(declare-fun m!1356205 () Bool)

(assert (=> b!1469020 m!1356205))

(assert (=> b!1469020 m!1356205))

(assert (=> b!1469020 m!1356201))

(declare-fun m!1356207 () Bool)

(assert (=> b!1469020 m!1356207))

(declare-fun m!1356209 () Bool)

(assert (=> b!1469022 m!1356209))

(assert (=> b!1469022 m!1356209))

(declare-fun m!1356211 () Bool)

(assert (=> b!1469022 m!1356211))

(declare-fun m!1356213 () Bool)

(assert (=> b!1469028 m!1356213))

(declare-fun m!1356215 () Bool)

(assert (=> start!125556 m!1356215))

(declare-fun m!1356217 () Bool)

(assert (=> start!125556 m!1356217))

(assert (=> b!1469025 m!1356201))

(assert (=> b!1469025 m!1356201))

(declare-fun m!1356219 () Bool)

(assert (=> b!1469025 m!1356219))

(check-sat (not b!1469022) (not b!1469027) (not b!1469023) (not start!125556) (not b!1469028) (not b!1469020) (not b!1469025) (not b!1469026))
(check-sat)
