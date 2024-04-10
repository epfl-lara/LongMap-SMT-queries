; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126874 () Bool)

(assert start!126874)

(declare-fun res!1013703 () Bool)

(declare-fun e!835174 () Bool)

(assert (=> start!126874 (=> (not res!1013703) (not e!835174))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126874 (= res!1013703 (validMask!0 mask!2687))))

(assert (=> start!126874 e!835174))

(assert (=> start!126874 true))

(declare-datatypes ((array!99647 0))(
  ( (array!99648 (arr!48095 (Array (_ BitVec 32) (_ BitVec 64))) (size!48645 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99647)

(declare-fun array_inv!37123 (array!99647) Bool)

(assert (=> start!126874 (array_inv!37123 a!2862)))

(declare-fun b!1490410 () Bool)

(declare-fun res!1013702 () Bool)

(assert (=> b!1490410 (=> (not res!1013702) (not e!835174))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490410 (= res!1013702 (validKeyInArray!0 (select (arr!48095 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649933 () array!99647)

(declare-fun b!1490411 () Bool)

(declare-fun lt!649937 () (_ BitVec 64))

(declare-fun e!835169 () Bool)

(declare-datatypes ((SeekEntryResult!12335 0))(
  ( (MissingZero!12335 (index!51732 (_ BitVec 32))) (Found!12335 (index!51733 (_ BitVec 32))) (Intermediate!12335 (undefined!13147 Bool) (index!51734 (_ BitVec 32)) (x!133327 (_ BitVec 32))) (Undefined!12335) (MissingVacant!12335 (index!51735 (_ BitVec 32))) )
))
(declare-fun lt!649936 () SeekEntryResult!12335)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99647 (_ BitVec 32)) SeekEntryResult!12335)

(assert (=> b!1490411 (= e!835169 (= lt!649936 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649937 lt!649933 mask!2687)))))

(declare-fun b!1490412 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99647 (_ BitVec 32)) SeekEntryResult!12335)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99647 (_ BitVec 32)) SeekEntryResult!12335)

(assert (=> b!1490412 (= e!835169 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649937 lt!649933 mask!2687) (seekEntryOrOpen!0 lt!649937 lt!649933 mask!2687)))))

(declare-fun b!1490413 () Bool)

(declare-fun e!835173 () Bool)

(assert (=> b!1490413 (= e!835174 e!835173)))

(declare-fun res!1013693 () Bool)

(assert (=> b!1490413 (=> (not res!1013693) (not e!835173))))

(assert (=> b!1490413 (= res!1013693 (= (select (store (arr!48095 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490413 (= lt!649933 (array!99648 (store (arr!48095 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48645 a!2862)))))

(declare-fun b!1490414 () Bool)

(declare-fun e!835170 () Bool)

(declare-fun e!835175 () Bool)

(assert (=> b!1490414 (= e!835170 e!835175)))

(declare-fun res!1013705 () Bool)

(assert (=> b!1490414 (=> (not res!1013705) (not e!835175))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490414 (= res!1013705 (= lt!649936 (Intermediate!12335 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490414 (= lt!649936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649937 mask!2687) lt!649937 lt!649933 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1490414 (= lt!649937 (select (store (arr!48095 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490415 () Bool)

(declare-fun res!1013700 () Bool)

(assert (=> b!1490415 (=> (not res!1013700) (not e!835175))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490415 (= res!1013700 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490416 () Bool)

(declare-fun res!1013696 () Bool)

(assert (=> b!1490416 (=> (not res!1013696) (not e!835174))))

(assert (=> b!1490416 (= res!1013696 (and (= (size!48645 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48645 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48645 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490417 () Bool)

(declare-fun res!1013698 () Bool)

(assert (=> b!1490417 (=> (not res!1013698) (not e!835175))))

(assert (=> b!1490417 (= res!1013698 e!835169)))

(declare-fun c!137886 () Bool)

(assert (=> b!1490417 (= c!137886 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490418 () Bool)

(declare-fun res!1013707 () Bool)

(assert (=> b!1490418 (=> (not res!1013707) (not e!835170))))

(declare-fun lt!649938 () SeekEntryResult!12335)

(assert (=> b!1490418 (= res!1013707 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48095 a!2862) j!93) a!2862 mask!2687) lt!649938))))

(declare-fun b!1490419 () Bool)

(declare-fun res!1013692 () Bool)

(assert (=> b!1490419 (=> (not res!1013692) (not e!835174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99647 (_ BitVec 32)) Bool)

(assert (=> b!1490419 (= res!1013692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490420 () Bool)

(declare-fun res!1013697 () Bool)

(declare-fun e!835171 () Bool)

(assert (=> b!1490420 (=> (not res!1013697) (not e!835171))))

(assert (=> b!1490420 (= res!1013697 (= (seekEntryOrOpen!0 (select (arr!48095 a!2862) j!93) a!2862 mask!2687) (Found!12335 j!93)))))

(declare-fun b!1490421 () Bool)

(declare-fun res!1013706 () Bool)

(assert (=> b!1490421 (=> (not res!1013706) (not e!835174))))

(declare-datatypes ((List!34596 0))(
  ( (Nil!34593) (Cons!34592 (h!35975 (_ BitVec 64)) (t!49290 List!34596)) )
))
(declare-fun arrayNoDuplicates!0 (array!99647 (_ BitVec 32) List!34596) Bool)

(assert (=> b!1490421 (= res!1013706 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34593))))

(declare-fun b!1490422 () Bool)

(declare-fun e!835172 () Bool)

(assert (=> b!1490422 (= e!835175 (not e!835172))))

(declare-fun res!1013695 () Bool)

(assert (=> b!1490422 (=> res!1013695 e!835172)))

(assert (=> b!1490422 (= res!1013695 (or (and (= (select (arr!48095 a!2862) index!646) (select (store (arr!48095 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48095 a!2862) index!646) (select (arr!48095 a!2862) j!93))) (= (select (arr!48095 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490422 e!835171))

(declare-fun res!1013704 () Bool)

(assert (=> b!1490422 (=> (not res!1013704) (not e!835171))))

(assert (=> b!1490422 (= res!1013704 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50010 0))(
  ( (Unit!50011) )
))
(declare-fun lt!649935 () Unit!50010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50010)

(assert (=> b!1490422 (= lt!649935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490423 () Bool)

(declare-fun res!1013694 () Bool)

(assert (=> b!1490423 (=> (not res!1013694) (not e!835174))))

(assert (=> b!1490423 (= res!1013694 (validKeyInArray!0 (select (arr!48095 a!2862) j!93)))))

(declare-fun b!1490424 () Bool)

(assert (=> b!1490424 (= e!835172 true)))

(declare-fun lt!649934 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490424 (= lt!649934 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490425 () Bool)

(assert (=> b!1490425 (= e!835173 e!835170)))

(declare-fun res!1013701 () Bool)

(assert (=> b!1490425 (=> (not res!1013701) (not e!835170))))

(assert (=> b!1490425 (= res!1013701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48095 a!2862) j!93) mask!2687) (select (arr!48095 a!2862) j!93) a!2862 mask!2687) lt!649938))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1490425 (= lt!649938 (Intermediate!12335 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490426 () Bool)

(assert (=> b!1490426 (= e!835171 (or (= (select (arr!48095 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48095 a!2862) intermediateBeforeIndex!19) (select (arr!48095 a!2862) j!93))))))

(declare-fun b!1490427 () Bool)

(declare-fun res!1013699 () Bool)

(assert (=> b!1490427 (=> (not res!1013699) (not e!835174))))

(assert (=> b!1490427 (= res!1013699 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48645 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48645 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48645 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126874 res!1013703) b!1490416))

(assert (= (and b!1490416 res!1013696) b!1490410))

(assert (= (and b!1490410 res!1013702) b!1490423))

(assert (= (and b!1490423 res!1013694) b!1490419))

(assert (= (and b!1490419 res!1013692) b!1490421))

(assert (= (and b!1490421 res!1013706) b!1490427))

(assert (= (and b!1490427 res!1013699) b!1490413))

(assert (= (and b!1490413 res!1013693) b!1490425))

(assert (= (and b!1490425 res!1013701) b!1490418))

(assert (= (and b!1490418 res!1013707) b!1490414))

(assert (= (and b!1490414 res!1013705) b!1490417))

(assert (= (and b!1490417 c!137886) b!1490411))

(assert (= (and b!1490417 (not c!137886)) b!1490412))

(assert (= (and b!1490417 res!1013698) b!1490415))

(assert (= (and b!1490415 res!1013700) b!1490422))

(assert (= (and b!1490422 res!1013704) b!1490420))

(assert (= (and b!1490420 res!1013697) b!1490426))

(assert (= (and b!1490422 (not res!1013695)) b!1490424))

(declare-fun m!1374571 () Bool)

(assert (=> b!1490425 m!1374571))

(assert (=> b!1490425 m!1374571))

(declare-fun m!1374573 () Bool)

(assert (=> b!1490425 m!1374573))

(assert (=> b!1490425 m!1374573))

(assert (=> b!1490425 m!1374571))

(declare-fun m!1374575 () Bool)

(assert (=> b!1490425 m!1374575))

(declare-fun m!1374577 () Bool)

(assert (=> b!1490410 m!1374577))

(assert (=> b!1490410 m!1374577))

(declare-fun m!1374579 () Bool)

(assert (=> b!1490410 m!1374579))

(declare-fun m!1374581 () Bool)

(assert (=> b!1490412 m!1374581))

(declare-fun m!1374583 () Bool)

(assert (=> b!1490412 m!1374583))

(declare-fun m!1374585 () Bool)

(assert (=> b!1490422 m!1374585))

(declare-fun m!1374587 () Bool)

(assert (=> b!1490422 m!1374587))

(declare-fun m!1374589 () Bool)

(assert (=> b!1490422 m!1374589))

(declare-fun m!1374591 () Bool)

(assert (=> b!1490422 m!1374591))

(declare-fun m!1374593 () Bool)

(assert (=> b!1490422 m!1374593))

(assert (=> b!1490422 m!1374571))

(declare-fun m!1374595 () Bool)

(assert (=> b!1490411 m!1374595))

(declare-fun m!1374597 () Bool)

(assert (=> b!1490414 m!1374597))

(assert (=> b!1490414 m!1374597))

(declare-fun m!1374599 () Bool)

(assert (=> b!1490414 m!1374599))

(assert (=> b!1490414 m!1374587))

(declare-fun m!1374601 () Bool)

(assert (=> b!1490414 m!1374601))

(declare-fun m!1374603 () Bool)

(assert (=> b!1490424 m!1374603))

(assert (=> b!1490423 m!1374571))

(assert (=> b!1490423 m!1374571))

(declare-fun m!1374605 () Bool)

(assert (=> b!1490423 m!1374605))

(assert (=> b!1490413 m!1374587))

(declare-fun m!1374607 () Bool)

(assert (=> b!1490413 m!1374607))

(declare-fun m!1374609 () Bool)

(assert (=> b!1490426 m!1374609))

(assert (=> b!1490426 m!1374571))

(declare-fun m!1374611 () Bool)

(assert (=> start!126874 m!1374611))

(declare-fun m!1374613 () Bool)

(assert (=> start!126874 m!1374613))

(declare-fun m!1374615 () Bool)

(assert (=> b!1490421 m!1374615))

(assert (=> b!1490420 m!1374571))

(assert (=> b!1490420 m!1374571))

(declare-fun m!1374617 () Bool)

(assert (=> b!1490420 m!1374617))

(declare-fun m!1374619 () Bool)

(assert (=> b!1490419 m!1374619))

(assert (=> b!1490418 m!1374571))

(assert (=> b!1490418 m!1374571))

(declare-fun m!1374621 () Bool)

(assert (=> b!1490418 m!1374621))

(push 1)

