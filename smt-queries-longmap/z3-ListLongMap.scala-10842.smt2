; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127176 () Bool)

(assert start!127176)

(declare-fun b!1492766 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!836523 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99787 0))(
  ( (array!99788 (arr!48160 (Array (_ BitVec 32) (_ BitVec 64))) (size!48711 (_ BitVec 32))) )
))
(declare-fun lt!650786 () array!99787)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!650789 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12297 0))(
  ( (MissingZero!12297 (index!51580 (_ BitVec 32))) (Found!12297 (index!51581 (_ BitVec 32))) (Intermediate!12297 (undefined!13109 Bool) (index!51582 (_ BitVec 32)) (x!133354 (_ BitVec 32))) (Undefined!12297) (MissingVacant!12297 (index!51583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99787 (_ BitVec 32)) SeekEntryResult!12297)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99787 (_ BitVec 32)) SeekEntryResult!12297)

(assert (=> b!1492766 (= e!836523 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650789 lt!650786 mask!2687) (seekEntryOrOpen!0 lt!650789 lt!650786 mask!2687)))))

(declare-fun b!1492767 () Bool)

(declare-fun res!1014878 () Bool)

(declare-fun e!836520 () Bool)

(assert (=> b!1492767 (=> (not res!1014878) (not e!836520))))

(declare-fun a!2862 () array!99787)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!650787 () SeekEntryResult!12297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99787 (_ BitVec 32)) SeekEntryResult!12297)

(assert (=> b!1492767 (= res!1014878 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!650787))))

(declare-fun b!1492768 () Bool)

(declare-fun e!836521 () Bool)

(declare-fun e!836526 () Bool)

(assert (=> b!1492768 (= e!836521 e!836526)))

(declare-fun res!1014891 () Bool)

