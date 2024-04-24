; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124962 () Bool)

(assert start!124962)

(declare-fun b!1447759 () Bool)

(declare-fun e!815493 () Bool)

(declare-fun e!815502 () Bool)

(assert (=> b!1447759 (= e!815493 e!815502)))

(declare-fun res!978698 () Bool)

(assert (=> b!1447759 (=> (not res!978698) (not e!815502))))

(declare-datatypes ((SeekEntryResult!11586 0))(
  ( (MissingZero!11586 (index!48736 (_ BitVec 32))) (Found!11586 (index!48737 (_ BitVec 32))) (Intermediate!11586 (undefined!12398 Bool) (index!48738 (_ BitVec 32)) (x!130595 (_ BitVec 32))) (Undefined!11586) (MissingVacant!11586 (index!48739 (_ BitVec 32))) )
))
(declare-fun lt!635272 () SeekEntryResult!11586)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447759 (= res!978698 (= lt!635272 (Intermediate!11586 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635271 () (_ BitVec 64))

(declare-datatypes ((array!98305 0))(
  ( (array!98306 (arr!47437 (Array (_ BitVec 32) (_ BitVec 64))) (size!47988 (_ BitVec 32))) )
))
(declare-fun lt!635270 () array!98305)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98305 (_ BitVec 32)) SeekEntryResult!11586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447759 (= lt!635272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635271 mask!2687) lt!635271 lt!635270 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98305)

(assert (=> b!1447759 (= lt!635271 (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447760 () Bool)

(declare-fun res!978697 () Bool)

(assert (=> b!1447760 (=> (not res!978697) (not e!815493))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635275 () SeekEntryResult!11586)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1447760 (= res!978697 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!635275))))

(declare-fun b!1447761 () Bool)

(declare-fun e!815494 () Bool)

(declare-fun e!815501 () Bool)

(assert (=> b!1447761 (= e!815494 e!815501)))

(declare-fun res!978696 () Bool)

(assert (=> b!1447761 (=> (not res!978696) (not e!815501))))

(assert (=> b!1447761 (= res!978696 (= (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447761 (= lt!635270 (array!98306 (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47988 a!2862)))))

(declare-fun b!1447762 () Bool)

(declare-fun e!815497 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98305 (_ BitVec 32)) SeekEntryResult!11586)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98305 (_ BitVec 32)) SeekEntryResult!11586)

(assert (=> b!1447762 (= e!815497 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635271 lt!635270 mask!2687) (seekEntryOrOpen!0 lt!635271 lt!635270 mask!2687)))))

(declare-fun b!1447763 () Bool)

(declare-fun e!815495 () Bool)

(declare-fun e!815500 () Bool)

(assert (=> b!1447763 (= e!815495 e!815500)))

(declare-fun res!978701 () Bool)

(assert (=> b!1447763 (=> (not res!978701) (not e!815500))))

(declare-fun lt!635273 () SeekEntryResult!11586)

