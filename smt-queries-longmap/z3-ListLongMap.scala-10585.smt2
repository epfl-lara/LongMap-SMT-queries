; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124618 () Bool)

(assert start!124618)

(declare-fun b!1443760 () Bool)

(declare-fun e!813516 () Bool)

(declare-fun e!813513 () Bool)

(assert (=> b!1443760 (= e!813516 e!813513)))

(declare-fun res!975928 () Bool)

(assert (=> b!1443760 (=> (not res!975928) (not e!813513))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11588 0))(
  ( (MissingZero!11588 (index!48744 (_ BitVec 32))) (Found!11588 (index!48745 (_ BitVec 32))) (Intermediate!11588 (undefined!12400 Bool) (index!48746 (_ BitVec 32)) (x!130440 (_ BitVec 32))) (Undefined!11588) (MissingVacant!11588 (index!48747 (_ BitVec 32))) )
))
(declare-fun lt!633800 () SeekEntryResult!11588)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443760 (= res!975928 (= lt!633800 (Intermediate!11588 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98044 0))(
  ( (array!98045 (arr!47311 (Array (_ BitVec 32) (_ BitVec 64))) (size!47863 (_ BitVec 32))) )
))
(declare-fun lt!633803 () array!98044)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633801 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98044 (_ BitVec 32)) SeekEntryResult!11588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443760 (= lt!633800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633801 mask!2687) lt!633801 lt!633803 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98044)

