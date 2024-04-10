; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124422 () Bool)

(assert start!124422)

(declare-fun b!1439487 () Bool)

(declare-fun res!971921 () Bool)

(declare-fun e!811888 () Bool)

(assert (=> b!1439487 (=> (not res!971921) (not e!811888))))

(declare-datatypes ((array!97870 0))(
  ( (array!97871 (arr!47223 (Array (_ BitVec 32) (_ BitVec 64))) (size!47773 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97870)

(declare-datatypes ((List!33724 0))(
  ( (Nil!33721) (Cons!33720 (h!35070 (_ BitVec 64)) (t!48418 List!33724)) )
))
(declare-fun arrayNoDuplicates!0 (array!97870 (_ BitVec 32) List!33724) Bool)

(assert (=> b!1439487 (= res!971921 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33721))))

(declare-fun b!1439488 () Bool)

(declare-fun res!971917 () Bool)

(declare-fun e!811887 () Bool)

(assert (=> b!1439488 (=> (not res!971917) (not e!811887))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11475 0))(
  ( (MissingZero!11475 (index!48292 (_ BitVec 32))) (Found!11475 (index!48293 (_ BitVec 32))) (Intermediate!11475 (undefined!12287 Bool) (index!48294 (_ BitVec 32)) (x!130028 (_ BitVec 32))) (Undefined!11475) (MissingVacant!11475 (index!48295 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97870 (_ BitVec 32)) SeekEntryResult!11475)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439488 (= res!971917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97871 (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47773 a!2862)) mask!2687) (Intermediate!11475 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439489 () Bool)

(declare-fun res!971922 () Bool)

(assert (=> b!1439489 (=> (not res!971922) (not e!811888))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439489 (= res!971922 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47773 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47773 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47773 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439490 () Bool)

(declare-fun res!971919 () Bool)

(assert (=> b!1439490 (=> (not res!971919) (not e!811888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439490 (= res!971919 (validKeyInArray!0 (select (arr!47223 a!2862) i!1006)))))

(declare-fun b!1439491 () Bool)

(assert (=> b!1439491 (= e!811888 e!811887)))

(declare-fun res!971915 () Bool)

(assert (=> b!1439491 (=> (not res!971915) (not e!811887))))

(declare-fun lt!632820 () SeekEntryResult!11475)

(assert (=> b!1439491 (= res!971915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47223 a!2862) j!93) mask!2687) (select (arr!47223 a!2862) j!93) a!2862 mask!2687) lt!632820))))

(assert (=> b!1439491 (= lt!632820 (Intermediate!11475 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439492 () Bool)

(assert (=> b!1439492 (= e!811887 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439494 () Bool)

(declare-fun res!971914 () Bool)

(assert (=> b!1439494 (=> (not res!971914) (not e!811888))))

(assert (=> b!1439494 (= res!971914 (validKeyInArray!0 (select (arr!47223 a!2862) j!93)))))

(declare-fun b!1439495 () Bool)

(declare-fun res!971923 () Bool)

(assert (=> b!1439495 (=> (not res!971923) (not e!811888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97870 (_ BitVec 32)) Bool)

(assert (=> b!1439495 (= res!971923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439496 () Bool)

(declare-fun res!971916 () Bool)

(assert (=> b!1439496 (=> (not res!971916) (not e!811887))))

(assert (=> b!1439496 (= res!971916 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47223 a!2862) j!93) a!2862 mask!2687) lt!632820))))

(declare-fun b!1439493 () Bool)

(declare-fun res!971918 () Bool)

(assert (=> b!1439493 (=> (not res!971918) (not e!811888))))

(assert (=> b!1439493 (= res!971918 (and (= (size!47773 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47773 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47773 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!971920 () Bool)

(assert (=> start!124422 (=> (not res!971920) (not e!811888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124422 (= res!971920 (validMask!0 mask!2687))))

(assert (=> start!124422 e!811888))

(assert (=> start!124422 true))

(declare-fun array_inv!36251 (array!97870) Bool)

(assert (=> start!124422 (array_inv!36251 a!2862)))

(assert (= (and start!124422 res!971920) b!1439493))

(assert (= (and b!1439493 res!971918) b!1439490))

(assert (= (and b!1439490 res!971919) b!1439494))

(assert (= (and b!1439494 res!971914) b!1439495))

(assert (= (and b!1439495 res!971923) b!1439487))

(assert (= (and b!1439487 res!971921) b!1439489))

(assert (= (and b!1439489 res!971922) b!1439491))

(assert (= (and b!1439491 res!971915) b!1439496))

(assert (= (and b!1439496 res!971916) b!1439488))

(assert (= (and b!1439488 res!971917) b!1439492))

(declare-fun m!1328565 () Bool)

(assert (=> b!1439488 m!1328565))

(declare-fun m!1328567 () Bool)

(assert (=> b!1439488 m!1328567))

(assert (=> b!1439488 m!1328567))

(declare-fun m!1328569 () Bool)

(assert (=> b!1439488 m!1328569))

(assert (=> b!1439488 m!1328569))

(assert (=> b!1439488 m!1328567))

(declare-fun m!1328571 () Bool)

(assert (=> b!1439488 m!1328571))

(declare-fun m!1328573 () Bool)

(assert (=> b!1439491 m!1328573))

(assert (=> b!1439491 m!1328573))

(declare-fun m!1328575 () Bool)

(assert (=> b!1439491 m!1328575))

(assert (=> b!1439491 m!1328575))

(assert (=> b!1439491 m!1328573))

(declare-fun m!1328577 () Bool)

(assert (=> b!1439491 m!1328577))

(assert (=> b!1439496 m!1328573))

(assert (=> b!1439496 m!1328573))

(declare-fun m!1328579 () Bool)

(assert (=> b!1439496 m!1328579))

(assert (=> b!1439494 m!1328573))

(assert (=> b!1439494 m!1328573))

(declare-fun m!1328581 () Bool)

(assert (=> b!1439494 m!1328581))

(assert (=> b!1439489 m!1328565))

(declare-fun m!1328583 () Bool)

(assert (=> b!1439489 m!1328583))

(declare-fun m!1328585 () Bool)

(assert (=> start!124422 m!1328585))

(declare-fun m!1328587 () Bool)

(assert (=> start!124422 m!1328587))

(declare-fun m!1328589 () Bool)

(assert (=> b!1439495 m!1328589))

(declare-fun m!1328591 () Bool)

(assert (=> b!1439487 m!1328591))

(declare-fun m!1328593 () Bool)

(assert (=> b!1439490 m!1328593))

(assert (=> b!1439490 m!1328593))

(declare-fun m!1328595 () Bool)

(assert (=> b!1439490 m!1328595))

(check-sat (not b!1439487) (not b!1439495) (not start!124422) (not b!1439496) (not b!1439490) (not b!1439488) (not b!1439494) (not b!1439491))
(check-sat)
