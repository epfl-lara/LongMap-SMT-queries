; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124494 () Bool)

(assert start!124494)

(declare-fun b!1440527 () Bool)

(declare-fun e!812212 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97942 0))(
  ( (array!97943 (arr!47259 (Array (_ BitVec 32) (_ BitVec 64))) (size!47809 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97942)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440527 (= e!812212 (not (validKeyInArray!0 (select (store (arr!47259 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440528 () Bool)

(declare-fun e!812211 () Bool)

(assert (=> b!1440528 (= e!812211 e!812212)))

(declare-fun res!972959 () Bool)

(assert (=> b!1440528 (=> (not res!972959) (not e!812212))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11511 0))(
  ( (MissingZero!11511 (index!48436 (_ BitVec 32))) (Found!11511 (index!48437 (_ BitVec 32))) (Intermediate!11511 (undefined!12323 Bool) (index!48438 (_ BitVec 32)) (x!130160 (_ BitVec 32))) (Undefined!11511) (MissingVacant!11511 (index!48439 (_ BitVec 32))) )
))
(declare-fun lt!632982 () SeekEntryResult!11511)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97942 (_ BitVec 32)) SeekEntryResult!11511)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440528 (= res!972959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47259 a!2862) j!93) mask!2687) (select (arr!47259 a!2862) j!93) a!2862 mask!2687) lt!632982))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440528 (= lt!632982 (Intermediate!11511 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440529 () Bool)

(declare-fun res!972955 () Bool)

(assert (=> b!1440529 (=> (not res!972955) (not e!812211))))

(assert (=> b!1440529 (= res!972955 (validKeyInArray!0 (select (arr!47259 a!2862) j!93)))))

(declare-fun b!1440530 () Bool)

(declare-fun res!972963 () Bool)

(assert (=> b!1440530 (=> (not res!972963) (not e!812212))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440530 (= res!972963 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47259 a!2862) j!93) a!2862 mask!2687) lt!632982))))

(declare-fun b!1440531 () Bool)

(declare-fun res!972957 () Bool)

(assert (=> b!1440531 (=> (not res!972957) (not e!812211))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440531 (= res!972957 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47809 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47809 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47809 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47259 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440532 () Bool)

(declare-fun res!972954 () Bool)

(assert (=> b!1440532 (=> (not res!972954) (not e!812211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97942 (_ BitVec 32)) Bool)

(assert (=> b!1440532 (= res!972954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440533 () Bool)

(declare-fun res!972961 () Bool)

(assert (=> b!1440533 (=> (not res!972961) (not e!812211))))

(assert (=> b!1440533 (= res!972961 (and (= (size!47809 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47809 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47809 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440534 () Bool)

(declare-fun res!972960 () Bool)

(assert (=> b!1440534 (=> (not res!972960) (not e!812212))))

(assert (=> b!1440534 (= res!972960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47259 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47259 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97943 (store (arr!47259 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47809 a!2862)) mask!2687) (Intermediate!11511 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440535 () Bool)

(declare-fun res!972958 () Bool)

(assert (=> b!1440535 (=> (not res!972958) (not e!812211))))

(assert (=> b!1440535 (= res!972958 (validKeyInArray!0 (select (arr!47259 a!2862) i!1006)))))

(declare-fun b!1440536 () Bool)

(declare-fun res!972956 () Bool)

(assert (=> b!1440536 (=> (not res!972956) (not e!812211))))

(declare-datatypes ((List!33760 0))(
  ( (Nil!33757) (Cons!33756 (h!35106 (_ BitVec 64)) (t!48454 List!33760)) )
))
(declare-fun arrayNoDuplicates!0 (array!97942 (_ BitVec 32) List!33760) Bool)

(assert (=> b!1440536 (= res!972956 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33757))))

(declare-fun b!1440537 () Bool)

(declare-fun res!972964 () Bool)

(assert (=> b!1440537 (=> (not res!972964) (not e!812212))))

(assert (=> b!1440537 (= res!972964 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun res!972962 () Bool)

(assert (=> start!124494 (=> (not res!972962) (not e!812211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124494 (= res!972962 (validMask!0 mask!2687))))

(assert (=> start!124494 e!812211))

(assert (=> start!124494 true))

(declare-fun array_inv!36287 (array!97942) Bool)

(assert (=> start!124494 (array_inv!36287 a!2862)))

(assert (= (and start!124494 res!972962) b!1440533))

(assert (= (and b!1440533 res!972961) b!1440535))

(assert (= (and b!1440535 res!972958) b!1440529))

(assert (= (and b!1440529 res!972955) b!1440532))

(assert (= (and b!1440532 res!972954) b!1440536))

(assert (= (and b!1440536 res!972956) b!1440531))

(assert (= (and b!1440531 res!972957) b!1440528))

(assert (= (and b!1440528 res!972959) b!1440530))

(assert (= (and b!1440530 res!972963) b!1440534))

(assert (= (and b!1440534 res!972960) b!1440537))

(assert (= (and b!1440537 res!972964) b!1440527))

(declare-fun m!1329725 () Bool)

(assert (=> b!1440530 m!1329725))

(assert (=> b!1440530 m!1329725))

(declare-fun m!1329727 () Bool)

(assert (=> b!1440530 m!1329727))

(declare-fun m!1329729 () Bool)

(assert (=> b!1440527 m!1329729))

(declare-fun m!1329731 () Bool)

(assert (=> b!1440527 m!1329731))

(assert (=> b!1440527 m!1329731))

(declare-fun m!1329733 () Bool)

(assert (=> b!1440527 m!1329733))

(declare-fun m!1329735 () Bool)

(assert (=> start!124494 m!1329735))

(declare-fun m!1329737 () Bool)

(assert (=> start!124494 m!1329737))

(assert (=> b!1440529 m!1329725))

(assert (=> b!1440529 m!1329725))

(declare-fun m!1329739 () Bool)

(assert (=> b!1440529 m!1329739))

(declare-fun m!1329741 () Bool)

(assert (=> b!1440535 m!1329741))

(assert (=> b!1440535 m!1329741))

(declare-fun m!1329743 () Bool)

(assert (=> b!1440535 m!1329743))

(assert (=> b!1440531 m!1329729))

(declare-fun m!1329745 () Bool)

(assert (=> b!1440531 m!1329745))

(assert (=> b!1440534 m!1329729))

(assert (=> b!1440534 m!1329731))

(assert (=> b!1440534 m!1329731))

(declare-fun m!1329747 () Bool)

(assert (=> b!1440534 m!1329747))

(assert (=> b!1440534 m!1329747))

(assert (=> b!1440534 m!1329731))

(declare-fun m!1329749 () Bool)

(assert (=> b!1440534 m!1329749))

(assert (=> b!1440528 m!1329725))

(assert (=> b!1440528 m!1329725))

(declare-fun m!1329751 () Bool)

(assert (=> b!1440528 m!1329751))

(assert (=> b!1440528 m!1329751))

(assert (=> b!1440528 m!1329725))

(declare-fun m!1329753 () Bool)

(assert (=> b!1440528 m!1329753))

(declare-fun m!1329755 () Bool)

(assert (=> b!1440536 m!1329755))

(declare-fun m!1329757 () Bool)

(assert (=> b!1440532 m!1329757))

(check-sat (not b!1440532) (not start!124494) (not b!1440528) (not b!1440527) (not b!1440529) (not b!1440534) (not b!1440535) (not b!1440536) (not b!1440530))
(check-sat)
