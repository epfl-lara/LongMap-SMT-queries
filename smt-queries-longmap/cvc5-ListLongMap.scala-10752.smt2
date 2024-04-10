; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125770 () Bool)

(assert start!125770)

(declare-fun b!1471805 () Bool)

(declare-fun res!999550 () Bool)

(declare-fun e!826091 () Bool)

(assert (=> b!1471805 (=> (not res!999550) (not e!826091))))

(declare-datatypes ((array!99104 0))(
  ( (array!99105 (arr!47837 (Array (_ BitVec 32) (_ BitVec 64))) (size!48387 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99104)

(declare-datatypes ((List!34338 0))(
  ( (Nil!34335) (Cons!34334 (h!35690 (_ BitVec 64)) (t!49032 List!34338)) )
))
(declare-fun arrayNoDuplicates!0 (array!99104 (_ BitVec 32) List!34338) Bool)

(assert (=> b!1471805 (= res!999550 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34335))))

(declare-fun b!1471806 () Bool)

(declare-fun res!999552 () Bool)

(assert (=> b!1471806 (=> (not res!999552) (not e!826091))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471806 (= res!999552 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48387 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48387 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48387 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!826089 () Bool)

(declare-fun lt!643388 () (_ BitVec 64))

(declare-fun lt!643387 () array!99104)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1471807 () Bool)

(declare-datatypes ((SeekEntryResult!12077 0))(
  ( (MissingZero!12077 (index!50700 (_ BitVec 32))) (Found!12077 (index!50701 (_ BitVec 32))) (Intermediate!12077 (undefined!12889 Bool) (index!50702 (_ BitVec 32)) (x!132288 (_ BitVec 32))) (Undefined!12077) (MissingVacant!12077 (index!50703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99104 (_ BitVec 32)) SeekEntryResult!12077)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99104 (_ BitVec 32)) SeekEntryResult!12077)

(assert (=> b!1471807 (= e!826089 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643388 lt!643387 mask!2687) (seekEntryOrOpen!0 lt!643388 lt!643387 mask!2687)))))

(declare-fun b!1471808 () Bool)

(declare-fun e!826090 () Bool)

(assert (=> b!1471808 (= e!826091 e!826090)))

(declare-fun res!999553 () Bool)

(assert (=> b!1471808 (=> (not res!999553) (not e!826090))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471808 (= res!999553 (= (select (store (arr!47837 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471808 (= lt!643387 (array!99105 (store (arr!47837 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48387 a!2862)))))

(declare-fun b!1471809 () Bool)

(declare-fun e!826092 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1471809 (= e!826092 (or (= (select (arr!47837 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47837 a!2862) intermediateBeforeIndex!19) (select (arr!47837 a!2862) j!93))))))

(declare-fun b!1471810 () Bool)

(declare-fun res!999545 () Bool)

(declare-fun e!826094 () Bool)

(assert (=> b!1471810 (=> (not res!999545) (not e!826094))))

(declare-fun lt!643386 () SeekEntryResult!12077)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99104 (_ BitVec 32)) SeekEntryResult!12077)

(assert (=> b!1471810 (= res!999545 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47837 a!2862) j!93) a!2862 mask!2687) lt!643386))))

(declare-fun b!1471811 () Bool)

(assert (=> b!1471811 (= e!826090 e!826094)))

(declare-fun res!999556 () Bool)

(assert (=> b!1471811 (=> (not res!999556) (not e!826094))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471811 (= res!999556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47837 a!2862) j!93) mask!2687) (select (arr!47837 a!2862) j!93) a!2862 mask!2687) lt!643386))))

