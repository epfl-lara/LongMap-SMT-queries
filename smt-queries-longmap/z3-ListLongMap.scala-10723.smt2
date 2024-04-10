; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125478 () Bool)

(assert start!125478)

(declare-fun b!1467967 () Bool)

(declare-fun e!824425 () Bool)

(declare-fun e!824426 () Bool)

(assert (=> b!1467967 (= e!824425 e!824426)))

(declare-fun res!996510 () Bool)

(assert (=> b!1467967 (=> (not res!996510) (not e!824426))))

(declare-datatypes ((SeekEntryResult!11991 0))(
  ( (MissingZero!11991 (index!50356 (_ BitVec 32))) (Found!11991 (index!50357 (_ BitVec 32))) (Intermediate!11991 (undefined!12803 Bool) (index!50358 (_ BitVec 32)) (x!131952 (_ BitVec 32))) (Undefined!11991) (MissingVacant!11991 (index!50359 (_ BitVec 32))) )
))
(declare-fun lt!642185 () SeekEntryResult!11991)

(declare-datatypes ((array!98926 0))(
  ( (array!98927 (arr!47751 (Array (_ BitVec 32) (_ BitVec 64))) (size!48301 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98926)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98926 (_ BitVec 32)) SeekEntryResult!11991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467967 (= res!996510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47751 a!2862) j!93) mask!2687) (select (arr!47751 a!2862) j!93) a!2862 mask!2687) lt!642185))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467967 (= lt!642185 (Intermediate!11991 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467968 () Bool)

(declare-fun res!996514 () Bool)

(assert (=> b!1467968 (=> (not res!996514) (not e!824425))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467968 (= res!996514 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48301 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48301 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48301 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47751 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!996509 () Bool)

(assert (=> start!125478 (=> (not res!996509) (not e!824425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125478 (= res!996509 (validMask!0 mask!2687))))

(assert (=> start!125478 e!824425))

(assert (=> start!125478 true))

(declare-fun array_inv!36779 (array!98926) Bool)

(assert (=> start!125478 (array_inv!36779 a!2862)))

(declare-fun b!1467969 () Bool)

(declare-fun res!996511 () Bool)

(assert (=> b!1467969 (=> (not res!996511) (not e!824425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467969 (= res!996511 (validKeyInArray!0 (select (arr!47751 a!2862) j!93)))))

(declare-fun b!1467970 () Bool)

(declare-fun res!996507 () Bool)

(assert (=> b!1467970 (=> (not res!996507) (not e!824425))))

(assert (=> b!1467970 (= res!996507 (and (= (size!48301 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48301 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48301 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467971 () Bool)

(assert (=> b!1467971 (= e!824426 false)))

(declare-fun lt!642186 () (_ BitVec 32))

(assert (=> b!1467971 (= lt!642186 (toIndex!0 (select (store (arr!47751 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1467972 () Bool)

(declare-fun res!996512 () Bool)

(assert (=> b!1467972 (=> (not res!996512) (not e!824425))))

(declare-datatypes ((List!34252 0))(
  ( (Nil!34249) (Cons!34248 (h!35598 (_ BitVec 64)) (t!48946 List!34252)) )
))
(declare-fun arrayNoDuplicates!0 (array!98926 (_ BitVec 32) List!34252) Bool)

(assert (=> b!1467972 (= res!996512 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34249))))

(declare-fun b!1467973 () Bool)

(declare-fun res!996513 () Bool)

(assert (=> b!1467973 (=> (not res!996513) (not e!824426))))

(assert (=> b!1467973 (= res!996513 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47751 a!2862) j!93) a!2862 mask!2687) lt!642185))))

(declare-fun b!1467974 () Bool)

(declare-fun res!996506 () Bool)

(assert (=> b!1467974 (=> (not res!996506) (not e!824425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98926 (_ BitVec 32)) Bool)

(assert (=> b!1467974 (= res!996506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467975 () Bool)

(declare-fun res!996508 () Bool)

(assert (=> b!1467975 (=> (not res!996508) (not e!824425))))

(assert (=> b!1467975 (= res!996508 (validKeyInArray!0 (select (arr!47751 a!2862) i!1006)))))

(assert (= (and start!125478 res!996509) b!1467970))

(assert (= (and b!1467970 res!996507) b!1467975))

(assert (= (and b!1467975 res!996508) b!1467969))

(assert (= (and b!1467969 res!996511) b!1467974))

(assert (= (and b!1467974 res!996506) b!1467972))

(assert (= (and b!1467972 res!996512) b!1467968))

(assert (= (and b!1467968 res!996514) b!1467967))

(assert (= (and b!1467967 res!996510) b!1467973))

(assert (= (and b!1467973 res!996513) b!1467971))

(declare-fun m!1354945 () Bool)

(assert (=> b!1467974 m!1354945))

(declare-fun m!1354947 () Bool)

(assert (=> b!1467967 m!1354947))

(assert (=> b!1467967 m!1354947))

(declare-fun m!1354949 () Bool)

(assert (=> b!1467967 m!1354949))

(assert (=> b!1467967 m!1354949))

(assert (=> b!1467967 m!1354947))

(declare-fun m!1354951 () Bool)

(assert (=> b!1467967 m!1354951))

(assert (=> b!1467969 m!1354947))

(assert (=> b!1467969 m!1354947))

(declare-fun m!1354953 () Bool)

(assert (=> b!1467969 m!1354953))

(assert (=> b!1467973 m!1354947))

(assert (=> b!1467973 m!1354947))

(declare-fun m!1354955 () Bool)

(assert (=> b!1467973 m!1354955))

(declare-fun m!1354957 () Bool)

(assert (=> b!1467972 m!1354957))

(declare-fun m!1354959 () Bool)

(assert (=> b!1467971 m!1354959))

(declare-fun m!1354961 () Bool)

(assert (=> b!1467971 m!1354961))

(assert (=> b!1467971 m!1354961))

(declare-fun m!1354963 () Bool)

(assert (=> b!1467971 m!1354963))

(declare-fun m!1354965 () Bool)

(assert (=> b!1467975 m!1354965))

(assert (=> b!1467975 m!1354965))

(declare-fun m!1354967 () Bool)

(assert (=> b!1467975 m!1354967))

(assert (=> b!1467968 m!1354959))

(declare-fun m!1354969 () Bool)

(assert (=> b!1467968 m!1354969))

(declare-fun m!1354971 () Bool)

(assert (=> start!125478 m!1354971))

(declare-fun m!1354973 () Bool)

(assert (=> start!125478 m!1354973))

(check-sat (not b!1467972) (not b!1467974) (not b!1467971) (not b!1467973) (not b!1467967) (not b!1467975) (not start!125478) (not b!1467969))