(assert (=> b!1443760 (= lt!633801 (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443761 () Bool)

(declare-fun res!975926 () Bool)

(declare-fun e!813511 () Bool)

(assert (=> b!1443761 (=> (not res!975926) (not e!813511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443761 (= res!975926 (validKeyInArray!0 (select (arr!47311 a!2862) j!93)))))

(declare-fun b!1443762 () Bool)

(declare-fun e!813512 () Bool)

(assert (=> b!1443762 (= e!813513 (not e!813512))))

(declare-fun res!975925 () Bool)

(assert (=> b!1443762 (=> res!975925 e!813512)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1443762 (= res!975925 (or (not (= (select (arr!47311 a!2862) index!646) (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47311 a!2862) index!646) (select (arr!47311 a!2862) j!93)))))))

(declare-fun e!813515 () Bool)

(assert (=> b!1443762 e!813515))

(declare-fun res!975922 () Bool)

(assert (=> b!1443762 (=> (not res!975922) (not e!813515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98044 (_ BitVec 32)) Bool)

(assert (=> b!1443762 (= res!975922 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48513 0))(
  ( (Unit!48514) )
))
(declare-fun lt!633799 () Unit!48513)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48513)

(assert (=> b!1443762 (= lt!633799 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443763 () Bool)

(declare-fun res!975934 () Bool)

(assert (=> b!1443763 (=> (not res!975934) (not e!813511))))

(assert (=> b!1443763 (= res!975934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443764 () Bool)

(declare-fun res!975932 () Bool)

(assert (=> b!1443764 (=> (not res!975932) (not e!813513))))

(declare-fun e!813510 () Bool)

(assert (=> b!1443764 (= res!975932 e!813510)))

(declare-fun c!133432 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1443764 (= c!133432 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443765 () Bool)

(declare-fun e!813514 () Bool)

(assert (=> b!1443765 (= e!813511 e!813514)))

(declare-fun res!975927 () Bool)

(assert (=> b!1443765 (=> (not res!975927) (not e!813514))))

(assert (=> b!1443765 (= res!975927 (= (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443765 (= lt!633803 (array!98045 (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47863 a!2862)))))

(declare-fun b!1443766 () Bool)

(declare-fun res!975924 () Bool)

(assert (=> b!1443766 (=> (not res!975924) (not e!813513))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443766 (= res!975924 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443767 () Bool)

(declare-fun res!975923 () Bool)

(assert (=> b!1443767 (=> (not res!975923) (not e!813515))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98044 (_ BitVec 32)) SeekEntryResult!11588)

(assert (=> b!1443767 (= res!975923 (= (seekEntryOrOpen!0 (select (arr!47311 a!2862) j!93) a!2862 mask!2687) (Found!11588 j!93)))))

(declare-fun b!1443768 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1443768 (= e!813515 (or (= (select (arr!47311 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47311 a!2862) intermediateBeforeIndex!19) (select (arr!47311 a!2862) j!93))))))

(declare-fun b!1443769 () Bool)

(declare-fun res!975931 () Bool)

(assert (=> b!1443769 (=> (not res!975931) (not e!813511))))

(declare-datatypes ((List!33890 0))(
  ( (Nil!33887) (Cons!33886 (h!35236 (_ BitVec 64)) (t!48576 List!33890)) )
))
(declare-fun arrayNoDuplicates!0 (array!98044 (_ BitVec 32) List!33890) Bool)

(assert (=> b!1443769 (= res!975931 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33887))))

(declare-fun b!1443770 () Bool)

(assert (=> b!1443770 (= e!813514 e!813516)))

(declare-fun res!975930 () Bool)

(assert (=> b!1443770 (=> (not res!975930) (not e!813516))))

(declare-fun lt!633802 () SeekEntryResult!11588)

(assert (=> b!1443770 (= res!975930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47311 a!2862) j!93) mask!2687) (select (arr!47311 a!2862) j!93) a!2862 mask!2687) lt!633802))))

(assert (=> b!1443770 (= lt!633802 (Intermediate!11588 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443771 () Bool)

(assert (=> b!1443771 (= e!813512 true)))

(declare-fun lt!633804 () SeekEntryResult!11588)

(assert (=> b!1443771 (= lt!633804 (seekEntryOrOpen!0 lt!633801 lt!633803 mask!2687))))

(declare-fun b!1443772 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98044 (_ BitVec 32)) SeekEntryResult!11588)

(assert (=> b!1443772 (= e!813510 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633801 lt!633803 mask!2687) (seekEntryOrOpen!0 lt!633801 lt!633803 mask!2687)))))

(declare-fun b!1443774 () Bool)

(declare-fun res!975936 () Bool)

(assert (=> b!1443774 (=> (not res!975936) (not e!813511))))

(assert (=> b!1443774 (= res!975936 (and (= (size!47863 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47863 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47863 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443775 () Bool)

(declare-fun res!975933 () Bool)

(assert (=> b!1443775 (=> (not res!975933) (not e!813511))))

(assert (=> b!1443775 (= res!975933 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47863 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47863 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47863 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443776 () Bool)

(declare-fun res!975935 () Bool)

(assert (=> b!1443776 (=> (not res!975935) (not e!813516))))

(assert (=> b!1443776 (= res!975935 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47311 a!2862) j!93) a!2862 mask!2687) lt!633802))))

(declare-fun b!1443777 () Bool)

(assert (=> b!1443777 (= e!813510 (= lt!633800 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633801 lt!633803 mask!2687)))))

(declare-fun res!975937 () Bool)

(assert (=> start!124618 (=> (not res!975937) (not e!813511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124618 (= res!975937 (validMask!0 mask!2687))))

(assert (=> start!124618 e!813511))

(assert (=> start!124618 true))

(declare-fun array_inv!36544 (array!98044) Bool)

(assert (=> start!124618 (array_inv!36544 a!2862)))

(declare-fun b!1443773 () Bool)

(declare-fun res!975929 () Bool)

(assert (=> b!1443773 (=> (not res!975929) (not e!813511))))

(assert (=> b!1443773 (= res!975929 (validKeyInArray!0 (select (arr!47311 a!2862) i!1006)))))

(assert (= (and start!124618 res!975937) b!1443774))

(assert (= (and b!1443774 res!975936) b!1443773))

(assert (= (and b!1443773 res!975929) b!1443761))

(assert (= (and b!1443761 res!975926) b!1443763))

(assert (= (and b!1443763 res!975934) b!1443769))

(assert (= (and b!1443769 res!975931) b!1443775))

(assert (= (and b!1443775 res!975933) b!1443765))

(assert (= (and b!1443765 res!975927) b!1443770))

(assert (= (and b!1443770 res!975930) b!1443776))

(assert (= (and b!1443776 res!975935) b!1443760))

(assert (= (and b!1443760 res!975928) b!1443764))

(assert (= (and b!1443764 c!133432) b!1443777))

(assert (= (and b!1443764 (not c!133432)) b!1443772))

(assert (= (and b!1443764 res!975932) b!1443766))

(assert (= (and b!1443766 res!975924) b!1443762))

(assert (= (and b!1443762 res!975922) b!1443767))

(assert (= (and b!1443767 res!975923) b!1443768))

(assert (= (and b!1443762 (not res!975925)) b!1443771))

(declare-fun m!1332327 () Bool)

(assert (=> b!1443761 m!1332327))

(assert (=> b!1443761 m!1332327))

(declare-fun m!1332329 () Bool)

(assert (=> b!1443761 m!1332329))

(declare-fun m!1332331 () Bool)

(assert (=> b!1443768 m!1332331))

(assert (=> b!1443768 m!1332327))

(assert (=> b!1443767 m!1332327))

(assert (=> b!1443767 m!1332327))

(declare-fun m!1332333 () Bool)

(assert (=> b!1443767 m!1332333))

(declare-fun m!1332335 () Bool)

(assert (=> b!1443769 m!1332335))

(declare-fun m!1332337 () Bool)

(assert (=> b!1443763 m!1332337))

(assert (=> b!1443770 m!1332327))

(assert (=> b!1443770 m!1332327))

(declare-fun m!1332339 () Bool)

(assert (=> b!1443770 m!1332339))

(assert (=> b!1443770 m!1332339))

(assert (=> b!1443770 m!1332327))

(declare-fun m!1332341 () Bool)

(assert (=> b!1443770 m!1332341))

(declare-fun m!1332343 () Bool)

(assert (=> b!1443760 m!1332343))

(assert (=> b!1443760 m!1332343))

(declare-fun m!1332345 () Bool)

(assert (=> b!1443760 m!1332345))

(declare-fun m!1332347 () Bool)

(assert (=> b!1443760 m!1332347))

(declare-fun m!1332349 () Bool)

(assert (=> b!1443760 m!1332349))

(assert (=> b!1443776 m!1332327))

(assert (=> b!1443776 m!1332327))

(declare-fun m!1332351 () Bool)

(assert (=> b!1443776 m!1332351))

(assert (=> b!1443765 m!1332347))

(declare-fun m!1332353 () Bool)

(assert (=> b!1443765 m!1332353))

(declare-fun m!1332355 () Bool)

(assert (=> b!1443771 m!1332355))

(declare-fun m!1332357 () Bool)

(assert (=> b!1443777 m!1332357))

(declare-fun m!1332359 () Bool)

(assert (=> start!124618 m!1332359))

(declare-fun m!1332361 () Bool)

(assert (=> start!124618 m!1332361))

(declare-fun m!1332363 () Bool)

(assert (=> b!1443762 m!1332363))

(assert (=> b!1443762 m!1332347))

(declare-fun m!1332365 () Bool)

(assert (=> b!1443762 m!1332365))

(declare-fun m!1332367 () Bool)

(assert (=> b!1443762 m!1332367))

(declare-fun m!1332369 () Bool)

(assert (=> b!1443762 m!1332369))

(assert (=> b!1443762 m!1332327))

(declare-fun m!1332371 () Bool)

(assert (=> b!1443772 m!1332371))

(assert (=> b!1443772 m!1332355))

(declare-fun m!1332373 () Bool)

(assert (=> b!1443773 m!1332373))

(assert (=> b!1443773 m!1332373))

(declare-fun m!1332375 () Bool)

(assert (=> b!1443773 m!1332375))

(check-sat (not b!1443761) (not b!1443762) (not b!1443772) (not b!1443773) (not b!1443760) (not b!1443767) (not b!1443776) (not b!1443769) (not b!1443770) (not b!1443763) (not b!1443771) (not b!1443777) (not start!124618))
(check-sat)