(assert (=> b!1471811 (= lt!643386 (Intermediate!12077 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471812 () Bool)

(declare-fun res!999554 () Bool)

(assert (=> b!1471812 (=> (not res!999554) (not e!826091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471812 (= res!999554 (validKeyInArray!0 (select (arr!47837 a!2862) j!93)))))

(declare-fun b!1471813 () Bool)

(declare-fun res!999549 () Bool)

(assert (=> b!1471813 (=> (not res!999549) (not e!826092))))

(assert (=> b!1471813 (= res!999549 (= (seekEntryOrOpen!0 (select (arr!47837 a!2862) j!93) a!2862 mask!2687) (Found!12077 j!93)))))

(declare-fun b!1471814 () Bool)

(declare-fun e!826093 () Bool)

(assert (=> b!1471814 (= e!826093 (not true))))

(assert (=> b!1471814 e!826092))

(declare-fun res!999555 () Bool)

(assert (=> b!1471814 (=> (not res!999555) (not e!826092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99104 (_ BitVec 32)) Bool)

(assert (=> b!1471814 (= res!999555 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49494 0))(
  ( (Unit!49495) )
))
(declare-fun lt!643385 () Unit!49494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49494)

(assert (=> b!1471814 (= lt!643385 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471816 () Bool)

(declare-fun lt!643389 () SeekEntryResult!12077)

(assert (=> b!1471816 (= e!826089 (= lt!643389 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643388 lt!643387 mask!2687)))))

(declare-fun b!1471817 () Bool)

(declare-fun res!999548 () Bool)

(assert (=> b!1471817 (=> (not res!999548) (not e!826091))))

(assert (=> b!1471817 (= res!999548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471818 () Bool)

(declare-fun res!999547 () Bool)

(assert (=> b!1471818 (=> (not res!999547) (not e!826091))))

(assert (=> b!1471818 (= res!999547 (and (= (size!48387 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48387 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48387 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471819 () Bool)

(assert (=> b!1471819 (= e!826094 e!826093)))

(declare-fun res!999543 () Bool)

(assert (=> b!1471819 (=> (not res!999543) (not e!826093))))

(assert (=> b!1471819 (= res!999543 (= lt!643389 (Intermediate!12077 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471819 (= lt!643389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643388 mask!2687) lt!643388 lt!643387 mask!2687))))

(assert (=> b!1471819 (= lt!643388 (select (store (arr!47837 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471820 () Bool)

(declare-fun res!999551 () Bool)

(assert (=> b!1471820 (=> (not res!999551) (not e!826093))))

(assert (=> b!1471820 (= res!999551 e!826089)))

(declare-fun c!135645 () Bool)

(assert (=> b!1471820 (= c!135645 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471821 () Bool)

(declare-fun res!999542 () Bool)

(assert (=> b!1471821 (=> (not res!999542) (not e!826091))))

(assert (=> b!1471821 (= res!999542 (validKeyInArray!0 (select (arr!47837 a!2862) i!1006)))))

(declare-fun res!999546 () Bool)

(assert (=> start!125770 (=> (not res!999546) (not e!826091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125770 (= res!999546 (validMask!0 mask!2687))))

(assert (=> start!125770 e!826091))

(assert (=> start!125770 true))

(declare-fun array_inv!36865 (array!99104) Bool)

(assert (=> start!125770 (array_inv!36865 a!2862)))

(declare-fun b!1471815 () Bool)

(declare-fun res!999544 () Bool)

(assert (=> b!1471815 (=> (not res!999544) (not e!826093))))

(assert (=> b!1471815 (= res!999544 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125770 res!999546) b!1471818))

(assert (= (and b!1471818 res!999547) b!1471821))

(assert (= (and b!1471821 res!999542) b!1471812))

(assert (= (and b!1471812 res!999554) b!1471817))

(assert (= (and b!1471817 res!999548) b!1471805))

(assert (= (and b!1471805 res!999550) b!1471806))

(assert (= (and b!1471806 res!999552) b!1471808))

(assert (= (and b!1471808 res!999553) b!1471811))

(assert (= (and b!1471811 res!999556) b!1471810))

(assert (= (and b!1471810 res!999545) b!1471819))

(assert (= (and b!1471819 res!999543) b!1471820))

(assert (= (and b!1471820 c!135645) b!1471816))

(assert (= (and b!1471820 (not c!135645)) b!1471807))

(assert (= (and b!1471820 res!999551) b!1471815))

(assert (= (and b!1471815 res!999544) b!1471814))

(assert (= (and b!1471814 res!999555) b!1471813))

(assert (= (and b!1471813 res!999549) b!1471809))

(declare-fun m!1358581 () Bool)

(assert (=> b!1471813 m!1358581))

(assert (=> b!1471813 m!1358581))

(declare-fun m!1358583 () Bool)

(assert (=> b!1471813 m!1358583))

(assert (=> b!1471810 m!1358581))

(assert (=> b!1471810 m!1358581))

(declare-fun m!1358585 () Bool)

(assert (=> b!1471810 m!1358585))

(declare-fun m!1358587 () Bool)

(assert (=> b!1471808 m!1358587))

(declare-fun m!1358589 () Bool)

(assert (=> b!1471808 m!1358589))

(declare-fun m!1358591 () Bool)

(assert (=> b!1471805 m!1358591))

(declare-fun m!1358593 () Bool)

(assert (=> b!1471809 m!1358593))

(assert (=> b!1471809 m!1358581))

(declare-fun m!1358595 () Bool)

(assert (=> b!1471821 m!1358595))

(assert (=> b!1471821 m!1358595))

(declare-fun m!1358597 () Bool)

(assert (=> b!1471821 m!1358597))

(assert (=> b!1471811 m!1358581))

(assert (=> b!1471811 m!1358581))

(declare-fun m!1358599 () Bool)

(assert (=> b!1471811 m!1358599))

(assert (=> b!1471811 m!1358599))

(assert (=> b!1471811 m!1358581))

(declare-fun m!1358601 () Bool)

(assert (=> b!1471811 m!1358601))

(declare-fun m!1358603 () Bool)

(assert (=> b!1471807 m!1358603))

(declare-fun m!1358605 () Bool)

(assert (=> b!1471807 m!1358605))

(declare-fun m!1358607 () Bool)

(assert (=> b!1471817 m!1358607))

(declare-fun m!1358609 () Bool)

(assert (=> b!1471816 m!1358609))

(declare-fun m!1358611 () Bool)

(assert (=> b!1471814 m!1358611))

(declare-fun m!1358613 () Bool)

(assert (=> b!1471814 m!1358613))

(declare-fun m!1358615 () Bool)

(assert (=> start!125770 m!1358615))

(declare-fun m!1358617 () Bool)

(assert (=> start!125770 m!1358617))

(declare-fun m!1358619 () Bool)

(assert (=> b!1471819 m!1358619))

(assert (=> b!1471819 m!1358619))

(declare-fun m!1358621 () Bool)

(assert (=> b!1471819 m!1358621))

(assert (=> b!1471819 m!1358587))

(declare-fun m!1358623 () Bool)

(assert (=> b!1471819 m!1358623))

(assert (=> b!1471812 m!1358581))

(assert (=> b!1471812 m!1358581))

(declare-fun m!1358625 () Bool)

(assert (=> b!1471812 m!1358625))

(push 1)

