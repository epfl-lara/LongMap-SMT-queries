; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124970 () Bool)

(assert start!124970)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1452767 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!817770 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98418 0))(
  ( (array!98419 (arr!47497 (Array (_ BitVec 32) (_ BitVec 64))) (size!48047 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98418)

(assert (=> b!1452767 (= e!817770 (and (or (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) (select (arr!47497 a!2862) j!93))) (or (and (= (select (arr!47497 a!2862) index!646) (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47497 a!2862) index!646) (select (arr!47497 a!2862) j!93))) (= (select (arr!47497 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452768 () Bool)

(declare-fun res!983847 () Bool)

(declare-fun e!817773 () Bool)

(assert (=> b!1452768 (=> (not res!983847) (not e!817773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452768 (= res!983847 (validKeyInArray!0 (select (arr!47497 a!2862) i!1006)))))

(declare-fun b!1452769 () Bool)

(declare-fun res!983853 () Bool)

(assert (=> b!1452769 (=> (not res!983853) (not e!817773))))

(assert (=> b!1452769 (= res!983853 (validKeyInArray!0 (select (arr!47497 a!2862) j!93)))))

(declare-fun e!817774 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637040 () (_ BitVec 64))

(declare-fun b!1452770 () Bool)

(declare-datatypes ((SeekEntryResult!11749 0))(
  ( (MissingZero!11749 (index!49388 (_ BitVec 32))) (Found!11749 (index!49389 (_ BitVec 32))) (Intermediate!11749 (undefined!12561 Bool) (index!49390 (_ BitVec 32)) (x!131030 (_ BitVec 32))) (Undefined!11749) (MissingVacant!11749 (index!49391 (_ BitVec 32))) )
))
(declare-fun lt!637042 () SeekEntryResult!11749)

(declare-fun lt!637044 () array!98418)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98418 (_ BitVec 32)) SeekEntryResult!11749)

(assert (=> b!1452770 (= e!817774 (= lt!637042 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637040 lt!637044 mask!2687)))))

(declare-fun b!1452771 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98418 (_ BitVec 32)) SeekEntryResult!11749)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98418 (_ BitVec 32)) SeekEntryResult!11749)

(assert (=> b!1452771 (= e!817774 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637040 lt!637044 mask!2687) (seekEntryOrOpen!0 lt!637040 lt!637044 mask!2687)))))

(declare-fun b!1452772 () Bool)

(declare-fun res!983848 () Bool)

(assert (=> b!1452772 (=> (not res!983848) (not e!817770))))

(assert (=> b!1452772 (= res!983848 (= (seekEntryOrOpen!0 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) (Found!11749 j!93)))))

(declare-fun b!1452773 () Bool)

(declare-fun res!983849 () Bool)

(declare-fun e!817771 () Bool)

(assert (=> b!1452773 (=> (not res!983849) (not e!817771))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452773 (= res!983849 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452774 () Bool)

(assert (=> b!1452774 (= e!817771 (not true))))

(assert (=> b!1452774 e!817770))

(declare-fun res!983852 () Bool)

(assert (=> b!1452774 (=> (not res!983852) (not e!817770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98418 (_ BitVec 32)) Bool)

(assert (=> b!1452774 (= res!983852 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48994 0))(
  ( (Unit!48995) )
))
(declare-fun lt!637043 () Unit!48994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48994)

(assert (=> b!1452774 (= lt!637043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452775 () Bool)

(declare-fun res!983858 () Bool)

(assert (=> b!1452775 (=> (not res!983858) (not e!817771))))

(assert (=> b!1452775 (= res!983858 e!817774)))

(declare-fun c!133971 () Bool)

(assert (=> b!1452775 (= c!133971 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452776 () Bool)

(declare-fun res!983856 () Bool)

(declare-fun e!817772 () Bool)

(assert (=> b!1452776 (=> (not res!983856) (not e!817772))))

(declare-fun lt!637041 () SeekEntryResult!11749)

(assert (=> b!1452776 (= res!983856 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!637041))))

(declare-fun b!1452777 () Bool)

(declare-fun res!983851 () Bool)

(assert (=> b!1452777 (=> (not res!983851) (not e!817773))))

(assert (=> b!1452777 (= res!983851 (and (= (size!48047 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48047 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48047 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452778 () Bool)

(assert (=> b!1452778 (= e!817772 e!817771)))

(declare-fun res!983850 () Bool)

(assert (=> b!1452778 (=> (not res!983850) (not e!817771))))

(assert (=> b!1452778 (= res!983850 (= lt!637042 (Intermediate!11749 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452778 (= lt!637042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637040 mask!2687) lt!637040 lt!637044 mask!2687))))

(assert (=> b!1452778 (= lt!637040 (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452780 () Bool)

(declare-fun e!817775 () Bool)

(assert (=> b!1452780 (= e!817775 e!817772)))

(declare-fun res!983857 () Bool)

(assert (=> b!1452780 (=> (not res!983857) (not e!817772))))

(assert (=> b!1452780 (= res!983857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47497 a!2862) j!93) mask!2687) (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!637041))))

(assert (=> b!1452780 (= lt!637041 (Intermediate!11749 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452781 () Bool)

(declare-fun res!983846 () Bool)

(assert (=> b!1452781 (=> (not res!983846) (not e!817773))))

(assert (=> b!1452781 (= res!983846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452782 () Bool)

(assert (=> b!1452782 (= e!817773 e!817775)))

(declare-fun res!983860 () Bool)

(assert (=> b!1452782 (=> (not res!983860) (not e!817775))))

(assert (=> b!1452782 (= res!983860 (= (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452782 (= lt!637044 (array!98419 (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48047 a!2862)))))

(declare-fun b!1452783 () Bool)

(declare-fun res!983854 () Bool)

(assert (=> b!1452783 (=> (not res!983854) (not e!817773))))

(declare-datatypes ((List!33998 0))(
  ( (Nil!33995) (Cons!33994 (h!35344 (_ BitVec 64)) (t!48692 List!33998)) )
))
(declare-fun arrayNoDuplicates!0 (array!98418 (_ BitVec 32) List!33998) Bool)

(assert (=> b!1452783 (= res!983854 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33995))))

(declare-fun res!983859 () Bool)

(assert (=> start!124970 (=> (not res!983859) (not e!817773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124970 (= res!983859 (validMask!0 mask!2687))))

(assert (=> start!124970 e!817773))

(assert (=> start!124970 true))

(declare-fun array_inv!36525 (array!98418) Bool)

(assert (=> start!124970 (array_inv!36525 a!2862)))

(declare-fun b!1452779 () Bool)

(declare-fun res!983855 () Bool)

(assert (=> b!1452779 (=> (not res!983855) (not e!817773))))

(assert (=> b!1452779 (= res!983855 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48047 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48047 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48047 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124970 res!983859) b!1452777))

(assert (= (and b!1452777 res!983851) b!1452768))

(assert (= (and b!1452768 res!983847) b!1452769))

(assert (= (and b!1452769 res!983853) b!1452781))

(assert (= (and b!1452781 res!983846) b!1452783))

(assert (= (and b!1452783 res!983854) b!1452779))

(assert (= (and b!1452779 res!983855) b!1452782))

(assert (= (and b!1452782 res!983860) b!1452780))

(assert (= (and b!1452780 res!983857) b!1452776))

(assert (= (and b!1452776 res!983856) b!1452778))

(assert (= (and b!1452778 res!983850) b!1452775))

(assert (= (and b!1452775 c!133971) b!1452770))

(assert (= (and b!1452775 (not c!133971)) b!1452771))

(assert (= (and b!1452775 res!983858) b!1452773))

(assert (= (and b!1452773 res!983849) b!1452774))

(assert (= (and b!1452774 res!983852) b!1452772))

(assert (= (and b!1452772 res!983848) b!1452767))

(declare-fun m!1341335 () Bool)

(assert (=> b!1452769 m!1341335))

(assert (=> b!1452769 m!1341335))

(declare-fun m!1341337 () Bool)

(assert (=> b!1452769 m!1341337))

(assert (=> b!1452772 m!1341335))

(assert (=> b!1452772 m!1341335))

(declare-fun m!1341339 () Bool)

(assert (=> b!1452772 m!1341339))

(declare-fun m!1341341 () Bool)

(assert (=> b!1452782 m!1341341))

(declare-fun m!1341343 () Bool)

(assert (=> b!1452782 m!1341343))

(declare-fun m!1341345 () Bool)

(assert (=> b!1452781 m!1341345))

(declare-fun m!1341347 () Bool)

(assert (=> b!1452771 m!1341347))

(declare-fun m!1341349 () Bool)

(assert (=> b!1452771 m!1341349))

(declare-fun m!1341351 () Bool)

(assert (=> start!124970 m!1341351))

(declare-fun m!1341353 () Bool)

(assert (=> start!124970 m!1341353))

(declare-fun m!1341355 () Bool)

(assert (=> b!1452778 m!1341355))

(assert (=> b!1452778 m!1341355))

(declare-fun m!1341357 () Bool)

(assert (=> b!1452778 m!1341357))

(assert (=> b!1452778 m!1341341))

(declare-fun m!1341359 () Bool)

(assert (=> b!1452778 m!1341359))

(declare-fun m!1341361 () Bool)

(assert (=> b!1452768 m!1341361))

(assert (=> b!1452768 m!1341361))

(declare-fun m!1341363 () Bool)

(assert (=> b!1452768 m!1341363))

(assert (=> b!1452780 m!1341335))

(assert (=> b!1452780 m!1341335))

(declare-fun m!1341365 () Bool)

(assert (=> b!1452780 m!1341365))

(assert (=> b!1452780 m!1341365))

(assert (=> b!1452780 m!1341335))

(declare-fun m!1341367 () Bool)

(assert (=> b!1452780 m!1341367))

(assert (=> b!1452767 m!1341341))

(declare-fun m!1341369 () Bool)

(assert (=> b!1452767 m!1341369))

(declare-fun m!1341371 () Bool)

(assert (=> b!1452767 m!1341371))

(declare-fun m!1341373 () Bool)

(assert (=> b!1452767 m!1341373))

(assert (=> b!1452767 m!1341335))

(declare-fun m!1341375 () Bool)

(assert (=> b!1452783 m!1341375))

(declare-fun m!1341377 () Bool)

(assert (=> b!1452770 m!1341377))

(declare-fun m!1341379 () Bool)

(assert (=> b!1452774 m!1341379))

(declare-fun m!1341381 () Bool)

(assert (=> b!1452774 m!1341381))

(assert (=> b!1452776 m!1341335))

(assert (=> b!1452776 m!1341335))

(declare-fun m!1341383 () Bool)

(assert (=> b!1452776 m!1341383))

(push 1)

