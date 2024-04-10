; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124928 () Bool)

(assert start!124928)

(declare-fun b!1451695 () Bool)

(declare-fun res!982903 () Bool)

(declare-fun e!817331 () Bool)

(assert (=> b!1451695 (=> (not res!982903) (not e!817331))))

(declare-datatypes ((array!98376 0))(
  ( (array!98377 (arr!47476 (Array (_ BitVec 32) (_ BitVec 64))) (size!48026 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98376)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11728 0))(
  ( (MissingZero!11728 (index!49304 (_ BitVec 32))) (Found!11728 (index!49305 (_ BitVec 32))) (Intermediate!11728 (undefined!12540 Bool) (index!49306 (_ BitVec 32)) (x!130953 (_ BitVec 32))) (Undefined!11728) (MissingVacant!11728 (index!49307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98376 (_ BitVec 32)) SeekEntryResult!11728)

(assert (=> b!1451695 (= res!982903 (= (seekEntryOrOpen!0 (select (arr!47476 a!2862) j!93) a!2862 mask!2687) (Found!11728 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1451697 () Bool)

(declare-fun lt!636729 () (_ BitVec 64))

(declare-fun lt!636728 () array!98376)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!817332 () Bool)

(declare-fun lt!636726 () SeekEntryResult!11728)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98376 (_ BitVec 32)) SeekEntryResult!11728)

(assert (=> b!1451697 (= e!817332 (= lt!636726 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636729 lt!636728 mask!2687)))))

(declare-fun b!1451698 () Bool)

(declare-fun e!817330 () Bool)

(declare-fun e!817333 () Bool)

(assert (=> b!1451698 (= e!817330 e!817333)))

(declare-fun res!982915 () Bool)

(assert (=> b!1451698 (=> (not res!982915) (not e!817333))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451698 (= res!982915 (= lt!636726 (Intermediate!11728 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451698 (= lt!636726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636729 mask!2687) lt!636729 lt!636728 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451698 (= lt!636729 (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451699 () Bool)

(declare-fun res!982904 () Bool)

(assert (=> b!1451699 (=> (not res!982904) (not e!817333))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451699 (= res!982904 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451700 () Bool)

(declare-fun res!982901 () Bool)

(assert (=> b!1451700 (=> (not res!982901) (not e!817333))))

(assert (=> b!1451700 (= res!982901 e!817332)))

(declare-fun c!133908 () Bool)

(assert (=> b!1451700 (= c!133908 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451701 () Bool)

(declare-fun res!982908 () Bool)

(declare-fun e!817334 () Bool)

(assert (=> b!1451701 (=> (not res!982908) (not e!817334))))

(assert (=> b!1451701 (= res!982908 (and (= (size!48026 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48026 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48026 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451702 () Bool)

(declare-fun res!982910 () Bool)

(assert (=> b!1451702 (=> (not res!982910) (not e!817334))))

(declare-datatypes ((List!33977 0))(
  ( (Nil!33974) (Cons!33973 (h!35323 (_ BitVec 64)) (t!48671 List!33977)) )
))
(declare-fun arrayNoDuplicates!0 (array!98376 (_ BitVec 32) List!33977) Bool)

(assert (=> b!1451702 (= res!982910 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33974))))

(declare-fun b!1451703 () Bool)

(declare-fun e!817329 () Bool)

(assert (=> b!1451703 (= e!817334 e!817329)))

(declare-fun res!982913 () Bool)

(assert (=> b!1451703 (=> (not res!982913) (not e!817329))))

(assert (=> b!1451703 (= res!982913 (= (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451703 (= lt!636728 (array!98377 (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48026 a!2862)))))

(declare-fun b!1451704 () Bool)

(declare-fun e!817328 () Bool)

(assert (=> b!1451704 (= e!817333 (not e!817328))))

(declare-fun res!982906 () Bool)

(assert (=> b!1451704 (=> res!982906 e!817328)))

(assert (=> b!1451704 (= res!982906 (or (and (= (select (arr!47476 a!2862) index!646) (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47476 a!2862) index!646) (select (arr!47476 a!2862) j!93))) (= (select (arr!47476 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1451704 e!817331))

(declare-fun res!982914 () Bool)

(assert (=> b!1451704 (=> (not res!982914) (not e!817331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98376 (_ BitVec 32)) Bool)

(assert (=> b!1451704 (= res!982914 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48952 0))(
  ( (Unit!48953) )
))
(declare-fun lt!636725 () Unit!48952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48952)

(assert (=> b!1451704 (= lt!636725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451705 () Bool)

(declare-fun res!982907 () Bool)

(assert (=> b!1451705 (=> (not res!982907) (not e!817330))))

(declare-fun lt!636727 () SeekEntryResult!11728)

(assert (=> b!1451705 (= res!982907 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47476 a!2862) j!93) a!2862 mask!2687) lt!636727))))

(declare-fun b!1451706 () Bool)

(declare-fun res!982911 () Bool)

(assert (=> b!1451706 (=> (not res!982911) (not e!817334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451706 (= res!982911 (validKeyInArray!0 (select (arr!47476 a!2862) j!93)))))

(declare-fun b!1451707 () Bool)

(declare-fun res!982905 () Bool)

(assert (=> b!1451707 (=> (not res!982905) (not e!817334))))

(assert (=> b!1451707 (= res!982905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451696 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451696 (= e!817331 (and (or (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) (select (arr!47476 a!2862) j!93))) (or (and (= (select (arr!47476 a!2862) index!646) (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47476 a!2862) index!646) (select (arr!47476 a!2862) j!93))) (= (select (arr!47476 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!982912 () Bool)

(assert (=> start!124928 (=> (not res!982912) (not e!817334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124928 (= res!982912 (validMask!0 mask!2687))))

(assert (=> start!124928 e!817334))

(assert (=> start!124928 true))

(declare-fun array_inv!36504 (array!98376) Bool)

(assert (=> start!124928 (array_inv!36504 a!2862)))

(declare-fun b!1451708 () Bool)

(declare-fun res!982900 () Bool)

(assert (=> b!1451708 (=> (not res!982900) (not e!817334))))

(assert (=> b!1451708 (= res!982900 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48026 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48026 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48026 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451709 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98376 (_ BitVec 32)) SeekEntryResult!11728)

(assert (=> b!1451709 (= e!817332 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636729 lt!636728 mask!2687) (seekEntryOrOpen!0 lt!636729 lt!636728 mask!2687)))))

(declare-fun b!1451710 () Bool)

(assert (=> b!1451710 (= e!817329 e!817330)))

(declare-fun res!982909 () Bool)

(assert (=> b!1451710 (=> (not res!982909) (not e!817330))))

(assert (=> b!1451710 (= res!982909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47476 a!2862) j!93) mask!2687) (select (arr!47476 a!2862) j!93) a!2862 mask!2687) lt!636727))))

(assert (=> b!1451710 (= lt!636727 (Intermediate!11728 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451711 () Bool)

(assert (=> b!1451711 (= e!817328 (validKeyInArray!0 lt!636729))))

(declare-fun b!1451712 () Bool)

(declare-fun res!982902 () Bool)

(assert (=> b!1451712 (=> (not res!982902) (not e!817334))))

(assert (=> b!1451712 (= res!982902 (validKeyInArray!0 (select (arr!47476 a!2862) i!1006)))))

(assert (= (and start!124928 res!982912) b!1451701))

(assert (= (and b!1451701 res!982908) b!1451712))

(assert (= (and b!1451712 res!982902) b!1451706))

(assert (= (and b!1451706 res!982911) b!1451707))

(assert (= (and b!1451707 res!982905) b!1451702))

(assert (= (and b!1451702 res!982910) b!1451708))

(assert (= (and b!1451708 res!982900) b!1451703))

(assert (= (and b!1451703 res!982913) b!1451710))

(assert (= (and b!1451710 res!982909) b!1451705))

(assert (= (and b!1451705 res!982907) b!1451698))

(assert (= (and b!1451698 res!982915) b!1451700))

(assert (= (and b!1451700 c!133908) b!1451697))

(assert (= (and b!1451700 (not c!133908)) b!1451709))

(assert (= (and b!1451700 res!982901) b!1451699))

(assert (= (and b!1451699 res!982904) b!1451704))

(assert (= (and b!1451704 res!982914) b!1451695))

(assert (= (and b!1451695 res!982903) b!1451696))

(assert (= (and b!1451704 (not res!982906)) b!1451711))

(declare-fun m!1340283 () Bool)

(assert (=> b!1451695 m!1340283))

(assert (=> b!1451695 m!1340283))

(declare-fun m!1340285 () Bool)

(assert (=> b!1451695 m!1340285))

(declare-fun m!1340287 () Bool)

(assert (=> b!1451711 m!1340287))

(declare-fun m!1340289 () Bool)

(assert (=> b!1451712 m!1340289))

(assert (=> b!1451712 m!1340289))

(declare-fun m!1340291 () Bool)

(assert (=> b!1451712 m!1340291))

(declare-fun m!1340293 () Bool)

(assert (=> b!1451696 m!1340293))

(declare-fun m!1340295 () Bool)

(assert (=> b!1451696 m!1340295))

(declare-fun m!1340297 () Bool)

(assert (=> b!1451696 m!1340297))

(declare-fun m!1340299 () Bool)

(assert (=> b!1451696 m!1340299))

(assert (=> b!1451696 m!1340283))

(assert (=> b!1451710 m!1340283))

(assert (=> b!1451710 m!1340283))

(declare-fun m!1340301 () Bool)

(assert (=> b!1451710 m!1340301))

(assert (=> b!1451710 m!1340301))

(assert (=> b!1451710 m!1340283))

(declare-fun m!1340303 () Bool)

(assert (=> b!1451710 m!1340303))

(assert (=> b!1451706 m!1340283))

(assert (=> b!1451706 m!1340283))

(declare-fun m!1340305 () Bool)

(assert (=> b!1451706 m!1340305))

(declare-fun m!1340307 () Bool)

(assert (=> b!1451707 m!1340307))

(assert (=> b!1451705 m!1340283))

(assert (=> b!1451705 m!1340283))

(declare-fun m!1340309 () Bool)

(assert (=> b!1451705 m!1340309))

(declare-fun m!1340311 () Bool)

(assert (=> b!1451702 m!1340311))

(declare-fun m!1340313 () Bool)

(assert (=> b!1451698 m!1340313))

(assert (=> b!1451698 m!1340313))

(declare-fun m!1340315 () Bool)

(assert (=> b!1451698 m!1340315))

(assert (=> b!1451698 m!1340293))

(declare-fun m!1340317 () Bool)

(assert (=> b!1451698 m!1340317))

(declare-fun m!1340319 () Bool)

(assert (=> b!1451709 m!1340319))

(declare-fun m!1340321 () Bool)

(assert (=> b!1451709 m!1340321))

(assert (=> b!1451703 m!1340293))

(declare-fun m!1340323 () Bool)

(assert (=> b!1451703 m!1340323))

(declare-fun m!1340325 () Bool)

(assert (=> b!1451704 m!1340325))

(assert (=> b!1451704 m!1340293))

(assert (=> b!1451704 m!1340297))

(assert (=> b!1451704 m!1340299))

(declare-fun m!1340327 () Bool)

(assert (=> b!1451704 m!1340327))

(assert (=> b!1451704 m!1340283))

(declare-fun m!1340329 () Bool)

(assert (=> start!124928 m!1340329))

(declare-fun m!1340331 () Bool)

(assert (=> start!124928 m!1340331))

(declare-fun m!1340333 () Bool)

(assert (=> b!1451697 m!1340333))

(push 1)

(assert (not start!124928))

