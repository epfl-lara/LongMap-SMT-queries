; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124974 () Bool)

(assert start!124974)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98422 0))(
  ( (array!98423 (arr!47499 (Array (_ BitVec 32) (_ BitVec 64))) (size!48049 (_ BitVec 32))) )
))
(declare-fun lt!637072 () array!98422)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637070 () (_ BitVec 64))

(declare-fun e!817820 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1452874 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11751 0))(
  ( (MissingZero!11751 (index!49396 (_ BitVec 32))) (Found!11751 (index!49397 (_ BitVec 32))) (Intermediate!11751 (undefined!12563 Bool) (index!49398 (_ BitVec 32)) (x!131040 (_ BitVec 32))) (Undefined!11751) (MissingVacant!11751 (index!49399 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98422 (_ BitVec 32)) SeekEntryResult!11751)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98422 (_ BitVec 32)) SeekEntryResult!11751)

(assert (=> b!1452874 (= e!817820 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637070 lt!637072 mask!2687) (seekEntryOrOpen!0 lt!637070 lt!637072 mask!2687)))))

(declare-fun b!1452875 () Bool)

(declare-fun e!817816 () Bool)

(declare-fun e!817818 () Bool)

(assert (=> b!1452875 (= e!817816 e!817818)))

(declare-fun res!983956 () Bool)

