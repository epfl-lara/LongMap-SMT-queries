; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125768 () Bool)

(assert start!125768)

(declare-fun b!1471754 () Bool)

(declare-fun res!999507 () Bool)

(declare-fun e!826071 () Bool)

(assert (=> b!1471754 (=> (not res!999507) (not e!826071))))

(declare-datatypes ((array!99102 0))(
  ( (array!99103 (arr!47836 (Array (_ BitVec 32) (_ BitVec 64))) (size!48386 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99102)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471754 (= res!999507 (validKeyInArray!0 (select (arr!47836 a!2862) j!93)))))

(declare-fun b!1471755 () Bool)

(declare-fun res!999504 () Bool)

(declare-fun e!826068 () Bool)

(assert (=> b!1471755 (=> (not res!999504) (not e!826068))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471755 (= res!999504 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471756 () Bool)

(declare-fun e!826070 () Bool)

(declare-fun e!826073 () Bool)

(assert (=> b!1471756 (= e!826070 e!826073)))

(declare-fun res!999498 () Bool)

(assert (=> b!1471756 (=> (not res!999498) (not e!826073))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12076 0))(
  ( (MissingZero!12076 (index!50696 (_ BitVec 32))) (Found!12076 (index!50697 (_ BitVec 32))) (Intermediate!12076 (undefined!12888 Bool) (index!50698 (_ BitVec 32)) (x!132279 (_ BitVec 32))) (Undefined!12076) (MissingVacant!12076 (index!50699 (_ BitVec 32))) )
))
(declare-fun lt!643373 () SeekEntryResult!12076)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99102 (_ BitVec 32)) SeekEntryResult!12076)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471756 (= res!999498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47836 a!2862) j!93) mask!2687) (select (arr!47836 a!2862) j!93) a!2862 mask!2687) lt!643373))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1471756 (= lt!643373 (Intermediate!12076 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471758 () Bool)

(declare-fun e!826067 () Bool)

(assert (=> b!1471758 (= e!826067 (or (= (select (arr!47836 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47836 a!2862) intermediateBeforeIndex!19) (select (arr!47836 a!2862) j!93))))))

(declare-fun b!1471759 () Bool)

(assert (=> b!1471759 (= e!826071 e!826070)))

(declare-fun res!999502 () Bool)

(assert (=> b!1471759 (=> (not res!999502) (not e!826070))))

(assert (=> b!1471759 (= res!999502 (= (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643374 () array!99102)

(assert (=> b!1471759 (= lt!643374 (array!99103 (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48386 a!2862)))))

(declare-fun b!1471760 () Bool)

(declare-fun res!999500 () Bool)

(assert (=> b!1471760 (=> (not res!999500) (not e!826073))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1471760 (= res!999500 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47836 a!2862) j!93) a!2862 mask!2687) lt!643373))))

(declare-fun b!1471761 () Bool)

(declare-fun res!999506 () Bool)

(assert (=> b!1471761 (=> (not res!999506) (not e!826071))))

(assert (=> b!1471761 (= res!999506 (validKeyInArray!0 (select (arr!47836 a!2862) i!1006)))))

(declare-fun lt!643372 () (_ BitVec 64))

(declare-fun e!826072 () Bool)

(declare-fun b!1471762 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99102 (_ BitVec 32)) SeekEntryResult!12076)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99102 (_ BitVec 32)) SeekEntryResult!12076)

(assert (=> b!1471762 (= e!826072 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643372 lt!643374 mask!2687) (seekEntryOrOpen!0 lt!643372 lt!643374 mask!2687)))))

(declare-fun b!1471763 () Bool)

(declare-fun res!999510 () Bool)

(assert (=> b!1471763 (=> (not res!999510) (not e!826067))))

(assert (=> b!1471763 (= res!999510 (= (seekEntryOrOpen!0 (select (arr!47836 a!2862) j!93) a!2862 mask!2687) (Found!12076 j!93)))))

(declare-fun b!1471764 () Bool)

(declare-fun res!999497 () Bool)

(assert (=> b!1471764 (=> (not res!999497) (not e!826068))))

(assert (=> b!1471764 (= res!999497 e!826072)))

