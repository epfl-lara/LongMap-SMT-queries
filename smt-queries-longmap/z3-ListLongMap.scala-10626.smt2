; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124896 () Bool)

(assert start!124896)

(declare-fun b!1450823 () Bool)

(declare-fun e!816937 () Bool)

(declare-fun e!816939 () Bool)

(assert (=> b!1450823 (= e!816937 (not e!816939))))

(declare-fun res!982138 () Bool)

(assert (=> b!1450823 (=> res!982138 e!816939)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98344 0))(
  ( (array!98345 (arr!47460 (Array (_ BitVec 32) (_ BitVec 64))) (size!48010 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98344)

(assert (=> b!1450823 (= res!982138 (or (and (= (select (arr!47460 a!2862) index!646) (select (store (arr!47460 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47460 a!2862) index!646) (select (arr!47460 a!2862) j!93))) (not (= (select (arr!47460 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47460 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816936 () Bool)

(assert (=> b!1450823 e!816936))

(declare-fun res!982136 () Bool)

(assert (=> b!1450823 (=> (not res!982136) (not e!816936))))

(declare-datatypes ((SeekEntryResult!11712 0))(
  ( (MissingZero!11712 (index!49240 (_ BitVec 32))) (Found!11712 (index!49241 (_ BitVec 32))) (Intermediate!11712 (undefined!12524 Bool) (index!49242 (_ BitVec 32)) (x!130897 (_ BitVec 32))) (Undefined!11712) (MissingVacant!11712 (index!49243 (_ BitVec 32))) )
))
(declare-fun lt!636452 () SeekEntryResult!11712)

(declare-fun lt!636448 () SeekEntryResult!11712)

(assert (=> b!1450823 (= res!982136 (and (= lt!636452 lt!636448) (or (= (select (arr!47460 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47460 a!2862) intermediateBeforeIndex!19) (select (arr!47460 a!2862) j!93)))))))

(assert (=> b!1450823 (= lt!636448 (Found!11712 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98344 (_ BitVec 32)) SeekEntryResult!11712)

(assert (=> b!1450823 (= lt!636452 (seekEntryOrOpen!0 (select (arr!47460 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98344 (_ BitVec 32)) Bool)

(assert (=> b!1450823 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48920 0))(
  ( (Unit!48921) )
))
(declare-fun lt!636450 () Unit!48920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48920)

(assert (=> b!1450823 (= lt!636450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450824 () Bool)

(declare-fun e!816940 () Bool)

(assert (=> b!1450824 (= e!816936 e!816940)))

(declare-fun res!982141 () Bool)

(assert (=> b!1450824 (=> res!982141 e!816940)))

(assert (=> b!1450824 (= res!982141 (or (and (= (select (arr!47460 a!2862) index!646) (select (store (arr!47460 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47460 a!2862) index!646) (select (arr!47460 a!2862) j!93))) (not (= (select (arr!47460 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450825 () Bool)

(declare-fun res!982130 () Bool)

(declare-fun e!816943 () Bool)

(assert (=> b!1450825 (=> (not res!982130) (not e!816943))))

(declare-datatypes ((List!33961 0))(
  ( (Nil!33958) (Cons!33957 (h!35307 (_ BitVec 64)) (t!48655 List!33961)) )
))
(declare-fun arrayNoDuplicates!0 (array!98344 (_ BitVec 32) List!33961) Bool)

(assert (=> b!1450825 (= res!982130 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33958))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636446 () array!98344)

(declare-fun lt!636447 () (_ BitVec 64))

(declare-fun lt!636451 () SeekEntryResult!11712)

(declare-fun b!1450826 () Bool)

(declare-fun e!816938 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98344 (_ BitVec 32)) SeekEntryResult!11712)

(assert (=> b!1450826 (= e!816938 (= lt!636451 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636447 lt!636446 mask!2687)))))

(declare-fun b!1450827 () Bool)

(assert (=> b!1450827 (= e!816939 true)))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98344 (_ BitVec 32)) SeekEntryResult!11712)

(assert (=> b!1450827 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636447 lt!636446 mask!2687) lt!636448)))

(declare-fun lt!636449 () Unit!48920)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48920)

(assert (=> b!1450827 (= lt!636449 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450828 () Bool)

(declare-fun res!982128 () Bool)

(declare-fun e!816941 () Bool)

(assert (=> b!1450828 (=> (not res!982128) (not e!816941))))

(declare-fun lt!636453 () SeekEntryResult!11712)

(assert (=> b!1450828 (= res!982128 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47460 a!2862) j!93) a!2862 mask!2687) lt!636453))))

(declare-fun b!1450829 () Bool)

(declare-fun res!982131 () Bool)

(assert (=> b!1450829 (=> (not res!982131) (not e!816943))))

(assert (=> b!1450829 (= res!982131 (and (= (size!48010 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48010 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48010 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450830 () Bool)

(assert (=> b!1450830 (= e!816941 e!816937)))

(declare-fun res!982139 () Bool)

(assert (=> b!1450830 (=> (not res!982139) (not e!816937))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450830 (= res!982139 (= lt!636451 (Intermediate!11712 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450830 (= lt!636451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636447 mask!2687) lt!636447 lt!636446 mask!2687))))

(assert (=> b!1450830 (= lt!636447 (select (store (arr!47460 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450831 () Bool)

(declare-fun res!982127 () Bool)

(assert (=> b!1450831 (=> (not res!982127) (not e!816943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450831 (= res!982127 (validKeyInArray!0 (select (arr!47460 a!2862) i!1006)))))

(declare-fun b!1450832 () Bool)

(declare-fun e!816942 () Bool)

(assert (=> b!1450832 (= e!816942 e!816941)))

(declare-fun res!982126 () Bool)

(assert (=> b!1450832 (=> (not res!982126) (not e!816941))))

(assert (=> b!1450832 (= res!982126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47460 a!2862) j!93) mask!2687) (select (arr!47460 a!2862) j!93) a!2862 mask!2687) lt!636453))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450832 (= lt!636453 (Intermediate!11712 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!982134 () Bool)

(assert (=> start!124896 (=> (not res!982134) (not e!816943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124896 (= res!982134 (validMask!0 mask!2687))))

(assert (=> start!124896 e!816943))

(assert (=> start!124896 true))

(declare-fun array_inv!36488 (array!98344) Bool)

(assert (=> start!124896 (array_inv!36488 a!2862)))

(declare-fun b!1450833 () Bool)

(assert (=> b!1450833 (= e!816943 e!816942)))

(declare-fun res!982140 () Bool)

(assert (=> b!1450833 (=> (not res!982140) (not e!816942))))

(assert (=> b!1450833 (= res!982140 (= (select (store (arr!47460 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450833 (= lt!636446 (array!98345 (store (arr!47460 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48010 a!2862)))))

(declare-fun b!1450834 () Bool)

(declare-fun res!982132 () Bool)

(assert (=> b!1450834 (=> (not res!982132) (not e!816937))))

(assert (=> b!1450834 (= res!982132 e!816938)))

(declare-fun c!133860 () Bool)

(assert (=> b!1450834 (= c!133860 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!816944 () Bool)

(declare-fun b!1450835 () Bool)

(assert (=> b!1450835 (= e!816944 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450836 () Bool)

(declare-fun res!982129 () Bool)

(assert (=> b!1450836 (=> (not res!982129) (not e!816943))))

(assert (=> b!1450836 (= res!982129 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48010 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48010 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48010 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450837 () Bool)

(assert (=> b!1450837 (= e!816940 e!816944)))

(declare-fun res!982137 () Bool)

(assert (=> b!1450837 (=> (not res!982137) (not e!816944))))

(assert (=> b!1450837 (= res!982137 (= lt!636452 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47460 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450838 () Bool)

(declare-fun res!982135 () Bool)

(assert (=> b!1450838 (=> (not res!982135) (not e!816943))))

(assert (=> b!1450838 (= res!982135 (validKeyInArray!0 (select (arr!47460 a!2862) j!93)))))

(declare-fun b!1450839 () Bool)

(declare-fun res!982133 () Bool)

(assert (=> b!1450839 (=> res!982133 e!816939)))

(assert (=> b!1450839 (= res!982133 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47460 a!2862) j!93) a!2862 mask!2687) lt!636448)))))

(declare-fun b!1450840 () Bool)

(declare-fun res!982125 () Bool)

(assert (=> b!1450840 (=> (not res!982125) (not e!816937))))

(assert (=> b!1450840 (= res!982125 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450841 () Bool)

(declare-fun res!982124 () Bool)

(assert (=> b!1450841 (=> (not res!982124) (not e!816943))))

(assert (=> b!1450841 (= res!982124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450842 () Bool)

(assert (=> b!1450842 (= e!816938 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636447 lt!636446 mask!2687) (seekEntryOrOpen!0 lt!636447 lt!636446 mask!2687)))))

(assert (= (and start!124896 res!982134) b!1450829))

(assert (= (and b!1450829 res!982131) b!1450831))

(assert (= (and b!1450831 res!982127) b!1450838))

(assert (= (and b!1450838 res!982135) b!1450841))

(assert (= (and b!1450841 res!982124) b!1450825))

(assert (= (and b!1450825 res!982130) b!1450836))

(assert (= (and b!1450836 res!982129) b!1450833))

(assert (= (and b!1450833 res!982140) b!1450832))

(assert (= (and b!1450832 res!982126) b!1450828))

(assert (= (and b!1450828 res!982128) b!1450830))

(assert (= (and b!1450830 res!982139) b!1450834))

(assert (= (and b!1450834 c!133860) b!1450826))

(assert (= (and b!1450834 (not c!133860)) b!1450842))

(assert (= (and b!1450834 res!982132) b!1450840))

(assert (= (and b!1450840 res!982125) b!1450823))

(assert (= (and b!1450823 res!982136) b!1450824))

(assert (= (and b!1450824 (not res!982141)) b!1450837))

(assert (= (and b!1450837 res!982137) b!1450835))

(assert (= (and b!1450823 (not res!982138)) b!1450839))

(assert (= (and b!1450839 (not res!982133)) b!1450827))

(declare-fun m!1339443 () Bool)

(assert (=> b!1450825 m!1339443))

(declare-fun m!1339445 () Bool)

(assert (=> b!1450842 m!1339445))

(declare-fun m!1339447 () Bool)

(assert (=> b!1450842 m!1339447))

(declare-fun m!1339449 () Bool)

(assert (=> b!1450828 m!1339449))

(assert (=> b!1450828 m!1339449))

(declare-fun m!1339451 () Bool)

(assert (=> b!1450828 m!1339451))

(declare-fun m!1339453 () Bool)

(assert (=> b!1450831 m!1339453))

(assert (=> b!1450831 m!1339453))

(declare-fun m!1339455 () Bool)

(assert (=> b!1450831 m!1339455))

(declare-fun m!1339457 () Bool)

(assert (=> b!1450830 m!1339457))

(assert (=> b!1450830 m!1339457))

(declare-fun m!1339459 () Bool)

(assert (=> b!1450830 m!1339459))

(declare-fun m!1339461 () Bool)

(assert (=> b!1450830 m!1339461))

(declare-fun m!1339463 () Bool)

(assert (=> b!1450830 m!1339463))

(assert (=> b!1450833 m!1339461))

(declare-fun m!1339465 () Bool)

(assert (=> b!1450833 m!1339465))

(assert (=> b!1450837 m!1339449))

(assert (=> b!1450837 m!1339449))

(declare-fun m!1339467 () Bool)

(assert (=> b!1450837 m!1339467))

(declare-fun m!1339469 () Bool)

(assert (=> start!124896 m!1339469))

(declare-fun m!1339471 () Bool)

(assert (=> start!124896 m!1339471))

(assert (=> b!1450827 m!1339445))

(declare-fun m!1339473 () Bool)

(assert (=> b!1450827 m!1339473))

(assert (=> b!1450839 m!1339449))

(assert (=> b!1450839 m!1339449))

(declare-fun m!1339475 () Bool)

(assert (=> b!1450839 m!1339475))

(declare-fun m!1339477 () Bool)

(assert (=> b!1450823 m!1339477))

(assert (=> b!1450823 m!1339461))

(declare-fun m!1339479 () Bool)

(assert (=> b!1450823 m!1339479))

(declare-fun m!1339481 () Bool)

(assert (=> b!1450823 m!1339481))

(declare-fun m!1339483 () Bool)

(assert (=> b!1450823 m!1339483))

(assert (=> b!1450823 m!1339449))

(declare-fun m!1339485 () Bool)

(assert (=> b!1450823 m!1339485))

(declare-fun m!1339487 () Bool)

(assert (=> b!1450823 m!1339487))

(assert (=> b!1450823 m!1339449))

(assert (=> b!1450838 m!1339449))

(assert (=> b!1450838 m!1339449))

(declare-fun m!1339489 () Bool)

(assert (=> b!1450838 m!1339489))

(assert (=> b!1450824 m!1339483))

(assert (=> b!1450824 m!1339461))

(assert (=> b!1450824 m!1339481))

(assert (=> b!1450824 m!1339449))

(declare-fun m!1339491 () Bool)

(assert (=> b!1450841 m!1339491))

(declare-fun m!1339493 () Bool)

(assert (=> b!1450826 m!1339493))

(assert (=> b!1450832 m!1339449))

(assert (=> b!1450832 m!1339449))

(declare-fun m!1339495 () Bool)

(assert (=> b!1450832 m!1339495))

(assert (=> b!1450832 m!1339495))

(assert (=> b!1450832 m!1339449))

(declare-fun m!1339497 () Bool)

(assert (=> b!1450832 m!1339497))

(check-sat (not b!1450838) (not b!1450831) (not b!1450823) (not b!1450825) (not b!1450828) (not b!1450832) (not b!1450830) (not b!1450842) (not b!1450841) (not start!124896) (not b!1450839) (not b!1450837) (not b!1450827) (not b!1450826))
(check-sat)
