; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126942 () Bool)

(assert start!126942)

(declare-fun b!1488716 () Bool)

(declare-fun res!1011915 () Bool)

(declare-fun e!834606 () Bool)

(assert (=> b!1488716 (=> (not res!1011915) (not e!834606))))

(declare-datatypes ((array!99679 0))(
  ( (array!99680 (arr!48109 (Array (_ BitVec 32) (_ BitVec 64))) (size!48660 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99679)

(declare-datatypes ((List!34597 0))(
  ( (Nil!34594) (Cons!34593 (h!35984 (_ BitVec 64)) (t!49283 List!34597)) )
))
(declare-fun arrayNoDuplicates!0 (array!99679 (_ BitVec 32) List!34597) Bool)

(assert (=> b!1488716 (= res!1011915 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34594))))

(declare-fun b!1488718 () Bool)

(declare-fun e!834612 () Bool)

(declare-fun e!834610 () Bool)

(assert (=> b!1488718 (= e!834612 (not e!834610))))

(declare-fun res!1011925 () Bool)

(assert (=> b!1488718 (=> res!1011925 e!834610)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488718 (= res!1011925 (or (and (= (select (arr!48109 a!2862) index!646) (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48109 a!2862) index!646) (select (arr!48109 a!2862) j!93))) (= (select (arr!48109 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!834608 () Bool)

(assert (=> b!1488718 e!834608))

(declare-fun res!1011921 () Bool)

(assert (=> b!1488718 (=> (not res!1011921) (not e!834608))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99679 (_ BitVec 32)) Bool)

(assert (=> b!1488718 (= res!1011921 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49865 0))(
  ( (Unit!49866) )
))
(declare-fun lt!649298 () Unit!49865)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49865)

(assert (=> b!1488718 (= lt!649298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488719 () Bool)

(declare-fun e!834609 () Bool)

(assert (=> b!1488719 (= e!834608 e!834609)))

(declare-fun res!1011931 () Bool)

(assert (=> b!1488719 (=> res!1011931 e!834609)))

(declare-fun lt!649297 () (_ BitVec 64))

(assert (=> b!1488719 (= res!1011931 (or (and (= (select (arr!48109 a!2862) index!646) lt!649297) (= (select (arr!48109 a!2862) index!646) (select (arr!48109 a!2862) j!93))) (= (select (arr!48109 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488719 (= lt!649297 (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1488720 () Bool)

(declare-datatypes ((SeekEntryResult!12246 0))(
  ( (MissingZero!12246 (index!51376 (_ BitVec 32))) (Found!12246 (index!51377 (_ BitVec 32))) (Intermediate!12246 (undefined!13058 Bool) (index!51378 (_ BitVec 32)) (x!133143 (_ BitVec 32))) (Undefined!12246) (MissingVacant!12246 (index!51379 (_ BitVec 32))) )
))
(declare-fun lt!649294 () SeekEntryResult!12246)

(declare-fun lt!649296 () array!99679)

(declare-fun lt!649300 () (_ BitVec 64))

(declare-fun e!834607 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99679 (_ BitVec 32)) SeekEntryResult!12246)

(assert (=> b!1488720 (= e!834607 (= lt!649294 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649300 lt!649296 mask!2687)))))

(declare-fun b!1488721 () Bool)

(declare-fun e!834611 () Bool)

(assert (=> b!1488721 (= e!834606 e!834611)))

(declare-fun res!1011919 () Bool)

(assert (=> b!1488721 (=> (not res!1011919) (not e!834611))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488721 (= res!1011919 (= (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488721 (= lt!649296 (array!99680 (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48660 a!2862)))))

(declare-fun b!1488722 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99679 (_ BitVec 32)) SeekEntryResult!12246)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99679 (_ BitVec 32)) SeekEntryResult!12246)

(assert (=> b!1488722 (= e!834607 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649300 lt!649296 mask!2687) (seekEntryOrOpen!0 lt!649300 lt!649296 mask!2687)))))

(declare-fun b!1488723 () Bool)

(declare-fun res!1011922 () Bool)

(assert (=> b!1488723 (=> (not res!1011922) (not e!834606))))

(assert (=> b!1488723 (= res!1011922 (and (= (size!48660 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48660 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48660 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488724 () Bool)

(declare-fun res!1011927 () Bool)

(assert (=> b!1488724 (=> (not res!1011927) (not e!834606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488724 (= res!1011927 (validKeyInArray!0 (select (arr!48109 a!2862) j!93)))))

(declare-fun b!1488725 () Bool)

(declare-fun res!1011917 () Bool)

(assert (=> b!1488725 (=> (not res!1011917) (not e!834612))))

(assert (=> b!1488725 (= res!1011917 e!834607)))

(declare-fun c!137935 () Bool)

(assert (=> b!1488725 (= c!137935 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488726 () Bool)

(declare-fun e!834613 () Bool)

(assert (=> b!1488726 (= e!834613 e!834612)))

(declare-fun res!1011930 () Bool)

(assert (=> b!1488726 (=> (not res!1011930) (not e!834612))))

(assert (=> b!1488726 (= res!1011930 (= lt!649294 (Intermediate!12246 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488726 (= lt!649294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649300 mask!2687) lt!649300 lt!649296 mask!2687))))

(assert (=> b!1488726 (= lt!649300 (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1011932 () Bool)

(assert (=> start!126942 (=> (not res!1011932) (not e!834606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126942 (= res!1011932 (validMask!0 mask!2687))))

(assert (=> start!126942 e!834606))

(assert (=> start!126942 true))

(declare-fun array_inv!37390 (array!99679) Bool)

(assert (=> start!126942 (array_inv!37390 a!2862)))

(declare-fun b!1488717 () Bool)

(declare-fun res!1011926 () Bool)

(assert (=> b!1488717 (=> (not res!1011926) (not e!834606))))

(assert (=> b!1488717 (= res!1011926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488727 () Bool)

(assert (=> b!1488727 (= e!834610 true)))

(declare-fun lt!649299 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488727 (= lt!649299 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1488728 () Bool)

(declare-fun res!1011916 () Bool)

(assert (=> b!1488728 (=> (not res!1011916) (not e!834613))))

(declare-fun lt!649295 () SeekEntryResult!12246)

(assert (=> b!1488728 (= res!1011916 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!649295))))

(declare-fun b!1488729 () Bool)

(declare-fun e!834614 () Bool)

(assert (=> b!1488729 (= e!834614 (= (seekEntryOrOpen!0 lt!649300 lt!649296 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649300 lt!649296 mask!2687)))))

(declare-fun b!1488730 () Bool)

(declare-fun res!1011923 () Bool)

(assert (=> b!1488730 (=> (not res!1011923) (not e!834608))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1488730 (= res!1011923 (or (= (select (arr!48109 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48109 a!2862) intermediateBeforeIndex!19) (select (arr!48109 a!2862) j!93))))))

(declare-fun b!1488731 () Bool)

(declare-fun res!1011920 () Bool)

(assert (=> b!1488731 (=> (not res!1011920) (not e!834606))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488731 (= res!1011920 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48660 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48660 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48660 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488732 () Bool)

(assert (=> b!1488732 (= e!834609 e!834614)))

(declare-fun res!1011928 () Bool)

(assert (=> b!1488732 (=> (not res!1011928) (not e!834614))))

(assert (=> b!1488732 (= res!1011928 (and (= index!646 intermediateAfterIndex!19) (= lt!649297 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488733 () Bool)

(declare-fun res!1011924 () Bool)

(assert (=> b!1488733 (=> (not res!1011924) (not e!834612))))

(assert (=> b!1488733 (= res!1011924 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488734 () Bool)

(assert (=> b!1488734 (= e!834611 e!834613)))

(declare-fun res!1011914 () Bool)

(assert (=> b!1488734 (=> (not res!1011914) (not e!834613))))

(assert (=> b!1488734 (= res!1011914 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!649295))))

(assert (=> b!1488734 (= lt!649295 (Intermediate!12246 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488735 () Bool)

(declare-fun res!1011918 () Bool)

(assert (=> b!1488735 (=> (not res!1011918) (not e!834608))))

(assert (=> b!1488735 (= res!1011918 (= (seekEntryOrOpen!0 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) (Found!12246 j!93)))))

(declare-fun b!1488736 () Bool)

(declare-fun res!1011929 () Bool)

(assert (=> b!1488736 (=> (not res!1011929) (not e!834606))))

(assert (=> b!1488736 (= res!1011929 (validKeyInArray!0 (select (arr!48109 a!2862) i!1006)))))

(assert (= (and start!126942 res!1011932) b!1488723))

(assert (= (and b!1488723 res!1011922) b!1488736))

(assert (= (and b!1488736 res!1011929) b!1488724))

(assert (= (and b!1488724 res!1011927) b!1488717))

(assert (= (and b!1488717 res!1011926) b!1488716))

(assert (= (and b!1488716 res!1011915) b!1488731))

(assert (= (and b!1488731 res!1011920) b!1488721))

(assert (= (and b!1488721 res!1011919) b!1488734))

(assert (= (and b!1488734 res!1011914) b!1488728))

(assert (= (and b!1488728 res!1011916) b!1488726))

(assert (= (and b!1488726 res!1011930) b!1488725))

(assert (= (and b!1488725 c!137935) b!1488720))

(assert (= (and b!1488725 (not c!137935)) b!1488722))

(assert (= (and b!1488725 res!1011917) b!1488733))

(assert (= (and b!1488733 res!1011924) b!1488718))

(assert (= (and b!1488718 res!1011921) b!1488735))

(assert (= (and b!1488735 res!1011918) b!1488730))

(assert (= (and b!1488730 res!1011923) b!1488719))

(assert (= (and b!1488719 (not res!1011931)) b!1488732))

(assert (= (and b!1488732 res!1011928) b!1488729))

(assert (= (and b!1488718 (not res!1011925)) b!1488727))

(declare-fun m!1373479 () Bool)

(assert (=> b!1488717 m!1373479))

(declare-fun m!1373481 () Bool)

(assert (=> b!1488726 m!1373481))

(assert (=> b!1488726 m!1373481))

(declare-fun m!1373483 () Bool)

(assert (=> b!1488726 m!1373483))

(declare-fun m!1373485 () Bool)

(assert (=> b!1488726 m!1373485))

(declare-fun m!1373487 () Bool)

(assert (=> b!1488726 m!1373487))

(declare-fun m!1373489 () Bool)

(assert (=> b!1488722 m!1373489))

(declare-fun m!1373491 () Bool)

(assert (=> b!1488722 m!1373491))

(declare-fun m!1373493 () Bool)

(assert (=> b!1488718 m!1373493))

(assert (=> b!1488718 m!1373485))

(declare-fun m!1373495 () Bool)

(assert (=> b!1488718 m!1373495))

(declare-fun m!1373497 () Bool)

(assert (=> b!1488718 m!1373497))

(declare-fun m!1373499 () Bool)

(assert (=> b!1488718 m!1373499))

(declare-fun m!1373501 () Bool)

(assert (=> b!1488718 m!1373501))

(declare-fun m!1373503 () Bool)

(assert (=> start!126942 m!1373503))

(declare-fun m!1373505 () Bool)

(assert (=> start!126942 m!1373505))

(declare-fun m!1373507 () Bool)

(assert (=> b!1488727 m!1373507))

(declare-fun m!1373509 () Bool)

(assert (=> b!1488730 m!1373509))

(assert (=> b!1488730 m!1373501))

(assert (=> b!1488719 m!1373497))

(assert (=> b!1488719 m!1373501))

(assert (=> b!1488719 m!1373485))

(assert (=> b!1488719 m!1373495))

(assert (=> b!1488735 m!1373501))

(assert (=> b!1488735 m!1373501))

(declare-fun m!1373511 () Bool)

(assert (=> b!1488735 m!1373511))

(assert (=> b!1488734 m!1373501))

(assert (=> b!1488734 m!1373501))

(declare-fun m!1373513 () Bool)

(assert (=> b!1488734 m!1373513))

(assert (=> b!1488734 m!1373513))

(assert (=> b!1488734 m!1373501))

(declare-fun m!1373515 () Bool)

(assert (=> b!1488734 m!1373515))

(declare-fun m!1373517 () Bool)

(assert (=> b!1488736 m!1373517))

(assert (=> b!1488736 m!1373517))

(declare-fun m!1373519 () Bool)

(assert (=> b!1488736 m!1373519))

(assert (=> b!1488728 m!1373501))

(assert (=> b!1488728 m!1373501))

(declare-fun m!1373521 () Bool)

(assert (=> b!1488728 m!1373521))

(declare-fun m!1373523 () Bool)

(assert (=> b!1488720 m!1373523))

(declare-fun m!1373525 () Bool)

(assert (=> b!1488716 m!1373525))

(assert (=> b!1488729 m!1373491))

(assert (=> b!1488729 m!1373489))

(assert (=> b!1488721 m!1373485))

(declare-fun m!1373527 () Bool)

(assert (=> b!1488721 m!1373527))

(assert (=> b!1488724 m!1373501))

(assert (=> b!1488724 m!1373501))

(declare-fun m!1373529 () Bool)

(assert (=> b!1488724 m!1373529))

(check-sat (not b!1488720) (not b!1488716) (not b!1488727) (not b!1488718) (not b!1488726) (not b!1488729) (not b!1488722) (not start!126942) (not b!1488724) (not b!1488735) (not b!1488736) (not b!1488734) (not b!1488717) (not b!1488728))
(check-sat)