(declare-fun c!135642 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471764 (= c!135642 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471765 () Bool)

(declare-fun res!999499 () Bool)

(assert (=> b!1471765 (=> (not res!999499) (not e!826071))))

(assert (=> b!1471765 (= res!999499 (and (= (size!48386 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48386 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48386 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471766 () Bool)

(declare-fun res!999509 () Bool)

(assert (=> b!1471766 (=> (not res!999509) (not e!826071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99102 (_ BitVec 32)) Bool)

(assert (=> b!1471766 (= res!999509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471767 () Bool)

(declare-fun res!999505 () Bool)

(assert (=> b!1471767 (=> (not res!999505) (not e!826071))))

(declare-datatypes ((List!34337 0))(
  ( (Nil!34334) (Cons!34333 (h!35689 (_ BitVec 64)) (t!49031 List!34337)) )
))
(declare-fun arrayNoDuplicates!0 (array!99102 (_ BitVec 32) List!34337) Bool)

(assert (=> b!1471767 (= res!999505 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34334))))

(declare-fun b!1471768 () Bool)

(assert (=> b!1471768 (= e!826068 (not true))))

(assert (=> b!1471768 e!826067))

(declare-fun res!999503 () Bool)

(assert (=> b!1471768 (=> (not res!999503) (not e!826067))))

(assert (=> b!1471768 (= res!999503 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49492 0))(
  ( (Unit!49493) )
))
(declare-fun lt!643371 () Unit!49492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49492)

(assert (=> b!1471768 (= lt!643371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!643370 () SeekEntryResult!12076)

(declare-fun b!1471757 () Bool)

(assert (=> b!1471757 (= e!826072 (= lt!643370 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643372 lt!643374 mask!2687)))))

(declare-fun res!999508 () Bool)

(assert (=> start!125768 (=> (not res!999508) (not e!826071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125768 (= res!999508 (validMask!0 mask!2687))))

(assert (=> start!125768 e!826071))

(assert (=> start!125768 true))

(declare-fun array_inv!36864 (array!99102) Bool)

(assert (=> start!125768 (array_inv!36864 a!2862)))

(declare-fun b!1471769 () Bool)

(assert (=> b!1471769 (= e!826073 e!826068)))

(declare-fun res!999501 () Bool)

(assert (=> b!1471769 (=> (not res!999501) (not e!826068))))

(assert (=> b!1471769 (= res!999501 (= lt!643370 (Intermediate!12076 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471769 (= lt!643370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643372 mask!2687) lt!643372 lt!643374 mask!2687))))

(assert (=> b!1471769 (= lt!643372 (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471770 () Bool)

(declare-fun res!999511 () Bool)

(assert (=> b!1471770 (=> (not res!999511) (not e!826071))))

(assert (=> b!1471770 (= res!999511 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48386 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48386 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48386 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125768 res!999508) b!1471765))

(assert (= (and b!1471765 res!999499) b!1471761))

(assert (= (and b!1471761 res!999506) b!1471754))

(assert (= (and b!1471754 res!999507) b!1471766))

(assert (= (and b!1471766 res!999509) b!1471767))

(assert (= (and b!1471767 res!999505) b!1471770))

(assert (= (and b!1471770 res!999511) b!1471759))

(assert (= (and b!1471759 res!999502) b!1471756))

(assert (= (and b!1471756 res!999498) b!1471760))

(assert (= (and b!1471760 res!999500) b!1471769))

(assert (= (and b!1471769 res!999501) b!1471764))

(assert (= (and b!1471764 c!135642) b!1471757))

(assert (= (and b!1471764 (not c!135642)) b!1471762))

(assert (= (and b!1471764 res!999497) b!1471755))

(assert (= (and b!1471755 res!999504) b!1471768))

(assert (= (and b!1471768 res!999503) b!1471763))

(assert (= (and b!1471763 res!999510) b!1471758))

(declare-fun m!1358535 () Bool)

(assert (=> b!1471756 m!1358535))

(assert (=> b!1471756 m!1358535))

(declare-fun m!1358537 () Bool)

(assert (=> b!1471756 m!1358537))

(assert (=> b!1471756 m!1358537))

(assert (=> b!1471756 m!1358535))

(declare-fun m!1358539 () Bool)

(assert (=> b!1471756 m!1358539))

(assert (=> b!1471754 m!1358535))

(assert (=> b!1471754 m!1358535))

(declare-fun m!1358541 () Bool)

(assert (=> b!1471754 m!1358541))

(assert (=> b!1471763 m!1358535))

(assert (=> b!1471763 m!1358535))

(declare-fun m!1358543 () Bool)

(assert (=> b!1471763 m!1358543))

(declare-fun m!1358545 () Bool)

(assert (=> b!1471769 m!1358545))

(assert (=> b!1471769 m!1358545))

(declare-fun m!1358547 () Bool)

(assert (=> b!1471769 m!1358547))

(declare-fun m!1358549 () Bool)

(assert (=> b!1471769 m!1358549))

(declare-fun m!1358551 () Bool)

(assert (=> b!1471769 m!1358551))

(declare-fun m!1358553 () Bool)

(assert (=> b!1471768 m!1358553))

(declare-fun m!1358555 () Bool)

(assert (=> b!1471768 m!1358555))

(assert (=> b!1471760 m!1358535))

(assert (=> b!1471760 m!1358535))

(declare-fun m!1358557 () Bool)

(assert (=> b!1471760 m!1358557))

(assert (=> b!1471759 m!1358549))

(declare-fun m!1358559 () Bool)

(assert (=> b!1471759 m!1358559))

(declare-fun m!1358561 () Bool)

(assert (=> b!1471762 m!1358561))

(declare-fun m!1358563 () Bool)

(assert (=> b!1471762 m!1358563))

(declare-fun m!1358565 () Bool)

(assert (=> b!1471757 m!1358565))

(declare-fun m!1358567 () Bool)

(assert (=> start!125768 m!1358567))

(declare-fun m!1358569 () Bool)

(assert (=> start!125768 m!1358569))

(declare-fun m!1358571 () Bool)

(assert (=> b!1471758 m!1358571))

(assert (=> b!1471758 m!1358535))

(declare-fun m!1358573 () Bool)

(assert (=> b!1471766 m!1358573))

(declare-fun m!1358575 () Bool)

(assert (=> b!1471767 m!1358575))

(declare-fun m!1358577 () Bool)

(assert (=> b!1471761 m!1358577))

(assert (=> b!1471761 m!1358577))

(declare-fun m!1358579 () Bool)

(assert (=> b!1471761 m!1358579))

(push 1)