(assert (=> b!1452875 (=> (not res!983956) (not e!817818))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98422)

(assert (=> b!1452875 (= res!983956 (= (select (store (arr!47499 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452875 (= lt!637072 (array!98423 (store (arr!47499 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48049 a!2862)))))

(declare-fun b!1452876 () Bool)

(declare-fun res!983949 () Bool)

(declare-fun e!817822 () Bool)

(assert (=> b!1452876 (=> (not res!983949) (not e!817822))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1452876 (= res!983949 (= (seekEntryOrOpen!0 (select (arr!47499 a!2862) j!93) a!2862 mask!2687) (Found!11751 j!93)))))

(declare-fun b!1452878 () Bool)

(declare-fun res!983955 () Bool)

(declare-fun e!817823 () Bool)

(assert (=> b!1452878 (=> (not res!983955) (not e!817823))))

(declare-fun lt!637073 () SeekEntryResult!11751)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98422 (_ BitVec 32)) SeekEntryResult!11751)

(assert (=> b!1452878 (= res!983955 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47499 a!2862) j!93) a!2862 mask!2687) lt!637073))))

(declare-fun b!1452879 () Bool)

(declare-fun e!817817 () Bool)

(declare-fun e!817819 () Bool)

(assert (=> b!1452879 (= e!817817 (not e!817819))))

(declare-fun res!983942 () Bool)

(assert (=> b!1452879 (=> res!983942 e!817819)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452879 (= res!983942 (or (and (= (select (arr!47499 a!2862) index!646) (select (store (arr!47499 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47499 a!2862) index!646) (select (arr!47499 a!2862) j!93))) (= (select (arr!47499 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (=> b!1452879 e!817822))

(declare-fun res!983941 () Bool)

(assert (=> b!1452879 (=> (not res!983941) (not e!817822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98422 (_ BitVec 32)) Bool)

(assert (=> b!1452879 (= res!983941 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48998 0))(
  ( (Unit!48999) )
))
(declare-fun lt!637074 () Unit!48998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48998)

(assert (=> b!1452879 (= lt!637074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452880 () Bool)

(declare-fun res!983953 () Bool)

(assert (=> b!1452880 (=> (not res!983953) (not e!817816))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452880 (= res!983953 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48049 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48049 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48049 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452881 () Bool)

(declare-fun res!983948 () Bool)

(assert (=> b!1452881 (=> (not res!983948) (not e!817817))))

(assert (=> b!1452881 (= res!983948 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!637071 () SeekEntryResult!11751)

(declare-fun b!1452882 () Bool)

(assert (=> b!1452882 (= e!817820 (= lt!637071 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637070 lt!637072 mask!2687)))))

(declare-fun b!1452883 () Bool)

(assert (=> b!1452883 (= e!817823 e!817817)))

(declare-fun res!983947 () Bool)

(assert (=> b!1452883 (=> (not res!983947) (not e!817817))))

(assert (=> b!1452883 (= res!983947 (= lt!637071 (Intermediate!11751 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452883 (= lt!637071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637070 mask!2687) lt!637070 lt!637072 mask!2687))))

(assert (=> b!1452883 (= lt!637070 (select (store (arr!47499 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452884 () Bool)

(declare-fun res!983945 () Bool)

(assert (=> b!1452884 (=> (not res!983945) (not e!817816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452884 (= res!983945 (validKeyInArray!0 (select (arr!47499 a!2862) i!1006)))))

(declare-fun b!1452885 () Bool)

(assert (=> b!1452885 (= e!817819 (validKeyInArray!0 lt!637070))))

(declare-fun b!1452886 () Bool)

(assert (=> b!1452886 (= e!817822 (and (or (= (select (arr!47499 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47499 a!2862) intermediateBeforeIndex!19) (select (arr!47499 a!2862) j!93))) (or (and (= (select (arr!47499 a!2862) index!646) (select (store (arr!47499 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47499 a!2862) index!646) (select (arr!47499 a!2862) j!93))) (= (select (arr!47499 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47499 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452887 () Bool)

(declare-fun res!983954 () Bool)

(assert (=> b!1452887 (=> (not res!983954) (not e!817816))))

(declare-datatypes ((List!34000 0))(
  ( (Nil!33997) (Cons!33996 (h!35346 (_ BitVec 64)) (t!48694 List!34000)) )
))
(declare-fun arrayNoDuplicates!0 (array!98422 (_ BitVec 32) List!34000) Bool)

(assert (=> b!1452887 (= res!983954 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33997))))

(declare-fun b!1452888 () Bool)

(declare-fun res!983952 () Bool)

(assert (=> b!1452888 (=> (not res!983952) (not e!817816))))

(assert (=> b!1452888 (= res!983952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452889 () Bool)

(declare-fun res!983946 () Bool)

(assert (=> b!1452889 (=> (not res!983946) (not e!817817))))

(assert (=> b!1452889 (= res!983946 e!817820)))

(declare-fun c!133977 () Bool)

(assert (=> b!1452889 (= c!133977 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!983950 () Bool)

(assert (=> start!124974 (=> (not res!983950) (not e!817816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124974 (= res!983950 (validMask!0 mask!2687))))

(assert (=> start!124974 e!817816))

(assert (=> start!124974 true))

(declare-fun array_inv!36527 (array!98422) Bool)

(assert (=> start!124974 (array_inv!36527 a!2862)))

(declare-fun b!1452877 () Bool)

(declare-fun res!983944 () Bool)

(assert (=> b!1452877 (=> (not res!983944) (not e!817816))))

(assert (=> b!1452877 (= res!983944 (validKeyInArray!0 (select (arr!47499 a!2862) j!93)))))

(declare-fun b!1452890 () Bool)

(declare-fun res!983951 () Bool)

(assert (=> b!1452890 (=> (not res!983951) (not e!817816))))

(assert (=> b!1452890 (= res!983951 (and (= (size!48049 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48049 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48049 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452891 () Bool)

(assert (=> b!1452891 (= e!817818 e!817823)))

(declare-fun res!983943 () Bool)

(assert (=> b!1452891 (=> (not res!983943) (not e!817823))))

(assert (=> b!1452891 (= res!983943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47499 a!2862) j!93) mask!2687) (select (arr!47499 a!2862) j!93) a!2862 mask!2687) lt!637073))))

(assert (=> b!1452891 (= lt!637073 (Intermediate!11751 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124974 res!983950) b!1452890))

(assert (= (and b!1452890 res!983951) b!1452884))

(assert (= (and b!1452884 res!983945) b!1452877))

(assert (= (and b!1452877 res!983944) b!1452888))

(assert (= (and b!1452888 res!983952) b!1452887))

(assert (= (and b!1452887 res!983954) b!1452880))

(assert (= (and b!1452880 res!983953) b!1452875))

(assert (= (and b!1452875 res!983956) b!1452891))

(assert (= (and b!1452891 res!983943) b!1452878))

(assert (= (and b!1452878 res!983955) b!1452883))

(assert (= (and b!1452883 res!983947) b!1452889))

(assert (= (and b!1452889 c!133977) b!1452882))

(assert (= (and b!1452889 (not c!133977)) b!1452874))

(assert (= (and b!1452889 res!983946) b!1452881))

(assert (= (and b!1452881 res!983948) b!1452879))

(assert (= (and b!1452879 res!983941) b!1452876))

(assert (= (and b!1452876 res!983949) b!1452886))

(assert (= (and b!1452879 (not res!983942)) b!1452885))

(declare-fun m!1341437 () Bool)

(assert (=> b!1452884 m!1341437))

(assert (=> b!1452884 m!1341437))

(declare-fun m!1341439 () Bool)

(assert (=> b!1452884 m!1341439))

(declare-fun m!1341441 () Bool)

(assert (=> b!1452891 m!1341441))

(assert (=> b!1452891 m!1341441))

(declare-fun m!1341443 () Bool)

(assert (=> b!1452891 m!1341443))

(assert (=> b!1452891 m!1341443))

(assert (=> b!1452891 m!1341441))

(declare-fun m!1341445 () Bool)

(assert (=> b!1452891 m!1341445))

(declare-fun m!1341447 () Bool)

(assert (=> b!1452875 m!1341447))

(declare-fun m!1341449 () Bool)

(assert (=> b!1452875 m!1341449))

(assert (=> b!1452886 m!1341447))

(declare-fun m!1341451 () Bool)

(assert (=> b!1452886 m!1341451))

(declare-fun m!1341453 () Bool)

(assert (=> b!1452886 m!1341453))

(declare-fun m!1341455 () Bool)

(assert (=> b!1452886 m!1341455))

(assert (=> b!1452886 m!1341441))

(declare-fun m!1341457 () Bool)

(assert (=> b!1452874 m!1341457))

(declare-fun m!1341459 () Bool)

(assert (=> b!1452874 m!1341459))

(declare-fun m!1341461 () Bool)

(assert (=> b!1452885 m!1341461))

(declare-fun m!1341463 () Bool)

(assert (=> b!1452879 m!1341463))

(assert (=> b!1452879 m!1341447))

(assert (=> b!1452879 m!1341453))

(assert (=> b!1452879 m!1341455))

(declare-fun m!1341465 () Bool)

(assert (=> b!1452879 m!1341465))

(assert (=> b!1452879 m!1341441))

(declare-fun m!1341467 () Bool)

(assert (=> b!1452888 m!1341467))

(assert (=> b!1452878 m!1341441))

(assert (=> b!1452878 m!1341441))

(declare-fun m!1341469 () Bool)

(assert (=> b!1452878 m!1341469))

(assert (=> b!1452877 m!1341441))

(assert (=> b!1452877 m!1341441))

(declare-fun m!1341471 () Bool)

(assert (=> b!1452877 m!1341471))

(declare-fun m!1341473 () Bool)

(assert (=> start!124974 m!1341473))

(declare-fun m!1341475 () Bool)

(assert (=> start!124974 m!1341475))

(declare-fun m!1341477 () Bool)

(assert (=> b!1452882 m!1341477))

(assert (=> b!1452876 m!1341441))

(assert (=> b!1452876 m!1341441))

(declare-fun m!1341479 () Bool)

(assert (=> b!1452876 m!1341479))

(declare-fun m!1341481 () Bool)

(assert (=> b!1452883 m!1341481))

(assert (=> b!1452883 m!1341481))

(declare-fun m!1341483 () Bool)

(assert (=> b!1452883 m!1341483))

(assert (=> b!1452883 m!1341447))

(declare-fun m!1341485 () Bool)

(assert (=> b!1452883 m!1341485))

(declare-fun m!1341487 () Bool)

(assert (=> b!1452887 m!1341487))

(check-sat (not b!1452877) (not b!1452885) (not b!1452882) (not b!1452891) (not b!1452874) (not b!1452879) (not b!1452884) (not b!1452888) (not start!124974) (not b!1452878) (not b!1452883) (not b!1452876) (not b!1452887))
(check-sat)
