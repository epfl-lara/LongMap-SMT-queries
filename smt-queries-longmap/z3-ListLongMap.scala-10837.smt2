; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126818 () Bool)

(assert start!126818)

(declare-fun res!1013407 () Bool)

(declare-fun e!834875 () Bool)

(assert (=> start!126818 (=> (not res!1013407) (not e!834875))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126818 (= res!1013407 (validMask!0 mask!2687))))

(assert (=> start!126818 e!834875))

(assert (=> start!126818 true))

(declare-datatypes ((array!99589 0))(
  ( (array!99590 (arr!48067 (Array (_ BitVec 32) (_ BitVec 64))) (size!48619 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99589)

(declare-fun array_inv!37300 (array!99589) Bool)

(assert (=> start!126818 (array_inv!37300 a!2862)))

(declare-fun b!1489879 () Bool)

(declare-fun res!1013404 () Bool)

(assert (=> b!1489879 (=> (not res!1013404) (not e!834875))))

(declare-datatypes ((List!34646 0))(
  ( (Nil!34643) (Cons!34642 (h!36025 (_ BitVec 64)) (t!49332 List!34646)) )
))
(declare-fun arrayNoDuplicates!0 (array!99589 (_ BitVec 32) List!34646) Bool)

(assert (=> b!1489879 (= res!1013404 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34643))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649580 () array!99589)

(declare-fun lt!649577 () (_ BitVec 64))

(declare-fun e!834873 () Bool)

(declare-fun b!1489880 () Bool)

(declare-datatypes ((SeekEntryResult!12332 0))(
  ( (MissingZero!12332 (index!51720 (_ BitVec 32))) (Found!12332 (index!51721 (_ BitVec 32))) (Intermediate!12332 (undefined!13144 Bool) (index!51722 (_ BitVec 32)) (x!133309 (_ BitVec 32))) (Undefined!12332) (MissingVacant!12332 (index!51723 (_ BitVec 32))) )
))
(declare-fun lt!649578 () SeekEntryResult!12332)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99589 (_ BitVec 32)) SeekEntryResult!12332)

(assert (=> b!1489880 (= e!834873 (= lt!649578 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649577 lt!649580 mask!2687)))))

(declare-fun b!1489881 () Bool)

(declare-fun res!1013413 () Bool)

(assert (=> b!1489881 (=> (not res!1013413) (not e!834875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99589 (_ BitVec 32)) Bool)

(assert (=> b!1489881 (= res!1013413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489882 () Bool)

(declare-fun res!1013418 () Bool)

(declare-fun e!834871 () Bool)

(assert (=> b!1489882 (=> (not res!1013418) (not e!834871))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489882 (= res!1013418 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489883 () Bool)

(declare-fun res!1013408 () Bool)

(assert (=> b!1489883 (=> (not res!1013408) (not e!834871))))

(assert (=> b!1489883 (= res!1013408 e!834873)))

(declare-fun c!137767 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489883 (= c!137767 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489884 () Bool)

(declare-fun res!1013412 () Bool)

(declare-fun e!834874 () Bool)

(assert (=> b!1489884 (=> (not res!1013412) (not e!834874))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99589 (_ BitVec 32)) SeekEntryResult!12332)

(assert (=> b!1489884 (= res!1013412 (= (seekEntryOrOpen!0 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) (Found!12332 j!93)))))

(declare-fun b!1489885 () Bool)

(declare-fun res!1013417 () Bool)

(assert (=> b!1489885 (=> (not res!1013417) (not e!834875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489885 (= res!1013417 (validKeyInArray!0 (select (arr!48067 a!2862) j!93)))))

(declare-fun b!1489886 () Bool)

(declare-fun e!834869 () Bool)

(assert (=> b!1489886 (= e!834875 e!834869)))

(declare-fun res!1013416 () Bool)

(assert (=> b!1489886 (=> (not res!1013416) (not e!834869))))

(assert (=> b!1489886 (= res!1013416 (= (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489886 (= lt!649580 (array!99590 (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48619 a!2862)))))

(declare-fun b!1489887 () Bool)

(declare-fun e!834868 () Bool)

(assert (=> b!1489887 (= e!834869 e!834868)))

(declare-fun res!1013405 () Bool)

(assert (=> b!1489887 (=> (not res!1013405) (not e!834868))))

(declare-fun lt!649575 () SeekEntryResult!12332)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489887 (= res!1013405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649575))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1489887 (= lt!649575 (Intermediate!12332 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489888 () Bool)

(declare-fun res!1013410 () Bool)

(assert (=> b!1489888 (=> (not res!1013410) (not e!834875))))

(assert (=> b!1489888 (= res!1013410 (and (= (size!48619 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48619 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48619 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489889 () Bool)

(declare-fun e!834872 () Bool)

(assert (=> b!1489889 (= e!834871 (not e!834872))))

(declare-fun res!1013419 () Bool)

(assert (=> b!1489889 (=> res!1013419 e!834872)))

(assert (=> b!1489889 (= res!1013419 (or (and (= (select (arr!48067 a!2862) index!646) (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48067 a!2862) index!646) (select (arr!48067 a!2862) j!93))) (= (select (arr!48067 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1489889 e!834874))

(declare-fun res!1013415 () Bool)

(assert (=> b!1489889 (=> (not res!1013415) (not e!834874))))

(assert (=> b!1489889 (= res!1013415 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49845 0))(
  ( (Unit!49846) )
))
(declare-fun lt!649576 () Unit!49845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49845)

(assert (=> b!1489889 (= lt!649576 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489890 () Bool)

(declare-fun res!1013414 () Bool)

(assert (=> b!1489890 (=> (not res!1013414) (not e!834875))))

(assert (=> b!1489890 (= res!1013414 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48619 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48619 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48619 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489891 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99589 (_ BitVec 32)) SeekEntryResult!12332)

(assert (=> b!1489891 (= e!834873 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649577 lt!649580 mask!2687) (seekEntryOrOpen!0 lt!649577 lt!649580 mask!2687)))))

(declare-fun b!1489892 () Bool)

(assert (=> b!1489892 (= e!834872 true)))

(declare-fun lt!649579 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489892 (= lt!649579 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1489893 () Bool)

(assert (=> b!1489893 (= e!834874 (or (= (select (arr!48067 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48067 a!2862) intermediateBeforeIndex!19) (select (arr!48067 a!2862) j!93))))))

(declare-fun b!1489894 () Bool)

(declare-fun res!1013406 () Bool)

(assert (=> b!1489894 (=> (not res!1013406) (not e!834868))))

(assert (=> b!1489894 (= res!1013406 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649575))))

(declare-fun b!1489895 () Bool)

(assert (=> b!1489895 (= e!834868 e!834871)))

(declare-fun res!1013411 () Bool)

(assert (=> b!1489895 (=> (not res!1013411) (not e!834871))))

(assert (=> b!1489895 (= res!1013411 (= lt!649578 (Intermediate!12332 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489895 (= lt!649578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649577 mask!2687) lt!649577 lt!649580 mask!2687))))

(assert (=> b!1489895 (= lt!649577 (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489896 () Bool)

(declare-fun res!1013409 () Bool)

(assert (=> b!1489896 (=> (not res!1013409) (not e!834875))))

(assert (=> b!1489896 (= res!1013409 (validKeyInArray!0 (select (arr!48067 a!2862) i!1006)))))

(assert (= (and start!126818 res!1013407) b!1489888))

(assert (= (and b!1489888 res!1013410) b!1489896))

(assert (= (and b!1489896 res!1013409) b!1489885))

(assert (= (and b!1489885 res!1013417) b!1489881))

(assert (= (and b!1489881 res!1013413) b!1489879))

(assert (= (and b!1489879 res!1013404) b!1489890))

(assert (= (and b!1489890 res!1013414) b!1489886))

(assert (= (and b!1489886 res!1013416) b!1489887))

(assert (= (and b!1489887 res!1013405) b!1489894))

(assert (= (and b!1489894 res!1013406) b!1489895))

(assert (= (and b!1489895 res!1013411) b!1489883))

(assert (= (and b!1489883 c!137767) b!1489880))

(assert (= (and b!1489883 (not c!137767)) b!1489891))

(assert (= (and b!1489883 res!1013408) b!1489882))

(assert (= (and b!1489882 res!1013418) b!1489889))

(assert (= (and b!1489889 res!1013415) b!1489884))

(assert (= (and b!1489884 res!1013412) b!1489893))

(assert (= (and b!1489889 (not res!1013419)) b!1489892))

(declare-fun m!1373511 () Bool)

(assert (=> b!1489896 m!1373511))

(assert (=> b!1489896 m!1373511))

(declare-fun m!1373513 () Bool)

(assert (=> b!1489896 m!1373513))

(declare-fun m!1373515 () Bool)

(assert (=> b!1489891 m!1373515))

(declare-fun m!1373517 () Bool)

(assert (=> b!1489891 m!1373517))

(declare-fun m!1373519 () Bool)

(assert (=> b!1489880 m!1373519))

(declare-fun m!1373521 () Bool)

(assert (=> start!126818 m!1373521))

(declare-fun m!1373523 () Bool)

(assert (=> start!126818 m!1373523))

(declare-fun m!1373525 () Bool)

(assert (=> b!1489895 m!1373525))

(assert (=> b!1489895 m!1373525))

(declare-fun m!1373527 () Bool)

(assert (=> b!1489895 m!1373527))

(declare-fun m!1373529 () Bool)

(assert (=> b!1489895 m!1373529))

(declare-fun m!1373531 () Bool)

(assert (=> b!1489895 m!1373531))

(declare-fun m!1373533 () Bool)

(assert (=> b!1489893 m!1373533))

(declare-fun m!1373535 () Bool)

(assert (=> b!1489893 m!1373535))

(assert (=> b!1489885 m!1373535))

(assert (=> b!1489885 m!1373535))

(declare-fun m!1373537 () Bool)

(assert (=> b!1489885 m!1373537))

(assert (=> b!1489884 m!1373535))

(assert (=> b!1489884 m!1373535))

(declare-fun m!1373539 () Bool)

(assert (=> b!1489884 m!1373539))

(declare-fun m!1373541 () Bool)

(assert (=> b!1489892 m!1373541))

(declare-fun m!1373543 () Bool)

(assert (=> b!1489881 m!1373543))

(declare-fun m!1373545 () Bool)

(assert (=> b!1489879 m!1373545))

(assert (=> b!1489886 m!1373529))

(declare-fun m!1373547 () Bool)

(assert (=> b!1489886 m!1373547))

(declare-fun m!1373549 () Bool)

(assert (=> b!1489889 m!1373549))

(assert (=> b!1489889 m!1373529))

(declare-fun m!1373551 () Bool)

(assert (=> b!1489889 m!1373551))

(declare-fun m!1373553 () Bool)

(assert (=> b!1489889 m!1373553))

(declare-fun m!1373555 () Bool)

(assert (=> b!1489889 m!1373555))

(assert (=> b!1489889 m!1373535))

(assert (=> b!1489887 m!1373535))

(assert (=> b!1489887 m!1373535))

(declare-fun m!1373557 () Bool)

(assert (=> b!1489887 m!1373557))

(assert (=> b!1489887 m!1373557))

(assert (=> b!1489887 m!1373535))

(declare-fun m!1373559 () Bool)

(assert (=> b!1489887 m!1373559))

(assert (=> b!1489894 m!1373535))

(assert (=> b!1489894 m!1373535))

(declare-fun m!1373561 () Bool)

(assert (=> b!1489894 m!1373561))

(check-sat (not b!1489889) (not b!1489887) (not b!1489879) (not b!1489896) (not b!1489894) (not b!1489892) (not b!1489881) (not b!1489885) (not b!1489895) (not start!126818) (not b!1489891) (not b!1489880) (not b!1489884))
(check-sat)
