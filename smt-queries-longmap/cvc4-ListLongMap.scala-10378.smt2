; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122194 () Bool)

(assert start!122194)

(declare-fun b!1417551 () Bool)

(declare-fun e!802259 () Bool)

(assert (=> b!1417551 (= e!802259 (not true))))

(declare-fun e!802258 () Bool)

(assert (=> b!1417551 e!802258))

(declare-fun res!953281 () Bool)

(assert (=> b!1417551 (=> (not res!953281) (not e!802258))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96778 0))(
  ( (array!96779 (arr!46717 (Array (_ BitVec 32) (_ BitVec 64))) (size!47267 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96778)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96778 (_ BitVec 32)) Bool)

(assert (=> b!1417551 (= res!953281 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48030 0))(
  ( (Unit!48031) )
))
(declare-fun lt!625403 () Unit!48030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48030)

(assert (=> b!1417551 (= lt!625403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11028 0))(
  ( (MissingZero!11028 (index!46504 (_ BitVec 32))) (Found!11028 (index!46505 (_ BitVec 32))) (Intermediate!11028 (undefined!11840 Bool) (index!46506 (_ BitVec 32)) (x!128103 (_ BitVec 32))) (Undefined!11028) (MissingVacant!11028 (index!46507 (_ BitVec 32))) )
))
(declare-fun lt!625404 () SeekEntryResult!11028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96778 (_ BitVec 32)) SeekEntryResult!11028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417551 (= lt!625404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46717 a!2901) j!112) mask!2840) (select (arr!46717 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417552 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96778 (_ BitVec 32)) SeekEntryResult!11028)

(assert (=> b!1417552 (= e!802258 (= (seekEntryOrOpen!0 (select (arr!46717 a!2901) j!112) a!2901 mask!2840) (Found!11028 j!112)))))

(declare-fun b!1417553 () Bool)

(declare-fun res!953282 () Bool)

(assert (=> b!1417553 (=> (not res!953282) (not e!802259))))

(assert (=> b!1417553 (= res!953282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417554 () Bool)

(declare-fun res!953284 () Bool)

(assert (=> b!1417554 (=> (not res!953284) (not e!802259))))

(declare-datatypes ((List!33236 0))(
  ( (Nil!33233) (Cons!33232 (h!34525 (_ BitVec 64)) (t!47930 List!33236)) )
))
(declare-fun arrayNoDuplicates!0 (array!96778 (_ BitVec 32) List!33236) Bool)

(assert (=> b!1417554 (= res!953284 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33233))))

(declare-fun b!1417555 () Bool)

(declare-fun res!953286 () Bool)

(assert (=> b!1417555 (=> (not res!953286) (not e!802259))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417555 (= res!953286 (and (= (size!47267 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47267 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47267 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!953285 () Bool)

(assert (=> start!122194 (=> (not res!953285) (not e!802259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122194 (= res!953285 (validMask!0 mask!2840))))

(assert (=> start!122194 e!802259))

(assert (=> start!122194 true))

(declare-fun array_inv!35745 (array!96778) Bool)

(assert (=> start!122194 (array_inv!35745 a!2901)))

(declare-fun b!1417556 () Bool)

(declare-fun res!953287 () Bool)

(assert (=> b!1417556 (=> (not res!953287) (not e!802259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417556 (= res!953287 (validKeyInArray!0 (select (arr!46717 a!2901) j!112)))))

(declare-fun b!1417557 () Bool)

(declare-fun res!953283 () Bool)

(assert (=> b!1417557 (=> (not res!953283) (not e!802259))))

(assert (=> b!1417557 (= res!953283 (validKeyInArray!0 (select (arr!46717 a!2901) i!1037)))))

(assert (= (and start!122194 res!953285) b!1417555))

(assert (= (and b!1417555 res!953286) b!1417557))

(assert (= (and b!1417557 res!953283) b!1417556))

(assert (= (and b!1417556 res!953287) b!1417553))

(assert (= (and b!1417553 res!953282) b!1417554))

(assert (= (and b!1417554 res!953284) b!1417551))

(assert (= (and b!1417551 res!953281) b!1417552))

(declare-fun m!1308295 () Bool)

(assert (=> start!122194 m!1308295))

(declare-fun m!1308297 () Bool)

(assert (=> start!122194 m!1308297))

(declare-fun m!1308299 () Bool)

(assert (=> b!1417554 m!1308299))

(declare-fun m!1308301 () Bool)

(assert (=> b!1417556 m!1308301))

(assert (=> b!1417556 m!1308301))

(declare-fun m!1308303 () Bool)

(assert (=> b!1417556 m!1308303))

(declare-fun m!1308305 () Bool)

(assert (=> b!1417553 m!1308305))

(assert (=> b!1417551 m!1308301))

(declare-fun m!1308307 () Bool)

(assert (=> b!1417551 m!1308307))

(assert (=> b!1417551 m!1308301))

(declare-fun m!1308309 () Bool)

(assert (=> b!1417551 m!1308309))

(assert (=> b!1417551 m!1308307))

(assert (=> b!1417551 m!1308301))

(declare-fun m!1308311 () Bool)

(assert (=> b!1417551 m!1308311))

(declare-fun m!1308313 () Bool)

(assert (=> b!1417551 m!1308313))

(assert (=> b!1417552 m!1308301))

(assert (=> b!1417552 m!1308301))

(declare-fun m!1308315 () Bool)

(assert (=> b!1417552 m!1308315))

(declare-fun m!1308317 () Bool)

(assert (=> b!1417557 m!1308317))

(assert (=> b!1417557 m!1308317))

(declare-fun m!1308319 () Bool)

(assert (=> b!1417557 m!1308319))

(push 1)

(assert (not b!1417556))

(assert (not start!122194))

(assert (not b!1417552))

(assert (not b!1417557))

(assert (not b!1417551))

(assert (not b!1417554))

(assert (not b!1417553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

