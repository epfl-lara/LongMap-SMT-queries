; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125224 () Bool)

(assert start!125224)

(declare-fun b!1460865 () Bool)

(declare-fun res!990589 () Bool)

(declare-fun e!821360 () Bool)

(assert (=> b!1460865 (=> (not res!990589) (not e!821360))))

(declare-datatypes ((array!98672 0))(
  ( (array!98673 (arr!47624 (Array (_ BitVec 32) (_ BitVec 64))) (size!48174 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98672)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11876 0))(
  ( (MissingZero!11876 (index!49896 (_ BitVec 32))) (Found!11876 (index!49897 (_ BitVec 32))) (Intermediate!11876 (undefined!12688 Bool) (index!49898 (_ BitVec 32)) (x!131501 (_ BitVec 32))) (Undefined!11876) (MissingVacant!11876 (index!49899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98672 (_ BitVec 32)) SeekEntryResult!11876)

(assert (=> b!1460865 (= res!990589 (= (seekEntryOrOpen!0 (select (arr!47624 a!2862) j!93) a!2862 mask!2687) (Found!11876 j!93)))))

(declare-fun b!1460866 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1460866 (= e!821360 (or (= (select (arr!47624 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47624 a!2862) intermediateBeforeIndex!19) (select (arr!47624 a!2862) j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639951 () (_ BitVec 32))

(declare-fun e!821356 () Bool)

(declare-fun b!1460868 () Bool)

(declare-fun lt!639948 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639952 () array!98672)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98672 (_ BitVec 32)) SeekEntryResult!11876)

(assert (=> b!1460868 (= e!821356 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639951 intermediateAfterIndex!19 lt!639948 lt!639952 mask!2687) (seekEntryOrOpen!0 lt!639948 lt!639952 mask!2687))))))

(declare-fun b!1460869 () Bool)

(declare-fun e!821351 () Bool)

(declare-fun e!821354 () Bool)

(assert (=> b!1460869 (= e!821351 e!821354)))

(declare-fun res!990587 () Bool)

(assert (=> b!1460869 (=> (not res!990587) (not e!821354))))

(declare-fun lt!639953 () SeekEntryResult!11876)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460869 (= res!990587 (= lt!639953 (Intermediate!11876 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98672 (_ BitVec 32)) SeekEntryResult!11876)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460869 (= lt!639953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639948 mask!2687) lt!639948 lt!639952 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460869 (= lt!639948 (select (store (arr!47624 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460870 () Bool)

(declare-fun res!990597 () Bool)

(declare-fun e!821353 () Bool)

(assert (=> b!1460870 (=> (not res!990597) (not e!821353))))

(assert (=> b!1460870 (= res!990597 (and (= (size!48174 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48174 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48174 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460871 () Bool)

(declare-fun res!990585 () Bool)

(assert (=> b!1460871 (=> (not res!990585) (not e!821353))))

(declare-datatypes ((List!34125 0))(
  ( (Nil!34122) (Cons!34121 (h!35471 (_ BitVec 64)) (t!48819 List!34125)) )
))
(declare-fun arrayNoDuplicates!0 (array!98672 (_ BitVec 32) List!34125) Bool)

(assert (=> b!1460871 (= res!990585 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34122))))

(declare-fun b!1460872 () Bool)

(declare-fun res!990601 () Bool)

(assert (=> b!1460872 (=> (not res!990601) (not e!821351))))

(declare-fun lt!639950 () SeekEntryResult!11876)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460872 (= res!990601 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47624 a!2862) j!93) a!2862 mask!2687) lt!639950))))

(declare-fun b!1460873 () Bool)

(declare-fun res!990590 () Bool)

(assert (=> b!1460873 (=> (not res!990590) (not e!821353))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460873 (= res!990590 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48174 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48174 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48174 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460874 () Bool)

(declare-fun e!821358 () Bool)

(assert (=> b!1460874 (= e!821353 e!821358)))

(declare-fun res!990593 () Bool)

(assert (=> b!1460874 (=> (not res!990593) (not e!821358))))

(assert (=> b!1460874 (= res!990593 (= (select (store (arr!47624 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460874 (= lt!639952 (array!98673 (store (arr!47624 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48174 a!2862)))))

(declare-fun b!1460875 () Bool)

(assert (=> b!1460875 (= e!821356 (not (= lt!639953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639951 lt!639948 lt!639952 mask!2687))))))

(declare-fun b!1460867 () Bool)

(declare-fun res!990599 () Bool)

(assert (=> b!1460867 (=> (not res!990599) (not e!821354))))

(assert (=> b!1460867 (= res!990599 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!990600 () Bool)

(assert (=> start!125224 (=> (not res!990600) (not e!821353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125224 (= res!990600 (validMask!0 mask!2687))))

(assert (=> start!125224 e!821353))

(assert (=> start!125224 true))

(declare-fun array_inv!36652 (array!98672) Bool)

(assert (=> start!125224 (array_inv!36652 a!2862)))

(declare-fun b!1460876 () Bool)

(declare-fun res!990595 () Bool)

(assert (=> b!1460876 (=> (not res!990595) (not e!821354))))

(declare-fun e!821355 () Bool)

(assert (=> b!1460876 (= res!990595 e!821355)))

(declare-fun c!134651 () Bool)

(assert (=> b!1460876 (= c!134651 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460877 () Bool)

(declare-fun res!990594 () Bool)

(assert (=> b!1460877 (=> (not res!990594) (not e!821353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460877 (= res!990594 (validKeyInArray!0 (select (arr!47624 a!2862) i!1006)))))

(declare-fun b!1460878 () Bool)

(assert (=> b!1460878 (= e!821358 e!821351)))

(declare-fun res!990584 () Bool)

(assert (=> b!1460878 (=> (not res!990584) (not e!821351))))

(assert (=> b!1460878 (= res!990584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47624 a!2862) j!93) mask!2687) (select (arr!47624 a!2862) j!93) a!2862 mask!2687) lt!639950))))

(assert (=> b!1460878 (= lt!639950 (Intermediate!11876 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460879 () Bool)

(assert (=> b!1460879 (= e!821355 (= lt!639953 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639948 lt!639952 mask!2687)))))

(declare-fun b!1460880 () Bool)

(declare-fun e!821359 () Bool)

(assert (=> b!1460880 (= e!821354 (not e!821359))))

(declare-fun res!990586 () Bool)

(assert (=> b!1460880 (=> res!990586 e!821359)))

(assert (=> b!1460880 (= res!990586 (or (and (= (select (arr!47624 a!2862) index!646) (select (store (arr!47624 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47624 a!2862) index!646) (select (arr!47624 a!2862) j!93))) (= (select (arr!47624 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1460880 e!821360))

(declare-fun res!990592 () Bool)

(assert (=> b!1460880 (=> (not res!990592) (not e!821360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98672 (_ BitVec 32)) Bool)

(assert (=> b!1460880 (= res!990592 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49248 0))(
  ( (Unit!49249) )
))
(declare-fun lt!639954 () Unit!49248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49248)

(assert (=> b!1460880 (= lt!639954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460881 () Bool)

(declare-fun res!990596 () Bool)

(assert (=> b!1460881 (=> (not res!990596) (not e!821353))))

(assert (=> b!1460881 (= res!990596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460882 () Bool)

(declare-fun res!990588 () Bool)

(declare-fun e!821357 () Bool)

(assert (=> b!1460882 (=> res!990588 e!821357)))

(assert (=> b!1460882 (= res!990588 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639951 (select (arr!47624 a!2862) j!93) a!2862 mask!2687) lt!639950)))))

(declare-fun b!1460883 () Bool)

(assert (=> b!1460883 (= e!821357 true)))

(declare-fun lt!639949 () Bool)

(assert (=> b!1460883 (= lt!639949 e!821356)))

(declare-fun c!134652 () Bool)

(assert (=> b!1460883 (= c!134652 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460884 () Bool)

(declare-fun res!990591 () Bool)

(assert (=> b!1460884 (=> (not res!990591) (not e!821353))))

(assert (=> b!1460884 (= res!990591 (validKeyInArray!0 (select (arr!47624 a!2862) j!93)))))

(declare-fun b!1460885 () Bool)

(assert (=> b!1460885 (= e!821355 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639948 lt!639952 mask!2687) (seekEntryOrOpen!0 lt!639948 lt!639952 mask!2687)))))

(declare-fun b!1460886 () Bool)

(assert (=> b!1460886 (= e!821359 e!821357)))

(declare-fun res!990598 () Bool)

(assert (=> b!1460886 (=> res!990598 e!821357)))

(assert (=> b!1460886 (= res!990598 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639951 #b00000000000000000000000000000000) (bvsge lt!639951 (size!48174 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460886 (= lt!639951 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!125224 res!990600) b!1460870))

(assert (= (and b!1460870 res!990597) b!1460877))

(assert (= (and b!1460877 res!990594) b!1460884))

(assert (= (and b!1460884 res!990591) b!1460881))

(assert (= (and b!1460881 res!990596) b!1460871))

(assert (= (and b!1460871 res!990585) b!1460873))

(assert (= (and b!1460873 res!990590) b!1460874))

(assert (= (and b!1460874 res!990593) b!1460878))

(assert (= (and b!1460878 res!990584) b!1460872))

(assert (= (and b!1460872 res!990601) b!1460869))

(assert (= (and b!1460869 res!990587) b!1460876))

(assert (= (and b!1460876 c!134651) b!1460879))

(assert (= (and b!1460876 (not c!134651)) b!1460885))

(assert (= (and b!1460876 res!990595) b!1460867))

(assert (= (and b!1460867 res!990599) b!1460880))

(assert (= (and b!1460880 res!990592) b!1460865))

(assert (= (and b!1460865 res!990589) b!1460866))

(assert (= (and b!1460880 (not res!990586)) b!1460886))

(assert (= (and b!1460886 (not res!990598)) b!1460882))

(assert (= (and b!1460882 (not res!990588)) b!1460883))

(assert (= (and b!1460883 c!134652) b!1460875))

(assert (= (and b!1460883 (not c!134652)) b!1460868))

(declare-fun m!1348513 () Bool)

(assert (=> b!1460880 m!1348513))

(declare-fun m!1348515 () Bool)

(assert (=> b!1460880 m!1348515))

(declare-fun m!1348517 () Bool)

(assert (=> b!1460880 m!1348517))

(declare-fun m!1348519 () Bool)

(assert (=> b!1460880 m!1348519))

(declare-fun m!1348521 () Bool)

(assert (=> b!1460880 m!1348521))

(declare-fun m!1348523 () Bool)

(assert (=> b!1460880 m!1348523))

(declare-fun m!1348525 () Bool)

(assert (=> b!1460879 m!1348525))

(declare-fun m!1348527 () Bool)

(assert (=> b!1460868 m!1348527))

(declare-fun m!1348529 () Bool)

(assert (=> b!1460868 m!1348529))

(declare-fun m!1348531 () Bool)

(assert (=> b!1460881 m!1348531))

(declare-fun m!1348533 () Bool)

(assert (=> b!1460885 m!1348533))

(assert (=> b!1460885 m!1348529))

(assert (=> b!1460884 m!1348523))

(assert (=> b!1460884 m!1348523))

(declare-fun m!1348535 () Bool)

(assert (=> b!1460884 m!1348535))

(assert (=> b!1460874 m!1348515))

(declare-fun m!1348537 () Bool)

(assert (=> b!1460874 m!1348537))

(assert (=> b!1460878 m!1348523))

(assert (=> b!1460878 m!1348523))

(declare-fun m!1348539 () Bool)

(assert (=> b!1460878 m!1348539))

(assert (=> b!1460878 m!1348539))

(assert (=> b!1460878 m!1348523))

(declare-fun m!1348541 () Bool)

(assert (=> b!1460878 m!1348541))

(declare-fun m!1348543 () Bool)

(assert (=> start!125224 m!1348543))

(declare-fun m!1348545 () Bool)

(assert (=> start!125224 m!1348545))

(declare-fun m!1348547 () Bool)

(assert (=> b!1460886 m!1348547))

(declare-fun m!1348549 () Bool)

(assert (=> b!1460877 m!1348549))

(assert (=> b!1460877 m!1348549))

(declare-fun m!1348551 () Bool)

(assert (=> b!1460877 m!1348551))

(declare-fun m!1348553 () Bool)

(assert (=> b!1460866 m!1348553))

(assert (=> b!1460866 m!1348523))

(declare-fun m!1348555 () Bool)

(assert (=> b!1460871 m!1348555))

(assert (=> b!1460872 m!1348523))

(assert (=> b!1460872 m!1348523))

(declare-fun m!1348557 () Bool)

(assert (=> b!1460872 m!1348557))

(declare-fun m!1348559 () Bool)

(assert (=> b!1460875 m!1348559))

(assert (=> b!1460865 m!1348523))

(assert (=> b!1460865 m!1348523))

(declare-fun m!1348561 () Bool)

(assert (=> b!1460865 m!1348561))

(declare-fun m!1348563 () Bool)

(assert (=> b!1460869 m!1348563))

(assert (=> b!1460869 m!1348563))

(declare-fun m!1348565 () Bool)

(assert (=> b!1460869 m!1348565))

(assert (=> b!1460869 m!1348515))

(declare-fun m!1348567 () Bool)

(assert (=> b!1460869 m!1348567))

(assert (=> b!1460882 m!1348523))

(assert (=> b!1460882 m!1348523))

(declare-fun m!1348569 () Bool)

(assert (=> b!1460882 m!1348569))

(push 1)