(assert (=> b!1447763 (= res!978701 (= lt!635273 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47437 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447764 () Bool)

(declare-fun e!815496 () Bool)

(assert (=> b!1447764 (= e!815502 (not e!815496))))

(declare-fun res!978707 () Bool)

(assert (=> b!1447764 (=> res!978707 e!815496)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1447764 (= res!978707 (or (and (= (select (arr!47437 a!2862) index!646) (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47437 a!2862) index!646) (select (arr!47437 a!2862) j!93))) (not (= (select (arr!47437 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815499 () Bool)

(assert (=> b!1447764 e!815499))

(declare-fun res!978706 () Bool)

(assert (=> b!1447764 (=> (not res!978706) (not e!815499))))

(assert (=> b!1447764 (= res!978706 (and (= lt!635273 (Found!11586 j!93)) (or (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) (select (arr!47437 a!2862) j!93)))))))

(assert (=> b!1447764 (= lt!635273 (seekEntryOrOpen!0 (select (arr!47437 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98305 (_ BitVec 32)) Bool)

(assert (=> b!1447764 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48701 0))(
  ( (Unit!48702) )
))
(declare-fun lt!635269 () Unit!48701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48701)

(assert (=> b!1447764 (= lt!635269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447765 () Bool)

(declare-fun res!978695 () Bool)

(assert (=> b!1447765 (=> (not res!978695) (not e!815502))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447765 (= res!978695 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447766 () Bool)

(declare-fun res!978692 () Bool)

(assert (=> b!1447766 (=> (not res!978692) (not e!815494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447766 (= res!978692 (validKeyInArray!0 (select (arr!47437 a!2862) j!93)))))

(declare-fun b!1447767 () Bool)

(assert (=> b!1447767 (= e!815501 e!815493)))

(declare-fun res!978704 () Bool)

(assert (=> b!1447767 (=> (not res!978704) (not e!815493))))

(assert (=> b!1447767 (= res!978704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47437 a!2862) j!93) mask!2687) (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!635275))))

(assert (=> b!1447767 (= lt!635275 (Intermediate!11586 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447768 () Bool)

(declare-fun res!978699 () Bool)

(assert (=> b!1447768 (=> (not res!978699) (not e!815494))))

(assert (=> b!1447768 (= res!978699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447769 () Bool)

(declare-fun res!978691 () Bool)

(assert (=> b!1447769 (=> (not res!978691) (not e!815494))))

(assert (=> b!1447769 (= res!978691 (and (= (size!47988 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47988 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47988 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!978693 () Bool)

(assert (=> start!124962 (=> (not res!978693) (not e!815494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124962 (= res!978693 (validMask!0 mask!2687))))

(assert (=> start!124962 e!815494))

(assert (=> start!124962 true))

(declare-fun array_inv!36718 (array!98305) Bool)

(assert (=> start!124962 (array_inv!36718 a!2862)))

(declare-fun b!1447770 () Bool)

(assert (=> b!1447770 (= e!815499 e!815495)))

(declare-fun res!978702 () Bool)

(assert (=> b!1447770 (=> res!978702 e!815495)))

(assert (=> b!1447770 (= res!978702 (or (and (= (select (arr!47437 a!2862) index!646) (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47437 a!2862) index!646) (select (arr!47437 a!2862) j!93))) (not (= (select (arr!47437 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447771 () Bool)

(assert (=> b!1447771 (= e!815497 (= lt!635272 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635271 lt!635270 mask!2687)))))

(declare-fun b!1447772 () Bool)

(declare-fun res!978700 () Bool)

(assert (=> b!1447772 (=> (not res!978700) (not e!815494))))

(assert (=> b!1447772 (= res!978700 (validKeyInArray!0 (select (arr!47437 a!2862) i!1006)))))

(declare-fun b!1447773 () Bool)

(declare-fun res!978705 () Bool)

(assert (=> b!1447773 (=> (not res!978705) (not e!815494))))

(declare-datatypes ((List!33925 0))(
  ( (Nil!33922) (Cons!33921 (h!35282 (_ BitVec 64)) (t!48611 List!33925)) )
))
(declare-fun arrayNoDuplicates!0 (array!98305 (_ BitVec 32) List!33925) Bool)

(assert (=> b!1447773 (= res!978705 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33922))))

(declare-fun b!1447774 () Bool)

(declare-fun res!978694 () Bool)

(assert (=> b!1447774 (=> (not res!978694) (not e!815502))))

(assert (=> b!1447774 (= res!978694 e!815497)))

(declare-fun c!134053 () Bool)

(assert (=> b!1447774 (= c!134053 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447775 () Bool)

(declare-fun res!978703 () Bool)

(assert (=> b!1447775 (=> (not res!978703) (not e!815494))))

(assert (=> b!1447775 (= res!978703 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47988 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47988 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47988 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447776 () Bool)

(assert (=> b!1447776 (= e!815496 true)))

(declare-fun lt!635274 () SeekEntryResult!11586)

(assert (=> b!1447776 (= lt!635274 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47437 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447777 () Bool)

(assert (=> b!1447777 (= e!815500 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124962 res!978693) b!1447769))

(assert (= (and b!1447769 res!978691) b!1447772))

(assert (= (and b!1447772 res!978700) b!1447766))

(assert (= (and b!1447766 res!978692) b!1447768))

(assert (= (and b!1447768 res!978699) b!1447773))

(assert (= (and b!1447773 res!978705) b!1447775))

(assert (= (and b!1447775 res!978703) b!1447761))

(assert (= (and b!1447761 res!978696) b!1447767))

(assert (= (and b!1447767 res!978704) b!1447760))

(assert (= (and b!1447760 res!978697) b!1447759))

(assert (= (and b!1447759 res!978698) b!1447774))

(assert (= (and b!1447774 c!134053) b!1447771))

(assert (= (and b!1447774 (not c!134053)) b!1447762))

(assert (= (and b!1447774 res!978694) b!1447765))

(assert (= (and b!1447765 res!978695) b!1447764))

(assert (= (and b!1447764 res!978706) b!1447770))

(assert (= (and b!1447770 (not res!978702)) b!1447763))

(assert (= (and b!1447763 res!978701) b!1447777))

(assert (= (and b!1447764 (not res!978707)) b!1447776))

(declare-fun m!1336741 () Bool)

(assert (=> b!1447760 m!1336741))

(assert (=> b!1447760 m!1336741))

(declare-fun m!1336743 () Bool)

(assert (=> b!1447760 m!1336743))

(declare-fun m!1336745 () Bool)

(assert (=> b!1447773 m!1336745))

(assert (=> b!1447767 m!1336741))

(assert (=> b!1447767 m!1336741))

(declare-fun m!1336747 () Bool)

(assert (=> b!1447767 m!1336747))

(assert (=> b!1447767 m!1336747))

(assert (=> b!1447767 m!1336741))

(declare-fun m!1336749 () Bool)

(assert (=> b!1447767 m!1336749))

(declare-fun m!1336751 () Bool)

(assert (=> b!1447768 m!1336751))

(assert (=> b!1447763 m!1336741))

(assert (=> b!1447763 m!1336741))

(declare-fun m!1336753 () Bool)

(assert (=> b!1447763 m!1336753))

(declare-fun m!1336755 () Bool)

(assert (=> b!1447762 m!1336755))

(declare-fun m!1336757 () Bool)

(assert (=> b!1447762 m!1336757))

(declare-fun m!1336759 () Bool)

(assert (=> b!1447770 m!1336759))

(declare-fun m!1336761 () Bool)

(assert (=> b!1447770 m!1336761))

(declare-fun m!1336763 () Bool)

(assert (=> b!1447770 m!1336763))

(assert (=> b!1447770 m!1336741))

(declare-fun m!1336765 () Bool)

(assert (=> b!1447772 m!1336765))

(assert (=> b!1447772 m!1336765))

(declare-fun m!1336767 () Bool)

(assert (=> b!1447772 m!1336767))

(declare-fun m!1336769 () Bool)

(assert (=> start!124962 m!1336769))

(declare-fun m!1336771 () Bool)

(assert (=> start!124962 m!1336771))

(assert (=> b!1447766 m!1336741))

(assert (=> b!1447766 m!1336741))

(declare-fun m!1336773 () Bool)

(assert (=> b!1447766 m!1336773))

(assert (=> b!1447776 m!1336741))

(assert (=> b!1447776 m!1336741))

(declare-fun m!1336775 () Bool)

(assert (=> b!1447776 m!1336775))

(declare-fun m!1336777 () Bool)

(assert (=> b!1447771 m!1336777))

(assert (=> b!1447761 m!1336761))

(declare-fun m!1336779 () Bool)

(assert (=> b!1447761 m!1336779))

(declare-fun m!1336781 () Bool)

(assert (=> b!1447764 m!1336781))

(assert (=> b!1447764 m!1336761))

(declare-fun m!1336783 () Bool)

(assert (=> b!1447764 m!1336783))

(assert (=> b!1447764 m!1336763))

(assert (=> b!1447764 m!1336759))

(assert (=> b!1447764 m!1336741))

(declare-fun m!1336785 () Bool)

(assert (=> b!1447764 m!1336785))

(declare-fun m!1336787 () Bool)

(assert (=> b!1447764 m!1336787))

(assert (=> b!1447764 m!1336741))

(declare-fun m!1336789 () Bool)

(assert (=> b!1447759 m!1336789))

(assert (=> b!1447759 m!1336789))

(declare-fun m!1336791 () Bool)

(assert (=> b!1447759 m!1336791))

(assert (=> b!1447759 m!1336761))

(declare-fun m!1336793 () Bool)

(assert (=> b!1447759 m!1336793))

(check-sat (not b!1447773) (not b!1447772) (not b!1447764) (not b!1447767) (not b!1447760) (not b!1447768) (not b!1447776) (not b!1447763) (not b!1447759) (not b!1447771) (not b!1447762) (not start!124962) (not b!1447766))
(check-sat)
