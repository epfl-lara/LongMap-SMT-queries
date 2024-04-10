; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124828 () Bool)

(assert start!124828)

(declare-fun b!1448826 () Bool)

(declare-fun res!980336 () Bool)

(declare-fun e!815921 () Bool)

(assert (=> b!1448826 (=> (not res!980336) (not e!815921))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98276 0))(
  ( (array!98277 (arr!47426 (Array (_ BitVec 32) (_ BitVec 64))) (size!47976 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98276)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448826 (= res!980336 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47976 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47976 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47976 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448827 () Bool)

(declare-fun e!815920 () Bool)

(declare-fun e!815918 () Bool)

(assert (=> b!1448827 (= e!815920 (not e!815918))))

(declare-fun res!980335 () Bool)

(assert (=> b!1448827 (=> res!980335 e!815918)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448827 (= res!980335 (or (and (= (select (arr!47426 a!2862) index!646) (select (store (arr!47426 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47426 a!2862) index!646) (select (arr!47426 a!2862) j!93))) (not (= (select (arr!47426 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47426 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815924 () Bool)

(assert (=> b!1448827 e!815924))

(declare-fun res!980340 () Bool)

(assert (=> b!1448827 (=> (not res!980340) (not e!815924))))

(declare-datatypes ((SeekEntryResult!11678 0))(
  ( (MissingZero!11678 (index!49104 (_ BitVec 32))) (Found!11678 (index!49105 (_ BitVec 32))) (Intermediate!11678 (undefined!12490 Bool) (index!49106 (_ BitVec 32)) (x!130775 (_ BitVec 32))) (Undefined!11678) (MissingVacant!11678 (index!49107 (_ BitVec 32))) )
))
(declare-fun lt!635679 () SeekEntryResult!11678)

(assert (=> b!1448827 (= res!980340 (and (= lt!635679 (Found!11678 j!93)) (or (= (select (arr!47426 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47426 a!2862) intermediateBeforeIndex!19) (select (arr!47426 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98276 (_ BitVec 32)) SeekEntryResult!11678)

(assert (=> b!1448827 (= lt!635679 (seekEntryOrOpen!0 (select (arr!47426 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98276 (_ BitVec 32)) Bool)

(assert (=> b!1448827 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48852 0))(
  ( (Unit!48853) )
))
(declare-fun lt!635675 () Unit!48852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48852)

(assert (=> b!1448827 (= lt!635675 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448828 () Bool)

(assert (=> b!1448828 (= e!815918 true)))

(declare-fun lt!635673 () SeekEntryResult!11678)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98276 (_ BitVec 32)) SeekEntryResult!11678)

(assert (=> b!1448828 (= lt!635673 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47426 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448829 () Bool)

(declare-fun res!980338 () Bool)

(assert (=> b!1448829 (=> (not res!980338) (not e!815921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448829 (= res!980338 (validKeyInArray!0 (select (arr!47426 a!2862) i!1006)))))

(declare-fun lt!635678 () (_ BitVec 64))

(declare-fun lt!635676 () array!98276)

(declare-fun e!815916 () Bool)

(declare-fun b!1448830 () Bool)

(declare-fun lt!635674 () SeekEntryResult!11678)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98276 (_ BitVec 32)) SeekEntryResult!11678)

(assert (=> b!1448830 (= e!815916 (= lt!635674 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635678 lt!635676 mask!2687)))))

(declare-fun b!1448831 () Bool)

(declare-fun res!980346 () Bool)

(assert (=> b!1448831 (=> (not res!980346) (not e!815920))))

(assert (=> b!1448831 (= res!980346 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448832 () Bool)

(declare-fun e!815919 () Bool)

(declare-fun e!815923 () Bool)

(assert (=> b!1448832 (= e!815919 e!815923)))

(declare-fun res!980341 () Bool)

(assert (=> b!1448832 (=> (not res!980341) (not e!815923))))

(declare-fun lt!635677 () SeekEntryResult!11678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448832 (= res!980341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47426 a!2862) j!93) mask!2687) (select (arr!47426 a!2862) j!93) a!2862 mask!2687) lt!635677))))

(assert (=> b!1448832 (= lt!635677 (Intermediate!11678 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448833 () Bool)

(declare-fun e!815915 () Bool)

(assert (=> b!1448833 (= e!815924 e!815915)))

(declare-fun res!980339 () Bool)

(assert (=> b!1448833 (=> res!980339 e!815915)))

(assert (=> b!1448833 (= res!980339 (or (and (= (select (arr!47426 a!2862) index!646) (select (store (arr!47426 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47426 a!2862) index!646) (select (arr!47426 a!2862) j!93))) (not (= (select (arr!47426 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448834 () Bool)

(declare-fun res!980343 () Bool)

(assert (=> b!1448834 (=> (not res!980343) (not e!815923))))

(assert (=> b!1448834 (= res!980343 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47426 a!2862) j!93) a!2862 mask!2687) lt!635677))))

(declare-fun b!1448835 () Bool)

(assert (=> b!1448835 (= e!815921 e!815919)))

(declare-fun res!980332 () Bool)

(assert (=> b!1448835 (=> (not res!980332) (not e!815919))))

(assert (=> b!1448835 (= res!980332 (= (select (store (arr!47426 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448835 (= lt!635676 (array!98277 (store (arr!47426 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47976 a!2862)))))

(declare-fun b!1448836 () Bool)

(declare-fun res!980334 () Bool)

(assert (=> b!1448836 (=> (not res!980334) (not e!815921))))

(assert (=> b!1448836 (= res!980334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448837 () Bool)

(assert (=> b!1448837 (= e!815916 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635678 lt!635676 mask!2687) (seekEntryOrOpen!0 lt!635678 lt!635676 mask!2687)))))

(declare-fun b!1448838 () Bool)

(declare-fun res!980344 () Bool)

(assert (=> b!1448838 (=> (not res!980344) (not e!815921))))

(assert (=> b!1448838 (= res!980344 (validKeyInArray!0 (select (arr!47426 a!2862) j!93)))))

(declare-fun b!1448839 () Bool)

(declare-fun e!815922 () Bool)

(assert (=> b!1448839 (= e!815915 e!815922)))

(declare-fun res!980337 () Bool)

(assert (=> b!1448839 (=> (not res!980337) (not e!815922))))

(assert (=> b!1448839 (= res!980337 (= lt!635679 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47426 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448840 () Bool)

(assert (=> b!1448840 (= e!815923 e!815920)))

(declare-fun res!980331 () Bool)

(assert (=> b!1448840 (=> (not res!980331) (not e!815920))))

(assert (=> b!1448840 (= res!980331 (= lt!635674 (Intermediate!11678 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448840 (= lt!635674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635678 mask!2687) lt!635678 lt!635676 mask!2687))))

(assert (=> b!1448840 (= lt!635678 (select (store (arr!47426 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!980345 () Bool)

(assert (=> start!124828 (=> (not res!980345) (not e!815921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124828 (= res!980345 (validMask!0 mask!2687))))

(assert (=> start!124828 e!815921))

(assert (=> start!124828 true))

(declare-fun array_inv!36454 (array!98276) Bool)

(assert (=> start!124828 (array_inv!36454 a!2862)))

(declare-fun b!1448841 () Bool)

(assert (=> b!1448841 (= e!815922 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448842 () Bool)

(declare-fun res!980342 () Bool)

(assert (=> b!1448842 (=> (not res!980342) (not e!815921))))

(declare-datatypes ((List!33927 0))(
  ( (Nil!33924) (Cons!33923 (h!35273 (_ BitVec 64)) (t!48621 List!33927)) )
))
(declare-fun arrayNoDuplicates!0 (array!98276 (_ BitVec 32) List!33927) Bool)

(assert (=> b!1448842 (= res!980342 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33924))))

(declare-fun b!1448843 () Bool)

(declare-fun res!980347 () Bool)

(assert (=> b!1448843 (=> (not res!980347) (not e!815921))))

(assert (=> b!1448843 (= res!980347 (and (= (size!47976 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47976 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47976 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448844 () Bool)

(declare-fun res!980333 () Bool)

(assert (=> b!1448844 (=> (not res!980333) (not e!815920))))

(assert (=> b!1448844 (= res!980333 e!815916)))

(declare-fun c!133758 () Bool)

(assert (=> b!1448844 (= c!133758 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124828 res!980345) b!1448843))

(assert (= (and b!1448843 res!980347) b!1448829))

(assert (= (and b!1448829 res!980338) b!1448838))

(assert (= (and b!1448838 res!980344) b!1448836))

(assert (= (and b!1448836 res!980334) b!1448842))

(assert (= (and b!1448842 res!980342) b!1448826))

(assert (= (and b!1448826 res!980336) b!1448835))

(assert (= (and b!1448835 res!980332) b!1448832))

(assert (= (and b!1448832 res!980341) b!1448834))

(assert (= (and b!1448834 res!980343) b!1448840))

(assert (= (and b!1448840 res!980331) b!1448844))

(assert (= (and b!1448844 c!133758) b!1448830))

(assert (= (and b!1448844 (not c!133758)) b!1448837))

(assert (= (and b!1448844 res!980333) b!1448831))

(assert (= (and b!1448831 res!980346) b!1448827))

(assert (= (and b!1448827 res!980340) b!1448833))

(assert (= (and b!1448833 (not res!980339)) b!1448839))

(assert (= (and b!1448839 res!980337) b!1448841))

(assert (= (and b!1448827 (not res!980335)) b!1448828))

(declare-fun m!1337569 () Bool)

(assert (=> b!1448836 m!1337569))

(declare-fun m!1337571 () Bool)

(assert (=> b!1448842 m!1337571))

(declare-fun m!1337573 () Bool)

(assert (=> b!1448835 m!1337573))

(declare-fun m!1337575 () Bool)

(assert (=> b!1448835 m!1337575))

(declare-fun m!1337577 () Bool)

(assert (=> b!1448832 m!1337577))

(assert (=> b!1448832 m!1337577))

(declare-fun m!1337579 () Bool)

(assert (=> b!1448832 m!1337579))

(assert (=> b!1448832 m!1337579))

(assert (=> b!1448832 m!1337577))

(declare-fun m!1337581 () Bool)

(assert (=> b!1448832 m!1337581))

(declare-fun m!1337583 () Bool)

(assert (=> b!1448833 m!1337583))

(assert (=> b!1448833 m!1337573))

(declare-fun m!1337585 () Bool)

(assert (=> b!1448833 m!1337585))

(assert (=> b!1448833 m!1337577))

(declare-fun m!1337587 () Bool)

(assert (=> b!1448840 m!1337587))

(assert (=> b!1448840 m!1337587))

(declare-fun m!1337589 () Bool)

(assert (=> b!1448840 m!1337589))

(assert (=> b!1448840 m!1337573))

(declare-fun m!1337591 () Bool)

(assert (=> b!1448840 m!1337591))

(assert (=> b!1448828 m!1337577))

(assert (=> b!1448828 m!1337577))

(declare-fun m!1337593 () Bool)

(assert (=> b!1448828 m!1337593))

(assert (=> b!1448834 m!1337577))

(assert (=> b!1448834 m!1337577))

(declare-fun m!1337595 () Bool)

(assert (=> b!1448834 m!1337595))

(assert (=> b!1448839 m!1337577))

(assert (=> b!1448839 m!1337577))

(declare-fun m!1337597 () Bool)

(assert (=> b!1448839 m!1337597))

(declare-fun m!1337599 () Bool)

(assert (=> b!1448837 m!1337599))

(declare-fun m!1337601 () Bool)

(assert (=> b!1448837 m!1337601))

(declare-fun m!1337603 () Bool)

(assert (=> b!1448827 m!1337603))

(assert (=> b!1448827 m!1337573))

(declare-fun m!1337605 () Bool)

(assert (=> b!1448827 m!1337605))

(assert (=> b!1448827 m!1337585))

(assert (=> b!1448827 m!1337583))

(assert (=> b!1448827 m!1337577))

(declare-fun m!1337607 () Bool)

(assert (=> b!1448827 m!1337607))

(declare-fun m!1337609 () Bool)

(assert (=> b!1448827 m!1337609))

(assert (=> b!1448827 m!1337577))

(declare-fun m!1337611 () Bool)

(assert (=> b!1448830 m!1337611))

(assert (=> b!1448838 m!1337577))

(assert (=> b!1448838 m!1337577))

(declare-fun m!1337613 () Bool)

(assert (=> b!1448838 m!1337613))

(declare-fun m!1337615 () Bool)

(assert (=> b!1448829 m!1337615))

(assert (=> b!1448829 m!1337615))

(declare-fun m!1337617 () Bool)

(assert (=> b!1448829 m!1337617))

(declare-fun m!1337619 () Bool)

(assert (=> start!124828 m!1337619))

(declare-fun m!1337621 () Bool)

(assert (=> start!124828 m!1337621))

(push 1)