(assert (=> b!1492768 (=> (not res!1014891) (not e!836526))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492768 (= res!1014891 (= (select (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492768 (= lt!650786 (array!99788 (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48711 a!2862)))))

(declare-fun b!1492769 () Bool)

(declare-fun e!836522 () Bool)

(declare-fun e!836524 () Bool)

(assert (=> b!1492769 (= e!836522 (not e!836524))))

(declare-fun res!1014887 () Bool)

(assert (=> b!1492769 (=> res!1014887 e!836524)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492769 (= res!1014887 (or (and (= (select (arr!48160 a!2862) index!646) (select (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48160 a!2862) index!646) (select (arr!48160 a!2862) j!93))) (= (select (arr!48160 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836519 () Bool)

(assert (=> b!1492769 e!836519))

(declare-fun res!1014892 () Bool)

(assert (=> b!1492769 (=> (not res!1014892) (not e!836519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99787 (_ BitVec 32)) Bool)

(assert (=> b!1492769 (= res!1014892 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49967 0))(
  ( (Unit!49968) )
))
(declare-fun lt!650790 () Unit!49967)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49967)

(assert (=> b!1492769 (= lt!650790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492770 () Bool)

(assert (=> b!1492770 (= e!836520 e!836522)))

(declare-fun res!1014881 () Bool)

(assert (=> b!1492770 (=> (not res!1014881) (not e!836522))))

(declare-fun lt!650791 () SeekEntryResult!12297)

(assert (=> b!1492770 (= res!1014881 (= lt!650791 (Intermediate!12297 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492770 (= lt!650791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650789 mask!2687) lt!650789 lt!650786 mask!2687))))

(assert (=> b!1492770 (= lt!650789 (select (store (arr!48160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492771 () Bool)

(declare-fun res!1014888 () Bool)

(assert (=> b!1492771 (=> (not res!1014888) (not e!836521))))

(assert (=> b!1492771 (= res!1014888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1014886 () Bool)

(assert (=> start!127176 (=> (not res!1014886) (not e!836521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127176 (= res!1014886 (validMask!0 mask!2687))))

(assert (=> start!127176 e!836521))

(assert (=> start!127176 true))

(declare-fun array_inv!37441 (array!99787) Bool)

(assert (=> start!127176 (array_inv!37441 a!2862)))

(declare-fun b!1492772 () Bool)

(assert (=> b!1492772 (= e!836523 (= lt!650791 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650789 lt!650786 mask!2687)))))

(declare-fun b!1492773 () Bool)

(declare-fun res!1014882 () Bool)

(assert (=> b!1492773 (=> (not res!1014882) (not e!836521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492773 (= res!1014882 (validKeyInArray!0 (select (arr!48160 a!2862) j!93)))))

(declare-fun b!1492774 () Bool)

(declare-fun res!1014884 () Bool)

(assert (=> b!1492774 (=> (not res!1014884) (not e!836521))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492774 (= res!1014884 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48711 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48711 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48711 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492775 () Bool)

(declare-fun res!1014893 () Bool)

(assert (=> b!1492775 (=> (not res!1014893) (not e!836521))))

(assert (=> b!1492775 (= res!1014893 (and (= (size!48711 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48711 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48711 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492776 () Bool)

(declare-fun res!1014879 () Bool)

(assert (=> b!1492776 (=> (not res!1014879) (not e!836522))))

(assert (=> b!1492776 (= res!1014879 e!836523)))

(declare-fun c!138481 () Bool)

(assert (=> b!1492776 (= c!138481 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492777 () Bool)

(assert (=> b!1492777 (= e!836524 true)))

(declare-fun lt!650788 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492777 (= lt!650788 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1492778 () Bool)

(assert (=> b!1492778 (= e!836526 e!836520)))

(declare-fun res!1014883 () Bool)

(assert (=> b!1492778 (=> (not res!1014883) (not e!836520))))

(assert (=> b!1492778 (= res!1014883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48160 a!2862) j!93) mask!2687) (select (arr!48160 a!2862) j!93) a!2862 mask!2687) lt!650787))))

(assert (=> b!1492778 (= lt!650787 (Intermediate!12297 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492779 () Bool)

(declare-fun res!1014885 () Bool)

(assert (=> b!1492779 (=> (not res!1014885) (not e!836519))))

(assert (=> b!1492779 (= res!1014885 (= (seekEntryOrOpen!0 (select (arr!48160 a!2862) j!93) a!2862 mask!2687) (Found!12297 j!93)))))

(declare-fun b!1492780 () Bool)

(declare-fun res!1014890 () Bool)

(assert (=> b!1492780 (=> (not res!1014890) (not e!836522))))

(assert (=> b!1492780 (= res!1014890 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492781 () Bool)

(assert (=> b!1492781 (= e!836519 (or (= (select (arr!48160 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48160 a!2862) intermediateBeforeIndex!19) (select (arr!48160 a!2862) j!93))))))

(declare-fun b!1492782 () Bool)

(declare-fun res!1014880 () Bool)

(assert (=> b!1492782 (=> (not res!1014880) (not e!836521))))

(declare-datatypes ((List!34648 0))(
  ( (Nil!34645) (Cons!34644 (h!36041 (_ BitVec 64)) (t!49334 List!34648)) )
))
(declare-fun arrayNoDuplicates!0 (array!99787 (_ BitVec 32) List!34648) Bool)

(assert (=> b!1492782 (= res!1014880 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34645))))

(declare-fun b!1492783 () Bool)

(declare-fun res!1014889 () Bool)

(assert (=> b!1492783 (=> (not res!1014889) (not e!836521))))

(assert (=> b!1492783 (= res!1014889 (validKeyInArray!0 (select (arr!48160 a!2862) i!1006)))))

(assert (= (and start!127176 res!1014886) b!1492775))

(assert (= (and b!1492775 res!1014893) b!1492783))

(assert (= (and b!1492783 res!1014889) b!1492773))

(assert (= (and b!1492773 res!1014882) b!1492771))

(assert (= (and b!1492771 res!1014888) b!1492782))

(assert (= (and b!1492782 res!1014880) b!1492774))

(assert (= (and b!1492774 res!1014884) b!1492768))

(assert (= (and b!1492768 res!1014891) b!1492778))

(assert (= (and b!1492778 res!1014883) b!1492767))

(assert (= (and b!1492767 res!1014878) b!1492770))

(assert (= (and b!1492770 res!1014881) b!1492776))

(assert (= (and b!1492776 c!138481) b!1492772))

(assert (= (and b!1492776 (not c!138481)) b!1492766))

(assert (= (and b!1492776 res!1014879) b!1492780))

(assert (= (and b!1492780 res!1014890) b!1492769))

(assert (= (and b!1492769 res!1014892) b!1492779))

(assert (= (and b!1492779 res!1014885) b!1492781))

(assert (= (and b!1492769 (not res!1014887)) b!1492777))

(declare-fun m!1376899 () Bool)

(assert (=> b!1492773 m!1376899))

(assert (=> b!1492773 m!1376899))

(declare-fun m!1376901 () Bool)

(assert (=> b!1492773 m!1376901))

(declare-fun m!1376903 () Bool)

(assert (=> b!1492783 m!1376903))

(assert (=> b!1492783 m!1376903))

(declare-fun m!1376905 () Bool)

(assert (=> b!1492783 m!1376905))

(declare-fun m!1376907 () Bool)

(assert (=> b!1492771 m!1376907))

(declare-fun m!1376909 () Bool)

(assert (=> b!1492769 m!1376909))

(declare-fun m!1376911 () Bool)

(assert (=> b!1492769 m!1376911))

(declare-fun m!1376913 () Bool)

(assert (=> b!1492769 m!1376913))

(declare-fun m!1376915 () Bool)

(assert (=> b!1492769 m!1376915))

(declare-fun m!1376917 () Bool)

(assert (=> b!1492769 m!1376917))

(assert (=> b!1492769 m!1376899))

(declare-fun m!1376919 () Bool)

(assert (=> b!1492781 m!1376919))

(assert (=> b!1492781 m!1376899))

(assert (=> b!1492779 m!1376899))

(assert (=> b!1492779 m!1376899))

(declare-fun m!1376921 () Bool)

(assert (=> b!1492779 m!1376921))

(declare-fun m!1376923 () Bool)

(assert (=> b!1492777 m!1376923))

(declare-fun m!1376925 () Bool)

(assert (=> b!1492766 m!1376925))

(declare-fun m!1376927 () Bool)

(assert (=> b!1492766 m!1376927))

(declare-fun m!1376929 () Bool)

(assert (=> b!1492770 m!1376929))

(assert (=> b!1492770 m!1376929))

(declare-fun m!1376931 () Bool)

(assert (=> b!1492770 m!1376931))

(assert (=> b!1492770 m!1376911))

(declare-fun m!1376933 () Bool)

(assert (=> b!1492770 m!1376933))

(declare-fun m!1376935 () Bool)

(assert (=> start!127176 m!1376935))

(declare-fun m!1376937 () Bool)

(assert (=> start!127176 m!1376937))

(assert (=> b!1492767 m!1376899))

(assert (=> b!1492767 m!1376899))

(declare-fun m!1376939 () Bool)

(assert (=> b!1492767 m!1376939))

(assert (=> b!1492778 m!1376899))

(assert (=> b!1492778 m!1376899))

(declare-fun m!1376941 () Bool)

(assert (=> b!1492778 m!1376941))

(assert (=> b!1492778 m!1376941))

(assert (=> b!1492778 m!1376899))

(declare-fun m!1376943 () Bool)

(assert (=> b!1492778 m!1376943))

(declare-fun m!1376945 () Bool)

(assert (=> b!1492782 m!1376945))

(assert (=> b!1492768 m!1376911))

(declare-fun m!1376947 () Bool)

(assert (=> b!1492768 m!1376947))

(declare-fun m!1376949 () Bool)

(assert (=> b!1492772 m!1376949))

(check-sat (not b!1492770) (not b!1492769) (not b!1492773) (not b!1492782) (not start!127176) (not b!1492767) (not b!1492779) (not b!1492778) (not b!1492772) (not b!1492777) (not b!1492766) (not b!1492783) (not b!1492771))
(check-sat)
